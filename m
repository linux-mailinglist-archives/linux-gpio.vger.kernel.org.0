Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACF382ADB07
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 16:59:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730285AbgKJP7b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 10:59:31 -0500
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:58662 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729909AbgKJP7b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 10:59:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1605023970; x=1636559970;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=0N7Na9r2kbBio0hWYqQA7bcLYhDmR5yStTYA7d1YCeA=;
  b=NZGhY/q09Wdxl1FcpTN7J8FHhqpUUVPuTSaps2dwspbJph39OWNs8Mj7
   slgFiZIH89GuwFmGdXwRqcXrIFmFTcfD9bqhjeTje9GDjrwovOxeqScQl
   eSgTbmZQtQFsobI9goeqOytA61wwa5MuqPA3IRtnVEqld0/5P8R/0VMag
   g87LRKNvGu7wFGo4tt88Zxk3tO56uzzyijZz75eGEd3Jwce2mhI1Tjoom
   ZonOb15/vNWUtZEGeY9xxkb5hmljcJovvGsNKqQZyMn6vr2PQOAIxGRaR
   Wr87SjJxBRbG2l2FbKxDRmvrCmR48sj5zAt7cnz+GNEXJiOnHRi4BeDVn
   Q==;
IronPort-SDR: hUbx+DnmA6cl3etvUuo+n8XIIKZvweW69dTEplN78vhEypddzFKZlpQbmsWUrvfF8F4o9bnLaF
 Ugh7zKK0w+Zp1pbC5sUYrx4HTWLoih1y5hKN6WrEKJaDw9EVyHlgp69V2L4mxuzJJhv1MwYaHt
 Y0GNY57BYcM6ClkBWx0N9blplphtos1P98mbra1/JbofkF52e0WBL8njL1sPpHMPrELt57fCRg
 Aiz04CEDIShYgHnzAmxu0ofIKK7CINeDuO/Emcjarb2Xs5BHTMmQWqBbz5qOeiQL4GxCyAAxf0
 DVo=
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="33098925"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Nov 2020 08:59:30 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 10 Nov 2020 08:59:30 -0700
Received: from soft-dev10.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Tue, 10 Nov 2020 08:59:28 -0700
References: <20201109132643.457932-1-lars.povlsen@microchip.com> <20201109132643.457932-3-lars.povlsen@microchip.com> <CAHp75Vdfm7A5=Mi-LZ1sHJS5fSngypZQ50-rGQ7A6kD2kmVFTA@mail.gmail.com> <20201109143237.GJ1257108@piout.net> <CAHp75Vc7eRDq5wUyUdvCZCnV_VS+afGnbJpQeDSeXVE9K_MGng@mail.gmail.com> <20201109152748.GA1691943@piout.net> <CAHp75VfcgyMEr3YscC2Na_RCTtd=ozCzCGq=UO6zKAa+9b4rqg@mail.gmail.com>
User-agent: mu4e 1.2.0; emacs 26.3
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 2/3] pinctrl: pinctrl-microchip-sgpio: Add pinctrl driver for Microsemi Serial GPIO
In-Reply-To: <CAHp75VfcgyMEr3YscC2Na_RCTtd=ozCzCGq=UO6zKAa+9b4rqg@mail.gmail.com>
Date:   Tue, 10 Nov 2020 16:59:12 +0100
Message-ID: <871rh1fbjj.fsf@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Andy Shevchenko writes:

> On Mon, Nov 9, 2020 at 5:27 PM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
>> On 09/11/2020 17:16:49+0200, Andy Shevchenko wrote:
>> > On Mon, Nov 9, 2020 at 4:32 PM Alexandre Belloni
>> > <alexandre.belloni@bootlin.com> wrote:
>> > > On 09/11/2020 16:17:40+0200, Andy Shevchenko wrote:
>
> ...
>
>> > > > > +               dev_err(pctldev->dev, "Pin %d direction as %s is not possible\n",
>> > > > > +                       pin, input ? "input" : "output");
>> > > >
>> > > > Do we need this noise? Isn't user space getting a proper error code as
>> > > > per doc and can handle this?
>> > >
>> > > Why would userspace get the error code?
>> >
>> > Huh?! Why it shouldn't. How will users know if they are doing something wrong?
>> >
>> > > Userspace should never have to
>> > > handle gpios directly or you are doing something wrong.
>> >
>> > This is true, but check how error codes are propagated to the user space.
>> >
>>
>> your point is to remove an error message because the error may be
>> propagated to userspace. My point is that userspace should never use
>> gpios and the kernel has to be the consumer.
>
> Tell this to plenty of users of old sysfs interface and to libgpiod ones.
> If what you are saying had been true, we would have never had the new
> ABI for GPIOs.
>
>> I don't see how your answer
>> is relevant here.
>
> I have an opposite opinion.
>
>> Did you already check all the call sites from the
>> kernel too?
>
> If you think we have to print a message on each possible error case
> (but not always the one) we will get lost in the messages disaster and
> dmesg overflow.
> It is consumer who should decide if the setting is critical or not to
> be printed to user.

I think the message is a valid one. I will change it to
dev_err_ratelimited() - that should prevent the dmesg flooding.

---Lars

--
Lars Povlsen,
Microchip
