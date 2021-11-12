Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78F8544ED6C
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Nov 2021 20:40:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235315AbhKLTnR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Nov 2021 14:43:17 -0500
Received: from mail-oi1-f180.google.com ([209.85.167.180]:36711 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbhKLTnQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Nov 2021 14:43:16 -0500
Received: by mail-oi1-f180.google.com with SMTP id q124so19827598oig.3;
        Fri, 12 Nov 2021 11:40:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PHvtxKeuvizrVKUChLMEYf9ttqvWEszonrMmIlnzH2Y=;
        b=K5f8PcsljkiBqxJDk+a4jAZiesy+TEUpCgvheaeJsYM+dP9nymz9JvkdXmj+Oe7Tji
         0RyAh2PCqEPlCgeedAuH0B5nCLRiU37mO7P55iLRD/DMHVMPlNr9JMtjjlTDUmMkAqum
         OiVA/coUQm/w4OB/6MArphZxtVsSDuQicwZG/hDOToUEDJpsKjgSrUhTjU+XnIjQbe+P
         H0xGv+R8VhWfnmH92y+voY/Haw8Iis+8TsiEXqqNsewlexJmqxVug7CavGvHlQoXDWrJ
         /PNzXjrQ67eO6rMy5oW0D9mdpc8c7QlL4jdgVBw3blrKrJNxiv/LnmoUf6AmDRTWmDSC
         98xQ==
X-Gm-Message-State: AOAM531e0ACy9c5YSbvfn3654IKhLm9efke7gW3Ub52sFC8rcmCU3VVR
        MGr4GhH2PLKOsEdiyGtUJA==
X-Google-Smtp-Source: ABdhPJw0+YSksiYxgL3Bv+l4s6GecHQ17lz/teo2mb5Gzal8ZpdWy0P/wXLGm3MESOF9KB7+mjHEcA==
X-Received: by 2002:aca:bb45:: with SMTP id l66mr15340831oif.51.1636746025478;
        Fri, 12 Nov 2021 11:40:25 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id g26sm1431948ots.25.2021.11.12.11.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 11:40:24 -0800 (PST)
Received: (nullmailer pid 3241611 invoked by uid 1000);
        Fri, 12 Nov 2021 19:40:23 -0000
Date:   Fri, 12 Nov 2021 13:40:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-serial@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Atish Patra <atish.patra@wdc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Marc Zyngier <maz@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Matteo Croce <mcroce@microsoft.com>,
        devicetree@vger.kernel.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Fu Wei <tekkamanninja@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Drew Fustini <drew@beagleboard.org>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 10/16] dt-bindings: pinctrl: Add StarFive pinctrl
 definitions
Message-ID: <YY7DJ0awxzvBH6zm@robh.at.kernel.org>
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-11-kernel@esmil.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102161125.1144023-11-kernel@esmil.dk>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 02 Nov 2021 17:11:19 +0100, Emil Renner Berthing wrote:
> Add definitons for pins and GPIO input, output and output enable
> signals on the StarFive JH7100 SoC.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
>  .../dt-bindings/pinctrl/pinctrl-starfive.h    | 275 ++++++++++++++++++
>  1 file changed, 275 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-starfive.h
> 

Acked-by: Rob Herring <robh@kernel.org>
