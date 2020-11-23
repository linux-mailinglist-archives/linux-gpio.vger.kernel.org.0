Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94C0D2C0E6C
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Nov 2020 16:07:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732050AbgKWPGG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Nov 2020 10:06:06 -0500
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:34145 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729602AbgKWPGE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Nov 2020 10:06:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1606143964; x=1637679964;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=SZKdsVisH2xj8OOk97XoqM3QGAQYL5iB0nFf752OqB4=;
  b=XTq788LlY8yaeKfm2OK0O9PnGilQJU0uEytMVyVmGdE3rQFWTgH0ai26
   WENqBtGxqwC9ux0NvuTfJwkwbAXiKyte3Ny2LwkaBkfRJG80+P8a2usRh
   cxY8O1/+ErFdyR7zFWf4c/tda4Xl3j/4TChtbTZu13Zv1Y3FSnvoq65rU
   JzGajJUlRSzhnUE1tgreqR0ChJhKS1qaxXj9zw3E9BJs/Cmy21x+U8Diw
   D35ny5W+yZAgWNQMxzpViZXew/jVCVsGrr4E/eclncwbeuTRXDMAqKzlA
   Nv0ZXMAj2AzGQH09JfiWIc+yqg+DGkgxqSTTlQhRi0+Y1SPx1BAupH+6R
   g==;
IronPort-SDR: +ouTkoeXgtdlGkMSfeQmxvFgWWu9hWP9NpkSCwbXthlatuhCXvUxS+z+s+wGVy5h9wFukO6cLs
 yjxHQGNW1g0AvShb1SWodoac6ghYVXBexR15HxdyQRhuUteGYmABL7/Ki9LEGYVWOTfIDVs0/I
 dHI7R6UXBOSThWhFmEyUGoP9lZsG5xfNVxte3MVuEr6bdgPNhi2GOg7RhzzfkZiDhqKIC2FKLo
 9xlp5qHb4mAZdiTQkv1IiGHjZTNyB+AJZXkvTOTo6HR82mZzbsaSFBmOURL0e/ANiIV8iqfrR3
 /f0=
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="99504032"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Nov 2020 08:06:04 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 23 Nov 2020 08:06:03 -0700
Received: from soft-dev10.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Mon, 23 Nov 2020 08:06:01 -0700
References: <20201113145151.68900-1-lars.povlsen@microchip.com> <CACRpkdZAc2yKFpngBHCdxjFBpc0XCVAYWyEERMSHX+7sL7Fgrg@mail.gmail.com>
User-agent: mu4e 1.2.0; emacs 26.3
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v10 0/3] Adding support for Microchip/Microsemi serial GPIO controller
In-Reply-To: <CACRpkdZAc2yKFpngBHCdxjFBpc0XCVAYWyEERMSHX+7sL7Fgrg@mail.gmail.com>
Date:   Mon, 23 Nov 2020 16:05:56 +0100
Message-ID: <87pn443ygb.fsf@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Linus Walleij writes:

> On Fri, Nov 13, 2020 at 3:52 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
>
>> The series add support for the serial GPIO controller used by
>> Microchip Sparx5, as well as (MSCC) ocelot/jaguar2 SoCs.
>>
>> v10 changes - anniversary edition (from Andy):
>>  - Fixed "Author" comment
>>  - Added missing "break;" in default switch case
>>  - Return -EINVAL when requesting pin disabled in bitstream
>>  - Change bank consistency check to return -ERANGE if failed (-EINVAL
>>    previously)
>
> Patches 1 & 2 applied to the GPIO tree!

Excellent!

>
> Patch 3 needs to go to the SoC tree.
>

I'll forward this in a PR for Arnd.

> Thanks for your hard work!

Thank you to both you and Any for good comments.

---Lars

>
> Yours,
> Linus Walleij


-- 
Lars Povlsen,
Microchip
