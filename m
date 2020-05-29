Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 474421E7F9A
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2020 16:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbgE2OEj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 May 2020 10:04:39 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:8703 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726898AbgE2OEi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 May 2020 10:04:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1590761078; x=1622297078;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=sAGWaqia1JF0ryeRDXVzFPeaOltQyl1NGW+wvlqDi/E=;
  b=URWVUOZqjoRzONnnH/q05xZjn/+tJ5OFy7pO4A+Xk04NClzFwzEmk4o0
   oCWnUXvIo8Wr+e7NX4gZd3ZxcXRAD91ziqCgppCunRr+bfiTFYkbpxvnr
   yRJPrOPmoTdwXF89Mps9VhpjPZi0eYEoLE9KGjR2p9lCx2JEm2MTt6Kpi
   1dNTJhotEvcLn4RhZUA0Q1SRj3UuAhNBR2cur/hAD4kAbfpqiyUtRjhSV
   8GYqQJw47Wu3LzpeGDd1dAwwUKdE5YkCycXSX2rgERb7R6YAmHsEcSCIb
   h++3ncSfc75VYDZJ0DWPYwEwcmUVFsLrokUlKsOY7EfsbW+oN3GThFvoF
   Q==;
IronPort-SDR: xpzqGjpyykV5Ih2wHq02FXx0AqsGr/X8yLZnO6sUmywda4kivT2QCL6RfgUMu/+Mo7l9o/BFdz
 eE5+qVqCa2lVZL5SDnAKAB9ZWgFApKonr+D6Tn6LKVvhGj0EMsHHtXKOQO4hBQk4pAhpJdC3/T
 oSeo8ia8aXe0OQprk4ftk7b2Q5mkFCr7fBh1lEuOKj3veab6yAchm6/zODKBhgT3fNGupVkkZX
 NyNMfNrLKlKmDbgry41qbg+dHhM/zAN07j+tX4W+FU0kPMqY2yjRRAJZ5m8BXBRwZSwDb8/s93
 CCI=
X-IronPort-AV: E=Sophos;i="5.73,448,1583218800"; 
   d="scan'208";a="76764161"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 May 2020 07:04:37 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 29 May 2020 07:04:40 -0700
Received: from soft-dev15.microsemi.net.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 29 May 2020 07:04:25 -0700
References: <20200513125532.24585-1-lars.povlsen@microchip.com> <20200513125532.24585-11-lars.povlsen@microchip.com> <159054759981.88029.2630901114208720574@swboyd.mtv.corp.google.com>
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Stephen Boyd <sboyd@kernel.org>
CC:     Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, SoC Team <soc@kernel.org>,
        Lars Povlsen <lars.povlsen@microchip.com>,
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
In-Reply-To: <159054759981.88029.2630901114208720574@swboyd.mtv.corp.google.com>
Date:   Fri, 29 May 2020 16:04:32 +0200
Message-ID: <87lflaq1lb.fsf@soft-dev15.microsemi.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Stephen Boyd writes:

> Quoting Lars Povlsen (2020-05-13 05:55:28)
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
>
> I don't think we need this sentence. Please drop it.

OK. (Assuming the "This binding ..." part).

>
>> +
>> +properties:
>> +  compatible:
>> +    const: microchip,sparx5-dpll
>> +
>> +  reg:
>> +    items:
>> +      - description: dpll registers
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
> Node name should be clock-controller@61110000c

Ok.

>
>> +         compatible = "microchip,sparx5-dpll";
>> +         #clock-cells = <1>;
>> +         reg = <0x1110000c 0x24>;
>
> Does it consume any clks itself? I'd expect to see some sort of 'clocks'
> property in this node.
>
>> +    };

I changed the driver to use a fixed-rate input clock, replacing the
BASE_CLOCK define(s). Additionally, I made the ahb_clock into
fixed-factor clock using the A53 cpu clock as a base.

So I updated the example and added 'clocks' to the schema.

I will send you a new series shortly.

Thank you for the comments.

--
Lars Povlsen,
Microchip
