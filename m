Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6791407EC
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2020 11:28:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbgAQK2p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jan 2020 05:28:45 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37889 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726587AbgAQK2p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jan 2020 05:28:45 -0500
Received: by mail-wr1-f68.google.com with SMTP id y17so22171858wrh.5
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jan 2020 02:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=HM8k535bB4Zqi0GfEwiVkH65Q1Hx/nKHz6GT9gtlJK8=;
        b=tCMW61FmdGXdIuVJCSqzhkwiTfYOiBEraLBbZak05Sydy8wmfz0edGWG5HrRIsuJLG
         XThNvBabfIFmMR1OhH9jUJ9a0fcI5ii9eWn6NkqJZRwdHAJ3+zYROsw4UuYiIJWdnmXD
         G1w6KXRhriSabWcDZiOnERZQQRRcebgZ6MUzd4euNcxa2i81NB6ftT3PyJ4H6EF6F7EM
         3hMaklaXVx2Vjb8mhoE8oTea1xrJL7bAOUnYD2pTShBwNKq1q6OyTiOo+X/982WAKlqe
         mB689VYvqjIUZpOwAG3fGg2ss4aqyI3S4KO6NDGqNK3PqDbctNcqrdhGIDHnjitMPoTb
         bbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=HM8k535bB4Zqi0GfEwiVkH65Q1Hx/nKHz6GT9gtlJK8=;
        b=fhFIZ+PIZsVcZt6kqtxfXr9KCsEXfPtCRBwz2vfdNgo1h5xEBh7MXTHlsKu6WLMVit
         OMZApTKZYXjgenohf5m4IQWIFIavLOOHHuMTdIlkoBG/28ixvy/7Y/Ewm130ndkwFpzI
         KGwO2VCVwIMNIA5jVzM6u7dZSEqvnqgBA6v6aqZVBjOCrcfgk9UrB36ZTVcrnJfmSWYA
         rX3ejOTRr/4Ne9qtPoI2DlgOruudeRieYALL3EARhRqUITUUSlhvFpzkV/zC27AZOFgK
         si5+HIzex/slUq0s8/a9zgSrOc+tN1WKWX3dIgleT6fmjN1zEwgxeIUYraEhE3Vw+gCQ
         ubnw==
X-Gm-Message-State: APjAAAU85TFmkiTV2VOlgn14x7izGu/+KEPZS8GjD0rcI8mU/BsyLtGf
        9+L0t7x+lEdyc801L8J0ar1PBQ==
X-Google-Smtp-Source: APXvYqwDd77HblT/audWRHo3+KrxugU1EyNDv8T/9d4EkPqm8mp6uRaVfV41S/do8ghBL1uvF/IRNQ==
X-Received: by 2002:a5d:67c7:: with SMTP id n7mr2234575wrw.319.1579256923293;
        Fri, 17 Jan 2020 02:28:43 -0800 (PST)
Received: from dell ([2.27.35.221])
        by smtp.gmail.com with ESMTPSA id l7sm33815710wrq.61.2020.01.17.02.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 02:28:42 -0800 (PST)
Date:   Fri, 17 Jan 2020 10:28:54 +0000
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
Subject: Re: [PATCH v10 08/13] regulator: bd718x7: Split driver to common and
 bd718x7 specific parts
Message-ID: <20200117102854.GF15507@dell>
References: <cover.1579249511.git.matti.vaittinen@fi.rohmeurope.com>
 <def409ab024717e6cd917c488e62fe04ad66bd52.1579249511.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <def409ab024717e6cd917c488e62fe04ad66bd52.1579249511.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 17 Jan 2020, Matti Vaittinen wrote:

> Few ROHM PMICs allow setting the voltage states for different system states
> like RUN, IDLE, SUSPEND and LPSR. States are then changed via SoC specific
> mechanisms. bd718x7 driver implemented device-tree parsing functions for
> these state specific voltages. The parsing functions can be re-used by
> other ROHM chip drivers like bd71828. Split the generic functions from
> bd718x7-regulator.c to rohm-regulator.c and export them for other modules
> to use.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> ---
> no changes since v9
> 
>  drivers/regulator/Kconfig             |   4 +
>  drivers/regulator/Makefile            |   1 +
>  drivers/regulator/bd718x7-regulator.c | 183 ++++++++------------------
>  drivers/regulator/rohm-regulator.c    |  95 +++++++++++++
>  include/linux/mfd/rohm-generic.h      |  66 ++++++++++
>  5 files changed, 221 insertions(+), 128 deletions(-)
>  create mode 100644 drivers/regulator/rohm-regulator.c

[...]

> diff --git a/include/linux/mfd/rohm-generic.h b/include/linux/mfd/rohm-generic.h
> index ff3dd7578fd3..6cc5a0819959 100644
> --- a/include/linux/mfd/rohm-generic.h
> +++ b/include/linux/mfd/rohm-generic.h
> @@ -4,6 +4,9 @@
>  #ifndef __LINUX_MFD_ROHM_H__
>  #define __LINUX_MFD_ROHM_H__
>  
> +#include <linux/regmap.h>
> +#include <linux/regulator/driver.h>
> +
>  enum rohm_chip_type {
>  	ROHM_CHIP_TYPE_BD71837 = 0,
>  	ROHM_CHIP_TYPE_BD71847,
> @@ -17,4 +20,67 @@ struct rohm_regmap_dev {
>  	struct regmap *regmap;
>  };
>  
> +enum {
> +	ROHM_DVS_LEVEL_UNKNOWN,
> +	ROHM_DVS_LEVEL_RUN,
> +	ROHM_DVS_LEVEL_IDLE,
> +	ROHM_DVS_LEVEL_SUSPEND,
> +	ROHM_DVS_LEVEL_LPSR,
> +#define ROHM_DVS_LEVEL_MAX ROHM_DVS_LEVEL_LPSR

Haven't seen this before.  Is it legit?

What about:

     ROHM_DVS_LEVEL_MAX = ROHM_DVS_LEVEL_LPSR

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
