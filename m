Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5BD513269C
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 13:41:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727664AbgAGMlO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 07:41:14 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36349 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727658AbgAGMlO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 07:41:14 -0500
Received: by mail-wr1-f68.google.com with SMTP id z3so53780943wru.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 04:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=W1LjRqVdC+lguBKzA6hEhdSKsqbzU0HC/EHXe2PyVFE=;
        b=Ix7q3VoWX7RQy4IAIFvZnnhHrgIlYKKRROKOYAnNZ7BmaaaAs6jHQ61Lxw6GWYosc9
         js3xOlPWY3Q5glXRYBlLsJy6HptsLcAlxLGYCX5GHoAzT1qratDLllAjeejrq4hB7AG3
         xclbiyCAqcpiX6ql5hcsvKpZlQMb+kpvEcQEDqtz16NHo0TYR68+ZeN/Mm2pPWK6czSU
         naCoCQZM/fCLwV2Ea7sZj7L9QcXiu2mYvkjJm3royTbxjzhTcA+uMJWvxw+zzgtrgGRD
         KUow505mmVSANNrmqo07vaWfAbesYmYiyYN247IZipCnnBntZBu8utEIBaWfQ+VB+Uj5
         q3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=W1LjRqVdC+lguBKzA6hEhdSKsqbzU0HC/EHXe2PyVFE=;
        b=h128VGLMAhafaZ1I5wtzcmrIGdYCl7wumiV/1/qzWm+XzlmnzIlQ79Wu3TxWNFeQjC
         0h4YXU2sT8zlfyfmkJTFoTlcVGsKrFLmNKH9z95Ar40ZveSlvFwmpq8v2ZtyCzfoNiaH
         flmBYbCojoF3z++0hH80mPFO6aR5ikUxFW1FZHcVdQ7eK/VFmrDZe/aGjrK0qQuCQFCI
         X6D04ZSyfR9ayrIDIhzcFEdMoT7G7K1vLmVnuE52CnhN3PfKMYQJbvrkTwh4h0YFyV2N
         bIE6UfG4NYCY9FtNzt+FEyXHNOCOzGBTU8YV9TcKOGL8eOl24h8qCkfR/rF8bhznWkgN
         fFFg==
X-Gm-Message-State: APjAAAWGA9nuW01PXMOqM5v9ivr+6IkE2JQVGKrp6ztcmLCOZJdHzaaw
        7Pum4s6BnLMy1QsiWSJsDJl5Kg==
X-Google-Smtp-Source: APXvYqzbZqg0vGgagk5eTcBKjSPx4R7BBZCx64xNuANabxrxXTmsIcFLkSO0bRPr4frccQzcW69BPg==
X-Received: by 2002:adf:ee45:: with SMTP id w5mr105522947wro.352.1578400871598;
        Tue, 07 Jan 2020 04:41:11 -0800 (PST)
Received: from dell ([2.27.35.135])
        by smtp.gmail.com with ESMTPSA id i16sm27397404wmb.36.2020.01.07.04.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 04:41:10 -0800 (PST)
Date:   Tue, 7 Jan 2020 12:41:24 +0000
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
Subject: Re: [PATCH v8 08/12] regulator: bd718x7: Split driver to common and
 bd718x7 specific parts
Message-ID: <20200107124124.GI14821@dell>
References: <cover.1577694311.git.matti.vaittinen@fi.rohmeurope.com>
 <d247d71e183b388dd7f211aee1235965cff979b4.1577694311.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d247d71e183b388dd7f211aee1235965cff979b4.1577694311.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 30 Dec 2019, Matti Vaittinen wrote:

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
> 
> Changes from v7 - no changes
> 
>  drivers/regulator/Kconfig             |   4 +
>  drivers/regulator/Makefile            |   1 +
>  drivers/regulator/bd718x7-regulator.c | 183 ++++++++------------------
>  drivers/regulator/rohm-regulator.c    |  95 +++++++++++++
>  include/linux/mfd/rohm-generic.h      |  44 +++++++
>  5 files changed, 199 insertions(+), 128 deletions(-)
>  create mode 100644 drivers/regulator/rohm-regulator.c

[...]

> diff --git a/include/linux/mfd/rohm-generic.h b/include/linux/mfd/rohm-generic.h
> index ff3dd7578fd3..8037421cc6a1 100644
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
> @@ -17,4 +20,45 @@ struct rohm_regmap_dev {
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
> +};
> +
> +struct rohm_dvs_config {
> +	uint64_t level_map;
> +	unsigned int run_reg;
> +	unsigned int run_mask;
> +	unsigned int run_on_mask;
> +	unsigned int idle_reg;
> +	unsigned int idle_mask;
> +	unsigned int idle_on_mask;
> +	unsigned int suspend_reg;
> +	unsigned int suspend_mask;
> +	unsigned int suspend_on_mask;
> +	unsigned int lpsr_reg;
> +	unsigned int lpsr_mask;
> +	unsigned int lpsr_on_mask;
> +};

I think this deserves a kernel-doc header.

> +#if IS_ENABLED(CONFIG_REGULATOR_ROHM)
> +int rohm_regulator_set_dvs_levels(const struct rohm_dvs_config *dvs,
> +				  struct device_node *np,
> +				  const struct regulator_desc *desc,
> +				  struct regmap *regmap);

Does these really need to live in the parent's header file?

What other call-sites are there?

> +#else
> +static inline int rohm_regulator_set_dvs_levels(const struct rohm_dvs_config *dvs,
> +						struct device_node *np,
> +						const struct regulator_desc *desc,
> +						struct regmap *regmap)
> +{
> +	return 0;
> +}
> +#endif //IS_ENABLED(CONFIG_REGULATOR_ROHM)

a) This comment is not really required
b) You shouldn't be using C++ comments

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
