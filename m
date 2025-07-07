Return-Path: <linux-gpio+bounces-22892-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED27EAFB67F
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 16:50:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E74C164D59
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 14:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED032D97A5;
	Mon,  7 Jul 2025 14:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orca.pet header.i=@orca.pet header.b="VYDIQ8bI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout2.mo534.mail-out.ovh.net (smtpout2.mo534.mail-out.ovh.net [51.210.94.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F73A28A1D6
	for <linux-gpio@vger.kernel.org>; Mon,  7 Jul 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.210.94.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751899803; cv=none; b=iVN+ngvCFEW/ikFvzqAIWv1FIPErW7DWmR4mI/0GvvVT1BH8eykej5oIfnc2GhPon9hMCBvZmFo8gCdK49FjcnWPC+fAodaIvfQ26PEmjrR0befek3TUEezVo6LR0xh5xBvpwQAl0oKf1YmRP6K5l9MbrZmw4mvmRLBPVCtRup0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751899803; c=relaxed/simple;
	bh=zdEdHDTjhZ5ckA/m4c31bIgqREMkIWk9k23WQNtiaEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IkAb0Boa53lQplpGVpllwiBEEM6TLPIJF4NA+R5+B2uu2gTFwAqy6TyncFzz/opJhQfNHqSiY01m6b+aurnnNsi2G8KP8A4J6rFH76S028BTRUBlbm1F7O3ip0ncc7Bjs1og7LSpTcfUEJQ/q946xkKuGBdm9RC+XWn/pFRvFp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orca.pet; spf=pass smtp.mailfrom=orca.pet; dkim=pass (2048-bit key) header.d=orca.pet header.i=@orca.pet header.b=VYDIQ8bI; arc=none smtp.client-ip=51.210.94.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orca.pet
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orca.pet
Received: from director4.derp.mail-out.ovh.net (director4.derp.mail-out.ovh.net [79.137.60.37])
	by mo534.mail-out.ovh.net (Postfix) with ESMTPS id 4bbRwb4QCwz6Fg8;
	Mon,  7 Jul 2025 14:49:51 +0000 (UTC)
Received: from director4.derp.mail-out.ovh.net (director4.derp.mail-out.ovh.net. [127.0.0.1])
        by director4.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <brgl@bgdev.pl>; Mon,  7 Jul 2025 14:49:51 +0000 (UTC)
Received: from mta7.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.109.231.53])
	by director4.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4bbRwb0w8Fz1y3l;
	Mon,  7 Jul 2025 14:49:51 +0000 (UTC)
Received: from orca.pet (unknown [10.1.6.6])
	by mta7.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id 59EE7C3CDA;
	Mon,  7 Jul 2025 14:49:50 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-99G003226193a2-2a6d-4ede-9af5-e8ebec56eebd,
                    F886D19416C0B9BC8E07D11B456840F184BAC853) smtp.auth=marcos@orca.pet
X-OVh-ClientIp:79.116.47.195
Message-ID: <3f80b31d-855c-4591-9237-272895165f13@orca.pet>
Date: Mon, 7 Jul 2025 16:49:44 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: vortex86: add new GPIO device driver
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-gpio@vger.kernel.org
References: <20250707132154.771758-1-marcos@orca.pet>
 <CAMRc=Me5dfNFLS1qF0AWgg8sb_vk9J=d-JV3-C5xWv7pZM+sFg@mail.gmail.com>
Content-Language: es-ES
From: Marcos Del Sol Vives <marcos@orca.pet>
In-Reply-To: <CAMRc=Me5dfNFLS1qF0AWgg8sb_vk9J=d-JV3-C5xWv7pZM+sFg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16037036800080565979
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefvddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepofgrrhgtohhsucffvghlucfuohhlucggihhvvghsuceomhgrrhgtohhssehorhgtrgdrphgvtheqnecuggftrfgrthhtvghrnheptdegudfgiedugfekudfhlefgjefguedvjeffieevgeetjedvvdeihfeiudejvdehnecukfhppeduvdejrddtrddtrddupdejledrudduiedrgeejrdduleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehmrghrtghoshesohhrtggrrdhpvghtpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheefgegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=OJu8pJoid5qMGA+qH1sillUwasBPAhGzZR0zvE2aRfI=;
 c=relaxed/relaxed; d=orca.pet; h=From; s=ovhmo-selector-1; t=1751899791;
 v=1;
 b=VYDIQ8bIzbLQZfTrc9BetegfdOkRinM3Pn/VY8VcgnLmYh097v0eoWJrxIgcd8Tsvn2pSoU8
 hiTpGjJOjquzBvWQchMUzH3ZScKtNkYAtzSRkR4D+t41udrfq+kACDOF7JzugMNobx4ML4kipKV
 4bAmlfby201ZgrhmgtgkLvr6JTM/6PsT7kGt/dmzttDdk+rLDyWrf4YqcrC+Kte5WByyQHWb8Rd
 d8DfyR/uUV2x1LhKamyQZfjZShuqRCos1rK/OKDzcTjiEBPykoJ7t/PqMSppUp2Kw9FT23iBoSZ
 CkH/SszOpk99p6Dy8gGzjIodSnuN4KR+KvR4ZuU825vdA==

El 07/07/2025 a las 16:10, Bartosz Golaszewski escribió:
> Hi!
> 
> This patch immediately rings alarm bells in my head because the chip
> is not registered with the driver model. It's not 2005 anymore so I'd
> need some more explanation. IMO there's nothing that makes it
> impossible to implement this as a platform device. Could you elaborate
> more on why you chose to implement it this way?
> 
> Bart

Hi Bart!

This is my first time writing a driver in general, so the only reason is
that the drivers I used as a reference (gpio-it87 and gpio-winbond) look
more or less like this. I used those because they are fairly simple and
also use fixed x86 ports for control.

I see now on gpio-f7188x that it is possible to detect if the SoC matches
using platform_driver and platform_device. I guess that is what you were
referring to? Should I thus make a V2 patch using those facilities? 

Thanks,
Marcos

