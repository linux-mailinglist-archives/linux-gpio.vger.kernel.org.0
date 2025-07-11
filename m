Return-Path: <linux-gpio+bounces-23162-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7934FB01F58
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 16:40:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E9B35A75A2
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 14:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3C2287265;
	Fri, 11 Jul 2025 14:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orca.pet header.i=@orca.pet header.b="BXSg8Cm+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from 10.mo533.mail-out.ovh.net (10.mo533.mail-out.ovh.net [46.105.72.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54316537F8
	for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 14:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.72.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752244815; cv=none; b=rZ3niMgk5xJmNmPFl3QCq8yCKRbdSHxttKeikk7AjDgGo2jdqkh3CewB8XQubDJSMNnV+DkDz0vLd6v7NG+Tlq76XPq8VUD+iHRRFtPvStMa7ejQIjHduWOr0yVv/yIqfMIv8jbYMN0ZesHLpvEugPIDghvpFFdLWefetY+T8Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752244815; c=relaxed/simple;
	bh=7Kj1sFUqrW1XyLKWmgNz3Z+yqGUUAxxBZ5XfiAIHJCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kQr0+6+gcmPWfr10kgyDrcn+jO+bNH4Oebnc5mHBax6q7517WiyZEjbsm5vBSk/QtwUv5jT7yWQ0LadUUScc8I83qwZqryAHu+4gB+lSzfWiDZlr6sCqVKj4V7713eCpf8hlOLVnLf3xaDM6MQR3Sn4xmGuZhqefbhYloO95UmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orca.pet; spf=pass smtp.mailfrom=orca.pet; dkim=pass (2048-bit key) header.d=orca.pet header.i=@orca.pet header.b=BXSg8Cm+; arc=none smtp.client-ip=46.105.72.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orca.pet
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orca.pet
Received: from director3.derp.mail-out.ovh.net (director3.derp.mail-out.ovh.net [152.228.215.222])
	by mo533.mail-out.ovh.net (Postfix) with ESMTPS id 4bdv9v2hlPz6TjQ;
	Fri, 11 Jul 2025 14:24:51 +0000 (UTC)
Received: from director3.derp.mail-out.ovh.net (director3.derp.mail-out.ovh.net. [127.0.0.1])
        by director3.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <brgl@bgdev.pl>; Fri, 11 Jul 2025 14:24:51 +0000 (UTC)
Received: from mta11.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.109.254.113])
	by director3.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4bdv9v0BClz5wZp;
	Fri, 11 Jul 2025 14:24:51 +0000 (UTC)
Received: from orca.pet (unknown [10.1.6.7])
	by mta11.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id E074B263D94;
	Fri, 11 Jul 2025 14:24:49 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-101G00431d22fa7-da59-4686-b9e3-8060d6c7224e,
                    7A323F8B11C8C4ADDA8261290F78C257F5C293A5) smtp.auth=marcos@orca.pet
X-OVh-ClientIp:79.117.112.86
Message-ID: <e00c97c2-04f4-4683-9c56-8894617998fa@orca.pet>
Date: Fri, 11 Jul 2025 16:24:41 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gpio: vortex: add new GPIO device driver
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-gpio@vger.kernel.org
References: <20250709091542.968968-1-marcos@orca.pet>
 <CAMRc=MdLXP=DgHEh6hoNYhDgB4aESmC29VH6hsH=AONNgsjXQQ@mail.gmail.com>
Content-Language: es-ES
From: Marcos Del Sol Vives <marcos@orca.pet>
In-Reply-To: <CAMRc=MdLXP=DgHEh6hoNYhDgB4aESmC29VH6hsH=AONNgsjXQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 2212111842890700507
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegfeehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepofgrrhgtohhsucffvghlucfuohhlucggihhvvghsuceomhgrrhgtohhssehorhgtrgdrphgvtheqnecuggftrfgrthhtvghrnheptdegudfgiedugfekudfhlefgjefguedvjeffieevgeetjedvvdeihfeiudejvdehnecukfhppeduvdejrddtrddtrddupdejledruddujedrudduvddrkeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehmrghrtghoshesohhrtggrrdhpvghtpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehfeefmgdpmh
 houggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=NISnfC23n6r7XKdglikRIIpG3ZAgkEdOEie+EOc5I3o=;
 c=relaxed/relaxed; d=orca.pet; h=From; s=ovhmo-selector-1; t=1752243891;
 v=1;
 b=BXSg8Cm+iZe8rglp302itZ+6lCCLGyJ9AnErC9eePwF6CkaRVWa1Lzm2XU5tqYejkTICkDFd
 JnsMycZdr7Q1Prck6mMOZ0Bk18s/5FfPWK3b670ACvEdvMikA/GknMiM+B05KFeYgcVxhLYa/BC
 Byh7qHmndsVRnHKeGdlN+cO5K+lzYlHh98oTYFwONDFl9rI3aNe0W/9B9X5x1GrqOiljXXvn2p0
 en1ocCbJ3VcagQSOEfiXisVFTXCYTNwxbzr4AQyPRl4HSw6pnAKzO4pBZExUatv2DcuXv7ToP3U
 M1c6WzI/5qwn2uqixO8F4uF/I5LEeo7uGy2tWmpG/AAHg==

El 11/07/2025 a las 12:19, Bartosz Golaszewski escribió:
> This looks better but I admit I'm not an expert in x86 platforms so
> I'll allow myself to Cc Andy. Is this how it's typically done in x86?
> Is this module visible in ACPI in any way that would allow us to
> leverage the platform device core? Or do we need to try to register
> the device unconditionally on all Vortex platforms?

Again I want to point out I am not an expert by any means. This is my first
kernel driver and I am writting it as a hobbyst, not as a company employee.

Regarding ACPI: I have just now decompiled the DSDT for the Vortex86DX3
machine and I do not see any Device() claiming ownership of 0x78 or 0x98,
or mentioning GPIO at all:

root@vdx3:/home/marcos/acpi# ls -l *.dsl
-rw-r--r-- 1 root root   3459 Jul 11 16:05 APIC.dsl
-rw-r--r-- 1 root root 196800 Jul 11 16:05 DSDT.dsl
-rw-r--r-- 1 root root   9211 Jul 11 16:22 FACP.dsl
-rw-r--r-- 1 root root   1364 Jul 11 16:22 FACS.dsl
-rw-r--r-- 1 root root   1552 Jul 11 16:23 MSDM.dsl
-rw-r--r-- 1 root root      0 Jul 11 16:07 OEMB.dsl
-rw-r--r-- 1 root root   3957 Jul 11 16:07 SLIC.dsl
root@vdx3:/home/marcos/acpi# grep -Ri gpio *.dsl
root@vdx3:/home/marcos/acpi# grep -Ri 0x0078 *.dsl

Manually skimming through DSDT does not yield anything useful either.

This kinda confirms what the company told me: the machine does not properly
support ACPI, it has a set of fake tables enough to convince Windows 7 into
booting.

The Vortex86MX board does not even have those, and has no ACPI tables
whatsoever.

And regarding something I forgot to answer on the previous email about the
future of these machines: the Vortex86MX is a i586 processor, and this
Vortex86DX3 is a dual-core i686 processor with SSE1 support that I myself
bought brand new from the manufacturer, indicating they are still making
and supporting them.

The company is seemingly launching next year also a Vortex86EX3 with proper
i686 and SSE2 support, I guess because Intel's patents have finally expired.

So I do not think removing i486 support is gonna be an issue except for
very ancient processors that the company is not making anymore anyway.

Thanks,
Marcos

