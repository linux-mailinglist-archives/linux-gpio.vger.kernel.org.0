Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD2DF1326D3
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 13:57:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727814AbgAGM5m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 07:57:42 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43906 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727858AbgAGM5l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 07:57:41 -0500
Received: by mail-wr1-f66.google.com with SMTP id d16so53800860wre.10
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 04:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=93QCy+6lfoPu6T2jeY2YuuqgksbRKDw7v2F+iiG2Jic=;
        b=FyRzPZicMMxp+pAWuWqWtAdTwZ3vMQndL9HoJsAxXaC8Lui7wOPJsm0geFbfSDw6Dd
         nrwfovxHI2u0lUEJ4C2RPqAfw31p0iI2xgo7ZzLfgOy5BYd9eo5LPjQ79nKmMn7uXpji
         yWh0Qk1MIyP/EkWv1WHtqJrguSIy8bXZFWFL952IlOzXB095CADywjTfy7mVkmAFOXmP
         n7n/QLfzytJQbbEyIFCceszQFyaNeJdQNyOoHKHwmieOTUvhyHgbxgncBq21oWX0Iq2n
         tNujW6zoah5QZurnwEcCLBSJw9Tot2YZXDBpxsHvcBJ8DAk9hvV3t50r2/cmCEzOizS7
         /1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=93QCy+6lfoPu6T2jeY2YuuqgksbRKDw7v2F+iiG2Jic=;
        b=aEXyL1BciYeq3FB0dD8Cs6R8E1lmW2Lo/xExVlw5qH036llQVhud6mBUs8GwBDo0Iv
         PEr5HEewZMALDEPk1Ozix13wB9EqP78BV79qp6i2cGB6Lf/RTblRgJZ3FJwWhKjEuA4Y
         4TgDdNseWM3/ncS1BNoMYoTDFbj+ZiI4G8wNFbvPXozVgfwcOU6vhlSiASrd6cYaHewk
         oCxl1MUcjNzC42KiwEVOGycbBtbVC87Y+Mtw0wE2M4m7ZtcX1/dlZxjBLfh1lATNaLvJ
         aj9X7HgYabr9DImfeVx/BhiqZaVLJSQtdBPUNHauyVpUNftHK8lUP9Bue50tZn8Qjlh1
         1WjQ==
X-Gm-Message-State: APjAAAUoOYNRnp2q3XO1KL8wCbrzp177CdUKJSuVxO1eXa1f8yVGgqkS
        3qiSYGS2rISqdvmk/wPbKm+rtQ==
X-Google-Smtp-Source: APXvYqwOseVEoEwqvKt/WKPStKBJ1FZIuG8u48y75PfT52y/SVxc8BBiYwOqw0EIng9E63iyfPitLw==
X-Received: by 2002:adf:f80c:: with SMTP id s12mr108243229wrp.1.1578401858462;
        Tue, 07 Jan 2020 04:57:38 -0800 (PST)
Received: from dell ([2.27.35.135])
        by smtp.gmail.com with ESMTPSA id m10sm77330092wrx.19.2020.01.07.04.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 04:57:37 -0800 (PST)
Date:   Tue, 7 Jan 2020 12:57:51 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v8 09/12] rtc: bd70528: add BD71828 support
Message-ID: <20200107125751.GJ14821@dell>
References: <cover.1577694311.git.matti.vaittinen@fi.rohmeurope.com>
 <b904fd485b61d3f3af3c100855f5100940916abf.1577694311.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b904fd485b61d3f3af3c100855f5100940916abf.1577694311.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 30 Dec 2019, Matti Vaittinen wrote:

> ROHM BD71828 PMIC RTC block is from many parts similar to one
> on BD70528. Support BD71828 RTC using BD70528 RTC driver and
> avoid re-inventing the wheel.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
> 
> Changes from v7 - no changes
> 
>  drivers/rtc/Kconfig              |   3 +-
>  drivers/rtc/rtc-bd70528.c        | 168 ++++++++++++++++++++++++++++---
>  include/linux/mfd/rohm-bd70528.h |  13 +--
>  include/linux/mfd/rohm-bd71828.h |   4 +-
>  include/linux/mfd/rohm-shared.h  |  27 +++++
>  5 files changed, 186 insertions(+), 29 deletions(-)
>  create mode 100644 include/linux/mfd/rohm-shared.h
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index d77515d8382c..df7a3843069d 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -498,12 +498,13 @@ config RTC_DRV_M41T80_WDT
>  	help
>  	  If you say Y here you will get support for the
>  	  watchdog timer in the ST M41T60 and M41T80 RTC chips series.
> +
>  config RTC_DRV_BD70528
>  	tristate "ROHM BD70528 PMIC RTC"
>  	depends on MFD_ROHM_BD70528 && (BD70528_WATCHDOG || !BD70528_WATCHDOG)
>  	help
>  	  If you say Y here you will get support for the RTC
> -	  on ROHM BD70528 Power Management IC.
> +	  block on ROHM BD70528 and BD71828 Power Management IC.
>  
>  	  This driver can also be built as a module. If so, the module
>  	  will be called rtc-bd70528.
> diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
> index 627037aa66a8..2ce202040556 100644
> --- a/drivers/rtc/rtc-bd70528.c
> +++ b/drivers/rtc/rtc-bd70528.c
> @@ -6,6 +6,7 @@
>  
>  #include <linux/bcd.h>
>  #include <linux/mfd/rohm-bd70528.h>
> +#include <linux/mfd/rohm-bd71828.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> @@ -15,7 +16,7 @@
>  /*
>   * We read regs RTC_SEC => RTC_YEAR
>   * this struct is ordered according to chip registers.
> - * Keep it u8 only to avoid padding issues.
> + * Keep it u8 only (or packed) to avoid padding issues.
>   */
>  struct bd70528_rtc_day {
>  	u8 sec;
> @@ -36,6 +37,13 @@ struct bd70528_rtc_wake {
>  	u8 ctrl;
>  } __packed;
>  
> +struct bd71828_rtc_alm {
> +	struct bd70528_rtc_data alm0;
> +	struct bd70528_rtc_data alm1;
> +	u8 alm_mask;
> +	u8 alm1_mask;
> +} __packed;
> +
>  struct bd70528_rtc_alm {
>  	struct bd70528_rtc_data data;
>  	u8 alm_mask;
> @@ -45,6 +53,8 @@ struct bd70528_rtc_alm {
>  struct bd70528_rtc {
>  	struct rohm_regmap_dev *mfd;

I think it would be better if you fixed this up be more forthcoming.
It took some grepping to find out what this actually meant.  An MFD
isn't really a thing, we made it up.  Here you are referring to this
platform device's parent's device data.

With that in mind I offer some suggestions:

  'struct rohm_parent_ddata pddata'
  'struct rohm_parent_ddata parent'

>  	struct device *dev;
> +	u8 reg_time_start;
> +	bool has_rtc_timers;
>  };

[...]

> +static int bd71828_set_alarm(struct device *dev, struct rtc_wkalrm *a)
> +{
> +	int ret;
> +	struct bd71828_rtc_alm alm;
> +	struct bd70528_rtc *r = dev_get_drvdata(dev);
> +	struct rohm_regmap_dev *bd71828 = r->mfd;

Then ...

	struct rohm_parent_ddata *parent = r->parent;

	ret = regmap_bulk_read(parent->regmap, BD71828_REG_RTC_ALM_START,
			       &alm, sizeof(alm));
	if (ret) {
		dev_err(dev, "Failed to read alarm regs\n");
		return ret;
	}

[...]

> diff --git a/include/linux/mfd/rohm-bd70528.h b/include/linux/mfd/rohm-bd70528.h
> index 2ad2320d0a96..a57af878fd0c 100644
> --- a/include/linux/mfd/rohm-bd70528.h
> +++ b/include/linux/mfd/rohm-bd70528.h
> @@ -7,6 +7,7 @@
>  #include <linux/bits.h>
>  #include <linux/device.h>
>  #include <linux/mfd/rohm-generic.h>
> +#include <linux/mfd/rohm-shared.h>
>  #include <linux/regmap.h>
>  
>  enum {
> @@ -307,17 +308,6 @@ enum {
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
> -
>  #define BD70528_MASK_ELAPSED_TIMER_EN	0x1
>  /* Mask second, min and hour fields
>   * HW would support ALM irq for over 24h
> @@ -326,7 +316,6 @@ enum {
>   * wake-up we limit ALM to 24H and only
>   * unmask sec, min and hour
>   */
> -#define BD70528_MASK_ALM_EN		0x7
>  #define BD70528_MASK_WAKE_EN		0x1
>  
>  /* WDT masks */
> diff --git a/include/linux/mfd/rohm-bd71828.h b/include/linux/mfd/rohm-bd71828.h
> index d013e03f742d..017a4c01cb31 100644
> --- a/include/linux/mfd/rohm-bd71828.h
> +++ b/include/linux/mfd/rohm-bd71828.h
> @@ -5,6 +5,7 @@
>  #define __LINUX_MFD_BD71828_H__
>  
>  #include <linux/mfd/rohm-generic.h>
> +#include <linux/mfd/rohm-shared.h>

Isn't generic shared?

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
> @@ -204,7 +207,6 @@ enum {
>  #define BD71828_REG_INT_MASK_TEMP	0xdd
>  #define BD71828_REG_INT_MASK_RTC	0xde
>  
> -
>  #define BD71828_REG_INT_MAIN		0xdf
>  #define BD71828_REG_INT_BUCK		0xe0
>  #define BD71828_REG_INT_DCIN1		0xe1
> diff --git a/include/linux/mfd/rohm-shared.h b/include/linux/mfd/rohm-shared.h
> new file mode 100644
> index 000000000000..f16fc3b5000e
> --- /dev/null
> +++ b/include/linux/mfd/rohm-shared.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/* Copyright (C) 2018 ROHM Semiconductors */

This is very out of data now!

> +
> +#ifndef __LINUX_MFD_ROHM_SHARED_H__
> +#define __LINUX_MFD_ROHM_SHARED_H__
> +
> +/*
> + * RTC definitions shared between
> + *
> + * BD70528
> + * and BD71828

This reads poorly.

Either form a bullet pointed list, or just write it out.

> + */
> +
> +
> +#define BD70528_MASK_RTC_SEC		0x7f
> +#define BD70528_MASK_RTC_MINUTE	0x7f
> +#define BD70528_MASK_RTC_HOUR_24H	0x80
> +#define BD70528_MASK_RTC_HOUR_PM	0x20
> +#define BD70528_MASK_RTC_HOUR		0x3f
> +#define BD70528_MASK_RTC_DAY		0x3f
> +#define BD70528_MASK_RTC_WEEK		0x07
> +#define BD70528_MASK_RTC_MONTH		0x1f
> +#define BD70528_MASK_RTC_YEAR		0xff
> +#define BD70528_MASK_ALM_EN		0x7
> +
> +#endif /* __LINUX_MFD_ROHM_SHARED_H__ */

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
