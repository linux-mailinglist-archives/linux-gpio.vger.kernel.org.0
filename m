Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66FADCFAEA
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2019 15:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730873AbfJHNHh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Oct 2019 09:07:37 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38335 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730646AbfJHNHh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Oct 2019 09:07:37 -0400
Received: by mail-wm1-f65.google.com with SMTP id 3so3060439wmi.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2019 06:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=RRTyjbD2nXil/1dTyKHCdNiDSPu44x+R2j9erEJQUzU=;
        b=PgoBmoAn4Pmk6DJ/A1pr574836r+yMWzHutomE9C6qL4oE0ijsVTLgSL1K9UMK6/Fs
         jTz7R0a2t3LJTmdbUiCDpnbkYANCpGZdY2uMoDQw+5korJHGdRkoEdiWTICcxKX0bktm
         ZFLyAaLsjdbZYTDf+ALtBRW0CRpOjCFMCzxdu1Q/Y/DAes2cLBDHdbUrvNNiRClEe05f
         BdpByXprBZAzhIO/68ht/qZs7UQ3CfkWzJZQvqzckgp9+Rz4Ew1wBYk9gUi7Y0bK9Nc1
         aMHAqvt6uerOOvdF3UXYc5xXOwiqIKX/iUMhp6/rp/PGYWLX3I5OaYiia45ASkrSOPq8
         A4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=RRTyjbD2nXil/1dTyKHCdNiDSPu44x+R2j9erEJQUzU=;
        b=AEr36hqF2FXCAyj758KRET6XQFn+FF4/byC5G3pm0PM1vj/Fah2DEUiG1ndrGucerH
         dwcd/k+YOb2ldBu5KZHyuNRSGE7HzUVRqR1gT/shH1DDMPzL80rrgXpf/fXwJ2pf9DRV
         Epe9D0wOw40KCshIQdcLSrMNz3RK6lZQj2x3o2bUTf0z3/T1aOlYApHJ8vbrfqgwFPXw
         oXzSrFjSayH0GDd97aqJqU5Zcuog1sdBxX4xGvcvMZ523i+DVjkCX1dYZ5VANxAiyQrh
         qvrdljw36iNJc1OESMF0nveHRFe+gOax8oqVgbYA1TR6jKDwpbmDhiIsSAPFjT1R5+g5
         wNeg==
X-Gm-Message-State: APjAAAXermkN74lUOZMshC1J6IcZqXf5mDLbPWdPqfAWlaLYvxPZDGv3
        fh5lciLhgRQUAD9iWAC6wEFVYw==
X-Google-Smtp-Source: APXvYqxoz3fBEwZdCsmzm39Wru7wwUHsL41R6jvKminS0JIPKBFk2MoUAORj+PZ4OBzprQC5FUYhdw==
X-Received: by 2002:a7b:c398:: with SMTP id s24mr3861283wmj.78.1570540053881;
        Tue, 08 Oct 2019 06:07:33 -0700 (PDT)
Received: from [192.168.1.62] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id p5sm2811685wmi.4.2019.10.08.06.07.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 06:07:33 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] pinctrl: meson-a1: add pinctrl driver for Meson A1
 Soc
To:     Qianggui Song <qianggui.song@amlogic.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Carlo Caione <carlo@caione.org>,
        Rob Herring <robh+dt@kernel.org>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Hanjie Lin <hanjie.lin@amlogic.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1570532999-23302-1-git-send-email-qianggui.song@amlogic.com>
 <1570532999-23302-3-git-send-email-qianggui.song@amlogic.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <cca24aa5-07dc-f2d6-885a-09bc8e20b3b6@baylibre.com>
Date:   Tue, 8 Oct 2019 15:07:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1570532999-23302-3-git-send-email-qianggui.song@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 08/10/2019 13:09, Qianggui Song wrote:
> Add pinctrl driver for Meson A1 Soc which share the same register layout of
> pinmux with previous Meson-G12A, however there is difference for gpio
> and pin config register in A1.The main difference is that registers before A1
> are grouped by function while those of A1 are by bank. The new register layout
> is as below:
> 
> /* first bank */	      /* addr */
> - P_PADCTRL_GPIOP_I         base + 0x00 << 2
> - P_PADCTRL_GPIOP_O         base + 0x01 << 2
> - P_PADCTRL_GPIOP_OEN       base + 0x02 << 2
> - P_PADCTRL_GPIOP_PULL_EN   base + 0x03 << 2
> - P_PADCTRL_GPIOP_PULL_UP   base + 0x04 << 2
> - P_PADCTRL_GPIOP_DS        base + 0x05 << 2
> 
> /* second bank */
> - P_PADCTRL_GPIOB_I         base + 0x10 << 2
> - P_PADCTRL_GPIOB_O         base + 0x11 << 2
> - P_PADCTRL_GPIOB_OEN       base + 0x12 << 2
> - P_PADCTRL_GPIOB_PULL_EN   base + 0x13 << 2
> - P_PADCTRL_GPIOB_PULL_UP   base + 0x14 << 2
> - P_PADCTRL_GPIOB_DS        base + 0x15 << 2
> 
> Each bank contains at least 6 registers to be configured, if one bank has
> more than 16 gpios, an extra P_PADCTRL_GPIO[X]_DS_EXT is included. Between
> two adjacent P_PADCTRL_GPIO[X]_I, there is an offset 0x10, that is to say,
> for third bank, the offsets will be 0x20,0x21,0x22,0x23,0x24,0x25 according
> to above register layout.For privous chips, registers are grouped
> according to their functions while registers of A1 are according to bank.
> 
> Current Meson pinctrl driver can cover such change by using base address of
> GPIO as that of drive-strength. While simply giving reg_ds = reg_pullen
> make wrong value to reg_ds for Socs that do not support drive-strength like
> AXG.To make things simple, add an extra dt parser function for a1 or later chip
> and remain the old dt parser function for old Socs.
> 
> Also note that there is no AO bank in A1.
> 
> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
> ---
>  drivers/pinctrl/meson/Kconfig            |   6 +
>  drivers/pinctrl/meson/Makefile           |   1 +
>  drivers/pinctrl/meson/pinctrl-meson-a1.c | 942 +++++++++++++++++++++++++++++++
>  drivers/pinctrl/meson/pinctrl-meson.c    |  16 +-
>  drivers/pinctrl/meson/pinctrl-meson.h    |   5 +
>  5 files changed, 969 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/pinctrl/meson/pinctrl-meson-a1.c
> 

[...]

> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -695,6 +695,17 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
>  	return 0;
>  }
>  
> +int meson_pinctrl_parse_dt_extra(struct meson_pinctrl *pc,
> +				 struct device_node *node)
> +{
> +	int ret;
> +
> +	ret = meson_pinctrl_parse_dt(pc, node);
> +	pc->reg_ds = pc->reg_pullen;
> +
> +	return ret;
> +}
> +
>  int meson_pinctrl_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -708,7 +719,10 @@ int meson_pinctrl_probe(struct platform_device *pdev)
>  	pc->dev = dev;
>  	pc->data = (struct meson_pinctrl_data *) of_device_get_match_data(dev);
>  
> -	ret = meson_pinctrl_parse_dt(pc, dev->of_node);
> +	if (pc->data->parse_dt)
> +		ret = pc->data->parse_dt(pc, dev->of_node);
> +	else
> +		ret = meson_pinctrl_parse_dt(pc, dev->of_node);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
> index c696f3241a36..ca29efd90aac 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.h
> +++ b/drivers/pinctrl/meson/pinctrl-meson.h
> @@ -11,6 +11,7 @@
>  #include <linux/regmap.h>
>  #include <linux/types.h>
>  
> +struct meson_pinctrl;
>  /**
>   * struct meson_pmx_group - a pinmux group
>   *
> @@ -114,6 +115,7 @@ struct meson_pinctrl_data {
>  	unsigned int num_banks;
>  	const struct pinmux_ops *pmx_ops;
>  	void *pmx_data;
> +	int (*parse_dt) (struct meson_pinctrl *pc, struct device_node *node);
>  };
>  
>  struct meson_pinctrl {
> @@ -171,3 +173,6 @@ int meson_pmx_get_groups(struct pinctrl_dev *pcdev,
>  
>  /* Common probe function */
>  int meson_pinctrl_probe(struct platform_device *pdev);
> +/* Extra dt parser function for register layout grouped by bank */
> +int meson_pinctrl_parse_dt_extra(struct meson_pinctrl *pc,
> +				 struct device_node *node);
> 

I think you should add this parse_dt callback in a separate patch.

Neil
