Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D40821818A
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 09:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbgGHHpZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 03:45:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbgGHHpY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 03:45:24 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61ABCC08E763
        for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2020 00:45:24 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id o2so1883745wmh.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2020 00:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=dvqxIY5/h+Hi08QqzkQR4GxWo2uSuz4DSd8Ijo5xAAw=;
        b=sM01lxxYQ4EfApgBtPAY1tlREhF6Q5nbZBYrqNsF5UEIT5lxaBcV65i8uLFHPMXHw2
         qBBbTvwQm/uLh+pR1RyhDDIbT9acEqGVIPgjWmTHAHYY27RNK0klDk5+1hd49k60iwoo
         OQTKcgBMQMTYP6o/jNt5edF10/yPCEb83Wc+S0178PPiSq5CQCuRHwxt63Da4T4v0vZ0
         OiIqGvRWkt8S1hXD/Lm3uOj+7rNdaiQereDtYK+NxGCm2H8CRtd8tDETWtu76IR67xUq
         X3FanwL88C0lIQOC9u2uU4XvpNtT0H2S23GeuQe+VQVqFkv/IqYFLsGmuGcBI8/GxgUY
         UhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=dvqxIY5/h+Hi08QqzkQR4GxWo2uSuz4DSd8Ijo5xAAw=;
        b=BW/rhqBgkyJM+Lj3db0fml98+9OuSuR4zTobQK9WKVs8WhaSbGzGBapixqPpw24EQz
         mhD+SEOb2BNua8J38VzW8YSBNZy08RY5u9xxBJEUgc818xgsKi07QdM75ZZhuIAy2R4I
         NzIRWryM2Ed10wK7g2XK+VUWvAjwHZWgCfGkJXU1KypD8rim4ELspyBemAt7wu0J83Tp
         6xcti+q+ilKMmlOcTfGbvlJXCAax4MbASz+nyq2eWepFhrtUxlXP5qwfhIKcGMTZC71Z
         so+3NSCYuHhFhMwnLsMhl2oVBXLgMgwZinUd4ywTfUWZSSPQgcOXuNk9CxRs1wudRnIp
         gPMQ==
X-Gm-Message-State: AOAM531eQxOEV55mo+IfIzPHpxR9kwQxtCxP8tVFtEE5V1NiHT5Mn0a9
        1CtMMeRPxhvAcx6MIj83jXPWuw==
X-Google-Smtp-Source: ABdhPJyrs9JjcAa1EVpT3YYg0xeBhj7Vs2aNSuxcfo+IdXW371pwsk+hDd+L5UUI6ck9FLQzlHDvzA==
X-Received: by 2002:a1c:e18a:: with SMTP id y132mr7831817wmg.27.1594194323097;
        Wed, 08 Jul 2020 00:45:23 -0700 (PDT)
Received: from dell ([2.27.35.206])
        by smtp.gmail.com with ESMTPSA id k18sm4434969wrx.34.2020.07.08.00.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 00:45:22 -0700 (PDT)
Date:   Wed, 8 Jul 2020 08:45:20 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Frank Lee <frank@allwinnertech.com>
Cc:     robh+dt@kernel.org, mripard@kernel.org, wens@csie.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        gregory.clement@bootlin.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org,
        srinivas.kandagatla@linaro.org, linus.walleij@linaro.org,
        anarsoul@gmail.com, tiny.windzz@gmail.com, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, amit.kucheria@verdurent.com,
        p.zabel@pengutronix.de, clabbe@baylibre.com, icenowy@aosc.io,
        megous@megous.com, stefan@olimex.com, bage@linutronix.de,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, huangshuosheng@allwinnertech.com,
        liyong@allwinnertech.com
Subject: Re: [PATCH v3 12/16] dt-bindings: irq: sun7i-nmi: Add binding for
 A100's NMI controller
Message-ID: <20200708074520.GQ3500@dell>
References: <20200708072331.19700-1-frank@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200708072331.19700-1-frank@allwinnertech.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 08 Jul 2020, Frank Lee wrote:

> Add a binding for A100's nmi controller.
> 
> Signed-off-by: Frank Lee <frank@allwinnertech.com>
> ---
>  .../bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml      | 3 +++
>  1 file changed, 3 insertions(+)

I'm sure 3/4 of the people in your recipients list have little
interest in this change.  May of us already have overflowing inboxes.

Please be more restrictive/considerate when posting patches in the
future.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
