Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E429143F47A
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Oct 2021 03:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231392AbhJ2BpC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Oct 2021 21:45:02 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:38711 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbhJ2BpB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Oct 2021 21:45:01 -0400
Received: by mail-ot1-f49.google.com with SMTP id l10-20020a056830154a00b00552b74d629aso11406060otp.5;
        Thu, 28 Oct 2021 18:42:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T/TTfqPPazXZy6rCqE4eY23ZS6lztPHL6YvSZ3A0aEU=;
        b=uyQirA6tvoTClbI5azPKBmTWrNBQ8uTdvEFLeeZebHuA0W8kGSd2EoNYEdvERZK2w8
         Is7yq3wWYBF4KCsHJXI2WVIHeC8TigI4W7OfjbW7uxW8l4SAlQpBvnnRvY9TSIgivf65
         PJE4HWqQ960b32BoA4qyvIuB3JYJ38E4v5QDzOZ3KsO9PWh2b+Zeuc1NCnsAQ0FlZdZp
         a/ESUGGz4JYYxyqJrgh1V1xrxkKRxNJKKxcZAdW9BntTtMnBdNbXBfs0Gr5BNViVXioe
         Xxa6WLg5tPksAo7Ws5YyhsVRNeoQXsi5GirilimarX/kY2YxQ6YChi87pXfj3Zpc/FQ1
         64XA==
X-Gm-Message-State: AOAM531ESvYsjCGjOL6AKHf1IyY3FekB29jSBLB5w7wSMHpfCWth2lpP
        jf3VdHfKOb9GHhikfk+Crg==
X-Google-Smtp-Source: ABdhPJyTFwx8gGD9lHkBMJhIrbjlxFLtSaRY5wt6pSWrVpUA4KAcaDoDPxba0D+Sge/5gDpSjsXkRA==
X-Received: by 2002:a05:6830:200f:: with SMTP id e15mr6086691otp.221.1635471753342;
        Thu, 28 Oct 2021 18:42:33 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id l2sm1535606otl.61.2021.10.28.18.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 18:42:32 -0700 (PDT)
Received: (nullmailer pid 975719 invoked by uid 1000);
        Fri, 29 Oct 2021 01:42:31 -0000
Date:   Thu, 28 Oct 2021 20:42:31 -0500
From:   Rob Herring <robh@kernel.org>
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Drew Fustini <drew@beagleboard.org>,
        Atish Patra <atish.patra@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-riscv@lists.infradead.org,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-gpio@vger.kernel.org, Sagar Kadam <sagar.kadam@sifive.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Anup Patel <anup.patel@wdc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH v2 05/16] dt-bindings: clock: starfive: Add JH7100
 bindings
Message-ID: <YXtRhwULuIzvmOnt@robh.at.kernel.org>
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-6-kernel@esmil.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021174223.43310-6-kernel@esmil.dk>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 21 Oct 2021 19:42:12 +0200, Emil Renner Berthing wrote:
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> Add device tree bindings for the StarFive JH7100 clock generator.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
>  .../clock/starfive,jh7100-clkgen.yaml         | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
