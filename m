Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4EF1461618
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Nov 2021 14:19:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377677AbhK2NW1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Nov 2021 08:22:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233146AbhK2NU0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Nov 2021 08:20:26 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DD86C07E5F0
        for <linux-gpio@vger.kernel.org>; Mon, 29 Nov 2021 04:02:27 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id p18so14357531wmq.5
        for <linux-gpio@vger.kernel.org>; Mon, 29 Nov 2021 04:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=rtEoyHU+/P8SW0Ay3UVQL/1+5D3lNahwv8JalMTUQRo=;
        b=ePOH7sc2vXzIFbRqfF2nhZlyiC/qsWm6Bkph3nHYyWG5dOaeZ6en3EMmmJ/PFMduhR
         FSD92+TFDqs0N9hwVRmM+cMKD+rSBYckqVKZMcouRxTW+5YJ/zjhshUKAMGxfGmk4oZa
         kdaDFdFCzmhJfEGfgWPmPn+BWUDbZqXqh3EtNzmSg+ltcgGxY05jBLbo66g5N5ObRhDk
         8dJF/6ZaGwo1aZsJ6RZxQliH4jCfbi5kgSjNr4YGKO0STXOMhBKn+ORAd/CvQyVN0xL9
         q7YU/xNDWXOzVPK6aS4dLx4ytyN5sz96l4+sJeOaH72yeDBcUDzMcdVD7Jwk4bWX40VQ
         cdnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=rtEoyHU+/P8SW0Ay3UVQL/1+5D3lNahwv8JalMTUQRo=;
        b=l/4bHgjKYOW0Wl45cPr0BlPlirzOLi7fUouGKnFY/bkmEfV6Tmr+DjUNdCysG9f3Gy
         xxZZZUzxGiBMJ5z7xskeoDcApnWkp/2sMw+s7IDCp/lFWNY34YWkGnPlAzDHtUSIF2v7
         zG06+4lEAxCXxXbtEZZWyAB+/lK0Ky8N9Yv0V+ozGdehBK3NOQAaJTBNR5qWh9/Y74jR
         z1fwzuRPM70QLFJ/vQ9yLbf9Du/l3vxjtBaQ/yfe6Plh/YRBLWRQErIiWeayf9jOqx60
         WdQQXzJBrCGiL1q6JBZZk/FnpHa6SpRT9eRe8fDjXFWXPObhADNAU6cJIFInr5cTbPHX
         5G9w==
X-Gm-Message-State: AOAM5320LeI7FC6uu2Dh7a8ScH/49o04dtm7c1WzsmgvS7mkXCWfLN4T
        OOYITHeZWvd5NwfUYyc8o12r4g==
X-Google-Smtp-Source: ABdhPJwR1tF8O7hzEzJcCJ4jcEWa/yiocIO1Vw5sOOlTt/PvUI1C5xUpKAVswc1ff/cHUwZwDdtkIw==
X-Received: by 2002:a05:600c:2149:: with SMTP id v9mr36895221wml.59.1638187346038;
        Mon, 29 Nov 2021 04:02:26 -0800 (PST)
Received: from google.com ([2.31.167.18])
        by smtp.gmail.com with ESMTPSA id n7sm13279389wro.68.2021.11.29.04.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 04:02:25 -0800 (PST)
Date:   Mon, 29 Nov 2021 12:02:23 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        lukas.bulwahn@gmail.com, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-power@fi.rohmeurope.com
Subject: Re: [PATCH RESEND 1/4] dt-bindings: mfd: regulator: Drop BD70528
 support
Message-ID: <YaTBTwvK0LDetdP+@google.com>
References: <cover.1637066805.git.matti.vaittinen@fi.rohmeurope.com>
 <64c88990270d9a22508446ef2fe3b6a2622a0b01.1637066805.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <64c88990270d9a22508446ef2fe3b6a2622a0b01.1637066805.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 16 Nov 2021, Matti Vaittinen wrote:

> The only known BD70528 use-cases are such that the PMIC is controlled
> from separate MCU which is not running Linux. I am not aware of
> any Linux driver users. Furthermore, it seems there is no demand for
> this IC. Let's ease the maintenance burden and drop the driver. We can
> always add it back if there is sudden need for it.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> 
> ---
>  .../bindings/mfd/rohm,bd70528-pmic.txt        | 102 ------------------
>  .../regulator/rohm,bd70528-regulator.txt      |  68 ------------
>  2 files changed, 170 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd70528-pmic.txt
>  delete mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd70528-regulator.txt

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
