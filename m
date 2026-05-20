Return-Path: <linux-gpio+bounces-37169-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eITYOepADWprvAUAu9opvQ
	(envelope-from <linux-gpio+bounces-37169-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 07:04:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D289587AE2
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 07:04:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC3E23051168
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 05:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17DAA31328C;
	Wed, 20 May 2026 05:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIZk0PEN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C96F3385AC
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 05:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779253365; cv=pass; b=JbaRwfdyWMxsw7aIOOqb8TxsbuZLGJezIvea+6/zeiv8DD1aSxUrDMqZHFHx2UtvvEZsRZp8P4lXEbLSrct7au2YYTlP5DGHLMBFCurhZQ4ebZUqXl/Vc65uDXysWqXMdUqs8ee1zPFRmqrq9yfUyjGg2UNq966nvH0vYEOzeBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779253365; c=relaxed/simple;
	bh=kOMU4JRALAx1PPMHviOfocpGbFLDk2uw1Uwsz4sKjmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lhynlERxavTBxefF7I0eO69lxxf+/zuA9G7vHSON6q+hhzdrRaCXTTZPQiRUsXRWGr+HrPjaU4eyTC2wthWwKOgGqGoUw7XLxQsRgnWkAOKOWUu6X73TQj/fCgQkehCdsdrhJLQh/ywRsICmsFSSYPKsjTynqLXcl4Akav1Ybk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIZk0PEN; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7bf14e33f5bso38732647b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 22:02:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779253362; cv=none;
        d=google.com; s=arc-20240605;
        b=cw1RF312b/jBk+W6KF0zLwSUk9j2HIEKt4AB1r3q0yxhkxVcFf08oVe1jLof8aUk21
         imkajWk38PR/UqHeuauRCB9J8RdbE9Wt/NZLIl+/YUVgU5YVdtRocaNf3rBm0TEgi/h7
         G/Xgb2HpSQbahZogW3rI2vhpazeJTkm+0ImPHmIzEGFD2BuWt00Em7z0rNcBBLqXI/vC
         AoNMKssnGDK1ZvCf4wSHhwXtWpO5oFvAxf35fprTWp1uPiPit0UK0yg7ouZy28+gum78
         PELstEgmyDyBVShBp0w1BIIx/KF+4KcZuLV0yvxqM52h74lvPY1YgRfE3T5+oHXcWUsX
         tNyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IRQZffS2t0p0/rIvRDX0SBwpdKZj3l88oeth2+pVups=;
        fh=UHxHfttyRScKzKs4xTjEwCoCZeZC2qIm259kGDAwmN4=;
        b=TM4P2bZH5s0byDRxRTlwnmcBy6e5SJsSxBHhrz7f3GBOD86Kusfgi7LGUSOX3c0yKU
         2mTFFCuR3qURfXUkUgR28yU02W5bzzMrU8n4zsNC+fCdR0cGTsojDDDnqKnUW8/l65kA
         tLzM80/dIONcfnR/UvaA364ugdgl/2Kug6ex6yFZODGJNroE54J24+kMoO3fUAWFlaRK
         BTTxqIdl0ScoDqAqzAIj4C6WBZ9hD4IwHaNWEiKejBbFYqdYyWTt5Y30kk0ks8jKZ6/I
         npWO84x4WjpffY2m5sCHHew7+tY8H6290YzJlyX8m+3n75gwKvn5PO1rlzRRJpvMe7SA
         Gm4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779253362; x=1779858162; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IRQZffS2t0p0/rIvRDX0SBwpdKZj3l88oeth2+pVups=;
        b=VIZk0PENp9raoyuZwcZWY33iDSS4mT9MTXxJQshGwCMFfnpYwtQsj2DXCwnqzRqPia
         wxmjnwEacjZ+ijTsLyzu9UJStf9QsuzSi2M5x7lQy7BZgrXQ7dx+XEBP3OLiWVF3MDWP
         CZZmTPmwEqXeYFqcmOuRJ0lhKrsTCh2e9Vw4rsaLFR8GTnna5SO+1gFT5nwOT4bsocxT
         VMxHnTj7hzwVv9EzVMosnLcN5NTBYp8dD1cwwmcNsG/bBPpyT5hwN81z8ycRa7H2JSk7
         L7GjUwVKf7AQAhzW0JGNEKx3SItPJTHvZxR696avbBrrm6R4tgKiwRH6o1exUS0KnTEA
         DAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779253362; x=1779858162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IRQZffS2t0p0/rIvRDX0SBwpdKZj3l88oeth2+pVups=;
        b=YBQ1Hd4NDjme5cM/lqkprZmQYJx8ThWqvKQwaqRDqNHBjXCNg76SnfDVU2H8p+8kqa
         OvvrHr3ekJFdOgB6C8ef/LGYf5DIzy5Xok8U0Pn/0SLf6QJG5FKeGAhjJ5YZ5S/jtGpN
         6qePJef4sWV7O9yp1tje8eo3Bl+DEu5m5tt82shITVedjEsyECI0sJz9ZAzNVubj0lUg
         jGOlp/wGDn8UZjZkHPlQCLcCe/Qvhk27+Go3bxruAiudm1JO7T2QKZLe/7SWpC0uoTTz
         r+u8wf1SCGv9R0aw9nXBOJDQJtLXRU10P9Sv9E9DOcSAOwKaFAkPkApTdT3NYtst7gin
         LI7A==
X-Forwarded-Encrypted: i=1; AFNElJ+2IlTNy5GWLgN8588KGyxnHDA60pIjXpjBqGSV2ivCb0AQAlEuS2+cui/DvlOzYDhulWvkON6FL8ui@vger.kernel.org
X-Gm-Message-State: AOJu0YzZnbhlNI0662b+zPAHgVTy3VVY4wv/eEDC5tZzoOWkAwhX4Wcl
	4pDgdWLhxKtv/4Uve9hRs3ca4tKXe4otLnGs/F+2KG0U99i9rrJQeuul6T4xqewxFMDVwRdSHVg
	3/XXzV7M5Ktxv7sWrNMQ1G7QN/+QDj8I=
X-Gm-Gg: Acq92OFeN+YFAeYtxukYWdi4Ogr1w4ILzOIG8vG7b1Mk/2K6j9oq3M6WWdOpWoHowJt
	+cGuCQB25p4DAphQwqpiT8WgxN2ZzdN9Sy9qtz9sG55E6wYx+TmoucJSYBQzkURde/s97xb4mXu
	XHR5flEWkOpyrrFI+9Azi0UvAwmpc+pf9Hf22DwA24OnpoWU6oLvQKyBm/PMY8aVCMWfjj96iFK
	Wk89DiSWcobCO+u1qR3/qZPI6wgP/Efiu+s7lUjoS7UMjl25stnXKwQGUwoh1sxq6kW8km0FSeh
	W1yRHLoJccYydoSpND86t6S8FK7+tzovvwZYyQGISNI2kZLi/iYMkaXBcmhMlu1gwBi5NtwCing
	vx5AOZ5ztSde3oubqaFEae7wD7Ri5cBTeuryWY5sncSU8645fGdiu9Oqujw==
X-Received: by 2002:a05:690c:d84:b0:7cf:d9bc:8079 with SMTP id
 00721157ae682-7cfd9bcee40mr45213447b3.32.1779253362325; Tue, 19 May 2026
 22:02:42 -0700 (PDT)
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
 <CANTFpSU+wTQeESDGqV=xizrJeQw_LA8y7stDYMm=H-UrbWXeYQ@mail.gmail.com> <e31e28e7-62b0-44a3-b155-57504be09c69@amd.com>
In-Reply-To: <e31e28e7-62b0-44a3-b155-57504be09c69@amd.com>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Wed, 20 May 2026 10:32:31 +0530
X-Gm-Features: AVHnY4ISQ7dzkyung1tqqCXziMIawOzymKcYnxYgzGW2fo_vdd7Wy2YItbxaY20
Message-ID: <CANTFpSVnhst-25KPa-m2e14rR_dqJNq_s6k_ZO-MFazqLa=AEQ@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-37169-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4D289587AE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 02:23, Mario Limonciello wrote:
> In the same line of thinking - how about something like this instead
> (AI generated and attached).
>
> Basically walk through the resources at probe time and make sure they're
> all bound.

Tested. Works perfectly =E2=80=94 clean boot, no arbitration errors, touchs=
creen
and stylus fully functional:

  patch 1 + generic GPIO dependency check:   clean boot, touchscreen works

The generic approach is better. With this patch, patch 2 (the
DMI-specific i2c-designware deferral) is no longer needed.

Note: I applied kzalloc(sizeof(*ref), GFP_KERNEL) in place of
kzalloc_obj(*ref, GFP_KERNEL), and moved the goto outside the
scoped_guard using a local bool. Happy to share the exact diff I tested
if useful.

Thanks,
Hardik

On Wed, 20 May 2026 at 02:23, Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
>
>
> On 5/19/26 14:49, Hardik Prakash wrote:
> > On Tue, May 19, 2026 at 20:18, Mario Limonciello wrote:
> >> I like this idea. I guess something like this:
> >> [gpiolib-acpi-core.c patch]
> >
> > Tested patch 1 + gpiolib-acpi deferral, without patch 2. Arbitration
> > errors persist:
> >
> >    patch 1 + gpiolib-acpi deferral:   arbitration errors, WACF2200 does=
 not probe
> >    patch 1 + patch 2 (v5):           clean boot, touchscreen fully func=
tional
> >
> > I think the reason is that i2c-designware does not call acpi_get_gpiod(=
)
> > during its probe. The GpioInt resource is on the WACF2200 touchscreen
> > device (TPNL), not on the I2C controller itself. So the deferral in
> > acpi_get_gpiod() never triggers for AMDI0010:02 -- nothing in that prob=
e
> > path requests a GPIO descriptor.
> >
> > The race is between amd_gpio_probe() completing and dw_i2c_plat_probe()
> > starting for AMDI0010:02. Without something that explicitly checks
> > whether the GPIO controller is fully bound before the I2C controller
> > probes, the race remains.
> >
>
> In the same linke of thinking - how about something like this instead
> (AI generated and attached).
>
> Basically walk through the resources at probe time and make sure they're
> all bound.
>
> > Thanks,
> > Hardik
> >
> > On Wed, 20 May 2026 at 00:37, Hardik Prakash
> > <hardikprakash.official@gmail.com> wrote:
> >>
> >> On Tue, May 19, 2026 at 19:58, Mario Limonciello wrote:
> >>> You add a debug statement to amd_gpio_irq_enable() too right? Can you
> >>> please share your debugging messages patch and full log?
> >>
> >> I did not add debug to amd_gpio_irq_enable() - the statements were
> >> only in amd_gpio_probe() and dw_i2c_plat_probe(). I can add one there
> >> if useful, but given Bart's suggestion below I'll hold off unless
> >> needed.
> >>
> >>> What is the boot time impact to adding device_is_bound() check?
> >>
> >> I haven't measured this explicitly. The deferral only fires on DMI-
> >> matched hardware (Lenovo 83TD), so on other machines dw_i2c_defer_for_
> >> amd_gpio() returns 0 immediately with no overhead.
> >>
> >> On Tue, May 19, 2026 at 20:18, Mario Limonciello wrote:
> >>> I like this idea.
> >>
> >> I'll test this patch, and let you know how it goes.
> >>
> >> Thanks,
> >> Hardik
> >>
> >> On Tue, 19 May 2026 at 20:18, Mario Limonciello
> >> <mario.limonciello@amd.com> wrote:
> >>>
> >>>
> >>>
> >>> On 5/19/26 09:39, Bartosz Golaszewski wrote:
> >>>> On Tue, May 19, 2026 at 4:28=E2=80=AFPM Mario Limonciello
> >>>> <mario.limonciello@amd.com> wrote:
> >>>>>
> >>>>>>
> >>>>>> gpiochip_add_data() at 0.285952 makes the GPIO chip visible to the
> >>>>>> system before amd_gpio_probe() has finished. AMDI0010:02 starts pr=
obing
> >>>>>> at 0.301454 while amd_gpio_probe() is still completing. This is wh=
y
> >>>>>> device_is_bound() works and initcall promotion does not -- it wait=
s for
> >>>>>> probe completion, not just gpiochip registration.
> >>>>>
> >>>>> What is the boot time impact to adding device_is_bound() check?
> >>>>>
> >>>>> Bartosz, thoughts?
> >>>>>
> >>>>
> >>>> My thoughts are that ACPI could use some fw_devlink. :) It's not a n=
ew
> >>>> problem, we've fixed it for OF systems.
> >>>>
> >>>> Could we modify gpiolib-acpi.c to return -EPROBE_DEFER if the parent
> >>>> device of the GPIO chip is not bound yet instead? When resolving the
> >>>> reference to the remote GPIO controller we have an address of the
> >>>> struct acpi_device. I suppose there's a platform device that is its
> >>>> child and then the logical GPIO controller device, is that correct?
> >>>> Can we check if the platform device in question is bound at the
> >>>> subsystem level?
> >>>>
> >>>> Bart
> >>>
> >>> I like this idea.  I guess something like this:
> >>>
> >>> diff --git a/drivers/gpio/gpiolib-acpi-core.c
> >>> b/drivers/gpio/gpiolib-acpi-core.c
> >>> index eb8a40cfb7a98..e3511398b1f84 100644
> >>> --- a/drivers/gpio/gpiolib-acpi-core.c
> >>> +++ b/drivers/gpio/gpiolib-acpi-core.c
> >>> @@ -142,6 +142,13 @@ static struct gpio_desc *acpi_get_gpiod(char *pa=
th,
> >>> unsigned int pin)
> >>>           if (!gdev)
> >>>                   return ERR_PTR(-EPROBE_DEFER);
> >>>
> >>> +       if (gdev->dev.parent) {
> >>> +               scoped_guard(device, gdev->dev.parent) {
> >>> +                       if (!device_is_bound(gdev->dev.parent))
> >>> +                               return ERR_PTR(-EPROBE_DEFER);
> >>> +               }
> >>> +       }
> >>> +
> >>>           /*
> >>>            * FIXME: keep track of the reference to the GPIO device so=
mehow
> >>>            * instead of putting it here.
> >>>

