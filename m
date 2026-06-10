Return-Path: <linux-gpio+bounces-38299-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N7cpO4DhKWq0ewMAu9opvQ
	(envelope-from <linux-gpio+bounces-38299-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 00:13:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6070966D291
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 00:13:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Owj3gjnJ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38299-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38299-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F33723030D73
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 22:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 266DA342519;
	Wed, 10 Jun 2026 22:13:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE1F2C031E
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 22:13:14 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781129595; cv=pass; b=RXCVXW60MqQg14WSaazq9RSp6rUDaRF5H90cFkfgD9cxgBm/3g0gDKejh1l4+wYcP4fWI9mHrnFFBwMCdrL03lrtYzq4qB4waeErh4gARyoTeYq2pt27VsEzsFeEZ95rxdFivouvVdyLKT2VzUilJxneZoSbBGokHIsRxcDiHLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781129595; c=relaxed/simple;
	bh=vTIlPNBWqO2KWCAmxl9WAp6i/imDZyVWZrAmAf40z9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PMaTR6atXXGXH/p4rYuT37Ph6+Xlxho48D64SqnmMG8/eSValmyt97k1Mu+XJNdqkIlvAoqHOO4Vsdt3PABi0rQSh3HFxdfDmPLwrN0kvFZbOyEv2y9QAELppMLPbD3ZAK6F1rQ/KLOl38Nj1AwqocAPyLvhquHhsXzN2EP23Rw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Owj3gjnJ; arc=pass smtp.client-ip=209.85.210.171
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84230ab8857so3304794b3a.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 15:13:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781129593; cv=none;
        d=google.com; s=arc-20240605;
        b=CZUtdckULEDUaUpjV4PTLfVnHMYD+d8gN6RIN5mtyuPU9N8kRTN7pa1m9cjK11mu7s
         NSFomr0RguocBzeoET9fsxvsns5k4lHkoTGS8YWiDfWH0hIa1dsKbkg25KP5A0ncVSWY
         of51zVrtyVlAjX/7D35eLkktm3QnLAhpVMV7LfYSbtJVMaJjy4LSYtRJb3X3xS/5W0Jc
         XETrUL9lMmCKqDYhQyycYzShYNvNtEH9omJWGWGni8jHbbyJS+tygM9GIi+2zjqspo6i
         W5jYaclN3ZoNIZukiDDdOkyKWJLXF4Y3LPClNnumrZk6I2YpqGrjH/HkHxn762CROvmj
         /gYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B9vEB56jiCDzANDfRHggu9hPajDXL2AcNbpcdJbXTbc=;
        fh=0JJF7ETtmoGnpSd/mT27KsbVqoogPV+4gSne38IDGFQ=;
        b=jM8vq2IGIPdPb5fJc+wD/g/c/vrZgpzeQYRIILqGPlWhJDnvoTEc6qIK8ERheckmNs
         V1pyC7IBRWRv6tIXHtP0Eq9Ww/Iei6/VCmknaiy/jlQJ0olebr73IrSOudHgpsClKHaO
         37ZAYqop4I0ev3AYBUJSwgqH/tKE7uzLtLAgzB/bXGcSju9JanZyHmFR5tRuyiMMO7RY
         kZ+aHy22WGmbhBVNMY14bRD+in+qIv+Ia+A0XhBsokCm7SOz4eeCdYyMhWo6Z3t+5qxj
         NrtEYcjRaMyHPlKOQOqvgXeylouz57xlKX+2aEKHh2Wnw9qY/H/TT3to6EioJsQGdIUK
         P1+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781129593; x=1781734393; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B9vEB56jiCDzANDfRHggu9hPajDXL2AcNbpcdJbXTbc=;
        b=Owj3gjnJwXcxwa6J28xxNWdOjRcYxcvYcD/Go+z9vO2WkxQSH8aKRu2IW7BlYSsAZj
         aQgT4XSW9mYOl9GQ7XHwac6haTpvoa62C5YqaskMu3xByFQT+H/SmAXsrxmtJsfPIuu7
         jKgFPZWNw2ub2beWpbyCIhINgnfYUtvdrdJ9Q2dbbO4H6dGRdNlSnVzLGxxzpl+qDsFL
         qEH57B33GAnNvUIjdzj1/2qUyqV7Nv64pLAhTtVAWPJQHu8+KwrYbH3u1DW/BqP0ldJI
         daorf1b1TarLkzFpLmEY/k5MqShDb5bj2Tg2Ng3svh4p3mxKuIhFBylW+zM+HZGoBRYP
         +RTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781129593; x=1781734393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B9vEB56jiCDzANDfRHggu9hPajDXL2AcNbpcdJbXTbc=;
        b=sbU9D3Ug1fY2cw4qsffUZvhL9NEqLQQkVW+OEetUFv7nxIbuNaz2EiNX1P4LOaCAX7
         TFuk6OJxhLbPDl8xn3Rdft1C+okgBm6zVwQU0vbzKztqL6C0Mi4xAe+7FqbU2/aKEbsD
         hDmeQrJqidSQrHl2bo1jG8LgEy0t+MAvU1MhpHeRzbr1FT0h4yW+v8XiBV6JWeBv7k19
         r88fagDaPZW+gwy0UwLX+CEVHGk6vROqiD+FVHBeH/3gAZDSfUZOgSJUZDsgFp/ZJLOF
         IRYOrArT0/L8PWa9gMgSp8mjkoP1nTbk3ccyeF7ButfX3m82Cyr9rOLqX8N4wToQ3oaz
         hmNQ==
X-Forwarded-Encrypted: i=1; AFNElJ8yPy2NWKNn6Dz9tOKoSE05iVhtOOH6PIfyw0OES0m6slernuqqvcWqY5AS3iWOI/hBHZP9B5tuq4GB@vger.kernel.org
X-Gm-Message-State: AOJu0YwOQfxBZ07keYWOEIY8Sb3Rosciq+Ax7AigZKwX/qn2ajsut0p5
	froMJnRQRSQtgbjlxp7sYllVWlkOojeoeYPJ8E83/o+nueJDvsjCED5q+jaDOaRjKKLTG4gaInO
	ofhjiq27RaKG1jAiHWCenorL3llB5Ww3cSLCay8s=
X-Gm-Gg: Acq92OFVmDI/cIo5qN1VLpIPMQLoNogPj7bK5sOjCWJdJZPjVgeDFJXq4ZYHqpqjGZV
	NIOXYOdmJio3135D1s0Hf4T+Oomz6yZODH26Df6hnHPPXdDzDu1VIomokxlriukVwXT0AgrhuEc
	Ve0Q6ZS9g+8rNfGHIX1kbK68SnIsIitpNsff1kcBpaUJdLwgj9YH+qAL+Lym2q0TXEm5wFj8kB3
	coUq1XNSS0548paRBqQJhvOAmLF+gBUnXo64g0mPMuoKhn+BmeLvoSp6ZbaJxmqWwbjU0x9pi1H
	95y1xx61IdLxL1rOXrROd2Yg81DJj2yYyTleb4sMwC00fRn4cbwv5KULAwUQ/u3p1M6vBilGIKP
	IoV6cnVzT5OPz2nBZeecf6Dmu53XLkGzoTSA=
X-Received: by 2002:a05:6a00:194a:b0:842:4f20:53ff with SMTP id
 d2e1a72fcca58-842b0fd16bdmr30005745b3a.42.1781129593341; Wed, 10 Jun 2026
 15:13:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFdvZNt+mRTE9Q+utn=T8GzU7s_09ULhUtzTMMa9dgGCsE+r9A@mail.gmail.com>
 <c982caf3-f855-41ad-80cd-3ce9598913ab@amd.com> <CAFdvZNs9jNxnqqaPhDXBt555hqgTHQizV4ORPp_8xg1D=XD4TA@mail.gmail.com>
 <44bd3c12-b8d6-45c8-a7cf-12ea47716461@amd.com> <CAFdvZNvWSVCphSyQCVNHx7j0WApsbr0KekVsA-rVLO0eqV0X9w@mail.gmail.com>
 <ef1d3b86-f5c1-4ac5-ad09-821624044ca1@amd.com>
In-Reply-To: <ef1d3b86-f5c1-4ac5-ad09-821624044ca1@amd.com>
From: Lenart Kos <koslenart@gmail.com>
Date: Thu, 11 Jun 2026 00:13:01 +0200
X-Gm-Features: AVVi8CcPMVjZcDsVQj7rZCR6a3-FII4N_ggGJdBqls1dkBNTKsvwgifIPG03HnU
Message-ID: <CAFdvZNvj2Gkik6de1Wtw1++S+MiVsRyyXwo7cPQ4RnDCnKYNDA@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-38299-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6070966D291

While debugging with /dev/gpiochip I found out there is actually an
acpi event attached to both #2 and #4 so the report about there being
no _AEI resources was wrong...

The _EVT handler shows what pin 4 is:
* Case (0x04): Notify(_SB.PCI0.GPP0.PEGP, 0x81) // "Information
Change" -> dGPU (NVIDIA)
* Case (0x0A): Notify(_SB.UBTC, 0x80) // USB Type-C status change

Testing with cmdline
gpiolib_acpi.ignore_wake=3DAMDI0030:00@2,AMDI0030:00@4 it fixed the
issue as well. Maybe this can be added to gpiolib_acpi_quirks or
should this be fixed in Nvidia drivers? If you could kindly direct me
in the correct direction since this does not look like an AMD problem
anymore.


On Wed, Jun 10, 2026 at 11:30=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> On 6/10/26 16:20, Lenart Kos wrote:
> > I have checked all the bios settings and the closest to modifying
> > sleep behaviour was a setting that enables opening the lid turning on
> > the laptop which was already disabled, so no, there are no sleep
> > settings.
>
> OK - then the LLM statement that this is a modern standby system sounds
> categorically wrong.
>
> It sounds like this is actually a system that only support S3.
>
> >
> > Regarding the HDMI port, it is connected to the Nvidia card. Only the
> > built-in screen is connected to the AMD card with eDP. I have not
> > reported this anywhere else yet, only here and the before mentioned
> > forum post. If this is an Nvidia issue I can report it to them as
> > well.
>
> As the behavior only happens with something connected to the HDMI port,
> I think you should discuss this with NVIDIA before we make any quirk
> decisions in the kernel.
>
> This really sounds like a driver bug to me if it's tied to that behavior.
>
> I personally would not be against more debugging infrastructure, but I
> would think that /dev/gpiochipX is enough for users to debug with.
>
> You can work with an LLM to try to come up with a solution that uses
> /dev/gpiochipX.
>
> I would certainly welcome a new section in
> https://docs.kernel.org/arch/x86/amd-debugging.html to explain how you
> used it if it's effective for debugging this problem.
>
> >
> > The HPD theory is pure guesswork done by LLM. What I can be certain of
> > is that disabling those specific pins
> > (https://github.com/Lenart12/legion-nowake/blob/6b599aad7afd1431e810482=
73106c5526561764b/legion_nowake.c#L59-L62)
> > did solve the problem, as to why and in what way, I would not bet on.
> > So the statements about HPD and your questions about them are maybe in
> > vain. What would be the best way to figure out if HPD is actually
> > attached to those pins?
>
> You can add some debugging statements specifically for when those GPIOs
> are firing interrupts.  Unplug/plug and see if/when those GPIOs change.
>
> Maybe they're monitor presence lines?  Maybe NVIDIA can tell you.
>
> >
> > FWIW I think that it is in fact not HPD as I have checked the GPIO
> > states when the monitor cable is connected or not and it seems to be
> > gpio #131 not #2 or #4. I have asked Claude to expand on what it knows
> > and what it assumes, this may be of help to you:
> > ---
> > What I have measured (facts):
> > * The resume is triggered by the AMD GPIO controller:
> > /sys/power/pm_wakeup_irq =3D 7 (pinctrl_amd), and the post=E2=80=91resu=
me log
> > shows GPIO 4 is active: 0x30057c00 with the wake=E2=80=91status bit lat=
ched
> > and the S3 wake=E2=80=91enable bit (bit 14) set.
> > * In /sys/kernel/debug/gpio, pins #2 and #4 are the only pins with
> > S0i3/S3 wake=E2=80=91enable bits set and an interrupt enabled. (Pin #89=
 has an
> > interrupt but no wake bits =E2=80=94 not a wake source.)
> > * These wake bits have no ACPI owner: decompiling the DSDT and all 16
> > SSDTs yields zero GpioInt / GpioIo / _AEI resources. Nothing in ACPI
> > references these pins.
>
> At least for AMD this is specifically more common in systems that
> support S3 (no _AEI resources).
>
> > * Empirically: suspend instant=E2=80=91wakes only when an external disp=
lay is
> > connected (reproduced over both HDMI and USB=E2=80=91C/DP); with no dis=
play,
> > suspend holds. In the HDMI case, pin #4 is the one that latches the
> > wake.
> > * Clearing the S=E2=80=91state wake=E2=80=91enable bits (13/14/15) on p=
ins #2 and #4
> > fixes it (verified across multiple suspends). Interrupt=E2=80=91enable =
bits
> > left intact; no other wake source touched.
> > * GPIO #131 is the actual monitor=E2=80=91presence line =E2=80=94 its l=
evel cleanly
> > tracks plug/unplug (active=E2=80=91low: LOW when a monitor is attached,=
 HIGH
> > when not, confirmed across plug=E2=86=92unplug=E2=86=92replug). But #13=
1 has no
> > interrupt and no wake bits =E2=80=94 it does not wake the system.
> > * Pins #2 and #4 do not change level when the monitor is
> > plugged/unplugged (both steady while awake).
> >
> > What I am inferring (not proven):
> > * Because #4's level is steady while awake yet the wake only occurs
> > with a display connected, my working model is that #4 transitions
> > during the dGPU's suspend power=E2=80=91down sequence, and that transit=
ion
> > only happens when the dGPU was actively driving an external display.
> > This is a plausible explanation of the display correlation, not a
> > verified one.
> > * The precise electrical function of pins #2/#4 is unknown without
> > schematics or a scope. They are not the monitor=E2=80=91presence/HPD li=
ne
> > (that is the unarmed #131). I previously guessed "HPD"; the #131 data
> > contradicts that, so I'm withdrawing it.
> >
> > Unknown: what #2/#4 physically are, and why the firmware arms them as
> > sleep wake sources with no ACPI description.
> >
> > Net: a bare, firmware=E2=80=91armed pinctrl-amd wake pin with no ACPI
> > description, which no existing in=E2=80=91tree mechanism can disarm
> > (gpiolib_acpi.ignore_wake=3D needs an ACPI event; power/wakeup needs a
> > device owner; /dev/mem is blocked by IO_STRICT_DEVMEM).
> > ---
> >
> > I have not filed a bugzilla report yet.
> >
> > I hope I addressed your questions.
> >
> > On Wed, Jun 10, 2026 at 10:23=E2=80=AFPM Mario Limonciello
> > <mario.limonciello@amd.com> wrote:
> >>
> >>
> >>
> >> On 6/10/26 15:18, Lenart Kos wrote:
> >>> Thanks for taking your time for this. To answer your questions:
> >>>
> >>> S3 path:
> >>> AFAIK it was on [deep] since my system was installed and I strongly
> >>> remember being it as so, although it is possible that I misremembered
> >>> since I have been debugging this sleep issue since January. In any
> >>> case I have also tried setting sleep to [s2idle] before and it did no=
t
> >>> fix the waking issue even if set in s2 sleep mode.
> >>> The firmware is not modified, everything is installed from Fedora
> >>> sources without modification.
> >>
> >> Can you please check in Lenovo's BIOS setup if there is a sleep mode f=
or
> >> this platform?  If there isn't that's fine, I want to confirm what
> >> Lenovo actually presented before making further assumptions.
> >>
> >> If there is such a setting, what options does it offer?  If you change
> >> it does the behavior change?
> >>
> >> Furthermore if this issue is only happening when connected to the HDMI
> >> port, that's the one connected to NVIDIA, right?  Have you started a
> >> conversation with them?  Assuming the HPD theory that has been present=
ed
> >> is correct their driver should be in control of HPD behavior.
> >>
> >>>
> >>> Methodology:
> >>> Yes you are correct about LLMs, I have thrown every bit of my
> >>> knowledge and time that I have available for this without success and
> >>> Claude has finally solved this after a few months being irritated by
> >>> this. I had decided to forward most of the information I received fro=
m
> >>> LLM in the hopes it was useful to an expert in the area, but in
> >>> hindsight I can see this was a mistake without AI disclosure, I'm
> >>> sorry. So for your other questions regarding why this assumption was
> >>> made or why was something done a certain way - I don't know, but I am
> >>> willing to assist with testing. Apologies for this mess, it's my firs=
t
> >>> time filing a bug to the LKML.
> >>
> >> No worries; as long as I'm talking to a human about a problem not an
> >> LLM, I'm fine to work with you to see what we can come up with for a
> >> solution.
> >>
> >> I've got various inline comments/questions below.  Can you please
> >> address them?
> >>
> >>>
> >>> On Wed, Jun 10, 2026 at 9:59=E2=80=AFPM Mario Limonciello
> >>> <mario.limonciello@amd.com> wrote:
> >>>>
> >>>> First off -
> >>>>
> >>>> How did you get into an S3 path?  These systems that ship with only
> >>>> Modern Standby / s2idle normally shouldn't be able to get into S3.
> >>>>
> >>>> =E2=95=B0=E2=94=80=E2=9D=AF cat /sys/power/mem_sleep
> >>>> [s2idle]
> >>>>
> >>>> Have you modified the firmware in some way to try to enable an
> >>>> unvalidated path?
> >>>>
> >>>> I have some more questions about your methodology below because when
> >>>> debugging a kernel issue an LLM can sometimes make WILD assumptions =
that
> >>>> are totally a house of cards.
> >>>>
> >>>> On 6/10/26 14:32, Lenart Kos wrote:
> >>>>> ## Summary
> >>>>>
> >>>>> On the Lenovo Legion Pro 5 16ARX8, suspending (S3 *or* s2idle) with=
 an external
> >>>>> display connected resumes the machine after ~1 second. The wake is =
delivered by
> >>>>> the AMD GPIO controller (`pinctrl_amd`, IRQ 7) from GPIO pin **#4**
> >>>>> (and pin #2 for
> >>>>> the USB=E2=80=91C/DP path), which the **BIOS has armed as an S0i3/S=
3 wake
> >>>>> source directly
> >>>>> in the FCH GPIO register**, with **no ACPI description**
> >>>>> (`_AEI`/`GpioInt`/`_PRW`)
> >>>>> anywhere in the DSDT or the 16 SSDTs. Because there is no ACPI owne=
r,
> >>>>> none of the
> >>>>> existing override mechanisms (`gpiolib_acpi.ignore_wake=3D`, device
> >>>>> `power/wakeup`)
> >>>>> can reach it, and `IO_STRICT_DEVMEM` blocks any userspace register
> >>>>> write. The pin
> >>>>> is an external=E2=80=91display HPD line, so the edge produced while=
 the GPU
> >>>>> powers down on
> >>>>> the way into sleep immediately wakes the system.
> >>>>>
> >>>>> ## Affected system
> >>>>>
> >>>>> ```
> >>>>> DMI sys_vendor LENOVO
> >>>>> DMI product_name 82WM
> >>>>> DMI product_version Legion Pro 5 16ARX8
> >>>>> DMI board_name LNVNB161216
> >>>>> BIOS LPCN62WW (2025-06-17) # latest available; does NOT fix this
> >>>>> SoC AMD Ryzen 7 7745HX (Raphael), GPIO ctrl AMDI0030 @ 0xFED81500
> >>>>> GPU NVIDIA RTX 4060 Mobile (HDMI) + AMD Raphael iGPU (USB-C DP)
> >>>>> Kernel 6.17+ through 7.0.x (reproduced on Fedora 43/44)
> >>>>> ```
> >>>>>
> >>>>> ## Symptom / evidence
> >>>>>
> >>>>> Failed-suspend kernel log (verbose PM):
> >>>>> ```
> >>>>> PM: suspend entry (deep)
> >>>>> ...
> >>>>> amd_gpio AMDI0030:00: ... Clearing debounce for GPIO #2 during susp=
end.
> >>>>> amd_gpio AMDI0030:00: ... Clearing debounce for GPIO #4 during susp=
end.
> >>>>> amd_gpio AMDI0030:00: ... Disabling GPIO #89 interrupt for suspend.=
 #
> >>>>> not a wake src
> >>>>> ACPI: PM: Preparing to enter system sleep state S3
> >>>>> Timekeeping suspended for 1.384 seconds
> >>>>> PM: Triggering wakeup from IRQ 7 # IRQ 7 =3D pinctrl_amd
> >>>>> ...
> >>>>> GPIO 4 is active: 0x30057c00 # bit 14 (WAKE_CNTRL_S3) + bit 29 (wak=
e latched)
> >>>>> ```
> >>>>> `/sys/power/pm_wakeup_irq` =3D `7`.
> >>>>>
> >>>>> `/sys/kernel/debug/gpio` (relevant rows) shows pins #2 and #4 armed=
 for S0i3+S3
> >>>>> wake with their interrupt enabled, while #89 has no wake bits:
> >>>>> ```
> >>>>> #2 =F0=9F=98=9B| =E2=86=93 | edge |=E2=8F=B0|=E2=8F=B0| | | ... 0x1=
47ae0
> >>>>> #4 =F0=9F=98=9B| b | edge |=E2=8F=B0|=E2=8F=B0| | | ... 0x57ce0 <- =
both-edge HPD, S0i3+S3 wake set
> >>>>
> >>>> How did you determine this is an HPD line?  Is that a pure guess?  O=
r
> >>>> did you look at a schematic/trace etc?
> >>>>
> >>>>> #89 =F0=9F=98=9B| =E2=86=93 | level| | | | | ... 0x151b00 <- no wak=
e bits (red herring)
> >>>>> ```
> >>>>>
> >>>>> ## Root cause
> >>>>>
> >>>>> 1. The external=E2=80=91display HPD lines are routed to SoC GPIO #2=
 (USB=E2=80=91C/DP) and #4
> >>>>> (HDMI/dGPU).
> >>>>
> >>>> How do you know?
> >>>>
> >>>>> 2. The BIOS sets `WAKE_CNTRL_S0I3`/`WAKE_CNTRL_S3` (bits 13/14) on
> >>>>> those pins in the
> >>>>> FCH GPIO register block and **never describes them in ACPI** =E2=80=
=94 decompiling the
> >>>>> DSDT and all 16 SSDTs yields **zero** `GpioInt`/`GpioIo`/`_AEI` res=
ources.
> >>>>> 3. `pinctrl_amd` correctly preserves hardware-armed wake pins acros=
s
> >>>>> suspend, so the
> >>>>> HPD edge generated during the suspend transition wakes the system i=
mmediately.
> >>>>>
> >>>>> This is effectively an unvalidated firmware S3 path (the platform s=
hips as
> >>>>> Modern-Standby-only); but note **both** the S0i3 and S3 wake bits a=
re set, so
> >>>>> s2idle is affected too.
> >>>>
> >>>> So how did you get into S3?
> >>>>
> >>>>>
> >>>>> ## Why existing mechanisms don't help
> >>>>>
> >>>>> - `/proc/acpi/wakeup`, PCI/ACPI `power/wakeup` =E2=80=94 wrong laye=
r; this is
> >>>>> not a PCIe PME.
> >>>>> Disabling wakeup on the GPP bridges / GPU has no effect (verified).
> >>>>> - `gpiolib_acpi.ignore_wake=3D` / `ignore_interrupt=3D` =E2=80=94 o=
nly match
> >>>>> **ACPI-declared**
> >>>>> GPIO events; this pin has no ACPI declaration, so they cannot targe=
t it.
> >>>>> - `/dev/mem` register write =E2=80=94 blocked by `CONFIG_IO_STRICT_=
DEVMEM=3Dy`
> >>>>> (the region is
> >>>>> claimed by pinctrl_amd).
> >>>>>
> >>>>> There is currently **no way, in-tree, to disarm a bare (non-ACPI) f=
irmware-armed
> >>>>> pinctrl-amd wake pin.** That is the gap.
> >>>>>
> >>>>> ## Suggested fix (maintainers' choice)
> >>>>>
> >>>>> A working out-of-tree reference implementation (clears bits 13/14/1=
5
> >>>>> on pins #2/#4
> >>>>> at probe and on `PM_SUSPEND_PREPARE`) is here:
> >>>>> **https://github.com/Lenart12/legion-nowake** =E2=80=94 please feel=
 free to reuse.
> >>>>
> >>>> Why not use /dev/gpiochipX devices to change GPIOs?
> >>>>
> >>>>>
> >>>>> Possible in-tree directions:
> >>>>> 1. **DMI-matched quirk in `pinctrl-amd`** that clears the S-state
> >>>>> wake-enable bits
> >>>>> for the affected pins at probe (smallest change; precedent exists f=
or AMD GPIO
> >>>>> wake quirks).
> >>>>> 2. **A generic override** for bare pins, e.g. a
> >>>>> `pinctrl_amd.ignore_wake=3D<pin,...>`
> >>>>> module parameter, analogous to `gpiolib_acpi.ignore_wake=3D` but fo=
r
> >>>>> hardware-armed
> >>>>> pins without ACPI events. This would help the broader class of AMD =
laptops that
> >>>>> hit firmware-armed spurious wakes.
> >>>>>
> >>>>> ## Reproduction
> >>>>>
> >>>>> 1. AMD laptop where a display HPD is wired to a GPIO the BIOS arms =
for wake.
> >>>>> 2. Connect an external monitor, `systemctl suspend`.
> >>>>> 3. Observe resume after ~1s; `pm_wakeup_irq` =3D the `pinctrl_amd` =
IRQ;
> >>>>> the offending
> >>>>> pin shows `wake latched` in the post-resume `GPIO N is active` log.
> >>>>
> >>>> On the presumption that this is correct about being an HPD pin doesn=
't
> >>>> this actually point at a GPU driver bug?
> >>>>
> >>>>>
> >>>>> ## Public discussion / full diagnostics
> >>>>>
> >>>>> Fedora Discussion (complete diagnostic walkthrough, ACPI dumps, gpi=
o table):
> >>>>> https://discussion.fedoraproject.org/t/immediate-wake-from-s3-sleep=
-when-hdmi-is-connected-irq-7-pinctrl-amd
> >>>>>
> >>>>> ## Attachments to include when filing
> >>>>>
> >>>>> - `acpidump` output (or note: DSDT + all SSDTs contain no GpioInt/_=
AEI).
> >>>>> - Full verbose-PM `dmesg` of one failed suspend (`pm_debug_messages=
=3D1`).
> >>>>> - `sudo cat /sys/kernel/debug/gpio`.
> >>>>> - `cat /sys/class/dmi/id/{sys_vendor,product_name,product_version,b=
oard_name,bios_version}`.
> >>>>
> >>>> Where is the kernel bugzilla that you attached all these artifacts?
> >>>>
> >>>
> >>>
> >>
> >
> >
>


--=20
Lep pozdrav,
Lenart Arvo Kos

