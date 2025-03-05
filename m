Return-Path: <linux-gpio+bounces-17081-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B122A4F7A4
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 08:06:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BCBD16EFE7
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 07:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EBA71C8635;
	Wed,  5 Mar 2025 07:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZ1kl8OD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7BA1E5B96
	for <linux-gpio@vger.kernel.org>; Wed,  5 Mar 2025 07:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741158365; cv=none; b=Cp64Te74GBaFps9Onx7oi0PHTVl/z8GNlfuhbDNp0XBhHYPuzeJdiPHOxOkkrRg9Q2vrVAT99R9PofC39fpUZVc2nDwb8Pyj9dEdVp0NHPwpGL4VmRIPyXewykhAes13qH0x5eBBJX4khP6QIFzyRlgiTWG9JtXVbFZ0zFLNIhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741158365; c=relaxed/simple;
	bh=fR7c8GEKsTp7Sn5vbAzHyynK/9A1YOnG35AgB6aKWbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=SyxYz0KPxeLQhOxj724/AFwcyviAgS/7J6oNuZ1d5Ob0kAxk/biGxtEfSQ1zPpLrySI7F0fFYWkwHUe8/qSZV//wX6GabIfFwn7pgCGHCQGtV7+xzjrQvW9FLRT50n+8PFKnZpkPhUpRaBYwdvXI2pn6BrMmtaxw0lB/x6VBJo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZ1kl8OD; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5a346aeffso545336a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2025 23:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741158361; x=1741763161; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LjgkgPRRTxgzf6thLaq6fGiWsyrGq0fiR63UrTOXUY8=;
        b=PZ1kl8ODvgk2QcaSYI9xPnNMR+Yn/NTJxZY+iS4t7gcNhgCH8Bg5JMXlyjpxDAiIM/
         iQ9T9CtGMPdQIluE/+WVnmUJ8fg3nhybiOMQMteNMsZcsPAavPjTSyiy8Jn+YXjIjyty
         jlar1RyIR7/Esh2L+JrubhmtTOf25GA/bBNl8XB+m2VsBPSkvbVatP8MSQFAJrAv51G4
         xNGjbonYu2IcYR+jHNbh4BOTZvM4xAZ1oy60mepBmZHmYIC0DGmt0TD4xP0kvDfuFxi4
         66v9WI0fMYr6fIvLL/AKlNb/lX5Kea9dwGY1nrCfU8tzfp9APj4a5vtzzXYQen3hUhPH
         55+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741158361; x=1741763161;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LjgkgPRRTxgzf6thLaq6fGiWsyrGq0fiR63UrTOXUY8=;
        b=pR/UAOyMMKyf/A/RwRWzhzOlp2oZKoJsjo3iUvaB2jkYP3mmExgWNXQ9VNsyETfB8M
         CXJaPpwClLEv3R+EF3qRGvyLARXigQG0yzEvaQx/GHzM0tlRjy6vgxC7eNZoPtYumyak
         m0PBHmQV2SBfIBsfS/iu0987fqc7AUxrdKj2L2uIqmVi7ZgIFlElJlQHDdtxeSeAabs0
         M23i9IM7E9W2BN+qE9IsRXH2czR7cbQeZJCRb7058hsFb72BGVuoTEJkvJKnapnM5Wb+
         SMOoZtk0Hp/ABvvGsJEXyc4DKx2jeiIFxIGHt/p3Qlc5phuF1DouBAE4EOiBc2jIeBvf
         8txg==
X-Gm-Message-State: AOJu0YzAGcSXBTFziImkzb3QxI27oSAr0Txh8COOCpbVPU7rXyN8LwX5
	fY68Q2e30HSr1k0ngd6h6aqqCDYR0VubArM61PK7G4d4tB/gGgM+hXkCrOe8i81terBp6OJDteg
	p97zpekQ8dlG6EBzYbKwQN2XDr3LcnA+q
X-Gm-Gg: ASbGncvOVZm1h5HUppURpqlcx35xJTCXDThD+vxcla0U4/CkMaXfFkouBECaadkh+xN
	CKrthwB4qvxTnc/9+V6tWqmKiU7ZjDknaM04mkxSy/Zw0rwhkiBZcqiZibgziNWGEVQycyKedF8
	lPiW9j33gldlPjjyp1P08eAv+nBff8
X-Google-Smtp-Source: AGHT+IEP9g5f3xsji3F2RXNVyJTlMSR7flo5+8FP0o4WZuOhKyELsZRBsdQrr/bI/rkPuuy5GEDsEI+not2WL4G/+Yw=
X-Received: by 2002:a17:906:f586:b0:ac1:ecb5:7212 with SMTP id
 a640c23a62f3a-ac20d94d4a0mr169304466b.31.1741158361038; Tue, 04 Mar 2025
 23:06:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFbkdV1dHEjLQyZa0OV_oxB0LBJVTPSOSGHUSE4NYBbfuy1dKA@mail.gmail.com>
In-Reply-To: <CAFbkdV1dHEjLQyZa0OV_oxB0LBJVTPSOSGHUSE4NYBbfuy1dKA@mail.gmail.com>
From: Huichun Feng <foxhoundsk.tw@gmail.com>
Date: Wed, 5 Mar 2025 15:05:51 +0800
X-Gm-Features: AQ5f1JrNQ4R1oH8Iv0nGb_ALxJ-AA2dflZFAQmUjR1n3SHzSgq1lS9cjIwp2PP4
Message-ID: <CAFbkdV3SJ-cOXUrO_CLXkyE5HrVGS9zYLZyFXt9Vc+AxFEZMWw@mail.gmail.com>
Subject: Re: [QUESTION] Possible ways of preventing GPIO probing
To: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Huichun Feng <foxhoundsk.tw@gmail.com> =E6=96=BC 2025=E5=B9=B43=E6=9C=884=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=882:32=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Hi,
>
> I'm on a Xilinx UltraScale+ MPSoC SoC, and the kernel is v6.6.
>
> It's a heterogeneous SoC including:
>
> - Cortex-A53*4 (APU, Application Processing Unit)
> - Cortex-R5*2 (RPU, Real-time Processing Unit)
> - MicroBlaze based platform management unit (PMU)
> - MicroBlaze based configuration security unit (CSU)
>
> The SoC features a facility called Xilinx Peripheral Protection Unit
> (XPPU), which prevents unintended access of GPIO (and the likes) from
> particular processing units.
>
> In my case, I found that Linux running on APU (A53 cores) attempts to
> probe the GPIO used by the RPU (R5 cores), which requires the RPU to
> do GPIO init again after the probe. Given this, I employ XPPU to
> prevent Linux from accessing the GPIO [0], which seemingly works since
> Linux then panic'd after the provisioning of XPPU. Following is the
> panic message:
>
> [    3.627182] SError Interrupt on CPU0, code 0x00000000bf000002 -- SErro=
r
> [    3.627190] CPU: 0 PID: 32 Comm: kworker/u9:0 Not tainted
> 6.6.40-xilinx-g2b7f6f70a62a #1
> [    3.627197] Hardware name: ZynqMP ZCU102 Rev1.0 (DT)
> [    3.627201] Workqueue: events_unbound deferred_probe_work_func
> [    3.627216] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [    3.627223] pc : zynq_gpio_probe+0x1fc/0x3b4
> [    3.627232] lr : zynq_gpio_probe+0x190/0x3b4
> [    3.627238] sp : ffff8000819d3b60
> [    3.627240] x29: ffff8000819d3b60 x28: ffff0008001dd0c0 x27: ffff00080=
0011498
> [    3.627250] x26: ffff0008001dd100 x25: ffff000800011400 x24: ffff00080=
372b0c0
> [    3.627258] x23: ffff0008000fcc00 x22: 0000000000000001 x21: ffff00080=
00fcc10
> [    3.627266] x20: ffff000802ea6880 x19: ffff000802ea6940 x18: fffffffff=
fffffff
> [    3.627275] x17: ffff000800134c00 x16: ffff000800d3e000 x15: ffff80008=
19d3510
> [    3.627284] x14: ffff00080002791c x13: ffff80008172b520 x12: 000000000=
0000019
> [    3.627292] x11: ffff80008112cba0 x10: ffff84008349feaf x9 : 000000000=
0000028
> [    3.627301] x8 : ffff00080372b120 x7 : 0000000000000000 x6 : 000000005=
52478d3
> [    3.627309] x5 : 00000000ffffffff x4 : ffff800081d54000 x3 : ffff80008=
06a6d1c
> [    3.627317] x2 : 0000000000000000 x1 : ffff800081d54354 x0 : ffff00080=
00fcc10
> [    3.627326] Kernel panic - not syncing: Asynchronous SError Interrupt
> [    3.627330] CPU: 0 PID: 32 Comm: kworker/u9:0 Not tainted 6.6.40
> -xilinx-g2b7f6f70a62a #1
> [    3.627335] Hardware name: ZynqMP ZCU102 Rev1.0 (DT)
> [    3.627338] Workqueue: events_unbound deferred_probe_work_func
> [    3.627346] Call trace:
> [    3.627349]  dump_backtrace+0x90/0xe8
> [    3.627360]  show_stack+0x18/0x24
> [    3.627369]  dump_stack_lvl+0x48/0x60
> [    3.627379]  dump_stack+0x18/0x24
> [    3.627387]  panic+0x314/0x370
> [    3.627394]  nmi_panic+0x8c/0x90
> [    3.627401]  arm64_serror_panic+0x6c/0x78
> [    3.627407]  do_serror+0x28/0x68
> [    3.627413]  el1h_64_error_handler+0x30/0x48
> [    3.627423]  el1h_64_error+0x64/0x68
> [    3.627429]  zynq_gpio_probe+0x1fc/0x3b4
> [    3.627435]  platform_probe+0x68/0xc4
> [    3.627443]  really_probe+0x148/0x2b0
> [    3.627449]  __driver_probe_device+0x78/0x12c
> [    3.627456]  driver_probe_device+0xd8/0x15c
> [    3.627462]  __device_attach_driver+0xb8/0x134
> [    3.627468]  bus_for_each_drv+0x88/0xe8
> [    3.627473]  __device_attach+0xa0/0x190
> [    3.627480]  device_initial_probe+0x14/0x20
> [    3.627486]  bus_probe_device+0xac/0xb0
> [    3.627492]  deferred_probe_work_func+0x88/0xc0
> [    3.627498]  process_one_work+0x138/0x28c
> [    3.627506]  worker_thread+0x2a4/0x4bc
> [    3.627512]  kthread+0xe0/0xe4
> [    3.627519]  ret_from_fork+0x10/0x20
> [    3.627527] SMP: stopping secondary CPUs
> [    3.627533] Kernel Offset: disabled
> [    3.627535] CPU features: 0x0,00000008,00020000,0000420b
> [    3.627540] Memory Limit: none
> [    3.885271] ---[ end Kernel panic - not syncing: Asynchronous
> SError Interrupt ]---
>
> At the moment of the panic, which is just after the employment of the
> XPPU, I thought that I should disable the GPIO in devicetree. However,
> after the GPIO got disabled [1], the panic still present.  Is it
> because that, in this case, I can't simply disabling the GPIO through
> adding 'status=3D"disable";' ?

It turns out that, even the removal of the heartbeat GPIO node doesn't
prevent the GPIO of interest being probed (accessing the related
registers). Instead, the whole GPIO module have to be disabled like
this:

&gpio {
-          status =3D "okay";
+         status =3D "disabled";
        pinctrl-names =3D "default";
        pinctrl-0 =3D <&pinctrl_gpio_default>;
};

in which "gpio" is defined in a dtsi as:

gpio: gpio@ff0a0000 {
                        compatible =3D "xlnx,zynqmp-gpio-1.0";
                        status =3D "disabled";
                        #gpio-cells =3D <0x2>;
                        gpio-controller;
                        interrupt-parent =3D <&gic>;
                        interrupts =3D <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
                        interrupt-controller;
                        #interrupt-cells =3D <2>;
                        reg =3D <0x0 0xff0a0000 0x0 0x1000>;
                        power-domains =3D <&zynqmp_firmware PD_GPIO>;
                };

Although turning off the whole GPIO module stops the kernel panic,
other peripherals have warning messages like:

[   24.559979] ------------[ cut here ]------------
[   24.570039] i2c1_ref already disabled
[   24.573722] WARNING: CPU: 0 PID: 62 at /drivers/clk/clk.c:1181
clk_core_disable+0xa4/0xac
[   24.581904] Modules linked in: cfg80211 uio_pdrv_genirq openvswitch
nsh nf_nat
[   24.589137] CPU: 0 PID: 62 Comm: kworker/u9:2 Tainted: G        W
       6.6.40-xilinx-g2b7f6f70a62a-dirty #1
[   24.599223] Hardware name: ZynqMP ZCU102 RevA (DT)
[   24.604005] Workqueue: events_unbound deferred_probe_work_func
[   24.609838] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[   24.616799] pc : clk_core_disable+0xa4/0xac
[   24.620983] lr : clk_core_disable+0xa4/0xac
[   24.625158] sp : ffff800081cbbb10
[   24.628465] x29: ffff800081cbbb10 x28: ffff0008018ef840 x27: 00000000000=
00000
[   24.635602] x26: ffff0008018ef880 x25: ffff8000816f0000 x24: 00000000000=
000ff
[   24.642738] x23: ffff000807431d08 x22: ffff0008000f9410 x21: 00000000000=
00000
[   24.649873] x20: ffff000801e23000 x19: ffff000801e23000 x18: 00000000000=
00006
[   24.657009] x17: 0000000000000016 x16: ffff800081cbbb30 x15: 07200720072=
00720
[   24.664145] x14: 0720072007200720 x13: ffff8000816f31b0 x12: 00000000000=
0088b
[   24.671280] x11: 00000000000002d9 x10: ffff80008171f1b0 x9 : ffff8000816=
f31b0
[   24.678416] x8 : 00000000fffff7ff x7 : ffff80008171f1b0 x6 : 00000000000=
00001
[   24.685552] x5 : ffff00087f75aa88 x4 : 0000000000000000 x3 : 00000000000=
00027
[   24.692687] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000800a=
fb700
[   24.699823] Call trace:
[   24.702261]  clk_core_disable+0xa4/0xac
[   24.706090]  clk_disable+0x30/0x4c
[   24.709492]  cdns_i2c_probe+0x3f4/0x534
[   24.713321]  platform_probe+0x68/0xc4
[   24.716975]  really_probe+0x148/0x2b0
[   24.720630]  __driver_probe_device+0x78/0x12c
[   24.724979]  driver_probe_device+0xd8/0x15c
[   24.729155]  __device_attach_driver+0xb8/0x134
[   24.733591]  bus_for_each_drv+0x88/0xe8
[   24.737419]  __device_attach+0xa0/0x190
[   24.741247]  device_initial_probe+0x14/0x20
[   24.745423]  bus_probe_device+0xac/0xb0
[   24.749251]  deferred_probe_work_func+0x88/0xc0
[   24.753774]  process_one_work+0x138/0x28c
[   24.757784]  worker_thread+0x2a4/0x4bc
[   24.761525]  kthread+0xe0/0xe4
[   24.764572]  ret_from_fork+0x10/0x20
[   24.768141] ---[ end trace 0000000000000000 ]---
[   24.773934] platform ina226-u76: deferred probe pending
[   24.784636] platform ina226-u77: deferred probe pending
[   24.789876] platform ina226-u78: deferred probe pending

These peripherals are currently unused and I believe that removing
them from devicetree can stop the warning message.  Nevertheless, I'm
figuring out whether it is feasible that the configuration granularity
can be as fine-grained as per-GPIO-pin-registers, as this brings more
verserality to the system capability.

If anyone know there's way to isolate the GPIO at fine-grained level,
please let me know.

Thanks!
Fox

>
> If there's any RTFM thing I should do beforehand, please provide me
> some keywords or in-tree document names.
>
> [0] I believe this is simply an initial step since I would also need
> to teach Linux not to use/probe this particular GPIO.
> [1] I can assure that the GPIO does get disabled since it was a
> heartbeat LED for Linux, which no longer beats/flashes after the
> devicetree disable thing.
>
> Thanks!
> Fox

