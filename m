Return-Path: <linux-gpio+bounces-30269-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A678FD02A47
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 13:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBEF4302D2B6
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 12:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059BD4C6F16;
	Thu,  8 Jan 2026 12:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Wz6/OM7R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60844C6376
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 12:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767874934; cv=none; b=hVKXHeN5k8gv3BwvUY4m6Ni9gTqge9b1jdy71atVguvcMD/q6v4bvGuUtkTkrGkhN/Huo6QEXdYrOZYQZQ8zqOH5FdxYEjg85PH3i9l8uUD9r5nKD4JCTN898fi9omc3UWRgR1k+W40brNuXm6e7qUD9m2TbnWQbF784e/g0PO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767874934; c=relaxed/simple;
	bh=BoosxtqdzaXov+zrXrQIbKWEk2jE1IMNvOZTKJSPkmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=E3RFNRgBt3GLG2rH1paxXF/HvGBcmFv9rHrlO0mNO7LVaueq5xilfS8lTuuW3f5JfIeeS6QTDK4RZtN74kMGJjnBepfHV2exDguXd0AgbfqQSR8qQQGXTXkW+DzoVJWekTfppelWI0UggIqpeq4I+JcdrpWCejSWG8vztuCO5dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Wz6/OM7R; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260108122208euoutp01535efd537efa2c107f7258de98557252~IwOGeFbZn2214122141euoutp018
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 12:22:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260108122208euoutp01535efd537efa2c107f7258de98557252~IwOGeFbZn2214122141euoutp018
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1767874929;
	bh=7l6ApAcP3o6+Pl6HSE5Nu0t3rJZfRA+S87IipLwj71g=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Wz6/OM7RCl7JU9pD1qporHI/B+NVMPeA/ZLETOXKe8x3evPJdyclrY3kyM7yr75Z8
	 L3ZI7smEI/DtmiClUaGR3MVI/2oA1S9qIi17Mwm551R3f8yf61u9uVOrVApI+rrsp5
	 vzPDkFHh/GNeKeI227KHKg+efrqaVNXvk04F377Y=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260108122208eucas1p1fb777b45149d3818e5cd9b0023e0411d~IwOGWAg7x2101521015eucas1p18;
	Thu,  8 Jan 2026 12:22:08 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260108122208eusmtip119279c4d0db859b492b7c7796f08d4dc~IwOFpYgmq3197631976eusmtip1e;
	Thu,  8 Jan 2026 12:22:08 +0000 (GMT)
Message-ID: <0e4edccb-33de-4fd6-bf75-cbd92bc2e7ef@samsung.com>
Date: Thu, 8 Jan 2026 13:22:07 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 0/3] gpio: shared: another set of small fixes
To: Cosmin Tanislav <demonsingur@gmail.com>, Bartosz Golaszewski
	<bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <2889f386-65d3-4f89-ac11-aa51e4384ed9@gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260108122208eucas1p1fb777b45149d3818e5cd9b0023e0411d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260108121401eucas1p1a542104162a3103bf18914bea7525c1b
X-EPHeader: CA
X-CMS-RootMailID: 20260108121401eucas1p1a542104162a3103bf18914bea7525c1b
References: <20260106-gpio-shared-fixes-v2-0-c7091d2f7581@oss.qualcomm.com>
	<CGME20260108121401eucas1p1a542104162a3103bf18914bea7525c1b@eucas1p1.samsung.com>
	<2889f386-65d3-4f89-ac11-aa51e4384ed9@gmail.com>

On 08.01.2026 13:13, Cosmin Tanislav wrote:
> On 1/6/26 11:34 AM, Bartosz Golaszewski wrote:
>> Here are three more patches fixing issues reported with shared GPIO
>> management.
>>
>
> I'm still getting some intermittent failures on today's next (which
> contains this series).

Please check this fix:

https://lore.kernel.org/all/20260108102314.18816-1-bartosz.golaszewski@oss.qualcomm.com/

Looks exactly like the issue I've observed and finally debugged 
yesterday on TM2e board.


>
> This does not seem to happen on every boot, so it might be some race.
>
> [    2.169655] Mem abort info:
> [    2.169663]   ESR = 0x0000000096000004
> [    2.169670]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    2.176773] ehci-platform 92040100.usb: irq 64, io mem 0x92040100
> [    2.186626]   SET = 0, FnV = 0
> [    2.204264] renesas_sdhi_internal_dmac 92090000.mmc: mmc1 base at 
> 0x0000000092090000, max clock rate 200 MHz
> [    2.204308] ehci-platform 92040100.usb: USB 2.0 started, EHCI 1.10
> [    2.208714] hub 2-0:1.0: USB hub found
> [    2.214345]   EA = 0, S1PTW = 0
> [    2.222949] hub 2-0:1.0: 1 port detected
> [    2.231502]   FSC = 0x04: level 0 translation fault
> [    2.239779] hub 1-0:1.0: USB hub found
> [    2.248022] Data abort info:
> [    2.256579] hub 1-0:1.0: 1 port detected
> [    2.264724]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> [    2.487291]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [    2.493148]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [    2.499300] [0000000000000000] user address but active_mm is swapper
> [    2.506556] Internal error: Oops: 0000000096000004 [#1]  SMP
> [    2.513092] Modules linked in:
> [    2.516610] CPU: 3 UID: 0 PID: 48 Comm: kworker/u16:2 Not tainted 
> 6.19.0-rc4-next-20260108+ #246 PREEMPT
> [    2.527564] Hardware name: Renesas RZ/T2H EVK Board based on 
> r9a09g077m44 (DT)
> [    2.535903] Workqueue: async async_run_entry_fn
> [    2.541141] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS 
> BTYPE=--)
> [    2.549076] pc : gpiod_direction_input_nonotify+0x18/0x22c
> [    2.555408] lr : gpiod_configure_flags+0x1c4/0x380
> [    2.560835] sp : ffff8000830e38c0
> [    2.564530] x29: ffff8000830e38c0 x28: ffff80008243894f x27: 
> ffff0001808f6410
> [    2.572773] x26: ffff800081e77160 x25: 0000000000000000 x24: 
> 0000000000000000
> [    2.580914] x23: 0000000000000000 x22: ffff800081e77160 x21: 
> ffff80008243892f
> [    2.589054] x20: 0000000000000000 x19: 0000000000000000 x18: 
> 000000000000000a
> [    2.597101] x17: ffff80007fffffff x16: ffff000180054480 x15: 
> 0000000000000000
> [    2.605345] x14: 0000000000000000 x13: ffff800080ed7600 x12: 
> 0000000000000000
> [    2.613485] x11: 0000000000000000 x10: 00007fff01adbb48 x9 : 
> 0000000000000005
> [    2.621626] x8 : 0101010101010101 x7 : fffffdffc6009b00 x6 : 
> 051573657480ffff
> [    2.629869] x5 : 0000000000000138 x4 : 0000000000000000 x3 : 
> 0000000000000001
> [    2.638113] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 
> 0000000000000000
> [    2.646254] Call trace:
> [    2.648968]  gpiod_direction_input_nonotify+0x18/0x22c (P)
> [    2.655299]  gpiod_configure_flags+0x1c4/0x380
> [    2.660428]  gpiod_find_and_request+0x14c/0x524
> [    2.665650]  gpiod_get_index+0x58/0x7c
> [    2.669874]  devm_gpiod_get_index+0x20/0x90
> [    2.674695]  mmc_gpiod_request_ro+0x30/0xb0
> [    2.679525]  mmc_of_parse+0x100/0x688
> [    2.683749]  tmio_mmc_host_alloc+0x80/0x110
> [    2.688571]  renesas_sdhi_probe+0x150/0x760
> [    2.693392]  renesas_sdhi_internal_dmac_probe+0x64/0x80
> [    2.699357]  platform_probe+0x5c/0xa4
> [    2.703581]  really_probe+0xbc/0x2ac
> [    2.707703]  __driver_probe_device+0x78/0x118
> [    2.712728]  driver_probe_device+0x3c/0x178
> [    2.717550]  __device_attach_driver+0xb8/0x140
> [    2.722678]  bus_for_each_drv+0x88/0xe8
> [    2.727099]  __device_attach_async_helper+0xb0/0xd4
> [    2.732526]  async_run_entry_fn+0x34/0xe0
> [    2.737048]  process_one_work+0x150/0x290
> [    2.741673]  worker_thread+0x18c/0x300
> [    2.745915]  kthread+0x118/0x124
> [    2.749635]  ret_from_fork+0x10/0x20
> [    2.753762] Code: 910003fd a90153f3 aa0003f4 a9025bf5 (f9400013)
> [    2.760790] ---[ end trace 0000000000000000 ]---
>
> After running ./scripts/decode_stacktrace.sh
>
> [    2.169655] Mem abort info:
> [    2.169663]   ESR = 0x0000000096000004
> [    2.169670]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    2.176773] ehci-platform 92040100.usb: irq 64, io mem 0x92040100
> [    2.186626]   SET = 0, FnV = 0
> [    2.204264] renesas_sdhi_internal_dmac 92090000.mmc: mmc1 base at 
> 0x0000000092090000, max clock rate 200 MHz
> [    2.204308] ehci-platform 92040100.usb: USB 2.0 started, EHCI 1.10
> [    2.208714] hub 2-0:1.0: USB hub found
> [    2.214345]   EA = 0, S1PTW = 0
> [    2.222949] hub 2-0:1.0: 1 port detected
> [    2.231502]   FSC = 0x04: level 0 translation fault
> [    2.239779] hub 1-0:1.0: USB hub found
> [    2.248022] Data abort info:
> [    2.256579] hub 1-0:1.0: 1 port detected
> [    2.264724]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> [    2.487291]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [    2.493148]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [    2.499300] [0000000000000000] user address but active_mm is swapper
> [    2.506556] Internal error: Oops: 0000000096000004 [#1]  SMP
> [    2.513092] Modules linked in:
> [    2.527564] Hardware name: Renesas RZ/T2H EVK Board based on 
> r9a09g077m44 (DT)
> [    2.535903] Workqueue: async async_run_entry_fn
> [    2.541141] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS 
> BTYPE=--)
> [    2.549076] pc : gpiod_direction_input_nonotify 
> (drivers/gpio/gpiolib.h:231 (discriminator 1) 
> drivers/gpio/gpiolib.c:2863 (discriminator 1))
> [    2.555408] lr : gpiod_configure_flags (drivers/gpio/gpiolib.c:4956)
> [    2.560835] sp : ffff8000830e38c0
> [    2.564530] x29: ffff8000830e38c0 x28: ffff80008243894f x27: 
> ffff0001808f6410
> [    2.572773] x26: ffff800081e77160 x25: 0000000000000000 x24: 
> 0000000000000000
> [    2.580914] x23: 0000000000000000 x22: ffff800081e77160 x21: 
> ffff80008243892f
> [    2.589054] x20: 0000000000000000 x19: 0000000000000000 x18: 
> 000000000000000a
> [    2.597101] x17: ffff80007fffffff x16: ffff000180054480 x15: 
> 0000000000000000
> [    2.605345] x14: 0000000000000000 x13: ffff800080ed7600 x12: 
> 0000000000000000
> [    2.613485] x11: 0000000000000000 x10: 00007fff01adbb48 x9 : 
> 0000000000000005
> [    2.621626] x8 : 0101010101010101 x7 : fffffdffc6009b00 x6 : 
> 051573657480ffff
> [    2.629869] x5 : 0000000000000138 x4 : 0000000000000000 x3 : 
> 0000000000000001
> [    2.638113] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 
> 0000000000000000
> [    2.646254] Call trace:
> [    2.648968]  gpiod_direction_input_nonotify 
> (drivers/gpio/gpiolib.h:231 (discriminator 1) 
> drivers/gpio/gpiolib.c:2863 (discriminator 1)) (P)
> [    2.655299]  gpiod_configure_flags (drivers/gpio/gpiolib.c:4956)
> [    2.660428]  gpiod_find_and_request (drivers/gpio/gpiolib.c:4774)
> [    2.665650]  gpiod_get_index (drivers/gpio/gpiolib.c:4986)
> [    2.669874]  devm_gpiod_get_index (drivers/gpio/gpiolib-devres.c:102)
> [    2.674695]  mmc_gpiod_request_ro (drivers/mmc/core/slot-gpio.c:255)
> [    2.679525]  mmc_of_parse (drivers/mmc/core/host.c:348)
> [    2.683749]  tmio_mmc_host_alloc 
> (drivers/mmc/host/tmio_mmc_core.c:1149)
> [    2.688571]  renesas_sdhi_probe 
> (drivers/mmc/host/renesas_sdhi_core.c:1119)
> [    2.693392]  renesas_sdhi_internal_dmac_probe 
> (drivers/mmc/host/renesas_sdhi_internal_dmac.c:599)
> [    2.699357]  platform_probe (drivers/base/platform.c:1449 
> (discriminator 1))
> [    2.703581]  really_probe (drivers/base/dd.c:581 
> drivers/base/dd.c:659)
> [    2.707703]  __driver_probe_device (drivers/base/dd.c:801)
> [    2.712728]  driver_probe_device (drivers/base/dd.c:831)
> [    2.717550]  __device_attach_driver (drivers/base/dd.c:960)
> [    2.722678]  bus_for_each_drv (drivers/base/bus.c:500)
> [    2.727099]  __device_attach_async_helper 
> (include/linux/pm_runtime.h:447 drivers/base/dd.c:991)
> [    2.732526]  async_run_entry_fn (kernel/async.c:136 (discriminator 3))
> [    2.737048]  process_one_work (kernel/workqueue.c:3290 
> (discriminator 1))
> [    2.741673]  worker_thread (kernel/workqueue.c:3356 (discriminator 
> 2) kernel/workqueue.c:3443 (discriminator 2))
> [    2.745915]  kthread (kernel/kthread.c:467)
> [    2.749635]  ret_from_fork (arch/arm64/kernel/entry.S:861)
> [    2.753762] Code: 910003fd a90153f3 aa0003f4 a9025bf5 (f9400013)
>
>> Signed-off-by: Bartosz Golaszewski 
>> <bartosz.golaszewski@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Fix mutex deadlock
>> - Fix lockdep false-positives
>> - Add a patch reducing the number of memory allocations
>> - Link to v1: 
>> https://lore.kernel.org/r/20260105-gpio-shared-fixes-v1-0-76d6ff0afcd8@oss.qualcomm.com
>>
>> ---
>> Bartosz Golaszewski (3):
>>        gpio: shared: assign the correct firmware node for reset-gpio 
>> use-case
>>        gpio: shared: fix a race condition
>>        gpio: shared: don't allocate the lookup table until we really 
>> need it
>>
>>   drivers/gpio/gpiolib-shared.c | 34 ++++++++++++++++------------------
>>   1 file changed, 16 insertions(+), 18 deletions(-)
>> ---
>> base-commit: 19fb766a1e5ed5943a62fc671c09d45352a81b1d
>> change-id: 20260105-gpio-shared-fixes-40a8ec3b6b25
>>
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


