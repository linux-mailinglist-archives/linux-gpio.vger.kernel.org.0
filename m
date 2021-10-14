Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2616D42D2D6
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Oct 2021 08:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbhJNGnc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Oct 2021 02:43:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbhJNGnc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Oct 2021 02:43:32 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DA93C061570
        for <linux-gpio@vger.kernel.org>; Wed, 13 Oct 2021 23:41:27 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id r7so16033158wrc.10
        for <linux-gpio@vger.kernel.org>; Wed, 13 Oct 2021 23:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=mdoHQevChWPiak1ksDMgXK04B0B7nQ0b8w5IVONlPR0=;
        b=mSIy650ipvtRUAD8Fd6UvoKUpyT6iy9422oVCVv4DzGf+gLtD2hOQYWANJXPvqqzl+
         kxjBQG+y4bGn1xYSl3gJXj59H9uOgTZRkFZiRm7osZh9v5E5sXQEyhsrOj1oKW2PYSel
         9kClVPdceZqK249GSdBPTMhpep8sk8iGV8l6oApyIJQB5dVHPRDVlxwUh8sOHdMkAnIx
         aJUotsbRi/kGusIt0HCcAd7v3qBa2kg8HICRlwjavQuTa0Yk3hpQaRb5pSTETMkmxWHZ
         yG89znmRVkYr8QNy56uM6tTNcGgXM7RsKFKjXznt6LUHMuHesfEWqIGDBuNdjUwDf6Uu
         Nv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=mdoHQevChWPiak1ksDMgXK04B0B7nQ0b8w5IVONlPR0=;
        b=Bsd6hnQwbcOp5ZuVJf9vWvctdKF6KxhsRROXNkqflB+yM2oyWzQcPMNg0d2iaOhDgp
         dXTdITQiisLBUjOTGO7Nore/z+8WzSEBP5FM29G5eGP5HYDDr1Mviwb5wDQBt2cZGixG
         MEsDUzTA1l2B357iEPkgN8IZNwIr+hdlD3vS2RC3Vetw+0YT+JKBWjnQDd0tyHnwww8Q
         mDIYEaTMadEdtkSRAwVLiH16QcjktWyHPJLuBG0vnFEy/A1r0kRcvfNvfSCwn2FxUwEf
         /qM6F7CHR7dgyJNIaY6Of6dFE8SpzOfwtokpeY3o11liwKBx7O0h807bsbNUCEC/DdeZ
         RpxQ==
X-Gm-Message-State: AOAM533hsbQl1tkhluARWADCk5WcGiLFOouq7gWJC12JpyK7r3mvERfa
        G+nJRQTcmDUsgd7bjA6NDEyYt0x6+OGZnw==
X-Google-Smtp-Source: ABdhPJz9pPGFHGHAvAYohz36c1b7XdKuDR7rAmgGOwGzyvFPsiz12FQm0Vu9mc2EwECRnBZsiNp+qA==
X-Received: by 2002:a05:6000:1449:: with SMTP id v9mr4349017wrx.433.1634193686149;
        Wed, 13 Oct 2021 23:41:26 -0700 (PDT)
Received: from google.com (176-35-142-29.xdsl.murphx.net. [176.35.142.29])
        by smtp.gmail.com with ESMTPSA id p18sm1313365wrt.54.2021.10.13.23.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 23:41:25 -0700 (PDT)
Date:   Thu, 14 Oct 2021 07:41:22 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-sunxi@lists.linux.dev,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [RESEND v2 1/3] dt-bindings: gpio: Convert X-Powers AXP209 GPIO
 binding to a schema
Message-ID: <YWfREhBIFLD/9aqo@google.com>
References: <20210924071614.868307-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210924071614.868307-1-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 24 Sep 2021, Maxime Ripard wrote:

> The X-Powers AXP PMICs feature a GPIO Controller supported by Linux
> thanks to its device tree binding.
> 
> Now that we have the DT validation in place, let's convert the device
> tree bindings for that driver over to a YAML schema.
> 
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> 
> Changes from v1:
>   - Removed the example and moved it in the mfd schema
> ---
>  .../devicetree/bindings/gpio/gpio-axp209.txt  | 75 -------------------
>  .../bindings/gpio/x-powers,axp209-gpio.yaml   | 55 ++++++++++++++
>  2 files changed, 55 insertions(+), 75 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-axp209.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
