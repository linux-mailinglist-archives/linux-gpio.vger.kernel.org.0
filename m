Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79F8C424679
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Oct 2021 21:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239225AbhJFTKN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Oct 2021 15:10:13 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:43653 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239194AbhJFTKM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Oct 2021 15:10:12 -0400
Received: by mail-oi1-f176.google.com with SMTP id o4so5424125oia.10;
        Wed, 06 Oct 2021 12:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=0xIolMsWNMus3qJwhgGl45wy3tQx3DQv3XGTqM+vTLk=;
        b=F29pBaEp/sNsmqZ7hwL1hPK73Xe2kCSUlxcfjoM8UArsY3bohdmbw/dfSYPUGQgjST
         UQLYLQ4X2L6RikpIGeJ7H4QzmVUE30jtxZTjeXtfdqeQpPY1GQ+4KW1HZ3buHH+Gz6cL
         dyiYXPnhTz+qnT8V77kzQ7pnfKcJnQc4lORX0GYC76P26fJWaSQI+M++ue2aWJ7vNc9F
         wNw66E/IBNP1+AlZbrO5cCMCOBqnW/JQxr1Z/XcWP/KOBI4IBPMSrzgUD1F0Ga2Yz3Tk
         f8LTjnnkTf8GkyP4O1AwBbiis7H7cPCvWAM84OnW9gmUzeNOWCF3tjYTetBPrPT8F+tF
         mitw==
X-Gm-Message-State: AOAM530OQO6q8Z4J3b0lYZ3sudrejsehe1Qpy/PGVH2mXCki2swV3exF
        01ojBv4B+IaOp+DsuUOYwA==
X-Google-Smtp-Source: ABdhPJy1kBzMU6zdZ+h8Ykw9XssXwJUCydJJOI1gleXOB7lXtcoPgfmyimwEKXHkOXkmkG62VJQYow==
X-Received: by 2002:a05:6808:1a04:: with SMTP id bk4mr31213oib.85.1633547299133;
        Wed, 06 Oct 2021 12:08:19 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id e28sm909490oth.40.2021.10.06.12.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 12:08:18 -0700 (PDT)
Received: (nullmailer pid 2218066 invoked by uid 1000);
        Wed, 06 Oct 2021 19:08:13 -0000
From:   Rob Herring <robh@kernel.org>
To:     Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Masami Hiramatsu <mhiramat@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <1633518606-8298-3-git-send-email-hayashi.kunihiko@socionext.com>
References: <1633518606-8298-1-git-send-email-hayashi.kunihiko@socionext.com> <1633518606-8298-3-git-send-email-hayashi.kunihiko@socionext.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: uniphier: Add NX1 pinctrl binding
Date:   Wed, 06 Oct 2021 14:08:13 -0500
Message-Id: <1633547293.534465.2218065.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 06 Oct 2021 20:10:05 +0900, Kunihiko Hayashi wrote:
> Update pinctrl binding document for UniPhier NX1 SoC.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---
>  .../devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1537066


pinctrl: 'ain1', 'ain2', 'ainiec1', 'aout', 'aout1', 'aout2', 'aout3', 'aoutiec1', 'aoutiec2', 'emmc', 'ether-mii', 'ether-rgmii', 'ether-rmii', 'ether1-rgmii', 'ether1-rmii', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'nand', 'nand2cs', 'pcie', 'sd', 'sd-uhs', 'sd1', 'spi0', 'spi1', 'spi2', 'spi3', 'system-bus', 'uart0', 'uart1', 'uart2', 'uart3', 'usb0', 'usb1', 'usb2', 'usb3' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/socionext/uniphier-ld11-global.dt.yaml
	arch/arm64/boot/dts/socionext/uniphier-ld11-ref.dt.yaml
	arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.dt.yaml
	arch/arm64/boot/dts/socionext/uniphier-ld20-global.dt.yaml
	arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dt.yaml
	arch/arm64/boot/dts/socionext/uniphier-pxs3-ref.dt.yaml
	arch/arm/boot/dts/uniphier-ld4-ref.dt.yaml
	arch/arm/boot/dts/uniphier-ld6b-ref.dt.yaml
	arch/arm/boot/dts/uniphier-pro4-ace.dt.yaml
	arch/arm/boot/dts/uniphier-pro4-ref.dt.yaml
	arch/arm/boot/dts/uniphier-pro4-sanji.dt.yaml
	arch/arm/boot/dts/uniphier-pxs2-gentil.dt.yaml
	arch/arm/boot/dts/uniphier-pxs2-vodka.dt.yaml
	arch/arm/boot/dts/uniphier-sld8-ref.dt.yaml

