Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB5C43F474
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Oct 2021 03:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231299AbhJ2Boj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Oct 2021 21:44:39 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:35704 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbhJ2Boi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Oct 2021 21:44:38 -0400
Received: by mail-ot1-f54.google.com with SMTP id w12-20020a056830410c00b0054e7ceecd88so11426229ott.2;
        Thu, 28 Oct 2021 18:42:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nrE/dUDgkUJtxS/u+bs8gFYC9d/J20NTT3aMpOlOEZ8=;
        b=CcPy1lAhcsBmhd7wlo2h4N2zJg8zTwWVvq7UwdTeSLcBK38sQNrkmlHdMmqzWu35DS
         Vd0kLg/Av9SFyfFgDeH8jPbPJUhusD07nb/SKrKvLeDp9uydOVUIOkyMTDXe0QB2Taj1
         WOBZPIR8QEG51IpOf88H4Dwxqhb15T/xOir38SdYFlIRfanV7xIjVNsXh492NQ9XEG+Y
         dmWUlJU1RxfGSSkkIJB6LmYBD3ACKXuHkes8fjglkMehCAGD9PAPaCOI28MK/plfC6UN
         di7KjzXiniLWD88urfnmRanDouvi+8sdyO6oMWN9n04yRFlVq2i+3a3fvLV7sHjk7MXU
         1U/Q==
X-Gm-Message-State: AOAM532apOAER6nWkEV4DVH+TRhM5taCUb60grAGU50D1XWn1Sl3knCy
        YaX823K4Bx2OFukt+HSG6Q==
X-Google-Smtp-Source: ABdhPJwhxRTJ62lm0VCWUDSLn2wEWjgb7K6GdVyMf1vs1f8WW0ePf95n2pwgVOoJL8B+QIKQjy1VhQ==
X-Received: by 2002:a9d:5b7:: with SMTP id 52mr6126664otd.173.1635471730501;
        Thu, 28 Oct 2021 18:42:10 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id j12sm1455604ota.47.2021.10.28.18.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 18:42:09 -0700 (PDT)
Received: (nullmailer pid 975019 invoked by uid 1000);
        Fri, 29 Oct 2021 01:42:08 -0000
Date:   Thu, 28 Oct 2021 20:42:08 -0500
From:   Rob Herring <robh@kernel.org>
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matteo Croce <mcroce@microsoft.com>,
        Atish Patra <atish.patra@wdc.com>,
        Drew Fustini <drew@beagleboard.org>,
        linux-serial@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Fu Wei <tekkamanninja@gmail.com>, linux-clk@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Marc Zyngier <maz@kernel.org>, linux-gpio@vger.kernel.org,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-riscv@lists.infradead.org, Anup Patel <anup.patel@wdc.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Sagar Kadam <sagar.kadam@sifive.com>
Subject: Re: [PATCH v2 04/16] dt-bindings: clock: starfive: Add JH7100 clock
 definitions
Message-ID: <YXtRcMITCkEmESRz@robh.at.kernel.org>
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-5-kernel@esmil.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021174223.43310-5-kernel@esmil.dk>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 21 Oct 2021 19:42:11 +0200, Emil Renner Berthing wrote:
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> Add all clock outputs for the StarFive JH7100 clock generator.
> 
> Based on work by Ahmad Fatoum for Barebox, with "JH7100_" prefixes added
> to all definitions.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
>  include/dt-bindings/clock/starfive-jh7100.h | 202 ++++++++++++++++++++
>  1 file changed, 202 insertions(+)
>  create mode 100644 include/dt-bindings/clock/starfive-jh7100.h
> 

Acked-by: Rob Herring <robh@kernel.org>
