Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B40D42C8E3
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Oct 2021 20:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238518AbhJMSmB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Oct 2021 14:42:01 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:36506 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237656AbhJMSl7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Oct 2021 14:41:59 -0400
Received: by mail-ot1-f46.google.com with SMTP id p6-20020a9d7446000000b0054e6bb223f3so4957051otk.3;
        Wed, 13 Oct 2021 11:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=aa+o+UEmzQ4msWcFbeNJ9FBiQkiCPc74zgsEuSsVOHI=;
        b=xlgkdbmlRoNwhoKYG+US1lRPkHTMp0InMLvz58+9OlhDuGVUGjhZHcLyFe5LRV7HRr
         arN0uL0NbUOAhHLa1XkT+3QOtLsvW+/s3je/claqIQKH+QmfuyAKmNjrTlLfZ5eAXL7W
         vZrRQ4iXEM2e+r4KsT+jKrM+GmZ7mTynO+4ocheu+4tZsCoyfIOvLy3BQWEwo8KcDUmq
         XULbt5m8K4TWzLM6No7qyiLy9HfWzeeJJAs7Mm8ZTkkpjEkWDQYhP9S/Olg1BD7i76Ux
         lxLSj5p3AsVzi1L8Pm8tbtW57a+PHiIWjydY9cYFGHVPSQGTOMGrK/e7YN9LqX9y8r1C
         UQVw==
X-Gm-Message-State: AOAM532NOHsTvgUMrIAot//zGEepZhSqqArR0+Pv75Ju/cZHWnasU2CM
        ChWElrZSKvaDB4eKaOZHeg==
X-Google-Smtp-Source: ABdhPJyS8F4OEoCJ+h6d61xQGrmUpNOb8cRogGGY/YZJolLcUKW7EfCIoSHsqMFYF4Mcw5yRCGSEoA==
X-Received: by 2002:a9d:84d:: with SMTP id 71mr767888oty.190.1634150395859;
        Wed, 13 Oct 2021 11:39:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id q15sm67453otm.15.2021.10.13.11.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 11:39:55 -0700 (PDT)
Received: (nullmailer pid 1324766 invoked by uid 1000);
        Wed, 13 Oct 2021 18:39:52 -0000
From:   Rob Herring <robh@kernel.org>
To:     Horatiu Vultur <horatiu.vultur@microchip.com>
Cc:     linus.walleij@linaro.org, lars.povlsen@microchip.com,
        robh+dt@kernel.org, p.zabel@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        UNGLinuxDriver@microchip.com, Steen.Hegelund@microchip.com
In-Reply-To: <20211013084217.2298553-2-horatiu.vultur@microchip.com>
References: <20211013084217.2298553-1-horatiu.vultur@microchip.com> <20211013084217.2298553-2-horatiu.vultur@microchip.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: pinctrl-microchip-sgpio: Add reset binding
Date:   Wed, 13 Oct 2021 13:39:52 -0500
Message-Id: <1634150392.542575.1324765.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 13 Oct 2021 10:42:16 +0200, Horatiu Vultur wrote:
> This describes the new binding for calling the reset driver in the
> pinctrl-microchip-sgpio driver.
> 
> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> ---
>  .../devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1540276


gpio@61101036c: 'reset-names', 'resets' do not match any of the regexes: '^gpio@[0-1]$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/microchip/sparx5_pcb125.dt.yaml
	arch/arm64/boot/dts/microchip/sparx5_pcb134.dt.yaml
	arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dt.yaml
	arch/arm64/boot/dts/microchip/sparx5_pcb135.dt.yaml
	arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dt.yaml

gpio@611010484: 'reset-names', 'resets' do not match any of the regexes: '^gpio@[0-1]$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/microchip/sparx5_pcb125.dt.yaml
	arch/arm64/boot/dts/microchip/sparx5_pcb134.dt.yaml
	arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dt.yaml
	arch/arm64/boot/dts/microchip/sparx5_pcb135.dt.yaml
	arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dt.yaml

gpio@61101059c: 'reset-names', 'resets' do not match any of the regexes: '^gpio@[0-1]$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/microchip/sparx5_pcb125.dt.yaml
	arch/arm64/boot/dts/microchip/sparx5_pcb134.dt.yaml
	arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dt.yaml
	arch/arm64/boot/dts/microchip/sparx5_pcb135.dt.yaml
	arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dt.yaml

