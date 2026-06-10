Return-Path: <linux-gpio+bounces-38294-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LcfABT7VKWpXeAMAu9opvQ
	(envelope-from <linux-gpio+bounces-38294-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 23:21:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CCE66D101
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 23:21:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=QmrkxRF6;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38294-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38294-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8B33A300A64B
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 21:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C5023ABD91;
	Wed, 10 Jun 2026 21:20:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27998346791
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 21:20:51 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781126454; cv=pass; b=A+ZVUdhqVpFgu2fRlwMDHJanFjm/Y0fdWH+fyyvDBmbfB61niI6R3PH0ITPiN6sWH/8BwfmAKKoY3yTIDvDDF3sveQ2VTziRTG1OIic8fQXjB8D7xY3v26KjWXfc25tORcnvSEnOui7ucTa9VfO/8FZoPVkt42dowpiivZBRqIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781126454; c=relaxed/simple;
	bh=kZ/h7s0QKrVqCDG88jTuzopNiMrSDuzysn1W6V5Wi5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b+gUdYwMbuTgxZ97K9XFVWC6dg0qoptCRr7cbGz0ZHdD97cmXYh295SHI4uJYJflUvr96UcOkw7pZV2sLllsE/1lcCr1Z0Fvs17ny6zZt5nE13gcHgt2QG5aDL7E2Lrn+MkFVzrM5xz423IpXGwja21DSzxRE7mE5i1iA5QIBPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QmrkxRF6; arc=pass smtp.client-ip=209.85.210.170
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84234c83142so3058378b3a.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 14:20:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781126451; cv=none;
        d=google.com; s=arc-20240605;
        b=kv/LNuoTz5CcbcjRzP3hRZn8myhsmf4zHnhD6RhckX9Ybwbmf3faqVznHWV/PIMr71
         N84mE7vfLHNcUuTvqJQUnkGAAWoX+KNSOXfH5N/456E/6aao01pZe1qADHEaFx70odAM
         CFJzVQ6Nd8Z/BP07bdvfv6XnbkuhvubX1qywst4iXTldw99Q1HK7jd67XzVn9BtMQO31
         MPUR8ZwOPHTz0Gxq6bDHQoq6WnNjZoYnsTmKX7256AinbcSLTwnIguJLCpSoFeHsmTQ4
         zre5X8wX8/aRKz7sY4lzv0uVmXf9hF/kyRI+9PezwgP7POyBvCbwvURO959XPixOYODk
         NZXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FkDjXc3gIUMpsaf8DKZKBhFvjDNJW75eyNisA5Kcxqs=;
        fh=dMrT5iYY3lAfWjCnRkECIxawvHHtKZeepocyeu0SvnQ=;
        b=XFdxMroEGcpi5++O0E7gMSN6YeNZVhptveBRLfBv8vWeULmhtELD37ozs+RikduNmT
         HCoZinZOHPHeT2n6cv8UxyGN7mUxw7BWUErI4oG6HbjynGZ9Z3/mr/aO6AEmqN2QGug+
         +1XIl+6oYF3qLjmoiB9LINwXR1zh8NDYuwieZKExgb2Y3HKszo3lATxq3JpPYry6BSyY
         qXa/1ls1yPivgXIedQy2PElM5L1b2lcWKTiMIYtFye7v+YyT5ZVtfh/kxcJ8+E7sHyNM
         rHBAK0vM6YY5S2jRSeFc0cjBsGu4pkdvGTrp0biXQ29PCmSOqce6f4emVlH7KBG2l+eu
         nnoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781126451; x=1781731251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FkDjXc3gIUMpsaf8DKZKBhFvjDNJW75eyNisA5Kcxqs=;
        b=QmrkxRF6ZT5VZaEO9of2RUqHTgXpyBRiVbgaqekWdZ9DaO7jllzj5OwXG2uxf5MLJ1
         iPpF7YnCQBUyQfUIQVe20Vq48CpRHusRlXjGVVJROai5gE/9Kjl1Y6j4/tgigJWaNXSS
         k/aAjlk+sDGdUB5wAU5sAmIl111ds3IRbTxC2DcVkxYY1dmHc0LHDL9mvJV5R9jqQEKu
         1k5KaFJCMnKuWQ/nJUaJaS+nOL1ywhWw7ioYY2S7/DVghi+fAz8haAtksjhS8UaqqcDD
         3H+AoCH5/06Fe6pwLOxjJ9YPtwHcr0sCJaEa4TkNbaES6f7JCDk7HaYrq/ghaQiPefpV
         F7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781126451; x=1781731251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FkDjXc3gIUMpsaf8DKZKBhFvjDNJW75eyNisA5Kcxqs=;
        b=FCN1s8LsT/IAPdQ+/CPZxUoMTzuSF8TM8onuxoDI7p9Fdtrja38k4KvUJ0GAMLCqVb
         QqqR8VC6zPOTszMQkI6gjowjFi4x75uv584aXXnK4Zp4G8AXewnI86Y6Yy9VTT5XdoZC
         Xq1XSojYwl7kR60sf1YPr0mPDEB27+S61Xjft17PpP4osA8xX/1HDEWEA2qgjHryHvlt
         zI6RH848s6kjHVOmaVyQLHHTjIHC3dDLUb9I+ClsC50J+Pl35cZ3SGpu/VcDMZr/o2FT
         dNRfAnHamO7U67i+FlTn0u0ymyn9G9EZ2lnKCQ4k5VwVQJg6WBOIjkcFspMB7JBgOvLD
         TeNA==
X-Forwarded-Encrypted: i=1; AFNElJ8CROFG8MDsrb2tyLc6HwAf1Ps7ed8JOfsE6Xcz4HOeqJz/kJggTRHUqV6504jbu03qtqiyxunRRrL8@vger.kernel.org
X-Gm-Message-State: AOJu0YxLrWqSat0sersT4ajxEzOaX4iDL2na6gik40iwJ7LkutuMBLtn
	J7By+RaGjhQGMlmMldsCVQsJ68ZoljTd0gNOq5ItW0wOL8CcA4nKsTcpuCDPoeCrN4MkRL6DUhG
	pOaCDpvlDJPfsvz2Wbhxk6+wArA6d6SQ=
X-Gm-Gg: Acq92OGi4v+e5o64UuVBJVoUkcoWquXaFQU46KrPD9l0VzN1FRen2uSweW/aDBqj65g
	NltoGY9TJvczw4yI9sF8X0jXQ1x8pP6VSTsyC33BHbCZgO1HjyTalBJFtuSoDHmjVFzpUg2PddI
	gPvLLM0KQDF1sGSdjOgoKxLA55XEFET3uR/L5/Pqml9bWd+jPosD0Q+725X502xu+0MvwL2VgOW
	ib3UK+7qsYBhVflD6B9vA39hTV6lbxrduBixSmJkASfPS0HjnG+PzonyJnnGaKqJN6BVaCR9qq/
	xuWzJ5a1hY6DhDGSKHa0OOB8k7B/RF0njfgcskPrZRnRLmj+XLk1KVXiiqNHnZh6i9XNeBvKVgl
	Edo29YeIUIQ+Au0XG83rB5CZ9SIVudYsW3j8=
X-Received: by 2002:a05:6a00:b911:b0:842:6849:2180 with SMTP id
 d2e1a72fcca58-842b0fbb5ffmr24171655b3a.37.1781126451307; Wed, 10 Jun 2026
 14:20:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFdvZNt+mRTE9Q+utn=T8GzU7s_09ULhUtzTMMa9dgGCsE+r9A@mail.gmail.com>
 <c982caf3-f855-41ad-80cd-3ce9598913ab@amd.com> <CAFdvZNs9jNxnqqaPhDXBt555hqgTHQizV4ORPp_8xg1D=XD4TA@mail.gmail.com>
 <44bd3c12-b8d6-45c8-a7cf-12ea47716461@amd.com>
In-Reply-To: <44bd3c12-b8d6-45c8-a7cf-12ea47716461@amd.com>
From: Lenart Kos <koslenart@gmail.com>
Date: Wed, 10 Jun 2026 23:20:39 +0200
X-Gm-Features: AVVi8CcyYq3w30_X_nrZfw8uMliv6NRs0ItHiIo7T54aUztKKw_viGbkGK7JPt0
Message-ID: <CAFdvZNvWSVCphSyQCVNHx7j0WApsbr0KekVsA-rVLO0eqV0X9w@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-38294-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,amd.com:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 54CCE66D101

I have checked all the bios settings and the closest to modifying
sleep behaviour was a setting that enables opening the lid turning on
the laptop which was already disabled, so no, there are no sleep
settings.

Regarding the HDMI port, it is connected to the Nvidia card. Only the
built-in screen is connected to the AMD card with eDP. I have not
reported this anywhere else yet, only here and the before mentioned
forum post. If this is an Nvidia issue I can report it to them as
well.

The HPD theory is pure guesswork done by LLM. What I can be certain of
is that disabling those specific pins
(https://github.com/Lenart12/legion-nowake/blob/6b599aad7afd1431e8104827310=
6c5526561764b/legion_nowake.c#L59-L62)
did solve the problem, as to why and in what way, I would not bet on.
So the statements about HPD and your questions about them are maybe in
vain. What would be the best way to figure out if HPD is actually
attached to those pins?

FWIW I think that it is in fact not HPD as I have checked the GPIO
states when the monitor cable is connected or not and it seems to be
gpio #131 not #2 or #4. I have asked Claude to expand on what it knows
and what it assumes, this may be of help to you:
---
What I have measured (facts):
* The resume is triggered by the AMD GPIO controller:
/sys/power/pm_wakeup_irq =3D 7 (pinctrl_amd), and the post=E2=80=91resume l=
og
shows GPIO 4 is active: 0x30057c00 with the wake=E2=80=91status bit latched
and the S3 wake=E2=80=91enable bit (bit 14) set.
* In /sys/kernel/debug/gpio, pins #2 and #4 are the only pins with
S0i3/S3 wake=E2=80=91enable bits set and an interrupt enabled. (Pin #89 has=
 an
interrupt but no wake bits =E2=80=94 not a wake source.)
* These wake bits have no ACPI owner: decompiling the DSDT and all 16
SSDTs yields zero GpioInt / GpioIo / _AEI resources. Nothing in ACPI
references these pins.
* Empirically: suspend instant=E2=80=91wakes only when an external display =
is
connected (reproduced over both HDMI and USB=E2=80=91C/DP); with no display=
,
suspend holds. In the HDMI case, pin #4 is the one that latches the
wake.
* Clearing the S=E2=80=91state wake=E2=80=91enable bits (13/14/15) on pins =
#2 and #4
fixes it (verified across multiple suspends). Interrupt=E2=80=91enable bits
left intact; no other wake source touched.
* GPIO #131 is the actual monitor=E2=80=91presence line =E2=80=94 its level=
 cleanly
tracks plug/unplug (active=E2=80=91low: LOW when a monitor is attached, HIG=
H
when not, confirmed across plug=E2=86=92unplug=E2=86=92replug). But #131 ha=
s no
interrupt and no wake bits =E2=80=94 it does not wake the system.
* Pins #2 and #4 do not change level when the monitor is
plugged/unplugged (both steady while awake).

What I am inferring (not proven):
* Because #4's level is steady while awake yet the wake only occurs
with a display connected, my working model is that #4 transitions
during the dGPU's suspend power=E2=80=91down sequence, and that transition
only happens when the dGPU was actively driving an external display.
This is a plausible explanation of the display correlation, not a
verified one.
* The precise electrical function of pins #2/#4 is unknown without
schematics or a scope. They are not the monitor=E2=80=91presence/HPD line
(that is the unarmed #131). I previously guessed "HPD"; the #131 data
contradicts that, so I'm withdrawing it.

Unknown: what #2/#4 physically are, and why the firmware arms them as
sleep wake sources with no ACPI description.

Net: a bare, firmware=E2=80=91armed pinctrl-amd wake pin with no ACPI
description, which no existing in=E2=80=91tree mechanism can disarm
(gpiolib_acpi.ignore_wake=3D needs an ACPI event; power/wakeup needs a
device owner; /dev/mem is blocked by IO_STRICT_DEVMEM).
---

I have not filed a bugzilla report yet.

I hope I addressed your questions.

On Wed, Jun 10, 2026 at 10:23=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
>
>
> On 6/10/26 15:18, Lenart Kos wrote:
> > Thanks for taking your time for this. To answer your questions:
> >
> > S3 path:
> > AFAIK it was on [deep] since my system was installed and I strongly
> > remember being it as so, although it is possible that I misremembered
> > since I have been debugging this sleep issue since January. In any
> > case I have also tried setting sleep to [s2idle] before and it did not
> > fix the waking issue even if set in s2 sleep mode.
> > The firmware is not modified, everything is installed from Fedora
> > sources without modification.
>
> Can you please check in Lenovo's BIOS setup if there is a sleep mode for
> this platform?  If there isn't that's fine, I want to confirm what
> Lenovo actually presented before making further assumptions.
>
> If there is such a setting, what options does it offer?  If you change
> it does the behavior change?
>
> Furthermore if this issue is only happening when connected to the HDMI
> port, that's the one connected to NVIDIA, right?  Have you started a
> conversation with them?  Assuming the HPD theory that has been presented
> is correct their driver should be in control of HPD behavior.
>
> >
> > Methodology:
> > Yes you are correct about LLMs, I have thrown every bit of my
> > knowledge and time that I have available for this without success and
> > Claude has finally solved this after a few months being irritated by
> > this. I had decided to forward most of the information I received from
> > LLM in the hopes it was useful to an expert in the area, but in
> > hindsight I can see this was a mistake without AI disclosure, I'm
> > sorry. So for your other questions regarding why this assumption was
> > made or why was something done a certain way - I don't know, but I am
> > willing to assist with testing. Apologies for this mess, it's my first
> > time filing a bug to the LKML.
>
> No worries; as long as I'm talking to a human about a problem not an
> LLM, I'm fine to work with you to see what we can come up with for a
> solution.
>
> I've got various inline comments/questions below.  Can you please
> address them?
>
> >
> > On Wed, Jun 10, 2026 at 9:59=E2=80=AFPM Mario Limonciello
> > <mario.limonciello@amd.com> wrote:
> >>
> >> First off -
> >>
> >> How did you get into an S3 path?  These systems that ship with only
> >> Modern Standby / s2idle normally shouldn't be able to get into S3.
> >>
> >> =E2=95=B0=E2=94=80=E2=9D=AF cat /sys/power/mem_sleep
> >> [s2idle]
> >>
> >> Have you modified the firmware in some way to try to enable an
> >> unvalidated path?
> >>
> >> I have some more questions about your methodology below because when
> >> debugging a kernel issue an LLM can sometimes make WILD assumptions th=
at
> >> are totally a house of cards.
> >>
> >> On 6/10/26 14:32, Lenart Kos wrote:
> >>> ## Summary
> >>>
> >>> On the Lenovo Legion Pro 5 16ARX8, suspending (S3 *or* s2idle) with a=
n external
> >>> display connected resumes the machine after ~1 second. The wake is de=
livered by
> >>> the AMD GPIO controller (`pinctrl_amd`, IRQ 7) from GPIO pin **#4**
> >>> (and pin #2 for
> >>> the USB=E2=80=91C/DP path), which the **BIOS has armed as an S0i3/S3 =
wake
> >>> source directly
> >>> in the FCH GPIO register**, with **no ACPI description**
> >>> (`_AEI`/`GpioInt`/`_PRW`)
> >>> anywhere in the DSDT or the 16 SSDTs. Because there is no ACPI owner,
> >>> none of the
> >>> existing override mechanisms (`gpiolib_acpi.ignore_wake=3D`, device
> >>> `power/wakeup`)
> >>> can reach it, and `IO_STRICT_DEVMEM` blocks any userspace register
> >>> write. The pin
> >>> is an external=E2=80=91display HPD line, so the edge produced while t=
he GPU
> >>> powers down on
> >>> the way into sleep immediately wakes the system.
> >>>
> >>> ## Affected system
> >>>
> >>> ```
> >>> DMI sys_vendor LENOVO
> >>> DMI product_name 82WM
> >>> DMI product_version Legion Pro 5 16ARX8
> >>> DMI board_name LNVNB161216
> >>> BIOS LPCN62WW (2025-06-17) # latest available; does NOT fix this
> >>> SoC AMD Ryzen 7 7745HX (Raphael), GPIO ctrl AMDI0030 @ 0xFED81500
> >>> GPU NVIDIA RTX 4060 Mobile (HDMI) + AMD Raphael iGPU (USB-C DP)
> >>> Kernel 6.17+ through 7.0.x (reproduced on Fedora 43/44)
> >>> ```
> >>>
> >>> ## Symptom / evidence
> >>>
> >>> Failed-suspend kernel log (verbose PM):
> >>> ```
> >>> PM: suspend entry (deep)
> >>> ...
> >>> amd_gpio AMDI0030:00: ... Clearing debounce for GPIO #2 during suspen=
d.
> >>> amd_gpio AMDI0030:00: ... Clearing debounce for GPIO #4 during suspen=
d.
> >>> amd_gpio AMDI0030:00: ... Disabling GPIO #89 interrupt for suspend. #
> >>> not a wake src
> >>> ACPI: PM: Preparing to enter system sleep state S3
> >>> Timekeeping suspended for 1.384 seconds
> >>> PM: Triggering wakeup from IRQ 7 # IRQ 7 =3D pinctrl_amd
> >>> ...
> >>> GPIO 4 is active: 0x30057c00 # bit 14 (WAKE_CNTRL_S3) + bit 29 (wake =
latched)
> >>> ```
> >>> `/sys/power/pm_wakeup_irq` =3D `7`.
> >>>
> >>> `/sys/kernel/debug/gpio` (relevant rows) shows pins #2 and #4 armed f=
or S0i3+S3
> >>> wake with their interrupt enabled, while #89 has no wake bits:
> >>> ```
> >>> #2 =F0=9F=98=9B| =E2=86=93 | edge |=E2=8F=B0|=E2=8F=B0| | | ... 0x147=
ae0
> >>> #4 =F0=9F=98=9B| b | edge |=E2=8F=B0|=E2=8F=B0| | | ... 0x57ce0 <- bo=
th-edge HPD, S0i3+S3 wake set
> >>
> >> How did you determine this is an HPD line?  Is that a pure guess?  Or
> >> did you look at a schematic/trace etc?
> >>
> >>> #89 =F0=9F=98=9B| =E2=86=93 | level| | | | | ... 0x151b00 <- no wake =
bits (red herring)
> >>> ```
> >>>
> >>> ## Root cause
> >>>
> >>> 1. The external=E2=80=91display HPD lines are routed to SoC GPIO #2 (=
USB=E2=80=91C/DP) and #4
> >>> (HDMI/dGPU).
> >>
> >> How do you know?
> >>
> >>> 2. The BIOS sets `WAKE_CNTRL_S0I3`/`WAKE_CNTRL_S3` (bits 13/14) on
> >>> those pins in the
> >>> FCH GPIO register block and **never describes them in ACPI** =E2=80=
=94 decompiling the
> >>> DSDT and all 16 SSDTs yields **zero** `GpioInt`/`GpioIo`/`_AEI` resou=
rces.
> >>> 3. `pinctrl_amd` correctly preserves hardware-armed wake pins across
> >>> suspend, so the
> >>> HPD edge generated during the suspend transition wakes the system imm=
ediately.
> >>>
> >>> This is effectively an unvalidated firmware S3 path (the platform shi=
ps as
> >>> Modern-Standby-only); but note **both** the S0i3 and S3 wake bits are=
 set, so
> >>> s2idle is affected too.
> >>
> >> So how did you get into S3?
> >>
> >>>
> >>> ## Why existing mechanisms don't help
> >>>
> >>> - `/proc/acpi/wakeup`, PCI/ACPI `power/wakeup` =E2=80=94 wrong layer;=
 this is
> >>> not a PCIe PME.
> >>> Disabling wakeup on the GPP bridges / GPU has no effect (verified).
> >>> - `gpiolib_acpi.ignore_wake=3D` / `ignore_interrupt=3D` =E2=80=94 onl=
y match
> >>> **ACPI-declared**
> >>> GPIO events; this pin has no ACPI declaration, so they cannot target =
it.
> >>> - `/dev/mem` register write =E2=80=94 blocked by `CONFIG_IO_STRICT_DE=
VMEM=3Dy`
> >>> (the region is
> >>> claimed by pinctrl_amd).
> >>>
> >>> There is currently **no way, in-tree, to disarm a bare (non-ACPI) fir=
mware-armed
> >>> pinctrl-amd wake pin.** That is the gap.
> >>>
> >>> ## Suggested fix (maintainers' choice)
> >>>
> >>> A working out-of-tree reference implementation (clears bits 13/14/15
> >>> on pins #2/#4
> >>> at probe and on `PM_SUSPEND_PREPARE`) is here:
> >>> **https://github.com/Lenart12/legion-nowake** =E2=80=94 please feel f=
ree to reuse.
> >>
> >> Why not use /dev/gpiochipX devices to change GPIOs?
> >>
> >>>
> >>> Possible in-tree directions:
> >>> 1. **DMI-matched quirk in `pinctrl-amd`** that clears the S-state
> >>> wake-enable bits
> >>> for the affected pins at probe (smallest change; precedent exists for=
 AMD GPIO
> >>> wake quirks).
> >>> 2. **A generic override** for bare pins, e.g. a
> >>> `pinctrl_amd.ignore_wake=3D<pin,...>`
> >>> module parameter, analogous to `gpiolib_acpi.ignore_wake=3D` but for
> >>> hardware-armed
> >>> pins without ACPI events. This would help the broader class of AMD la=
ptops that
> >>> hit firmware-armed spurious wakes.
> >>>
> >>> ## Reproduction
> >>>
> >>> 1. AMD laptop where a display HPD is wired to a GPIO the BIOS arms fo=
r wake.
> >>> 2. Connect an external monitor, `systemctl suspend`.
> >>> 3. Observe resume after ~1s; `pm_wakeup_irq` =3D the `pinctrl_amd` IR=
Q;
> >>> the offending
> >>> pin shows `wake latched` in the post-resume `GPIO N is active` log.
> >>
> >> On the presumption that this is correct about being an HPD pin doesn't
> >> this actually point at a GPU driver bug?
> >>
> >>>
> >>> ## Public discussion / full diagnostics
> >>>
> >>> Fedora Discussion (complete diagnostic walkthrough, ACPI dumps, gpio =
table):
> >>> https://discussion.fedoraproject.org/t/immediate-wake-from-s3-sleep-w=
hen-hdmi-is-connected-irq-7-pinctrl-amd
> >>>
> >>> ## Attachments to include when filing
> >>>
> >>> - `acpidump` output (or note: DSDT + all SSDTs contain no GpioInt/_AE=
I).
> >>> - Full verbose-PM `dmesg` of one failed suspend (`pm_debug_messages=
=3D1`).
> >>> - `sudo cat /sys/kernel/debug/gpio`.
> >>> - `cat /sys/class/dmi/id/{sys_vendor,product_name,product_version,boa=
rd_name,bios_version}`.
> >>
> >> Where is the kernel bugzilla that you attached all these artifacts?
> >>
> >
> >
>


--=20
Lep pozdrav,
Lenart Arvo Kos

