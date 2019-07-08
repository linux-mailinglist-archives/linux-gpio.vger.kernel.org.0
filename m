Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC86D6255B
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2019 17:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388400AbfGHPvH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jul 2019 11:51:07 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46064 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726962AbfGHPvH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jul 2019 11:51:07 -0400
Received: by mail-lf1-f65.google.com with SMTP id u10so11256199lfm.12
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jul 2019 08:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Lcu6DKhuqC2EdjddGasiGPHtfViOaKatj/mPHVzp6VA=;
        b=PgagO2IsiF4rFEsQ1pEGwMwtjC8l+1tE8BYXAKHXqKARn1Bgx6b0qiLcG4o9m8tAef
         j2UHyQ87E5pA7Mj1JvJuqxMQqRBNveBXnd3sZkPk3PmHPvJzJSLZcqBZZQC/0yn6VvEn
         SkHCb6zWMay4selpqMxmN7N9KrSzkrgwRKnNxIfypr53cC4Y5rjNVXAKd4rJxM34RKob
         xl14dKBErxnaPATmaknikgb7R4iRU5F8zITKvktvo0mF2/bOBK47FZGxd2Y4SCHGDdAP
         0VxhjAWpVyMLvzYBCevSIT7jmdk1ua3SD2czk/0TVdRBKWwH1OZUeVFpig2/K4Su0MO4
         +Ndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Lcu6DKhuqC2EdjddGasiGPHtfViOaKatj/mPHVzp6VA=;
        b=CyDVduc0I7GHcdysQm4ABpWps/dMB9axgsD4tIyiRekos4LRU/QhN1178MpJ7c1p+L
         UEAWqGjpPOfqmjHR/iK+PjQzGEhSMwPMoXFDCzqZaSALH8LFabrdMgg4sdP/M8cQSCJn
         LTtp1AAbnGWHGlYz43/P8MOKDrWQcHxLIB3nm3w7KueaFNuvkb8/OeDhzw4PZcp/nIl7
         f9u3vgG+jDco1MxBi2RxHYSZC4I7mD/QhoGViXusH56zwba+w0aJO/kTsBlcdpMA/T6A
         cPdE+iMbmRCr+UKVRwt2Xz12qZNzUYUv5F/2mBMiLkajN1SVhYi2TxkmXnLIXo4DnNr8
         XJrQ==
X-Gm-Message-State: APjAAAXRiU+HxTmcfUNh4wySV8nLmZ6pxehgeIeAPD1YTKgKCWdNcpi9
        pPnSlqHuvUm1tgJzca7wwC+mwg==
X-Google-Smtp-Source: APXvYqxEVIlyCLwyyxfKqlR4trRT9l0+9B6drLsoXei3PDRFkDOgzGGIqdglLJdOft3RmoF5pEmJJQ==
X-Received: by 2002:a05:6512:48f:: with SMTP id v15mr7144576lfq.37.1562601065318;
        Mon, 08 Jul 2019 08:51:05 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4440:228b:a5c8:af47:c662:2fa9? ([2a00:1fa0:4440:228b:a5c8:af47:c662:2fa9])
        by smtp.gmail.com with ESMTPSA id n10sm2819753lfe.24.2019.07.08.08.51.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 08:51:04 -0700 (PDT)
Subject: Re: [PATCH RFC 1/7] pinctrl: sh-pfc: add new flags into struct
 sh_pfc_pin_config
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linus.walleij@linaro.org, geert+renesas@glider.be,
        thierry.reding@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <1562576868-8124-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1562576868-8124-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <f5f0a790-3ed5-dfbc-e489-be1ecc55d742@cogentembedded.com>
Date:   Mon, 8 Jul 2019 18:51:00 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1562576868-8124-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 08.07.2019 12:07, Yoshihiro Shimoda wrote:

> To clean/modify the code up later, this patch just adds new flags
> "mux_set" and "gpio_enabled" into the struct sh_pfc_pin_config.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>   drivers/pinctrl/sh-pfc/pinctrl.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/sh-pfc/pinctrl.c b/drivers/pinctrl/sh-pfc/pinctrl.c
> index 2824be4..157b257 100644
> --- a/drivers/pinctrl/sh-pfc/pinctrl.c
> +++ b/drivers/pinctrl/sh-pfc/pinctrl.c
> @@ -27,6 +27,8 @@
>   
>   struct sh_pfc_pin_config {
>   	u32 type;
> +	bool mux_set;
> +	bool gpio_enabled;
>   };
>   
>   struct sh_pfc_pinctrl {
> @@ -364,7 +366,15 @@ static int sh_pfc_func_set_mux(struct pinctrl_dev *pctldev, unsigned selector,
>   	for (i = 0; i < grp->nr_pins; ++i) {
>   		ret = sh_pfc_config_mux(pfc, grp->mux[i], PINMUX_TYPE_FUNCTION);
>   		if (ret < 0)
> -			break;
> +			goto done;
> +	}
> +
> +	/* All group pins are configurated, mark the pins as mux_set */

    Configured.

> +	for (i = 0; i < grp->nr_pins; ++i) {
> +		int idx = sh_pfc_get_pin_index(pfc, grp->pins[i]);
> +		struct sh_pfc_pin_config *cfg = &pmx->configs[idx];
> +
> +		cfg->mux_set = true;
>   	}
>   
>   done:
[...]

MBR, Sergei
