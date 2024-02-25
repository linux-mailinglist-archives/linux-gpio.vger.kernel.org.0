Return-Path: <linux-gpio+bounces-3738-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC5B8629E7
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Feb 2024 11:02:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1776B2113C
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Feb 2024 10:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 761DCE556;
	Sun, 25 Feb 2024 10:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="ZSpD0Noi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6781D528
	for <linux-gpio@vger.kernel.org>; Sun, 25 Feb 2024 10:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708855334; cv=none; b=C8ZpL6X5cSSf/QuNtkPC8tIuJiKuO9X2NNjUn4tL0NOrQPAd22PLpDwEfP6hwoxQZ5+CRVOzp6zZ16XfQEFxgoxa+TehiW6y7O8TxpCH2gaZ8CJLv2Mg+C6UBp8O+u+i1z7mJUeSV9Fs+Bkk/IjJ69kM3ieyFr1A8MAJi0VoUjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708855334; c=relaxed/simple;
	bh=plTdIV2dgxaWe5AFD6OXXs/8/8wWkjt6j3SRiHS7NXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nr6wO0I+K/iXznx06GDOMnnCC3ayEqtYZVEZV85KpFnyw64npsZcWzWMxzTBpT+XC1QIYc/mLQbsKsmyxGCo4JnHG9WfGH3SuuFOT7MDBf0SM8gsqGl3iGYL78SY/QnpwTA5r6E11RnSZBtaO0wOHzOyQh04CvrTj1KPCryPWpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=ZSpD0Noi; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1708855289; x=1709460089; i=wahrenst@gmx.net;
	bh=plTdIV2dgxaWe5AFD6OXXs/8/8wWkjt6j3SRiHS7NXI=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=ZSpD0NoiGtBhnrDX301cxJWO63ZmLYP3cwhKCFM0/Z/l+0g6Z/hQYjaOkEEIm4N7
	 XDCI5JfSlVraG3ipUHekI27dfdHiESTMStxZ+PouAxlbDu/qoNG6Re+C3VUFHx38p
	 Z3WntjjcmEE7d0SqjZ+p0t549k+9QyIsiw2XiS2ww6eVLd8XgAIWRcqOHRI+fUQwQ
	 ilLpDJIT/VtaR3zDPIHWgA0bu4kZk6nII72+mhJxqb9mZVzxe/CysAR8tpuh4tQIY
	 v42i8YQKyOAn1aSXEny1mBRUM19ZytyX4azkvboAFEPSUAphCxFtcrqwdv3WwDE/e
	 wlqayPSwzzP84i7ijg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McYCl-1r3jRU2ker-00d2i2; Sun, 25
 Feb 2024 11:01:29 +0100
Message-ID: <9d729c9f-94cb-457f-8a40-3ba4d62fe627@gmx.net>
Date: Sun, 25 Feb 2024 11:01:29 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] pinctrl: bcm2835: Implement pin_conf_get
Content-Language: en-US
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
References: <20240204165852.166157-1-wahrenst@gmx.net>
 <CACRpkda=VsgiH0-iJVLry4hy6kLeJ_20mzMs8OrqR6Fr8eAp-g@mail.gmail.com>
 <1709f26f-0486-4856-8b2d-ba5e6fd492e2@gmx.net>
 <553aa585-c442-4329-8a4d-fcf2f9c110c1@broadcom.com>
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <553aa585-c442-4329-8a4d-fcf2f9c110c1@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iHixnaC8SiMQmHwoI9mBfEQlpMyjaleakMQYgy7G5+91JWkjEXo
 iv74JPxMpZY/p4rcwRlRuSA50JxQryMWdH54fnrzUowbrCZ+Tx7qPcDGQer23/dIgkC2K0z
 L0xTu7wLvYqVLaqfSaQeLzFnISCU78gqfL9FhRmRWj4pPoE77XtUmaj0LYuaF6soO9cmfRd
 FrV13DQj6cUpIReItf5/g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QOrs+zQBvks=;1AfsgWpGpYtFpT4KrJRDlIPDtpM
 9DYyxQt30Ur5PZoZGm9tSjr0pvJJ6yvrH1aNjgMNTKDG8zm0z0fKDVR/3tPrs70vd3jrdMgEw
 wseORbj0pUMN28Hi/DVUFcJO1fA2yKIE08c9k/kKzYB0EcVZFcSIKqLhSinVWVEGWJef2JAsE
 v/xx15VhOMsWnVOlnytfdsfrqGrCZLO+oscrdrbVDUCh63NiV4c+8ZqtrmjxKy/DYNVhp9q4p
 IzOHIYn2zN3Rgd8mpqUR5TP4yn8UdJIcjGArYBb+ZrRucD1GbPrQ6x3rj/Jxvu+sViWtzSTqW
 aFYio8KtoE2SNk9QrlELsR+j+z3iYrmVYsEyJ1El4T5u1sy47MzMDg5Lk3i7MjXVjWCOr77pu
 FrpWe/c+LLe3VgOgI0q1SP6A7TghDVoyhvtH1pTp6n8maZYcL7JMsUpzUroSKtOj97BGe5oLn
 G7qGOajpB3JeVAzm9DYyk3xjHpbVzzS6CmYPLsS+99eUPOGEl/d4BDCSVZRvOEgJYX+9DJI2r
 5VNAzKB2ZCZAz8A4M2YbG9GRVsaerb9a/A8yYV92f4CkwqhR0rzOST742qeeRFcuaOHPOnMVY
 65pXuforIOGeXyEsbBu25BtEiV/hD+x8/j1Sc2RPwG8c/AK9CO3+RfYARRVFpUFlj+mqZi9FL
 st+tiw+Wu/v5uc5eEFbqPY/F5A6axb5f+R13foiIby2a5tDJB1NIqF49+4Syb5s0xaNZI57xK
 TAfT9D1P+JTChSr8g8tBDKqHkDPIUzKUorS7q2KiS3+SeZay8pNa4BdvfAZmavnk3Rzxg77Ks
 V3IcAgdrXMubtGclbmsuxv1ReN7mCI5jIhXSwptutX00g=

Hi Florian,

Am 07.02.24 um 19:22 schrieb Florian Fainelli:
> On 2/7/24 03:33, Stefan Wahren wrote:
>> Hi Linus,
>>
>> Am 07.02.24 um 11:56 schrieb Linus Walleij:
>>> On Sun, Feb 4, 2024 at 5:59=E2=80=AFPM Stefan Wahren <wahrenst@gmx.net=
> wrote:
>>>
>>>> For years, the Raspberry Pi users relied on userspace programs to rea=
d
>>>> the pin configuration. In the meantime, it has become apparent that
>>>> this
>>>> approach has reached its limits for various reasons.
>>>>
>>>> This patch series now attempts to improve the debugging
>>>> possibilities on
>>>> the kernel side in order to reduce the dependency on these userspace
>>>> programs.
>>>>
>>>> Stefan Wahren (2):
>>>> =C2=A0=C2=A0 pinctrl: bcm2835: Implement bcm2835_pinconf_get
>>>> =C2=A0=C2=A0 pinctrl: bcm2835: Implement bcm2711_pinconf_get
>>> I don't see any problems with this, can I just apply the patches or
>>> do you
>>> want to first resend them as non-RFC?
>> since the second patch hasn't been tested with BCM7211, it would be nic=
e
>> to get a feedback from Florian or someone else with this hardware?
>
> Give me a few days to get there and I will run a test.

is there any chance to test with BCM7211?

