Return-Path: <linux-gpio+bounces-37125-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEERNLAPDGoZVQUAu9opvQ
	(envelope-from <linux-gpio+bounces-37125-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 09:22:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FC4578F46
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 09:22:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 88507300A315
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 07:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB9A3CF698;
	Tue, 19 May 2026 07:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E6evZeL7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A77F1A704B
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 07:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175300; cv=pass; b=VjdaI2OO4rRSYUaz4Hl9qoQXvEBeS/31O5vkMVO1VelcTxZVS5Y4bVv2XQHHnmS8/6MUJPh1dLN+K4VbG/QorfWdO6kbtgSEz4w2+jGnkyO2zKxoGetjJ5j6SM6sYp6g56xX/xlVTwOtQMzory+YcncxBckuj92ktICd1U0Sb8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175300; c=relaxed/simple;
	bh=Oa7OyuO95iluKy8/COxKuVtDUJhdCWMtuZ3HGAOTMDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fpj6RKzZJpV7iksEZU2y1/QJlHOi8yCHLajLO1K83JfhA30IBk9Os67b/hbtz7iyTL0IvUWiitlwroL9H7hFR0ezeK4aXNCpBLzxU5NprZTVdHz6Nu+q0D52Hhkbrhca2CzkqceOUTJokIvndi+Aslv8DuZFaQqfedbPSq+Zros=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E6evZeL7; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7bd5c773ef3so25672877b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 00:21:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779175297; cv=none;
        d=google.com; s=arc-20240605;
        b=Vg/Jq6+mAF3nOsh/KNLdjZpJ4653oyTdQWf26UPEwfM9q50Ca/e2zIu1+4sXldlj8d
         HQW7Pke9TEmFOcH4WXhIJGTuNw90gKjgnKXr1I9HFbS6uEzoDL4cdOfPkJYeFm7z1ah8
         autuq3qwKaTD+IQPVMpDkidIC8PQoMEBe3dzYhE1qhObZamn+KoZpcPldjKUrGG8FBI2
         UgCV77HOL0anqUpn76aE+mdfti4vnZ49pRl9qC86vNQuO+oUzeqt/VOp5lHt52dVgY8X
         67OJd4RQn0Sws6alJ8MfUaQs/UOcPNUoznY0V2FrtwaKjEGnqTWtFIo+E9NS3IwNc2cd
         TdKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wnP4OlID84iZ1pMkgqTUuHenz4qcP2CzbjiWM2ZLvmM=;
        fh=naM6sMr717QuaA2JMI+ZzuUir9/ydfLXk/LQRvY40RU=;
        b=O9lwy11AKkaR3xkHnzWPi2cKZ2/TZilFoTdYa7l0CAC2RLgOCMhJRbmmRMK41DVOl9
         8eiW2TIO2r90Dwa0o99S0Lmdn6OGVlElqnEhnYysU44IEoOvJIcp6vDMniaHkBWy99Ag
         I+VJQHNIPIVup7gfr6RueVAKx6MmGHtZNUh5l725awYLu9yXT2lCDgMAlXohEwT89VNL
         hjQddWcu+S4K75crVtW1wyQiyfENgu1GxThxMGzaFXcZpSkPWjLR6DTKPDdf1XOpgb6C
         VpiHQkN2qFo8eAGtVQkvt98ICjK0WPHxWJ7dvm7G4fehS6Hx0BbI8r3nM7aacDaf5uk9
         IfQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779175297; x=1779780097; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnP4OlID84iZ1pMkgqTUuHenz4qcP2CzbjiWM2ZLvmM=;
        b=E6evZeL7y5uh07IE+D1+hNPdDv421w/pZgqPoQsB1Vu5bPsSLKLrtm8WoOmgDIvBwX
         ASCyFNDkudCzZg2Z2farOxGUrMMsobTQYdVocRtO9Q3+zBVmQw64gAaJD8VoLGS5u83P
         QdEZBfU+0u0nq+hGbuagOUJgzEWSZ4FUJr5CmuOnxQC3karnVIJOv4W6ZccYR4ym4h8Q
         znnj+FwQsaqrBBO9E0m+HJiB+CrneYdmlCZEvsrULk7ClNdYTC9VTEvDY8R7h7vYHWjp
         mQi1IL4uPPdLvQErgTYSnhAu8YyOhgH6KP7L6cC1PlxRKPKp+SJDG9oV/w0Rsrs+Ya/v
         I4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175297; x=1779780097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wnP4OlID84iZ1pMkgqTUuHenz4qcP2CzbjiWM2ZLvmM=;
        b=AuKaDREzMvO73j72tVfFar9AP+Xeq8Ou12L0/bTllXZpTkK4GE9Lvfa7Mql9eyDKuC
         uy83vWChU6NH3bkWbMheyu/C+A4m3oEI5F4Xh2Rvc6fzV45IBA7wpGKevoqnv+VW4S12
         webzJzzgBlyUtvF4n0dsj9DieycfX9gbe1aZPmSMKYAjmbHe3ONgEyp9uPIpxnGUK48W
         0bO6GPMLTi2YDaoV5HL/5i52N/nTdDlTQmPZJRAV7nxViyMMe2fAMalaceVl48qaUSEX
         tDhWGlJQGxq3aR2+U0Igm3n2rn8aJlrjNF5n8iBS5sPhGQ34nx/cdro1TMl2dLuosdoX
         XO3w==
X-Forwarded-Encrypted: i=1; AFNElJ9s6Q6gd0tv3l1ehLOQ+Gy257oxI4SAAOuBoU211Hs7Fp5+F/ujzwh1tH7rNXZbbmXbJNCWw0ka6htS@vger.kernel.org
X-Gm-Message-State: AOJu0YzRMOBU3Jq6s0FVCvHiZ2iNLnF7ubGsmrsHdXFJVMRxXFOb8BRg
	2N+MTDNgk8Ty4++jKG8BlsL4qTEUvn2G9L1t7Xk7zpPDEU+t+jl7Iqb0FCJwciBsldLQAUhw4wi
	I4iVfjVC5xlRaoZvHuVJU3IqDYzsK1kA=
X-Gm-Gg: Acq92OHOhlxkxHaR1NGr3qJiLI0Wmrlv4igjh//1MXgb8K1C+KRnYJni3I1qALBt/Qn
	CsdWfoci/MUP60oDtwytCgGoKpJ8J/iaGu3+aZeb2bKlry5OtxmtDXHghGoF69QdW6Ft2ZeRvw4
	5GMTknZuJMIKxwd5TEdr5aZQ/Z1ut1U5SwiBFjanU05p+G/wimnPuJupL72oHXddgoloSZKGAYr
	OOHIMIz69NPf2eGz/9ayzS/BKRdw+DU64npaAzHNUj5mpXxFheub7WAT39hJqQf+mfYGGwAY2Yk
	MbhpJMLf7FqfWSCQAsUaOXxKVvYkfHgJb8Z+nD1rjgRhMtb39q8CLbZ7JH8uaopvpGwCi9KHXu4
	cB3aOCS/jk7LnamVKyv8tWUEUywy6YsvBn8wIz4MB7oDI+4SM0dkPYFgrMxhiYWqtDWrw/w==
X-Received: by 2002:a05:690c:112:b0:7bd:5d03:dc18 with SMTP id
 00721157ae682-7c95b82a8acmr212648737b3.29.1779175297320; Tue, 19 May 2026
 00:21:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518122814.8975-1-hardikprakash.official@gmail.com>
 <d57dd297-6be1-43a9-a38d-e40c8949e23a@amd.com> <CANTFpSWGC7GsAY-3UvPtBZzqjNek-T5haiDb59QYRoRgwuQf1w@mail.gmail.com>
 <7d0f0cf9-1936-4cf6-a425-228a37f83137@amd.com> <CAMRc=MdS_BVKb=FQLhky=8dpghBSoHeBhUk0LM5hROFxmJeyGQ@mail.gmail.com>
 <9d5da93e-bbe0-4359-9f17-e3c6b3a5cb34@amd.com> <CAMRc=MfT_WVMxPnYZW=mg52PHew0O4VQMGFrfo6G9vxZDDoArw@mail.gmail.com>
 <CANTFpSUX5rYhuTQH3dTTvzW+_yhW8Gs0U=A1t_8LDzKz4dzzAw@mail.gmail.com>
 <agsh652HlC4rg1_1@ashevche-desk.local> <CANTFpSU7XaNKwe_FPsTCkxQYeq78Tqusr-nsB-Ww0_teuiWdEA@mail.gmail.com>
 <f0ee2722-1e56-41b1-b70c-5503a2495853@amd.com>
In-Reply-To: <f0ee2722-1e56-41b1-b70c-5503a2495853@amd.com>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Tue, 19 May 2026 12:51:25 +0530
X-Gm-Features: AVHnY4IWrbCqzk7xRzwF54zOIXzOwyqH8XVXizOrpIbeofI7zwv-GkgovMipV3A
Message-ID: <CANTFpSWT+cR8Yxyr5jrB2MUidqKteWuPjHOyK_rpSkDUN6SWQQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/1] i2c: designware: fix probe ordering for AMD GPIO
 on Lenovo Yoga 7 14AGP11
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org, 
	basavaraj.natikar@amd.com, linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37125-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,intel.com:email,mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 74FC4578F46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 23:14, Mario Limonciello wrote:
> I'm still confused though.  Are you saying we're actually racing with
> amd_gpio_probe()?  Like the GPIO chip gets set up before the interrupt
> is ready?
>
> There is a dynamic debug statement already in amd_gpio_probe() for when
> it finishes, maybe you can sprinkle a few more around the start of probe
> and amd_gpio_irq_enable() to confirm?

Added debug statements and enabled dyndbg at boot. The trace confirms
the race:

  0.285415  amd_gpio_probe: start
  0.285496  amd_gpio_probe: calling irq_init
  0.285947  GPIO 157 enabled (quirk fires)
  0.285950  amd_gpio_probe: quirks applied
  0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
  0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
  0.290248  AMDI0010:00 dw_i2c_plat_probe: start
  0.295928  AMDI0010:01 dw_i2c_plat_probe: start
  0.301454  AMDI0010:02 dw_i2c_plat_probe: start <- races here
  0.306905  AMDI0010:03 dw_i2c_plat_probe: start
  2.348157  lost arbitration

gpiochip_add_data() at 0.285952 makes the GPIO chip visible to the
system before amd_gpio_probe() has finished. AMDI0010:02 starts probing
at 0.301454 while amd_gpio_probe() is still completing. This is why
device_is_bound() works and initcall promotion does not -- it waits for
probe completion, not just gpiochip registration.

Thanks,
Hardik

On Mon, 18 May 2026 at 23:14, Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
>
>
> On 5/18/26 12:22, Hardik Prakash wrote:
> > On Mon, May 18, 2026 at 19:57, Bartosz Golaszewski wrote:
> >> If you added wait_for_device_probe() right before requesting the
> >> interrupt, does it help?
> >
> > I'll test this. One concern: wait_for_device_probe() waits for all
> > pending probes to complete, not just pinctrl-amd. Calling it
> > unconditionally in dw_i2c_plat_probe() would affect every machine
> > running i2c-designware, potentially adding boot latency broadly.
> >
> > Would it make sense to guard it with the same DMI check, or is the
> > intention to make this unconditional?
>
> Our general aim should be to avoid DMI checks where possible.  If you're
> finding a timing problem on your system there can very likely be a
> timing problem on another system from someone not as willing or able to
> report it.
>
> So let's leave DMI hacks for fallback if we really can't figure this out.
>
> In an ideal world we would have a _DEP in the ACPI entries, but I don't
> think I've ever seen that for the GPIO controller.
>
> I'm still confused though.  Are you saying we're actually racing with
> amd_gpio_probe()?  Like the GPIO chip gets set up before the interrupt
> is ready?
>
> There is a dynamic debug statement already in amd_gpio_probe() for when
> it finishes, maybe you can sprinkle a few more around the start of probe
> and amd_gpio_irq_enable() to confirm?
>
> >
> > Thanks,
> > Hardik
> >
> > On Mon, 18 May 2026 at 19:58, Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> >>
> >> On Mon, May 18, 2026 at 07:53:28PM +0530, Hardik Prakash wrote:
> >>> On Mon, May 18, 2026 at 19:35, Bartosz Golaszewski wrote:
> >>>> What is blocking the pinctrl driver from probing? Does it return
> >>>> -EPROBE_DEFER for some reason? Pin control core is ready at
> >>>> core_initcall() so it should work in theory.
> >>>
> >>> On Mon, May 18, 2026 at 19:16, Mario Limonciello wrote:
> >>>> Please try arch_initcall instead.
> >>>
> >>> Tested arch_initcall + patch 1. GPIO 157 now fires at 0.255s (earlier
> >>> than any previous boot), but arbitration errors still occur at 2.309s=
:
> >>>
> >>>    subsys_initcall + patch 1:   GPIO 157 at ~0.310s, arbitration erro=
rs
> >>>    arch_initcall + patch 1:     GPIO 157 at ~0.255s, arbitration erro=
rs
> >>>    patch 1 + patch 2 (v5):     no arbitration errors, touchscreen wor=
ks
> >>>
> >>> The driver is not returning -EPROBE_DEFER. The problem is that
> >>> amd_gpio_probe() hasn't completed by the time i2c_designware fires,
> >>> even with arch_initcall. Promoting the initcall level gets the driver
> >>> registered earlier, but probe itself takes time, and i2c_designware
> >>> catches it mid-probe regardless of registration timing.
> >>>
> >>> This is why device_is_bound() works where initcall promotion does not
> >>> =E2=80=94 it waits for probe completion, not just driver registration=
.
> >>
> >> The alternative solution is to have a registered notifier for the devi=
ce in
> >> question. But not sure if it will be less-invasive than given solution=
.
> >>
> >>> On Mon, 18 May 2026 at 19:41, Bartosz Golaszewski <brgl@kernel.org> w=
rote:
> >>>> On Mon, May 18, 2026 at 4:08=E2=80=AFPM Mario Limonciello
> >>>> <mario.limonciello@amd.com> wrote:
> >>>>> On 5/18/26 09:05, Bartosz Golaszewski wrote:
> >>>>>> On Mon, May 18, 2026 at 3:46=E2=80=AFPM Mario Limonciello
> >>>>>> <mario.limonciello@amd.com> wrote:
> >>>>>>> On 5/18/26 08:40, Hardik Prakash wrote:
> >>>>>>>> On Mon, May 18, 2026 at 18:17, Mario Limonciello wrote:
> >>>>>>>>> I'd still like to avoid a quirk if we can.
> >>>>>>>>>
> >>>>>>>>> I know my proposed patch to try to probe at an earlier stage di=
dn't
> >>>>>>>>> work, but could you perhaps try pulling pinctrl-amd even earlie=
r?
> >>>>>>>>>
> >>>>>>>>> Maybe fs_initcall()?
> >>>>>>>>
> >>>>>>>> Tested. fs_initcall + patch 1 still produces the same arbitratio=
n
> >>>>>>>> errors:
> >>>>>>>>
> >>>>>>>>      subsys_initcall + patch 1:   arbitration errors persist
> >>>>>>>>      fs_initcall + patch 1:       arbitration errors persist
> >>>>>>>>      patch 1 + patch 2 (v5):     clean boot, touchscreen fully f=
unctional
> >>>>>>>>
> >>>>>>>> The initcall level does not appear to be the determining factor =
on
> >>>>>>>> this hardware. i2c_designware is still probing AMDI0010:02 befor=
e
> >>>>>>>> pinctrl-amd finishes regardless of how early pinctrl-amd registe=
rs.
> >>>>>>>> The explicit device_is_bound() deferral in patch 2 is the only
> >>>>>>>> approach that has worked.
> >>>>>>>
> >>>>>>> Please try arch_initcall instead.
> >>>>>>
> >>>>>> What is blocking the pinctrl driver from probing? Does it return
> >>>>>> -EPROBE_DEFER for some reason? Pin control core is ready at
> >>>>>> core_initcall() so it should work in theory.
> >>>>>
> >>>>> Currently it's module_platform_driver() IE device_initcall().
> >>>>>
> >>>>> That's why I think we "should" be able to move it a lot earlier.
> >>>>
> >>>> I mean with fs_initcall() change - what's blocking it now?
> >>
> >> --
> >> With Best Regards,
> >> Andy Shevchenko
> >>
> >>
>

