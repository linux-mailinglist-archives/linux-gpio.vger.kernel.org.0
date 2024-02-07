Return-Path: <linux-gpio+bounces-3054-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FB984C9A3
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Feb 2024 12:34:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35C18287332
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Feb 2024 11:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B0F1AADD;
	Wed,  7 Feb 2024 11:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="AjgtkgoM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1096AA0
	for <linux-gpio@vger.kernel.org>; Wed,  7 Feb 2024 11:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707305651; cv=none; b=RnZy6i+115RIXAlxbowEzcnKS6wzcmikCZteWdPP+nlTo17t5wP+NL2lGz9Q3N5oUGpdEitTr7lhmmK7jfdTf2kbOZLl5EqgU2fB+RKC414NzMvk5OVS5fyEV2ZybrE8lF+TwagYWesWKMFaOwh2swWuy4QDtnIbhmjd6TukOFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707305651; c=relaxed/simple;
	bh=r6AnrnUfvq1RjuHOgagltLP0FpYOAHTZyanpafyCLhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gThg6XLUvtgGxOrY2CDdYBqoslTltoU0d8KvTy5iXWgU/wvnarOzH9ZUhjruzKkUD+6EWv+G6eKBU4ig6Y6SWmO/GWPsxJhCswT/xoEmOIn5MZegiz2yoNzr8ALEcYu0WCBw/kykeBBAXNIC2q1euf6dyvDJpBxxSKZp1ZOFxJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=AjgtkgoM; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1707305638; x=1707910438; i=wahrenst@gmx.net;
	bh=r6AnrnUfvq1RjuHOgagltLP0FpYOAHTZyanpafyCLhU=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=AjgtkgoMSNksoJxHJwFbRFN8WZzAiG9a8VF3Rbj8ga+HHkXLSn5QE/dWjF0B47nq
	 7qB83nmpJuoNG7Cz+H/5twclg3jHjE6PIW31Tw9JTBpmiihVawzj1qde0v5SYJz+u
	 1/0TzATP6eXWFj4pGq3CAk0c8fx1ZAA/isvioYZSixAOZQRlpO0GXjZ4+ekMd/seJ
	 rEDvLEJ3zg3SadGsKcvJyHDqeFoxXI9Lu/gn2+fkqAv4RIFHann1blGClAzVU0HbN
	 SBQ+iq3A4JVwYq5gLBO6g+Fot42EnwMw0CQONJirGtgSE6G25xMYHE28p8G7t5pMn
	 +c3KPHYt1lpofWnmrg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mr9Bu-1rCLvU1BR8-00oIWe; Wed, 07
 Feb 2024 12:33:58 +0100
Message-ID: <1709f26f-0486-4856-8b2d-ba5e6fd492e2@gmx.net>
Date: Wed, 7 Feb 2024 12:33:55 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] pinctrl: bcm2835: Implement pin_conf_get
To: Linus Walleij <linus.walleij@linaro.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
References: <20240204165852.166157-1-wahrenst@gmx.net>
 <CACRpkda=VsgiH0-iJVLry4hy6kLeJ_20mzMs8OrqR6Fr8eAp-g@mail.gmail.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <CACRpkda=VsgiH0-iJVLry4hy6kLeJ_20mzMs8OrqR6Fr8eAp-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DapiP7m9qNJq8HxbAUPpa8HYxLblt+68v53udYBjGTkG6csPvau
 V0qAz9dNwJTXesywDpC9q21T7FJ9diz+eQgHaJ33zaIeeWKGy6Ku21xPXZcXuIJQCQ/s7Wo
 WrP5B3r5T2rMc8ehMJ5Bml24WStW6mDKt8Y5Hm9Uoat/WOWcW5oKI8I6U9GYaNIIOfukw5z
 7StqLnRk53akANEsuFZkw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:n0I+g6B+S9s=;YENi5n1hs/URtFnML1KTdNZav7y
 Gj6aN7LWJ1EUBNhsewEox+glbrUFOP6ai3bUFBrgsqvce7ZlR/f3XnbLzS1A3t2zt1Re1AoBr
 oXQ7lmc9tr6JXa9PPWUH1ZMXAXmgQcibOmY+kFmrpB/lA6WKVk+3IzkU2zT4bx+/9ht+9APIE
 1s7kdm0UmehV3rMPBLqPlBEpAT+yLwpnzKzO7o496ooUi9qI5sPs07Mfa58MbM+htI+ysqF2u
 v4LrNPpgohDycOkss7xzMa48DIAxwxB3v5H8+B4nRaLAaEzgbw6YpkrIaJhs10bLIQOtDS1Ub
 ryN9V9ruLUU3mwKpP/PXj0p27qwhKi4cD4EOjZvBuZG3Ux7OZFHbg7VZl3fJDzx6YzgVF+QeF
 fnEEmN323d0WtrGLdSUfZNcbEsdBmbKA63OLyzK7cyQKKO3V6W/aM7xH0eDeRPyuk0+jBJlwI
 AAtXq2J+DqiK++mp5kjbYUOC6BYXwJayvZAVw/5LFOZxzJABSkl9n0/r5w8qeNem6catygReu
 Tp9bDE/mdllogYiHmMJZdfQ33Ieu8KzLw8il6/R9X7lkMX41O9TRwpLVkdpQIbPL0J9tkVEQe
 Tuyij/VAaNb/oJFwIQC2zJDm+L811nN9DSMsIiAcrVYLj8TDnI3k9G/OUbVZDrT+YSojWhr0C
 hsy3hekMUaqiyyPEEo+GYP8A9DwkV9A/hNqVqz+ImZLah0KuWAnN+SuyXANaj2nQDsM/dmUmb
 XesYTfwVMe8uqcFZnoeEvv6J82tTOhBCIez5HAWDFtD4qjbj2JGqTeEZxOgTP7OPiepu3Dbqd
 C90YEFugNB0MUcer5gkk+v48ePNwx0wpHd0jxAhPDA/LY=

Hi Linus,

Am 07.02.24 um 11:56 schrieb Linus Walleij:
> On Sun, Feb 4, 2024 at 5:59=E2=80=AFPM Stefan Wahren <wahrenst@gmx.net> =
wrote:
>
>> For years, the Raspberry Pi users relied on userspace programs to read
>> the pin configuration. In the meantime, it has become apparent that thi=
s
>> approach has reached its limits for various reasons.
>>
>> This patch series now attempts to improve the debugging possibilities o=
n
>> the kernel side in order to reduce the dependency on these userspace
>> programs.
>>
>> Stefan Wahren (2):
>>    pinctrl: bcm2835: Implement bcm2835_pinconf_get
>>    pinctrl: bcm2835: Implement bcm2711_pinconf_get
> I don't see any problems with this, can I just apply the patches or do y=
ou
> want to first resend them as non-RFC?
since the second patch hasn't been tested with BCM7211, it would be nice
to get a feedback from Florian or someone else with this hardware?

Best regards
>
> Yours,
> Linus Walleij
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


