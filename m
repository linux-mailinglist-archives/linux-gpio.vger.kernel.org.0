Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 314D72F3DE9
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Jan 2021 01:44:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732333AbhALVxp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Jan 2021 16:53:45 -0500
Received: from mail-oi1-f171.google.com ([209.85.167.171]:44997 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726952AbhALVxk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Jan 2021 16:53:40 -0500
Received: by mail-oi1-f171.google.com with SMTP id d189so3954141oig.11;
        Tue, 12 Jan 2021 13:53:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=ngbxvbs9Rj1earjppnfOPpPMVrmf1dzRw0Kyw1CoJEk=;
        b=Rla/h2rBLLWLLF5ao66IH9OMMGUfdZwdUjT89DfMdrlTxW8QqhzY4gLtgQG0+RYaLS
         6NJZhGi8un46J2NbZBrXfqajP/5uXStRzPg3VnmajuG0X62c6DzjorePlOg1UGOMpWrQ
         tLNBKvSWF8tmBzsDhCh2But0i/iYte3AMTX2TjlyL+WJ9IL8JRoUDTY8GaaW19F9UI9B
         U9Ple/QX1tkPnHXoLqBEECZCjY8k9Ul+hZPeniZ6uzSXzFDgD3t2YZqKJKHk8Gj6Vefp
         5+G3ttWiFjBTr1+Yhb8dKLuYWuo/oilP6qOqMnr/smhuP59juNSKOdGX9kPZi+PgMUnu
         Dwfw==
X-Gm-Message-State: AOAM530zwCDhMBEevGNe1knu/idfN+fXzTJRkSbOOC0trIBTN61UcaqJ
        XqLQMGwlMhA+IdCzfiut9mcXkoo9tg==
X-Google-Smtp-Source: ABdhPJw5qFKjKiuF5jl8AImxNuNfc8/UkpJDKdATyLyXBwQFhEavjlqrxbEsTxjgXYJm3KcYv3TU8w==
X-Received: by 2002:aca:df0b:: with SMTP id w11mr719128oig.111.1610488378965;
        Tue, 12 Jan 2021 13:52:58 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h2sm842833ooa.25.2021.01.12.13.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 13:52:58 -0800 (PST)
Received: (nullmailer pid 1037769 invoked by uid 1000);
        Tue, 12 Jan 2021 21:52:56 -0000
From:   Rob Herring <robh@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     martin.botka@somainline.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linus.walleij@linaro.org,
        marijn.suijten@somainline.org, linux-gpio@vger.kernel.org,
        robh+dt@kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org
In-Reply-To: <20210111182928.587285-2-angelogioacchino.delregno@somainline.org>
References: <20210111182928.587285-1-angelogioacchino.delregno@somainline.org> <20210111182928.587285-2-angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: pinctrl: Add bindings for Awinic AW9523/AW9523B
Date:   Tue, 12 Jan 2021 15:52:56 -0600
Message-Id: <1610488376.946823.1037768.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 11 Jan 2021 19:29:28 +0100, AngeloGioacchino Del Regno wrote:
> Add bindings for the Awinic AW9523/AW9523B I2C GPIO Expander driver.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  .../pinctrl/awinic,aw9523-pinctrl.yaml        | 112 ++++++++++++++++++
>  1 file changed, 112 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.example.dts:25.21-34: Warning (reg_format): /example-0/i2c_node/gpio-expander@58:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.example.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.example.dt.yaml: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.example.dts:23.30-34.15: Warning (avoid_default_addr_size): /example-0/i2c_node/gpio-expander@58: Relying on default #address-cells value
Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.example.dts:23.30-34.15: Warning (avoid_default_addr_size): /example-0/i2c_node/gpio-expander@58: Relying on default #size-cells value
Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.example.dt.yaml: Warning (unique_unit_address): Failed prerequisite 'avoid_default_addr_size'

See https://patchwork.ozlabs.org/patch/1424757

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

