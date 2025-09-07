Return-Path: <linux-gpio+bounces-25713-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AAEB47C6A
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Sep 2025 18:25:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B90E17B68C
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Sep 2025 16:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F7CC283FD4;
	Sun,  7 Sep 2025 16:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I8TAd9MA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931C523741;
	Sun,  7 Sep 2025 16:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757262298; cv=none; b=fOx0as+wYNZluc4ZJ9A0HlPtfEFZ/2Voax9PuFMPJE9q/SytYVPS+4Jr3HauBYKh9sK4av1iHvi2gxjBGc1Gf4scB3akAUaj+2ZKZlsJgI2srnvw0PUEfJnEhwSRm/UFDS3fq94athGIW6OcHAlOceEMk19GRGrNJRiLgmg7Cpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757262298; c=relaxed/simple;
	bh=a2dhqNEk31F+J5WSKULD6uJJzKpz59A7i8RdXkq2MGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KtyMcuptyTdRMY4rW9uccsWJprLZ7Ul9MHg+mUxUqTKyhL7srdgIe16lVoKT/F8ukid0rCnxNLXH48xEqhmCoZjxGO8Fp9MjCZ5ek4N2uL4h6pDH9yCCyEVNftOa91o+5gTL6fw99XTnf1UyLF2Y2Ez0Fgqd1xtg+S8j6fRasw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I8TAd9MA; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-621b8b0893bso3550210a12.2;
        Sun, 07 Sep 2025 09:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757262295; x=1757867095; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EiRNyzOe298r/AZQWMjcltwwDXu8VvyeRKjL05VJt+k=;
        b=I8TAd9MAfDjl9/sIqgmV4wlDE4EXT1OHvadRFHou8Ol9yFl54k2HrN0eNV3a1xqc6e
         hI9W5dfplf4IGrgCs0OrHQqXnToc1OdZI8tjPJA+Tt/QjwsmPl9bXFAMbQTRzWxHhbIm
         pvLEd+dTCWnSZa8Hyl/Ng0fNmGN8t/w68XmkCJoYE3Z/l45SiaThKZUaed4a93b6EfjR
         MWKnY+muG/r4PRnjPDkKDfQqO4+wzDZ35HZKYnbWyvHqCwMoUNPrMiEPh9P01LiCGg+W
         dugYuKDoMS1hr3jbN13P/pIvUj54Sw88D64b4PvOXJ/gVbyHoUHffiqxfOrc3BaFtS/m
         7T8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757262295; x=1757867095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EiRNyzOe298r/AZQWMjcltwwDXu8VvyeRKjL05VJt+k=;
        b=qkNhuF0tv0FCSVKcmQ0sMFOx317fylo3G3yBdhjUIQw+o408RozBcBV4+j+mCU/U84
         yZEmPd86FA9TX6eU/fCG1CtsQFMg1q64KGExl9bH7RsJgGm0h3Q4XUP1TEdXSPDgkls3
         59c9KW3+GarZ43zX4lXFDOlndldlQC45nP13NgGBh7kCK14dBYxSO4Yslj+n+73f8eYi
         XOK9DBy0j7Z2RH/LGj/hvrewJ3JA5VhhXJF9JgvURoKiwyWFIzrjLqTc3C7GR73vpB1N
         EXMvtlae0maCi0Bi7GLczPVw7h+MNQ+4K774CdxzQOGxEh14svW53EK8k2JUXBS+sBhM
         72cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjawr3SwnKnv3D7i67zAtsa+/uhSCoYU1QrxuR9DlZQaSCZdKjx+wcJBLlnHQstRjsmK3vj6f1Rp8o/g==@vger.kernel.org, AJvYcCXb/IVfo7IJ5QzLf10vtj6NXWjTA2kj8lI9N6h59vfo8VyQwrM+KkztTmzsoFkJQW3xpd5tkm0Fe2kH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz34BZMDAir9CqgzGobF6mOo6d5gNmZ2Kdxq8kHt4GtA3JFOA4h
	F9FB9ycA4Sg9SlLVGqwhlxDJqL7hlLcyuIdVMvA9VlhekgS0lb5v5AbbOZ8xqixvYB99sBAvZh/
	0rlzPMmRmu6/hpdOFJr+N8PNhhWmcblE=
X-Gm-Gg: ASbGncu6IxCxfn+TvBUVuC3fMkP/K+KEpj1+pXVGDLuMXECubJhU/lhF72/WuL2Jz+E
	NDe8TpFWwHs6psdUeLYDWE3id5rht1mylRJ0jeR7j5nZ7UVNtxzoUmsgbx3+QUYK2AHWyeuwTDZ
	EjFZeHT17hcslWrKHj0sbTVD0Jn0IA1UvcWrMEoGH9neIUSXyigNW72lZFSabXUm/2+IRDdo0tW
	VX5DCXYyY6llsL+mJLnAzZr6qy8Nq7+0gs=
X-Google-Smtp-Source: AGHT+IEUh6UJBSIy7uo4UeXfaJOjmOBfvt+baz+Zj/IM1FZe0WwfnCLd6E2TEKnFs8F+Okrwc8Mjvj/w45twhB1XxLk=
X-Received: by 2002:a05:6402:2344:b0:61c:8114:8832 with SMTP id
 4fb4d7f45d1cf-6237c32cb64mr5651148a12.16.1757262294701; Sun, 07 Sep 2025
 09:24:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1756372805.git.andrea.porta@suse.com> <bee7c98a96c7000db32495b94ebae2ea06fe0e77.1756372805.git.andrea.porta@suse.com>
 <CACRpkdY82ohgX_7YP16DJrzDvxMHcSu3rW+UtEmrP0AQiD_Exg@mail.gmail.com> <aLqg4ZTbUjsgoMwy@apocalypse>
In-Reply-To: <aLqg4ZTbUjsgoMwy@apocalypse>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Sun, 7 Sep 2025 17:24:43 +0100
X-Gm-Features: AS18NWBwzsJHe_6E2dyS_2mGziKRRgdiIeyrYys7qDjqxQdP84-pkGK82KYLoRs
Message-ID: <CALeDE9O-CxmHUb2sOauyMbNtPftQnqcGchpp-VrD=Ju=QPS4jw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] pinctrl: bcm: Add STB family pin controller driver
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, florian.fainelli@broadcom.com, wahrenst@gmx.net, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, iivanov@suse.de, 
	svarbanov@suse.de, mbrugger@suse.com, 
	Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Andrea,

> On 21:06 Thu 04 Sep     , Linus Walleij wrote:
> > On Thu, Aug 28, 2025 at 2:45=E2=80=AFPM Andrea della Porta
> > <andrea.porta@suse.com> wrote:
> >
> > > From: "Ivan T. Ivanov" <iivanov@suse.de>
> > >
> > > This driver provide pin muxing and configuration functionality
> > > for BCM2712 SoC used by RPi5. According to [1] this chip is an
> > > instance of the one used in Broadcom STB  product line.
> > >
> > > [1] https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3=
@broadcom.com/
> > >
> > > Cc: Jonathan Bell <jonathan@raspberrypi.com>
> > > Cc: Phil Elwell <phil@raspberrypi.com>
> > > Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> > > Reviewed-by: Phil Elwell <phil@raspberrypi.com>
> > > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> >
> > Patch applied!
> >
> > > +config PINCTRL_BRCMSTB
> > > +        tristate "Broadcom STB product line pin controller driver"
> > > +        depends on OF && (ARCH_BRCMSTB || COMPILE_TEST)
> >
> > I changed this to (ARCH_BCM2835 || ARCH_BRCMSTB || COMPILE_TEST)
> > because Peter Robinson told me the Pi5 needs this driver too.
> > See commit 1d99f92f71b6b4b2eee776562c991428490f71ef for details.
>
> Indeed, thanks for spotting this!

I've been testing this, and other associated patches, with Fedora
(feel free to cc: me on any patches too) and I'm seeing the following
crash on the 2Gb model, someone else reported to me they see it on
their 16gb, I'm assuming there's some issue/nuance in the d0 rev of
the SoC that causes issues. Wondering if you've done any testing with
the newer SoC rev or know of any issues there?

Peter

[   56.289183] SError Interrupt on CPU3, code 0x00000000be000011 -- SError
[   56.289194] CPU: 3 UID: 0 PID: 341 Comm: (udev-worker) Tainted: G
M               ------  ---  6.17.0-0.rc4.36.pr3.fc43.aarch64 #1
PREEMPT(voluntary)
[   56.289200] Tainted: [M]=3DMACHINE_CHECK
[   56.289201] Hardware name: raspberrypi Raspberry Pi 5 Model B Rev
1.0/Raspberry Pi 5 Model B Rev 1.0, BIOS 2025.04 04/01/2025
[   56.289204] pstate: 804000c9 (Nzcv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[   56.289208] pc : brcmstb_pull_config_set+0x5c/0xd8
[   56.289216] lr : brcmstb_pull_config_set+0x44/0xd8
[   56.289220] sp : ffff800080663500
[   56.289221] x29: ffff800080663500 x28: ffffbcba6aaab480 x27: 00000000000=
00370
[   56.289227] x26: 0000ffffa9554298 x25: ffffbcbad6ad2360 x24: ffff0000007=
76240
[   56.289231] x23: ffff0000011352b8 x22: ffff000002a16080 x21: 00000000000=
00014
[   56.289235] x20: 0000000000000118 x19: ffff000002a16080 x18: 00000000fff=
ffffc
[   56.289239] x17: ffff0000010f1180 x16: ffffbcbad419c418 x15: 00000000000=
0000a
[   56.289243] x14: ffffffffffffffff x13: 0000000000000001 x12: 00000000000=
00000
[   56.289247] x11: 0000000000000040 x10: 0000000000000000 x9 : ffffbcbad3d=
da6d4
[   56.289251] x8 : 0000000000000014 x7 : 0000000000000000 x6 : ffffbcbad3d=
da768
[   56.289254] x5 : ffff00000204f480 x4 : 0000000000000020 x3 : 00000000000=
00000
[   56.289258] x2 : 0000000000000001 x1 : 0000000000000000 x0 : 00000000000=
00000
[   56.289262] Kernel panic - not syncing: Asynchronous SError Interrupt
[   56.422659] CPU: 3 UID: 0 PID: 341 Comm: (udev-worker) Tainted: G
M               ------  ---  6.17.0-0.rc4.36.pr3.fc43.aarch64 #1
PREEMPT(voluntary)
[   56.436367] Tainted: [M]=3DMACHINE_CHECK
[   56.440123] Hardware name: raspberrypi Raspberry Pi 5 Model B Rev
1.0/Raspberry Pi 5 Model B Rev 1.0, BIOS 2025.04 04/01/2025
[   56.451472] Call trace:
[   56.453919]  show_stack+0x30/0x90 (C)
[   56.457595]  dump_stack_lvl+0x7c/0xa0
[   56.461268]  dump_stack+0x18/0x2c
[   56.464590]  vpanic+0x140/0x338
[   56.467737]  panic+0x68/0x70
[   56.470622]  nmi_panic+0x90/0xa0
[   56.473859]  arm64_serror_panic+0x78/0x90
[   56.477878]  arm64_is_fatal_ras_serror+0x90/0x98
[   56.482509]  do_serror+0x38/0x60
[   56.485742]  el1h_64_error_handler+0x38/0x60
[   56.490026]  el1h_64_error+0x84/0x88
[   56.493609]  brcmstb_pull_config_set+0x5c/0xd8 (P)
[   56.498416]  brcmstb_pinconf_set+0xbc/0xe8
[   56.502523]  pinconf_apply_setting+0xc4/0x148
[   56.506893]  pinctrl_commit_state+0x124/0x240
[   56.511262]  pinctrl_select_state+0x24/0x40
[   56.515456]  pinctrl_bind_pins+0x1ec/0x280
[   56.519565]  really_probe+0x60/0x3a0
[   56.523150]  __driver_probe_device+0x84/0x160
[   56.527520]  driver_probe_device+0x48/0x130
[   56.531716]  __driver_attach+0xd0/0x1f8
[   56.535560]  bus_for_each_dev+0x84/0x100
[   56.539494]  driver_attach+0x2c/0x40
[   56.543078]  bus_add_driver+0x158/0x280
[   56.546924]  driver_register+0x70/0x138
[   56.550769]  __platform_driver_register+0x28/0x40
[   56.555487]  gpio_keys_init+0x28/0xff8 [gpio_keys]
[   56.560296]  do_one_initcall+0x5c/0x318
[   56.564143]  do_init_module+0x9c/0x2b8
[   56.567903]  load_module+0x7e0/0x998
[   56.571486]  init_module_from_file+0x90/0xf0
[   56.575769]  __arm64_sys_finit_module+0x270/0x380
[   56.580488]  invoke_syscall.constprop.0+0x64/0xe8
[   56.585208]  el0_svc_common.constprop.0+0xc0/0xe8
[   56.589927]  do_el0_svc+0x24/0x38
[   56.593250]  el0_svc+0x3c/0x168
[   56.596398]  el0t_64_sync_handler+0xa0/0xf0
[   56.600593]  el0t_64_sync+0x1b0/0x1b8
[   56.604264] SMP: stopping secondary CPUs
[   56.608198] Kernel Offset: 0x3cba532a0000 from 0xffff800080000000
[   56.614310] PHYS_OFFSET: 0x0
[   56.617194] CPU features: 0x080000,00017000,24023140,0401720b
[   56.622958] Memory Limit: none
[   56.626147] ---[ end Kernel panic - not syncing: Asynchronous
SError Interrupt ]---

