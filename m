Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3364334C98
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Mar 2021 00:33:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232133AbhCJXcj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 18:32:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233606AbhCJXcg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 18:32:36 -0500
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01628C061574
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 15:32:36 -0800 (PST)
Received: by mail-oo1-xc2b.google.com with SMTP id q127-20020a4a33850000b02901b646aa81b1so235326ooq.8
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 15:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Lki+LVhGY+TJZZ9vEzSlPJrcvDWEcfN6Jpmqx+Vkc24=;
        b=WHmSoVbHh0YkRmMo2QkKPvnLh2xh+r/kgYySk2lnq2vG4xor5o+igOn03hUpYvpVBx
         Cj6aaQgizEcqr8CXULTsoaxHSpIKkRRaLd0Rv9vRvU8A23vLDpve1vRbo007jQ+e6TTd
         HzprnhA9Rryqjr3VV/OUNm5CtVEiqAUMPU7o936XEtYMWboozJSfELXfmflB2O9ct5Up
         ZRvc24kZqej2HDIH2QvABB+dFqoCRFRe1SjZQJxOYqp489zTUoN+0O2TtyJ2CbtFn2Nl
         SMxDWL5g3SLl31M1Ft3ZcRcXo0DRjEne9qv3WBi1GDCO8LIAEMnKsU6RaN8eFQ7oRsWz
         naRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Lki+LVhGY+TJZZ9vEzSlPJrcvDWEcfN6Jpmqx+Vkc24=;
        b=HejoufczlXyuAPyKXPG0L4tPeLnNsoZItJsU5ekURm4MzCeybNnWhXd8PdcAlQ1Sn3
         3K8gpIYzrW8dECJT4K6Tjm9m1coqOU9GuRFhL07LBIHZQV/xLOKE0+BTF7Ue3Er6zSI4
         vnmKSV5MY22jOzCe/kTvheHNN3WviTHebzYlGDjJJuOkupToJ/rMg/pU8QbnNXZu4zGL
         X5fvX8Yel3eQVhhgECGjOP76zQceEh2H2MgnSJIC3kms3Bi3FzPhKZhH6auIeRaVwyiq
         fUObggpNG0NPjfootakPjmKsImiFIEP7rBMT0HlV/WK6Z/VxFSj/PHuWhOqOYRit78hz
         x05w==
X-Gm-Message-State: AOAM533O+mZJ/JY/c3oVpk9zQQr68iWcS2hYDa2TncFRfQjo4bZ44IeE
        TK1JY2h4aomY2fqfBX0sbOFObw==
X-Google-Smtp-Source: ABdhPJyHwvVzHT4WfwD/MTxFLXkw2JPAOy7xnkyabLGfWPvokC5X5Ar5OGn9ENIkzukawxDBvIfySQ==
X-Received: by 2002:a4a:d48b:: with SMTP id o11mr4262670oos.2.1615419155407;
        Wed, 10 Mar 2021 15:32:35 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z3sm202269oix.2.2021.03.10.15.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 15:32:35 -0800 (PST)
Date:   Wed, 10 Mar 2021 17:32:33 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, john.stultz@linaro.org,
        amit.pundir@linaro.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] gpio: wcd934x: Fix shift-out-of-bounds error
Message-ID: <YElXEVBFkoLd2FSy@builder.lan>
References: <20210310174304.22176-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210310174304.22176-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed 10 Mar 11:43 CST 2021, Srinivas Kandagatla wrote:

> bit-mask for pins 0 to 4 is BIT(0) to BIT(4) however we ended up with BIT(n - 1)
> which is not right, and this was caught by below usban check
> 
> UBSAN: shift-out-of-bounds in drivers/gpio/gpio-wcd934x.c:34:14
> 
> Fixes: 59c324683400 ("gpio: wcd934x: Add support to wcd934x gpio controller")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> changes since v1:
> 	- removed unnecessary dump stack from log
> 
>  drivers/gpio/gpio-wcd934x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-wcd934x.c b/drivers/gpio/gpio-wcd934x.c
> index 1cbce5990855..97e6caedf1f3 100644
> --- a/drivers/gpio/gpio-wcd934x.c
> +++ b/drivers/gpio/gpio-wcd934x.c
> @@ -7,7 +7,7 @@
>  #include <linux/slab.h>
>  #include <linux/of_device.h>
>  
> -#define WCD_PIN_MASK(p) BIT(p - 1)
> +#define WCD_PIN_MASK(p) BIT(p)
>  #define WCD_REG_DIR_CTL_OFFSET 0x42
>  #define WCD_REG_VAL_CTL_OFFSET 0x43
>  #define WCD934X_NPINS		5
> -- 
> 2.21.0
> 
