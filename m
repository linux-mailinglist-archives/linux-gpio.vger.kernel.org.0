Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C621D1EB78B
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2020 10:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbgFBIjf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Jun 2020 04:39:35 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:44217 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbgFBIjf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jun 2020 04:39:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1591087174; x=1622623174;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=5oSerVw4BUQ1JnWRjiKwnbjMfhGlmnPWZ9idp3chc+k=;
  b=zjRFqhv5M3r0zwGkUD5i2LiNnp6m7DpLcE5qgVcf784esxprEfBISV9y
   zsmyAryr61/wd7BxPm1IDhTxssMkxEjJuwQvYSO/6D/HnTJxE872JhlRV
   85eSfwNWcqZeS0HDo0EsBRAN6TcLpDbE4aeiOAT2BB2FdlS34vsF+LGRI
   NRRNU/NjUywiijUeGz5UhCVy+DXaFr0broUIc+BWAp3an9UocOPRCWLia
   fQajAzBdXrV6oRD4Ey6u3ZBNeLkWotjMEhq3xx/rg7ebkTasUMjHCJqIK
   YiFYBaJcIS1YjGRtJi6+jc9aI/3UDSMnPI4UgK1aur6m32cFp5L+DpERg
   g==;
IronPort-SDR: CGzwFgZnx38dfzy3f8q8Xm+puJ33BFnb4DM1BvkqwaF38Hj7IETfB7dGjdAjeim4iMDvI27Bgb
 +yICiF7lLYVnRVeN2quM6SHW3LNULatRt9IgxD6Hmrc5Mj67Nzo2VUMQ4fhnN8yNRMhhUTlXTw
 6KLcvdEp5R6EdhQyGXTqq9+eC3ANvPCnHJ4q7XthvQrOvAPk/fETg5WqPtmUavy+SYUKK8t1lJ
 womw9WDinln+Lxa2xf8VRHl+rSWUFvWeazBmzkbVMb22LOT8PYyiB7Ovsoosv7e9z3TLTsGs4F
 G5g=
X-IronPort-AV: E=Sophos;i="5.73,463,1583218800"; 
   d="scan'208";a="81897758"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Jun 2020 01:39:34 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 2 Jun 2020 01:39:33 -0700
Received: from soft-dev15.microsemi.net.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 2 Jun 2020 01:39:18 -0700
References: <20200513125532.24585-1-lars.povlsen@microchip.com> <20200513125532.24585-11-lars.povlsen@microchip.com> <20200528021826.GA3221035@bogus>
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
Subject: Re: [PATCH 10/14] dt-bindings: clock: sparx5: Add Sparx5 SoC DPLL clock
In-Reply-To: <20200528021826.GA3221035@bogus>
Date:   Tue, 2 Jun 2020 10:39:29 +0200
Message-ID: <87h7vtq2ta.fsf@soft-dev15.microsemi.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Rob Herring writes:

> On Wed, May 13, 2020 at 02:55:28PM +0200, Lars Povlsen wrote:
>> This add the DT bindings documentation for the Sparx5 SoC DPLL clock
>>
>> Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
>> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
>> ---
>>  .../bindings/clock/microchip,sparx5-dpll.yaml | 46 +++++++++++++++++++
>>  1 file changed, 46 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/microchip,sparx5-dpll.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/clock/microchip,sparx5-dpll.yaml b/Documentation/devicetree/bindings/clock/microchip,sparx5-dpll.yaml
>> new file mode 100644
>> index 0000000000000..594007d8fc59a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/microchip,sparx5-dpll.yaml
>> @@ -0,0 +1,46 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/microchip,sparx5-dpll.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Microchip Sparx5 DPLL Clock
>> +
>> +maintainers:
>> +  - Lars Povlsen <lars.povlsen@microchip.com>
>> +
>> +description: |
>> +  The Sparx5 DPLL clock controller generates and supplies clock to
>> +  various peripherals within the SoC.
>> +
>> +  This binding uses common clock bindings
>> +  [1] Documentation/devicetree/bindings/clock/clock-bindings.txt
>> +
>> +properties:
>> +  compatible:
>> +    const: microchip,sparx5-dpll
>> +
>> +  reg:
>> +    items:
>> +      - description: dpll registers
>
> For a single entry, just:
>
> maxItems: 1

Ok.

>
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - '#clock-cells'
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  # Clock provider for eMMC:
>> +  - |
>> +    clks: clks@61110000c {
>
> clock-controller@1110000c {
>

Got that.

>> +         compatible = "microchip,sparx5-dpll";
>> +         #clock-cells = <1>;
>> +         reg = <0x1110000c 0x24>;
>
> Looks like this is a sub-block in some other h/w block. What's the
> parent device? That should be described and this should be part of it
> either as a single node or a child node. Without a complete view of what
> this block has I can't provide any guidance.

No, as Alex noted to a similar comment in the temp. sensor driver, the
chip is using packed register spaces predominantly. So don't put too
much into the register offsets.

---Lars

>
> Rob

--
Lars Povlsen,
Microchip
