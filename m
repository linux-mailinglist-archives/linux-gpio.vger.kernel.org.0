Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2F12391462
	for <lists+linux-gpio@lfdr.de>; Wed, 26 May 2021 12:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233653AbhEZKIG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 May 2021 06:08:06 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37528 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233264AbhEZKID (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 May 2021 06:08:03 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14QA6TW7007152;
        Wed, 26 May 2021 05:06:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622023589;
        bh=fWC48oPoBecd0pUdziLbRbw69tljmmg8oN7KBmO41Jo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=HRztiDeOpx5I2X9oeCYdZU4q00TRjA2BwvqpX8u9n6q6xbWMZPqa66LYmRH2ssVcx
         TfvqQF2HyuZ2nEBDPHZCvwTb9VVOJJCb4sPJBqij+VbIzmRrOirYiUBmxghnQsiyML
         /wK06PmsyeHHdM+/wEsXBLIRvgFvYvrC+UgiQQi0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14QA6Tol043572
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 26 May 2021 05:06:29 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 26
 May 2021 05:06:29 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 26 May 2021 05:06:29 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14QA6QZX012623;
        Wed, 26 May 2021 05:06:27 -0500
Subject: Re: [PATCH v2 0/5] dt-bindings: gpio: omap: Convert to json-schema
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tony Lindgren <tony@atomide.com>, <devicetree@vger.kernel.org>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        Aswath Govindraju <a-govindraju@ti.com>
References: <20210525175858.11611-1-grygorii.strashko@ti.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <2dbbf0f1-be2c-de11-8ffd-77a06688a83d@ti.com>
Date:   Wed, 26 May 2021 13:06:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210525175858.11611-1-grygorii.strashko@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Tony, Linus, Bartosz,

On 25/05/2021 20:58, Grygorii Strashko wrote:
> Hi
> 
> Convert the OMAP GPIO Device Tree binding documentation to json-schema.
> The GPIO hogs node names defined to end with a 'hog' suffix.
> 
> All existing GPIO Hogs fixed to follow above naming convention
> before changing the binding to avoid dtbs_check warnings.

There is one note. The DT bindings change, without DTS changes, will
cause dtbs_check warnings, so all these patches better to be merged through one tree.

> 
> Changes in v2:
> - Patch 5 fixed "wrong indentation" warning
> 
> v1: https://lore.kernel.org/patchwork/cover/1434566/
> 
> Grygorii Strashko (5):
>    ARM: dts: am335x: align GPIO hog names with dt-schema
>    ARM: dts: am437x: align gpio hog names with dt-schema
>    ARM: dts: omap3: align gpio hog names with dt-schema
>    ARM: dts: omap5-board-common: align gpio hog names with dt-schema
>    dt-bindings: gpio: omap: Convert to json-schema
> 
>   .../devicetree/bindings/gpio/gpio-omap.txt    |  45 --------
>   .../bindings/gpio/ti,omap-gpio.yaml           | 108 ++++++++++++++++++
>   .../boot/dts/am335x-boneblack-wireless.dts    |   2 +-
>   arch/arm/boot/dts/am335x-boneblue.dts         |   2 +-
>   .../boot/dts/am335x-bonegreen-wireless.dts    |   4 +-
>   arch/arm/boot/dts/am335x-icev2.dts            |   4 +-
>   arch/arm/boot/dts/am335x-shc.dts              |   8 +-
>   arch/arm/boot/dts/am437x-gp-evm.dts           |   4 +-
>   arch/arm/boot/dts/am43x-epos-evm.dts          |   2 +-
>   .../boot/dts/omap3-evm-processor-common.dtsi  |   2 +-
>   arch/arm/boot/dts/omap3-gta04a5.dts           |   2 +-
>   arch/arm/boot/dts/omap5-board-common.dtsi     |   2 +-
>   12 files changed, 124 insertions(+), 61 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-omap.txt
>   create mode 100644 Documentation/devicetree/bindings/gpio/ti,omap-gpio.yaml
> 

-- 
Best regards,
grygorii
