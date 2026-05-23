Return-Path: <linux-gpio+bounces-37392-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 67L9Ea5cEWpalAYAu9opvQ
	(envelope-from <linux-gpio+bounces-37392-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 09:52:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 938185BDC8B
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 09:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 805763014572
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 07:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE793451C6;
	Sat, 23 May 2026 07:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tIT2cJwb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD08E283CBF
	for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 07:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779522729; cv=pass; b=HtNKtXLJ/Roh/r/+a8SSf6lhgt+9Dou35AzNEp/NQlQYdu3NhaXgASEKCBgibouGxA1e/sHmJyuTHNvM6bJRi02Q300ncFrIkhUwbOGRYi5okqqw1DqH/s+FoFrA9MhKnMJ2fo1ZXNK+4z+aRR+UpO8mznt4vyJcZfl/OzgEh+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779522729; c=relaxed/simple;
	bh=MZYvPVFypa3CJDmmhPXW8Fs9lY6t17REUNqPpBk2jIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DWdo9nDa5V8of6cbaoq8e38gbFARy64g4ve3HbPijzWG6CFfuIlguSJTWIP1kr9/3ndrmKdgn7Jh3Bq+VXkWjavj2ObS+CkS3nmklj1OTJWIjajGLiQ6vYRig5e27hJL/lFmreQVj+qKky+I3kasu84vU5ei7SwpAjxCiEFOoc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tIT2cJwb; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-65dbe04fc1bso8488877d50.1
        for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 00:52:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779522727; cv=none;
        d=google.com; s=arc-20240605;
        b=kkBEqhQv+yt0XCGExc8Pgw2pmcyGpzxWVU0FBb0YOSoxIj7WWbp2YE+4Ic5+klY3+f
         p4w64Em0kXK3EU0q5kcPA1qzgNC3udsYIxMKsE0jR4FBEY8NI1bVljnQ6c28j6fXr49h
         rk2Z61cKhoSOKPKVDZiTWKtE6R6v9X56M70/OigQB6+0TqhWIBUYXMDkjXeE1DOQ8JlI
         eVbJmUYHz3yLvqHccyWmZahxNnGkYTirBRcsgU/LRlxcYh7J8EVOVFXvsombAqhlR6dg
         SE7uZsFVEWYQX9oASLuso5W1tl89vR/pb8oyQMqSQQKRTJKyYRr1ckBiB72msjBjIiWU
         gZzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bRt2RuH8xpBX2bONTpScPJtz9TEQ7OxlORJq33oz68A=;
        fh=U0w4pmIDsJnDtg4hr5+lrPRX45zNyzzPo43O3quc+MI=;
        b=VmAuyQL2sbAXuY9/r4qWsVBXdeHH3obEWUB0JcxnPq3h3HwAoG6v2Syhw6Vi6kxxo/
         CHtPEsM2SIXeCkldJl9aJNYXo3DqzpZ5Vg4RL5JIVHV0IRN6mPIQv2ek/q6TnXaEpBCC
         ZrEgXgdVJKvQhBFLGQirmwnjVpcFW+8WJHOPesGh3Zgb8mO28c/gj5sIupsKrq24C5bt
         LmD3EDxWGvWF3W+h+lRsStwiKa6348el3NIflV5JiQjNB55tChA9bbiEoWYFIYGMxvDJ
         95NJ7R76clN12lpO/F1aGmFO58CkBW3EAqUy/gEuuktn9eXFqIcdUkg4xr+1e//VIIlD
         byUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779522727; x=1780127527; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRt2RuH8xpBX2bONTpScPJtz9TEQ7OxlORJq33oz68A=;
        b=tIT2cJwb3ZN+v4S9PO6l9htO4hixgN0xlsbKA5pcr8g+u5UDO40l6CzIc3P8V4sR+M
         akaw84ntNAs9mCCCXcCYJ0TSpeXeSD6rcnGZxIXQgD8Q5+Jap0/RcT2zDB7PFw88pGjF
         4hUrvEpS4CATJYH1DcSCta0EGy2ixONAJtDWlhyJnLyOsnZAveAiUFDHu/4AoyqqRfZo
         djnte4TxRzJzyI+ZxmsR8ZahohJH4SUScvEIoO2opRVlhqTY7KVao/ftWTjHd6lGHmTP
         y/cxJrBxsmsogXFBDq+kkfBOJsQZljVgFHngMyWJFixTyRoAB2M+G2glmXPR1hg7lh/6
         c+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779522727; x=1780127527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bRt2RuH8xpBX2bONTpScPJtz9TEQ7OxlORJq33oz68A=;
        b=jTfDG3pnpciMqZw/D5VyJw3oUYRicMbGrypz386Oh3Z/91eknZuXzd1j3CjGb2N04u
         CjKFR1bl/95khTXCrr8l4fp9DKydpW/ESjISZbgRdIVT7cPUKO/F+KRyDUERwwvPleW6
         Pyz/aUnjBM5Loggs/SUiFOeWSdBxhYLc7w5e6hOcr8oi1LIQdAXD73z37zIc/eazAMAn
         g4yMctX7tzNbuL10j6Ip4Yuv78kMh+xQgRPGCp/ovUOYO3KDLMXmM3pG25shBlvLzGgS
         X9LjO2KnArq2JiougAjYMWHDE4Wr52G11jvIXKLJbqrSLBUMAiw8JodLAOHkMSQ99b+T
         ZiEA==
X-Forwarded-Encrypted: i=1; AFNElJ9UxoTOkfOpE/1JKzvELKg96zqFisy19gIHkBYV0stYNyPMY8Gj3dp+w3gsUvZDBDjnaUmx1Q1IAhN6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8d18LSXYhAgZS348Eh5ApuLH+NyN84Qj2S/eHxYjyRwZYbV8V
	vUkF/NKtNrYXUdBbLDQ7NuEGymsed2AT+YzRoMD/Qk5/0z2MbM4hntIZ5u5Gcx+AwHhwjSeEW+F
	YxbuRU2YSeMovBeh2MNQ2RPFHN8wcViw=
X-Gm-Gg: Acq92OHX7i33ypTX8CKNa0moFu8JeT7De4L9jZ0yiTfeMqZXXS1qVWgGwXurcdxxJBK
	SGLUpGz6j0y/+UslQQhWddYPXVWHKIcUArpqiKjymViVMBMZoewCWP7QAdEvAliML6/d/ROZyRI
	URfJW9h196iYrGJ4YGlZJzr8JF9KnBOencl1u6UbrmcwRwNv7Yj68Okrn6n2gAVeaen5JOcuWSL
	BQMyBrJvsp9WbgIom7QzXqhxFyvZ2GIoMZvbmYpIk5DSg3rcARHGZz6Csem8AaZYFSfpgNjUifI
	z1YgFRYs34cqdbwLDc8QAV0NSd4B1jlrf1j7hmyKtZfSdtQoPlqwyj5Yow6bW1qrPrrXlamKtZd
	o4KLHCx40nlqx6IzLk5POZRysOn79Pk4VOoeKaJyK8kzBCBp7nxij5Mj9m5QSJqAH/wwS8w==
X-Received: by 2002:a05:690e:4383:b0:65c:6f79:1dd0 with SMTP id
 956f58d0204a3-65ec9774785mr5012436d50.20.1779522726802; Sat, 23 May 2026
 00:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518122814.8975-1-hardikprakash.official@gmail.com>
 <CANTFpSWGC7GsAY-3UvPtBZzqjNek-T5haiDb59QYRoRgwuQf1w@mail.gmail.com>
 <7d0f0cf9-1936-4cf6-a425-228a37f83137@amd.com> <CAMRc=MdS_BVKb=FQLhky=8dpghBSoHeBhUk0LM5hROFxmJeyGQ@mail.gmail.com>
 <9d5da93e-bbe0-4359-9f17-e3c6b3a5cb34@amd.com> <CAMRc=MfT_WVMxPnYZW=mg52PHew0O4VQMGFrfo6G9vxZDDoArw@mail.gmail.com>
 <CANTFpSUX5rYhuTQH3dTTvzW+_yhW8Gs0U=A1t_8LDzKz4dzzAw@mail.gmail.com>
 <agsh652HlC4rg1_1@ashevche-desk.local> <CANTFpSU7XaNKwe_FPsTCkxQYeq78Tqusr-nsB-Ww0_teuiWdEA@mail.gmail.com>
 <f0ee2722-1e56-41b1-b70c-5503a2495853@amd.com> <CANTFpSWT+cR8Yxyr5jrB2MUidqKteWuPjHOyK_rpSkDUN6SWQQ@mail.gmail.com>
 <c4993bce-5d39-416f-90ed-d870f4ac9254@amd.com> <CAMRc=McSLEF_nrkRdJJu9=Bc_KmPWYKDHd6tOD9tJqs0fksv0w@mail.gmail.com>
 <498bad3f-6a0c-4da8-b645-1cc837ba1836@amd.com> <CANTFpSWB6Fb3mo9sUtxo2Aaa-Ryx-YqUw-tqT-y1RpurJfq57A@mail.gmail.com>
 <CANTFpSU+wTQeESDGqV=xizrJeQw_LA8y7stDYMm=H-UrbWXeYQ@mail.gmail.com>
 <e31e28e7-62b0-44a3-b155-57504be09c69@amd.com> <CANTFpSVnhst-25KPa-m2e14rR_dqJNq_s6k_ZO-MFazqLa=AEQ@mail.gmail.com>
In-Reply-To: <CANTFpSVnhst-25KPa-m2e14rR_dqJNq_s6k_ZO-MFazqLa=AEQ@mail.gmail.com>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Sat, 23 May 2026 13:21:54 +0530
X-Gm-Features: AVHnY4IJEXKHf5m8M7KZKcY-PLPegQZldHYm7de-9MXUu6mKX4FhMCo8IHYX57E
Message-ID: <CANTFpSWLUfNZyjJXApgf60MyJ9imWYVKLy9vj=Lin3Lh=qoAMw@mail.gmail.com>
Subject: Re: [PATCH v5 0/1] i2c: designware: fix probe ordering for AMD GPIO
 on Lenovo Yoga 7 14AGP11
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org, 
	basavaraj.natikar@amd.com, linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37392-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 938185BDC8B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 02:23, Mario Limonciello wrote:
> In the same line of thinking - how about something like this instead
> (AI generated and attached).

I've cleaned up your patch (fixed kzalloc_obj, moved goto outside
scoped_guard, wrote a proper commit message) and am planning to submit
it as v6 with Co-developed-by and Signed-off-by carrying your name.

Please let me know if you're happy with that, or if you'd prefer to
submit it yourself.

Thanks,
Hardik

On Wed, 20 May 2026 at 10:32, Hardik Prakash
<hardikprakash.official@gmail.com> wrote:
>
> On Tue, May 19, 2026 at 02:23, Mario Limonciello wrote:
> > In the same line of thinking - how about something like this instead
> > (AI generated and attached).
> >
> > Basically walk through the resources at probe time and make sure they'r=
e
> > all bound.
>
> Tested. Works perfectly =E2=80=94 clean boot, no arbitration errors, touc=
hscreen
> and stylus fully functional:
>
>   patch 1 + generic GPIO dependency check:   clean boot, touchscreen work=
s
>
> The generic approach is better. With this patch, patch 2 (the
> DMI-specific i2c-designware deferral) is no longer needed.
>
> Note: I applied kzalloc(sizeof(*ref), GFP_KERNEL) in place of
> kzalloc_obj(*ref, GFP_KERNEL), and moved the goto outside the
> scoped_guard using a local bool. Happy to share the exact diff I tested
> if useful.
>
> Thanks,
> Hardik
>
> On Wed, 20 May 2026 at 02:23, Mario Limonciello
> <mario.limonciello@amd.com> wrote:
> >
> >
> >
> > On 5/19/26 14:49, Hardik Prakash wrote:
> > > On Tue, May 19, 2026 at 20:18, Mario Limonciello wrote:
> > >> I like this idea. I guess something like this:
> > >> [gpiolib-acpi-core.c patch]
> > >
> > > Tested patch 1 + gpiolib-acpi deferral, without patch 2. Arbitration
> > > errors persist:
> > >
> > >    patch 1 + gpiolib-acpi deferral:   arbitration errors, WACF2200 do=
es not probe
> > >    patch 1 + patch 2 (v5):           clean boot, touchscreen fully fu=
nctional
> > >
> > > I think the reason is that i2c-designware does not call acpi_get_gpio=
d()
> > > during its probe. The GpioInt resource is on the WACF2200 touchscreen
> > > device (TPNL), not on the I2C controller itself. So the deferral in
> > > acpi_get_gpiod() never triggers for AMDI0010:02 -- nothing in that pr=
obe
> > > path requests a GPIO descriptor.
> > >
> > > The race is between amd_gpio_probe() completing and dw_i2c_plat_probe=
()
> > > starting for AMDI0010:02. Without something that explicitly checks
> > > whether the GPIO controller is fully bound before the I2C controller
> > > probes, the race remains.
> > >
> >
> > In the same linke of thinking - how about something like this instead
> > (AI generated and attached).
> >
> > Basically walk through the resources at probe time and make sure they'r=
e
> > all bound.
> >
> > > Thanks,
> > > Hardik
> > >
> > > On Wed, 20 May 2026 at 00:37, Hardik Prakash
> > > <hardikprakash.official@gmail.com> wrote:
> > >>
> > >> On Tue, May 19, 2026 at 19:58, Mario Limonciello wrote:
> > >>> You add a debug statement to amd_gpio_irq_enable() too right? Can y=
ou
> > >>> please share your debugging messages patch and full log?
> > >>
> > >> I did not add debug to amd_gpio_irq_enable() - the statements were
> > >> only in amd_gpio_probe() and dw_i2c_plat_probe(). I can add one ther=
e
> > >> if useful, but given Bart's suggestion below I'll hold off unless
> > >> needed.
> > >>
> > >>> What is the boot time impact to adding device_is_bound() check?
> > >>
> > >> I haven't measured this explicitly. The deferral only fires on DMI-
> > >> matched hardware (Lenovo 83TD), so on other machines dw_i2c_defer_fo=
r_
> > >> amd_gpio() returns 0 immediately with no overhead.
> > >>
> > >> On Tue, May 19, 2026 at 20:18, Mario Limonciello wrote:
> > >>> I like this idea.
> > >>
> > >> I'll test this patch, and let you know how it goes.
> > >>
> > >> Thanks,
> > >> Hardik
> > >>
> > >> On Tue, 19 May 2026 at 20:18, Mario Limonciello
> > >> <mario.limonciello@amd.com> wrote:
> > >>>
> > >>>
> > >>>
> > >>> On 5/19/26 09:39, Bartosz Golaszewski wrote:
> > >>>> On Tue, May 19, 2026 at 4:28=E2=80=AFPM Mario Limonciello
> > >>>> <mario.limonciello@amd.com> wrote:
> > >>>>>
> > >>>>>>
> > >>>>>> gpiochip_add_data() at 0.285952 makes the GPIO chip visible to t=
he
> > >>>>>> system before amd_gpio_probe() has finished. AMDI0010:02 starts =
probing
> > >>>>>> at 0.301454 while amd_gpio_probe() is still completing. This is =
why
> > >>>>>> device_is_bound() works and initcall promotion does not -- it wa=
its for
> > >>>>>> probe completion, not just gpiochip registration.
> > >>>>>
> > >>>>> What is the boot time impact to adding device_is_bound() check?
> > >>>>>
> > >>>>> Bartosz, thoughts?
> > >>>>>
> > >>>>
> > >>>> My thoughts are that ACPI could use some fw_devlink. :) It's not a=
 new
> > >>>> problem, we've fixed it for OF systems.
> > >>>>
> > >>>> Could we modify gpiolib-acpi.c to return -EPROBE_DEFER if the pare=
nt
> > >>>> device of the GPIO chip is not bound yet instead? When resolving t=
he
> > >>>> reference to the remote GPIO controller we have an address of the
> > >>>> struct acpi_device. I suppose there's a platform device that is it=
s
> > >>>> child and then the logical GPIO controller device, is that correct=
?
> > >>>> Can we check if the platform device in question is bound at the
> > >>>> subsystem level?
> > >>>>
> > >>>> Bart
> > >>>
> > >>> I like this idea.  I guess something like this:
> > >>>
> > >>> diff --git a/drivers/gpio/gpiolib-acpi-core.c
> > >>> b/drivers/gpio/gpiolib-acpi-core.c
> > >>> index eb8a40cfb7a98..e3511398b1f84 100644
> > >>> --- a/drivers/gpio/gpiolib-acpi-core.c
> > >>> +++ b/drivers/gpio/gpiolib-acpi-core.c
> > >>> @@ -142,6 +142,13 @@ static struct gpio_desc *acpi_get_gpiod(char *=
path,
> > >>> unsigned int pin)
> > >>>           if (!gdev)
> > >>>                   return ERR_PTR(-EPROBE_DEFER);
> > >>>
> > >>> +       if (gdev->dev.parent) {
> > >>> +               scoped_guard(device, gdev->dev.parent) {
> > >>> +                       if (!device_is_bound(gdev->dev.parent))
> > >>> +                               return ERR_PTR(-EPROBE_DEFER);
> > >>> +               }
> > >>> +       }
> > >>> +
> > >>>           /*
> > >>>            * FIXME: keep track of the reference to the GPIO device =
somehow
> > >>>            * instead of putting it here.
> > >>>

