Return-Path: <linux-gpio+bounces-37086-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FFUJfhLC2o7FQUAu9opvQ
	(envelope-from <linux-gpio+bounces-37086-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 19:27:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E945719CB
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 19:27:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D93C9304C057
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 17:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C2E23F39FC;
	Mon, 18 May 2026 17:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HrtIfw0z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552FA371868
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 17:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779124973; cv=pass; b=MiZm7wNqCf3w4XEmmiJM9JcbTCVpR6ox6teXGQAObCR8RGPEikj0+kZ2+UvTWcvcgAWqyTm1Bsd2TqDbN8R087rkGmq+mReuDUx6TDB+uboW5KNqgRxi9DBmcTbvU62RuU/1r8Kgv5c7By5h1ctlA3zUjKV+OLoRmcC1w+/sRtg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779124973; c=relaxed/simple;
	bh=TOLeJsmw+Vv2qAImKueCZ5Ta/mvCb0OE02Yl8ir0Zn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bZuflK3MND+fHSikRzpT3DtQ2nd+1fqK+b7OUe8qsE7d5big/QmHhKm9zj5/UyeBk5Ba7f1946/ghrw+G7FP7OAfOD90z17FARATlnYmpEybNVewnpDILRagWEWM15absw2EAs7gUbm8TC3frXviodXE6bztuVawEOK6y8gy+DQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HrtIfw0z; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-651bf695701so2505823d50.2
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 10:22:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779124971; cv=none;
        d=google.com; s=arc-20240605;
        b=IXP7Dh1Lj3P5AAjSrwsKcMDPqhPkyxCA9uOSvhH/pkYWaD4UsyzP33XzCbTI8LsXR2
         BwBe4WkmnhvDY7267JyQWSvNR1/CZLBSOImySs62+86B8Jn4ottGvTa3wNpJVXb26kH4
         saAYJds7HwofndsCCQvLM+OALEG+SChlTrn93WBmVCGokt9NQv2rzPja++x5pte4eFgi
         Xp/ZMloplR4Sy7qnF4bO0uNHG0bjxWAJ7uymHBNN0p2cjY8NlN1X0C2VhBtlCSBdKmYU
         ApZleU/MsW6/Ip72XNl8IzQBIDedvwzX3q6esLnacGtF4xr9o/KDtfrb8/plXd8Qc+Ws
         GLow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gmumUmgaNEOIQSCm8QdKse+2Q6ZjwZ4ybhIGQ185Rfs=;
        fh=6pAxRQ3/9M/YF1bJ/cf4M5/JqBoNt/UkrLUQnJ3nOyM=;
        b=bmxBa+YWe4qkdXOpfrJaS6GklwF3im6hkokkF2cDxrGI0yJ2Kt6jKuLiWIpOHMZpiu
         9gSqHSxLWuDz6TCkRCy97JyGk17sRAUghWWI+AHBeDym1vE1WNCe976dJLZjp0ODOE1j
         ePMs1MdSZmTLNQWJuzK7YbOhtrmtC9DM4HHZd+J4Sbj/Iw+8kDkwE7B81GfAh4VRAYam
         KiLMP8UCytXCxMq3Gjx1V3J/iSuR54VkM8jvvB/lETVEeoPXC73ll+kJTFzuQ01fS+1d
         jvdfWGQg0W5XWVWdFtFLFs1rZYSdfC3XFjk/Y0oEOI+xICu+cwJZ7spmEXyWHJqFESCb
         1nsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779124971; x=1779729771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmumUmgaNEOIQSCm8QdKse+2Q6ZjwZ4ybhIGQ185Rfs=;
        b=HrtIfw0zI2D6miaUHoPnyD1FimPj6N1Osg7ARug9bXXaFdwJtb80dqRl93b7cAIRiI
         mfRRpt5bxnfSypZfMfkVst7EKGs5PrTcLZm81nz6DJjMGHIT2Y83ZkPBjjLjYVbvXTUD
         cCDIFnKGa3w9Hdw/HBvUz5tNj9/51PKOtrj593NnccJljvA9wdaUmnKOYwDRYb6xNB81
         buUU3Nq6E9yi6S2kHZ1tj68kwn0f3Wo7m0eowr06GmhvFYfFJgmpWtJU9SeI36iGNUe8
         vCJ/35tezR2AhbBdjnZCIRFwFXac5Q/7JMJOCyq4AqmvfBiFmw7tx9tolN9KsjRpqOTz
         oyiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779124971; x=1779729771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gmumUmgaNEOIQSCm8QdKse+2Q6ZjwZ4ybhIGQ185Rfs=;
        b=FN6FNpjlzAfe+lhaChfrZFwjv2ZgvG4c3GQNujt8wteJbdz4xoYOfld2bE/Lxm8IPN
         iTFEjD2J2van/O41FT5LkuuPjD/rjosnDWJ/dmGBAwq4kyBHwLVqicpCkLKLAr/E+Msg
         6VZ4kekIBwUFwXH7ZqpVeMnvUdugtggiqMxGlUNc/B6nzLN+/+SyN78jrgmvbD/TA9bj
         gdYCt/b4ORlcKTChiaDwjGOMrrR8zXQmtpWvCay/asmizG0os/ijguHekVHUmhArMSL4
         jhLp/OQICxznp+B/yQ8gsp017svN0b1riDPOeCtHi5FTNmkrbj0ME//gDN5XY2cdPfSy
         y8yA==
X-Forwarded-Encrypted: i=1; AFNElJ/CaY0RK/NXghSROKqLX3xhTbG44IgLFM6FcvVtNiJlgqnq8hRdIE7qv2BzGrVqe/nh3WXwZ/MMN3bK@vger.kernel.org
X-Gm-Message-State: AOJu0YygyqfVNXOXP/HAUEvoUNCFJlPrXqHE8Dy/1n71Kc5jk6VN0l1S
	/sz8Zbl57tI+IKNka/DoJI/DGXWMS+470qXOjR0iTT+FnY4E1F6qBE3aQiasievELCxNkz31C3U
	xhCFI6xab3+YCNMrTm5a+PsdpY1+ZLSY=
X-Gm-Gg: Acq92OGM7gcVlZuE4rPAMuL2Qj/8RTVe86hpBMKG+1OA7NeMVR1IYgQQ3SK/ovH0bbi
	nf60YyxvyX+sQKk2Mu/pPY6NzWYjbf0cmvADCvZi8MGdzERD3JKDBU/7Az93S5QPoWRw8vO2mw5
	bqDmJ2osijD0v3coppukebWlJQsh7Jyr8mCgwNwKYNeGY3sujrk9va3OHpZ3XdkVUaiyIL/8EJy
	dKk3d3gUDJ+4ChG2x7PV0AePkO9ClIWbIzsphRoFu0i+lcbUaJG+uzl7FC6XS05OOxdmQeoOG/6
	tWivI7OoK+wpaaREfNNHd7TcLIFEqY9+wdvguocvhMPJyL0QOBZoz2WL89g+5rcMOKU/TABcGlG
	YlOovGxx/zMUe4dUJWAwRpCCxxdl3TYhsit7mVAQR7IEBbRfh4xk2Ovpjo0k=
X-Received: by 2002:a05:690e:14c4:b0:65d:b10e:a848 with SMTP id
 956f58d0204a3-65e226d6793mr15784084d50.16.1779124971317; Mon, 18 May 2026
 10:22:51 -0700 (PDT)
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
 <CANTFpSUX5rYhuTQH3dTTvzW+_yhW8Gs0U=A1t_8LDzKz4dzzAw@mail.gmail.com> <agsh652HlC4rg1_1@ashevche-desk.local>
In-Reply-To: <agsh652HlC4rg1_1@ashevche-desk.local>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Mon, 18 May 2026 22:52:39 +0530
X-Gm-Features: AVHnY4LZGHhrjlQ6Jw1xZ3WPGv09nBU7cC2SbWJhItqgPVV67oKGDP1UiqDEY3k
Message-ID: <CANTFpSU7XaNKwe_FPsTCkxQYeq78Tqusr-nsB-Ww0_teuiWdEA@mail.gmail.com>
Subject: Re: [PATCH v5 0/1] i2c: designware: fix probe ordering for AMD GPIO
 on Lenovo Yoga 7 14AGP11
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Mario Limonciello <mario.limonciello@amd.com>, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org, 
	basavaraj.natikar@amd.com, linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37086-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amd.com:email,intel.com:email]
X-Rspamd-Queue-Id: 03E945719CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 19:57, Bartosz Golaszewski wrote:
> If you added wait_for_device_probe() right before requesting the
> interrupt, does it help?

I'll test this. One concern: wait_for_device_probe() waits for all
pending probes to complete, not just pinctrl-amd. Calling it
unconditionally in dw_i2c_plat_probe() would affect every machine
running i2c-designware, potentially adding boot latency broadly.

Would it make sense to guard it with the same DMI check, or is the
intention to make this unconditional?

Thanks,
Hardik

On Mon, 18 May 2026 at 19:58, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, May 18, 2026 at 07:53:28PM +0530, Hardik Prakash wrote:
> > On Mon, May 18, 2026 at 19:35, Bartosz Golaszewski wrote:
> > > What is blocking the pinctrl driver from probing? Does it return
> > > -EPROBE_DEFER for some reason? Pin control core is ready at
> > > core_initcall() so it should work in theory.
> >
> > On Mon, May 18, 2026 at 19:16, Mario Limonciello wrote:
> > > Please try arch_initcall instead.
> >
> > Tested arch_initcall + patch 1. GPIO 157 now fires at 0.255s (earlier
> > than any previous boot), but arbitration errors still occur at 2.309s:
> >
> >   subsys_initcall + patch 1:   GPIO 157 at ~0.310s, arbitration errors
> >   arch_initcall + patch 1:     GPIO 157 at ~0.255s, arbitration errors
> >   patch 1 + patch 2 (v5):     no arbitration errors, touchscreen works
> >
> > The driver is not returning -EPROBE_DEFER. The problem is that
> > amd_gpio_probe() hasn't completed by the time i2c_designware fires,
> > even with arch_initcall. Promoting the initcall level gets the driver
> > registered earlier, but probe itself takes time, and i2c_designware
> > catches it mid-probe regardless of registration timing.
> >
> > This is why device_is_bound() works where initcall promotion does not
> > =E2=80=94 it waits for probe completion, not just driver registration.
>
> The alternative solution is to have a registered notifier for the device =
in
> question. But not sure if it will be less-invasive than given solution.
>
> > On Mon, 18 May 2026 at 19:41, Bartosz Golaszewski <brgl@kernel.org> wro=
te:
> > > On Mon, May 18, 2026 at 4:08=E2=80=AFPM Mario Limonciello
> > > <mario.limonciello@amd.com> wrote:
> > > > On 5/18/26 09:05, Bartosz Golaszewski wrote:
> > > > > On Mon, May 18, 2026 at 3:46=E2=80=AFPM Mario Limonciello
> > > > > <mario.limonciello@amd.com> wrote:
> > > > >> On 5/18/26 08:40, Hardik Prakash wrote:
> > > > >>> On Mon, May 18, 2026 at 18:17, Mario Limonciello wrote:
> > > > >>>> I'd still like to avoid a quirk if we can.
> > > > >>>>
> > > > >>>> I know my proposed patch to try to probe at an earlier stage d=
idn't
> > > > >>>> work, but could you perhaps try pulling pinctrl-amd even earli=
er?
> > > > >>>>
> > > > >>>> Maybe fs_initcall()?
> > > > >>>
> > > > >>> Tested. fs_initcall + patch 1 still produces the same arbitrati=
on
> > > > >>> errors:
> > > > >>>
> > > > >>>     subsys_initcall + patch 1:   arbitration errors persist
> > > > >>>     fs_initcall + patch 1:       arbitration errors persist
> > > > >>>     patch 1 + patch 2 (v5):     clean boot, touchscreen fully f=
unctional
> > > > >>>
> > > > >>> The initcall level does not appear to be the determining factor=
 on
> > > > >>> this hardware. i2c_designware is still probing AMDI0010:02 befo=
re
> > > > >>> pinctrl-amd finishes regardless of how early pinctrl-amd regist=
ers.
> > > > >>> The explicit device_is_bound() deferral in patch 2 is the only
> > > > >>> approach that has worked.
> > > > >>
> > > > >> Please try arch_initcall instead.
> > > > >
> > > > > What is blocking the pinctrl driver from probing? Does it return
> > > > > -EPROBE_DEFER for some reason? Pin control core is ready at
> > > > > core_initcall() so it should work in theory.
> > > >
> > > > Currently it's module_platform_driver() IE device_initcall().
> > > >
> > > > That's why I think we "should" be able to move it a lot earlier.
> > >
> > > I mean with fs_initcall() change - what's blocking it now?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

