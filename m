Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17CB1333A21
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 11:37:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbhCJKg5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 05:36:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231922AbhCJKgo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 05:36:44 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE8F8C061761
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 02:36:42 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id l11so19351440wrp.7
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 02:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Jb7ZelfORH1QHJnFWCjShP1okoL5Fzbc3XNjssblVDM=;
        b=Wtl+/BWmYdVQ1eCD7d/+zWRstywW8SSDLChG2No8Nt659lCdvZ1AH6TF9QhRKJfJfJ
         elWDFxQJHuG/54mKawxKkPBWZdKweaH2UfMrGgDmWg5wsIRALmZbsWcI51/06wquWogj
         1ikDFcfaOfCDthMi0nY9erfPIqnIDOMToHoakc2XbndZgaxBgvssewb0ZC/USXxJ+60E
         rv3NyN8XbPueJGxjNsB3vi/SeKJCjFBlc4kOWZsnSjYgIGz8rGjVHlqDiCzQHYFfwxWa
         p7aUw8ynGbHTXaEL8uHwJc/HX1f1Iu+QJJbKzOAI2WmatTLrls4wgrbNcd73tOLQes/f
         yXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Jb7ZelfORH1QHJnFWCjShP1okoL5Fzbc3XNjssblVDM=;
        b=RELTYQ6pNeALqCLEkee3nSNXYrGevJySVHFcm9SBUXIxEMq5y5GJWMf9/KnfpwP17J
         UWBvNMhuwFrO983nad9mya3Y9HSw+KsoyeOKI/ns98xS3Sc39Zex4oYd42bb+44cQmTC
         knyoUg/tojC9Y9kpmq0laDOoAHLDeRTQnDGq912zAqb5o9xurvVluFF/d1s32ZaMlsf9
         C6kjjKUpeZXbFMGHibFierSE3yx/kanzFUd/lZP7lYZrxRjjk6V4iWx+LB/FMdNNT/x9
         IMTMfJ74pB+0d0pRa3aSed9XobMcKYaKZc6J1sxPykm/3p1O/tYOopl9qfvGT6/DJ4hb
         LKyQ==
X-Gm-Message-State: AOAM5336I90ipRsbDXunDn78MMlyuEPwc0uOTD7F89OwZJ4IsqEJdqmX
        91e9CJ98d2MbQYdj67i+h+V5kQ==
X-Google-Smtp-Source: ABdhPJwWYgVLki6B90CCw0UsfdKlqtXBlodzOFwgFzBQoo1El4DPbwMQZWGcm7Uz/h6ROKgdbsyCkA==
X-Received: by 2002:adf:e482:: with SMTP id i2mr2787952wrm.392.1615372601570;
        Wed, 10 Mar 2021 02:36:41 -0800 (PST)
Received: from dell ([91.110.221.204])
        by smtp.gmail.com with ESMTPSA id u63sm8634794wmg.24.2021.03.10.02.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 02:36:41 -0800 (PST)
Date:   Wed, 10 Mar 2021 10:36:39 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 06/15] mfd: Add ROHM BD71815 ID
Message-ID: <20210310103639.GG701493@dell>
References: <cover.1615198094.git.matti.vaittinen@fi.rohmeurope.com>
 <be0e8cd06ed75e799c942e5076ee7b56ad658467.1615198094.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be0e8cd06ed75e799c942e5076ee7b56ad658467.1615198094.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 08 Mar 2021, Matti Vaittinen wrote:

> Add chip ID for ROHM BD71815 and PMIC so that drivers can identify
> this IC.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> ---
>  include/linux/mfd/rohm-generic.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/mfd/rohm-generic.h b/include/linux/mfd/rohm-generic.h
> index 66f673c35303..e5392bcbc098 100644
> --- a/include/linux/mfd/rohm-generic.h
> +++ b/include/linux/mfd/rohm-generic.h
> @@ -14,6 +14,7 @@ enum rohm_chip_type {
>  	ROHM_CHIP_TYPE_BD71828,
>  	ROHM_CHIP_TYPE_BD9571,
>  	ROHM_CHIP_TYPE_BD9574,
> +	ROHM_CHIP_TYPE_BD71815,

Is there a technical reason why these can't be re-ordered?

>  	ROHM_CHIP_TYPE_AMOUNT
>  };
>  

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
