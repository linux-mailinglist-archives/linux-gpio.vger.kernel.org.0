Return-Path: <linux-gpio+bounces-4175-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C770873CDB
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 18:04:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 079342877F0
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 17:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B2C2137935;
	Wed,  6 Mar 2024 17:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Y+xtQED8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EDD60250
	for <linux-gpio@vger.kernel.org>; Wed,  6 Mar 2024 17:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709744654; cv=none; b=tWz1V+nK8NoO5Byqds3j1TEnFY4tmgrC11jeL1QAjQLcIeLqSplIauPGMn6lm7WhxaZXOYZTBaaDJa0lffXtES+7fk1ke7GQjIQ/iK8PsKrb1sfO0aGAG+1w5WvbfoQwBx244l2akHiUeiZqzrEI0169d+uMw3O/pC5X2JXf2n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709744654; c=relaxed/simple;
	bh=zCJVil0mq4+M/ra2YrVnsiW7a+Sefpm/BEjo1EaWOIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Re2XvhnyvD4WgURhDdfFvtWL3a9p5HiDjHgZPxYlSkWoCG5NeJya/mwOT9Hzd/mrx3upxg9zcsxgAu8AzkUbxkmxS73ltjG6HWAFzHqtvpdEhTfwbx1DC3dC0L8rScdbrqrDaCTjZgCIj4lueoYAAqb5wBULaa4eg8ZYgjVi5v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=Y+xtQED8; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1709744635; x=1710349435; i=wahrenst@gmx.net;
	bh=zCJVil0mq4+M/ra2YrVnsiW7a+Sefpm/BEjo1EaWOIE=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=Y+xtQED8tydGUuu/bTrPY93vUEwdnnz5xdHW3ZNmjj4idPa0YFsHfC95cTcaRuPW
	 vsipRrOQNXZKpwm3OGbQPcyN/km8RcDr7Xde+FvWu6fM7RiR+CH9vGV8qYcaK3uFh
	 nRRJx1YiPdVSaGeg4ph0GV/2T/zQAFij0rw7dM9AW8ZXYfMtKBDUmOrQmlaZiObyH
	 4TOvitk8ZuRiOBqbnBFDd8OC6yaYmO10UuSl6RW+q/cOB4JVvd+mSSqfadpXNXyyn
	 nInMOrvaB1sblkdhxFcPgvcCNQzAWwxgmYIBRG0AjdqE+tatrqCq5L8NiK0vd/hs6
	 VU5NbIWAbS6qLxpA0g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MplXp-1r3LaZ3MpZ-00q8ZU; Wed, 06
 Mar 2024 18:03:54 +0100
Message-ID: <54e7cce2-5111-4fbe-920f-692e27e2b6fc@gmx.net>
Date: Wed, 6 Mar 2024 18:03:53 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/2] pinctrl: bcm2835: Implement bcm2835_pinconf_get
To: wens@kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
References: <20240303140137.157522-1-wahrenst@gmx.net>
 <20240303140137.157522-2-wahrenst@gmx.net>
 <CAGb2v66XpjvDnTpi2=SPbeAPf844FLCai6YFwvVqvmF9z4Mj=A@mail.gmail.com>
 <CACRpkdZX2WHCggT2hvS86eLUq3pH6jYYpEFLbY4WwN6_Ya+mQw@mail.gmail.com>
 <CAGb2v67TFYZwCk1KViDHFVzuYX1QsA2E69UcJ-ZMMmw5UAxH8w@mail.gmail.com>
 <CACRpkdZ-6neizSv-F5jEJPZ-a_emoCbxM9AFqfzYSHTZFGnM1g@mail.gmail.com>
 <CAGb2v66Op2zSN1JrFEUCfBKxRL-W0cX=Pj18yym4FtWnNeGiXw@mail.gmail.com>
 <CACRpkdbni-oN5mNT9Z3GMueWaCjxDcmvjGHYet3YQubDowg58Q@mail.gmail.com>
 <CAGb2v6497xS8OQgDssGYw+7aNGeP31FGanJOT+sfZHF1ybAnEw@mail.gmail.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <CAGb2v6497xS8OQgDssGYw+7aNGeP31FGanJOT+sfZHF1ybAnEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WAt58O5uKUjVnzwZbguUn7tyQ8d6gskLcGt92chXos/5YIaAZIW
 GnCt3cNpHhWeXU/w67aoS1aW5xT/9FlY6QfUAgbHZ4OU+m4MPaUHlkpONAXrnwWjbLi8j+W
 NurYEEsZJrn/ojDjEgosi8tEEjVgvdQ6Wez8dxq4+YDKM8ZXoRPV69RB043POgh/4fp0B9a
 DkXBf6XaGsfLqYCwwvO3g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9AnADUN8PFo=;ssHwCldVAhuMohjZEfc9gQKsFv3
 BFXt0bZWdhwqHLUF4ie173SBdblb0cuTYs+Xvr53qW936uNGMNYZvLu0zNaYZ3SBE0i7HmV2L
 MSCMoQX3FnQzoN2UnzGpNZ1y7NzMIfn7HUyKesnRTngqsUCJAA1N13vyxtiIfJgQICWbzLajZ
 aaZrqrnx2RbXJ96gQrQz/XjZOqWZRZ3jQnTjlLSGlbqOzOCW7Nxb3AmGGc5PeSJQwwnM4OcrB
 e9qWyjHDWH6S61eEddjQ9BOHrO9euEHf5dQIozjgJWQrD6SRKmgQmAllJU5dj3vCTTn3GPTJw
 TEccD6+CGKuI7uSI+x9Xbaevyk1pBOpIdmLkbS+Ej9M3S5BKnLBekEZ3YXItWoseBFT9Ht0yF
 8LWtpTj0C7gkVCF8Q7+K/vrI1rx8f3+TUtbn8+LkYVTsIRj4E7PDM0iGQJoP3D0+BWQ2ptgvv
 vJlX0kO6N3U3t7qmJnhbbc3woVL09MQb/PWPLb8ruZrTfn5IMCmuSnSABGhZJzGm5ok9cO6WZ
 M3jHO8EyfF0CmC51h/gVONCy6gJdinWRlULuFjDvp40UOW5JCukCyOPwG8EaNV7KOA6C6a+Hi
 Nc+NKy73DO2CvThH2WLYoubqR9lpJ7dHTFw1AIfLdWKbkQxwqdBwIgu3W0q27YVV5RKxeUYJX
 jy6WD7W9ugzpWcXVeO8LlNr+c7PGQkhKukSN1Lr2pjxYJ22AVCatopPbQjsJZasoxxQ9jcxvj
 HGKLcQNYbEqMYKLCJ7U4PEE1uK38MZz+L0Kc3hRXsO5GbqovrJlDbCL7/hlUJtbT6vtruDIMg
 MpmbFinA9o5XirCQyG4a2FA4BwbiGuYZvKASe6RJs0zbE=

Hi guys,

Am 06.03.24 um 14:40 schrieb Chen-Yu Tsai:
> On Wed, Mar 6, 2024 at 8:57=E2=80=AFPM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
>> On Wed, Mar 6, 2024 at 9:55=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> w=
rote:
>>
>>> For the MediaTek device trees, the only two occurrences of "output-ena=
ble"
>>> actually describe conflicting information:
>>>
>>>      pins-rts {
>>>              pinmux =3D <PINMUX_GPIO47__FUNC_URTS1>;
>>>              output-enable;
>>>      };
>>>
>>> The above asks for the UART function on this pin, but based on existin=
g
>>> driver definitions, switches the function to GPIO output because of th=
e
>>> "output-enable" property. Hence the confusion.
>> This is actually also driver-dependent.
>>
>> It is only conflicting if the pin controller has .strict set in struct
>> pinmux_ops,
>> because many SoCs are perfectly capable of using a pin as a function
>> such as UART RTS and GPIO at *the same time*.
> I don't think MediaTek falls in this category. Nor does BCM2835. It is
> quite obvious, since GPIO in/out are selectable pinmux functions.
>
>> Details on strict mode can be found in Documentation/driver-api/pin-con=
trol.rst
>>
>> I don't know which Mediatek this is but:
>> $ git grep strict drivers/pinctrl/mediatek/
>> drivers/pinctrl/mediatek/pinctrl-moore.c:       .strict =3D true,
>>
>> Only the Moore family is strict, and I think BCM2835 is not.
> While that would be true for new drivers, I believe we do have many exis=
ting
> drivers that cannot set the strict bit, as existing device trees already
> have their pinctrl options selecting the GPIO function in conjunction wi=
th
> *-gpios usage. We also had this on older Allwinner platforms. We ended u=
p
> only setting the .strict option for new platforms, not because of any
> hardware difference, but because of backwards compatibility. Otherwise
> I would love to clean up many of them.
>
> In both MediaTek and BCM2835's cases, it is quite obvious from the drive=
r
> that the hardware cannot use the pin as a dedicated function and a GPIO
> at the same time. And we should not give them more options to shoot
> themselves in the foot.
i tried following your discussion. Does it mean i should change anything
here in this series?

Best regards
>
>
> ChenYu


