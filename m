Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D284C42FD9A
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Oct 2021 23:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238695AbhJOVrn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Oct 2021 17:47:43 -0400
Received: from mail-oi1-f172.google.com ([209.85.167.172]:45921 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243177AbhJOVrm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Oct 2021 17:47:42 -0400
Received: by mail-oi1-f172.google.com with SMTP id z126so14930674oiz.12;
        Fri, 15 Oct 2021 14:45:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=LJEhLIIou4QlpYiQBXYtb6aADp1Ti+/T4dNd2erHAd8=;
        b=Wqtpb+l6PoojfqQ12jR3iZ2mGW+nQ4hCIqB2Q9HqgQ1Bb0P3YFTcWFD/Ge52Jkjvah
         2NmBLh6+yQBIzFmAmuy9ht6t7I852vE5f6bW2xRNal2UwNvEPhZG9gPiTbrjdOc1y7D4
         PqdU93NFf1+RwXDPjhtGgKGbsn0IYQSI0/zDHTit1FtMgsZGZ4UlVHwXA6JYrxzNcqUY
         cXLUskwBuPikiwZeWEsBNO1iBDnvs1y9bFhVfN5HCmm7lzuqBuwAZFtUOLImQ0gkVU9D
         LUf5I8IqADMMx0zQ8Qaeoqnw+zZ1h53fYirzgXDmb4k8eQWNarLEVfRSesiFyj0hwGA1
         SaHg==
X-Gm-Message-State: AOAM531UWEl71jbO7e8Jn1nW/YUYiZotFcJAttIdaLDQM90xtqb7R/yt
        Dx/nHOetKoC03QFgduw3Ug==
X-Google-Smtp-Source: ABdhPJy7U0aI1r0RqDrCcc4qml4I9+NdEi9+/IDDXC2G+2YE7TgwRK3w6C/JFrks7pWk7d0JcdTklw==
X-Received: by 2002:a05:6808:3c2:: with SMTP id o2mr10315386oie.15.1634334335025;
        Fri, 15 Oct 2021 14:45:35 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id k3sm1451154otn.16.2021.10.15.14.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 14:45:34 -0700 (PDT)
Received: (nullmailer pid 2254017 invoked by uid 1000);
        Fri, 15 Oct 2021 21:45:31 -0000
From:   Rob Herring <robh@kernel.org>
To:     Horatiu Vultur <horatiu.vultur@microchip.com>
Cc:     robh+dt@kernel.org, UNGLinuxDriver@microchip.com,
        linux-arm-kernel@lists.infradead.org, p.zabel@pengutronix.de,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Steen.Hegelund@microchip.com,
        lars.povlsen@microchip.com, linus.walleij@linaro.org
In-Reply-To: <20211015144259.219909-2-horatiu.vultur@microchip.com>
References: <20211015144259.219909-1-horatiu.vultur@microchip.com> <20211015144259.219909-2-horatiu.vultur@microchip.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: pinctrl: pinctrl-microchip-sgpio: Add reset binding
Date:   Fri, 15 Oct 2021 16:45:31 -0500
Message-Id: <1634334331.621918.2254016.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 15 Oct 2021 16:42:58 +0200, Horatiu Vultur wrote:
> This describes the new binding which allows to call a reset driver from
> the pinctrl-microchip-sgpio driver.
> 
> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> ---
>  .../devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml    | 3 +++
>  1 file changed, 3 insertions(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1541735


gpio@61101036c: 'reset-names' does not match any of the regexes: '^gpio@[0-1]$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/microchip/sparx5_pcb125.dt.yaml
	arch/arm64/boot/dts/microchip/sparx5_pcb134.dt.yaml
	arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dt.yaml
	arch/arm64/boot/dts/microchip/sparx5_pcb135.dt.yaml
	arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dt.yaml

gpio@611010484: 'reset-names' does not match any of the regexes: '^gpio@[0-1]$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/microchip/sparx5_pcb125.dt.yaml
	arch/arm64/boot/dts/microchip/sparx5_pcb134.dt.yaml
	arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dt.yaml
	arch/arm64/boot/dts/microchip/sparx5_pcb135.dt.yaml
	arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dt.yaml

gpio@61101059c: 'reset-names' does not match any of the regexes: '^gpio@[0-1]$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/microchip/sparx5_pcb125.dt.yaml
	arch/arm64/boot/dts/microchip/sparx5_pcb134.dt.yaml
	arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dt.yaml
	arch/arm64/boot/dts/microchip/sparx5_pcb135.dt.yaml
	arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dt.yaml

