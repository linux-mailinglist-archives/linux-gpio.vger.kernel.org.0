Return-Path: <linux-gpio+bounces-25728-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A275B48675
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 10:18:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC0E91633BE
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 08:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4BAE2E8DFE;
	Mon,  8 Sep 2025 08:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BKZ6tHyp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FA427FB18
	for <linux-gpio@vger.kernel.org>; Mon,  8 Sep 2025 08:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757319491; cv=none; b=oW3nIEkeIqrqUsb9GdMrKZxUeiwA4I7pTK3avw0/wEN5f4c4/ka/rzrhEJZjBhJpIjOF2yLx/zwpAWt/HZ+HZi6mbE6XU9OlzhNRU7pdXOxULPgXw/3XPnsAGZNPAOfEAcN2Lwbhay6TAFgGu6rmJ1HGl9SWAKVL8rdvQVeqPHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757319491; c=relaxed/simple;
	bh=o7gba2+jAp6JN45ckJVOjSTd2mW3MI5IacZgnxVdjtg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IDhRQG/LSewrzIL3e7F7uX1sv4ojF6ePh2emeI+0sv97Y4quMDkqCKtJvqKOYiRW1v/aXzzCzoqI7XgXIKrgn11cfw9EuTQkInXHbpxkx/yhKKYn4Sq+z99tkI80tQhzoOsrZ9PrMol02v7P6b6tYTD+BmWh0W/tya9OLT880wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BKZ6tHyp; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-625e1dfc43dso2524023a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 08 Sep 2025 01:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757319487; x=1757924287; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oZXyFzYuA8aZyQjKh7kKN91C/ghUBbC862WwHS3ZpcU=;
        b=BKZ6tHypCG0+WQ3AVsQoGN0B9iXA6RFa+baeAYviMqjMGUU9DVQxCH34eHyUI2fHeI
         BuIspMtJUkRCOT3LbVFj6nk4WvBe8HSu0MPNBSeNsT9CS+QsWiKjTmz6MdhPmArJTPDp
         AnOdhSCq4nLJgYuiAEBHTfdlUzGwnqHcea5LuSGQrgA5FX/ZtoXT1KnsOTdATle8JvAv
         Y0ApOaZEZF/ZUey0IOopUzRSAW1YfqbD+Z48fADwEN8sxn5oIJOeOiaKcm4tAA6JEHFz
         ojnXog44JXC8SFeaY678hb4XdBZEmUnSIVkJRWiFS2cDrEy7H6OihjxH1PxW86keE2DD
         sPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757319487; x=1757924287;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oZXyFzYuA8aZyQjKh7kKN91C/ghUBbC862WwHS3ZpcU=;
        b=M98y4z/tW2oIEMoi366gTcwWyBDyEPOJGGhzxNlX0nkp9jVK0g+dSjFDFQ3z/HkxGY
         Th2K0A8cdOPpZR0GydP9wCYcsa7dA0GjY7nd/OjJ+6GssvLLNpLRtKX1QbMesY89YVSO
         4ofFNOYcyE75zbCBRLEOt2F266SwBiw8Pi/neQz6vY94Wt1iGbIu7Knq3kWFxO9F57Zj
         MWSjX+xm6GLhmiTVpTU1uLGtYUbg2i7qZ+QYLtb6Hizou1t4rugotjtUdy2mnh6AyTfA
         xNoE5FNuyWHgGpeqoJ6ti1b+4OXIj43c0cZ81n/PpOqgTIUb023piKb+cmdIZTpWmUpL
         PZ9A==
X-Forwarded-Encrypted: i=1; AJvYcCVg2/UdQgtGMqX3qcYm85cSQkh3KqxnsLgNY4Gimv6oCcW9DgQqdwkNeOr/DJGqKZSsrtfDinEDyOSf@vger.kernel.org
X-Gm-Message-State: AOJu0YzgXvHH7lWb6JrK1hcSSPC7mCrhCqOuHwkhnp/stKz/4xXIPOnj
	EO7MFU//sXOYWQttpzSxd2cTbiZauxPjd8S3MnvIBL+chqky/i4lPwtaUlnSo8v7g8o=
X-Gm-Gg: ASbGncvZX9F0WvpNNzPxhTIHKEVo0xQiCP7/LZvcE9FI/jrre7VyuIXwI3UZcEpLsJm
	nJNoFb9pOH+7TAFEqea9UPk6ClDeU3+IVcp0D7r55lVH9gpJYDIkw74UKfFaZ8CMe3KomwS3Tkn
	7AL9yQKqTQ86vWCrDJRoPx7PgtBiQzayyteucqIO2kKm7ppGPK9nMU9+I3XTbyg4ZLKZuAD9hKd
	2j/itQ6AXsZwHAnmXqrMBLApGAsqNdq2ErezuEQ6hsKRyVoHcoSs/wlUCnGZHTLwbDgaQIGAXTa
	pmST6u3ZlbdC0pssc/r9gf4TW4OlhkwfwFeu2VGTSiW13yoCsuHE789TdOXLBOPAignBA2u3GbF
	hm1ctAPSO6ms4Dcx7sq4AwQjJs1KImfPlyibBA2Y1HWDYcBpgrR7ACRpmmowlOHr81OBtibmdDB
	cBbJ0pcBskYBUd0aqBklayJMHp3qRDKI71
X-Google-Smtp-Source: AGHT+IER2UAr/9PTWelTpPr0ZeyJhT+GzvKUxYe6FoK/Y0gFZt2/nh1VtCoSx8Jp83YYy5ehcL+EcA==
X-Received: by 2002:a05:6402:4305:b0:629:7973:e8b1 with SMTP id 4fb4d7f45d1cf-6297973ec5fmr1031764a12.7.1757319487314;
        Mon, 08 Sep 2025 01:18:07 -0700 (PDT)
Received: from localhost (host-79-31-194-29.retail.telecomitalia.it. [79.31.194.29])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-622ac41b1d6sm5337838a12.32.2025.09.08.01.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:18:06 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 8 Sep 2025 10:20:04 +0200
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	florian.fainelli@broadcom.com, wahrenst@gmx.net,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, iivanov@suse.de, svarbanov@suse.de,
	mbrugger@suse.com, Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH v4 2/3] pinctrl: bcm: Add STB family pin controller driver
Message-ID: <aL6RtJPdw06p2YZD@apocalypse>
References: <cover.1756372805.git.andrea.porta@suse.com>
 <bee7c98a96c7000db32495b94ebae2ea06fe0e77.1756372805.git.andrea.porta@suse.com>
 <CACRpkdY82ohgX_7YP16DJrzDvxMHcSu3rW+UtEmrP0AQiD_Exg@mail.gmail.com>
 <aLqg4ZTbUjsgoMwy@apocalypse>
 <CALeDE9O-CxmHUb2sOauyMbNtPftQnqcGchpp-VrD=Ju=QPS4jw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALeDE9O-CxmHUb2sOauyMbNtPftQnqcGchpp-VrD=Ju=QPS4jw@mail.gmail.com>

Hi Peter,

On 17:24 Sun 07 Sep     , Peter Robinson wrote:
> Hey Andrea,
> 
> > On 21:06 Thu 04 Sep     , Linus Walleij wrote:
> > > On Thu, Aug 28, 2025 at 2:45 PM Andrea della Porta
> > > <andrea.porta@suse.com> wrote:
> > >
> > > > From: "Ivan T. Ivanov" <iivanov@suse.de>
> > > >
> > > > This driver provide pin muxing and configuration functionality
> > > > for BCM2712 SoC used by RPi5. According to [1] this chip is an
> > > > instance of the one used in Broadcom STB  product line.
> > > >
> > > > [1] https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3@broadcom.com/
> > > >
> > > > Cc: Jonathan Bell <jonathan@raspberrypi.com>
> > > > Cc: Phil Elwell <phil@raspberrypi.com>
> > > > Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> > > > Reviewed-by: Phil Elwell <phil@raspberrypi.com>
> > > > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > >
> > > Patch applied!
> > >
> > > > +config PINCTRL_BRCMSTB
> > > > +        tristate "Broadcom STB product line pin controller driver"
> > > > +        depends on OF && (ARCH_BRCMSTB || COMPILE_TEST)
> > >
> > > I changed this to (ARCH_BCM2835 || ARCH_BRCMSTB || COMPILE_TEST)
> > > because Peter Robinson told me the Pi5 needs this driver too.
> > > See commit 1d99f92f71b6b4b2eee776562c991428490f71ef for details.
> >
> > Indeed, thanks for spotting this!
> 
> I've been testing this, and other associated patches, with Fedora
> (feel free to cc: me on any patches too) and I'm seeing the following
> crash on the 2Gb model, someone else reported to me they see it on
> their 16gb, I'm assuming there's some issue/nuance in the d0 rev of
> the SoC that causes issues. Wondering if you've done any testing with
> the newer SoC rev or know of any issues there?

I think you have to substitute 'd0' in place of 'c0' in bcm2712.dtsi:

s/brcm,bcm2712c0-aon-pinctrl/brcm,bcm2712d0-aon-pinctrl/
s/brcm,bcm2712c0-pinctrl/brcm,bcm2712d0-pinctrl/

that is, the compatible for the two SoC pin controller.

Which reminds me that we need to add this to the DTS specific for D0 silicon,
I'll work on that asap.

Many thanks,
Andrea


> 
> Peter
> 
> [   56.289183] SError Interrupt on CPU3, code 0x00000000be000011 -- SError
> [   56.289194] CPU: 3 UID: 0 PID: 341 Comm: (udev-worker) Tainted: G
> M               ------  ---  6.17.0-0.rc4.36.pr3.fc43.aarch64 #1
> PREEMPT(voluntary)
> [   56.289200] Tainted: [M]=MACHINE_CHECK
> [   56.289201] Hardware name: raspberrypi Raspberry Pi 5 Model B Rev
> 1.0/Raspberry Pi 5 Model B Rev 1.0, BIOS 2025.04 04/01/2025
> [   56.289204] pstate: 804000c9 (Nzcv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   56.289208] pc : brcmstb_pull_config_set+0x5c/0xd8
> [   56.289216] lr : brcmstb_pull_config_set+0x44/0xd8
> [   56.289220] sp : ffff800080663500
> [   56.289221] x29: ffff800080663500 x28: ffffbcba6aaab480 x27: 0000000000000370
> [   56.289227] x26: 0000ffffa9554298 x25: ffffbcbad6ad2360 x24: ffff000000776240
> [   56.289231] x23: ffff0000011352b8 x22: ffff000002a16080 x21: 0000000000000014
> [   56.289235] x20: 0000000000000118 x19: ffff000002a16080 x18: 00000000fffffffc
> [   56.289239] x17: ffff0000010f1180 x16: ffffbcbad419c418 x15: 000000000000000a
> [   56.289243] x14: ffffffffffffffff x13: 0000000000000001 x12: 0000000000000000
> [   56.289247] x11: 0000000000000040 x10: 0000000000000000 x9 : ffffbcbad3dda6d4
> [   56.289251] x8 : 0000000000000014 x7 : 0000000000000000 x6 : ffffbcbad3dda768
> [   56.289254] x5 : ffff00000204f480 x4 : 0000000000000020 x3 : 0000000000000000
> [   56.289258] x2 : 0000000000000001 x1 : 0000000000000000 x0 : 0000000000000000
> [   56.289262] Kernel panic - not syncing: Asynchronous SError Interrupt
> [   56.422659] CPU: 3 UID: 0 PID: 341 Comm: (udev-worker) Tainted: G
> M               ------  ---  6.17.0-0.rc4.36.pr3.fc43.aarch64 #1
> PREEMPT(voluntary)
> [   56.436367] Tainted: [M]=MACHINE_CHECK
> [   56.440123] Hardware name: raspberrypi Raspberry Pi 5 Model B Rev
> 1.0/Raspberry Pi 5 Model B Rev 1.0, BIOS 2025.04 04/01/2025
> [   56.451472] Call trace:
> [   56.453919]  show_stack+0x30/0x90 (C)
> [   56.457595]  dump_stack_lvl+0x7c/0xa0
> [   56.461268]  dump_stack+0x18/0x2c
> [   56.464590]  vpanic+0x140/0x338
> [   56.467737]  panic+0x68/0x70
> [   56.470622]  nmi_panic+0x90/0xa0
> [   56.473859]  arm64_serror_panic+0x78/0x90
> [   56.477878]  arm64_is_fatal_ras_serror+0x90/0x98
> [   56.482509]  do_serror+0x38/0x60
> [   56.485742]  el1h_64_error_handler+0x38/0x60
> [   56.490026]  el1h_64_error+0x84/0x88
> [   56.493609]  brcmstb_pull_config_set+0x5c/0xd8 (P)
> [   56.498416]  brcmstb_pinconf_set+0xbc/0xe8
> [   56.502523]  pinconf_apply_setting+0xc4/0x148
> [   56.506893]  pinctrl_commit_state+0x124/0x240
> [   56.511262]  pinctrl_select_state+0x24/0x40
> [   56.515456]  pinctrl_bind_pins+0x1ec/0x280
> [   56.519565]  really_probe+0x60/0x3a0
> [   56.523150]  __driver_probe_device+0x84/0x160
> [   56.527520]  driver_probe_device+0x48/0x130
> [   56.531716]  __driver_attach+0xd0/0x1f8
> [   56.535560]  bus_for_each_dev+0x84/0x100
> [   56.539494]  driver_attach+0x2c/0x40
> [   56.543078]  bus_add_driver+0x158/0x280
> [   56.546924]  driver_register+0x70/0x138
> [   56.550769]  __platform_driver_register+0x28/0x40
> [   56.555487]  gpio_keys_init+0x28/0xff8 [gpio_keys]
> [   56.560296]  do_one_initcall+0x5c/0x318
> [   56.564143]  do_init_module+0x9c/0x2b8
> [   56.567903]  load_module+0x7e0/0x998
> [   56.571486]  init_module_from_file+0x90/0xf0
> [   56.575769]  __arm64_sys_finit_module+0x270/0x380
> [   56.580488]  invoke_syscall.constprop.0+0x64/0xe8
> [   56.585208]  el0_svc_common.constprop.0+0xc0/0xe8
> [   56.589927]  do_el0_svc+0x24/0x38
> [   56.593250]  el0_svc+0x3c/0x168
> [   56.596398]  el0t_64_sync_handler+0xa0/0xf0
> [   56.600593]  el0t_64_sync+0x1b0/0x1b8
> [   56.604264] SMP: stopping secondary CPUs
> [   56.608198] Kernel Offset: 0x3cba532a0000 from 0xffff800080000000
> [   56.614310] PHYS_OFFSET: 0x0
> [   56.617194] CPU features: 0x080000,00017000,24023140,0401720b
> [   56.622958] Memory Limit: none
> [   56.626147] ---[ end Kernel panic - not syncing: Asynchronous
> SError Interrupt ]---

