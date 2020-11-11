Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 897412AEC5D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 09:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbgKKIwa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 03:52:30 -0500
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:55759 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726221AbgKKIwa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 03:52:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1605084749; x=1636620749;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=mPPy1TkcVOlW/Zjck2Emjg838QadGoDmShOXyWNzpns=;
  b=fKtP3O0POp+1kmQ15AGUDU196cBf1tDpgc71CqLRqhphd1lTRY7UpETS
   1UHkz2i3VN/uBeTagbIj7We0KIFO+MusJAqKbCziLaA8MwJwOLwN/SzA+
   gHl0dVtw2VkEJw62fq01bv7S/0WKFeabXnxLbM/EL3e7tOu17TEO6BU/9
   lmX+Eq/ep4OkAx/ZQbD459LiAGWEU4KCIsXGolFwKRNVY1a/BG72aMeuN
   XVIJQ5ZXjcGlcIDXUOnHn0rprj94100vRxxZEeej+m4o+My7CbAf+bzD7
   Q54BsOArzCq735haCaG4n7Dtrt5JXqnyAP1v0SeTwj2Exh+eRvMvq5LJg
   Q==;
IronPort-SDR: vriVf8UGjCnWN9V1LMJVSV66qS6uYu96PDzWV8heInFGVS3xNRLeUhigGq6SrUWEgFCLf+xD5Q
 5SNx2NqrpRHKkmjbP6xjwKJ0Aa/CB7RHEwHx/hU0d6eWiX4CkwulRDBfCuy8bmiPAzj859x0wM
 Xh4drdJEfsWayKYHbwk1GzbbP5wXbJDfac8ZfcNvHj24Dc/tpjBbYg7GPj+Gwk7rmw8MkB/gZc
 tIHKAW5GuLMnFWieBTq1+s1v3M8h3KBxlYL/DrdBiukeOx2vwPUpe602nOKPTsmRPFjt6LNo4D
 Tec=
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="103025944"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Nov 2020 01:52:29 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 11 Nov 2020 01:52:28 -0700
Received: from soft-dev10.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Wed, 11 Nov 2020 01:52:26 -0700
References: <20201109132643.457932-1-lars.povlsen@microchip.com> <20201109132643.457932-3-lars.povlsen@microchip.com> <CAHp75Vdfm7A5=Mi-LZ1sHJS5fSngypZQ50-rGQ7A6kD2kmVFTA@mail.gmail.com> <87361hfbwu.fsf@microchip.com> <CAHp75VfZ=hJvpYiAOz72yRpJTxLU6ZOo9hEz4BsBcgSwAcjCFA@mail.gmail.com>
User-agent: mu4e 1.2.0; emacs 26.3
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-arm Mailing List" <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v8 2/3] pinctrl: pinctrl-microchip-sgpio: Add pinctrl driver for Microsemi Serial GPIO
In-Reply-To: <CAHp75VfZ=hJvpYiAOz72yRpJTxLU6ZOo9hEz4BsBcgSwAcjCFA@mail.gmail.com>
Date:   Wed, 11 Nov 2020 09:51:52 +0100
Message-ID: <87zh3oe0nr.fsf@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Andy Shevchenko writes:

> On Tue, Nov 10, 2020 at 5:51 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
>> > On Mon, Nov 9, 2020 at 3:27 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
>
>> >> This adds a pinctrl driver for the Microsemi/Microchip Serial GPIO
>> >> (SGPIO) device used in various SoC's.
>> >
>> > Please, elaborate what you said previously, because now it has no
>> > justification to be a pin control driver.
>>
>> As previously stated, the individual pins have possible other functions
>> than GPIO. When these functions are added, the driver will need pinctrl
>> functinality. This was accepted by Linux Walleij.
>
> Yes, I understand that. What I meant is to update the commit message
> to tell this to the reviewers / readers / anthropologists.

Ok, will do.

>
> ...
>
>> >> +               return -EOPNOTSUPP;
>> >
>> > Are you sure? IIRC internally we are using ENOTSUPP.
>> >
>> > Couple of drivers seem to be wrongly using the other one.
>>
>> Checkpatch complains about ENOTSUPP:
>>
>> # ENOTSUPP is not a standard error code and should be avoided in new patches.
>> # Folks usually mean EOPNOTSUPP (also called ENOTSUP), when they type ENOTSUPP.
>
> checkpatch is wrong if this is internal code and to me sounds like
> it's not going out of the kernel.
>
> ...

As it appears there are different opinions on this I'll let the pinctrl
maintainer decide.

>
>> >> +                       err = -EOPNOTSUPP;
>> >
>> > Ditto.
>>
>> Ditto.
>
> Ditto.
>
> ...
>
>> >> +               dev_err(pctldev->dev, "Pin %d direction as %s is not possible\n",
>> >> +                       pin, input ? "input" : "output");
>> >
>> > Do we need this noise? Isn't user space getting a proper error code as
>> > per doc and can handle this?
>> >
>>
>> This need not go to user space, as one use-case is using the pin as a
>> i2c mux. In this case no signs of the error condition is recorded, it
>> just doesn't work. So I concur it is not noise, it is sign of an
>> erroneous situation which should be fixed, IMHO.
>>
>> The message makes it easy to locate the issue, if any. The message will
>> not occur on a properly configured system.
>
> It's noise. As we discussed with Alexandre (and I guess came to the
> same page) that its consumer's business how to treat the error.
>
>> Lets have the maintainer make the call.
>
> ...

I digress. I'll remove it.

>
>> >> +static int microchip_sgpio_get_ports(struct sgpio_priv *priv)
>> >> +{
>
>> >> +}
>> >
>> > As per previous version comment, i.e. perhaps find an existing API for
>> > this kind of parser or introduce a generic one.
>>
>> I fixed the use of OF api's - that was surely an oversight.
>>
>> I have searched for a suitable API without finding one. The closest
>> thing was the parsing of "gpio-reserved-ranges" in gpiolib-of.c, but
>> that was coded directly. So I think this might not be of general use.
>>
>> If it is, lets do that after the driver is merged.
>
> I guess it will be a lot of benefit to have such API earlier than later.

Thank you for your comments. I'll send the new version shortly.

---Lars

--
Lars Povlsen,
Microchip
