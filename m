Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAD131D721E
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2020 09:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727831AbgERHnZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 May 2020 03:43:25 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:25993 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbgERHnZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 May 2020 03:43:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589787804; x=1621323804;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=FKJAh1HkVv8d/p5YjXylM2nem6uVcaMiV5E5Xj3YJxg=;
  b=N/Mo9gOdr8dLG92VO2vspqYTdC6ybwy06MNDNqrb1h5K4v4ruEkCkND2
   cu0mZo4ozsdylQg/voj7wziwalD74fTzC4IMIyACbyyecFeOtwRyzEi9N
   KbyGKXlPtFU3qM/y/WdEUaYyGmmDr6Vcw7og6K3x+WYJugwkF/lFSPCPo
   Zk5f8N1qrsFCjQf0gcqKGCriHJFBmulpA103J1MKUZDHkpXSJEv83QGGr
   z9bZiF3T8i7eiR5uFXkifdto6TQIulSIllcLw45pcNZvW2MQdntXxG7Av
   CJddKWzosR+z76xtTrSM9/5AZKAj3T4CtK1+RkmYrl/GSBabx5+Cvrwq2
   A==;
IronPort-SDR: 9nIYTc6j7tSmHkUO/HDAiU7Hl4ptKImLP7FdPLXeUtwqYerLqPzqdExoE6E93pFxzBah3KHWWG
 Q9JPG+I2MEL3gHJXGrutIvVYPjZUo1UEB3ylMVbpbguzVvgclguDsT6B3iZUd/aTMSYKFy83vM
 CmUy67KdBD33r96EVfEhNlaspRBqwP35OdPswMyZsL8Gqtsd2knoZobWdvb4W8vZXCFq31c9xV
 fWceeyx3oQjJyQHT8TKz77OVnpKjLO40OSg3akb7hIM2OYZrCRcRG94HfDVpY9JW6g17CLZwRG
 ScA=
X-IronPort-AV: E=Sophos;i="5.73,406,1583218800"; 
   d="scan'208";a="73738900"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 May 2020 00:43:22 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 18 May 2020 00:43:22 -0700
Received: from soft-dev15.microsemi.net.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 18 May 2020 00:43:17 -0700
References: <20200513125532.24585-1-lars.povlsen@microchip.com> <20200513125532.24585-7-lars.povlsen@microchip.com> <2d230dab95ee96727a42f9c242c93c18@misterjones.org> <871rnlp740.fsf@soft-dev15.microsemi.net> <18c0d9ef-9a2b-31d0-b317-f051bb26a907@arm.com>
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Robin Murphy <robin.murphy@arm.com>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Marc Zyngier <maz@misterjones.org>,
        <devicetree@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, SoC Team <soc@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        <linux-arm-kernel@lists.infradead.org>,
        "Olof Johansson" <olof@lixom.net>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>
Subject: Re: [PATCH 06/14] arm64: dts: sparx5: Add basic cpu support
In-Reply-To: <18c0d9ef-9a2b-31d0-b317-f051bb26a907@arm.com>
Date:   Mon, 18 May 2020 09:43:16 +0200
Message-ID: <87wo59ofhn.fsf@soft-dev15.microsemi.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Robin Murphy writes:

> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>
> On 2020-05-15 16:09, Lars Povlsen wrote:
> [...]
>>>> +             cpu0: cpu@0 {
>>>> +                     compatible = "arm,cortex-a53", "arm,armv8";
>
> Side note: only one compatible string for the real CPU please, running a
> DT bindings check should complain about that.
>

I'll change this.

>>>> +                     device_type = "cpu";
>>>> +                     reg = <0x0 0x0>;
>>>> +                     enable-method = "spin-table";
>>>
>>> Really? This is 2020, not 2012 any more. Surely a new platform
>>> boots using PSCI, and not *this*.
>>>
>>
>> We don't currently support PSCI. The platform does not have TrustZone,
>> hence we don't use ATF.
> AIUI, part of the purpose of ATF is to provide a nice standardised
> platform interface regardless of whether you care about Secure software
> or not. It shouldn't take much to knock up a trivial ATF port that just
> uses an internal spin-table for its PSCI backend - in fact I suspect
> that's probably just a copy-paste from the RPi3 port ;)
>

I'll change this to PSCI if that's whats expected these days. We
actually already have an ATF port. I fully understand the desire to
standardize on PSCI.

> Robin.

-- 
Lars Povlsen,
Microchip
