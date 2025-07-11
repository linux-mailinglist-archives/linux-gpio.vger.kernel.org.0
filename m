Return-Path: <linux-gpio+bounces-23161-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F09B01E61
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 15:53:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F5B43B6F69
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 13:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5732D97AF;
	Fri, 11 Jul 2025 13:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orca.pet header.i=@orca.pet header.b="NyCH9oSK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from 11.mo533.mail-out.ovh.net (11.mo533.mail-out.ovh.net [87.98.181.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06824210F53
	for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 13:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.98.181.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752241981; cv=none; b=O90NWWJY3dmikCYZIQc0TDXr1S42aZuuHiLTBtvOD3A+Gh33lcMSlh96CGQil8ekwF1JEQJv1acnw0YVADpz4WkQUjn1AB99wTvrRn7Y0IM5wcHcZtQ+KxxCiiIk86khr0LfRCUNl7i+BU0SJne1z0y9+Je9O+KnLAN4nYQuTd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752241981; c=relaxed/simple;
	bh=k6JanZD6Tlmh3GHH1j8AP7XOS7EDtLC73/YqamY9sYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wsb0jV+QTXV6YzLcGI1SHYhEkDZJlO7kAnzi2g3PQ6clkBgr04XaZ4syGF6V37tPMUHqjMuUGPK2UtzwG6J0G98sz4D/Z6NebKtejPjKrMPfhImGIngROqXtvnunaZryXwUU5PZwi/Al59N7wHZNeXMvaKutvpUG1O59SHzrDaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orca.pet; spf=pass smtp.mailfrom=orca.pet; dkim=pass (2048-bit key) header.d=orca.pet header.i=@orca.pet header.b=NyCH9oSK; arc=none smtp.client-ip=87.98.181.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orca.pet
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orca.pet
Received: from director2.derp.mail-out.ovh.net (director2.derp.mail-out.ovh.net [79.137.60.36])
	by mo533.mail-out.ovh.net (Postfix) with ESMTPS id 4bdtSw4kBCz5yNq;
	Fri, 11 Jul 2025 13:52:48 +0000 (UTC)
Received: from director2.derp.mail-out.ovh.net (director2.derp.mail-out.ovh.net. [127.0.0.1])
        by director2.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <brgl@bgdev.pl>; Fri, 11 Jul 2025 13:52:48 +0000 (UTC)
Received: from mta10.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.113.103])
	by director2.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4bdtSw2cLfz1y7x;
	Fri, 11 Jul 2025 13:52:48 +0000 (UTC)
Received: from orca.pet (unknown [10.1.6.0])
	by mta10.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id A5B29DA3D8A;
	Fri, 11 Jul 2025 13:52:47 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-99G00353bc4b02-1b04-4c83-8ffe-0aa17afcaf6d,
                    7A323F8B11C8C4ADDA8261290F78C257F5C293A5) smtp.auth=marcos@orca.pet
X-OVh-ClientIp:79.117.112.86
Message-ID: <99b67e0f-783a-4ac0-971f-07cf1544a651@orca.pet>
Date: Fri, 11 Jul 2025 15:52:39 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gpio: vortex: add new GPIO device driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 William Breathitt Gray <wbg@kernel.org>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
References: <20250709091542.968968-1-marcos@orca.pet>
 <aHD40TD8MLug0C6b@black.fi.intel.com>
Content-Language: es-ES
From: Marcos Del Sol Vives <marcos@orca.pet>
In-Reply-To: <aHD40TD8MLug0C6b@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1670835462901421787
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegfeegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepofgrrhgtohhsucffvghlucfuohhlucggihhvvghsuceomhgrrhgtohhssehorhgtrgdrphgvtheqnecuggftrfgrthhtvghrnheptdegudfgiedugfekudfhlefgjefguedvjeffieevgeetjedvvdeihfeiudejvdehnecukfhppeduvdejrddtrddtrddupdejledruddujedrudduvddrkeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehmrghrtghoshesohhrtggrrdhpvghtpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehinhhtvghlrdgtohhmpdhrtghpthhtohepfigsgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpd
 fovfetjfhoshhtpehmohehfeefmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=Kc84mVu2NtFT7Ce947ypedeEqm3SlMwYbBeMPVZ54zI=;
 c=relaxed/relaxed; d=orca.pet; h=From; s=ovhmo-selector-1; t=1752241969;
 v=1;
 b=NyCH9oSKSQbAxeH2OWmAssqg2Vjc69R8iDbzKe1MiF6fzvvimM0jORAgE9qENEAl7mVPS7kL
 QkWMPMBA4QeS9JhBY60UiFB3FFw9b0gvmZvidDxiBIiLMIgh5The9XMJ+QRwQLzQItNetPMhrDH
 rQrJfgQcKU5bo0JNom3RlF4+QRnBXs5LMPzNVhhbX08agw+FCHuy3JbPMyeoMYwKQmugoNhesRa
 i8vjFCW42lFtWN2S4VmCTiPgm1VTdL8M+tLpQOc1PeFiVc6A60mdcMreFZS0quzdyKgK3lm+oAS
 SoSXDDYbRDhZoewtR+cf6tB2TpJtDlJcScMmEZB+HcTcw==

El 11/07/2025 a las 13:43, Andy Shevchenko escribió:
>> + *  Based on the it87xx GPIO driver by Diego Elio Pettenò
> 
> Why that driver can't be reused?
> 

The driver uses a completely different port address and operation. It is
based in the sense I used it as an example of how a I/O mapped GPIO driver
should work, but nothing else.

>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> 
> Why? The driver should use dev_*() macros which will uniquely define the device
> for what the message is printed.

The error thrown if the module is attempted to load on a non-Vortex
processor happens before the platform device is created.

>> +static DEFINE_SPINLOCK(gpio_lock);
> 
> Global lock? Why?

Becase at most there'll be one GPIO device of this kind loaded, so it didn't
make sense to me to create a dynamically-allocated private structure of data
for a single global lock.

> So, the above is pretty much simple, why doesn't it use gpio-regmap with the
> respective configuration? Moreover, SX and DX variants are differ since the
> latter one may provide an IRQ chip, for which gpio-regmap also can be used,
> i.o.w. with that done, it will be quite easy to support both.

Again, I am not an expert on the Linux kernel, but I did not see any code
or examples using neither gpio-mmio nor gpio-regmap for I/O-mapped registers.

IRQ is only available for the first two ports out of the five available.
As said in the comment, for shutting down the machine, port 3 is required
so I'm gonna need to poll anyway.

>> +static int vortex_gpio_probe(struct platform_device *pdev)
>> +{
>> +	/* Set up GPIO labels */
>> +	for (int i = 0; i < GPIO_COUNT; i++) {
>> +		sprintf(labels[i], "vortex_gp%u%u", i / 8, i % 8);
>> +		labels_table[i] = &labels[i][0];
> '&...[0]' is redundant.
> Why this can't be made static once?

It absolutely can.

>> +		.owner = THIS_MODULE,
> 
> This field is not needed for ages (15+ years). Is this driver got dusted for this long?

I saw the field on the documentation as well as on the IT87 driver I was
using as a reference, so I kept it.

>> +static struct resource vortex_gpio_resources[] = {
>> +	DEFINE_RES_IO_NAMED(GPIO_DATA_BASE, GPIO_PORTS, KBUILD_MODNAME " data"),
>> +	DEFINE_RES_IO_NAMED(GPIO_DIRECTION_BASE, GPIO_PORTS, KBUILD_MODNAME " dir"),
> 
> Named resources? Why?

So they appear with the proper name in /proc/iomem. That's the only reason:

0000-0cf7 : PCI Bus 0000:00
  0000-001f : dma1
  0020-0021 : pic1
  0040-0043 : timer0
  0050-0053 : timer1
  0060-0060 : keyboard
  0061-0061 : PNP0800:00
  0064-0064 : keyboard
  0070-0071 : rtc0
  0078-007c : gpio_vortex-data
  0080-008f : dma page reg
  0098-009c : gpio_vortex-dir
  00a0-00a1 : pic2
  00c0-00df : dma2
  00f0-00ff : PNP0C04:00
...

>> +static int __init vortex_gpio_init(void)
>> +{
>> +	if (boot_cpu_data.x86_vendor != X86_VENDOR_VORTEX) {
>> +		pr_err("Not a Vortex86 CPU, refusing to load\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	pdev = platform_create_bundle(&vortex_gpio_driver, vortex_gpio_probe,
>> +			vortex_gpio_resources, ARRAY_SIZE(vortex_gpio_resources),
>> +			NULL, 0);
>> +	return PTR_ERR_OR_ZERO(pdev);
>> +}
> 
> Oh my... Can you elaborate more on this ugly hack. Why do we need this at all?
> What's wrong with the BIOS or other firmware that is provided?
> (The documentation mentions BIOS, btw.)
> 
> Also, is this anyhow visible as a PCI device? Is it part of LPC (docs suggests
> so for SX, but not so clear in DX diagram)?

The device is available at a hardcoded address for all Vortex86 devices, but
it is not part of any device in particular, and I don't see any good way
to enable it on all Vortex devices other than checking the CPU vendor.

These are the PCI devices on my DX3:

00:00.0 Host bridge [0600]: RDC Semiconductor, Inc. R6023 Host Bridge [17f3:6023] (rev 02)
00:01.0 PCI bridge [0604]: RDC Semiconductor, Inc. PCI/PCI-X to PCI-E Bridge [17f3:1031] (rev 01)
00:02.0 PCI bridge [0604]: RDC Semiconductor, Inc. PCI/PCI-X to PCI-E Bridge [17f3:1031] (rev 01)
00:07.0 ISA bridge [0601]: RDC Semiconductor, Inc. R6035 ISA Bridge [17f3:6035] (rev 01)
00:07.1 ISA bridge [0601]: RDC Semiconductor, Inc. R6035 ISA Bridge [17f3:6035] (rev 01)
00:0a.0 USB controller [0c03]: RDC Semiconductor, Inc. R6060 USB 1.1 Controller [17f3:6060] (rev 14)
00:0a.1 USB controller [0c03]: RDC Semiconductor, Inc. R6061 USB 2.0 Controller [17f3:6061] (rev 08)
00:0c.0 IDE interface [0101]: RDC Semiconductor, Inc. R1012 IDE Controller [17f3:1012] (rev 02)
00:0d.0 VGA compatible controller [0300]: RDC Semiconductor, Inc. RDC M2015 VGA-compatible graphics adapter [17f3:2015]
00:0e.0 Audio device [0403]: RDC Semiconductor, Inc. R3010 HD Audio Controller [17f3:3010] (rev 01)
01:00.0 Ethernet controller [0200]: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller [10ec:8168] (rev 07)

There's no multipurpose device that actually claims ownership of these I/O
ports according to the PCI's configuration section.

In fact the Vortex86MX-based EBOX-3350MX mini PC has a different host bridge
(R6021) and different ISA bridges (R6031), but has the very same GPIO.

And in "dmidecode" I just see a lot of lies (this device certainly does NOT
have fans or a parallel port) plus "To Be Filled By O.E.M." fields. Also
matching on BIOS does not seem a good idea since there are other industrial
machines that may not be using or reporting the same BIOS versions.

> On top of that the GPIO3 is marked as one with the pin muxing. Where is the driver
> for it? Or what are the plans about it?
> 
> GPIO4 seems muxed with UART, so also subject to pin muxing.

The documentation does not cover how to use those UARTs and the pins default
to I/O, so I would say they're not a problem for now.

Ultimately, as mentioned, the goal is implementing a correct power off
sequence for ICOP EBOX machines and DM&P evaluation boards, which require
manually polling for the power off button, then setting an output pin
low to shut off power to the machine.

