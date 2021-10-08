Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC67426292
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 04:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242336AbhJHCsa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 22:48:30 -0400
Received: from mail-oi1-f179.google.com ([209.85.167.179]:46851 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238501AbhJHCsW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Oct 2021 22:48:22 -0400
Received: by mail-oi1-f179.google.com with SMTP id o204so3671877oih.13;
        Thu, 07 Oct 2021 19:46:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=cPpRb0QBP2JiLKyoMhIzAbdRIdHdbYOlADkuzKT47pg=;
        b=aKlEgTsdS4pqWBB2R7V2tIwwhu83bZ28J0iS1oWAYsuGXOq9Yxm0nxCPwdOfsMlR+0
         WjTXRdE0swaw/m6DqymDCterwKsvfZe7o686SLtU2rTnOwR2kGdLQaF8pdTzeC2+NfDM
         Of+sZdi7gLk8u8SmJSviStOexnYlYNAJ2/PIqS/0Sz9FDjq4UtmTHAcyKRvoT5puQn4y
         i791U4OIIu9YkyH3a835WOBO63QDyedx+11xhtdb+qpCoY9xQ7wVmPYyV+2Gsy7wjNf+
         1yp1cJCPj6NHpCOW1mSZXuaSyT7LFKcTLi0N6bDdjYFn82Wpz1kMVkezgbAo3mA9pAeD
         He3w==
X-Gm-Message-State: AOAM533StxfyJ9LrhDqXuiLDb0ud+OPdTfcLm+7CHjuC07TKC4FLK2Wa
        bLJ47Zhx2p6f8/6kYZgpag==
X-Google-Smtp-Source: ABdhPJxgrIQjYWL/IF+9Z8mSiQAgd+jPgZYw+Hzi3qtpAjlJZ7ty5sr40ipW3U+WL07hxoQ3MCAS6w==
X-Received: by 2002:a05:6808:cf:: with SMTP id t15mr5696336oic.93.1633661186490;
        Thu, 07 Oct 2021 19:46:26 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id l8sm304335oii.57.2021.10.07.19.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 19:46:25 -0700 (PDT)
Received: (nullmailer pid 1409604 invoked by uid 1000);
        Fri, 08 Oct 2021 02:46:12 -0000
From:   Rob Herring <robh@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     linus.walleij@linaro.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        heiko@sntech.de, robh+dt@kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20211007144019.7461-1-jbx6244@gmail.com>
References: <20211007144019.7461-1-jbx6244@gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: convert rockchip,pinctrl.txt to YAML
Date:   Thu, 07 Oct 2021 21:46:12 -0500
Message-Id: <1633661172.660863.1409603.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 07 Oct 2021 16:40:17 +0200, Johan Jonker wrote:
> Convert rockchip,pinctrl.txt to YAML
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
> 
> Changed V3:
>    Add uint32-matrix type reference.
>    Add required.
>    Restyle.
> 
> Changed V2:
>    Add '|' to maintain the paragraphs.
>    Change gpio patternProperties.
>    Move description to items.
>    Remove type array.
>    Restyle.
> ---
>  .../bindings/pinctrl/rockchip,pinctrl.txt     | 114 -----------
>  .../bindings/pinctrl/rockchip,pinctrl.yaml    | 184 ++++++++++++++++++
>  2 files changed, 184 insertions(+), 114 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1537758


pinctrl: gpio0@11110000:clocks: [[2, 320]] is not of type 'object'
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio0@11110000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio0@11110000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio0@11110000:gpio-controller: True is not of type 'object'
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio0@11110000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio0@11110000:interrupt-controller: True is not of type 'object'
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio0@11110000:interrupts: [[0, 51, 4]] is not of type 'object'
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio0@11110000:reg: [[286326784, 256]] is not of type 'object'
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio0@2000a000:clocks: [[2, 341]] is not of type 'object'
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio0@2000a000:compatible: ['rockchip,rk3188-gpio-bank0'] is not of type 'object'
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio0@2000a000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio0@2000a000:gpio-controller: True is not of type 'object'
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio0@2000a000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio0@2000a000:interrupt-controller: True is not of type 'object'
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio0@2000a000:interrupts: [[0, 54, 4]] is not of type 'object'
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio0@2000a000:phandle: [[26]] is not of type 'object'
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml

pinctrl: gpio0@2000a000:phandle: [[30]] is not of type 'object'
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio0@2000a000:phandle: [[8]] is not of type 'object'
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml

pinctrl: gpio0@2000a000:reg: [[536911872, 256]] is not of type 'object'
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio0@20030000:clocks: [[2, 272]] is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio0@20030000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio0@20030000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio0@20030000:gpio-controller: True is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio0@20030000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio0@20030000:interrupt-controller: True is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio0@20030000:interrupts: [[0, 40, 4]] is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio0@20030000:phandle: [[27]] is not of type 'object'
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio0@20030000:phandle: [[29]] is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml

pinctrl: gpio0@20030000:reg: [[537067520, 256]] is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio0@20034000:clocks: [[2, 341]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml

pinctrl: gpio0@20034000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml

pinctrl: gpio0@20034000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml

pinctrl: gpio0@20034000:gpio-controller: True is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml

pinctrl: gpio0@20034000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml

pinctrl: gpio0@20034000:interrupt-controller: True is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml

pinctrl: gpio0@20034000:interrupts: [[0, 54, 4]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml

pinctrl: gpio0@20034000:phandle: [[62]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml

pinctrl: gpio0@20034000:phandle: [[95]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml

pinctrl: gpio0@20034000:reg: [[537083904, 256]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml

pinctrl: gpio0@ff040000:clocks: [[36, 20]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio0@ff040000:clocks: [[37, 20]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml

pinctrl: gpio0@ff040000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio0@ff040000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio0@ff040000:gpio-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio0@ff040000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio0@ff040000:interrupt-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio0@ff040000:interrupts: [[0, 3, 4]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio0@ff040000:phandle: [[67]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio0@ff040000:phandle: [[69]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml

pinctrl: gpio0@ff040000:phandle: [[70]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml

pinctrl: gpio0@ff040000:reg: [[0, 4278452224, 0, 256]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio0@ff210000:clocks: [[2, 200]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio0@ff210000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio0@ff210000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio0@ff210000:gpio-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio0@ff210000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio0@ff210000:interrupt-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio0@ff210000:interrupts: [[0, 51, 4]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio0@ff210000:phandle: [[103]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio0@ff210000:phandle: [[104]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml

pinctrl: gpio0@ff210000:phandle: [[106]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml

pinctrl: gpio0@ff210000:phandle: [[97]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml

pinctrl: gpio0@ff210000:phandle: [[98]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml

pinctrl: gpio0@ff210000:phandle: [[99]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml

pinctrl: gpio0@ff210000:reg: [[0, 4280352768, 0, 256]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio0@ff220000:clocks: [[2, 215]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio0@ff220000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio0@ff220000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio0@ff220000:gpio-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio0@ff220000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio0@ff220000:interrupt-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio0@ff220000:interrupts: [[0, 40, 4]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio0@ff220000:phandle: [[89]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml

pinctrl: gpio0@ff220000:phandle: [[90]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio0@ff220000:reg: [[0, 4280418304, 0, 256]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio0@ff720000:clocks: [[112, 23]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml

pinctrl: gpio0@ff720000:clocks: [[113, 23]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml

pinctrl: gpio0@ff720000:clocks: [[115, 23]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml

pinctrl: gpio0@ff720000:clocks: [[116, 23]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml

pinctrl: gpio0@ff720000:clocks: [[118, 23]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml

pinctrl: gpio0@ff720000:clocks: [[119, 23]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml

pinctrl: gpio0@ff720000:clocks: [[120, 23]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio0@ff720000:clocks: [[121, 23]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml

pinctrl: gpio0@ff720000:clocks: [[122, 23]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml

pinctrl: gpio0@ff720000:clocks: [[124, 23]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml

pinctrl: gpio0@ff720000:clocks: [[125, 23]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml

pinctrl: gpio0@ff720000:clocks: [[126, 23]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml

pinctrl: gpio0@ff720000:clocks: [[127, 23]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml

pinctrl: gpio0@ff720000:clocks: [[130, 23]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml

pinctrl: gpio0@ff720000:clocks: [[98, 23]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml

pinctrl: gpio0@ff720000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio0@ff720000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio0@ff720000:gpio-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio0@ff720000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio0@ff720000:interrupt-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio0@ff720000:interrupts: [[0, 14, 4, 0]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio0@ff720000:phandle: [[173]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml

pinctrl: gpio0@ff720000:phandle: [[21]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml

pinctrl: gpio0@ff720000:phandle: [[22]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml

pinctrl: gpio0@ff720000:phandle: [[28]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml

pinctrl: gpio0@ff720000:phandle: [[31]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml

pinctrl: gpio0@ff720000:phandle: [[32]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml

pinctrl: gpio0@ff720000:phandle: [[33]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml

pinctrl: gpio0@ff720000:phandle: [[34]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml

pinctrl: gpio0@ff720000:phandle: [[35]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml

pinctrl: gpio0@ff720000:phandle: [[36]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml

pinctrl: gpio0@ff720000:phandle: [[37]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml

pinctrl: gpio0@ff720000:phandle: [[39]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml

pinctrl: gpio0@ff720000:phandle: [[56]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio0@ff720000:reg: [[0, 4285661184, 0, 256]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio0@ff750000:clocks: [[10, 320]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml

pinctrl: gpio0@ff750000:clocks: [[11, 320]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml

pinctrl: gpio0@ff750000:clocks: [[7, 320]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio0@ff750000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio0@ff750000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio0@ff750000:gpio-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio0@ff750000:gpio-line-names: ['PMIC_SLEEP_AP', 'DDRIO_PWROFF', 'DDRIO_RETEN', 'TS3A227E_INT_L', 'PMIC_INT_L', 'PWR_KEY_L', 'AP_LID_INT_L', 'EC_IN_RW', 'AC_PRESENT_AP', 'RECOVERY_SW_L', 'OTP_OUT', 'HOST1_PWR_EN', 'USBOTG_PWREN_H', 'AP_WARM_RESET_H', 'nFALUT2', 'I2C0_SDA_PMIC', 'I2C0_SCL_PMIC', 'SUSPEND_L', 'USB_INT'] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml

pinctrl: gpio0@ff750000:gpio-line-names: ['PMIC_SLEEP_AP', 'DDRIO_PWROFF', 'DDRIO_RETEN', 'TS3A227E_INT_L', 'PMIC_INT_L', 'PWR_KEY_L', 'AP_LID_INT_L', 'EC_IN_RW', 'AC_PRESENT_AP', 'RECOVERY_SW_L', 'OTP_OUT', 'HOST1_PWR_EN', 'USBOTG_PWREN_H', 'AP_WARM_RESET_H', 'nFAULT2', 'I2C0_SDA_PMIC', 'I2C0_SCL_PMIC', 'SUSPEND_L', 'USB_INT'] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml

pinctrl: gpio0@ff750000:gpio-line-names: ['PMIC_SLEEP_AP', 'DDRIO_PWROFF', 'DDRIO_RETEN', 'TS3A227E_INT_L', 'PMIC_INT_L', 'PWR_KEY_L', 'HUB_USB1_nFALUT', 'PHY_PMEB', 'PHY_INT', 'RECOVERY_SW_L', 'OTP_OUT', '', 'USB_OTG_POWER_EN', 'AP_WARM_RESET_H', 'USB_OTG_nFALUT', 'I2C0_SDA_PMIC', 'I2C0_SCL_PMIC', 'DEVMODE_L', 'USB_INT'] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml

pinctrl: gpio0@ff750000:gpio-line-names: ['PMIC_SLEEP_AP', '', '', '', 'PMIC_INT_L', 'POWER_BUTTON_L', '', '', '', 'RECOVERY_SW_L', 'OT_RESET', '', '', 'AP_WARM_RESET_H', '', 'I2C0_SDA_PMIC', 'I2C0_SCL_PMIC', '', 'nFALUT'] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml

pinctrl: gpio0@ff750000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio0@ff750000:interrupt-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio0@ff750000:interrupts: [[0, 81, 4]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio0@ff750000:phandle: [[126]] is not of type 'object'
	arch/arm/boot/dts/rk3288-miqi.dt.yaml

pinctrl: gpio0@ff750000:phandle: [[139]] is not of type 'object'
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml

pinctrl: gpio0@ff750000:phandle: [[41]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml

pinctrl: gpio0@ff750000:phandle: [[45]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml

pinctrl: gpio0@ff750000:phandle: [[47]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml

pinctrl: gpio0@ff750000:phandle: [[48]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml

pinctrl: gpio0@ff750000:phandle: [[49]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml

pinctrl: gpio0@ff750000:phandle: [[50]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml

pinctrl: gpio0@ff750000:phandle: [[51]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml

pinctrl: gpio0@ff750000:phandle: [[52]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml

pinctrl: gpio0@ff750000:phandle: [[59]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml

pinctrl: gpio0@ff750000:phandle: [[62]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml

pinctrl: gpio0@ff750000:phandle: [[63]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml

pinctrl: gpio0@ff750000:phandle: [[65]] is not of type 'object'
	arch/arm/boot/dts/rk3288-tinker.dt.yaml

pinctrl: gpio0@ff750000:phandle: [[66]] is not of type 'object'
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml

pinctrl: gpio0@ff750000:phandle: [[67]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio0@ff750000:phandle: [[69]] is not of type 'object'
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml

pinctrl: gpio0@ff750000:phandle: [[70]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml

pinctrl: gpio0@ff750000:phandle: [[72]] is not of type 'object'
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml

pinctrl: gpio0@ff750000:reg: [[0, 4285857792, 0, 256]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio1@10310000:clocks: [[2, 256]] is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio1@10310000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio1@10310000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio1@10310000:gpio-controller: True is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio1@10310000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio1@10310000:interrupt-controller: True is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio1@10310000:interrupts: [[0, 41, 4]] is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio1@10310000:phandle: [[50]] is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml

pinctrl: gpio1@10310000:reg: [[271646720, 256]] is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio1@11120000:clocks: [[2, 321]] is not of type 'object'
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio1@11120000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio1@11120000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio1@11120000:gpio-controller: True is not of type 'object'
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio1@11120000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio1@11120000:interrupt-controller: True is not of type 'object'
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio1@11120000:interrupts: [[0, 52, 4]] is not of type 'object'
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio1@11120000:reg: [[286392320, 256]] is not of type 'object'
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio1@2003c000:clocks: [[2, 342]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio1@2003c000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio1@2003c000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio1@2003c000:gpio-controller: True is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio1@2003c000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio1@2003c000:interrupt-controller: True is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio1@2003c000:interrupts: [[0, 55, 4]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio1@2003c000:phandle: [[15]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml

pinctrl: gpio1@2003c000:phandle: [[19]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml

pinctrl: gpio1@2003c000:phandle: [[35]] is not of type 'object'
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml

pinctrl: gpio1@2003c000:phandle: [[43]] is not of type 'object'
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml

pinctrl: gpio1@2003c000:reg: [[537116672, 256]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio1@ff220000:clocks: [[2, 201]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio1@ff220000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio1@ff220000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio1@ff220000:gpio-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio1@ff220000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio1@ff220000:interrupt-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio1@ff220000:interrupts: [[0, 52, 4]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio1@ff220000:phandle: [[101]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml

pinctrl: gpio1@ff220000:phandle: [[41]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml

pinctrl: gpio1@ff220000:phandle: [[81]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml

pinctrl: gpio1@ff220000:phandle: [[83]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio1@ff220000:phandle: [[98]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml

pinctrl: gpio1@ff220000:reg: [[0, 4280418304, 0, 256]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio1@ff230000:clocks: [[2, 216]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio1@ff230000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio1@ff230000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio1@ff230000:gpio-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio1@ff230000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio1@ff230000:interrupt-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio1@ff230000:interrupts: [[0, 41, 4]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio1@ff230000:reg: [[0, 4280483840, 0, 256]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio1@ff250000:clocks: [[2, 348]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio1@ff250000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio1@ff250000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio1@ff250000:gpio-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio1@ff250000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio1@ff250000:interrupt-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio1@ff250000:interrupts: [[0, 4, 4]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio1@ff250000:phandle: [[143]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml

pinctrl: gpio1@ff250000:phandle: [[144]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml

pinctrl: gpio1@ff250000:phandle: [[147]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio1@ff250000:phandle: [[154]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml

pinctrl: gpio1@ff250000:reg: [[0, 4280614912, 0, 256]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio1@ff730000:clocks: [[112, 24]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml

pinctrl: gpio1@ff730000:clocks: [[113, 24]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml

pinctrl: gpio1@ff730000:clocks: [[115, 24]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml

pinctrl: gpio1@ff730000:clocks: [[116, 24]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml

pinctrl: gpio1@ff730000:clocks: [[118, 24]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml

pinctrl: gpio1@ff730000:clocks: [[119, 24]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml

pinctrl: gpio1@ff730000:clocks: [[120, 24]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio1@ff730000:clocks: [[121, 24]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml

pinctrl: gpio1@ff730000:clocks: [[122, 24]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml

pinctrl: gpio1@ff730000:clocks: [[124, 24]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml

pinctrl: gpio1@ff730000:clocks: [[125, 24]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml

pinctrl: gpio1@ff730000:clocks: [[126, 24]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml

pinctrl: gpio1@ff730000:clocks: [[127, 24]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml

pinctrl: gpio1@ff730000:clocks: [[130, 24]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml

pinctrl: gpio1@ff730000:clocks: [[98, 24]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml

pinctrl: gpio1@ff730000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio1@ff730000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio1@ff730000:gpio-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio1@ff730000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio1@ff730000:interrupt-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio1@ff730000:interrupts: [[0, 15, 4, 0]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio1@ff730000:phandle: [[105]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml

pinctrl: gpio1@ff730000:phandle: [[119]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml

pinctrl: gpio1@ff730000:phandle: [[120]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml

pinctrl: gpio1@ff730000:phandle: [[123]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml

pinctrl: gpio1@ff730000:phandle: [[125]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml

pinctrl: gpio1@ff730000:phandle: [[127]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio1@ff730000:phandle: [[131]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml

pinctrl: gpio1@ff730000:phandle: [[132]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml

pinctrl: gpio1@ff730000:phandle: [[133]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml

pinctrl: gpio1@ff730000:phandle: [[134]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml

pinctrl: gpio1@ff730000:phandle: [[136]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml

pinctrl: gpio1@ff730000:phandle: [[139]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml

pinctrl: gpio1@ff730000:phandle: [[175]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml

pinctrl: gpio1@ff730000:phandle: [[22]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml

pinctrl: gpio1@ff730000:phandle: [[35]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml

pinctrl: gpio1@ff730000:phandle: [[54]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml

pinctrl: gpio1@ff730000:phandle: [[63]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml

pinctrl: gpio1@ff730000:phandle: [[65]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml

pinctrl: gpio1@ff730000:phandle: [[67]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml

pinctrl: gpio1@ff730000:reg: [[0, 4285726720, 0, 256]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio1@ff780000:clocks: [[10, 321]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml

pinctrl: gpio1@ff780000:clocks: [[11, 321]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml

pinctrl: gpio1@ff780000:clocks: [[7, 321]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio1@ff780000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio1@ff780000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio1@ff780000:gpio-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio1@ff780000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio1@ff780000:interrupt-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio1@ff780000:interrupts: [[0, 82, 4]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio1@ff780000:phandle: [[126]] is not of type 'object'
	arch/arm/boot/dts/rk3288-tinker.dt.yaml

pinctrl: gpio1@ff780000:phandle: [[131]] is not of type 'object'
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml

pinctrl: gpio1@ff780000:phandle: [[70]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml

pinctrl: gpio1@ff780000:reg: [[0, 4286054400, 0, 256]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio2@10320000:clocks: [[2, 257]] is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio2@10320000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio2@10320000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio2@10320000:gpio-controller: True is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio2@10320000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio2@10320000:interrupt-controller: True is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio2@10320000:interrupts: [[0, 42, 4]] is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio2@10320000:reg: [[271712256, 256]] is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio2@11130000:clocks: [[2, 322]] is not of type 'object'
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio2@11130000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio2@11130000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio2@11130000:gpio-controller: True is not of type 'object'
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio2@11130000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio2@11130000:interrupt-controller: True is not of type 'object'
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio2@11130000:interrupts: [[0, 53, 4]] is not of type 'object'
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio2@11130000:phandle: [[78]] is not of type 'object'
	arch/arm/boot/dts/rk3229-evb.dt.yaml

pinctrl: gpio2@11130000:phandle: [[84]] is not of type 'object'
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio2@11130000:reg: [[286457856, 256]] is not of type 'object'
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio2@2003e000:clocks: [[2, 343]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio2@2003e000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio2@2003e000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio2@2003e000:gpio-controller: True is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio2@2003e000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio2@2003e000:interrupt-controller: True is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio2@2003e000:interrupts: [[0, 56, 4]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio2@2003e000:phandle: [[67]] is not of type 'object'
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio2@2003e000:reg: [[537124864, 256]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio2@ff230000:clocks: [[2, 202]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio2@ff230000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio2@ff230000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio2@ff230000:gpio-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio2@ff230000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio2@ff230000:interrupt-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio2@ff230000:interrupts: [[0, 53, 4]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio2@ff230000:phandle: [[101]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml

pinctrl: gpio2@ff230000:phandle: [[37]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml

pinctrl: gpio2@ff230000:phandle: [[39]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio2@ff230000:phandle: [[40]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml

pinctrl: gpio2@ff230000:phandle: [[97]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml

pinctrl: gpio2@ff230000:reg: [[0, 4280483840, 0, 256]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio2@ff240000:clocks: [[2, 217]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio2@ff240000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio2@ff240000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio2@ff240000:gpio-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio2@ff240000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio2@ff240000:interrupt-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio2@ff240000:interrupts: [[0, 42, 4]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio2@ff240000:reg: [[0, 4280549376, 0, 256]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio2@ff260000:clocks: [[2, 349]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio2@ff260000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio2@ff260000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio2@ff260000:gpio-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio2@ff260000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio2@ff260000:interrupt-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio2@ff260000:interrupts: [[0, 5, 4]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio2@ff260000:phandle: [[102]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml

pinctrl: gpio2@ff260000:phandle: [[103]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml

pinctrl: gpio2@ff260000:phandle: [[104]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml

pinctrl: gpio2@ff260000:phandle: [[148]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio2@ff260000:reg: [[0, 4280680448, 0, 256]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio2@ff780000:clocks: [[8, 336]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio2@ff780000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio2@ff780000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio2@ff780000:gpio-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio2@ff780000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio2@ff780000:interrupt-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio2@ff780000:interrupts: [[0, 16, 4, 0]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio2@ff780000:phandle: [[179]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml

pinctrl: gpio2@ff780000:phandle: [[181]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml

pinctrl: gpio2@ff780000:phandle: [[183]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml

pinctrl: gpio2@ff780000:phandle: [[185]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml

pinctrl: gpio2@ff780000:phandle: [[190]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml

pinctrl: gpio2@ff780000:phandle: [[195]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml

pinctrl: gpio2@ff780000:phandle: [[22]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio2@ff780000:phandle: [[24]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml

pinctrl: gpio2@ff780000:phandle: [[26]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml

pinctrl: gpio2@ff780000:phandle: [[62]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml

pinctrl: gpio2@ff780000:phandle: [[63]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml

pinctrl: gpio2@ff780000:phandle: [[66]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml

pinctrl: gpio2@ff780000:phandle: [[67]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml

pinctrl: gpio2@ff780000:reg: [[0, 4286054400, 0, 256]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio2@ff790000:clocks: [[10, 322]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml

pinctrl: gpio2@ff790000:clocks: [[11, 322]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml

pinctrl: gpio2@ff790000:clocks: [[7, 322]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio2@ff790000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio2@ff790000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio2@ff790000:gpio-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio2@ff790000:gpio-line-names: ['CONFIG0', 'CONFIG1', 'CONFIG2', '', '', '', '', 'CONFIG3', '', 'EMMC_RST_L', '', '', 'BL_PWR_EN', 'AVDD_1V8_DISP_EN'] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml

pinctrl: gpio2@ff790000:gpio-line-names: ['CONFIG0', 'CONFIG1', 'CONFIG2', '', '', '', '', 'CONFIG3', '', 'EMMC_RST_L', '', '', 'BL_PWR_EN', '', 'TOUCH_INT', 'TOUCH_RST', 'I2C3_SCL_TP', 'I2C3_SDA_TP'] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml

pinctrl: gpio2@ff790000:gpio-line-names: ['CONFIG0', 'CONFIG1', 'CONFIG2', '', '', '', '', 'CONFIG3', '', 'EMMC_RST_L'] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml

pinctrl: gpio2@ff790000:gpio-line-names: ['CONFIG0', 'CONFIG1', 'CONFIG2', '', '', '', '', 'CONFIG3', 'PROCHOT#', 'EMMC_RST_L', '', '', 'BL_PWR_EN', 'AVDD_1V8_DISP_EN', 'TOUCH_INT', 'TOUCH_RST', 'I2C3_SCL_TP', 'I2C3_SDA_TP'] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml

pinctrl: gpio2@ff790000:gpio-line-names: ['CONFIG0', 'CONFIG1', 'CONFIG2', '', '', '', '', 'CONFIG3', 'PWRLIMIT#_CPU', 'EMMC_RST_L', '', '', 'BL_PWR_EN', 'AVDD_1V8_DISP_EN'] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml

pinctrl: gpio2@ff790000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio2@ff790000:interrupt-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio2@ff790000:interrupts: [[0, 83, 4]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio2@ff790000:phandle: [[12]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml

pinctrl: gpio2@ff790000:phandle: [[131]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml

pinctrl: gpio2@ff790000:phandle: [[132]] is not of type 'object'
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml

pinctrl: gpio2@ff790000:phandle: [[137]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml

pinctrl: gpio2@ff790000:phandle: [[146]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml

pinctrl: gpio2@ff790000:phandle: [[147]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml

pinctrl: gpio2@ff790000:phandle: [[149]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml

pinctrl: gpio2@ff790000:phandle: [[150]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml

pinctrl: gpio2@ff790000:phandle: [[40]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml

pinctrl: gpio2@ff790000:phandle: [[47]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml

pinctrl: gpio2@ff790000:phandle: [[52]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml

pinctrl: gpio2@ff790000:phandle: [[62]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml

pinctrl: gpio2@ff790000:phandle: [[63]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml

pinctrl: gpio2@ff790000:phandle: [[65]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml

pinctrl: gpio2@ff790000:phandle: [[68]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml

pinctrl: gpio2@ff790000:reg: [[0, 4286119936, 0, 256]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio3@10330000:clocks: [[2, 258]] is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio3@10330000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio3@10330000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio3@10330000:gpio-controller: True is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio3@10330000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio3@10330000:interrupt-controller: True is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio3@10330000:interrupts: [[0, 43, 4]] is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio3@10330000:reg: [[271777792, 256]] is not of type 'object'
	arch/arm/boot/dts/rv1108-elgin-r1.dt.yaml
	arch/arm/boot/dts/rv1108-evb.dt.yaml

pinctrl: gpio3@11140000:clocks: [[2, 323]] is not of type 'object'
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio3@11140000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio3@11140000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio3@11140000:gpio-controller: True is not of type 'object'
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio3@11140000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio3@11140000:interrupt-controller: True is not of type 'object'
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio3@11140000:interrupts: [[0, 54, 4]] is not of type 'object'
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio3@11140000:phandle: [[83]] is not of type 'object'
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio3@11140000:reg: [[286523392, 256]] is not of type 'object'
	arch/arm/boot/dts/rk3228-evb.dt.yaml
	arch/arm/boot/dts/rk3229-evb.dt.yaml
	arch/arm/boot/dts/rk3229-xms6.dt.yaml

pinctrl: gpio3@20080000:clocks: [[2, 344]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio3@20080000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio3@20080000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio3@20080000:gpio-controller: True is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio3@20080000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio3@20080000:interrupt-controller: True is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio3@20080000:interrupts: [[0, 57, 4]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio3@20080000:phandle: [[14]] is not of type 'object'
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio3@20080000:phandle: [[64]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml

pinctrl: gpio3@20080000:phandle: [[67]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml

pinctrl: gpio3@20080000:phandle: [[72]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml

pinctrl: gpio3@20080000:phandle: [[7]] is not of type 'object'
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml

pinctrl: gpio3@20080000:phandle: [[93]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml

pinctrl: gpio3@20080000:reg: [[537395200, 256]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml
	arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml
	arch/arm/boot/dts/rk3188-px3-evb.dt.yaml
	arch/arm/boot/dts/rk3188-radxarock.dt.yaml

pinctrl: gpio3@ff240000:clocks: [[2, 203]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio3@ff240000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio3@ff240000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio3@ff240000:gpio-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio3@ff240000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio3@ff240000:interrupt-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio3@ff240000:interrupts: [[0, 54, 4]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio3@ff240000:phandle: [[102]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio3@ff240000:reg: [[0, 4280549376, 0, 256]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-a1.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dt.yaml

pinctrl: gpio3@ff250000:clocks: [[2, 218]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio3@ff250000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio3@ff250000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio3@ff250000:gpio-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio3@ff250000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio3@ff250000:interrupt-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio3@ff250000:interrupts: [[0, 43, 4]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio3@ff250000:reg: [[0, 4280614912, 0, 256]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio3@ff270000:clocks: [[2, 350]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio3@ff270000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio3@ff270000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio3@ff270000:gpio-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio3@ff270000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio3@ff270000:interrupt-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio3@ff270000:interrupts: [[0, 6, 4]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio3@ff270000:phandle: [[126]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio3@ff270000:reg: [[0, 4280745984, 0, 256]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dt.yaml
	arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dt.yaml

pinctrl: gpio3@ff788000:clocks: [[8, 337]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio3@ff788000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio3@ff788000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio3@ff788000:gpio-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio3@ff788000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio3@ff788000:interrupt-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio3@ff788000:interrupts: [[0, 17, 4, 0]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio3@ff788000:phandle: [[128]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml

pinctrl: gpio3@ff788000:phandle: [[18]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml

pinctrl: gpio3@ff788000:phandle: [[27]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml

pinctrl: gpio3@ff788000:phandle: [[28]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml

pinctrl: gpio3@ff788000:phandle: [[29]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio3@ff788000:phandle: [[30]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml

pinctrl: gpio3@ff788000:phandle: [[31]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml

pinctrl: gpio3@ff788000:phandle: [[32]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml

pinctrl: gpio3@ff788000:phandle: [[34]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml

pinctrl: gpio3@ff788000:phandle: [[58]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml

pinctrl: gpio3@ff788000:phandle: [[63]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml

pinctrl: gpio3@ff788000:reg: [[0, 4286087168, 0, 256]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio3@ff7a0000:clocks: [[10, 323]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml

pinctrl: gpio3@ff7a0000:clocks: [[11, 323]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml

pinctrl: gpio3@ff7a0000:clocks: [[7, 323]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio3@ff7a0000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio3@ff7a0000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio3@ff7a0000:gpio-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio3@ff7a0000:gpio-line-names: ['FLASH0_D0', 'FLASH0_D1', 'FLASH0_D2', 'FLASH0_D3', 'FLASH0_D4', 'FLASH0_D5', 'FLASH0_D6', 'FLASH0_D7', '', '', '', '', '', '', '', '', 'FLASH0_CS2/EMMC_CMD', '', 'FLASH0_DQS/EMMC_CLKO'] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml

pinctrl: gpio3@ff7a0000:gpio-line-names: ['FLASH0_D0', 'FLASH0_D1', 'FLASH0_D2', 'FLASH0_D3', 'FLASH0_D4', 'FLASH0_D5', 'FLASH0_D6', 'FLASH0_D7', 'VCC5V_GOOD_H', '', '', '', '', '', '', '', 'FLASH0_CS2/EMMC_CMD', '', 'FLASH0_DQS/EMMC_CLKO', '', '', '', '', '', 'PHY_TXD2', 'PHY_TXD3', 'MAC_RXD2', 'MAC_RXD3', 'PHY_TXD0', 'PHY_TXD1', 'MAC_RXD0', 'MAC_RXD1'] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml

pinctrl: gpio3@ff7a0000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio3@ff7a0000:interrupt-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio3@ff7a0000:interrupts: [[0, 84, 4]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio3@ff7a0000:phandle: [[129]] is not of type 'object'
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml

pinctrl: gpio3@ff7a0000:phandle: [[35]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml

pinctrl: gpio3@ff7a0000:phandle: [[39]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml

pinctrl: gpio3@ff7a0000:phandle: [[46]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml

pinctrl: gpio3@ff7a0000:phandle: [[49]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml

pinctrl: gpio3@ff7a0000:phandle: [[50]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml

pinctrl: gpio3@ff7a0000:phandle: [[59]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml

pinctrl: gpio3@ff7a0000:reg: [[0, 4286185472, 0, 256]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3368-r88.dt.yaml
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio4@20084000:clocks: [[2, 345]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml

pinctrl: gpio4@20084000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml

pinctrl: gpio4@20084000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml

pinctrl: gpio4@20084000:gpio-controller: True is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml

pinctrl: gpio4@20084000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml

pinctrl: gpio4@20084000:interrupt-controller: True is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml

pinctrl: gpio4@20084000:interrupts: [[0, 58, 4]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml

pinctrl: gpio4@20084000:phandle: [[43]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml

pinctrl: gpio4@20084000:phandle: [[65]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml

pinctrl: gpio4@20084000:reg: [[537411584, 256]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml

pinctrl: gpio4@ff260000:clocks: [[2, 219]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio4@ff260000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio4@ff260000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio4@ff260000:gpio-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio4@ff260000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio4@ff260000:interrupt-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio4@ff260000:interrupts: [[0, 44, 4]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio4@ff260000:phandle: [[95]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio4@ff260000:reg: [[0, 4280680448, 0, 256]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3308-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dt.yaml

pinctrl: gpio4@ff790000:clocks: [[8, 338]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio4@ff790000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio4@ff790000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio4@ff790000:gpio-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio4@ff790000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio4@ff790000:interrupt-controller: True is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio4@ff790000:interrupts: [[0, 18, 4, 0]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio4@ff790000:phandle: [[141]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml

pinctrl: gpio4@ff790000:phandle: [[160]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml

pinctrl: gpio4@ff790000:phandle: [[173]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml

pinctrl: gpio4@ff790000:phandle: [[177]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml

pinctrl: gpio4@ff790000:phandle: [[188]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml

pinctrl: gpio4@ff790000:phandle: [[189]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml

pinctrl: gpio4@ff790000:phandle: [[193]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml

pinctrl: gpio4@ff790000:phandle: [[195]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml

pinctrl: gpio4@ff790000:phandle: [[203]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml

pinctrl: gpio4@ff790000:phandle: [[208]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml

pinctrl: gpio4@ff790000:phandle: [[22]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml

pinctrl: gpio4@ff790000:phandle: [[26]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml

pinctrl: gpio4@ff790000:phandle: [[37]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml

pinctrl: gpio4@ff790000:phandle: [[55]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio4@ff790000:phandle: [[57]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml

pinctrl: gpio4@ff790000:reg: [[0, 4286119936, 0, 256]] is not of type 'object'
	arch/arm64/boot/dts/rockchip/rk3399-evb.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-ficus.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-firefly.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-orangepi.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock960.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire.dt.yaml
	arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml

pinctrl: gpio4@ff7b0000:clocks: [[7, 324]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio4@ff7b0000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio4@ff7b0000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio4@ff7b0000:gpio-controller: True is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio4@ff7b0000:gpio-line-names: ['MAC_MDC', 'MAC_RXDV', 'MAC_RXER', 'MAC_CLK', 'PHY_TXEN', 'MAC_MDIO', 'MAC_RXCLK', '', 'PHY_RST', 'PHY_TXCLK', '', '', '', '', '', '', 'UART0_RXD', 'UART0_TXD', 'UART0_CTS_L', 'UART0_RTS_L', 'SDIO0_D0', 'SDIO0_D1', 'SDIO0_D2', 'SDIO0_D3', 'SDIO0_CMD', 'SDIO0_CLK', 'BT_DEV_WAKE', '', 'WIFI_ENABLE_H', 'BT_ENABLE_L', 'WIFI_HOST_WAKE', 'BT_HOST_WAKE'] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml

pinctrl: gpio4@ff7b0000:gpio-line-names: ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'UART0_RXD', 'UART0_TXD', 'UART0_CTS_L', 'UART0_RTS_L', 'SDIO0_D0', 'SDIO0_D1', 'SDIO0_D2', 'SDIO0_D3', 'SDIO0_CMD', 'SDIO0_CLK', 'BT_DEV_WAKE', '', 'WIFI_ENABLE_H', 'BT_ENABLE_L', 'WIFI_HOST_WAKE', 'BT_HOST_WAKE'] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml

pinctrl: gpio4@ff7b0000:gpio-line-names: ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'UART0_RXD', 'UART0_TXD', 'UART0_CTS', 'UART0_RTS', 'SDIO0_D0', 'SDIO0_D1', 'SDIO0_D2', 'SDIO0_D3', 'SDIO0_CMD', 'SDIO0_CLK', 'BT_DEV_WAKE', '', 'WIFI_ENABLE_H', 'BT_ENABLE_L', 'WIFI_HOST_WAKE', 'BT_HOST_WAKE'] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml

pinctrl: gpio4@ff7b0000:gpio-line-names: ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'UART0_RXD', 'UART0_TXD', 'UART0_CTS', 'UART0_RTS', 'SDIO0_D0', 'SDIO0_D1', 'SDIO0_D2', 'SDIO0_D3', 'SDIO0_CMD', 'SDIO0_CLK', 'dev_wake', '', 'WIFI_ENABLE_H', 'BT_ENABLE_L', 'WIFI_HOST_WAKE', 'BT_HOST_WAKE'] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml

pinctrl: gpio4@ff7b0000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio4@ff7b0000:interrupt-controller: True is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio4@ff7b0000:interrupts: [[0, 85, 4]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio4@ff7b0000:phandle: [[146]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml

pinctrl: gpio4@ff7b0000:phandle: [[150]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml

pinctrl: gpio4@ff7b0000:phandle: [[19]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml

pinctrl: gpio4@ff7b0000:phandle: [[27]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml

pinctrl: gpio4@ff7b0000:phandle: [[28]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml

pinctrl: gpio4@ff7b0000:phandle: [[46]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml

pinctrl: gpio4@ff7b0000:phandle: [[51]] is not of type 'object'
	arch/arm/boot/dts/rk3288-r89.dt.yaml

pinctrl: gpio4@ff7b0000:phandle: [[55]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml

pinctrl: gpio4@ff7b0000:phandle: [[59]] is not of type 'object'
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml

pinctrl: gpio4@ff7b0000:phandle: [[60]] is not of type 'object'
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio4@ff7b0000:phandle: [[62]] is not of type 'object'
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml

pinctrl: gpio4@ff7b0000:phandle: [[63]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml

pinctrl: gpio4@ff7b0000:phandle: [[64]] is not of type 'object'
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml

pinctrl: gpio4@ff7b0000:phandle: [[65]] is not of type 'object'
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml

pinctrl: gpio4@ff7b0000:phandle: [[69]] is not of type 'object'
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml

pinctrl: gpio4@ff7b0000:phandle: [[70]] is not of type 'object'
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml

pinctrl: gpio4@ff7b0000:reg: [[0, 4286251008, 0, 256]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio5@ff7c0000:clocks: [[7, 325]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio5@ff7c0000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio5@ff7c0000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio5@ff7c0000:gpio-controller: True is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio5@ff7c0000:gpio-line-names: ['', '', '', '', '', '', '', '', '', '', '', '', 'SPI0_CLK', 'SPI0_CS0', 'SPI0_TXD', 'SPI0_RXD', '', '', '', 'VCC50_HDMI_EN'] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml

pinctrl: gpio5@ff7c0000:gpio-line-names: ['', '', '', '', '', '', '', '', '', '', '', '', 'USB_OTG_CTL1', 'HUB_USB2_CTL1', 'HUB_USB2_PWR_EN', 'HUB_USB_ILIM_SEL', 'USB_OTG_STATUS_L', 'HUB_USB1_CTL1', 'HUB_USB1_PWR_EN', 'VCC50_HDMI_EN'] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml

pinctrl: gpio5@ff7c0000:gpio-line-names: ['', '', '', '', '', '', '', '', '', '', 'Volum_Up#', 'Volum_Down#', 'SPI0_CLK', 'SPI0_CS0', 'SPI0_TXD', 'SPI0_RXD', '', '', '', 'VCC50_HDMI_EN'] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml

pinctrl: gpio5@ff7c0000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio5@ff7c0000:interrupt-controller: True is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio5@ff7c0000:interrupts: [[0, 86, 4]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio5@ff7c0000:phandle: [[151]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml

pinctrl: gpio5@ff7c0000:phandle: [[153]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml

pinctrl: gpio5@ff7c0000:phandle: [[154]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml

pinctrl: gpio5@ff7c0000:phandle: [[155]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml

pinctrl: gpio5@ff7c0000:phandle: [[157]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml

pinctrl: gpio5@ff7c0000:phandle: [[40]] is not of type 'object'
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml

pinctrl: gpio5@ff7c0000:phandle: [[41]] is not of type 'object'
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml

pinctrl: gpio5@ff7c0000:reg: [[0, 4286316544, 0, 256]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio6@2000a000:clocks: [[2, 346]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml

pinctrl: gpio6@2000a000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml

pinctrl: gpio6@2000a000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml

pinctrl: gpio6@2000a000:gpio-controller: True is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml

pinctrl: gpio6@2000a000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml

pinctrl: gpio6@2000a000:interrupt-controller: True is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml

pinctrl: gpio6@2000a000:interrupts: [[0, 60, 4]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml

pinctrl: gpio6@2000a000:phandle: [[29]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml

pinctrl: gpio6@2000a000:phandle: [[36]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml

pinctrl: gpio6@2000a000:phandle: [[47]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml

pinctrl: gpio6@2000a000:reg: [[536911872, 256]] is not of type 'object'
	arch/arm/boot/dts/rk3066a-bqcurie2.dt.yaml
	arch/arm/boot/dts/rk3066a-marsboard.dt.yaml
	arch/arm/boot/dts/rk3066a-mk808.dt.yaml
	arch/arm/boot/dts/rk3066a-rayeager.dt.yaml

pinctrl: gpio6@ff7d0000:clocks: [[7, 326]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio6@ff7d0000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio6@ff7d0000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio6@ff7d0000:gpio-controller: True is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio6@ff7d0000:gpio-line-names: ['I2S0_SCLK', 'I2S0_LRCK_RX', 'I2S0_LRCK_TX', 'I2S0_SDI', 'I2S0_SDO0', 'HP_DET_H', 'ALS_INT', 'INT_CODEC', 'I2S0_CLK', 'I2C2_SDA', 'I2C2_SCL', 'MICDET', '', '', '', '', 'SDMMC_D0', 'SDMMC_D1', 'SDMMC_D2', 'SDMMC_D3', 'SDMMC_CLK', 'SDMMC_CMD'] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml

pinctrl: gpio6@ff7d0000:gpio-line-names: ['I2S0_SCLK', 'I2S0_LRCK_RX', 'I2S0_LRCK_TX', 'I2S0_SDI', 'I2S0_SDO0', 'HP_DET_H', '', 'INT_CODEC', 'I2S0_CLK', 'I2C2_SDA', 'I2C2_SCL', 'MICDET', '', '', '', '', 'HUB_USB2_nFALUT', 'USB_OTG_ILIM_SEL'] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml

pinctrl: gpio6@ff7d0000:gpio-line-names: ['I2S0_SCLK', 'I2S0_LRCK_RX', 'I2S0_LRCK_TX', 'I2S0_SDI', 'I2S0_SDO0', 'HP_DET_H', '', 'INT_CODEC', 'I2S0_CLK', 'I2C2_SDA', 'I2C2_SCL', 'MICDET', '', '', '', '', 'SDMMC_D0', 'SDMMC_D1', 'SDMMC_D2', 'SDMMC_D3', 'SDMMC_CLK', 'SDMMC_CMD'] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml

pinctrl: gpio6@ff7d0000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio6@ff7d0000:interrupt-controller: True is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio6@ff7d0000:interrupts: [[0, 87, 4]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio6@ff7d0000:phandle: [[76]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml

pinctrl: gpio6@ff7d0000:phandle: [[77]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml

pinctrl: gpio6@ff7d0000:phandle: [[79]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml

pinctrl: gpio6@ff7d0000:phandle: [[80]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml

pinctrl: gpio6@ff7d0000:phandle: [[85]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml

pinctrl: gpio6@ff7d0000:reg: [[0, 4286382080, 0, 256]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio7@ff7e0000:clocks: [[7, 327]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio7@ff7e0000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio7@ff7e0000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio7@ff7e0000:gpio-controller: True is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio7@ff7e0000:gpio-line-names: ['LCD_BL_PWM', 'PWM_LOG', 'BL_EN', 'PWR_LED1', 'TPM_INT_H', 'SPK_ON', 'AP_FLASH_WP_L', '', 'CPU_NMI', 'DVSOK', '', 'EDP_HPD', 'DVS1', '', 'LCD_EN', 'DVS2', 'HDMI_CEC', 'I2C4_SDA', 'I2C4_SCL', 'I2C5_SDA_HDMI', 'I2C5_SCL_HDMI', '5V_DRV', 'UART2_RXD', 'UART2_TXD'] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml

pinctrl: gpio7@ff7e0000:gpio-line-names: ['LCDC_BL', 'PWM_LOG', 'BL_EN', 'TRACKPAD_INT', 'TPM_INT_H', 'SDMMC_DET_L', 'AP_FLASH_WP_L', 'EC_INT', 'CPU_NMI', 'DVS_OK', '', 'EDP_HOTPLUG', 'DVS1', 'nFALUT1', 'LCD_EN', 'DVS2', 'VCC5V_GOOD_H', 'I2C4_SDA_TP', 'I2C4_SCL_TP', 'I2C5_SDA_HDMI', 'I2C5_SCL_HDMI', '5V_DRV', 'UART2_RXD', 'UART2_TXD'] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml

pinctrl: gpio7@ff7e0000:gpio-line-names: ['LCDC_BL', 'PWM_LOG', 'BL_EN', 'TRACKPAD_INT', 'TPM_INT_H', 'SDMMC_DET_L', 'AP_FLASH_WP_L', 'EC_INT', 'CPU_NMI', 'DVSOK', '', 'EDP_HPD', 'DVS1', 'nFAULT1', 'LCD_EN', 'DVS2', 'VCC5V_GOOD_H', 'I2C4_SDA_TP', 'I2C4_SCL_TP', 'I2C5_SDA_HDMI', 'I2C5_SCL_HDMI', '5V_DRV', 'UART2_RXD', 'UART2_TXD'] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml

pinctrl: gpio7@ff7e0000:gpio-line-names: ['LCDC_BL', 'PWM_LOG', 'BL_EN', 'TRACKPAD_INT', 'TPM_INT_H', 'SDMMC_DET_L', 'AP_FLASH_WP_L', 'EC_INT', 'CPU_NMI', 'DVS_OK', 'SDMMC_WP', 'EDP_HPD', 'DVS1', 'nFALUT1', 'LCD_EN', 'DVS2', 'VCC5V_GOOD_H', 'I2C4_SDA_TP', 'I2C4_SCL_TP', 'I2C5_SDA_HDMI', 'I2C5_SCL_HDMI', '5V_DRV', 'UART2_RXD', 'UART2_TXD'] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml

pinctrl: gpio7@ff7e0000:gpio-line-names: ['LCDC_BL', 'PWM_LOG', 'BL_EN', 'TRACKPAD_INT', 'TPM_INT_H', 'SDMMC_DET_L', 'AP_FLASH_WP_L', 'EC_INT', 'CPU_NMI', 'DVSOK', 'SDMMC_WP', 'EDP_HPD', 'DVS1', 'nFALUT1', 'LCD_EN', 'DVS2', 'VCC5V_GOOD_H', 'I2C4_SDA_TP', 'I2C4_SCL_TP', 'I2C5_SDA_HDMI', 'I2C5_SCL_HDMI', '5V_DRV', 'UART2_RXD', 'UART2_TXD'] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml

pinctrl: gpio7@ff7e0000:gpio-line-names: ['', 'PWM_LOG', '', '', 'TPM_INT_H', 'SDMMC_DET_L', 'AP_FLASH_WP_L', '', 'CPU_NMI', 'DVSOK', 'HDMI_WAKE', 'POWER_HDMI_ON', 'DVS1', '', '', 'DVS2', 'HDMI_CEC', '', '', 'I2C5_SDA_HDMI', 'I2C5_SCL_HDMI', '', 'UART2_RXD', 'UART2_TXD'] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml

pinctrl: gpio7@ff7e0000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio7@ff7e0000:interrupt-controller: True is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio7@ff7e0000:interrupts: [[0, 88, 4]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio7@ff7e0000:phandle: [[115]] is not of type 'object'
	arch/arm/boot/dts/rk3288-r89.dt.yaml

pinctrl: gpio7@ff7e0000:phandle: [[123]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml

pinctrl: gpio7@ff7e0000:phandle: [[124]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml

pinctrl: gpio7@ff7e0000:phandle: [[125]] is not of type 'object'
	arch/arm/boot/dts/rk3288-miqi.dt.yaml

pinctrl: gpio7@ff7e0000:phandle: [[126]] is not of type 'object'
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio7@ff7e0000:phandle: [[127]] is not of type 'object'
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml

pinctrl: gpio7@ff7e0000:phandle: [[129]] is not of type 'object'
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml

pinctrl: gpio7@ff7e0000:phandle: [[131]] is not of type 'object'
	arch/arm/boot/dts/rk3288-tinker.dt.yaml

pinctrl: gpio7@ff7e0000:phandle: [[132]] is not of type 'object'
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml

pinctrl: gpio7@ff7e0000:phandle: [[136]] is not of type 'object'
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml

pinctrl: gpio7@ff7e0000:phandle: [[13]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml

pinctrl: gpio7@ff7e0000:phandle: [[68]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml

pinctrl: gpio7@ff7e0000:phandle: [[74]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml

pinctrl: gpio7@ff7e0000:phandle: [[75]] is not of type 'object'
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml

pinctrl: gpio7@ff7e0000:phandle: [[77]] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml

pinctrl: gpio7@ff7e0000:phandle: [[80]] is not of type 'object'
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml

pinctrl: gpio7@ff7e0000:reg: [[0, 4286447616, 0, 256]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio8@ff7f0000:clocks: [[7, 328]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio8@ff7f0000:compatible: ['rockchip,gpio-bank'] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio8@ff7f0000:#gpio-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio8@ff7f0000:gpio-controller: True is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio8@ff7f0000:gpio-line-names: ['RAM_ID0', 'RAM_ID1', 'RAM_ID2', 'RAM_ID3', 'I2C1_SDA_TPM', 'I2C1_SCL_TPM', 'SPI2_CLK', 'SPI2_CS0', 'SPI2_RXD', 'SPI2_TXD'] is not of type 'object'
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml

pinctrl: gpio8@ff7f0000:#interrupt-cells: [[2]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio8@ff7f0000:interrupt-controller: True is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio8@ff7f0000:interrupts: [[0, 89, 4]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio8@ff7f0000:phandle: [[130]] is not of type 'object'
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

pinctrl: gpio8@ff7f0000:phandle: [[131]] is not of type 'object'
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml

pinctrl: gpio8@ff7f0000:phandle: [[133]] is not of type 'object'
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml

pinctrl: gpio8@ff7f0000:phandle: [[141]] is not of type 'object'
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml

pinctrl: gpio8@ff7f0000:phandle: [[39]] is not of type 'object'
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml

pinctrl: gpio8@ff7f0000:reg: [[0, 4286513152, 0, 256]] is not of type 'object'
	arch/arm/boot/dts/rk3288-evb-act8846.dt.yaml
	arch/arm/boot/dts/rk3288-evb-rk808.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
	arch/arm/boot/dts/rk3288-firefly.dt.yaml
	arch/arm/boot/dts/rk3288-firefly-reload.dt.yaml
	arch/arm/boot/dts/rk3288-miqi.dt.yaml
	arch/arm/boot/dts/rk3288-phycore-rdk.dt.yaml
	arch/arm/boot/dts/rk3288-popmetal.dt.yaml
	arch/arm/boot/dts/rk3288-r89.dt.yaml
	arch/arm/boot/dts/rk3288-rock2-square.dt.yaml
	arch/arm/boot/dts/rk3288-rock-pi-n8.dt.yaml
	arch/arm/boot/dts/rk3288-tinker.dt.yaml
	arch/arm/boot/dts/rk3288-tinker-s.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-brain.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-jerry.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mickey.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-mighty.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-minnie.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-pinky.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-speedy.dt.yaml
	arch/arm/boot/dts/rk3288-veyron-tiger.dt.yaml
	arch/arm/boot/dts/rk3288-vyasa.dt.yaml

