Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 741AFC0C13
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2019 21:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725813AbfI0T3L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Sep 2019 15:29:11 -0400
Received: from mout.gmx.net ([212.227.15.18]:34015 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725789AbfI0T3L (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 27 Sep 2019 15:29:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1569612522;
        bh=LqPvzgMl3M/SdWVKtQw9Xc3eQlGWH+qD7BITZ5irqno=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
        b=CFD2KyoQN+r9Ao45VZBsbIkex6rouXGNx1P6G9ThoDHBExPJePHm/mFyYEjY6E1Y0
         9tF31PL87m2KUNY8iIF4Wlg9Stde9oWqgOfZdD1aV55hn1KqF6JonvtK1qOgYr63iE
         s6IoYlu33Ng8vSgNisENPwrtpCvm5IM1D12y0SlA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.162] ([37.4.249.130]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDQeK-1iL3BU1H7u-00AWac; Fri, 27
 Sep 2019 21:28:42 +0200
Subject: Re: [PATCH 12/18] pinctrl: bcm2835: Add support for BCM2711 pull-up
 functionality
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Matthias Brugger <mbrugger@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>
References: <1563776607-8368-1-git-send-email-wahrenst@gmx.net>
 <1563776607-8368-3-git-send-email-wahrenst@gmx.net>
 <CACRpkdabfiDbGmAQciAUSThY-KfTsVq3tHz0bBszs2j_ej18Nw@mail.gmail.com>
 <63f17284-5551-9492-9eff-f8a4c003196b@gmx.net>
Message-ID: <66dc2cad-673e-0a0b-0aeb-3d62fa2d4ccf@gmx.net>
Date:   Fri, 27 Sep 2019 21:28:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <63f17284-5551-9492-9eff-f8a4c003196b@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:m931275HWhQSHbM32Q2ns3BKfQMzOJGFIpVmiNhwMIwCERHWzwd
 GdA69OHtFGIOg9L5HvHVmVV3UkZrKSNrU1wrNrTrky0BgiM6pkL1wOsGdtF74/GJA8dUsL4
 cgwvQDVUiL9Pm/Ud8wSyB2rsofVTjJzglVE8JkOnMkrZMQZOlogqd55IfwqzPlq/sQN66uQ
 SbJfpK26XEFSWZYIYKZng==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uN12ArYQTqI=:N2NdjvtlX4d+KMqCzXJHy/
 LwlhKOBE/9+a9x3NcTCDBva1MO3aWOUJ9NLD8FY8LfUaXhtKi+hLyT6eX/TgZ0JwQffNLEOLd
 k3YG7QOhWAwmUT8luYD5rqOOoJAPAYU/kSZ/dMIsKwVI5GEfyY0oJoa73RBU9amnDwF4htCC8
 eASmoCkk1jUcfkgc16pP07tG2jgDS0DJIqNg67w/vT29LGeneTzWMi+kl1AVtzf2L6sZ/yPe3
 K1ZHogbIjyXtKPhheOVHXuAOW1n10r44AsS9/Hyr8oEMx2ctp2u4gN1GKoUKh46A+PgINUrHa
 7CDTeVxYcB6mMjLgLMhlZMXq+0dOrrBjoFaOtznayoG1VG2uWR3Z5Yoev9/OFebhIDxke4G4G
 BGfSgSPkx2Gr6zfaQTRXgL5K5WnzpYMhDcRW3UQAH0pb7Re7l7UjbqKzCvjOUCZroF9lvsuq7
 vjjMHUrO9bAWULnwOBXK3HJVHfhRStCnsRTqwWMAHSbxfLY5SAXTf/YJ3WxE0yRwRth/5Dkhd
 /8N+ZtIgDittChpexcidZDuk5rBKQTeJTHVUNuVjBUpDT2DQH/bcJDyXMBgL8pW0GBN/TSi/o
 jYHO5JICD8dEFBw8CSytfGLxdrJ+dTKu2POAjRJLbRVwtqslQuWDleU/OW8XBqlSv/94ZkOnE
 Y95Pid0hPoKc/tDL4Uh50woskDPHbKs8CbNTIVCOmO7VncTfMXhTFQAB0rYU2hUI084mQSH/E
 Y4intc7DUfM9TXEyxaEzIfixP9E8SNH/vIN+KFz+0gLN0TYfvvp0VkudBJYZyGjacmOwW3uYv
 pf9Xbav0+2tFPkwOS6Hagg/G68wBTQbPCxFOFZ8UcRZTwI9TZ+2aO8IyF8z8OhhJ41KpOIIsf
 4olVDb3hZM1qD55CB87cG2jkoh95F5jEk+SV8ftkSEPvs7e0RDAp9EUyuUnKaWRjTrSxX7iNm
 ZB+ypwn3RtH5PptbzJehT80bnh7axN5VqF/bXici45WkmE0eT+kUgcPmFAYHErECRGg2U7sBA
 icyTIZArbl3s1Q97JadbxnQejrSEXPpMJqpvwLHysMTlrKO5862x1QN6syEfnodYahbbnUuo9
 cb38ECoRlWvv7h9GEsZi2Ael5+QdQ9luDG++oENAKEdip37ptpaeATr4xxnpbZJBidLqaIXz9
 9yTLDtC0IW0KsWarjkuxC+i1WD2xGhR9dhAzZcjZla9kaj2zqDpzPJ51sjUqtGb18b4jNPfW3
 2Z+PvXvA/I/3+7uB2n/6d7j8U1d1lUJ9O5zdBCM9MosPZe9prr3C83puXKQU=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

Am 11.08.19 um 22:15 schrieb Stefan Wahren:
> Am 05.08.19 um 11:38 schrieb Linus Walleij:
>> On Mon, Jul 22, 2019 at 8:24 AM Stefan Wahren <wahrenst@gmx.net> wrote:
>>
>>> The BCM2711 has a new way of selecting the pull-up/pull-down setting
>>> for a GPIO pin. The registers used for the BCM2835, GP_PUD and
>>> GP_PUDCLKn0, are no longer connected. A new set of registers,
>>> GP_GPIO_PUP_PDN_CNTRL_REGx must be used. This commit will add
>>> a new compatible string "brcm,bcm2711-gpio" and the kernel
>>> driver will use it to select which method is used to select
>>> pull-up/pull-down.
>>>
>>> This patch based on a patch by Al Cooper which was intended for the
>>> BCM7211. This is a bugfixed and improved version.
>>>
>>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>> Patch applied.
> Thanks
>> I think I complained about some other version of this patch, this one
>> looks entirely acceptable.
>>
>> Can we get rid of custom pull settings etc from the upstream device
>> trees so we don't set bad examples? I have a strong urge to
>> throw in a pr_warn() about any use of it.
> Ironically, my pre-RFC version tried to convert all BCM2835 pinmux
> settings to generic ones. Unfortunately it seems that i made a mistake,
> because it didn't work as expected. Since we stumpled above more and
> more other issues (not relevant to pinctrl) during upstream review, i
> decided to start with legacy pull-up support, so we can fix this later
> in the devicetree for both platforms (currently BCM2711 uses most of the
> old BCM2835 pinmuxes including the legacy stuff). So yes my plan is to
> fix this soon.

today i had the time to try this out. Instead of the following:

=C2=A0=C2=A0=C2=A0 i2c0_gpio0: i2c0_gpio0 {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 brcm,pins =3D <0 1>;
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 brcm,function =3D <BCM2835_FSEL_ALT0=
>;
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 brcm,pull =3D <BCM2835_PUD_UP
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0=C2=A0 BCM2835_PUD_OFF>;
=C2=A0=C2=A0=C2=A0 }

you want this?

=C2=A0=C2=A0=C2=A0 i2c0_gpio0: i2c0_gpio0 {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pin-sda {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 function =3D "alt=
0";
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pins =3D "gpio0";
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 bias-pull-up;
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 };
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pin-scl {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 function =3D "alt=
0";
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pins =3D "gpio1";
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 bias-disable;
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 };
=C2=A0=C2=A0=C2=A0 };

Unfortunately i don't know U-Boot is handle the BCM2835 specific pinctrl
functions.

>
> Stefan
>
>> Yours,
>> Linus Walleij
