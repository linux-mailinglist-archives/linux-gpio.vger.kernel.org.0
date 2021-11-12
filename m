Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E788F44ED67
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Nov 2021 20:39:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235142AbhKLTmV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Nov 2021 14:42:21 -0500
Received: from mail-oi1-f172.google.com ([209.85.167.172]:33304 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbhKLTmT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Nov 2021 14:42:19 -0500
Received: by mail-oi1-f172.google.com with SMTP id q25so14241798oiw.0;
        Fri, 12 Nov 2021 11:39:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HjdsaSpAmewvozo7q/CGdIoUTCTor2nmJMCGv/Gt4Yk=;
        b=odAAGc7qLwcf/GgFJv4IzMxVv5B9R/dO+qklRhAhbFYxqLamwHrz6NRW0qql2aN2TC
         ouCak/ySoaYsLw0U2vNzYxjzVgtzgwZVGQ6vvYge7dlQU3M582QBmzFlpXybdIhPjUk0
         SYxf0RF66y8RZ3Dx6B3V/0DWH1ICDZQug0+V6Rvmyw8xDx25jT/gxzmz9L2lM7Rjb951
         InrqMZwL13YY+oV+hR3Og8Sr8fIasy1wIRmqQqNur52ZL9316p7Nr0zptND3JpPLjGIs
         +Z9iYWnQq7uFcibKla01rzBFdrpy02ckIJ+Fg+Y1jtBevrBk/xQVHKgPGnyFHPAKlRLS
         G4ug==
X-Gm-Message-State: AOAM530erF9EooA2C+uFaxlt1eH6nO56E4yWDFixYvur2wg1LBcuSemF
        PT/sg/t0arJIMU5lW4Likg==
X-Google-Smtp-Source: ABdhPJzS4fugKbkP1CBDpp1RTVDCjfbOlPki/eQgoV/X4tVZGm+outEJC2MgziwERrcTwP0OXE6Dvg==
X-Received: by 2002:a05:6808:f01:: with SMTP id m1mr1962790oiw.166.1636745967654;
        Fri, 12 Nov 2021 11:39:27 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id t12sm1240395oor.21.2021.11.12.11.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 11:39:27 -0800 (PST)
Received: (nullmailer pid 3240277 invoked by uid 1000);
        Fri, 12 Nov 2021 19:39:25 -0000
Date:   Fri, 12 Nov 2021 13:39:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     linux-kernel@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Marc Zyngier <maz@kernel.org>,
        Matteo Croce <mcroce@microsoft.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Atish Patra <atish.patra@wdc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Drew Fustini <drew@beagleboard.org>,
        Fu Wei <tekkamanninja@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-clk@vger.kernel.org, Sagar Kadam <sagar.kadam@sifive.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-riscv@lists.infradead.org,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v3 08/16] dt-bindings: reset: Add Starfive JH7100 reset
 bindings
Message-ID: <YY7C7R/vER5FrtVg@robh.at.kernel.org>
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-9-kernel@esmil.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102161125.1144023-9-kernel@esmil.dk>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 02 Nov 2021 17:11:17 +0100, Emil Renner Berthing wrote:
> Add bindings for the reset controller on the JH7100 RISC-V SoC by
> StarFive Ltd. This is a test chip for their upcoming JH7110 SoC.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
>  .../bindings/reset/starfive,jh7100-reset.yaml | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
