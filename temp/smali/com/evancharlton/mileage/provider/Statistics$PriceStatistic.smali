.class public Lcom/evancharlton/mileage/provider/Statistics$PriceStatistic;
.super Lcom/evancharlton/mileage/provider/Statistic;
.source "Statistics.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/evancharlton/mileage/provider/Statistics;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PriceStatistic"
.end annotation


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .param p1, "label"    # I

    .prologue
    .line 175
    invoke-direct {p0, p1}, Lcom/evancharlton/mileage/provider/Statistic;-><init>(I)V

    .line 176
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Ljava/lang/Class;I)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;
    .param p3, "label"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<+",
            "Lcom/evancharlton/mileage/ChartActivity;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 179
    .local p2, "chartClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/evancharlton/mileage/ChartActivity;>;"
    invoke-direct {p0, p1, p2, p3}, Lcom/evancharlton/mileage/provider/Statistic;-><init>(Ljava/lang/String;Ljava/lang/Class;I)V

    .line 180
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Ljava/lang/Class;ILcom/evancharlton/mileage/provider/Statistics$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/Class;
    .param p3, "x2"    # I
    .param p4, "x3"    # Lcom/evancharlton/mileage/provider/Statistics$1;

    .prologue
    .line 173
    invoke-direct {p0, p1, p2, p3}, Lcom/evancharlton/mileage/provider/Statistics$PriceStatistic;-><init>(Ljava/lang/String;Ljava/lang/Class;I)V

    return-void
.end method


# virtual methods
.method public format(Landroid/content/Context;Lcom/evancharlton/mileage/dao/Vehicle;D)Ljava/lang/String;
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "vehicle"    # Lcom/evancharlton/mileage/dao/Vehicle;
    .param p3, "value"    # D

    .prologue
    .line 184
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p2}, Lcom/evancharlton/mileage/math/Calculator;->getCurrencySymbol(Lcom/evancharlton/mileage/dao/Vehicle;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/evancharlton/mileage/provider/Statistics$PriceStatistic;->mFormatter:Ljava/text/DecimalFormat;

    invoke-virtual {v1, p3, p4}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method