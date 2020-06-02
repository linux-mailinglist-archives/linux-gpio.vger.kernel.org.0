Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB2B1EB811
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2020 11:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbgFBJKm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Jun 2020 05:10:42 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:36182 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726110AbgFBJKl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jun 2020 05:10:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1591089040; x=1622625040;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=D46lJm1PaWfljLGHSVBzrgCAto0IvlJqbjtofGXQCiU=;
  b=abNsgKCWPhCoclQbfboVq0zVFuNyGlMYoPbAKbo84p5Tn0sdvNq4oEt2
   l18yvMfE5oZCcm4eTxCOZFMDbzhAcRk0Bgn8U2LhGQTDvhNowxZqXrfun
   bhoWglqmol+bV2obTI+QzRpsSLunJYfyqeWsUWy3jdYrNlXWEckZCDhco
   /LWaTxV+47ilabJ9q44GeuqZdyJqzf4WK4CzzErtBiW2xP0+4xXY4Ji9a
   QvieLRBEMnkAeELCbn0YO92A9PpzYFCBL5tPu05xcJXp+M2hTA0Wkkd7e
   vQX1jVeGGJMzLE5O4GHOQSQF+qVJq3udwktcHjYbpzLdqlXf1YTw+eJ6B
   w==;
IronPort-SDR: h557GLJJX4ysVCiOib/8eu+vc2XOZdu5PgTfwN98hkByEVTrljBEZHG2LQv55sbW+Zxoajhwxa
 bIY1sUIzw0eQBR37Zu6rcdVvu0b7RbmbRC3aEwlwqsHfRD4Fhnd9ElTmAqPRcdjH9oN2srXJf6
 BrwGbbrv+zvmSthKB6/3BPJRrVV5/ji0zOUQPpW3KYG9ycq2yUMzqiZS9+Hs4ZpZwcsFnLoYmh
 1Oo4BCuhSuc7raMu36hROipExffINYX1O7lXs82YZQSG2LeXzMBtczZic5+haCVrSd0wKUFPh2
 V0A=
X-IronPort-AV: E=Sophos;i="5.73,463,1583218800"; 
   d="scan'208";a="78590969"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Jun 2020 02:10:38 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 2 Jun 2020 02:10:25 -0700
Received: from soft-dev15.microsemi.net.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 2 Jun 2020 02:10:34 -0700
References: <20200513125532.24585-1-lars.povlsen@microchip.com> <20200513125532.24585-6-lars.povlsen@microchip.com> <20200528021137.GA3214411@bogus>
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Rob Herring <robh@kernel.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        SoC Team <soc@kernel.org>, "Arnd Bergmann" <arnd@arndb.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Olof Johansson <olof@lixom.net>,
        Michael Turquette <mturquette@baylibre.com>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 05/14] dt-bindings: arm: sparx5: Add documentation for Microchip Sparx5 SoC
In-Reply-To: <20200528021137.GA3214411@bogus>
Date:   Tue, 2 Jun 2020 11:10:32 +0200
Message-ID: <87ftbdq1dj.fsf@soft-dev15.microsemi.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Rob Herring writes:

> On Wed, May 13, 2020 at 02:55:23PM +0200, Lars Povlsen wrote:
>> This adds the main Sparx5 SoC DT documentation file, with information
>> abut the supported board types.
>>
>> Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
>> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
>> ---
>>  .../bindings/arm/microchip,sparx5.yaml        | 87 +++++++++++++++++++
>>  1 file changed, 87 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/arm/microchip,sparx5.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml b/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml
>> new file mode 100644
>> index 0000000000000..83b36d1217988
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml
>> @@ -0,0 +1,87 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/microchip,sparx5.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Microchip Sparx5 Boards Device Tree Bindings
>> +
>> +maintainers:
>> +  - Lars Povlsen <lars.povlsen@microchip.com>
>> +
>> +description: |+
>> +   The Microchip Sparx5 SoC is a ARMv8-based used in a family of
>> +   gigabit TSN-capable gigabit switches.
>> +
>> +   The SparX-5 Ethernet switch family provides a rich set of switching
>> +   features such as advanced TCAM-based VLAN and QoS processing
>> +   enabling delivery of differentiated services, and security through
>> +   TCAM-based frame processing using versatile content aware processor
>> +   (VCAP)
>> +
>> +properties:
>> +  $nodename:
>> +    const: '/'
>> +  compatible:
>> +    oneOf:
>> +      - description: The Sparx5 pcb125 board is a modular board,
>> +          which has both spi-nor and eMMC storage. The modular design
>> +          allows for connection of different network ports.
>> +        items:
>> +          - const: microchip,sparx5-pcb125
>> +          - const: microchip,sparx5
>> +
>> +      - description: The Sparx5 pcb134 is a pizzabox form factor
>> +          gigabit switch with 20 SFP ports. It features spi-nor and
>> +          either spi-nand or eMMC storage (mount option).
>> +        items:
>> +          - const: microchip,sparx5-pcb134
>> +          - const: microchip,sparx5
>> +
>> +      - description: The Sparx5 pcb135 is a pizzabox form factor
>> +          gigabit switch with 48+4 Cu ports. It features spi-nor and
>> +          either spi-nand or eMMC storage (mount option).
>> +        items:
>> +          - const: microchip,sparx5-pcb135
>> +          - const: microchip,sparx5
>> +
>> +  axi@600000000:
>> +    type: object
>> +    description: the root node in the Sparx5 platforms must contain
>> +      an axi bus child node. They are always at physical address
>> +      0x600000000 in all the Sparx5 variants.
>> +    properties:
>> +      compatible:
>> +        items:
>> +          - const: simple-bus
>> +      reg:
>> +        maxItems: 1
>
> simple-bus doesn't have 'reg'. If there's bus registers, then it's not
> simple.
>

Ooops, that's a leftover. I'll remove.

>> +
>> +    required:
>> +      - compatible
>> +      - reg
>> +
>> +patternProperties:
>> +  "^syscon@[0-9a-f]+$":
>
> This should be under a bus node.

I thought it was? But anyway, with the change below I guess the entire
block goes away.

>
>> +    description: All Sparx5 boards must provide a system controller,
>> +      typically under the axi bus node. It contain reset registers and
>> +      other system control.
>> +    type: object
>> +    properties:
>> +      compatible:
>> +        items:
>> +          - const: microchip,sparx5-cpu-syscon
>> +          - const: syscon
>
> This probably should be in its own document. If really this simple,
> there's already syscon.yaml you can add to.

Good suggestion, I'll add it to mfd/syscon.yaml then.

>
>> +      reg:
>> +        maxItems: 1
>> +
>> +    required:
>> +      - compatible
>> +      - reg
>> +
>> +required:
>> +  - compatible
>> +  - axi@600000000
>> +  - syscon@600000000
>> +
>> +...
>> --
>> 2.26.2

--
Lars Povlsen,
Microchip
