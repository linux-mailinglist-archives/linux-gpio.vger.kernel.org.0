Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A148C44ED76
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Nov 2021 20:41:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232735AbhKLTor (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Nov 2021 14:44:47 -0500
Received: from mail-oi1-f182.google.com ([209.85.167.182]:46815 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbhKLTor (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Nov 2021 14:44:47 -0500
Received: by mail-oi1-f182.google.com with SMTP id s139so19729252oie.13;
        Fri, 12 Nov 2021 11:41:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=REnFA6XjBzbaJieuVI+3pKSNQf8y2uvx/eALnpSC2h8=;
        b=zjkxNiibT3foDWBjcWPw4GeIVrsxVdutEzwhak0ltvEQTv0yGi7/S15wCKmVmIOfk4
         HXQ42nF0eR5DyOGix6NyAURTbpbUBZL7HInWcng3vs4pSsNvOGcWwc+YwrlpX8/zdX7M
         VBkH02Miwpr5PxFpc1M/iurcC83MHMFHwLyLlIrdtx3qM7JSm0I+vPTMjkJSAAG/9H/Z
         KcA751ki1W9KUioRU0auJRYrOv5MXtfGR8DcrXjqdBvUduvS3Qn/E96LYesFFgay0V9j
         sa9H2SzSp4d8VeQIa4jQOZdHJA99TCWozOBXJpcnHp8jciPw/CNz1gmuGU8+s0sW9/zW
         8yYQ==
X-Gm-Message-State: AOAM532XjR7/dQOcB6eWoV4/WxtotnjjulbYWpMu4NZDkF8pXbTStM2W
        VFwqvAJW9LB0ApRaH9QXcw==
X-Google-Smtp-Source: ABdhPJzcS2l/5MNH+2SzstpCYLnxRNd0oaOSeSF7EvZ53DH9N0wqYiTu9pw7lRw9oWf2KEUgJ3ArdQ==
X-Received: by 2002:a54:4d89:: with SMTP id y9mr14782184oix.127.1636746115578;
        Fri, 12 Nov 2021 11:41:55 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id a23sm1202937ool.3.2021.11.12.11.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 11:41:55 -0800 (PST)
Received: (nullmailer pid 3243939 invoked by uid 1000);
        Fri, 12 Nov 2021 19:41:53 -0000
Date:   Fri, 12 Nov 2021 13:41:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     Michael Zhu <michael.zhu@starfivetech.com>,
        linux-kernel@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-clk@vger.kernel.org, Sagar Kadam <sagar.kadam@sifive.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-gpio@vger.kernel.org, Fu Wei <tekkamanninja@gmail.com>,
        Atish Patra <atish.patra@wdc.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Drew Fustini <drew@beagleboard.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-serial@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 11/16] dt-bindings: pinctrl: Add StarFive JH7100
 bindings
Message-ID: <YY7DgSPChPpXzA9j@robh.at.kernel.org>
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-12-kernel@esmil.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102161125.1144023-12-kernel@esmil.dk>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 02 Nov 2021 17:11:20 +0100, Emil Renner Berthing wrote:
> Add bindings for the GPIO/pin controller on the JH7100 RISC-V SoC by
> StarFive Ltd. This is a test chip for their upcoming JH7110 SoC.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
> 
> @Linus: I'm really struggling to find a good way to describe how pin
> muxing works on the JH7100. As you can see I've now resorted to
> ascii-art to try to explain it, but please let me know if it's still
> unclear.
> 
>  .../pinctrl/starfive,jh7100-pinctrl.yaml      | 307 ++++++++++++++++++
>  1 file changed, 307 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
