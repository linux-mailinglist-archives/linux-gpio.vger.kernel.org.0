Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7E3396F1D
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jun 2021 10:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233412AbhFAIl2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Jun 2021 04:41:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231139AbhFAIl2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Jun 2021 04:41:28 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93AECC061574
        for <linux-gpio@vger.kernel.org>; Tue,  1 Jun 2021 01:39:47 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id f20-20020a05600c4e94b0290181f6edda88so996619wmq.2
        for <linux-gpio@vger.kernel.org>; Tue, 01 Jun 2021 01:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=fwYLGPFkwdh/HThdI1LQ3D7Sa+CANFeet/ms5ocqzVg=;
        b=B8zAxfBioT7FIrTPBqWd98uxG5BN/M+fF/ODhvHVjHbm2UohHiYDbeMNxfMajPAMcN
         f1TfeFpiniII0WX488Rnu8cDcDGa1NS8jPpeOKG7QNw/4dEfi/9hR9wcGk1iHcQtc3XW
         fwuv4sngTpPZRjS+qZv3DRKN09fENXysswgSWZwbZoaHAZn1sDJXu/8AQerOxDk+Mpkq
         EcmUjU1R1JgIFlIBmAbVIZ4Q3gHEyapU815+zLyLV6Ys1/sRy60o7eS+iwp+Ir4bysSE
         BF3Y45hJ7bjUnZrSPquk83OcKbAfEwLfm/LkiHw+3Kphxg1G2vTmPIMi40z56yavzghD
         Anfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=fwYLGPFkwdh/HThdI1LQ3D7Sa+CANFeet/ms5ocqzVg=;
        b=tpXv2NHkVyOw9LjaEgB+uwcr3bB//AA/PVPxKg8bnuZCDEpw0a8PbpASm3hI3bvMpZ
         xVgPLSQFs6oYwAZG96r9Byp2MqmqXWSE2JXdVfsURLCnVoY/5VybldlMvHIyGQIVINue
         SFNwYvkUGlqNohmCpHbVU6bHSlQ7KwcQ1qDmhVOGMYTuQJ59NLoysjupeh+oPowhJFon
         jm29CpdB20yr7iXEGZl9IE+2otDhwwk5os2WV87ys/5CizJ+GSN0NNvKywtfBHOvTGGe
         jr5+fc78CipzsS5TOhsqmlrETjK4YOjpIqFfXV8zMn1YxKDoVwX8HfcoHhhL1LxskE6Y
         9AGQ==
X-Gm-Message-State: AOAM533vPGTmLiJ19z9tVkAweGbwm5DRHigjyocA6alcp8iRpck2kkOo
        Or298gS1dOeDwG+OzQUvXbg0K6BArUUsGg==
X-Google-Smtp-Source: ABdhPJyIDHtN04BJpvc9WwnHgqypN0MUAhE9fAvsxWnWmyuTTr0flvdH2YtxWENeyFD6zSQEG76auA==
X-Received: by 2002:a1c:1902:: with SMTP id 2mr24673720wmz.128.1622536786207;
        Tue, 01 Jun 2021 01:39:46 -0700 (PDT)
Received: from dell ([91.110.221.249])
        by smtp.gmail.com with ESMTPSA id r14sm2152563wrx.74.2021.06.01.01.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 01:39:45 -0700 (PDT)
Date:   Tue, 1 Jun 2021 09:39:44 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        p.zabel@pengutronix.de, robh+dt@kernel.org,
        devicetree@vger.kernel.org, luka.perkov@sartura.hr,
        jmp@epiphyte.org, pmenzel@molgen.mpg.de, buczek@molgen.mpg.de
Subject: Re: [PATCH v3 1/6] mfd: simple-mfd-i2c: Add Delta TN48M CPLD support
Message-ID: <20210601083944.GW543307@dell>
References: <20210531125143.257622-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210531125143.257622-1-robert.marko@sartura.hr>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 31 May 2021, Robert Marko wrote:

> Delta TN48M switches have a Lattice CPLD that serves
> multiple purposes including being a GPIO expander.
> 
> So, lets use the simple I2C MFD driver to provide the MFD core.
> 
> Also add a virtual symbol which pulls in the simple-mfd-i2c driver and
> provide a common symbol on which the subdevice drivers can depend on.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
> Changes in v2:
> * Drop the custom MFD driver and header
> * Use simple I2C MFD driver
> 
>  drivers/mfd/Kconfig          | 10 ++++++++++
>  drivers/mfd/simple-mfd-i2c.c |  1 +
>  2 files changed, 11 insertions(+)

I responded to a previous version of this.

The question still remains - why do you need one single Regmap
encompassing all functionality.  The register banks look separated to
me at first glance.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
