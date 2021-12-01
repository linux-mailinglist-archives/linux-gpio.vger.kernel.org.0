Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC0A465A8D
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Dec 2021 01:18:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354103AbhLBAVc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Dec 2021 19:21:32 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:36908 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235723AbhLBAVb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Dec 2021 19:21:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1638404290; x=1669940290;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dnRwlM2g208wpzcQ1fHoMh5ABTusv5pFo5cTKx90whg=;
  b=rLfr6xzlyTu6NRw0mLeHrJRX79IbWkb2RMzd7cylPXpGHRl6S8UX0Tk6
   4br2/3xt3U9LtCb42+nIM6anK4HaP7Zs9512+uApisWnw6UXm71EvYQM/
   +uw0IxapAB9urtzDReB00MbQqniQX4YneXcdt65JxS016C2qu7/4t9Wrt
   n6U7q9UkZccnaYWDb+HHuCCqeGvbwv25QBzcMpg61TY35dpl2bq42kyOc
   9DxL8AdhTb9KwtCOrPl37tcolM8evs/ErJowXMC+vb3buMWD9aNAdGwU4
   N3aHri2GwwCR2nSKUFE7blrpPZHEtJ1uE/WApmEOqASeN7kf559tGwLpS
   g==;
X-IronPort-AV: E=Sophos;i="5.87,280,1631548800"; 
   d="scan'208";a="291190912"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 02 Dec 2021 07:58:13 +0800
IronPort-SDR: A5TY3ROma6vlsY3gvM1h0D1N32x8kggYSjCcGsUwxtlRkmcW6/WEDWi6bpf5xV8sKC/oYVcCyQ
 bLBF9C3nSRMW5AwiTxpmHG2LAZIBto6wzodV5vHBPLRFXcM7xlMPLUlM613a5q3mWWugvyh+eF
 eQqlujkVq+bQNV11YJjNBVJfSmHdMtSJdM4EUN5COVtf2gAeGf//uBfes8FcrdEFPmpYHrq9Qm
 iMIAR4ZAPBFDwNCHtZ/QeryIK2IyQjxlUtwP48s0zJnd1ZAzdKDiBQ9j8uzhf7cxJoL4BXmD//
 KoMhP9J6450Or0yv8xmzmQFe
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2021 15:32:57 -0800
IronPort-SDR: j2ddjB6y9DKa8fFjdsjVt7iUh2tRs5wkWNCiF8q1r85meaUjI23CaqfevY9yiM4OlcIbjKHOz/
 +p0y77N27+OTlYcLHNOsAYLW7bcphV0cAWuq6dA6XgKf8Xm+kEba9osq36OsBbK89k/SnP52Xv
 RxLx+ff0qvpVm8cFx8to+7x9oMXOnkX2QuDgLSnmO1Sdvsf3T8Hxfr7j3wAUFt29oEsBukI0oj
 SXLcmxmA7tRFfje26tpRO2bLaLQGM3nmZ+6uv6Ri3iCcwK1iR4A1OW9mI7Wv/XE8Epd+d2elkE
 xcA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2021 15:58:15 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4J4GHn3bMKz1RtVp
        for <linux-gpio@vger.kernel.org>; Wed,  1 Dec 2021 15:58:13 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1638403091; x=1640995092; bh=dnRwlM2g208wpzcQ1fHoMh5ABTusv5pFo5c
        TKx90whg=; b=Smg8tZ+TvJgoqFK7osdFry7pC21BK7S3yr15mJQjwB/VT9nSMYr
        7iIvDU9l8vFruHz8R0A0SVuly46XttI5hP7+kfC5nbW0dAzvHaZXyz4ZDsmfd3qB
        D0Ph8lgqh06/wHt+lro2VpDTfjRFCGMvRHXyhklU38zB6iPfugAApaDMw29xaH6x
        Pocm/LRy1wZ1rAlLDlzn9u7axyibnyRJDEalhSezz+2Wqhp77ULG7HlRPACEG+Q7
        fSVIANXzSmOc7Dv7ZW8aIyMLJPlNNQjybxvXCKMmPtm/7CIV298EqCCQ+BEWWo6h
        LcJe0ZNh1pNmkNb9fwaGI9bsqmnIs91czqw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id u7cmylyFLmbm for <linux-gpio@vger.kernel.org>;
        Wed,  1 Dec 2021 15:58:11 -0800 (PST)
Received: from [10.225.54.48] (unknown [10.225.54.48])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4J4GHc4pQzz1RtVl;
        Wed,  1 Dec 2021 15:58:04 -0800 (PST)
Message-ID: <0cbaad0b-bab0-177e-48ef-5c4f6dd4391a@opensource.wdc.com>
Date:   Thu, 2 Dec 2021 08:58:03 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH 12/14] dt-bindings: ata: Convert Broadcom SATA to YAML
Content-Language: en-US
To:     Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Gregory Fong <gregory.0xf0@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Markus Mayer <mmayer@broadcom.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Al Cooper <alcooperx@gmail.com>,
        Doug Berger <opendmb@gmail.com>,
        "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" 
        <linux-ide@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND..." 
        <linux-mmc@vger.kernel.org>,
        "open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>,
        "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        "open list:THERMAL" <linux-pm@vger.kernel.org>,
        "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
References: <20211201205110.41656-1-f.fainelli@gmail.com>
 <20211201205110.41656-13-f.fainelli@gmail.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital
In-Reply-To: <20211201205110.41656-13-f.fainelli@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2021/12/02 5:51, Florian Fainelli wrote:
> Convert the Broadcom SATA3 AHCI controller Device Tree binding to YAML
> to help with validation.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  .../bindings/ata/brcm,sata-brcm.txt           | 45 ---------
>  .../bindings/ata/brcm,sata-brcm.yaml          | 91 +++++++++++++++++++
>  2 files changed, 91 insertions(+), 45 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/ata/brcm,sata-brcm.txt
>  create mode 100644 Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/ata/brcm,sata-brcm.txt b/Documentation/devicetree/bindings/ata/brcm,sata-brcm.txt
> deleted file mode 100644
> index b9ae4ce4a0a0..000000000000
> --- a/Documentation/devicetree/bindings/ata/brcm,sata-brcm.txt
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -* Broadcom SATA3 AHCI Controller
> -
> -SATA nodes are defined to describe on-chip Serial ATA controllers.
> -Each SATA controller should have its own node.
> -
> -Required properties:
> -- compatible         : should be one or more of
> -			"brcm,bcm7216-ahci"
> -			"brcm,bcm7425-ahci"
> -			"brcm,bcm7445-ahci"
> -			"brcm,bcm-nsp-ahci"
> -			"brcm,sata3-ahci"
> -			"brcm,bcm63138-ahci"
> -- reg                : register mappings for AHCI and SATA_TOP_CTRL
> -- reg-names          : "ahci" and "top-ctrl"
> -- interrupts         : interrupt mapping for SATA IRQ
> -
> -Optional properties:
> -
> -- reset: for "brcm,bcm7216-ahci" must be a valid reset phandle
> -  pointing to the RESCAL reset controller provider node.
> -- reset-names: for "brcm,bcm7216-ahci", must be "rescal".
> -
> -Also see ahci-platform.txt.
> -
> -Example:
> -
> -	sata@f045a000 {
> -		compatible = "brcm,bcm7445-ahci", "brcm,sata3-ahci";
> -		reg = <0xf045a000 0xa9c>, <0xf0458040 0x24>;
> -		reg-names = "ahci", "top-ctrl";
> -		interrupts = <0 30 0>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		sata0: sata-port@0 {
> -			reg = <0>;
> -			phys = <&sata_phy 0>;
> -		};
> -
> -		sata1: sata-port@1 {
> -			reg = <1>;
> -			phys = <&sata_phy 1>;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml b/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
> new file mode 100644
> index 000000000000..4098d56872ae
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/ata/brcm,sata-brcm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom SATA3 AHCI Controller
> +
> +description:
> +  SATA nodes are defined to describe on-chip Serial ATA controllers.
> +  Each SATA controller should have its own node.
> +
> +maintainers:
> +  - Florian Fainelli <f.fainelli@gmail.com>
> +
> +allOf:
> +  - $ref: sata-common.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - brcm,bcm7216-ahci
> +          - const: brcm,sata3-ahci
> +      - items:
> +          - enum:
> +              - brcm,bcm7445-ahci
> +          - const: brcm,sata3-ahci
> +      - items:
> +          - enum:
> +              - brcm,bcm7425-ahci
> +          - const: brcm,sata3-ahci
> +      - items:
> +          - const: brcm,bcm-nsp-ahci
> +      - items:
> +          - const: brcm,bcm63138-ahci
> +
> +  reg:
> +    minItems: 2
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: ahci
> +      - const: top-ctrl
> +
> +  interrupts: true
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - brcm,bcm7216-ahci
> +then:
> +  properties:
> +    resets: true
> +    reset-names:
> +      items:
> +        - const: rescal
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    sata@f045a000 {
> +        compatible = "brcm,bcm7445-ahci", "brcm,sata3-ahci";
> +        reg = <0xf045a000 0xa9c>, <0xf0458040 0x24>;
> +        reg-names = "ahci", "top-ctrl";
> +        interrupts = <0 30 0>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        sata0: sata-port@0 {
> +            reg = <0>;
> +            phys = <&sata_phy 0>;
> +        };
> +
> +        sata1: sata-port@1 {
> +            reg = <1>;
> +            phys = <&sata_phy 1>;
> +        };
> +    };
> 

Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

Rob,

Will take this through your tree ?

-- 
Damien Le Moal
Western Digital Research
