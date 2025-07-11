Return-Path: <linux-gpio+bounces-23184-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BE3B02696
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 23:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E651A61592
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 21:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65EF221D001;
	Fri, 11 Jul 2025 21:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orca.pet header.i=@orca.pet header.b="c5OY+ThE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from 12.mo533.mail-out.ovh.net (12.mo533.mail-out.ovh.net [178.33.248.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06980149DFF
	for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 21:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.33.248.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752271122; cv=none; b=JwpXtPUNZro/ejjYArE/776nuKRdtWB3hp3YqekN33Hxidebmkj7MTy1UZIYTA1GJULQQOTCpt/zuR4B64l4+CirAnrQ1eFQ9YOUrGdA/jH7VsWj2S5SqhA75D6uF6PRjS9UawCALZYt0kjrEKLSdv8m7Jbmyxoq1iUgd7E7HNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752271122; c=relaxed/simple;
	bh=5ZpdH1e3Mnjz/edR4oQbt2lj8bvKNeEGbz1MEakwSBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lpv7lOXFvef9jIg79CoQHXJ3gY7FtmhzLf/3AaSN3v1JrLLD4rl1dQSlkO2eXmRsQWbw8YNAw+CAlIYjQc671HuSlBAZgeHtVPqck5Jx8W9Ca4CeTgbbY3d1cFZ7bzK3WndXrGiaCwhfeTdGL7szETVJtgtA7ZCDbITnXe32r6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orca.pet; spf=pass smtp.mailfrom=orca.pet; dkim=pass (2048-bit key) header.d=orca.pet header.i=@orca.pet header.b=c5OY+ThE; arc=none smtp.client-ip=178.33.248.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orca.pet
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orca.pet
Received: from director1.derp.mail-out.ovh.net (director1.derp.mail-out.ovh.net [51.68.80.175])
	by mo533.mail-out.ovh.net (Postfix) with ESMTPS id 4bf5FQ4Jx7z6VDs;
	Fri, 11 Jul 2025 21:58:34 +0000 (UTC)
Received: from director1.derp.mail-out.ovh.net (director1.derp.mail-out.ovh.net. [127.0.0.1])
        by director1.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <brgl@bgdev.pl>; Fri, 11 Jul 2025 21:58:34 +0000 (UTC)
Received: from mta3.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.0.100])
	by director1.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4bf5FP72c8z5wGg;
	Fri, 11 Jul 2025 21:58:33 +0000 (UTC)
Received: from orca.pet (unknown [10.1.6.6])
	by mta3.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id 3F6B43A42E9;
	Fri, 11 Jul 2025 21:58:33 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-104R00583b81c07-b8ab-4c1b-865f-96b19cefac45,
                    7A323F8B11C8C4ADDA8261290F78C257F5C293A5) smtp.auth=marcos@orca.pet
X-OVh-ClientIp:79.117.112.86
Message-ID: <03f3b414-e17a-4d84-b094-3e9937cd3417@orca.pet>
Date: Fri, 11 Jul 2025 23:58:25 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gpio: vortex: add new GPIO device driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
References: <20250709091542.968968-1-marcos@orca.pet>
 <CAMRc=MdLXP=DgHEh6hoNYhDgB4aESmC29VH6hsH=AONNgsjXQQ@mail.gmail.com>
 <e00c97c2-04f4-4683-9c56-8894617998fa@orca.pet>
 <aHEnVTCSwfdijvzQ@smile.fi.intel.com>
Content-Language: es-ES
From: Marcos Del Sol Vives <marcos@orca.pet>
In-Reply-To: <aHEnVTCSwfdijvzQ@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 9874705137076688603
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeggeegiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepofgrrhgtohhsucffvghlucfuohhlucggihhvvghsuceomhgrrhgtohhssehorhgtrgdrphgvtheqnecuggftrfgrthhtvghrnhepueeigeetfffhhefgffekhfdvgeettddviedtfefhgeeiledtjeetieehffelkeevnecuffhomhgrihhnpehorhgtrgdrphgvthdptghomhhprggtthhptgdrtghomhdrthifpdhkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpjeelrdduudejrdduuddvrdekieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepmhgrrhgtohhssehorhgtrgdrphgvthdpnhgspghrtghpthhtohephedprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhope
 hlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheeffegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=CA93cMaoJ63k1Nl3nGykOIl/kyk1LNknHWjR5sb7/KA=;
 c=relaxed/relaxed; d=orca.pet; h=From; s=ovhmo-selector-1; t=1752271114;
 v=1;
 b=c5OY+ThEza8L487Cc+2EoUstfvHyWZ+43rGEQpRV0FIhjC785dlG6jKCMzokgdi2ZyBHJ7bl
 +D7JbEwdt7xMx98DQMZy62Sw9WGRUgbZVO56j9tZGvi/Z3gp6kGbObo/az7/rqYH41rTBhKamJh
 TKy09zvt9VuqBsvTgs6ubN2IyGvBNOxeJVKQsOfgMFbhKP0GbA/dDXIvYD1rk3RURhhkV8tK2Sc
 7uPe0NlEZDi+eJXaQzBz22z0eOPck2rsy5sY+/JPnh4W40j4J1lLWyMnG48nLz4mn2gSU58abAo
 ywhgKafR6wOZ7Dxf5zTLXV7lJVjoW4BdHU7y+IYy67bSg==

El 11/07/2025 a las 16:53, Andy Shevchenko escribió:
> Can you share (via some sharing resource) the following (as root user!):
> 1) `dmesg` to the boot to shell when kernel command line has 'ignore_loglevel'
> 2) `lspci -nk -vv`
> 3) `acpidump -o vortex-dx3.dat` (the *.dat file)
> 4) `grep -H 15 /sys/bus/acpi/devices/*/status`
> 5) `cat /proc/interrupts`
> 6) `cat /proc/iomem`
> 7) `cat /proc/ioport`

I have uploaded all the files to https://orca.pet/vortex/gpio-patch-files.tar.xz.
I have also added the configuration file I used for the kernel, as well as
the cmdline.

The machine is currently running Linux on commit
d006330be3f782ff3fb7c3ed51e617e01f29a465 with this patch and another that
builds upon it for poweroff applied.

The cmdline has pci=nomsi due to a hardware issue acknowledged by DM&P
(https://2018.compactpc.com.tw/2014%20DMP%20Webiste/Linux%20Support%20List/debian_9.4_installation_guide.pdf)
for which I have already submited another patch to the PCI mailing list to
disable it automatically
(https://lore.kernel.org/all/20250705233209.721507-1-marcos@orca.pet/).

If you need any other files please let me know :)

> Is that the only datasheet you have?

Yes. I guess I could ask DM&P or ICOP for another under NDA but as of today
I do not have access to anything else.

El 11/07/2025 a las 17:01, Andy Shevchenko escribió:
>> Again I want to point out I am not an expert by any means. This is my first
>> kernel driver and I am writting it as a hobbyst, not as a company employee.
> 
> Oh, I see. Sorry that I'm asking too much (do I?) Unfortunately the review
> might be not well appreciated process by the author, but we are all for
> having the better solutions. That's the part of learning and R&D process.

Not at all, you're not asking for too much at all! I understand you don't
want to merge a half baked driver in the kernel.

I was just mentioning that to clarify that if the driver looks sloppy at
the moment is not because of a lack of care, it's rather because of a lack
of experience - I am not familiar with neither the Linux driver model nor
the technologies that are deprecated and should be avoided.

Also and to clarify that, as I said above, I do not have access to the
documentation an employee would have about the SoC's inner workings.

>> The company is seemingly launching next year also a Vortex86EX3 with proper
>> i686 and SSE2 support, I guess because Intel's patents have finally expired.
>>
>> So I do not think removing i486 support is gonna be an issue except for
>> very ancient processors that the company is not making anymore anyway.
> 
> Thanks for clarifications here!
> 
> And thank you for your efforts, I would like to help as much as I can.
> Again, sorry, if my first messages looked a bit rejecting. I do not mean
> that, it's just a professional deformation due to tons of reviews I have
> done in the past.
> 

No problem, sir! :)

