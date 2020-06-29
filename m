Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4757620E7E1
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 00:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbgF2WBV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jun 2020 18:01:21 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:39879 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404855AbgF2WBU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jun 2020 18:01:20 -0400
Received: by mail-io1-f68.google.com with SMTP id f23so18885604iof.6;
        Mon, 29 Jun 2020 15:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v/KUmmRiKcWgfKCyfnFrzAagW5p/jFMXIxMzqZIoYfY=;
        b=LupuPoV2llzNCorpeUSvpgFPVCw3uXTLJRUjtxM8QiPHMyhv/6qkYn+TzcCncAcCpx
         UafSf++EOIHmUWlcdZpX81j6WZhabkuKamfO5ErnoK5q0QcV8G3ffMVjMnZihZbtruKw
         XhA7ku96rIvktauHY2V0iaL9AjGSjyeTPP1MmTDnulxAn8Zwzv0IGpJkyqL9mn2GfojT
         kYIY91T68/Yswbg8zQM/sRD0mDGIRzajK2rwLfokSHRriYfcQvu9FmvIdGeqlxKWUfU5
         dW8kPBi4wyRbhMPi9WGLzA/c/+nKedqOOVNfDKPJLD3wKn3ysJvJ6brxT7an73EhM+MZ
         bk1g==
X-Gm-Message-State: AOAM531u69pQsssKPUcNz2OT5bkaI/rz0lWZbPPbXXLJu2FKcJPJdpA0
        HypcAHE4jwmPAD50JmFJpA==
X-Google-Smtp-Source: ABdhPJx3GoxKdwtb+VbFNr2bGORwXmR+865eXNvVgw1BleWY0FbMaV7pPRLHLXJWpHXJbxupf5/0ag==
X-Received: by 2002:a02:7818:: with SMTP id p24mr20445841jac.131.1593468079258;
        Mon, 29 Jun 2020 15:01:19 -0700 (PDT)
Received: from xps15 ([64.188.179.255])
        by smtp.gmail.com with ESMTPSA id v62sm668402ila.37.2020.06.29.15.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 15:01:18 -0700 (PDT)
Received: (nullmailer pid 3012987 invoked by uid 1000);
        Mon, 29 Jun 2020 22:01:17 -0000
Date:   Mon, 29 Jun 2020 16:01:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sungbo Eo <mans0n@gorani.run>
Cc:     linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: gpio: Add bindings for NXP PCA9570
Message-ID: <20200629220117.GA3012245@bogus>
References: <20200625075957.364273-1-mans0n@gorani.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200625075957.364273-1-mans0n@gorani.run>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 25 Jun 2020 16:59:57 +0900, Sungbo Eo wrote:
> This patch adds device tree bindings for the NXP PCA9570,
> a 4-bit I2C GPO expander.
> 
> Signed-off-by: Sungbo Eo <mans0n@gorani.run>
> ---
> I don't feel I can really maintain this driver, but it seems all yaml docs
> have a maintainers field so I just added it...
> ---
>  .../bindings/gpio/gpio-pca9570.yaml           | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/gpio/gpio-pca9570.example.dts:21.13-26: Warning (reg_format): /example-0/gpio@24:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
Documentation/devicetree/bindings/gpio/gpio-pca9570.example.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/gpio/gpio-pca9570.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/gpio/gpio-pca9570.example.dt.yaml: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/gpio/gpio-pca9570.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/gpio/gpio-pca9570.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpio/gpio-pca9570.example.dt.yaml: example-0: gpio@24:reg:0: [36] is too short


See https://patchwork.ozlabs.org/patch/1316796

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

