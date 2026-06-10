Return-Path: <linux-gpio+bounces-38286-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QraFCJjGKWqGdAMAu9opvQ
	(envelope-from <linux-gpio+bounces-38286-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 22:18:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F5066CBAC
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 22:18:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Nhe7W/vA";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38286-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38286-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57893317A21C
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 20:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D32F47AF6C;
	Wed, 10 Jun 2026 20:18:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E23478E51
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 20:18:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781122700; cv=pass; b=TLAfrsa7TPiY7MdKdX0SOPyAC5vQ7olq9lStLBmBrR8t+wqLHmayz2VKjvZ+Ibt5DWhgiNIo5zzn5J64RuIgvDPo9hq/b6ao24NeZUiGtXSNihCQecLMNvmcn4mACAreVmeuWXru9IBYspqd9tB+Alb72bgUUcv+Ns8whXaOt5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781122700; c=relaxed/simple;
	bh=XAZZ4lMGGUnczbfdUVa35Y+Zd0StMaYy2K1oFDQOhhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DjV3zZGDUoa6kYF8ylVnIxJzYFiqOHoKnuGb7Pc4+dElKP6SUgmXDpRD5dDeOvMk8jbLEFaPBcBySRZXLl9AxJNEJ2LaqxTJyjKXsUCMpnmaJYeeYwA9Rgnts9xE44qZ/F5LyEoPGspVWsEnk+q7NtgiudCaOY+NlIbuh/GjJ+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nhe7W/vA; arc=pass smtp.client-ip=209.85.214.169
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c0bb4a94b8so61274415ad.2
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 13:18:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781122697; cv=none;
        d=google.com; s=arc-20240605;
        b=M3NlUVEIZ5/S2Hv7bQC8NqHdEQ7S5OWEagDCBPGQNTSPtvN98JjZCpOIDsouJsyEnI
         Dd4nHrmmAxfvQuBGRwUD7eX3BzhYomOeYJZPeL66MjN8Fhb51xSY1VmMwjtP4JU/BH0u
         iK7qW1W4XyJW9vEqVJestVKR4uHQHkmlKXBydw8tNTB5uK7f2jlasXoxxVcBcLRTIc7g
         toVmDKvjd/A8i+BX3ORkTig551KmGSMzFpX38Op/5iC4NopVjIyBYdpve1Sark2JAXNE
         iJTFPxY7BSbHxkWRaJ5FiP7FtyxoQdUN0IZPU48ndXeIDIGocIm7VJs73KIaKnDMgMK3
         HQHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iUoku6JYBMzeb8tuGEzqZVpJAnXtIph0wYv3JgNqUXg=;
        fh=RvWKKEb2foRo+9htMFSY+IKUAFw6H5feVu8uld8B1tE=;
        b=azU01easMRMx8jxE7c5WHwUd+uJJzusuDxs9v98pfYzck2FYIQ2dww1fWsNWgOPV91
         Fzcmw46qMcyet2f50IWHOkgq9OI77/m6mSd4S7Wxd2aG/MbOI6LTRHiPlm2p3XX5UpgZ
         ayhLsYspLCprFQcvxN0RkA7OTdwUl73qrqrBynd84JnXI8ebhzHPvfhab/BGtnRuygRr
         zY8CCMhtBRmZ64S5ViIMbAfAQZkDiwVDNKHqpucgsy4nUpAu6UeOyTwi0X50zKUdx4F/
         ZsGPVXkXtOM2+xbXAtOTUXXi+UxVQUfzZ3bAF8WuS5QFMR0CkqAaEd0lbIoHiZpH0cb+
         2low==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781122697; x=1781727497; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iUoku6JYBMzeb8tuGEzqZVpJAnXtIph0wYv3JgNqUXg=;
        b=Nhe7W/vAbSnFqZxcMzUSojw2z4LCg9DT8CLIpj2ORY+Op+jtmieRVeDObdslkoPwbs
         1rzQck8m45vBSXFyMHON1hDoJFCLa4qgaANeMPnCIdwf8MZMqqJukzxvhATGJQHwad1o
         f055QDKB6D+gNO78YmN5aYonnP33AEvPxKHDC5e8OIwITL7FgIkdbYYslqBLimM5JapA
         WHbD2TN5EdxMILDzFRaot1srdH6ciNpen4hoQdkBj340UhZ6GB4u6W0pkufTtjQZItep
         9Ag+xzS/NKYsr0h8G/AalUKe0QEpIDW1NHYQeKzEUZ83jrKHre9BTjkv33dWvNMVPTn0
         TVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781122697; x=1781727497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iUoku6JYBMzeb8tuGEzqZVpJAnXtIph0wYv3JgNqUXg=;
        b=pXg5x1hIET1h6VeNi/+3ld5ciD9hJK05krJCn1nkl8Ino52XUFzM+WkQ3/BUiHtLNN
         +v5fg9KozV8Wnd3Jvt4Qo3fS7zbjrXnmcqPta1z6u3PK+3OhaZNqUP/h4iXaIi41cBz2
         VN9HQ+3kcSV82NaO452iIBwJaFXiAfstxbHhkiVGKARauTr/u38Ee+qv0ZtT9sf12C/p
         SAB5qTOdBeOwpCVtvUiRZt2wn8KtyFKbgEoR06cVCW5dZ2W6VO22byt0z7Huf8TxWqP1
         N12VaKQYMTgPmK8Rxctl1xdY4sdk0QjBmGqTIBZqTl1Htrd80DV0UEIqKQvauliOTX0r
         kv2w==
X-Forwarded-Encrypted: i=1; AFNElJ8Y8+Zd9Z5ZfSj+g6jb3hXEYj1hrl8JSEOxvTexhqAEoyjh6ye2go79kEsmgEDMDX/Bl0LC+LEOM4TI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6PE/3ecYiXWFggSL8grlgCCdke8HeOrxSNLQBg+CWlmFYD7rP
	tPN/C96mto2OWsgVSe9hnEUmSQpNiZgW0Y4pFkN0DhWgqyov8JhtyNl5Nx8aIVIXS/AXwa/qlMR
	GSj7QS3zQ0V+or0+umroiSye0ywwCMxhu8zn280U=
X-Gm-Gg: Acq92OEuEGy8fktKsyK6B1MSUbeIR5o/ad7i3ipoGy3KkipelQ3Nryzu8sySa2pF1zH
	UoARjB1XvcLuL8ZQAX11rURTZXf0d4Xo7tjd89Di52jwm3fAmsuMT7NWcY2+ppL+wpBvPWJccat
	1FFnuWsgf/pv+XGinLOkFglXPBBRroxxDSZ/xGmB3Befi0rQGwk8AFYo5z0Hd/uzDe7Aco3bYXY
	H1OlXwsjIRRjdV0u5TiJOPxHPkyaM/6ChjSneFsr2XsvofQc8x8Zh+izKZhtQMXAWXezINFZmv2
	x8VAG3VGfwiZUx4I00M4iAfHKtlV1PbPobUti20UquhipMQruwxAHFwp+RL69TuRbGLx5ZrxpSo
	8Ci4HB5ouf/eeOqDg6g2G4TWNtrNPbBGbd6M=
X-Received: by 2002:a17:903:1106:b0:2bd:5026:ca11 with SMTP id
 d9443c01a7336-2c2da73b41emr8245705ad.2.1781122696934; Wed, 10 Jun 2026
 13:18:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFdvZNt+mRTE9Q+utn=T8GzU7s_09ULhUtzTMMa9dgGCsE+r9A@mail.gmail.com>
 <c982caf3-f855-41ad-80cd-3ce9598913ab@amd.com>
In-Reply-To: <c982caf3-f855-41ad-80cd-3ce9598913ab@amd.com>
From: Lenart Kos <koslenart@gmail.com>
Date: Wed, 10 Jun 2026 22:18:05 +0200
X-Gm-Features: AVVi8CemCH7C-kd1Yt8WzbqlT7hZO52CmH0xTYcSQcbFBtO-Pg-Qx6b30oGXZr0
Message-ID: <CAFdvZNs9jNxnqqaPhDXBt555hqgTHQizV4ORPp_8xg1D=XD4TA@mail.gmail.com>
Subject: Re: pinctrl: amd: spurious immediate resume from S3/s2idle via
 BIOS-armed wake GPIO with no ACPI owner (Lenovo Legion Pro 5 16ARX8)
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-38286-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mario.limonciello@amd.com,m:Basavaraj.Natikar@amd.com,m:Shyam-sundar.S-k@amd.com,m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[koslenart@gmail.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[koslenart@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fedoraproject.org:url,vger.kernel.org:from_smtp,mail.gmail.com:mid,amd.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 72F5066CBAC

Thanks for taking your time for this. To answer your questions:

S3 path:
AFAIK it was on [deep] since my system was installed and I strongly
remember being it as so, although it is possible that I misremembered
since I have been debugging this sleep issue since January. In any
case I have also tried setting sleep to [s2idle] before and it did not
fix the waking issue even if set in s2 sleep mode.
The firmware is not modified, everything is installed from Fedora
sources without modification.

Methodology:
Yes you are correct about LLMs, I have thrown every bit of my
knowledge and time that I have available for this without success and
Claude has finally solved this after a few months being irritated by
this. I had decided to forward most of the information I received from
LLM in the hopes it was useful to an expert in the area, but in
hindsight I can see this was a mistake without AI disclosure, I'm
sorry. So for your other questions regarding why this assumption was
made or why was something done a certain way - I don't know, but I am
willing to assist with testing. Apologies for this mess, it's my first
time filing a bug to the LKML.

On Wed, Jun 10, 2026 at 9:59=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> First off -
>
> How did you get into an S3 path?  These systems that ship with only
> Modern Standby / s2idle normally shouldn't be able to get into S3.
>
> =E2=95=B0=E2=94=80=E2=9D=AF cat /sys/power/mem_sleep
> [s2idle]
>
> Have you modified the firmware in some way to try to enable an
> unvalidated path?
>
> I have some more questions about your methodology below because when
> debugging a kernel issue an LLM can sometimes make WILD assumptions that
> are totally a house of cards.
>
> On 6/10/26 14:32, Lenart Kos wrote:
> > ## Summary
> >
> > On the Lenovo Legion Pro 5 16ARX8, suspending (S3 *or* s2idle) with an =
external
> > display connected resumes the machine after ~1 second. The wake is deli=
vered by
> > the AMD GPIO controller (`pinctrl_amd`, IRQ 7) from GPIO pin **#4**
> > (and pin #2 for
> > the USB=E2=80=91C/DP path), which the **BIOS has armed as an S0i3/S3 wa=
ke
> > source directly
> > in the FCH GPIO register**, with **no ACPI description**
> > (`_AEI`/`GpioInt`/`_PRW`)
> > anywhere in the DSDT or the 16 SSDTs. Because there is no ACPI owner,
> > none of the
> > existing override mechanisms (`gpiolib_acpi.ignore_wake=3D`, device
> > `power/wakeup`)
> > can reach it, and `IO_STRICT_DEVMEM` blocks any userspace register
> > write. The pin
> > is an external=E2=80=91display HPD line, so the edge produced while the=
 GPU
> > powers down on
> > the way into sleep immediately wakes the system.
> >
> > ## Affected system
> >
> > ```
> > DMI sys_vendor LENOVO
> > DMI product_name 82WM
> > DMI product_version Legion Pro 5 16ARX8
> > DMI board_name LNVNB161216
> > BIOS LPCN62WW (2025-06-17) # latest available; does NOT fix this
> > SoC AMD Ryzen 7 7745HX (Raphael), GPIO ctrl AMDI0030 @ 0xFED81500
> > GPU NVIDIA RTX 4060 Mobile (HDMI) + AMD Raphael iGPU (USB-C DP)
> > Kernel 6.17+ through 7.0.x (reproduced on Fedora 43/44)
> > ```
> >
> > ## Symptom / evidence
> >
> > Failed-suspend kernel log (verbose PM):
> > ```
> > PM: suspend entry (deep)
> > ...
> > amd_gpio AMDI0030:00: ... Clearing debounce for GPIO #2 during suspend.
> > amd_gpio AMDI0030:00: ... Clearing debounce for GPIO #4 during suspend.
> > amd_gpio AMDI0030:00: ... Disabling GPIO #89 interrupt for suspend. #
> > not a wake src
> > ACPI: PM: Preparing to enter system sleep state S3
> > Timekeeping suspended for 1.384 seconds
> > PM: Triggering wakeup from IRQ 7 # IRQ 7 =3D pinctrl_amd
> > ...
> > GPIO 4 is active: 0x30057c00 # bit 14 (WAKE_CNTRL_S3) + bit 29 (wake la=
tched)
> > ```
> > `/sys/power/pm_wakeup_irq` =3D `7`.
> >
> > `/sys/kernel/debug/gpio` (relevant rows) shows pins #2 and #4 armed for=
 S0i3+S3
> > wake with their interrupt enabled, while #89 has no wake bits:
> > ```
> > #2 =F0=9F=98=9B| =E2=86=93 | edge |=E2=8F=B0|=E2=8F=B0| | | ... 0x147ae=
0
> > #4 =F0=9F=98=9B| b | edge |=E2=8F=B0|=E2=8F=B0| | | ... 0x57ce0 <- both=
-edge HPD, S0i3+S3 wake set
>
> How did you determine this is an HPD line?  Is that a pure guess?  Or
> did you look at a schematic/trace etc?
>
> > #89 =F0=9F=98=9B| =E2=86=93 | level| | | | | ... 0x151b00 <- no wake bi=
ts (red herring)
> > ```
> >
> > ## Root cause
> >
> > 1. The external=E2=80=91display HPD lines are routed to SoC GPIO #2 (US=
B=E2=80=91C/DP) and #4
> > (HDMI/dGPU).
>
> How do you know?
>
> > 2. The BIOS sets `WAKE_CNTRL_S0I3`/`WAKE_CNTRL_S3` (bits 13/14) on
> > those pins in the
> > FCH GPIO register block and **never describes them in ACPI** =E2=80=94 =
decompiling the
> > DSDT and all 16 SSDTs yields **zero** `GpioInt`/`GpioIo`/`_AEI` resourc=
es.
> > 3. `pinctrl_amd` correctly preserves hardware-armed wake pins across
> > suspend, so the
> > HPD edge generated during the suspend transition wakes the system immed=
iately.
> >
> > This is effectively an unvalidated firmware S3 path (the platform ships=
 as
> > Modern-Standby-only); but note **both** the S0i3 and S3 wake bits are s=
et, so
> > s2idle is affected too.
>
> So how did you get into S3?
>
> >
> > ## Why existing mechanisms don't help
> >
> > - `/proc/acpi/wakeup`, PCI/ACPI `power/wakeup` =E2=80=94 wrong layer; t=
his is
> > not a PCIe PME.
> > Disabling wakeup on the GPP bridges / GPU has no effect (verified).
> > - `gpiolib_acpi.ignore_wake=3D` / `ignore_interrupt=3D` =E2=80=94 only =
match
> > **ACPI-declared**
> > GPIO events; this pin has no ACPI declaration, so they cannot target it=
.
> > - `/dev/mem` register write =E2=80=94 blocked by `CONFIG_IO_STRICT_DEVM=
EM=3Dy`
> > (the region is
> > claimed by pinctrl_amd).
> >
> > There is currently **no way, in-tree, to disarm a bare (non-ACPI) firmw=
are-armed
> > pinctrl-amd wake pin.** That is the gap.
> >
> > ## Suggested fix (maintainers' choice)
> >
> > A working out-of-tree reference implementation (clears bits 13/14/15
> > on pins #2/#4
> > at probe and on `PM_SUSPEND_PREPARE`) is here:
> > **https://github.com/Lenart12/legion-nowake** =E2=80=94 please feel fre=
e to reuse.
>
> Why not use /dev/gpiochipX devices to change GPIOs?
>
> >
> > Possible in-tree directions:
> > 1. **DMI-matched quirk in `pinctrl-amd`** that clears the S-state
> > wake-enable bits
> > for the affected pins at probe (smallest change; precedent exists for A=
MD GPIO
> > wake quirks).
> > 2. **A generic override** for bare pins, e.g. a
> > `pinctrl_amd.ignore_wake=3D<pin,...>`
> > module parameter, analogous to `gpiolib_acpi.ignore_wake=3D` but for
> > hardware-armed
> > pins without ACPI events. This would help the broader class of AMD lapt=
ops that
> > hit firmware-armed spurious wakes.
> >
> > ## Reproduction
> >
> > 1. AMD laptop where a display HPD is wired to a GPIO the BIOS arms for =
wake.
> > 2. Connect an external monitor, `systemctl suspend`.
> > 3. Observe resume after ~1s; `pm_wakeup_irq` =3D the `pinctrl_amd` IRQ;
> > the offending
> > pin shows `wake latched` in the post-resume `GPIO N is active` log.
>
> On the presumption that this is correct about being an HPD pin doesn't
> this actually point at a GPU driver bug?
>
> >
> > ## Public discussion / full diagnostics
> >
> > Fedora Discussion (complete diagnostic walkthrough, ACPI dumps, gpio ta=
ble):
> > https://discussion.fedoraproject.org/t/immediate-wake-from-s3-sleep-whe=
n-hdmi-is-connected-irq-7-pinctrl-amd
> >
> > ## Attachments to include when filing
> >
> > - `acpidump` output (or note: DSDT + all SSDTs contain no GpioInt/_AEI)=
.
> > - Full verbose-PM `dmesg` of one failed suspend (`pm_debug_messages=3D1=
`).
> > - `sudo cat /sys/kernel/debug/gpio`.
> > - `cat /sys/class/dmi/id/{sys_vendor,product_name,product_version,board=
_name,bios_version}`.
>
> Where is the kernel bugzilla that you attached all these artifacts?
>


--=20
Lep pozdrav,
Lenart Arvo Kos

