Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 016BFDA9A2
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 12:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728134AbfJQKMc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 06:12:32 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:46235 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbfJQKMb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Oct 2019 06:12:31 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 0EC60C0017;
        Thu, 17 Oct 2019 10:12:25 +0000 (UTC)
Date:   Thu, 17 Oct 2019 12:12:25 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [RFC PATCH 09/13] mfd: rtc: support RTC on ROHM BD71828 with
 BD70528 driver
Message-ID: <20191017101225.GB3125@piout.net>
References: <cover.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
 <9ccc83f3dfd0fd0dc8178adf41b52115f960c45a.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ccc83f3dfd0fd0dc8178adf41b52115f960c45a.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

the subject should be rtc: bd70528 add BD71828 support

On 17/10/2019 12:52:21+0300, Matti Vaittinen wrote:
> ROHM BD71828 PMIC RTC block is from many parts similar to one
> on BD70528. Support BD71828 RTC using BD70528 RTC driver and
> avoid re-inventing the wheel.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  drivers/rtc/Kconfig              |   5 +-
>  drivers/rtc/rtc-bd70528.c        | 369 ++++++++++++++++++++++---------
>  include/linux/mfd/rohm-bd70528.h |  12 +-
>  include/linux/mfd/rohm-bd71828.h |   4 +-
>  include/linux/mfd/rohm-shared.h  |  22 ++
>  5 files changed, 299 insertions(+), 113 deletions(-)
>  create mode 100644 include/linux/mfd/rohm-shared.h
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index e72f65b61176..5c5b18a99bf9 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -498,11 +498,12 @@ config RTC_DRV_M41T80_WDT
>  	help
>  	  If you say Y here you will get support for the
>  	  watchdog timer in the ST M41T60 and M41T80 RTC chips series.
> +
>  config RTC_DRV_BD70528
> -	tristate "ROHM BD70528 PMIC RTC"
> +	tristate "ROHM BD70528 and BD71828 PMIC RTC"
>  	help
>  	  If you say Y here you will get support for the RTC
> -	  on ROHM BD70528 Power Management IC.
> +	  block on ROHM BD70528 and BD71828 Power Management IC.
>  
>  	  This driver can also be built as a module. If so, the module
>  	  will be called rtc-bd70528.
> diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
> index f9bdd555e1a2..2940b57002ac 100644
> --- a/drivers/rtc/rtc-bd70528.c
> +++ b/drivers/rtc/rtc-bd70528.c
> @@ -2,10 +2,11 @@
>  //
>  // Copyright (C) 2018 ROHM Semiconductors
>  //
> -// RTC driver for ROHM BD70528 PMIC
> +// RTC driver for ROHM BD70528 and BD71828 PMICs
>  
>  #include <linux/bcd.h>
>  #include <linux/mfd/rohm-bd70528.h>
> +#include <linux/mfd/rohm-bd71828.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> @@ -15,16 +16,16 @@
>  /*
>   * We read regs RTC_SEC => RTC_YEAR
>   * this struct is ordered according to chip registers.
> - * Keep it u8 only to avoid padding issues.
> + * Keep it u8 only (or packed) to avoid padding issues.
>   */
> -struct bd70528_rtc_day {
> +struct bd7xx28_rtc_day {

This is a useless and harmful rename.

>  	u8 sec;
>  	u8 min;
>  	u8 hour;
>  } __packed;
>  
> -struct bd70528_rtc_data {
> -	struct bd70528_rtc_day time;
> +struct bd7xx28_rtc_data {
> +	struct bd7xx28_rtc_day time;
>  	u8 week;
>  	u8 day;
>  	u8 month;
> @@ -32,19 +33,28 @@ struct bd70528_rtc_data {
>  } __packed;
>  
>  struct bd70528_rtc_wake {
> -	struct bd70528_rtc_day time;
> +	struct bd7xx28_rtc_day time;
>  	u8 ctrl;
>  } __packed;
>  
> +struct bd71828_rtc_alm {
> +	struct bd7xx28_rtc_data alm0;
> +	struct bd7xx28_rtc_data alm1;
> +	u8 alm_mask;
> +	u8 alm1_mask;
> +} __packed;
> +
>  struct bd70528_rtc_alm {
> -	struct bd70528_rtc_data data;
> +	struct bd7xx28_rtc_data data;
>  	u8 alm_mask;
>  	u8 alm_repeat;
>  } __packed;
>  
> -struct bd70528_rtc {
> +struct bd7xx28_rtc {
>  	struct rohm_regmap_dev *mfd;
>  	struct device *dev;
> +	u8 reg_time_start;
> +	bool has_rtc_timers;
>  };
>  
>  static int bd70528_set_wake(struct rohm_regmap_dev *bd70528,
> @@ -118,7 +128,7 @@ static int bd70528_set_elapsed_tmr(struct rohm_regmap_dev *bd70528,
>  			    ctrl_reg);
>  }
>  
> -static int bd70528_set_rtc_based_timers(struct bd70528_rtc *r, int new_state,
> +static int bd70528_set_rtc_based_timers(struct bd7xx28_rtc *r, int new_state,
>  					int *old_state)
>  {
>  	int ret;
> @@ -127,122 +137,162 @@ static int bd70528_set_rtc_based_timers(struct bd70528_rtc *r, int new_state,
>  			      old_state);
>  	if (ret) {
>  		dev_err(r->dev,
> -			"Failed to disable WDG for RTC setting (%d)\n", ret);
> +			"Failed to disable WDG for RTC setting (%d)\n",
> +			ret);

Unnecessary change

>  		return ret;
>  	}
> -	ret = bd70528_set_elapsed_tmr(r->mfd,
> -				      new_state & BD70528_ELAPSED_STATE_BIT,
> +	ret = bd70528_set_elapsed_tmr(r->mfd, new_state &
> +				      BD70528_ELAPSED_STATE_BIT,

Ditto

>  				      old_state);
>  	if (ret) {
>  		dev_err(r->dev,
>  			"Failed to disable 'elapsed timer' for RTC setting\n");
>  		return ret;
>  	}
> -	ret = bd70528_set_wake(r->mfd, new_state & BD70528_WAKE_STATE_BIT,
> -			       old_state);
> +
> +	ret = bd70528_set_wake(r->mfd, new_state &
> +			       BD70528_WAKE_STATE_BIT, old_state);

Ditto

>  	if (ret) {
>  		dev_err(r->dev,
> -			"Failed to disable 'wake timer' for RTC setting\n");
> +			"Failed to disable 'wake timer'\n");

Unrelated change

>  		return ret;
>  	}
>  
>  	return ret;
>  }
>  
> -static int bd70528_re_enable_rtc_based_timers(struct bd70528_rtc *r,
> +static int bd7xx28_re_enable_rtc_based_timers(struct bd7xx28_rtc *r,
>  					      int old_state)
>  {
> +	if (!r->has_rtc_timers)
> +		return 0;
> +
>  	return bd70528_set_rtc_based_timers(r, old_state, NULL);
>  }
>  
> -static int bd70528_disable_rtc_based_timers(struct bd70528_rtc *r,
> +static int bd7xx28_disable_rtc_based_timers(struct bd7xx28_rtc *r,
>  					    int *old_state)
>  {
> +	if (!r->has_rtc_timers)
> +		return 0;
> +
>  	return bd70528_set_rtc_based_timers(r, 0, old_state);
>  }
>  
> -static inline void tmday2rtc(struct rtc_time *t, struct bd70528_rtc_day *d)
> +static inline void tmday2rtc(struct rtc_time *t, struct bd7xx28_rtc_day *d)
>  {
> -	d->sec &= ~BD70528_MASK_RTC_SEC;
> -	d->min &= ~BD70528_MASK_RTC_MINUTE;
> -	d->hour &= ~BD70528_MASK_RTC_HOUR;
> +	d->sec &= ~ROHM_BD1_MASK_RTC_SEC;
> +	d->min &= ~ROHM_BD1_MASK_RTC_MINUTE;
> +	d->hour &= ~ROHM_BD1_MASK_RTC_HOUR;
>  	d->sec |= bin2bcd(t->tm_sec);
>  	d->min |= bin2bcd(t->tm_min);
>  	d->hour |= bin2bcd(t->tm_hour);
>  }
>  
> -static inline void tm2rtc(struct rtc_time *t, struct bd70528_rtc_data *r)
> +static inline void tm2rtc(struct rtc_time *t, struct bd7xx28_rtc_data *r)
>  {
> -	r->day &= ~BD70528_MASK_RTC_DAY;
> -	r->week &= ~BD70528_MASK_RTC_WEEK;
> -	r->month &= ~BD70528_MASK_RTC_MONTH;
> +	r->day &= ~ROHM_BD1_MASK_RTC_DAY;
> +	r->week &= ~ROHM_BD1_MASK_RTC_WEEK;
> +	r->month &= ~ROHM_BD1_MASK_RTC_MONTH;
>  	/*
>  	 * PM and 24H bits are not used by Wake - thus we clear them
>  	 * here and not in tmday2rtc() which is also used by wake.
>  	 */
> -	r->time.hour &= ~(BD70528_MASK_RTC_HOUR_PM | BD70528_MASK_RTC_HOUR_24H);
> +	r->time.hour &= ~(ROHM_BD1_MASK_RTC_HOUR_PM |
> +			  ROHM_BD1_MASK_RTC_HOUR_24H);
>  
>  	tmday2rtc(t, &r->time);
>  	/*
>  	 * We do always set time in 24H mode.
>  	 */
> -	r->time.hour |= BD70528_MASK_RTC_HOUR_24H;
> +	r->time.hour |= ROHM_BD1_MASK_RTC_HOUR_24H;
>  	r->day |= bin2bcd(t->tm_mday);
>  	r->week |= bin2bcd(t->tm_wday);
>  	r->month |= bin2bcd(t->tm_mon + 1);
>  	r->year = bin2bcd(t->tm_year - 100);
> +
>  }
>  
> -static inline void rtc2tm(struct bd70528_rtc_data *r, struct rtc_time *t)
> +static inline void rtc2tm(struct bd7xx28_rtc_data *r, struct rtc_time *t)
>  {
> -	t->tm_sec = bcd2bin(r->time.sec & BD70528_MASK_RTC_SEC);
> -	t->tm_min = bcd2bin(r->time.min & BD70528_MASK_RTC_MINUTE);
> -	t->tm_hour = bcd2bin(r->time.hour & BD70528_MASK_RTC_HOUR);
> +	t->tm_sec = bcd2bin(r->time.sec & ROHM_BD1_MASK_RTC_SEC);
> +	t->tm_min = bcd2bin(r->time.min & ROHM_BD1_MASK_RTC_MINUTE);
> +	t->tm_hour = bcd2bin(r->time.hour & ROHM_BD1_MASK_RTC_HOUR);
>  	/*
> -	 * If RTC is in 12H mode, then bit BD70528_MASK_RTC_HOUR_PM
> +	 * If RTC is in 12H mode, then bit ROHM_BD1_MASK_RTC_HOUR_PM
>  	 * is not BCD value but tells whether it is AM or PM
>  	 */
> -	if (!(r->time.hour & BD70528_MASK_RTC_HOUR_24H)) {
> +	if (!(r->time.hour & ROHM_BD1_MASK_RTC_HOUR_24H)) {
>  		t->tm_hour %= 12;
> -		if (r->time.hour & BD70528_MASK_RTC_HOUR_PM)
> +		if (r->time.hour & ROHM_BD1_MASK_RTC_HOUR_PM)
>  			t->tm_hour += 12;
>  	}
> -	t->tm_mday = bcd2bin(r->day & BD70528_MASK_RTC_DAY);
> -	t->tm_mon = bcd2bin(r->month & BD70528_MASK_RTC_MONTH) - 1;
> -	t->tm_year = 100 + bcd2bin(r->year & BD70528_MASK_RTC_YEAR);
> -	t->tm_wday = bcd2bin(r->week & BD70528_MASK_RTC_WEEK);
> +	t->tm_mday = bcd2bin(r->day & ROHM_BD1_MASK_RTC_DAY);
> +	t->tm_mon = bcd2bin(r->month & ROHM_BD1_MASK_RTC_MONTH) - 1;
> +	t->tm_year = 100 + bcd2bin(r->year & ROHM_BD1_MASK_RTC_YEAR);
> +	t->tm_wday = bcd2bin(r->week & ROHM_BD1_MASK_RTC_WEEK);
>  }
>  
> -static int bd70528_set_alarm(struct device *dev, struct rtc_wkalrm *a)
> +static int bd71828_set_alarm(struct bd7xx28_rtc *r, struct rtc_wkalrm *a)
> +{
> +	int ret;
> +	struct bd71828_rtc_alm alm;
> +	struct rohm_regmap_dev *bd71828 = r->mfd;
> +
> +	ret = regmap_bulk_read(bd71828->regmap, BD71828_REG_RTC_ALM_START,
> +			       &alm, sizeof(alm));
> +	if (ret) {
> +		dev_err(r->dev, "Failed to read alarm regs\n");
> +		return ret;
> +	}
> +
> +	tm2rtc(&a->time, &alm.alm0);
> +
> +	if (!a->enabled)
> +		alm.alm_mask &= ~ROHM_BD1_MASK_ALM_EN;
> +	else
> +		alm.alm_mask |= ROHM_BD1_MASK_ALM_EN;
> +
> +	pr_debug("%s: new ALM0 EN bits are 0x%x\n", __func__, alm.alm_mask);
> +
> +	ret = regmap_bulk_write(bd71828->regmap, BD71828_REG_RTC_ALM_START,
> +				&alm, sizeof(alm));
> +	if (ret)
> +		dev_err(r->dev, "Failed to set alarm time\n");
> +
> +	return ret;
> +
> +}
> +static int bd70528_set_alarm(struct bd7xx28_rtc *r, struct rtc_wkalrm *a)
>  {
>  	struct bd70528_rtc_wake wake;
>  	struct bd70528_rtc_alm alm;
>  	int ret;
> -	struct bd70528_rtc *r = dev_get_drvdata(dev);
>  	struct rohm_regmap_dev *bd70528 = r->mfd;
>  
> -	ret = regmap_bulk_read(bd70528->regmap, BD70528_REG_RTC_WAKE_START,
> +	ret = regmap_bulk_read(bd70528->regmap,
> +			       BD70528_REG_RTC_WAKE_START,
>  			       &wake, sizeof(wake));
>  	if (ret) {
> -		dev_err(dev, "Failed to read wake regs\n");
> +		dev_err(r->dev, "Failed to read wake regs\n");
>  		return ret;
>  	}
> +	tmday2rtc(&a->time, &wake.time);
>  
>  	ret = regmap_bulk_read(bd70528->regmap, BD70528_REG_RTC_ALM_START,
>  			       &alm, sizeof(alm));
>  	if (ret) {
> -		dev_err(dev, "Failed to read alarm regs\n");
> +		dev_err(r->dev, "Failed to read alarm regs\n");
>  		return ret;
>  	}
>  
>  	tm2rtc(&a->time, &alm.data);
> -	tmday2rtc(&a->time, &wake.time);
>  
>  	if (a->enabled) {
> -		alm.alm_mask &= ~BD70528_MASK_ALM_EN;
> +		alm.alm_mask &= ~ROHM_BD1_MASK_ALM_EN;
>  		wake.ctrl |= BD70528_MASK_WAKE_EN;
>  	} else {
> -		alm.alm_mask |= BD70528_MASK_ALM_EN;
> +		alm.alm_mask |= ROHM_BD1_MASK_ALM_EN;
>  		wake.ctrl &= ~BD70528_MASK_WAKE_EN;
>  	}
>  
> @@ -250,28 +300,69 @@ static int bd70528_set_alarm(struct device *dev, struct rtc_wkalrm *a)
>  				BD70528_REG_RTC_WAKE_START, &wake,
>  				sizeof(wake));
>  	if (ret) {
> -		dev_err(dev, "Failed to set wake time\n");
> +		dev_err(r->dev, "Failed to set wake time\n");
>  		return ret;
>  	}
>  	ret = regmap_bulk_write(bd70528->regmap, BD70528_REG_RTC_ALM_START,
>  				&alm, sizeof(alm));
>  	if (ret)
> -		dev_err(dev, "Failed to set alarm time\n");
> +		dev_err(r->dev, "Failed to set alarm time\n");
>  
>  	return ret;
>  }
> +static int bd7xx28_set_alarm(struct device *dev, struct rtc_wkalrm *a)
> +{
> +	struct bd7xx28_rtc *r = dev_get_drvdata(dev);
> +	struct rohm_regmap_dev *bd_dev = r->mfd;
> +
> +	switch (bd_dev->chip_type) {
> +	case ROHM_CHIP_TYPE_BD70528:
> +		return bd70528_set_alarm(r, a);
> +	case ROHM_CHIP_TYPE_BD71828:
> +		return bd71828_set_alarm(r, a);
> +	default:
> +		dev_err(dev, "Unknown RTC chip\n");
> +		break;
> +	}
> +
> +	return -ENOENT;
> +}
>  
> -static int bd70528_read_alarm(struct device *dev, struct rtc_wkalrm *a)
> +static int bd71828_read_alarm(struct bd7xx28_rtc *r, struct rtc_wkalrm *a)
> +{
> +	int ret;
> +	struct bd71828_rtc_alm alm;
> +	struct rohm_regmap_dev *bd71828 = r->mfd;
> +
> +	ret = regmap_bulk_read(bd71828->regmap, BD71828_REG_RTC_ALM_START,
> +			       &alm, sizeof(alm));
> +	if (ret) {
> +		dev_err(r->dev, "Failed to read alarm regs\n");
> +		return ret;
> +	}
> +
> +	rtc2tm(&alm.alm0, &a->time);
> +	a->time.tm_mday = -1;
> +	a->time.tm_mon = -1;
> +	a->time.tm_year = -1;
> +	a->enabled = !!(alm.alm_mask & ROHM_BD1_MASK_ALM_EN);
> +	a->pending = 0;
> +	pr_debug("%s: ALM0 EN bits are 0x%x, returniong enabled %d\n", __func__,
> +		alm.alm_mask, a->enabled);
> +
> +	return 0;
> +}
> +
> +static int bd70528_read_alarm(struct bd7xx28_rtc *r, struct rtc_wkalrm *a)
>  {
> -	struct bd70528_rtc_alm alm;
>  	int ret;
> -	struct bd70528_rtc *r = dev_get_drvdata(dev);
> +	struct bd70528_rtc_alm alm;
>  	struct rohm_regmap_dev *bd70528 = r->mfd;
>  
>  	ret = regmap_bulk_read(bd70528->regmap, BD70528_REG_RTC_ALM_START,
>  			       &alm, sizeof(alm));
>  	if (ret) {
> -		dev_err(dev, "Failed to read alarm regs\n");
> +		dev_err(r->dev, "Failed to read alarm regs\n");
>  		return ret;
>  	}
>  
> @@ -279,25 +370,42 @@ static int bd70528_read_alarm(struct device *dev, struct rtc_wkalrm *a)
>  	a->time.tm_mday = -1;
>  	a->time.tm_mon = -1;
>  	a->time.tm_year = -1;
> -	a->enabled = !(alm.alm_mask & BD70528_MASK_ALM_EN);
> +	a->enabled = !(alm.alm_mask & ROHM_BD1_MASK_ALM_EN);
>  	a->pending = 0;
>  
>  	return 0;
>  }
>  
> -static int bd70528_set_time_locked(struct device *dev, struct rtc_time *t)
> +static int bd7xx28_read_alarm(struct device *dev, struct rtc_wkalrm *a)
> +{
> +	struct bd7xx28_rtc *r = dev_get_drvdata(dev);
> +	struct rohm_regmap_dev *bd_dev = r->mfd;
> +
> +	switch (bd_dev->chip_type) {
> +	case ROHM_CHIP_TYPE_BD70528:
> +		return bd70528_read_alarm(r, a);
> +	case ROHM_CHIP_TYPE_BD71828:
> +		return bd71828_read_alarm(r, a);

You can avoid all of that by having multiple rtc_class_ops structs.

> +	default:
> +		dev_err(dev, "Unknown RTC chip\n");
> +		break;
> +	}
> +	return -ENOENT;
> +}
> +
> +static int bd7xx28_set_time_locked(struct device *dev, struct rtc_time *t)
>  {
>  	int ret, tmpret, old_states;
> -	struct bd70528_rtc_data rtc_data;
> -	struct bd70528_rtc *r = dev_get_drvdata(dev);
> -	struct rohm_regmap_dev *bd70528 = r->mfd;
> +	struct bd7xx28_rtc_data rtc_data;
> +	struct bd7xx28_rtc *r = dev_get_drvdata(dev);
> +	struct rohm_regmap_dev *bd7xx28 = r->mfd;
>  
> -	ret = bd70528_disable_rtc_based_timers(r, &old_states);
> +	ret = bd7xx28_disable_rtc_based_timers(r, &old_states);
>  	if (ret)
>  		return ret;
>  
> -	tmpret = regmap_bulk_read(bd70528->regmap,
> -				  BD70528_REG_RTC_START, &rtc_data,
> +	tmpret = regmap_bulk_read(bd7xx28->regmap,
> +				  r->reg_time_start, &rtc_data,
>  				  sizeof(rtc_data));
>  	if (tmpret) {
>  		dev_err(dev, "Failed to read RTC time registers\n");
> @@ -305,8 +413,8 @@ static int bd70528_set_time_locked(struct device *dev, struct rtc_time *t)
>  	}
>  	tm2rtc(t, &rtc_data);
>  
> -	tmpret = regmap_bulk_write(bd70528->regmap,
> -				   BD70528_REG_RTC_START, &rtc_data,
> +	tmpret = regmap_bulk_write(bd7xx28->regmap,
> +				   r->reg_time_start, &rtc_data,
>  				   sizeof(rtc_data));
>  	if (tmpret) {
>  		dev_err(dev, "Failed to set RTC time\n");
> @@ -314,34 +422,37 @@ static int bd70528_set_time_locked(struct device *dev, struct rtc_time *t)
>  	}
>  
>  renable_out:
> -	ret = bd70528_re_enable_rtc_based_timers(r, old_states);
> +	ret = bd7xx28_re_enable_rtc_based_timers(r, old_states);
>  	if (tmpret)
>  		ret = tmpret;
>  
>  	return ret;
>  }
>  
> -static int bd70528_set_time(struct device *dev, struct rtc_time *t)
> +static int bd7xx28_set_time(struct device *dev, struct rtc_time *t)
>  {
>  	int ret;
> -	struct bd70528_rtc *r = dev_get_drvdata(dev);
> +	struct bd7xx28_rtc *r = dev_get_drvdata(dev);
>  
> +	pr_debug("%s called\n", __func__);
>  	bd70528_wdt_lock(r->mfd);
> -	ret = bd70528_set_time_locked(dev, t);
> +	ret = bd7xx28_set_time_locked(dev, t);
>  	bd70528_wdt_unlock(r->mfd);
>  	return ret;
>  }
>  
> -static int bd70528_get_time(struct device *dev, struct rtc_time *t)
> +static int bd7xx28_get_time(struct device *dev, struct rtc_time *t)
>  {
> -	struct bd70528_rtc *r = dev_get_drvdata(dev);
> -	struct rohm_regmap_dev *bd70528 = r->mfd;
> -	struct bd70528_rtc_data rtc_data;
> +	struct bd7xx28_rtc *r = dev_get_drvdata(dev);
> +	struct rohm_regmap_dev *bd7xx28 = r->mfd;
> +	struct bd7xx28_rtc_data rtc_data;
>  	int ret;
>  
> +	pr_debug("%s called\n", __func__);
> +
>  	/* read the RTC date and time registers all at once */
> -	ret = regmap_bulk_read(bd70528->regmap,
> -			       BD70528_REG_RTC_START, &rtc_data,
> +	ret = regmap_bulk_read(bd7xx28->regmap,
> +			       r->reg_time_start, &rtc_data,
>  			       sizeof(rtc_data));
>  	if (ret) {
>  		dev_err(dev, "Failed to read RTC time (err %d)\n", ret);
> @@ -353,55 +464,94 @@ static int bd70528_get_time(struct device *dev, struct rtc_time *t)
>  	return 0;
>  }
>  
> -static int bd70528_alm_enable(struct device *dev, unsigned int enabled)
> +static int bd70528_alm_enable(struct bd7xx28_rtc *r, unsigned int enabled)
>  {
>  	int ret;
> -	unsigned int enableval = BD70528_MASK_ALM_EN;
> -	struct bd70528_rtc *r = dev_get_drvdata(dev);
> +	unsigned int enableval = ROHM_BD1_MASK_ALM_EN;
>  
>  	if (enabled)
>  		enableval = 0;
>  
>  	bd70528_wdt_lock(r->mfd);
> -	ret = bd70528_set_wake(r->mfd, enabled, NULL);
> +	ret = bd70528_set_wake(r->mfd, !enableval, NULL);
>  	if (ret) {
> -		dev_err(dev, "Failed to change wake state\n");
> +		dev_err(r->dev, "Failed to change wake state\n");
>  		goto out_unlock;
>  	}
>  	ret = regmap_update_bits(r->mfd->regmap, BD70528_REG_RTC_ALM_MASK,
> -				 BD70528_MASK_ALM_EN, enableval);
> +				 ROHM_BD1_MASK_ALM_EN, enableval);
>  	if (ret)
> -		dev_err(dev, "Failed to change alarm state\n");
> +		dev_err(r->dev, "Failed to change alarm state\n");
>  
>  out_unlock:
>  	bd70528_wdt_unlock(r->mfd);
>  	return ret;
>  }
>  
> -static const struct rtc_class_ops bd70528_rtc_ops = {
> -	.read_time		= bd70528_get_time,
> -	.set_time		= bd70528_set_time,
> -	.read_alarm		= bd70528_read_alarm,
> -	.set_alarm		= bd70528_set_alarm,
> -	.alarm_irq_enable	= bd70528_alm_enable,
> +static int bd71828_alm_enable(struct bd7xx28_rtc *r, unsigned int enabled)
> +{
> +	int ret;
> +	unsigned int enableval = ROHM_BD1_MASK_ALM_EN;
> +
> +	if (!enabled)
> +		enableval = 0;
> +
> +	pr_debug("%s called (enabled=0x%x)\n", __func__, enabled);
> +	ret = regmap_update_bits(r->mfd->regmap, BD71828_REG_RTC_ALM0_MASK,
> +				 ROHM_BD1_MASK_ALM_EN, enableval);
> +	if (ret)
> +		dev_err(r->dev, "Failed to change alarm state\n");
> +
> +	pr_debug("%s: Wrote alm mask reg addr 0x%x val 0x%x\n",
> +		__func__, BD71828_REG_RTC_ALM0_MASK, enableval);
> +
> +	return ret;
> +}
> +
> +static int bd7xx28_alm_enable(struct device *dev, unsigned int enabled)
> +{
> +	struct bd7xx28_rtc *r = dev_get_drvdata(dev);
> +
> +	switch (r->mfd->chip_type) {
> +	case ROHM_CHIP_TYPE_BD70528:
> +		return bd70528_alm_enable(r, enabled);
> +	case ROHM_CHIP_TYPE_BD71828:
> +		return bd71828_alm_enable(r, enabled);
> +	default:
> +		dev_err(dev, "Unknown RTC chip\n");
> +	}
> +
> +	return -ENOENT;
> +}
> +
> +static const struct rtc_class_ops bd7xx28_rtc_ops = {
> +	.read_time		= bd7xx28_get_time,
> +	.set_time		= bd7xx28_set_time,
> +	.read_alarm		= bd7xx28_read_alarm,
> +	.set_alarm		= bd7xx28_set_alarm,
> +	.alarm_irq_enable	= bd7xx28_alm_enable,
>  };
>  
>  static irqreturn_t alm_hndlr(int irq, void *data)
>  {
>  	struct rtc_device *rtc = data;
>  
> +	pr_debug("bd71828 RTC IRQ fired\n");
>  	rtc_update_irq(rtc, 1, RTC_IRQF | RTC_AF | RTC_PF);
>  	return IRQ_HANDLED;
>  }
>  
> -static int bd70528_probe(struct platform_device *pdev)
> +static int bd7xx28_probe(struct platform_device *pdev)
>  {
> -	struct bd70528_rtc *bd_rtc;
> +	struct bd7xx28_rtc *bd_rtc;
>  	struct rohm_regmap_dev *mfd;
> +	const char *irq_name;
>  	int ret;
>  	struct rtc_device *rtc;
>  	int irq;
>  	unsigned int hr;
> +	bool enable_main_irq = false;
> +	u8 hour_reg;
>  
>  	mfd = dev_get_drvdata(pdev->dev.parent);
>  	if (!mfd) {
> @@ -415,7 +565,25 @@ static int bd70528_probe(struct platform_device *pdev)
>  	bd_rtc->mfd = mfd;
>  	bd_rtc->dev = &pdev->dev;
>  
> -	irq = platform_get_irq_byname(pdev, "bd70528-rtc-alm");
> +	switch (mfd->chip_type) {
> +	case ROHM_CHIP_TYPE_BD70528:
> +		irq_name = "bd70528-rtc-alm";
> +		bd_rtc->has_rtc_timers = true;
> +		bd_rtc->reg_time_start = BD70528_REG_RTC_START;
> +		hour_reg = BD70528_REG_RTC_HOUR;
> +		enable_main_irq = true;
> +		break;
> +	case ROHM_CHIP_TYPE_BD71828:
> +		irq_name = "bd71828-rtc-alm-0";
> +		bd_rtc->reg_time_start = BD71828_REG_RTC_START;
> +		hour_reg = BD71828_REG_RTC_HOUR;
> +		break;
> +	default:
> +		dev_err(&pdev->dev, "Unknown chip\n");
> +		return -ENOENT;
> +	}
> +
> +	irq = platform_get_irq_byname(pdev, irq_name);
>  
>  	if (irq < 0) {
>  		dev_err(&pdev->dev, "Failed to get irq\n");
> @@ -424,20 +592,20 @@ static int bd70528_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, bd_rtc);
>  
> -	ret = regmap_read(mfd->regmap, BD70528_REG_RTC_HOUR, &hr);
> +	ret = regmap_read(mfd->regmap, hour_reg, &hr);
>  
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to reag RTC clock\n");
>  		return ret;
>  	}
>  
> -	if (!(hr & BD70528_MASK_RTC_HOUR_24H)) {
> +	if (!(hr & ROHM_BD1_MASK_RTC_HOUR_24H)) {
>  		struct rtc_time t;
>  
> -		ret = bd70528_get_time(&pdev->dev, &t);
> +		ret = bd7xx28_get_time(&pdev->dev, &t);
>  
>  		if (!ret)
> -			ret = bd70528_set_time(&pdev->dev, &t);
> +			ret = bd7xx28_set_time(&pdev->dev, &t);
>  
>  		if (ret) {
>  			dev_err(&pdev->dev,
> @@ -457,7 +625,7 @@ static int bd70528_probe(struct platform_device *pdev)
>  
>  	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
>  	rtc->range_max = RTC_TIMESTAMP_END_2099;
> -	rtc->ops = &bd70528_rtc_ops;
> +	rtc->ops = &bd7xx28_rtc_ops;
>  
>  	/* Request alarm IRQ prior to registerig the RTC */
>  	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, &alm_hndlr,
> @@ -471,12 +639,15 @@ static int bd70528_probe(struct platform_device *pdev)
>  	 *  leave them enabled as irq-controller should disable irqs
>  	 *  from sub-registers when IRQ is disabled or freed.
>  	 */
> -	ret = regmap_update_bits(mfd->regmap,
> +	if (enable_main_irq) {
> +		ret = regmap_update_bits(mfd->regmap,
>  				 BD70528_REG_INT_MAIN_MASK,
>  				 BD70528_INT_RTC_MASK, 0);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Failed to enable RTC interrupts\n");
> -		return ret;
> +		if (ret) {
> +			dev_err(&pdev->dev,
> +				"Failed to enable RTC interrupts\n");
> +			return ret;
> +		}
>  	}
>  
>  	ret = rtc_register_device(rtc);
> @@ -490,11 +661,11 @@ static struct platform_driver bd70528_rtc = {
>  	.driver = {
>  		.name = "bd70528-rtc"
>  	},
> -	.probe = bd70528_probe,
> +	.probe = bd7xx28_probe,
>  };
>  
>  module_platform_driver(bd70528_rtc);
>  
>  MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
> -MODULE_DESCRIPTION("BD70528 RTC driver");
> +MODULE_DESCRIPTION("ROHM BD70528 and BD71828 PMIC RTC driver");
>  MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/rohm-bd70528.h b/include/linux/mfd/rohm-bd70528.h
> index 1013e60c5b25..8d8c0e0b2df6 100644
> --- a/include/linux/mfd/rohm-bd70528.h
> +++ b/include/linux/mfd/rohm-bd70528.h
> @@ -8,6 +8,7 @@
>  #include <linux/device.h>
>  #include <linux/mfd/rohm-generic.h>
>  #include <linux/regmap.h>
> +#include <linux/mfd/rohm-shared.h>
>  
>  enum {
>  	BD70528_BUCK1,
> @@ -313,16 +314,6 @@ enum {
>  
>  /* RTC masks to mask out reserved bits */
>  
> -#define BD70528_MASK_RTC_SEC		0x7f
> -#define BD70528_MASK_RTC_MINUTE		0x7f
> -#define BD70528_MASK_RTC_HOUR_24H	0x80
> -#define BD70528_MASK_RTC_HOUR_PM	0x20
> -#define BD70528_MASK_RTC_HOUR		0x1f
> -#define BD70528_MASK_RTC_DAY		0x3f
> -#define BD70528_MASK_RTC_WEEK		0x07
> -#define BD70528_MASK_RTC_MONTH		0x1f
> -#define BD70528_MASK_RTC_YEAR		0xff
> -#define BD70528_MASK_RTC_COUNT_L	0x7f
>  
>  #define BD70528_MASK_ELAPSED_TIMER_EN	0x1
>  /* Mask second, min and hour fields
> @@ -332,7 +323,6 @@ enum {
>   * wake-up we limit ALM to 24H and only
>   * unmask sec, min and hour
>   */
> -#define BD70528_MASK_ALM_EN		0x7
>  #define BD70528_MASK_WAKE_EN		0x1
>  
>  /* WDT masks */
> diff --git a/include/linux/mfd/rohm-bd71828.h b/include/linux/mfd/rohm-bd71828.h
> index bbbd4f118550..bd9dfd53759d 100644
> --- a/include/linux/mfd/rohm-bd71828.h
> +++ b/include/linux/mfd/rohm-bd71828.h
> @@ -5,6 +5,7 @@
>  #define __LINUX_MFD_BD71828_H__
>  
>  #include <linux/mfd/rohm-generic.h>
> +#include <linux/mfd/rohm-shared.h>
>  
>  /* Regulator IDs */
>  enum {
> @@ -160,6 +161,7 @@ enum {
>  #define BD71828_REG_RTC_YEAR		0x52
>  
>  #define BD71828_REG_RTC_ALM0_SEC	0x53
> +#define BD71828_REG_RTC_ALM_START	BD71828_REG_RTC_ALM0_SEC
>  #define BD71828_REG_RTC_ALM0_MINUTE	0x54
>  #define BD71828_REG_RTC_ALM0_HOUR	0x55
>  #define BD71828_REG_RTC_ALM0_WEEK	0x56
> @@ -178,6 +180,7 @@ enum {
>  #define BD71828_REG_RTC_ALM1_MASK	0x62
>  
>  #define BD71828_REG_RTC_ALM2		0x63
> +#define BD71828_REG_RTC_START		BD71828_REG_RTC_SEC
>  
>  /* Charger/Battey */
>  #define BD71828_REG_CHG_STATE		0x65
> @@ -207,7 +210,6 @@ enum {
>  #define BD71828_REG_INT_MASK_TEMP	0xdd
>  #define BD71828_REG_INT_MASK_RTC	0xde
>  
> -
>  #define BD71828_REG_INT_MAIN		0xdf
>  #define BD71828_REG_INT_BUCK		0xe0
>  #define BD71828_REG_INT_DCIN1		0xe1
> diff --git a/include/linux/mfd/rohm-shared.h b/include/linux/mfd/rohm-shared.h
> new file mode 100644
> index 000000000000..5f61fa81d6a2
> --- /dev/null
> +++ b/include/linux/mfd/rohm-shared.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/* Copyright (C) 2018 ROHM Semiconductors */
> +
> +
> +/*
> + * RTC definitions shared between
> + *
> + * BD70528
> + * and BD71828
> + */
> +
> +#define ROHM_BD1_MASK_RTC_SEC		0x7f
> +#define ROHM_BD1_MASK_RTC_MINUTE	0x7f
> +#define ROHM_BD1_MASK_RTC_HOUR_24H	0x80
> +#define ROHM_BD1_MASK_RTC_HOUR_PM	0x20
> +#define ROHM_BD1_MASK_RTC_HOUR		0x3f
> +#define ROHM_BD1_MASK_RTC_DAY		0x3f
> +#define ROHM_BD1_MASK_RTC_WEEK		0x07
> +#define ROHM_BD1_MASK_RTC_MONTH		0x1f
> +#define ROHM_BD1_MASK_RTC_YEAR		0xff
> +#define ROHM_BD1_MASK_ALM_EN		0x7
> +

All that renaming is distracting and useless. Please resubmit without
renaming defines, structs and functions to make it easier to review.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
