Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7E0A2887A4
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Oct 2020 13:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387992AbgJILOU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Oct 2020 07:14:20 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:38309 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727181AbgJILOU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Oct 2020 07:14:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1602242059; x=1633778059;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=vjKYfbc9s5PmZNG8hn4fzkf70oXwnDet2wCdajG+jWc=;
  b=XNpqmPvRIkioT5HxPELU9cHjNN10TDXPgYpUvkvSb0avdXn/unpOmNIl
   FULIIl+t84D4BZbgYF0aJt52teLzAjKbRm1IBLzXpJOPzsSSo96NcSgFj
   jLy0Qta8FQRi/1Yln+biBHNJ3b+3t1cFGQ1aRBRWlMpESI3fR/t+2tEsd
   nIeUMMilaERh5uip+R8Slcb3mHSTNGqSa6StGSjqf/3bUkNKiEXED7iOz
   FJ4VtYng39GbZFK0C8haDHGUFuwQaIWFtHo0D329eVmB1Rsq/mEqosYqS
   moDNagGjtpIM7fOA83bDO6QkMn4xNoMgV9F46uholvL/9CnwEZN6xP7n9
   Q==;
IronPort-SDR: Ifxxhy0xAWh2KaxW2iYDKqG+/gC0f0xqoVn69/hoK+fBjpiQabnargewF3GPamd7kMyunjKO5f
 2xnkVWrljLfzh4O31eJOKRJw7rsGQ6hqrOWpofV1Q/Eb4EbTrfGrt5s8cLPT060E7HssZN836u
 74nLMRrqzrnQxyEKdoVH7YSi0rIUKgITbXwUuvf+w3uwpnV1N3EvclXw6GuQwnBwIvKrd7eLnP
 jReMy6MXx0hVeFBnqQd5fOqjpBO9LNHc5QwjSxwdH6PfbUTPva8AKOgBzk+vjZpYsL0e5ZcbdT
 7tU=
X-IronPort-AV: E=Sophos;i="5.77,354,1596524400"; 
   d="scan'208";a="29330444"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Oct 2020 04:14:18 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 9 Oct 2020 04:13:45 -0700
Received: from soft-dev15.microsemi.net.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Fri, 9 Oct 2020 04:14:16 -0700
References: <20201006142532.2247515-1-lars.povlsen@microchip.com> <20201006142532.2247515-3-lars.povlsen@microchip.com> <CACRpkda+OSgma3E0XxXUk8a2yrn5Hpu3a47cBN50rOkoSMkiwQ@mail.gmail.com> <87ft6px9wc.fsf@soft-dev15.microsemi.net> <CACRpkdYqKqqM8D0vrBWbo0=7OFthU2kcK2tjd45dD7DxEkaYWg@mail.gmail.com>
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [RESEND PATCH v3 2/3] pinctrl: pinctrl-mchp-sgpio: Add pinctrl driver for Microsemi Serial GPIO
In-Reply-To: <CACRpkdYqKqqM8D0vrBWbo0=7OFthU2kcK2tjd45dD7DxEkaYWg@mail.gmail.com>
Date:   Fri, 9 Oct 2020 13:14:15 +0200
Message-ID: <87a6wvy7lk.fsf@soft-dev15.microsemi.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Linus Walleij writes:

> Hi Lars,
>
> I'm overall mostly happy with the latest posting (not the one I respond to here)

I'm glad we're getting there :-)

>
> On Thu, Oct 8, 2020 at 12:57 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
>> > On Tue, Oct 6, 2020 at 4:25 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
>
>> >> +       gc->of_xlate            = microchip_sgpio_of_xlate;
>> >> +       gc->of_gpio_n_cells     = 3;
>> >
>> > So I'm sceptical to this.
>> >
>> > Why can't you just use the pin index in cell 0 directly
>> > and avoid cell 1?
>> >
>>
>> You scepticism has surfaced before :-). The (now) 2 indices relates to
>> how the hardware address signals.
>>
>> Each signal/pin is addressed by port, bit number and direction. We now
>> have the direction encoded in the bank/phandle.
>
> I'm sorry but I just don't get it, I suppose. To me it is pretty
> straight-forward
> that the cells indicate the pin and then the flags. I do understand you
> need the port at all, since this is implicit from the reg property
> of the DT node. Are these two different things?

I responded to this in your comments to the DT bindings.

I just for got to offer to add a description for "#gpio-cells", I see
that's missing. That should make it "crystal clear" - I hope!

Something like:

--- a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
@@ -86,10 +86,17 @@ patternProperties:
       gpio-controller: true

       '#gpio-cells':
+        description: |
+         Specifies the pin (port and bit) and flags. Note that the
+         SGIO pin is defined by *2* numbers, a port number between 0
+         and 31, and a bit index, 0 to 3. The maximum bit number is
+         controlled indirectly by the "ngpios" property: (ngpios/32).
         const: 3

       ngpios:
-        minimum: 1
+        description: The numbers of GPIO's exposed. This must be a
+          multiple of 32.
+        minimum: 32
         maximum: 128

     required:

Would that be adequate, or should this also be added as a comment in
microchip_sgpio_of_xlate()?

Like:

    +       /* Note that the SGIO pin is defined by *2* numbers, a port
    +        * number between 0 and 31, and a bit index, 0 to 3.
    +        */
            if (gpiospec->args[0] > SGPIO_BITS_PER_WORD ||
                        gpiospec->args[1] > priv->bitcount)
                                        return -EINVAL;

I hope we can put this one to bed...

---Lars

>
> Yours,
> Linus Walleij

-- 
Lars Povlsen,
Microchip
