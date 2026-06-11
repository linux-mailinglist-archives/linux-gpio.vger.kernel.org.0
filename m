Return-Path: <linux-gpio+bounces-38310-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sI+8ENdsKmqZpAMAu9opvQ
	(envelope-from <linux-gpio+bounces-38310-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 10:07:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A5E66FB31
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 10:07:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="l/DgeJNj";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38310-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38310-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AACAD301FD5F
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 08:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFE493769E4;
	Thu, 11 Jun 2026 08:07:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C083644BC
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 08:07:44 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781165266; cv=pass; b=Sh7pKujO40dFmcJPX8M/z2FYvrIgnIb1OC2M0oVuInpNLQZt/oo4uB5jo1soZcMLQvasjuxJ+pTUiFbj5zBY0a76y1K/balKWuxXdSzx9TuRoIAvYGRIX7vW0W17lAitGhs4EkPMQngfsMpIAdNPAsz6uI+lXu0uXEA9KE3ksns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781165266; c=relaxed/simple;
	bh=1EJKFfm2cWpI20k6llE5ECWRFvJtYJpL8rp9iftzdcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DpsbvrtqaD4uI4gUCDtgFiyb6fG9SqPY8Ka/SM/9uqAyrFJbwpEwqpnsNEz7wH/Upw5ezUrCxiZjG6W/iYq7rknr8ExdBKXzecU/5Ty0nueVaGRYoT8KpuyplR+dWhh4Gu6Lgo/H0cwrK8wjDob1WNUyuRjc1lfTgtVKAyz3BIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/DgeJNj; arc=pass smtp.client-ip=209.85.216.42
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36b9ec98144so6440494a91.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 01:07:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781165264; cv=none;
        d=google.com; s=arc-20240605;
        b=XM3fmyHPfZ6osCwOm3digytecaIwZbs5507QMXHvDRpKfAQM4zD1VrLKTnDe+PrLVY
         m7uvTyoX6S8jt0rR5mGzkWTNCTTu66/G1ek3C2XEGmFYBG3Bhyw9qRXQUv/gfMKsWHIs
         6Xt94t76qa9/m3VZFiaVC+83S3hEfS0h5Q7TL/V7b334fUbvz/gwu4dnoHhyYhinkW9T
         YMZP838qHaIMqhLXzebLDUzNXWfPkhmxsdaF8Xd+F3B15f9t0VEjGyAfBYpa/A0OGk4j
         Uym5UUEHb7UF3kJkIpyFq5ynOCrLM+Sz25fu4p8JaLcXjk0f98R8NGQgtL6W3andHNRN
         sN+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BJnuUNmXL3rt10UviD+v7GAhDz5y8TjGNaISvDTs7hU=;
        fh=JC06UwIpHK5wz8xTvROU43HJLC/icby3q9DmEhTYPII=;
        b=egUEh8u9ky3YBs7FZk7ov45X2BHZsi0wzvZDBhHzUiXB6n2PlPUiamlxBpjkGnPDwo
         HO20cb5Gr46Dz77JpANctQsU52IMeJwViifOfS5nBAhkl0A6XaxvMtcJCw/y9L41xfd8
         7/2P2J1qbZatskx/z8T+uSG0SPLXicBp3iRWX8fX5I01tnZNbskSMNTjOA4Z+NBhwmGV
         oW9q+h5DDkeURNk/ctQOjTRh9wR7PvTBXEsLHtz56L4yP43MdzRmxAwK9hKQgt6DmC+n
         Zxck3EYKEe1QewB1oYyhuUtTVYtfuj/EdVzt2XYQbCIdtQLw/R8q9WpQFBN19GcWj8se
         yK0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781165264; x=1781770064; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJnuUNmXL3rt10UviD+v7GAhDz5y8TjGNaISvDTs7hU=;
        b=l/DgeJNju29rur4cc7vi1HRujZFYsfSeTOjOuvpi5SkIQQdS+Ohl4NDup6q3RAeVVr
         nshb8G/IEffOG1+SoTAhdzmL6VAOm/karQkTegBvKtX+ob45xlKO1zPvUdKtc+Q3VyNq
         eNWjG1ZsQiMmoxFfPtOF/QolLMTI2hZ7UV5KsbPGfpqc5+unmF2cxfnrL8yI11uXQHvV
         D/Gtr7kqPLcC8wEo5djqw10EY7ZX5tDsosTjXL8Wt8+rREUcVdlu4WB7tWIA0Wwx1NEQ
         3w1/BGdtuf8Df3/f/0+VrUbm9qJIGIaw9yizz+6tiIhdup5T6aqQKl1JB1lsyBQs0a5j
         WKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781165264; x=1781770064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BJnuUNmXL3rt10UviD+v7GAhDz5y8TjGNaISvDTs7hU=;
        b=tB/8lpA0YjoUvLmYDn2CiEkUpT2AqxXlh77gsiv2BEhlcTnx0N1TE7F+p+vkV9t4nY
         VEhT5HAu3SXP3YtYWOb1uo0qJyc1VMbHFy1M9RGPXlbpnBZrw7Nw8Dq2niKXDPoQmpu0
         sfayzNdp+blF8ZNYPHlPkcRYBnU66iJlGFKO9xA5LChD9Lcj7IY+NB9DE3+ZSNWJhxg/
         eOexcmhCXR8i6du8FCbaOMkBE2BiqNh4UFw3znZGHzgZHOX22LLeimT59kdZMWKuot/W
         di+Za9LO2hLL+U3JBO5BRxMN4qBOjkGI8RvZz1V2OeP0NrkZaYSj7doEAJ1eJBAYahdO
         X9BQ==
X-Forwarded-Encrypted: i=1; AFNElJ/zoFXGU67QzgmLp8sD0Ea+fQ468DjS18HHT6wm6k5CqY8fc4n3gtkL0B+1HTbG5ATEif1NilYYh3gS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz28VgRr4+poWftp43JYdkKqo4y9ZUL/UgNj6h+lwPzVJQBFhUc
	aKoP1PjqDfmESn5fuThIjBd9BKTJW14NfsxoAL1GQd0Mv5j1hCWFhls30ffDOUOaVr8fFwormyT
	V6+HFjkcglj1G3laPwUoQzbmjFrYMNe4=
X-Gm-Gg: Acq92OFnl8F4N98O0EAkFTqhF8ioTamYG8LiPCgaCx9ivGx6OG9cbFQDpqlcBVdklb0
	QT/rGnZpDZxELp/ePtG4hmZUSKE9SQqBcGWGylTUzJDDLTrX+w9m12+CcYPM09GtcVFrzWmsjXx
	r8g7fpwRtUpA/Tefkj9P/rXyKkqrWMvaPQUj5QaBIrrH+WqkyNzPOD62MAKrpd3l2rszQPhHGoU
	FiuYX5mWmNhtVFq6MwdTnagIyj2T+MeJVZniUuB1qPSfSkyEASu+e2RcdTZkox1rqxd6SvfIe/m
	lYqmA5OdbY8ZYCRkQeLTyuMQSUDpmlOeDdsxeNRDSzxRjzvHVJeQd3NDcM6Lqu6kAdhyr2paFwR
	b8zI1SsGjIPRVSDAaKibj85uVL8Y0Kshyknk=
X-Received: by 2002:a17:90b:390a:b0:368:b01c:85a0 with SMTP id
 98e67ed59e1d1-377a4402cecmr2009120a91.14.1781165263569; Thu, 11 Jun 2026
 01:07:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFdvZNt+mRTE9Q+utn=T8GzU7s_09ULhUtzTMMa9dgGCsE+r9A@mail.gmail.com>
 <c982caf3-f855-41ad-80cd-3ce9598913ab@amd.com> <CAFdvZNs9jNxnqqaPhDXBt555hqgTHQizV4ORPp_8xg1D=XD4TA@mail.gmail.com>
 <44bd3c12-b8d6-45c8-a7cf-12ea47716461@amd.com> <CAFdvZNvWSVCphSyQCVNHx7j0WApsbr0KekVsA-rVLO0eqV0X9w@mail.gmail.com>
 <ef1d3b86-f5c1-4ac5-ad09-821624044ca1@amd.com> <CAFdvZNvj2Gkik6de1Wtw1++S+MiVsRyyXwo7cPQ4RnDCnKYNDA@mail.gmail.com>
 <e098847d-fc71-440f-9572-5b3c99035c76@amd.com>
In-Reply-To: <e098847d-fc71-440f-9572-5b3c99035c76@amd.com>
From: Lenart Kos <koslenart@gmail.com>
Date: Thu, 11 Jun 2026 10:07:32 +0200
X-Gm-Features: AVVi8Cfy4xQ4IeZbKEJDL1MMZx5omAAG2H5xO0WM8VkOlM_HdKy7RaCg8BRGXms
Message-ID: <CAFdvZNtFYLX4_=T6d3LOdPwQXGjrVAe9Ym6Th_ZMtc=sL1cFMA@mail.gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38310-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mario.limonciello@amd.com,m:Basavaraj.Natikar@amd.com,m:Shyam-sundar.S-k@amd.com,m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[koslenart@gmail.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[koslenart@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A1A5E66FB31

I'm sending this patch from Gmail, I hope it was parsed correctly and
is what you had in mind.

I am second guessing who to report to. *Something* is interrupting
this gpio pin and I am only sure that the event is being consumed by
Nvidia. So I decided to boot with no ignore_wake and all nouveau and
nvidia drivers blacklisted
(module_blacklist=3Dnvidia,nvidia_drm,nvidia_modeset,nvidia_uvm,nouveau,nov=
a_core)
and I was still able to reproduce the sleep issue again. This makes me
think it might be a platform bug, or atleast is is not caused by their
driver (or it could still be caused by the absence of the "corrected"
driver I guess). Sleep works fine on Windows though so maybe it's a
configuration or firmware issue.

Signed-off-by: Lenart Kos <koslenart@gmail.com>
---
Documentation/arch/x86/amd-debugging.rst | 20 ++++++++++++++++++++
1 file changed, 20 insertions(+)

diff --git a/Documentation/arch/x86/amd-debugging.rst
b/Documentation/arch/x86/amd-debugging.rst
--- a/Documentation/arch/x86/amd-debugging.rst
+++ b/Documentation/arch/x86/amd-debugging.rst
@@ -133,6 +133,26 @@
The ``amd_s2idle.py`` script will capture most of these artifacts for you.
+Disabling a spurious GPIO wakeup
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
+
+The identification method above is not specific to *s2idle*; ``GPIO N
is active``
+is reported on resume from *S3* as well, and the ``GpioInt`` /
``_EVT`` lookup is
+the same.
+
+Identifying the notified device is often not enough to stop the wakeup, be=
cause
+the firmware may legitimately route a runtime ACPI event through a
+wakeup-capable GPIO. Such a pin can be kept as a runtime event while its w=
ake
+capability is removed, using the ``gpiolib_acpi.ignore_wake=3D`` command l=
ine
+parameter. The format is ``<controller>@<pin>``, where the controller is t=
he
+ACPI device instance of the GPIO chip (``AMDI0030:00`` for the AMD GPIO
+controller) and the pin is the line number: ::
+
+ gpiolib_acpi.ignore_wake=3DAMDI0030:00@2,AMDI0030:00@4
+
+This skips ``enable_irq_wake()`` for those pins, so they no longer wake th=
e
+system while their ``_EVT`` notification still runs at runtime.
+
s2idle PM debug messages
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--
2.54.0




On Thu, Jun 11, 2026 at 6:34=E2=80=AFAM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
>
>
> On 6/10/26 17:13, Lenart Kos wrote:
> > While debugging with /dev/gpiochip I found out there is actually an
> > acpi event attached to both #2 and #4 so the report about there being
> > no _AEI resources was wrong...
> >
> > The _EVT handler shows what pin 4 is:
> > * Case (0x04): Notify(_SB.PCI0.GPP0.PEGP, 0x81) // "Information
> > Change" -> dGPU (NVIDIA)
> > * Case (0x0A): Notify(_SB.UBTC, 0x80) // USB Type-C status change
> >
> > Testing with cmdline
> > gpiolib_acpi.ignore_wake=3DAMDI0030:00@2,AMDI0030:00@4 it fixed the
> > issue as well. Maybe this can be added to gpiolib_acpi_quirks or
> > should this be fixed in Nvidia drivers? If you could kindly direct me
> > in the correct direction since this does not look like an AMD problem
> > anymore.
>
> This should not be quirked, there is something wrong with the NVIDIA
> software stack if it's asserting this GPIO over suspend.
>
> I would suggest you contact NVIDIA for a solution.
>
> But you at least have a workaround now.
>
> FWIW I do think that this debugging sequence you went through to
> determine the root cause and how to implement and discover this
> workaround is useful to add a paragraph to
> https://docs.kernel.org/arch/x86/amd-debugging.html.
>
> If you're willing to write up a patch to the documentation, I'm happy to
> review it.
>
> >
> >
> > On Wed, Jun 10, 2026 at 11:30=E2=80=AFPM Mario Limonciello
> > <mario.limonciello@amd.com> wrote:
> >>
> >> On 6/10/26 16:20, Lenart Kos wrote:
> >>> I have checked all the bios settings and the closest to modifying
> >>> sleep behaviour was a setting that enables opening the lid turning on
> >>> the laptop which was already disabled, so no, there are no sleep
> >>> settings.
> >>
> >> OK - then the LLM statement that this is a modern standby system sound=
s
> >> categorically wrong.
> >>
> >> It sounds like this is actually a system that only support S3.
> >>
> >>>
> >>> Regarding the HDMI port, it is connected to the Nvidia card. Only the
> >>> built-in screen is connected to the AMD card with eDP. I have not
> >>> reported this anywhere else yet, only here and the before mentioned
> >>> forum post. If this is an Nvidia issue I can report it to them as
> >>> well.
> >>
> >> As the behavior only happens with something connected to the HDMI port=
,
> >> I think you should discuss this with NVIDIA before we make any quirk
> >> decisions in the kernel.
> >>
> >> This really sounds like a driver bug to me if it's tied to that behavi=
or.
> >>
> >> I personally would not be against more debugging infrastructure, but I
> >> would think that /dev/gpiochipX is enough for users to debug with.
> >>
> >> You can work with an LLM to try to come up with a solution that uses
> >> /dev/gpiochipX.
> >>
> >> I would certainly welcome a new section in
> >> https://docs.kernel.org/arch/x86/amd-debugging.html to explain how you
> >> used it if it's effective for debugging this problem.
> >>
> >>>
> >>> The HPD theory is pure guesswork done by LLM. What I can be certain o=
f
> >>> is that disabling those specific pins
> >>> (https://github.com/Lenart12/legion-nowake/blob/6b599aad7afd1431e8104=
8273106c5526561764b/legion_nowake.c#L59-L62)
> >>> did solve the problem, as to why and in what way, I would not bet on.
> >>> So the statements about HPD and your questions about them are maybe i=
n
> >>> vain. What would be the best way to figure out if HPD is actually
> >>> attached to those pins?
> >>
> >> You can add some debugging statements specifically for when those GPIO=
s
> >> are firing interrupts.  Unplug/plug and see if/when those GPIOs change=
.
> >>
> >> Maybe they're monitor presence lines?  Maybe NVIDIA can tell you.
> >>
> >>>
> >>> FWIW I think that it is in fact not HPD as I have checked the GPIO
> >>> states when the monitor cable is connected or not and it seems to be
> >>> gpio #131 not #2 or #4. I have asked Claude to expand on what it know=
s
> >>> and what it assumes, this may be of help to you:
> >>> ---
> >>> What I have measured (facts):
> >>> * The resume is triggered by the AMD GPIO controller:
> >>> /sys/power/pm_wakeup_irq =3D 7 (pinctrl_amd), and the post=E2=80=91re=
sume log
> >>> shows GPIO 4 is active: 0x30057c00 with the wake=E2=80=91status bit l=
atched
> >>> and the S3 wake=E2=80=91enable bit (bit 14) set.
> >>> * In /sys/kernel/debug/gpio, pins #2 and #4 are the only pins with
> >>> S0i3/S3 wake=E2=80=91enable bits set and an interrupt enabled. (Pin #=
89 has an
> >>> interrupt but no wake bits =E2=80=94 not a wake source.)
> >>> * These wake bits have no ACPI owner: decompiling the DSDT and all 16
> >>> SSDTs yields zero GpioInt / GpioIo / _AEI resources. Nothing in ACPI
> >>> references these pins.
> >>
> >> At least for AMD this is specifically more common in systems that
> >> support S3 (no _AEI resources).
> >>
> >>> * Empirically: suspend instant=E2=80=91wakes only when an external di=
splay is
> >>> connected (reproduced over both HDMI and USB=E2=80=91C/DP); with no d=
isplay,
> >>> suspend holds. In the HDMI case, pin #4 is the one that latches the
> >>> wake.
> >>> * Clearing the S=E2=80=91state wake=E2=80=91enable bits (13/14/15) on=
 pins #2 and #4
> >>> fixes it (verified across multiple suspends). Interrupt=E2=80=91enabl=
e bits
> >>> left intact; no other wake source touched.
> >>> * GPIO #131 is the actual monitor=E2=80=91presence line =E2=80=94 its=
 level cleanly
> >>> tracks plug/unplug (active=E2=80=91low: LOW when a monitor is attache=
d, HIGH
> >>> when not, confirmed across plug=E2=86=92unplug=E2=86=92replug). But #=
131 has no
> >>> interrupt and no wake bits =E2=80=94 it does not wake the system.
> >>> * Pins #2 and #4 do not change level when the monitor is
> >>> plugged/unplugged (both steady while awake).
> >>>
> >>> What I am inferring (not proven):
> >>> * Because #4's level is steady while awake yet the wake only occurs
> >>> with a display connected, my working model is that #4 transitions
> >>> during the dGPU's suspend power=E2=80=91down sequence, and that trans=
ition
> >>> only happens when the dGPU was actively driving an external display.
> >>> This is a plausible explanation of the display correlation, not a
> >>> verified one.
> >>> * The precise electrical function of pins #2/#4 is unknown without
> >>> schematics or a scope. They are not the monitor=E2=80=91presence/HPD =
line
> >>> (that is the unarmed #131). I previously guessed "HPD"; the #131 data
> >>> contradicts that, so I'm withdrawing it.
> >>>
> >>> Unknown: what #2/#4 physically are, and why the firmware arms them as
> >>> sleep wake sources with no ACPI description.
> >>>
> >>> Net: a bare, firmware=E2=80=91armed pinctrl-amd wake pin with no ACPI
> >>> description, which no existing in=E2=80=91tree mechanism can disarm
> >>> (gpiolib_acpi.ignore_wake=3D needs an ACPI event; power/wakeup needs =
a
> >>> device owner; /dev/mem is blocked by IO_STRICT_DEVMEM).
> >>> ---
> >>>
> >>> I have not filed a bugzilla report yet.
> >>>
> >>> I hope I addressed your questions.
> >>>
> >>> On Wed, Jun 10, 2026 at 10:23=E2=80=AFPM Mario Limonciello
> >>> <mario.limonciello@amd.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 6/10/26 15:18, Lenart Kos wrote:
> >>>>> Thanks for taking your time for this. To answer your questions:
> >>>>>
> >>>>> S3 path:
> >>>>> AFAIK it was on [deep] since my system was installed and I strongly
> >>>>> remember being it as so, although it is possible that I misremember=
ed
> >>>>> since I have been debugging this sleep issue since January. In any
> >>>>> case I have also tried setting sleep to [s2idle] before and it did =
not
> >>>>> fix the waking issue even if set in s2 sleep mode.
> >>>>> The firmware is not modified, everything is installed from Fedora
> >>>>> sources without modification.
> >>>>
> >>>> Can you please check in Lenovo's BIOS setup if there is a sleep mode=
 for
> >>>> this platform?  If there isn't that's fine, I want to confirm what
> >>>> Lenovo actually presented before making further assumptions.
> >>>>
> >>>> If there is such a setting, what options does it offer?  If you chan=
ge
> >>>> it does the behavior change?
> >>>>
> >>>> Furthermore if this issue is only happening when connected to the HD=
MI
> >>>> port, that's the one connected to NVIDIA, right?  Have you started a
> >>>> conversation with them?  Assuming the HPD theory that has been prese=
nted
> >>>> is correct their driver should be in control of HPD behavior.
> >>>>
> >>>>>
> >>>>> Methodology:
> >>>>> Yes you are correct about LLMs, I have thrown every bit of my
> >>>>> knowledge and time that I have available for this without success a=
nd
> >>>>> Claude has finally solved this after a few months being irritated b=
y
> >>>>> this. I had decided to forward most of the information I received f=
rom
> >>>>> LLM in the hopes it was useful to an expert in the area, but in
> >>>>> hindsight I can see this was a mistake without AI disclosure, I'm
> >>>>> sorry. So for your other questions regarding why this assumption wa=
s
> >>>>> made or why was something done a certain way - I don't know, but I =
am
> >>>>> willing to assist with testing. Apologies for this mess, it's my fi=
rst
> >>>>> time filing a bug to the LKML.
> >>>>
> >>>> No worries; as long as I'm talking to a human about a problem not an
> >>>> LLM, I'm fine to work with you to see what we can come up with for a
> >>>> solution.
> >>>>
> >>>> I've got various inline comments/questions below.  Can you please
> >>>> address them?
> >>>>
> >>>>>
> >>>>> On Wed, Jun 10, 2026 at 9:59=E2=80=AFPM Mario Limonciello
> >>>>> <mario.limonciello@amd.com> wrote:
> >>>>>>
> >>>>>> First off -
> >>>>>>
> >>>>>> How did you get into an S3 path?  These systems that ship with onl=
y
> >>>>>> Modern Standby / s2idle normally shouldn't be able to get into S3.
> >>>>>>
> >>>>>> =E2=95=B0=E2=94=80=E2=9D=AF cat /sys/power/mem_sleep
> >>>>>> [s2idle]
> >>>>>>
> >>>>>> Have you modified the firmware in some way to try to enable an
> >>>>>> unvalidated path?
> >>>>>>
> >>>>>> I have some more questions about your methodology below because wh=
en
> >>>>>> debugging a kernel issue an LLM can sometimes make WILD assumption=
s that
> >>>>>> are totally a house of cards.
> >>>>>>
> >>>>>> On 6/10/26 14:32, Lenart Kos wrote:
> >>>>>>> ## Summary
> >>>>>>>
> >>>>>>> On the Lenovo Legion Pro 5 16ARX8, suspending (S3 *or* s2idle) wi=
th an external
> >>>>>>> display connected resumes the machine after ~1 second. The wake i=
s delivered by
> >>>>>>> the AMD GPIO controller (`pinctrl_amd`, IRQ 7) from GPIO pin **#4=
**
> >>>>>>> (and pin #2 for
> >>>>>>> the USB=E2=80=91C/DP path), which the **BIOS has armed as an S0i3=
/S3 wake
> >>>>>>> source directly
> >>>>>>> in the FCH GPIO register**, with **no ACPI description**
> >>>>>>> (`_AEI`/`GpioInt`/`_PRW`)
> >>>>>>> anywhere in the DSDT or the 16 SSDTs. Because there is no ACPI ow=
ner,
> >>>>>>> none of the
> >>>>>>> existing override mechanisms (`gpiolib_acpi.ignore_wake=3D`, devi=
ce
> >>>>>>> `power/wakeup`)
> >>>>>>> can reach it, and `IO_STRICT_DEVMEM` blocks any userspace registe=
r
> >>>>>>> write. The pin
> >>>>>>> is an external=E2=80=91display HPD line, so the edge produced whi=
le the GPU
> >>>>>>> powers down on
> >>>>>>> the way into sleep immediately wakes the system.
> >>>>>>>
> >>>>>>> ## Affected system
> >>>>>>>
> >>>>>>> ```
> >>>>>>> DMI sys_vendor LENOVO
> >>>>>>> DMI product_name 82WM
> >>>>>>> DMI product_version Legion Pro 5 16ARX8
> >>>>>>> DMI board_name LNVNB161216
> >>>>>>> BIOS LPCN62WW (2025-06-17) # latest available; does NOT fix this
> >>>>>>> SoC AMD Ryzen 7 7745HX (Raphael), GPIO ctrl AMDI0030 @ 0xFED81500
> >>>>>>> GPU NVIDIA RTX 4060 Mobile (HDMI) + AMD Raphael iGPU (USB-C DP)
> >>>>>>> Kernel 6.17+ through 7.0.x (reproduced on Fedora 43/44)
> >>>>>>> ```
> >>>>>>>
> >>>>>>> ## Symptom / evidence
> >>>>>>>
> >>>>>>> Failed-suspend kernel log (verbose PM):
> >>>>>>> ```
> >>>>>>> PM: suspend entry (deep)
> >>>>>>> ...
> >>>>>>> amd_gpio AMDI0030:00: ... Clearing debounce for GPIO #2 during su=
spend.
> >>>>>>> amd_gpio AMDI0030:00: ... Clearing debounce for GPIO #4 during su=
spend.
> >>>>>>> amd_gpio AMDI0030:00: ... Disabling GPIO #89 interrupt for suspen=
d. #
> >>>>>>> not a wake src
> >>>>>>> ACPI: PM: Preparing to enter system sleep state S3
> >>>>>>> Timekeeping suspended for 1.384 seconds
> >>>>>>> PM: Triggering wakeup from IRQ 7 # IRQ 7 =3D pinctrl_amd
> >>>>>>> ...
> >>>>>>> GPIO 4 is active: 0x30057c00 # bit 14 (WAKE_CNTRL_S3) + bit 29 (w=
ake latched)
> >>>>>>> ```
> >>>>>>> `/sys/power/pm_wakeup_irq` =3D `7`.
> >>>>>>>
> >>>>>>> `/sys/kernel/debug/gpio` (relevant rows) shows pins #2 and #4 arm=
ed for S0i3+S3
> >>>>>>> wake with their interrupt enabled, while #89 has no wake bits:
> >>>>>>> ```
> >>>>>>> #2 =F0=9F=98=9B| =E2=86=93 | edge |=E2=8F=B0|=E2=8F=B0| | | ... 0=
x147ae0
> >>>>>>> #4 =F0=9F=98=9B| b | edge |=E2=8F=B0|=E2=8F=B0| | | ... 0x57ce0 <=
- both-edge HPD, S0i3+S3 wake set
> >>>>>>
> >>>>>> How did you determine this is an HPD line?  Is that a pure guess? =
 Or
> >>>>>> did you look at a schematic/trace etc?
> >>>>>>
> >>>>>>> #89 =F0=9F=98=9B| =E2=86=93 | level| | | | | ... 0x151b00 <- no w=
ake bits (red herring)
> >>>>>>> ```
> >>>>>>>
> >>>>>>> ## Root cause
> >>>>>>>
> >>>>>>> 1. The external=E2=80=91display HPD lines are routed to SoC GPIO =
#2 (USB=E2=80=91C/DP) and #4
> >>>>>>> (HDMI/dGPU).
> >>>>>>
> >>>>>> How do you know?
> >>>>>>
> >>>>>>> 2. The BIOS sets `WAKE_CNTRL_S0I3`/`WAKE_CNTRL_S3` (bits 13/14) o=
n
> >>>>>>> those pins in the
> >>>>>>> FCH GPIO register block and **never describes them in ACPI** =E2=
=80=94 decompiling the
> >>>>>>> DSDT and all 16 SSDTs yields **zero** `GpioInt`/`GpioIo`/`_AEI` r=
esources.
> >>>>>>> 3. `pinctrl_amd` correctly preserves hardware-armed wake pins acr=
oss
> >>>>>>> suspend, so the
> >>>>>>> HPD edge generated during the suspend transition wakes the system=
 immediately.
> >>>>>>>
> >>>>>>> This is effectively an unvalidated firmware S3 path (the platform=
 ships as
> >>>>>>> Modern-Standby-only); but note **both** the S0i3 and S3 wake bits=
 are set, so
> >>>>>>> s2idle is affected too.
> >>>>>>
> >>>>>> So how did you get into S3?
> >>>>>>
> >>>>>>>
> >>>>>>> ## Why existing mechanisms don't help
> >>>>>>>
> >>>>>>> - `/proc/acpi/wakeup`, PCI/ACPI `power/wakeup` =E2=80=94 wrong la=
yer; this is
> >>>>>>> not a PCIe PME.
> >>>>>>> Disabling wakeup on the GPP bridges / GPU has no effect (verified=
).
> >>>>>>> - `gpiolib_acpi.ignore_wake=3D` / `ignore_interrupt=3D` =E2=80=94=
 only match
> >>>>>>> **ACPI-declared**
> >>>>>>> GPIO events; this pin has no ACPI declaration, so they cannot tar=
get it.
> >>>>>>> - `/dev/mem` register write =E2=80=94 blocked by `CONFIG_IO_STRIC=
T_DEVMEM=3Dy`
> >>>>>>> (the region is
> >>>>>>> claimed by pinctrl_amd).
> >>>>>>>
> >>>>>>> There is currently **no way, in-tree, to disarm a bare (non-ACPI)=
 firmware-armed
> >>>>>>> pinctrl-amd wake pin.** That is the gap.
> >>>>>>>
> >>>>>>> ## Suggested fix (maintainers' choice)
> >>>>>>>
> >>>>>>> A working out-of-tree reference implementation (clears bits 13/14=
/15
> >>>>>>> on pins #2/#4
> >>>>>>> at probe and on `PM_SUSPEND_PREPARE`) is here:
> >>>>>>> **https://github.com/Lenart12/legion-nowake** =E2=80=94 please fe=
el free to reuse.
> >>>>>>
> >>>>>> Why not use /dev/gpiochipX devices to change GPIOs?
> >>>>>>
> >>>>>>>
> >>>>>>> Possible in-tree directions:
> >>>>>>> 1. **DMI-matched quirk in `pinctrl-amd`** that clears the S-state
> >>>>>>> wake-enable bits
> >>>>>>> for the affected pins at probe (smallest change; precedent exists=
 for AMD GPIO
> >>>>>>> wake quirks).
> >>>>>>> 2. **A generic override** for bare pins, e.g. a
> >>>>>>> `pinctrl_amd.ignore_wake=3D<pin,...>`
> >>>>>>> module parameter, analogous to `gpiolib_acpi.ignore_wake=3D` but =
for
> >>>>>>> hardware-armed
> >>>>>>> pins without ACPI events. This would help the broader class of AM=
D laptops that
> >>>>>>> hit firmware-armed spurious wakes.
> >>>>>>>
> >>>>>>> ## Reproduction
> >>>>>>>
> >>>>>>> 1. AMD laptop where a display HPD is wired to a GPIO the BIOS arm=
s for wake.
> >>>>>>> 2. Connect an external monitor, `systemctl suspend`.
> >>>>>>> 3. Observe resume after ~1s; `pm_wakeup_irq` =3D the `pinctrl_amd=
` IRQ;
> >>>>>>> the offending
> >>>>>>> pin shows `wake latched` in the post-resume `GPIO N is active` lo=
g.
> >>>>>>
> >>>>>> On the presumption that this is correct about being an HPD pin doe=
sn't
> >>>>>> this actually point at a GPU driver bug?
> >>>>>>
> >>>>>>>
> >>>>>>> ## Public discussion / full diagnostics
> >>>>>>>
> >>>>>>> Fedora Discussion (complete diagnostic walkthrough, ACPI dumps, g=
pio table):
> >>>>>>> https://discussion.fedoraproject.org/t/immediate-wake-from-s3-sle=
ep-when-hdmi-is-connected-irq-7-pinctrl-amd
> >>>>>>>
> >>>>>>> ## Attachments to include when filing
> >>>>>>>
> >>>>>>> - `acpidump` output (or note: DSDT + all SSDTs contain no GpioInt=
/_AEI).
> >>>>>>> - Full verbose-PM `dmesg` of one failed suspend (`pm_debug_messag=
es=3D1`).
> >>>>>>> - `sudo cat /sys/kernel/debug/gpio`.
> >>>>>>> - `cat /sys/class/dmi/id/{sys_vendor,product_name,product_version=
,board_name,bios_version}`.
> >>>>>>
> >>>>>> Where is the kernel bugzilla that you attached all these artifacts=
?
> >>>>>>
> >>>>>
> >>>>>
> >>>>
> >>>
> >>>
> >>
> >
> >
>


--
Lep pozdrav,
Lenart Arvo Kos

