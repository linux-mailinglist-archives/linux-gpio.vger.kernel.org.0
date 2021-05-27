Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 523503923AF
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 02:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231968AbhE0ATm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 May 2021 20:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233689AbhE0ATl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 May 2021 20:19:41 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58158C06175F
        for <linux-gpio@vger.kernel.org>; Wed, 26 May 2021 17:18:08 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id o8so4034661ljp.0
        for <linux-gpio@vger.kernel.org>; Wed, 26 May 2021 17:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5pNc1j9V/0p6zuELiqNdygegiQOxBrIeUuvDW7TcIWY=;
        b=u1Rl4xfL89iqxQ3I4P3oGZ4wpAe+PBGqDwKdqMyu9mYOVCP4ALL2gPHog/RNWZ1TgA
         JUC7/WtiRrgGzJNcyAOh6NKGy1vybU5k6WIju9Fu/vqJXYW7nQ2ZkkjqoYOwefdICDWb
         jivNPY5ydsGtU+CWGSLtZk6oT1qxC2bvWq1l+w+m0TcnmFqMh3i1VbI3KyQ5Xe3Zib/O
         SCaF/YvlU2sZ5YHCFp6sxgNlRAd/yWt+ZgpKI+V7dFTe5MhTJn9GO2CnrjUqm0QRETw5
         ZGBz1Kdm2EBcuwT2850nF8W4PNN5as6mET0G8wiBTjSTHd1bOW/dMo8pnrnzntj7iUHd
         jcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5pNc1j9V/0p6zuELiqNdygegiQOxBrIeUuvDW7TcIWY=;
        b=Ip+XC9aPIhIFogfs6Rh7cEG/+sP5YEHNTPPN3k2XVo1F0s6ohhO18V4FDrJ/j2W7d2
         8A1ybd1NnHJ/cGH9K+ZcoUWW/FBdx1MOypLmdRT5SFxTUZMJwfy7KxrX7+8LfLihClDf
         vk6bNl+GgKKRHSeJSEwg0PM9iTeI6JQo8Gs/fQSXC1XvluOTkZFoyDekCaLa6hXTWwsm
         HNX2whYjldSq7fepT7IWfhLmZpOTX9SgKygpXFgLiTOBnmbIC0svI4jrdHyNqjcMn0K8
         s6PF0+kwUpmUvvLdGqjL9Rzf7l1HI4QXnxbDtD3pmAOBkP6AwLuwKj9G5m9khpDA7d9l
         IhJg==
X-Gm-Message-State: AOAM533HSPxNsROevmB/pZqvu8/vhNUdsFdRHjozXORqWrpebMaaDwkD
        YdQliBEjbSiVWlGzK2Ghx1woU+LLKpbmuFn3ph+im18gYbA=
X-Google-Smtp-Source: ABdhPJyE/PptaUPKadiYFnKrDVT7amcN42lpe+YkWB2i/2zdRUhO2B3HU8uvdIUr3250T1J7qnllzV/KArMH3sKr7mk=
X-Received: by 2002:a2e:90c7:: with SMTP id o7mr469746ljg.368.1622074685623;
 Wed, 26 May 2021 17:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210511090122.6995-1-a-govindraju@ti.com>
In-Reply-To: <20210511090122.6995-1-a-govindraju@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 27 May 2021 02:17:54 +0200
Message-ID: <CACRpkdZ829w3p+axRMBxQU7jyeWuyUew5MoFMSkuJ4dzpg9HgA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: gpio-davinci: Convert to json-schema
To:     Aswath Govindraju <a-govindraju@ti.com>,
        Marc Zyngier <maz@kernel.org>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, Keerthy <j-keerthy@ti.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 11, 2021 at 11:01 AM Aswath Govindraju <a-govindraju@ti.com> wrote:

Just a drive-by comment (not your problem right now)

> +      /* HW Interrupts mapped to GPIO pins */
> +      interrupts = <GIC_SPI 120 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 121 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 123 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 124 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 125 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 126 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 127 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 128 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 129 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 130 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 131 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 132 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 133 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 134 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 135 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 136 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 137 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 138 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 139 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 140 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 141 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 142 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 143 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 144 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 145 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 146 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 147 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 148 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 149 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 150 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 151 IRQ_TYPE_EDGE_RISING>;

This is quite obviously a hiearchical interrupt controller. I think
this appeared in the kernel before the GIC could even deal with
hierarchical IRQs but it should really be fixed to make the platform
modern.

Yours,
Linus Walleij
