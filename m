Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 766FD443ADC
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Nov 2021 02:20:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233296AbhKCBXW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 21:23:22 -0400
Received: from mail-oi1-f174.google.com ([209.85.167.174]:45903 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231495AbhKCBXR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 21:23:17 -0400
Received: by mail-oi1-f174.google.com with SMTP id u2so1414700oiu.12;
        Tue, 02 Nov 2021 18:20:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=7teodorTO0INls1DjJkT3je8WWhcqqBYQt3N+yxioBA=;
        b=EDt6+4TgVBQ4iljRIN0mfmPqMrlbUCe825b30v6Dqwn9rmHUIcwV0s1fsgZ649p123
         4IX/Ni44Evc3GVZn2WQ9ejn6OtirCBTVEWH17H6C2eMZk+54+vplfsXjpgH58Yh0yMvh
         LazMIR8MR9qFpM8mtixarM8Ysp/vpwlqZi4J4nPEr4xxQJ2XrK479qSIZMPzg8GTmyhQ
         AZ2m86o2XEUmsQj6nH81V6axECxTeEAVcML219kbkNoEmW8GHWV1K/+kWcP9UZjnb6vH
         Lx0CSvVD0xrh1RRr6t5KhgDDp4ZubA2RBQHYMSN/S/o2aqK1zPjV0RweAa/0fa8msvZQ
         YX/g==
X-Gm-Message-State: AOAM531vn0Y3/nQZDxx5OWEyx3Pt2YUTVsuWdrIXQbADXR99fV8UrCQr
        A3MAsPEevjtqPWZ8o8DaCw==
X-Google-Smtp-Source: ABdhPJz+XiqXqa13HySwUt3ExapyVdCd7ov56jToPTJLR5fauSFywxLvyUKmpF4WrlpT7UIBwfhNfA==
X-Received: by 2002:a05:6808:1408:: with SMTP id w8mr8047512oiv.128.1635902440976;
        Tue, 02 Nov 2021 18:20:40 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id g21sm174822ooc.31.2021.11.02.18.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 18:20:39 -0700 (PDT)
Received: (nullmailer pid 3880382 invoked by uid 1000);
        Wed, 03 Nov 2021 01:20:37 -0000
From:   Rob Herring <robh@kernel.org>
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     Anup Patel <anup.patel@wdc.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-serial@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Atish Patra <atish.patra@wdc.com>,
        Marc Zyngier <maz@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-riscv@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Drew Fustini <drew@beagleboard.org>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        linux-gpio@vger.kernel.org, Fu Wei <tekkamanninja@gmail.com>
In-Reply-To: <20211102161125.1144023-12-kernel@esmil.dk>
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-12-kernel@esmil.dk>
Subject: Re: [PATCH v3 11/16] dt-bindings: pinctrl: Add StarFive JH7100 bindings
Date:   Tue, 02 Nov 2021 20:20:37 -0500
Message-Id: <1635902437.610819.3880381.nullmailer@robh.at.kernel.org>
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

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.example.dts:19:18: fatal error: dt-bindings/clock/starfive-jh7100.h: No such file or directory
   19 |         #include <dt-bindings/clock/starfive-jh7100.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1549835

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

