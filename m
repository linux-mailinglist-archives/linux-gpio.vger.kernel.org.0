Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19DD62AF010
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 12:53:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbgKKLxj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 06:53:39 -0500
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:57142 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbgKKLxj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 06:53:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1605095619; x=1636631619;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=WSmJGeYv08kihbIdCx4Xr9p9GNTGzzp58lE9eX/ZuP8=;
  b=CDzEV9hgT1bGQphOtD+uPYNQ7lLEpJh73kfCHkqztEIYZyqBigI3rflG
   aoRbgcT96qdjdEePZRXh7hivAazfslKPF/C/GrActtPDx6AuGdlssYKhr
   aEewmv1RbynNwdDDEXVihuxiV/S/sDa8WetwBPjmzzNyPJZWsfyaoKthB
   VaQN15T1d04ZbRwVDohJMK7gbV+a33sgvaUvBWNAZ6FZFju3SlYXWdzsj
   0bVwo8KDMvdFc87k609FV4Y3vRayGT9h2MXDiDfOTq4qCmfipu1aZsol+
   9jRVfAf6HD15X1NroqBt8NYevxCpSlge5CWpSydex9FMicgYRbxbV2fkR
   A==;
IronPort-SDR: Vpk5sZaNn8l5nZ7DduYthRfjCryb7NYr1FPqIw/WSI6ptrNOjWWJgOF7ce395ziptShbSR5f8z
 +E66enIU5MTdecR05McBuk3xyxkFUEJZb7QMFTYCUSiVD4nTNpigMtNFyxBcmKhKbj2jgnPivz
 o2juzUj4beaVtF7TsIly+xuPn9/Nd9baj78aC1SC23+jdxWzyQj0Gj0KoooApXjKUGUJCChuyI
 x9ziOUkEqhOHYTQulL1xpBeNPsaUUCdV0J2+4Ju2j5Ukab4HBUGvqEiQCZNZUOQnAQtOWSGudS
 2Wc=
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="98026575"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Nov 2020 04:53:38 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 11 Nov 2020 04:53:38 -0700
Received: from soft-dev10.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Wed, 11 Nov 2020 04:53:36 -0700
References: <20201109132643.457932-1-lars.povlsen@microchip.com> <20201109132643.457932-3-lars.povlsen@microchip.com> <CAHp75Vdfm7A5=Mi-LZ1sHJS5fSngypZQ50-rGQ7A6kD2kmVFTA@mail.gmail.com> <87361hfbwu.fsf@microchip.com> <CAHp75VfZ=hJvpYiAOz72yRpJTxLU6ZOo9hEz4BsBcgSwAcjCFA@mail.gmail.com> <87zh3oe0nr.fsf@microchip.com> <CAHp75VfZRJuzvaYs-CKvxitfOxcNc-7j8MZA7FQvN0SQrPK6cw@mail.gmail.com>
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
In-Reply-To: <CAHp75VfZRJuzvaYs-CKvxitfOxcNc-7j8MZA7FQvN0SQrPK6cw@mail.gmail.com>
Date:   Wed, 11 Nov 2020 12:53:35 +0100
Message-ID: <87wnys3y9s.fsf@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Andy Shevchenko writes:

> On Wed, Nov 11, 2020 at 10:52 AM Lars Povlsen
> <lars.povlsen@microchip.com> wrote:
>> Andy Shevchenko writes:
>> > On Tue, Nov 10, 2020 at 5:51 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
>> >> > On Mon, Nov 9, 2020 at 3:27 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
>
> ...
>
>> >> >> +               return -EOPNOTSUPP;
>> >> >
>> >> > Are you sure? IIRC internally we are using ENOTSUPP.
>> >> >
>> >> > Couple of drivers seem to be wrongly using the other one.
>> >>
>> >> Checkpatch complains about ENOTSUPP:
>> >>
>> >> # ENOTSUPP is not a standard error code and should be avoided in new patches.
>> >> # Folks usually mean EOPNOTSUPP (also called ENOTSUP), when they type ENOTSUPP.
>> >
>> > checkpatch is wrong if this is internal code and to me sounds like
>> > it's not going out of the kernel.
>> >
>> > ...
>>
>> As it appears there are different opinions on this I'll let the pinctrl
>> maintainer decide.
>
> There are no other opinions.
> Read description of struct pinconf_ops and fix the code.
> checkpatch is simply wrong here.

Lets no start a war :-) - I'll change it...

>
>> >> >> +                       err = -EOPNOTSUPP;
>> >> >
>> >> > Ditto.
>> >>
>> >> Ditto.
>> >
>> > Ditto.

Cheers,

---Lars

-- 
Lars Povlsen,
Microchip
