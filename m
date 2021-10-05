Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9723D42266A
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Oct 2021 14:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234794AbhJEM2k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Oct 2021 08:28:40 -0400
Received: from mail-ot1-f50.google.com ([209.85.210.50]:44629 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234742AbhJEM2i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Oct 2021 08:28:38 -0400
Received: by mail-ot1-f50.google.com with SMTP id h9-20020a9d2f09000000b005453f95356cso25595480otb.11;
        Tue, 05 Oct 2021 05:26:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=Zy3OCUeRIRdWeAyfAN+6XzSq6pjchypKvDCamwpKcTY=;
        b=aqef3mzXkxhUIR2WwNCdkNahe/5MBf3Wyg6vsFutiuXxL/pOGJTSVvdLhpHk5en3BJ
         AlusyX8GBj/rR4hcv9RyvsDMt81ptWSko4nwh20hzL5xyfYsZBR9AoQfqv/m3UFJPmRY
         E4oKjvqaffX5jevOLjxfdeoX/TMcAjOplaj9dJ5pys/T5/FAkLmhQDc0YA1DyIwKQyie
         BCSMtAhExT4EtS7OC4uq7cEyWtFtohC/dyk3lk9j/otPj54Nq3OKkSB1lQwloM97ACCY
         GhebAC7lnwc+22UDVLsIOjD6NqFsjPNK2mMu5kW53Q8K3HH1LmuCRmxcmMwWEDmSruNw
         9S1g==
X-Gm-Message-State: AOAM531BbAz3dVcIikCwXGujZCLKEM/4lC0fqT4ScQ9lUwosYJOyf3OY
        3HpHTvYbQk0BNgb1auddwg==
X-Google-Smtp-Source: ABdhPJyISGsIXlFgmja5PDXwRNKdwIyLXU8y+ISeGYEBd+6wnCGhCZBTNtmYWOqdIzpR6bZGqRMMzQ==
X-Received: by 2002:a05:6830:1d4d:: with SMTP id p13mr13843725oth.134.1633436807141;
        Tue, 05 Oct 2021 05:26:47 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 63sm1844314ooj.7.2021.10.05.05.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 05:26:46 -0700 (PDT)
Received: (nullmailer pid 3226828 invoked by uid 1000);
        Tue, 05 Oct 2021 12:26:38 -0000
From:   Rob Herring <robh@kernel.org>
To:     Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
In-Reply-To: <1633399920-1537-3-git-send-email-hayashi.kunihiko@socionext.com>
References: <1633399920-1537-1-git-send-email-hayashi.kunihiko@socionext.com> <1633399920-1537-3-git-send-email-hayashi.kunihiko@socionext.com>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: uniphier: Add NX1 pinctrl binding
Date:   Tue, 05 Oct 2021 07:26:38 -0500
Message-Id: <1633436798.742291.3226826.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 05 Oct 2021 11:11:59 +0900, Kunihiko Hayashi wrote:
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

Full log is available here: https://patchwork.ozlabs.org/patch/1536457


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

