Return-Path: <linux-gpio+bounces-30361-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4A0D0AB18
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 15:41:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9A8FB3016785
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 14:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01D73612E7;
	Fri,  9 Jan 2026 14:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fOUjUTCk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB9F35FF7C;
	Fri,  9 Jan 2026 14:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767969687; cv=none; b=MZV1QD0dbzUYVk2dpgDkRmgipWM9UroFc8dahOmX2mGev6eYdMVAv1JlZoPpJXG3luf3RPLHlr1kKYcaRxEQ6Fm77qIfMCFiTx16a6LwAzjmh6ZOTo+J1fQPQFJxOw/RMVUbWEbKsROokTyqkT4Y+VsMXVi2u6j5dfqOLktqWXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767969687; c=relaxed/simple;
	bh=1THL106GaQLNMunM+DFGsKsT5qlv7UqgHcYuSL+uD0M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:From:To:Subject:
	 References:In-Reply-To; b=WBZ4+OhRvg52jikNlTRWKYcKRoMhmpWtSoxCkuJQ5bVPq5/M+DAD/6u7t+vLDwQ2/gT8aobNoNVbtNTqGl7ChNcrXo8YmSOxZgKdM83CB3DhAaX9QP/Ik6/JJUziA2w3zBn7wA40qj9piyjJVwbvoo0YUA6WH/RaurTW7/TZ4h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fOUjUTCk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1F3EC19421;
	Fri,  9 Jan 2026 14:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767969687;
	bh=1THL106GaQLNMunM+DFGsKsT5qlv7UqgHcYuSL+uD0M=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=fOUjUTCkhrpZdFGdomradKZhrN35jYkke21ABjtttaunYxgODTcNH+bRlhru/q4je
	 zweO1Wm6zkqMHchyHWfc1wUKpuK94GJYPMxjOZrWMR6PWD15zSdlvECeGG2i6rpYad
	 4Vw+x00T+k+tYmxwy4F+oAENRk42A2RWuMClRQ8dP92ScMqlPLmGomXW4qRQ0fVaeV
	 BtIagpOkBbTpPQFTZ3Bl21ekYIiaFHg1z7y/GQIV9R1a1mzB4wRvibP7eVG6kIiPxW
	 mMM9t54htwIxOLU08TvW+R84H/IVq32Alb4OuNV6IERGN67fpK9cHk7a+g2eFAIYbV
	 UFZyn5N1YmaTg==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=f00b356cb3331133018261489f9a1da90393783d74a4def4af50c08f9bc9;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 09 Jan 2026 15:41:21 +0100
Message-Id: <DFK4Y3EOXTFL.1M25VAPJAS2BU@kernel.org>
Cc: "Kees Cook" <kees@kernel.org>, "Mika Westerberg" <westeri@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Linus Walleij" <linus.walleij@linaro.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Saravana Kannan" <saravanak@google.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Andy Shevchenko"
 <andy@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, "Srinivas Kandagatla" <srini@kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Alexey Klimov" <alexey.klimov@linaro.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>,
 <linux-hardening@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>, "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Bartosz Golaszewski" <brgl@kernel.org>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
X-Mailer: aerc 0.20.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <DFJAFK3DTBOZ.3G2P3A5IH34GF@kernel.org>
 <CAMRc=MeQ_zr047PxFFGhfZ43TuHoKG-9VLLefxVyScpO5ZxjzQ@mail.gmail.com>
In-Reply-To: <CAMRc=MeQ_zr047PxFFGhfZ43TuHoKG-9VLLefxVyScpO5ZxjzQ@mail.gmail.com>

--f00b356cb3331133018261489f9a1da90393783d74a4def4af50c08f9bc9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu Jan 8, 2026 at 4:50 PM CET, Bartosz Golaszewski wrote:
> On Thu, Jan 8, 2026 at 3:46=E2=80=AFPM Michael Walle <mwalle@kernel.org> =
wrote:
>>
>> >
>> > The changes are implemented in a way that allows to seamlessly compile
>> > out any code related to sharing GPIOs for systems that don't need it.
>>
>> The problem here is that the aarch64 defconfig has ARCH_QCOM enabled
>> and thus it will get enabled for any platforms, right?
>>
>
> On arm64 with defconfig, yes. I want to make it transparent for
> platforms that don't have shared GPIOs though. I'm aware of issues and
> am actively fixing all that are reported to me. Another set of fixes
> will be in tomorrow's linux-next.
>
>> I haven't grokked everything, but does GPIO_SHARED=3Dy makes any sense
>> without GPIO_SHARED_PROXY? It seems to me that the probing of shared
>> pins will be deferred indefinitely.
>>
>
> Do you have a use-case where there are shared GPIOs that are needed at
> boot time when there are no modules?

See below.

> I am aware of the issue where
> false-positive shared GPIOs are detected, I posted a fix for that too.
> Without logs, I can't really tell if that's the case for you though.
> :(

What I mean is, GPIO_SHARED is automatically selected by ARCH_QCOM (and
probably others in the future). But GPIO_SHARED_PROXY is
selectable by the user and it can be deselected. But you cannot
specifically deactivate GPIO_SHARED. So there is no way to go back
to the former hacky shared gpio handling; which might be intended :)

If so, shouldn't be GPIO_SHARED_PROXY be either y or m if GPIO_SHARED=3Dy ?
I.e. don't allow it to be deselected.=20

>> > The practical use-case for this are the powerdown GPIOs shared by
>> > speakers on Qualcomm db845c platform, however I have also extensively
>> > tested it using gpio-virtuser on arm64 qemu with various DT
>> > configurations.
>> >
>> > I'm Cc'ing some people that may help with reviewing/be interested in
>> > this: OF maintainers (because the main target are OF systems initially=
),
>> > Mark Brown because most users of GPIOD_FLAGS_BIT_NONEXCLUSIVE live
>> > in audio or regulator drivers and one of the goals of this series is
>> > dropping the hand-crafted GPIO enable counting via struct
>> > regulator_enable_gpio in regulator core), Andy and Mika because I'd li=
ke
>> > to also cover ACPI (even though I don't know about any ACPI platform t=
hat
>> > would need this at the moment, I think it makes sense to make the
>> > solution complete), Dmitry (same thing but for software nodes), Mani
>> > (because you have a somewhat related use-case for the PERST# signal an=
d
>> > I'd like to hear your input on whether this is something you can use o=
r
>> > maybe it needs a separate, implicit gpio-perst driver similar to what
>> > Krzysztof did for reset-gpios) and Greg (because I mentioned this to y=
ou
>> > last week in person and I also use the auxiliary bus for the proxy
>> > devices).
>>
>> This broke my board (using the arm64 defconfig, works without
>> GPIO_SHARED of course). I'm seeing two issues here with my board
>> (arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67*):
>>
>>  (1) It's GPIO controller (gpio-davinci) doesn't support
>>      .get_direction so I'm getting ENOTSUPP during probing of the
>>      (some?) shared GPIOs.
>>
>
> Unless this board really shares GPIOs, it may be due to the
> false-positives that will be fixed by this patch[1]. If you enable

Yeah this board shares an enable GPIO for two regulators
(regulator-5 and regulator-6,
arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts).

> CONFIG_DEBUG_GPIO and post the kernel log, I'll be able to tell for
> sure.

See end of this mail. I've applied the mentioned patch.

> Though thanks for bringing this to my attention as I now see there is
> indeed an issue when the proxied chip doesn't support .get_direction()
> as well as a duplicated check in GPIO core. I'll fix it too.
>
>>  (2) GPIO_SHARED_PROXY is default m in the defconfig, but I need the
>>      pins for the root filesystem medium, i.e. the SD card regulators.
>>
>
> I'll take care of this is you confirm, the issue persists even with patch=
[1].

Not sure this is still valid. Because I've just learned that
apparently, the arm64 Image shall be made smaller and thus "need
a driver for rootfs" isn't a valid reason for =3Dy anymore.

-michael

kernel boot log:

[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
[    0.000000] Linux version 6.19.0-rc4-next-20260109-00037-g6143d690c7d2 (=
mwalle@mwalle01) (aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0, GNU ld (=
GNU Binutils for Debian) 2.44) #3137 SMP Fri Jan  9 15:16:54 CET 2026
[    0.000000] KASLR enabled
[    0.000000] Machine model: Kontron SMARC-sAM67
[    0.000000] efi: UEFI not found.
[    0.000000] [Firmware Bug]: Kernel image misaligned at boot, please fix =
your bootloader!
[    0.000000] Reserved memory: created CMA memory pool at 0x00000009f00000=
00, size 256 MiB
[    0.000000] OF: reserved mem: initialized node linux,cma, compatible id =
shared-dma-pool
[    0.000000] OF: reserved mem: 0x00000009f0000000..0x00000009ffffffff (26=
2144 KiB) map reusable linux,cma
[    0.000000] OF: reserved mem: 0x000000009e800000..0x000000009fffffff (24=
576 KiB) nomap non-reusable optee@9e800000
[    0.000000] OF: reserved mem: 0x0000000080000000..0x000000008007ffff (51=
2 KiB) nomap non-reusable tfa@80000000
[    0.000000] Reserved memory: created DMA memory pool at 0x00000000a01000=
00, size 15 MiB
[    0.000000] OF: reserved mem: initialized node r5f-memory@a0100000, comp=
atible id shared-dma-pool
[    0.000000] OF: reserved mem: 0x00000000a0100000..0x00000000a0ffffff (15=
360 KiB) nomap non-reusable r5f-memory@a0100000
[    0.000000] NUMA: Faking a node at [mem 0x0000000080000000-0x00000009fff=
fffff]
[    0.000000] NODE_DATA(0) allocated [mem 0x9eefb5d00-0x9eefb7d3f]
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: Trusted OS migration not required
[    0.000000] psci: SMC Calling Convention v1.5
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000080000000-0x00000000ffffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   [mem 0x0000000100000000-0x00000009ffffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x000000008007ffff]
[    0.000000]   node   0: [mem 0x0000000080080000-0x000000009e7fffff]
[    0.000000]   node   0: [mem 0x000000009e800000-0x000000009fffffff]
[    0.000000]   node   0: [mem 0x00000000a0000000-0x00000000a00fffff]
[    0.000000]   node   0: [mem 0x00000000a0100000-0x00000000a0ffffff]
[    0.000000]   node   0: [mem 0x00000000a1000000-0x00000000ffffffff]
[    0.000000]   node   0: [mem 0x0000000880000000-0x00000009ffffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x00000009fffff=
fff]
[    0.000000] percpu: Embedded 32 pages/cpu s91416 r8192 d31464 u131072
[    0.000000] pcpu-alloc: s91416 r8192 d31464 u131072 alloc=3D32*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3=20
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: detected: GICv3 CPU interface
[    0.000000] CPU features: kernel page table isolation forced ON by KASLR
[    0.000000] CPU features: detected: Kernel page table isolation (KPTI)
[    0.000000] CPU features: detected: ARM erratum 845719
[    0.000000] alternatives: applying boot alternatives
[    0.000000] Kernel command line: root=3D/dev/mmcblk0p2 rootwait console=
=3DttyS1,115200n8 panic=3D3 debug
[    0.000000] printk: log buffer data + meta data: 131072 + 458752 =3D 589=
824 bytes
[    0.000000] Dentry cache hash table entries: 1048576 (order: 11, 8388608=
 bytes, linear)
[    0.000000] Inode-cache hash table entries: 524288 (order: 10, 4194304 b=
ytes, linear)
[    0.000000] software IO TLB: area num 4.
[    0.000000] software IO TLB: mapped [mem 0x00000000fbfff000-0x00000000ff=
fff000] (64MB)
[    0.000000] Fallback order for Node 0: 0=20
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 20971=
52
[    0.000000] Policy zone: Normal
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] stackdepot: allocating hash table via alloc_large_system_has=
h
[    0.000000] stackdepot hash table entries: 524288 (order: 11, 8388608 by=
tes, linear)
[    0.000000] stackdepot: allocating space for 8192 stack pools via memblo=
ck
[    0.000000] **********************************************************
[    0.000000] **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
[    0.000000] **                                                      **
[    0.000000] ** This system shows unhashed kernel memory addresses   **
[    0.000000] ** via the console, logs, and other interfaces. This    **
[    0.000000] ** might reduce the security of your system.            **
[    0.000000] **                                                      **
[    0.000000] ** If you see this message and you are not debugging    **
[    0.000000] ** the kernel, report this immediately to your system   **
[    0.000000] ** administrator!                                       **
[    0.000000] **                                                      **
[    0.000000] ** Use hash_pointers=3Dalways to force this mode off      **
[    0.000000] **                                                      **
[    0.000000] **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
[    0.000000] **********************************************************
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D4, N=
odes=3D1
[    0.000000] ftrace: allocating 77902 entries in 306 pages
[    0.000000] ftrace: allocated 306 pages with 4 groups
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=3D256 to nr_cpu_ids=
=3D4.
[    0.000000] 	Rude variant of Tasks RCU enabled.
[    0.000000] 	Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 2=
5 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D4
[    0.000000] RCU Tasks Rude: Setting shift to 2 and lim to 1 rcu_task_cb_=
adjust=3D1 rcu_task_cpu_ids=3D4.
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] GICv3: GIC: Using split EOI/Deactivate mode
[    0.000000] GICv3: 256 SPIs implemented
[    0.000000] GICv3: 0 Extended SPIs implemented
[    0.000000] Root IRQ handler: gic_handle_irq
[    0.000000] GICv3: GICv3 features: 16 PPIs
[    0.000000] GICv3: GICD_CTLR.DS=3D0, SCR_EL3.FIQ=3D1
[    0.000000] GICv3: CPU0: found redistributor 0 region 0:0x00000000018800=
00
[    0.000000] ITS [mem 0x01820000-0x0182ffff]
[    0.000000] GIC: enabling workaround for ITS: Socionext Synquacer pre-IT=
S
[    0.000000] ITS@0x0000000001820000: Devices Table too large, reduce ids =
20->19
[    0.000000] ITS@0x0000000001820000: allocated 524288 Devices @880800000 =
(flat, esz 8, psz 64K, shr 0)
[    0.000000] ITS: using cache flushing for cmd queue
[    0.000000] GICv3: using LPI property table @0x0000000880350000
[    0.000000] GIC: using cache flushing for LPI property table
[    0.000000] GICv3: CPU0: using allocated LPI pending table @0x0000000880=
360000
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contentio=
n.
[    0.000000] arch_timer: cp15 timer running at 200.00MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0x3ffffffffffffff max_c=
ycles: 0x2e2049d3e8, max_idle_ns: 440795210634 ns
[    0.000000] sched_clock: 58 bits at 200MHz, resolution 5ns, wraps every =
4398046511102ns
[    0.000768] Console: colour dummy device 80x25
[    0.000905] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 400.00 BogoMIPS (lpj=3D800000)
[    0.000915] pid_max: default: 32768 minimum: 301
[    0.001293] Mount-cache hash table entries: 16384 (order: 5, 131072 byte=
s, linear)
[    0.001319] Mountpoint-cache hash table entries: 16384 (order: 5, 131072=
 bytes, linear)
[    0.004990] rcu: Hierarchical SRCU implementation.
[    0.005003] rcu: 	Max phase no-delay instances is 1000.
[    0.005338] Timer migration: 1 hierarchy levels; 8 children per group; 1=
 crossnode level
[    0.005539] EFI services will not be available.
[    0.005897] smp: Bringing up secondary CPUs ...
[    0.014795] Detected VIPT I-cache on CPU1
[    0.014915] GICv3: CPU1: found redistributor 1 region 0:0x00000000018a00=
00
[    0.014929] GICv3: CPU1: using allocated LPI pending table @0x0000000880=
370000
[    0.014977] CPU1: Booted secondary processor 0x0000000001 [0x410fd034]
[    0.024011] Detected VIPT I-cache on CPU2
[    0.024110] GICv3: CPU2: found redistributor 2 region 0:0x00000000018c00=
00
[    0.024123] GICv3: CPU2: using allocated LPI pending table @0x0000000880=
380000
[    0.024159] CPU2: Booted secondary processor 0x0000000002 [0x410fd034]
[    0.033103] Detected VIPT I-cache on CPU3
[    0.033195] GICv3: CPU3: found redistributor 3 region 0:0x00000000018e00=
00
[    0.033208] GICv3: CPU3: using allocated LPI pending table @0x0000000880=
390000
[    0.033244] CPU3: Booted secondary processor 0x0000000003 [0x410fd034]
[    0.033354] smp: Brought up 1 node, 4 CPUs
[    0.033360] SMP: Total of 4 processors activated.
[    0.033362] CPU: All CPU(s) started at EL2
[    0.033392] CPU features: detected: 32-bit EL0 Support
[    0.033395] CPU features: detected: 32-bit EL1 Support
[    0.033399] CPU features: detected: CRC32 instructions
[    0.033408] CPU features: detected: PMUv3
[    0.033449] alternatives: applying system-wide alternatives
[    0.035494] Memory: 7795152K/8388608K available (24448K kernel code, 328=
6K rwdata, 12924K rodata, 3200K init, 527K bss, 320344K reserved, 262144K c=
ma-reserved)
[    0.036917] devtmpfs: initialized
[    0.073902] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 7645041785100000 ns
[    0.073946] posixtimers hash table entries: 2048 (order: 3, 32768 bytes,=
 linear)
[    0.073995] futex hash table entries: 1024 (65536 bytes on 1 NUMA nodes,=
 total 64 KiB, linear).
[    0.077302] 2G module region forced by RANDOMIZE_MODULE_REGION_FULL
[    0.077338] 0 pages in range for non-PLT usage
[    0.077343] 513136 pages in range for PLT usage
[    0.080465]=20
[    0.080475] ************************************************************=
*
[    0.080477] **     NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE    *=
*
[    0.080479] **                                                         *=
*
[    0.080481] **  IOMMU DebugFS SUPPORT HAS BEEN ENABLED IN THIS KERNEL  *=
*
[    0.080483] **                                                         *=
*
[    0.080484] ** This means that this kernel is built to expose internal *=
*
[    0.080486] ** IOMMU data structures, which may compromise security on *=
*
[    0.080488] ** your system.                                            *=
*
[    0.080490] **                                                         *=
*
[    0.080492] ** If you see this message and you are not debugging the   *=
*
[    0.080493] ** kernel, report this immediately to your vendor!         *=
*
[    0.080496] **                                                         *=
*
[    0.080497] **     NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE    *=
*
[    0.080499] ************************************************************=
*
[    0.080914] DMI not present or invalid.
[    0.083305] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.084747] DMA: preallocated 1024 KiB GFP_KERNEL pool for atomic alloca=
tions
[    0.084897] DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA pool for atomi=
c allocations
[    0.085026] DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA32 pool for ato=
mic allocations
[    0.085126] audit: initializing netlink subsys (disabled)
[    0.085468] audit: type=3D2000 audit(0.084:1): state=3Dinitialized audit=
_enabled=3D0 res=3D1
[    0.086125] gpiolib_shared: Created a secondary shared GPIO reference fo=
r potential reset-gpio device for GPIO 10 at gpio@600000
[    0.086372] gpiolib_shared: Created a secondary shared GPIO reference fo=
r potential reset-gpio device for GPIO 15 at gpio@601000
[    0.086528] gpiolib_shared: GPIO 7 at gpio@600000 is shared by multiple =
firmware nodes
[    0.086583] gpiolib_shared: GPIO 4 at pmic@44 is shared by multiple firm=
ware nodes
[    0.086753] gpiolib_shared: Finished scanning firmware nodes for shared =
GPIOs
[    0.088766] thermal_sys: Registered thermal governor 'step_wise'
[    0.088884] cpuidle: using governor menu
[    0.089362] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers=
.
[    0.089468] ASID allocator initialised with 32768 entries
[    0.090816] Serial: AMBA PL011 UART driver
[    0.097535] /bus@f0000/interrupt-controller@1800000: Fixed dependency cy=
cle(s) with /bus@f0000/interrupt-controller@1800000
[    0.097672] /bus@f0000/i2c@20000000/bridge@2c: Fixed dependency cycle(s)=
 with /bus@f0000/dsi@30500000
[    0.097684] /bus@f0000/i2c@20000000/bridge@2c: Fixed dependency cycle(s)=
 with /connector-2
[    0.098118] /bus@f0000/dss@30220000: Fixed dependency cycle(s) with /bus=
@f0000/dsi@30500000
[    0.098148] /bus@f0000/dsi@30500000: Fixed dependency cycle(s) with /bus=
@f0000/i2c@20000000/bridge@2c
[    0.098161] /bus@f0000/dsi@30500000: Fixed dependency cycle(s) with /bus=
@f0000/dss@30220000
[    0.109935] /bus@f0000/i2c@20000000/bridge@2c: Fixed dependency cycle(s)=
 with /bus@f0000/dsi@30500000
[    0.109956] /bus@f0000/i2c@20000000/bridge@2c: Fixed dependency cycle(s)=
 with /connector-2
[    0.115336] /bus@f0000/dss@30220000: Fixed dependency cycle(s) with /bus=
@f0000/dsi@30500000
[    0.115784] /bus@f0000/dss@30220000: Fixed dependency cycle(s) with /bus=
@f0000/dsi@30500000
[    0.115965] /bus@f0000/i2c@20000000/bridge@2c: Fixed dependency cycle(s)=
 with /bus@f0000/dsi@30500000
[    0.116148] /bus@f0000/dsi@30500000: Fixed dependency cycle(s) with /bus=
@f0000/i2c@20000000/bridge@2c
[    0.116163] /bus@f0000/dsi@30500000: Fixed dependency cycle(s) with /bus=
@f0000/dss@30220000
[    0.117744] /bus@f0000/pcie@f102000: Fixed dependency cycle(s) with /bus=
@f0000/pcie@f102000/interrupt-controller
[    0.118873] /bus@f0000/usb@f900000/usb@31000000: Fixed dependency cycle(=
s) with /connector-1
[    0.119081] /connector-1: Fixed dependency cycle(s) with /bus@f0000/usb@=
f900000/usb@31000000
[    0.125763] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 page=
s
[    0.125776] HugeTLB: 0 KiB vmemmap can be freed for a 1.00 GiB page
[    0.125780] HugeTLB: registered 32.0 MiB page size, pre-allocated 0 page=
s
[    0.125783] HugeTLB: 0 KiB vmemmap can be freed for a 32.0 MiB page
[    0.125786] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 page=
s
[    0.125789] HugeTLB: 0 KiB vmemmap can be freed for a 2.00 MiB page
[    0.125792] HugeTLB: registered 64.0 KiB page size, pre-allocated 0 page=
s
[    0.125795] HugeTLB: 0 KiB vmemmap can be freed for a 64.0 KiB page
[    0.130707] ACPI: Interpreter disabled.
[    0.131890] k3-chipinfo 43000014.chipid: Family:J722S rev:SR1.0 JTAGID[0=
x0bba002f] Detected
[    0.132924] reg-fixed-voltage regulator-1: using DT '/regulator-1' for '=
(default)' GPIO lookup
[    0.132979] of_get_named_gpiod_flags: can't parse 'gpios' property of no=
de '/regulator-1[0]'
[    0.133013] of_get_named_gpiod_flags: can't parse 'gpio' property of nod=
e '/regulator-1[0]'
[    0.133023] reg-fixed-voltage regulator-1: using lookup tables for GPIO =
lookup
[    0.133028] reg-fixed-voltage regulator-1: No GPIO consumer (default) fo=
und
[    0.133595] reg-fixed-voltage regulator-2: using DT '/regulator-2' for '=
(default)' GPIO lookup
[    0.133638] of_get_named_gpiod_flags: can't parse 'gpios' property of no=
de '/regulator-2[0]'
[    0.133672] of_get_named_gpiod_flags: can't parse 'gpio' property of nod=
e '/regulator-2[0]'
[    0.133681] reg-fixed-voltage regulator-2: using lookup tables for GPIO =
lookup
[    0.133685] reg-fixed-voltage regulator-2: No GPIO consumer (default) fo=
und
[    0.133829] iommu: Default domain type: Translated
[    0.133837] iommu: DMA domain TLB invalidation policy: strict mode
[    0.133874] reg-fixed-voltage regulator-3: using DT '/regulator-3' for '=
(default)' GPIO lookup
[    0.133917] of_get_named_gpiod_flags: can't parse 'gpios' property of no=
de '/regulator-3[0]'
[    0.133950] of_get_named_gpiod_flags: can't parse 'gpio' property of nod=
e '/regulator-3[0]'
[    0.133959] reg-fixed-voltage regulator-3: using lookup tables for GPIO =
lookup
[    0.133963] reg-fixed-voltage regulator-3: No GPIO consumer (default) fo=
und
[    0.135533] SCSI subsystem initialized
[    0.135968] libata version 3.00 loaded.
[    0.136684] usbcore: registered new interface driver usbfs
[    0.136834] usbcore: registered new interface driver hub
[    0.136928] usbcore: registered new device driver usb
[    0.138760] mc: Linux media interface: v0.10
[    0.138894] videodev: Linux video capture interface: v2.00
[    0.139094] pps_core: LinuxPPS API ver. 1 registered
[    0.139098] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>
[    0.139148] PTP clock support registered
[    0.139258] EDAC MC: Ver: 3.0.0
[    0.141796] FPGA manager framework
[    0.142162] Advanced Linux Sound Architecture Driver Initialized.
[    0.144034] nfc: nfc_init: NFC Core ver 0.1
[    0.144211] NET: Registered PF_NFC protocol family
[    0.144855] vgaarb: loaded
[    0.145797] clocksource: Switched to clocksource arch_sys_counter
[    0.146836] VFS: Disk quotas dquot_6.6.0
[    0.146886] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    0.148369] pnp: PnP ACPI: disabled
[    0.163926] NET: Registered PF_INET protocol family
[    0.164248] IP idents hash table entries: 131072 (order: 8, 1048576 byte=
s, linear)
[    0.169154] tcp_listen_portaddr_hash hash table entries: 4096 (order: 4,=
 65536 bytes, linear)
[    0.169223] Table-perturb hash table entries: 65536 (order: 6, 262144 by=
tes, linear)
[    0.169264] TCP established hash table entries: 65536 (order: 7, 524288 =
bytes, linear)
[    0.169655] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes,=
 linear)
[    0.171216] TCP: Hash tables configured (established 65536 bind 65536)
[    0.171485] UDP hash table entries: 4096 (order: 6, 262144 bytes, linear=
)
[    0.171699] UDP-Lite hash table entries: 4096 (order: 6, 262144 bytes, l=
inear)
[    0.172205] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.173282] RPC: Registered named UNIX socket transport module.
[    0.173292] RPC: Registered udp transport module.
[    0.173295] RPC: Registered tcp transport module.
[    0.173297] RPC: Registered tcp-with-tls transport module.
[    0.173299] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.174931] PCI: CLS 0 bytes, default 64
[    0.185302] kvm [1]: nv: 568 coarse grained trap handlers
[    0.185910] kvm [1]: IPA Size Limit: 40 bits
[    0.188173] kvm [1]: vgic-v2@100020000
[    0.188197] kvm [1]: GICv3 sysreg trapping enabled ([C], reduced perform=
ance)
[    0.188219] kvm [1]: GIC system register CPU interface enabled
[    0.188269] kvm [1]: vgic interrupt IRQ9
[    0.188300] kvm [1]: Hyp nVHE mode initialized successfully
[    0.192252] Initialise system trusted keyrings
[    0.192682] workingset: timestamp_bits=3D44 max_order=3D21 bucket_order=
=3D0
[    0.197812] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.198605] NFS: Registering the id_resolver key type
[    0.198649] Key type id_resolver registered
[    0.198653] Key type id_legacy registered
[    0.198717] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.198733] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Regist=
ering...
[    0.199201] 9p: Installing v9fs 9p2000 file system support
[    0.199930] cryptd: max_cpu_qlen set to 1000
[    0.249756] NET: Registered PF_ALG protocol family
[    0.249790] Key type asymmetric registered
[    0.249793] Asymmetric key parser 'x509' registered
[    0.250006] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 243)
[    0.250015] io scheduler mq-deadline registered
[    0.250018] io scheduler kyber registered
[    0.265257] pinctrl-single 4084000.pinctrl: 34 pins, size 136
[    0.267673] pinctrl-single f4000.pinctrl: 172 pins, size 688
[    0.286821] ledtrig-cpu: registered to indicate activity on CPUs
[    0.311058] Serial: 8250/16550 driver, 8 ports, IRQ sharing enabled
[    0.328232] display-connector connector-2: using DT '/connector-2' for '=
hpd' GPIO lookup
[    0.328326] display-connector connector-2: No GPIO consumer hpd found
[    0.346493] loop: module loaded
[    0.359757] mdio_bus fixed-0: using lookup tables for GPIO lookup
[    0.359771] mdio_bus fixed-0: No GPIO consumer reset found
[    0.370734] tun: Universal TUN/TAP device driver, 1.6
[    0.371335] CAN device driver interface
[    0.375208] e1000: Intel(R) PRO/1000 Network Driver
[    0.375217] e1000: Copyright (c) 1999-2006 Intel Corporation.
[    0.375347] e1000e: Intel(R) PRO/1000 Network Driver
[    0.375350] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    0.375476] igb: Intel(R) Gigabit Ethernet Network Driver
[    0.375479] igb: Copyright (c) 2007-2014 Intel Corporation.
[    0.375600] Intel(R) 2.5G Ethernet Linux Driver
[    0.375603] Copyright(c) 2018 Intel Corporation.
[    0.375727] ixgbe: Intel(R) 10 Gigabit PCI Express Network Driver
[    0.375730] ixgbe: Copyright (c) 1999-2016 Intel Corporation.
[    0.376248] i40e: Intel(R) Ethernet Connection XL710 Network Driver
[    0.376256] i40e: Copyright (c) 2013 - 2019 Intel Corporation.
[    0.380214] usbcore: registered new interface driver rt2500usb
[    0.381193] VFIO - User Level meta-driver version: 0.3
[    0.386365] usbcore: registered new interface driver usb-storage
[    0.388916] UDC core: g_ether: couldn't find an available UDC
[    0.389015] UDC core: g_mass_storage: couldn't find an available UDC
[    0.389102] UDC core: g_serial: couldn't find an available UDC
[    0.391916] i2c_dev: i2c /dev entries driver
[    0.399157] device-mapper: ioctl: 4.50.0-ioctl (2025-04-28) initialised:=
 dm-devel@lists.linux.dev
[    0.399546] device-mapper: multipath round-robin: version 1.2.0 loaded
[    0.399557] device-mapper: multipath queue-length: version 0.2.0 loaded
[    0.399565] device-mapper: multipath service-time: version 0.3.0 loaded
[    0.399573] device-mapper: multipath historical-service-time: version 0.=
1.1 loaded
[    0.401855] sdhci: Secure Digital Host Controller Interface driver
[    0.401863] sdhci: Copyright(c) Pierre Ossman
[    0.402880] Synopsys Designware Multimedia Card Interface Driver
[    0.403621] sdhci-pltfm: SDHCI platform and OF driver helper
[    0.405431] SMCCC: SOC_ID: ARCH_SOC_ID not implemented, skipping ....
[    0.408699] usbcore: registered new interface driver usbhid
[    0.408709] usbhid: USB HID core driver
[    0.409111] gpib_common: GPIB core driver
[    0.422122] hw perfevents: enabled with armv8_cortex_a53 PMU driver, 7 (=
0,8000003f) counters available
[    0.424854] optee: probing for conduit method.
[    0.424888] optee: revision 4.7
[    0.441736] optee: dynamic shared memory is enabled
[    0.442760] optee: initialized driver
[    0.442800] random: crng init done
[    0.448117] drop_monitor: Initializing network drop monitor service
[    0.448591] NET: Registered PF_INET6 protocol family
[    0.450331] Segment Routing with IPv6
[    0.450462] In-situ OAM (IOAM) with IPv6
[    0.450574] NET: Registered PF_PACKET protocol family
[    0.450943] can: controller area network core
[    0.451023] NET: Registered PF_CAN protocol family
[    0.451028] can: raw protocol
[    0.451033] can: broadcast manager protocol
[    0.451043] can: netlink gateway - max_hops=3D1
[    0.451211] 8021q: 802.1Q VLAN Support v1.8
[    0.451275] 9pnet: Installing 9P2000 support
[    0.451428] Key type dns_resolver registered
[    0.489596] registered taskstats version 1
[    0.489619] Loading compiled-in X.509 certificates
[    0.523182] Demotion targets for Node 0: null
[    0.524429] Key type encrypted registered
[    0.539208] display-connector connector-2: using DT '/connector-2' for '=
hpd' GPIO lookup
[    0.539269] display-connector connector-2: No GPIO consumer hpd found
[    0.550927] ti-sci 44043000.system-controller: ABI: 4.0 (firmware rev 0x=
000b '11.1.9--v11.01.09 (Fancy Rat)')
[    0.671150] i2c i2c-0: using DT '/bus@f0000/bus@4000000/i2c@4900000' for=
 'scl' GPIO lookup
[    0.671219] of_get_named_gpiod_flags: can't parse 'scl-gpios' property o=
f node '/bus@f0000/bus@4000000/i2c@4900000[0]'
[    0.671257] of_get_named_gpiod_flags: can't parse 'scl-gpio' property of=
 node '/bus@f0000/bus@4000000/i2c@4900000[0]'
[    0.671269] i2c i2c-0: using lookup tables for GPIO lookup
[    0.671274] i2c i2c-0: No GPIO consumer scl found
[    0.671290] i2c i2c-0: using DT '/bus@f0000/bus@4000000/i2c@4900000' for=
 'sda' GPIO lookup
[    0.671331] of_get_named_gpiod_flags: can't parse 'sda-gpios' property o=
f node '/bus@f0000/bus@4000000/i2c@4900000[0]'
[    0.671366] of_get_named_gpiod_flags: can't parse 'sda-gpio' property of=
 node '/bus@f0000/bus@4000000/i2c@4900000[0]'
[    0.671377] i2c i2c-0: using lookup tables for GPIO lookup
[    0.671380] i2c i2c-0: No GPIO consumer sda found
[    0.671685] omap_i2c 4900000.i2c: bus 0 rev0.12 at 100 kHz
[    0.674478] i2c i2c-1: using DT '/bus@f0000/bus@b00000/i2c@2b200000' for=
 'scl' GPIO lookup
[    0.674538] of_get_named_gpiod_flags: can't parse 'scl-gpios' property o=
f node '/bus@f0000/bus@b00000/i2c@2b200000[0]'
[    0.674575] of_get_named_gpiod_flags: can't parse 'scl-gpio' property of=
 node '/bus@f0000/bus@b00000/i2c@2b200000[0]'
[    0.674588] i2c i2c-1: using lookup tables for GPIO lookup
[    0.674592] i2c i2c-1: No GPIO consumer scl found
[    0.674608] i2c i2c-1: using DT '/bus@f0000/bus@b00000/i2c@2b200000' for=
 'sda' GPIO lookup
[    0.674647] of_get_named_gpiod_flags: can't parse 'sda-gpios' property o=
f node '/bus@f0000/bus@b00000/i2c@2b200000[0]'
[    0.674681] of_get_named_gpiod_flags: can't parse 'sda-gpio' property of=
 node '/bus@f0000/bus@b00000/i2c@2b200000[0]'
[    0.674692] i2c i2c-1: using lookup tables for GPIO lookup
[    0.674695] i2c i2c-1: No GPIO consumer sda found
[    0.674722] omap_i2c 2b200000.i2c: bus 1 rev0.12 at 100 kHz
[    0.676227] i2c i2c-2: using DT '/bus@f0000/i2c@20000000' for 'scl' GPIO=
 lookup
[    0.676277] of_get_named_gpiod_flags: can't parse 'scl-gpios' property o=
f node '/bus@f0000/i2c@20000000[0]'
[    0.676313] of_get_named_gpiod_flags: can't parse 'scl-gpio' property of=
 node '/bus@f0000/i2c@20000000[0]'
[    0.676323] i2c i2c-2: using lookup tables for GPIO lookup
[    0.676327] i2c i2c-2: No GPIO consumer scl found
[    0.676343] i2c i2c-2: using DT '/bus@f0000/i2c@20000000' for 'sda' GPIO=
 lookup
[    0.676378] of_get_named_gpiod_flags: can't parse 'sda-gpios' property o=
f node '/bus@f0000/i2c@20000000[0]'
[    0.676411] of_get_named_gpiod_flags: can't parse 'sda-gpio' property of=
 node '/bus@f0000/i2c@20000000[0]'
[    0.676420] i2c i2c-2: using lookup tables for GPIO lookup
[    0.676424] i2c i2c-2: No GPIO consumer sda found
[    0.677271] /bus@f0000/dsi@30500000: Fixed dependency cycle(s) with /bus=
@f0000/i2c@20000000/bridge@2c
[    0.677457] /connector-2: Fixed dependency cycle(s) with /bus@f0000/i2c@=
20000000/bridge@2c
[    0.677751] /bus@f0000/i2c@20000000/bridge@2c: Fixed dependency cycle(s)=
 with /bus@f0000/dsi@30500000
[    0.677923] /bus@f0000/i2c@20000000/bridge@2c: Fixed dependency cycle(s)=
 with /connector-2
[    0.695532] sl28cpld-wdt 20000000.i2c:system-controller@4a:watchdog@4: i=
nitial timeout 10 sec
[    0.697244] omap_i2c 20000000.i2c: bus 2 rev0.12 at 100 kHz
[    0.699285] i2c i2c-3: using DT '/bus@f0000/i2c@20020000' for 'scl' GPIO=
 lookup
[    0.699343] of_get_named_gpiod_flags: can't parse 'scl-gpios' property o=
f node '/bus@f0000/i2c@20020000[0]'
[    0.699377] of_get_named_gpiod_flags: can't parse 'scl-gpio' property of=
 node '/bus@f0000/i2c@20020000[0]'
[    0.699388] i2c i2c-3: using lookup tables for GPIO lookup
[    0.699392] i2c i2c-3: No GPIO consumer scl found
[    0.699408] i2c i2c-3: using DT '/bus@f0000/i2c@20020000' for 'sda' GPIO=
 lookup
[    0.699446] of_get_named_gpiod_flags: can't parse 'sda-gpios' property o=
f node '/bus@f0000/i2c@20020000[0]'
[    0.699479] of_get_named_gpiod_flags: can't parse 'sda-gpio' property of=
 node '/bus@f0000/i2c@20020000[0]'
[    0.699487] i2c i2c-3: using lookup tables for GPIO lookup
[    0.699491] i2c i2c-3: No GPIO consumer sda found
[    0.700196] omap_i2c 20020000.i2c: bus 3 rev0.12 at 100 kHz
[    0.702043] i2c i2c-4: using DT '/bus@f0000/i2c@20030000' for 'scl' GPIO=
 lookup
[    0.702098] of_get_named_gpiod_flags: can't parse 'scl-gpios' property o=
f node '/bus@f0000/i2c@20030000[0]'
[    0.702133] of_get_named_gpiod_flags: can't parse 'scl-gpio' property of=
 node '/bus@f0000/i2c@20030000[0]'
[    0.702145] i2c i2c-4: using lookup tables for GPIO lookup
[    0.702149] i2c i2c-4: No GPIO consumer scl found
[    0.702165] i2c i2c-4: using DT '/bus@f0000/i2c@20030000' for 'sda' GPIO=
 lookup
[    0.702199] of_get_named_gpiod_flags: can't parse 'sda-gpios' property o=
f node '/bus@f0000/i2c@20030000[0]'
[    0.702232] of_get_named_gpiod_flags: can't parse 'sda-gpio' property of=
 node '/bus@f0000/i2c@20030000[0]'
[    0.702241] i2c i2c-4: using lookup tables for GPIO lookup
[    0.702245] i2c i2c-4: No GPIO consumer sda found
[    0.702271] omap_i2c 20030000.i2c: bus 4 rev0.12 at 100 kHz
[    0.702758] ti-sci-intr 4210000.interrupt-controller: Interrupt Router 5=
 domain created
[    0.703079] ti-sci-intr bus@f0000:interrupt-controller@a00000: Interrupt=
 Router 3 domain created
[    0.703497] debugfs: ':bus@f0000:bus@48000000:interrupt-controller@48000=
000' already exists in 'domains'
[    0.703560] ti-sci-inta 48000000.interrupt-controller: Interrupt Aggrega=
tor domain 28 created
[    0.704088] debugfs: ':bus@f0000:bus@4e000000:interrupt-controller@4e400=
000' already exists in 'domains'
[    0.704139] ti-sci-inta 4e400000.interrupt-controller: Interrupt Aggrega=
tor domain 200 created
[    0.706053] wiz bus@f0000:phy@f000000: using DT '/bus@f0000/phy@f000000'=
 for 'typec-dir' GPIO lookup
[    0.706103] of_get_named_gpiod_flags: can't parse 'typec-dir-gpios' prop=
erty of node '/bus@f0000/phy@f000000[0]'
[    0.706138] of_get_named_gpiod_flags: can't parse 'typec-dir-gpio' prope=
rty of node '/bus@f0000/phy@f000000[0]'
[    0.706149] wiz bus@f0000:phy@f000000: using lookup tables for GPIO look=
up
[    0.706153] wiz bus@f0000:phy@f000000: No GPIO consumer typec-dir found
[    0.709256] wiz bus@f0000:phy@f010000: using DT '/bus@f0000/phy@f010000'=
 for 'typec-dir' GPIO lookup
[    0.709303] of_get_named_gpiod_flags: can't parse 'typec-dir-gpios' prop=
erty of node '/bus@f0000/phy@f010000[0]'
[    0.709339] of_get_named_gpiod_flags: can't parse 'typec-dir-gpio' prope=
rty of node '/bus@f0000/phy@f010000[0]'
[    0.709350] wiz bus@f0000:phy@f010000: using lookup tables for GPIO look=
up
[    0.709355] wiz bus@f0000:phy@f010000: No GPIO consumer typec-dir found
[    0.712757] ti-udma 485c0100.dma-controller: Number of rings: 82
[    0.719444] ti-udma 485c0100.dma-controller: Channels: 44 (bchan: 16, tc=
han: 12, rchan: 16)
[    0.726107] ti-udma 485c0000.dma-controller: Number of rings: 150
[    0.738618] ti-udma 485c0000.dma-controller: Channels: 35 (tchan: 20, rc=
han: 15)
[    0.744113] ti-udma 4e230000.dma-controller: Number of rings: 40
[    0.748079] ti-udma 4e230000.dma-controller: Channels: 20 (bchan: 0, tch=
an: 8, rchan: 12)
[    0.752858] omap8250 4a00000.serial: using DT '/bus@f0000/bus@4000000/se=
rial@4a00000' for 'rs485-term' GPIO lookup
[    0.752920] of_get_named_gpiod_flags: can't parse 'rs485-term-gpios' pro=
perty of node '/bus@f0000/bus@4000000/serial@4a00000[0]'
[    0.752958] of_get_named_gpiod_flags: can't parse 'rs485-term-gpio' prop=
erty of node '/bus@f0000/bus@4000000/serial@4a00000[0]'
[    0.752970] omap8250 4a00000.serial: using lookup tables for GPIO lookup
[    0.752975] omap8250 4a00000.serial: No GPIO consumer rs485-term found
[    0.752980] omap8250 4a00000.serial: using DT '/bus@f0000/bus@4000000/se=
rial@4a00000' for 'rs485-rx-during-tx' GPIO lookup
[    0.753020] of_get_named_gpiod_flags: can't parse 'rs485-rx-during-tx-gp=
ios' property of node '/bus@f0000/bus@4000000/serial@4a00000[0]'
[    0.753055] of_get_named_gpiod_flags: can't parse 'rs485-rx-during-tx-gp=
io' property of node '/bus@f0000/bus@4000000/serial@4a00000[0]'
[    0.753066] omap8250 4a00000.serial: using lookup tables for GPIO lookup
[    0.753069] omap8250 4a00000.serial: No GPIO consumer rs485-rx-during-tx=
 found
[    0.753624] 4a00000.serial: ttyS0 at MMIO 0x4a00000 (irq =3D 273, base_b=
aud =3D 3000000) is a 8250
[    0.756162] omap8250 2800000.serial: using DT '/bus@f0000/serial@2800000=
' for 'rs485-term' GPIO lookup
[    0.756219] of_get_named_gpiod_flags: can't parse 'rs485-term-gpios' pro=
perty of node '/bus@f0000/serial@2800000[0]'
[    0.756256] of_get_named_gpiod_flags: can't parse 'rs485-term-gpio' prop=
erty of node '/bus@f0000/serial@2800000[0]'
[    0.756267] omap8250 2800000.serial: using lookup tables for GPIO lookup
[    0.756271] omap8250 2800000.serial: No GPIO consumer rs485-term found
[    0.756276] omap8250 2800000.serial: using DT '/bus@f0000/serial@2800000=
' for 'rs485-rx-during-tx' GPIO lookup
[    0.756312] of_get_named_gpiod_flags: can't parse 'rs485-rx-during-tx-gp=
ios' property of node '/bus@f0000/serial@2800000[0]'
[    0.756346] of_get_named_gpiod_flags: can't parse 'rs485-rx-during-tx-gp=
io' property of node '/bus@f0000/serial@2800000[0]'
[    0.756355] omap8250 2800000.serial: using lookup tables for GPIO lookup
[    0.756358] omap8250 2800000.serial: No GPIO consumer rs485-rx-during-tx=
 found
[    0.756869] 2800000.serial: ttyS1 at MMIO 0x2800000 (irq =3D 274, base_b=
aud =3D 3000000) is a 8250
[    0.756922] printk: legacy console [ttyS1] enabled
[    3.713285] omap8250 2850000.serial: using DT '/bus@f0000/serial@2850000=
' for 'rs485-term' GPIO lookup
[    3.722659] of_get_named_gpiod_flags: can't parse 'rs485-term-gpios' pro=
perty of node '/bus@f0000/serial@2850000[0]'
[    3.733205] of_get_named_gpiod_flags: can't parse 'rs485-term-gpio' prop=
erty of node '/bus@f0000/serial@2850000[0]'
[    3.743633] omap8250 2850000.serial: using lookup tables for GPIO lookup
[    3.750327] omap8250 2850000.serial: No GPIO consumer rs485-term found
[    3.756847] omap8250 2850000.serial: using DT '/bus@f0000/serial@2850000=
' for 'rs485-rx-during-tx' GPIO lookup
[    3.766866] of_get_named_gpiod_flags: can't parse 'rs485-rx-during-tx-gp=
ios' property of node '/bus@f0000/serial@2850000[0]'
[    3.778101] of_get_named_gpiod_flags: can't parse 'rs485-rx-during-tx-gp=
io' property of node '/bus@f0000/serial@2850000[0]'
[    3.789221] omap8250 2850000.serial: using lookup tables for GPIO lookup
[    3.795914] omap8250 2850000.serial: No GPIO consumer rs485-rx-during-tx=
 found
[    3.803680] 2850000.serial: ttyS2 at MMIO 0x2850000 (irq =3D 275, base_b=
aud =3D 3000000) is a 8250
[    3.813756] display-connector connector-2: using DT '/connector-2' for '=
hpd' GPIO lookup
[    3.822222] display-connector connector-2: No GPIO consumer hpd found
[    3.838689] powervr fd80000.gpu: [drm] loaded firmware powervr/rogue_36.=
53.104.796_v1.fw
[    3.846822] powervr fd80000.gpu: [drm] FW version v1.0 (build 6734358 OS=
)
[    3.860510] [drm] Initialized powervr 1.0.0 for fd80000.gpu on minor 0
[    3.872418] m_can_platform 4e08000.can: using DT '/bus@f0000/bus@4000000=
/can@4e08000' for 'termination' GPIO lookup
[    3.882959] of_get_named_gpiod_flags: can't parse 'termination-gpios' pr=
operty of node '/bus@f0000/bus@4000000/can@4e08000[0]'
[    3.894377] of_get_named_gpiod_flags: can't parse 'termination-gpio' pro=
perty of node '/bus@f0000/bus@4000000/can@4e08000[0]'
[    3.905677] m_can_platform 4e08000.can: using lookup tables for GPIO loo=
kup
[    3.912633] m_can_platform 4e08000.can: No GPIO consumer termination fou=
nd
[    3.920481] m_can_platform 4e08000.can can0: device registered (irq=3D28=
0, version=3D32)
[    3.930159] m_can_platform 4e18000.can: using DT '/bus@f0000/bus@4000000=
/can@4e18000' for 'termination' GPIO lookup
[    3.940679] of_get_named_gpiod_flags: can't parse 'termination-gpios' pr=
operty of node '/bus@f0000/bus@4000000/can@4e18000[0]'
[    3.952092] of_get_named_gpiod_flags: can't parse 'termination-gpio' pro=
perty of node '/bus@f0000/bus@4000000/can@4e18000[0]'
[    3.963394] m_can_platform 4e18000.can: using lookup tables for GPIO loo=
kup
[    3.970351] m_can_platform 4e18000.can: No GPIO consumer termination fou=
nd
[    3.978188] m_can_platform 4e18000.can can1: device registered (irq=3D28=
1, version=3D32)
[    3.987587] am65-cpsw-nuss 8000000.ethernet: initializing am65 cpsw nuss=
 version 0x6BA01903, cpsw version 0x6BA81903 Ports: 3 quirks:00000002
[    4.003869] /connector-1: Fixed dependency cycle(s) with /bus@f0000/usb@=
f900000/usb@31000000
[    4.012702] /bus@f0000/usb@f900000/usb@31000000: Fixed dependency cycle(=
s) with /connector-1
[    4.027804] rtc-ti-k3 2b1f0000.rtc: Clock rate 32552 is not 32768! Could=
 misbehave!
[    4.030149] g_ether gadget.0: HOST MAC 8e:c7:a5:36:aa:f4
[    4.037551] rtc-ti-k3 2b1f0000.rtc: registered as rtc1
[    4.040801] g_ether gadget.0: MAC 4e:a1:cb:72:69:f9
[    4.045954] rtc-ti-k3 2b1f0000.rtc: using DT '/bus@f0000/bus@b00000/rtc@=
2b1f0000' for 'wp' GPIO lookup
[    4.051060] g_ether gadget.0: Ethernet Gadget, version: Memorial Day 200=
8
[    4.060135] of_get_named_gpiod_flags: can't parse 'wp-gpios' property of=
 node '/bus@f0000/bus@b00000/rtc@2b1f0000[0]'
[    4.066872] g_ether gadget.0: g_ether ready
[    4.077478] of_get_named_gpiod_flags: can't parse 'wp-gpio' property of =
node '/bus@f0000/bus@b00000/rtc@2b1f0000[0]'
[    4.092140] rtc-ti-k3 2b1f0000.rtc: using lookup tables for GPIO lookup
[    4.098755] rtc-ti-k3 2b1f0000.rtc: No GPIO consumer wp found
[    4.106169] vdec 30210000.video-codec: sram node not found
[    4.115238] vdec 30210000.video-codec: Added wave5 driver with caps: 'EN=
CODE' 'DECODE'
[    4.123202] vdec 30210000.video-codec: Product Code:      0x521c
[    4.129213] vdec 30210000.video-codec: Firmware Revision: 363254
[    4.153362] sdhci-am654 fa10000.mmc: using DT '/bus@f0000/mmc@fa10000' f=
or 'cd' GPIO lookup
[    4.161830] of_get_named_gpiod_flags: can't parse 'cd-gpios' property of=
 node '/bus@f0000/mmc@fa10000[0]'
[    4.171442] of_get_named_gpiod_flags: can't parse 'cd-gpio' property of =
node '/bus@f0000/mmc@fa10000[0]'
[    4.180924] sdhci-am654 fa10000.mmc: using lookup tables for GPIO lookup
[    4.187625] sdhci-am654 fa10000.mmc: No GPIO consumer cd found
[    4.193460] sdhci-am654 fa10000.mmc: using DT '/bus@f0000/mmc@fa10000' f=
or 'wp' GPIO lookup
[    4.201842] of_get_named_gpiod_flags: can't parse 'wp-gpios' property of=
 node '/bus@f0000/mmc@fa10000[0]'
[    4.211447] of_get_named_gpiod_flags: can't parse 'wp-gpio' property of =
node '/bus@f0000/mmc@fa10000[0]'
[    4.220927] sdhci-am654 fa10000.mmc: using lookup tables for GPIO lookup
[    4.227627] sdhci-am654 fa10000.mmc: No GPIO consumer wp found
[    4.233736] mmc0: CQHCI version 5.10
[    4.238614] gpiochip_find_base_unlocked: found new base at 512
[    4.244548] gpio gpiochip0: (4201000.gpio): created GPIO range 0->20 =3D=
=3D> 4084000.pinctrl PIN 0->20
[    4.253526] gpio gpiochip0: (4201000.gpio): created GPIO range 21->21 =
=3D=3D> 4084000.pinctrl PIN 23->23
[    4.262660] gpio gpiochip0: (4201000.gpio): created GPIO range 22->23 =
=3D=3D> 4084000.pinctrl PIN 32->33
[    4.272162] gpio gpiochip0: (4201000.gpio): added GPIO chardev (254:0)
[    4.279015] gpio gpiochip0: registered GPIOs 512 to 535 on 4201000.gpio
[    4.289182] gpiochip_find_base_unlocked: found new base at 536
[    4.295124] gpio gpiochip1: (600000.gpio): created GPIO range 0->31 =3D=
=3D> f4000.pinctrl PIN 0->31
[    4.303836] gpio gpiochip1: (600000.gpio): created GPIO range 32->69 =3D=
=3D> f4000.pinctrl PIN 33->70
[    4.312710] gpio gpiochip1: (600000.gpio): created GPIO range 70->86 =3D=
=3D> f4000.pinctrl PIN 72->88
[    4.312796] mmc0: SDHCI controller on fa10000.mmc [fa10000.mmc] using AD=
MA 64-bit
[    4.321583] gpiolib_shared: GPIO 7 owned by 600000.gpio is shared by mul=
tiple consumers
[    4.337049] gpiolib_shared: Setting up a shared GPIO entry for regulator=
-5 (con_id: '(none)')
[    4.345868] gpiolib_shared: Created an auxiliary GPIO proxy gpiolib_shar=
ed.proxy.9 for GPIO device 600000.gpio
[    4.355865] gpiolib_shared: Setting up a shared GPIO entry for regulator=
-6 (con_id: 'enable')
[    4.364570] gpiolib_shared: Created an auxiliary GPIO proxy gpiolib_shar=
ed.proxy.10 for GPIO device 600000.gpio
[    4.375011] gpio gpiochip1: (600000.gpio): added GPIO chardev (254:1)
[    4.381881] gpio gpiochip1: registered GPIOs 536 to 622 on 600000.gpio
[    4.388708] mmc0: Command Queue Engine enabled
[    4.393217] mmc0: new HS200 MMC card at address 0001
[    4.398947] gpiochip_find_base_unlocked: found new base at 623
[    4.399898] mmcblk0: mmc0:0001 0IM20F 59.3 GiB
[    4.404893] gpio gpiochip2: (601000.gpio): created GPIO range 7->31 =3D=
=3D> f4000.pinctrl PIN 101->125
[    4.418294] gpio gpiochip2: (601000.gpio): created GPIO range 42->46 =3D=
=3D> f4000.pinctrl PIN 137->141
[    4.419153] GPT:disk_guids don't match.
[    4.427365] gpio gpiochip2: (601000.gpio): created GPIO range 47->49 =3D=
=3D> f4000.pinctrl PIN 143->145
[    4.431185] GPT: Use GNU Parted to correct GPT errors.
[    4.440238] gpio gpiochip2: (601000.gpio): created GPIO range 50->51 =3D=
=3D> f4000.pinctrl PIN 149->150
[    4.445382]  mmcblk0: p1 p2
[    4.454788] gpio gpiochip2: (601000.gpio): added GPIO chardev (254:2)
[    4.458896] mmcblk0boot0: mmc0:0001 0IM20F 31.5 MiB
[    4.463948] gpio gpiochip2: registered GPIOs 623 to 695 on 601000.gpio
[    4.475568] mmcblk0boot1: mmc0:0001 0IM20F 31.5 MiB
[    4.483984] reg-fixed-voltage regulator-5: using DT '/regulator-5' for '=
(default)' GPIO lookup
[    4.485057] reg-fixed-voltage regulator-7: using DT '/regulator-7' for '=
(default)' GPIO lookup
[    4.486253] mmcblk0rpmb: mmc0:0001 0IM20F 4.00 MiB, cha)
[    4.488136] reg-fixed-voltage regulator-10: using DT '/regulator-10' for=
 '(default)' GPIO lookup
[    4.488239] of_get_named_gpiod_flags: parsed 'gpios' property of node '/=
regulator-10[0]' - status (0)
[    4.488277] gpio gpiochip1: Persistence not supported for GPIO 30
[    4.489059] reg-fixed-voltage regulator-11: using DT '/regulator-11' for=
 '(default)' GPIO lookup
[    4.489129] of_get_named_gpiod_flags: parsed 'gpios' property of node '/=
regulator-11[0]' - status (0)
[    4.489165] gpio gpiochip2: Persistence not supported for GPIO 19
[    4.490325] reg-fixed-voltage regulator-12: using DT '/regulator-12' for=
 '(default)' GPIO lookup
[    4.490467] of_get_named_gpiod_flags: parsed 'gpios' property of node '/=
regulator-12[0]' - status (0)
[    4.490508] gpio gpiochip2: Persistence not supported for GPIO 50
[    4.492734] of_get_named_gpiod_flags: parsed 'gpios' property of node '/=
regulator-5[0]' - status (0)
[    4.501302] of_get_named_gpiod_flags: can't parse 'gpios' property of no=
de '/regulator-7[0]'
[    4.507547] gpiolib_shared: Adding machine lookup entry for a shared GPI=
O for consumer regulator-5, with key 'gpiolib_shared.proxy.9' and con_id 'n=
one'
[    4.516336] of_get_named_gpiod_flags: can't parse 'gpio' property of nod=
e '/regulator-7[0]'
[    4.525510] reg-fixed-voltage regulator-5: using lookup tables for GPIO =
lookup
[    4.531592] reg-fixed-voltage regulator-7: using lookup tables for GPIO =
lookup
[    4.540355] reg-fixed-voltage regulator-5: cannot find GPIO chip gpiolib=
_shared.proxy.9, deferring
[    4.568523] gpiochip_find_base_unlocked: found new base at 696
[    4.573600] reg-fixed-voltage regulator-5: No GPIO consumer (default) fo=
und
[    4.573601] reg-fixed-voltage regulator-7: No GPIO consumer (default) fo=
und
[    4.664886] gpiolib_shared: GPIO 4 owned by 2-0044 is shared by multiple=
 consumers
[    4.672471] gpiolib_shared: Setting up a shared GPIO entry for regulator=
-8 (con_id: '(none)')
[    4.681268] gpiolib_shared: Created an auxiliary GPIO proxy gpiolib_shar=
ed.proxy.12 for GPIO device 2-0044
[    4.690927] gpiolib_shared: Setting up a shared GPIO entry for regulator=
-9 (con_id: '(none)')
[    4.699598] gpiolib_shared: Created an auxiliary GPIO proxy gpiolib_shar=
ed.proxy.13 for GPIO device 2-0044
[    4.709601] gpio gpiochip3: (2-0044): added GPIO chardev (254:3)
[    4.715933] gpio gpiochip3: registered GPIOs 696 to 701 on 2-0044
[    4.740727] input: tps6594-pwrbutton as /devices/platform/bus@f0000/2000=
0000.i2c/i2c-2/2-0044/tps6594-pwrbutton.4.auto/input/input0
[    4.755360] reset_gpio reset.gpio.0: using swnode 'node0' for 'reset' GP=
IO lookup
[    4.762877] gpiolib: swnode: swnode_find_gpio: parsed 'reset-gpios' prop=
erty of node 'node0[0]' - status (0)
[    4.772716] gpio gpiochip1: Persistence not supported for GPIO 10
[    4.794592] i2c i2c-3: Added multiplexed i2c bus 5
[    4.799831] i2c i2c-3: Added multiplexed i2c bus 6
[    4.805044] i2c i2c-3: Added multiplexed i2c bus 7
[    4.810252] i2c i2c-3: Added multiplexed i2c bus 8
[    4.815065] pca954x 3-0070: registered 4 multiplexed busses for I2C swit=
ch pca9546
[    4.824283] i2c i2c-9: using DT '/bus@f0000/i2c@fe80000' for 'scl' GPIO =
lookup
[    4.831611] of_get_named_gpiod_flags: can't parse 'scl-gpios' property o=
f node '/bus@f0000/i2c@fe80000[0]'
[    4.841296] of_get_named_gpiod_flags: can't parse 'scl-gpio' property of=
 node '/bus@f0000/i2c@fe80000[0]'
[    4.850862] i2c i2c-9: using lookup tables for GPIO lookup
[    4.856343] i2c i2c-9: No GPIO consumer scl found
[    4.861058] i2c i2c-9: using DT '/bus@f0000/i2c@fe80000' for 'sda' GPIO =
lookup
[    4.868309] of_get_named_gpiod_flags: can't parse 'sda-gpios' property o=
f node '/bus@f0000/i2c@fe80000[0]'
[    4.877985] of_get_named_gpiod_flags: can't parse 'sda-gpio' property of=
 node '/bus@f0000/i2c@fe80000[0]'
[    4.887547] i2c i2c-9: using lookup tables for GPIO lookup
[    4.893027] i2c i2c-9: No GPIO consumer sda found
[    4.897760] omap_i2c fe80000.i2c: bus 9 rev0.12 at 100 kHz
[    4.909299] j721e-pcie f102000.pcie: host bridge /bus@f0000/pcie@f102000=
 ranges:
[    4.916763] j721e-pcie f102000.pcie:       IO 0x0600001000..0x0600100fff=
 -> 0x0000001000
[    4.924880] j721e-pcie f102000.pcie:      MEM 0x0600101000..0x06ffffffff=
 -> 0x0000101000
[    4.932986] j721e-pcie f102000.pcie:   IB MEM 0x0000000000..0xffffffffff=
ff -> 0x0000000000
[    4.942029] j721e-pcie f102000.pcie: using DT '/bus@f0000/pcie@f102000' =
for 'reset' GPIO lookup
[    4.950796] of_get_named_gpiod_flags: parsed 'reset-gpios' property of n=
ode '/bus@f0000/pcie@f102000[0]' - status (0)
[    4.961424] gpio gpiochip2: Persistence not supported for GPIO 15
[    6.074781] j721e-pcie f102000.pcie: PCI host bridge to bus 0000:00
[    6.081127] pci_bus 0000:00: root bus resource [bus 00-ff]
[    6.086620] pci_bus 0000:00: root bus resource [io  0x0000-0xfffff] (bus=
 address [0x1000-0x100fff])
[    6.095663] pci_bus 0000:00: root bus resource [mem 0x600101000-0x6fffff=
fff] (bus address [0x00101000-0xffffffff])
[    6.106051] pci 0000:00:00.0: [104c:b010] type 01 class 0x060400 PCIe Ro=
ot Port
[    6.113368] pci 0000:00:00.0: PCI bridge to [bus 00]
[    6.118330] pci 0000:00:00.0:   bridge window [io  0x0000-0x0fff]
[    6.124418] pci 0000:00:00.0:   bridge window [mem 0x00000000-0x000fffff=
]
[    6.131202] pci 0000:00:00.0:   bridge window [mem 0x00000000-0x000fffff=
 64bit pref]
[    6.138996] pci 0000:00:00.0: supports D1
[    6.143004] pci 0000:00:00.0: PME# supported from D0 D1 D3hot
[    6.151499] pci 0000:00:00.0: bridge configuration invalid ([bus 00-00])=
, reconfiguring
[    6.159819] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
[    6.166465] pci 0000:00:00.0: PCI bridge to [bus 01]
[    6.171432] pci_bus 0000:00: resource 4 [io  0x0000-0xfffff]
[    6.177086] pci_bus 0000:00: resource 5 [mem 0x600101000-0x6ffffffff]
[    6.183778] irq: no irq domain found for interrupt-controller !
[    6.190653] pcieport 0000:00:00.0: PME: Signaling with IRQ 517
[    6.197077] pcieport 0000:00:00.0: AER: enabled with IRQ 517
[    6.204192] display-connector connector-2: using DT '/connector-2' for '=
hpd' GPIO lookup
[    6.212423] display-connector connector-2: No GPIO consumer hpd found
[    6.224711] spi-nor spi0.0: using DT '/bus@f0000/bus@fc00000/spi@fc40000=
/flash@0' for 'reset' GPIO lookup
[    6.234423] of_get_named_gpiod_flags: can't parse 'reset-gpios' property=
 of node '/bus@f0000/bus@fc00000/spi@fc40000/flash@0[0]'
[    6.246015] of_get_named_gpiod_flags: can't parse 'reset-gpio' property =
of node '/bus@f0000/bus@fc00000/spi@fc40000/flash@0[0]'
[    6.257495] spi-nor spi0.0: using lookup tables for GPIO lookup
[    6.263413] spi-nor spi0.0: No GPIO consumer reset found
[    6.273675] 1 fixed-partitions partitions found on MTD device fc40000.sp=
i.0
[    6.280682] Creating 1 MTD partitions on "fc40000.spi.0":
[    6.286096] 0x000000000000-0x000000400000 : "failsafe bootloader"
[    6.296512] am65-cpsw-nuss 8000000.ethernet: initializing am65 cpsw nuss=
 version 0x6BA01903, cpsw version 0x6BA81903 Ports: 3 quirks:00000002
[    6.312449] mdio_bus 8000f00.mdio: using DT '/bus@f0000/ethernet@8000000=
/mdio@f00' for 'reset' GPIO lookup
[    6.322176] of_get_named_gpiod_flags: can't parse 'reset-gpios' property=
 of node '/bus@f0000/ethernet@8000000/mdio@f00[0]'
[    6.333238] of_get_named_gpiod_flags: can't parse 'reset-gpio' property =
of node '/bus@f0000/ethernet@8000000/mdio@f00[0]'
[    6.344185] mdio_bus 8000f00.mdio: using lookup tables for GPIO lookup
[    6.350705] mdio_bus 8000f00.mdio: No GPIO consumer reset found
[    6.389788] davinci_mdio 8000f00.mdio: davinci mdio revision 17.7, bus f=
req 1000000
[    6.398297] mdio_bus 8000f00.mdio:00: using DT '/bus@f0000/ethernet@8000=
000/mdio@f00/ethernet-phy@0' for 'reset' GPIO lookup
[    6.409562] of_get_named_gpiod_flags: can't parse 'reset-gpios' property=
 of node '/bus@f0000/ethernet@8000000/mdio@f00/ethernet-phy@0[0]'
[    6.421922] of_get_named_gpiod_flags: can't parse 'reset-gpio' property =
of node '/bus@f0000/ethernet@8000000/mdio@f00/ethernet-phy@0[0]'
[    6.434169] mdio_bus 8000f00.mdio:00: using lookup tables for GPIO looku=
p
[    6.440950] mdio_bus 8000f00.mdio:00: No GPIO consumer reset found
[    6.448190] Broadcom BCM54210E 8000f00.mdio:00: using DT '/bus@f0000/eth=
ernet@8000000/mdio@f00/ethernet-phy@0' for 'wakeup' GPIO lookup
[    6.460417] of_get_named_gpiod_flags: can't parse 'wakeup-gpios' propert=
y of node '/bus@f0000/ethernet@8000000/mdio@f00/ethernet-phy@0[0]'
[    6.472869] of_get_named_gpiod_flags: can't parse 'wakeup-gpio' property=
 of node '/bus@f0000/ethernet@8000000/mdio@f00/ethernet-phy@0[0]'
[    6.485210] Broadcom BCM54210E 8000f00.mdio:00: using lookup tables for =
GPIO lookup
[    6.492856] Broadcom BCM54210E 8000f00.mdio:00: No GPIO consumer wakeup =
found
[    6.503636] mdio_bus 8000f00.mdio:01: using DT '/bus@f0000/ethernet@8000=
000/mdio@f00/ethernet-phy@1' for 'reset' GPIO lookup
[    6.514903] of_get_named_gpiod_flags: can't parse 'reset-gpios' property=
 of node '/bus@f0000/ethernet@8000000/mdio@f00/ethernet-phy@1[0]'
[    6.527265] of_get_named_gpiod_flags: can't parse 'reset-gpio' property =
of node '/bus@f0000/ethernet@8000000/mdio@f00/ethernet-phy@1[0]'
[    6.539511] mdio_bus 8000f00.mdio:01: using lookup tables for GPIO looku=
p
[    6.546291] mdio_bus 8000f00.mdio:01: No GPIO consumer reset found
[    6.553426] Broadcom BCM54210E 8000f00.mdio:01: using DT '/bus@f0000/eth=
ernet@8000000/mdio@f00/ethernet-phy@1' for 'wakeup' GPIO lookup
[    6.565653] of_get_named_gpiod_flags: can't parse 'wakeup-gpios' propert=
y of node '/bus@f0000/ethernet@8000000/mdio@f00/ethernet-phy@1[0]'
[    6.578107] of_get_named_gpiod_flags: can't parse 'wakeup-gpio' property=
 of node '/bus@f0000/ethernet@8000000/mdio@f00/ethernet-phy@1[0]'
[    6.590443] Broadcom BCM54210E 8000f00.mdio:01: using lookup tables for =
GPIO lookup
[    6.598090] Broadcom BCM54210E 8000f00.mdio:01: No GPIO consumer wakeup =
found
[    6.607977] davinci_mdio 8000f00.mdio: phy[0]: device 8000f00.mdio:00, d=
river Broadcom BCM54210E
[    6.616762] davinci_mdio 8000f00.mdio: phy[1]: device 8000f00.mdio:01, d=
river Broadcom BCM54210E
[    6.625920] am65-cpsw-nuss 8000000.ethernet: initialized cpsw ale versio=
n 1.5
[    6.633051] am65-cpsw-nuss 8000000.ethernet: ALE Table size 512, Policer=
s 32
[    6.641451] am65-cpsw-nuss 8000000.ethernet: CPTS ver 0x4e8a010d, freq:5=
00000000, add_val:1 pps:0
[    6.663945] am65-cpsw-nuss 8000000.ethernet: set new flow-id-base 19
[    6.679378] usb-conn-gpio connector-1: using DT '/connector-1' for 'id' =
GPIO lookup
[    6.687125] of_get_named_gpiod_flags: parsed 'id-gpios' property of node=
 '/connector-1[0]' - status (0)
[    6.696538] gpio gpiochip1: Persistence not supported for GPIO 34
[    6.702638] usb-conn-gpio connector-1: using DT '/connector-1' for 'vbus=
' GPIO lookup
[    6.710493] of_get_named_gpiod_flags: can't parse 'vbus-gpios' property =
of node '/connector-1[0]'
[    6.719385] of_get_named_gpiod_flags: can't parse 'vbus-gpio' property o=
f node '/connector-1[0]'
[    6.728168] usb-conn-gpio connector-1: using lookup tables for GPIO look=
up
[    6.735042] usb-conn-gpio connector-1: No GPIO consumer vbus found
[    6.748242] xhci-hcd xhci-hcd.5.auto: xHCI Host Controller
[    6.753819] xhci-hcd xhci-hcd.5.auto: new USB bus registered, assigned b=
us number 1
[    6.763957] xhci-hcd xhci-hcd.5.auto: hcc params 0x200073c9 hci version =
0x100 quirks 0x0000002000008010
[    6.773440] xhci-hcd xhci-hcd.5.auto: irq 519, io mem 0x31210000
[    6.779812] xhci-hcd xhci-hcd.5.auto: xHCI Host Controller
[    6.785318] xhci-hcd xhci-hcd.5.auto: new USB bus registered, assigned b=
us number 2
[    6.793000] xhci-hcd xhci-hcd.5.auto: Host supports USB 3.0 SuperSpeed
[    6.801056] hub 1-0:1.0: USB hub found
[    6.804903] hub 1-0:1.0: 1 port detected
[    6.809613] usb usb2: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    6.818937] hub 2-0:1.0: USB hub found
[    6.822763] hub 2-0:1.0: 1 port detected
[    6.828806] gpiolib_shared: Device gpiolib_shared.proxy.9 acquired a ref=
erence to the shared GPIO 7 owned by 600000.gpio
[    6.839806] gpiochip_find_base_unlocked: found new base at 702
[    6.846199] gpio_stub_drv gpiochip4: (gpiolib_shared.proxy.9): added GPI=
O chardev (254:4)
[    6.854699] gpio_stub_drv gpiochip4: registered GPIOs 702 to 702 on gpio=
lib_shared.proxy.9
[    6.863086] gpiolib_shared: Device gpiolib_shared.proxy.10 acquired a re=
ference to the shared GPIO 7 owned by 600000.gpio
[    6.874130] gpiochip_find_base_unlocked: found new base at 703
[    6.880340] gpio_stub_drv gpiochip5: (gpiolib_shared.proxy.10): added GP=
IO chardev (254:5)
[    6.888902] gpio_stub_drv gpiochip5: registered GPIOs 703 to 703 on gpio=
lib_shared.proxy.10
[    6.898723] reg-fixed-voltage regulator-4: using DT '/regulator-4' for '=
(default)' GPIO lookup
[    6.899660] reg-fixed-voltage regulator-8: using DT '/regulator-8' for '=
(default)' GPIO lookup
[    6.900542] reg-fixed-voltage regulator-9: using DT '/regulator-9' for '=
(default)' GPIO lookup
[    6.900615] of_get_named_gpiod_flags: parsed 'gpios' property of node '/=
regulator-9[0]' - status (0)
[    6.900643] gpiolib_shared: Adding machine lookup entry for a shared GPI=
O for consumer regulator-9, with key 'gpiolib_shared.proxy.13' and con_id '=
none'
[    6.900650] reg-fixed-voltage regulator-9: using lookup tables for GPIO =
lookup
[    6.900662] reg-fixed-voltage regulator-9: cannot find GPIO chip gpiolib=
_shared.proxy.13, deferring
[    6.900667] reg-fixed-voltage regulator-9: No GPIO consumer (default) fo=
und
[    6.907439] of_get_named_gpiod_flags: parsed 'gpios' property of node '/=
regulator-4[0]' - status (0)
[    6.914348] at24 0-0050: using DT '/bus@f0000/bus@4000000/i2c@4900000/ee=
prom@50' for 'wp' GPIO lookup
[    6.914399] of_get_named_gpiod_flags: can't parse 'wp-gpios' property of=
 node '/bus@f0000/bus@4000000/i2c@4900000/eeprom@50[0]'
[    6.914438] of_get_named_gpiod_flags: can't parse 'wp-gpio' property of =
node '/bus@f0000/bus@4000000/i2c@4900000/eeprom@50[0]'
[    6.914452] at24 0-0050: using lookup tables for GPIO lookup
[    6.914457] at24 0-0050: No GPIO consumer wp found
[    6.914694] at24 0-0050: 4096 byte 24c32 EEPROM, writable, 32 bytes/writ=
e
[    6.915229] ti_sn65dsi86 2-002c: using DT '/bus@f0000/i2c@20000000/bridg=
e@2c' for 'enable' GPIO lookup
[    6.915289] of_get_named_gpiod_flags: parsed 'enable-gpios' property of =
node '/bus@f0000/i2c@20000000/bridge@2c[0]' - status (0)
[    6.915323] gpio gpiochip1: Persistence not supported for GPIO 37
[    6.916030] of_get_named_gpiod_flags: parsed 'gpios' property of node '/=
regulator-8[0]' - status (0)
[    6.922037] gpiochip_find_base_unlocked: found new base at 704
[    6.922058] gpio gpiochip6: Detected name collision for GPIO name 'GPIO1=
'
[    6.922069] gpio gpiochip6: Detected name collision for GPIO name 'GPIO2=
'
[    6.922076] gpio gpiochip6: Detected name collision for GPIO name 'GPIO3=
'
[    6.922083] gpio gpiochip6: Detected name collision for GPIO name 'GPIO4=
'
[    6.922467] gpio gpiochip6: (2-002c): added GPIO chardev (254:6)
[    6.922784] gpio gpiochip6: registered GPIOs 704 to 707 on 2-002c
[    6.925117] gpio gpiochip3: Persistence not supported for GPIO 1
[    6.926293] gpiolib_shared: Device gpiolib_shared.proxy.12 acquired a re=
ference to the shared GPIO 4 owned by 2-0044
[    6.926400] gpiochip_find_base_unlocked: found new base at 708
[    6.926477] reg-fixed-voltage regulator-5: using DT '/regulator-5' for '=
(default)' GPIO lookup
[    6.926536] of_get_named_gpiod_flags: parsed 'gpios' property of node '/=
regulator-5[0]' - status (0)
[    6.926550] reg-fixed-voltage regulator-5: using lookup tables for GPIO =
lookup
[    6.926564] gpio_shared_proxy gpiolib_shared.proxy.9: Shared GPIO reques=
ted, number of users: 1
[    6.926582] gpio_shared_proxy gpiolib_shared.proxy.9: Only one user of t=
his shared GPIO, allowing to set direction to output with value 'high'
[    6.926636] gpio_shared_proxy gpiolib_shared.proxy.9: Voted for value 'h=
igh', effective value is 'high', number of votes for 'high': 1
[    6.927871] gpio_stub_drv gpiochip7: (gpiolib_shared.proxy.12): added GP=
IO chardev (254:7)
[    6.928177] gpio_stub_drv gpiochip7: registered GPIOs 708 to 708 on gpio=
lib_shared.proxy.12
[    6.928289] gpiolib_shared: Device gpiolib_shared.proxy.13 acquired a re=
ference to the shared GPIO 4 owned by 2-0044
[    6.928362] gpiochip_find_base_unlocked: found new base at 709
[    6.929154] gpio_stub_drv gpiochip8: (gpiolib_shared.proxy.13): added GP=
IO chardev (254:8)
[    6.929433] gpio_stub_drv gpiochip8: registered GPIOs 709 to 709 on gpio=
lib_shared.proxy.13
[    6.930252] display-connector connector-2: using DT '/connector-2' for '=
hpd' GPIO lookup
[    6.930355] of_get_named_gpiod_flags: parsed 'hpd-gpios' property of nod=
e '/connector-2[0]' - status (0)
[    6.930380] gpio gpiochip6: Persistence not supported for GPIO 1
[    6.933765] gpiolib_shared: Adding machine lookup entry for a shared GPI=
O for consumer regulator-8, with key 'gpiolib_shared.proxy.12' and con_id '=
none'
[    6.936865] reg-fixed-voltage regulator-9: using DT '/regulator-9' for '=
(default)' GPIO lookup
[    6.936934] of_get_named_gpiod_flags: parsed 'gpios' property of node '/=
regulator-9[0]' - status (0)
[    6.942048] [drm] Missing drm_bridge_add() before attach
[    6.945238] [drm] Initialized tidss 1.0.0 for 30220000.dss on minor 1
[    6.945918] tidss 30220000.dss: [drm] Cannot find any crtc or sizes
[    6.949586] tidss 30220000.dss: [drm] Cannot find any crtc or sizes
[    6.952296] cfg80211: Loading compiled-in X.509 certificates for regulat=
ory database
[    6.954677] reg-fixed-voltage regulator-8: using lookup tables for GPIO =
lookup
[    6.955122] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    6.955839] gpio-regulator regulator-6: using DT '/regulator-6' for '(de=
fault)' GPIO lookup
[    6.955964] of_get_named_gpiod_flags: parsed 'gpios' property of node '/=
regulator-6[0]' - status (0)
[    6.956003] gpio gpiochip1: Persistence not supported for GPIO 8
[    6.956041] gpio-regulator regulator-6: using DT '/regulator-6' for 'ena=
ble' GPIO lookup
[    6.956097] regulator-6 enforce active low on GPIO handle
[    6.956101] of_get_named_gpiod_flags: parsed 'enable-gpios' property of =
node '/regulator-6[0]' - status (0)
[    6.956124] gpiolib_shared: Adding machine lookup entry for a shared GPI=
O for consumer regulator-6, with key 'gpiolib_shared.proxy.10' and con_id '=
enable'
[    6.956130] gpio-regulator regulator-6: using lookup tables for GPIO loo=
kup
[    6.956145] gpio_shared_proxy gpiolib_shared.proxy.10: Shared GPIO reque=
sted, number of users: 2
[    6.956159] gpio_shared_proxy gpiolib_shared.proxy.10: Shared GPIO's con=
figuration already set, accepting changes but users may conflict!!
[    6.956164] gpio_shared_proxy gpiolib_shared.proxy.10: Shared GPIO's con=
figuration already set, accepting changes but users may conflict!!
[    6.956172] gpio_shared_proxy gpiolib_shared.proxy.10: Shared GPIO freed=
, number of users: 1
[    6.956182] gpio-regulator regulator-6: setup of GPIO enable failed: -52=
4
[    6.956188] gpio-regulator regulator-6: probe with driver gpio-regulator=
 failed with error -524
[    6.956963] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db1=
8c600'
[    6.957168] clk: Disabling unused clocks
[    6.957543] faux_driver regulatory: Direct firmware load for regulatory.=
db failed with error -2
[    6.957552] faux_driver regulatory: Falling back to sysfs fallback for: =
regulatory.db
[    6.957862] reg-fixed-voltage regulator-9: using lookup tables for GPIO =
lookup
[    6.957889] gpio_shared_proxy gpiolib_shared.proxy.13: Shared GPIO reque=
sted, number of users: 1
[    6.958373] gpio_shared_proxy gpiolib_shared.proxy.13: Only one user of =
this shared GPIO, allowing to set direction to output with value 'high'
[    6.959438] gpio_shared_proxy gpiolib_shared.proxy.13: Voted for value '=
high', effective value is 'high', number of votes for 'high': 1
[    6.964480] PM: genpd: Disabling unused power domains
[    6.970699] gpio_shared_proxy gpiolib_shared.proxy.12: Shared GPIO reque=
sted, number of users: 2
[    6.980105] ALSA device list:
[    7.081795] usb 1-1: new high-speed USB device number 2 using xhci-hcd
[    7.084455]   No soundcards found.
[    7.327694] hub 1-1:1.0: USB hub found
[    7.335021] gpio_shared_proxy gpiolib_shared.proxy.12: Shared GPIO's con=
figuration already set, accepting changes but users may conflict!!
[    7.340302] hub 1-1:1.0: 5 ports detected
[    7.348542] gpio_shared_proxy gpiolib_shared.proxy.12: Shared GPIO's con=
figuration already set, accepting changes but users may conflict!!
[    7.401868] usb 2-1: new SuperSpeed USB device number 2 using xhci-hcd
[    7.408066] gpio_shared_proxy gpiolib_shared.proxy.12: Voted for value '=
high', effective value is 'high', number of votes for 'high': 2
[    7.522493] hub 2-1:1.0: USB hub found
[    7.534907] gpio_shared_proxy gpiolib_shared.proxy.12: Voted for value '=
high', effective value is 'high', number of votes for 'high': 2
[    7.548157] hub 2-1:1.0: 4 ports detected
[    7.632519] check access for rdinit=3D/init failed: -2, ignoring
[    7.655629] EXT4-fs (mmcblk0p2): INFO: recovery required on readonly fil=
esystem
[    7.662988] EXT4-fs (mmcblk0p2): write access will be enabled during rec=
overy
[    7.681850] usb 1-1.2: new low-speed USB device number 3 using xhci-hcd
[    7.784486] input: USB Optical Mouse as /devices/platform/bus@f0000/f920=
000.usb/31200000.usb/xhci-hcd.5.auto/usb1/1-1/1-1.2/1-1.2:1.0/0003:0461:4D1=
5.0001/input/input1
[    7.799726] hid-generic 0003:0461:4D15.0001: input: USB HID v1.11 Mouse =
[USB Optical Mouse] on usb-xhci-hcd.5.auto-1.2/input0
[    7.879645] EXT4-fs (mmcblk0p2): orphan cleanup on readonly fs
[    7.885583] EXT4-fs (mmcblk0p2): recovery complete
[    7.893223] EXT4-fs (mmcblk0p2): mounted filesystem 774529dc-27b5-495c-9=
2be-d44ee2dbd68d ro with ordered data mode. Quota mode: none.
[    7.905355] VFS: Mounted root (ext4 filesystem) readonly on device 179:2=
.
[    7.913045] devtmpfs: mounted
[    7.935418] Freeing unused kernel memory: 3200K
[    7.940162] Run /sbin/init as init process

--f00b356cb3331133018261489f9a1da90393783d74a4def4af50c08f9bc9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaWETkhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jFgQF8CCYbNNwVSJJ2fw1LM6a36amyW+gh1kcz
gskifnp66Y8WcmhZRJaOBQMrO1bx2aUoAX9CVLZUrDnuYhCEO4D/oXISa+r/Z+ma
ZJKm1D8f86d0w3ZK2P7vlMvP7jSSj+W4YmM=
=AuaF
-----END PGP SIGNATURE-----

--f00b356cb3331133018261489f9a1da90393783d74a4def4af50c08f9bc9--

