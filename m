Return-Path: <linux-gpio+bounces-37161-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KLGGPu0DGrClAUAu9opvQ
	(envelope-from <linux-gpio+bounces-37161-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 21:07:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 199A0584045
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 21:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC8EA3022F4D
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 19:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7ED03EA942;
	Tue, 19 May 2026 19:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rfa8mWyv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A9331F99D
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 19:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779217651; cv=pass; b=amnAy7L3lohO3d6q8Ma/SdOhVkUW0DizH1P2lnqTlxtRJTX0tEvLMkAzRjUN2n6ptFwegIWCKj0uSmB6HY3NQY5ZN1TDq96JuQ4oI2RumcRba8booy4Sqs+sRDcw1WEa9iVOAYBzWJJe054pwUB7eIpQaWLIfLnhZ2nPXjm8CKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779217651; c=relaxed/simple;
	bh=Z+OAyukKoZU4RGHbotX4DJNahNNzuKMHL9tY24/Bsfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YEwjeC8zI1Ne0bwjOrqHk/oklWrk2vPO8VuFUuXFFTF6raVB0bL8m5UFXwKY3sPR9pSTmGTKe33ZedvvjsjPA/AfmbDJlsx4byVZJO3yiTVzxsCC9oZN6Jo1o1EyGc3BUY5ni2neQIeeqgXz+F6j/iTe9MKHUhEWnlr9lbywnjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rfa8mWyv; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-65c477a3278so4202211d50.3
        for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 12:07:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779217649; cv=none;
        d=google.com; s=arc-20240605;
        b=Q8xVkCIiFx00MiANujadjejJ8oXvoNf45/LL+Q7Yn4fFtuP2Vvt2GdzYltHjuSTWue
         atNn9nFXqXqSbIQQP5Y6Rf0o2IB8aQB5lEfk19OsaYXFPMTyPKkDQH3qpLTcPKGmPF9c
         zYWyGjYpqTfuy1nQi3srka9lqvZXTKb+wWZQddqJZcGgact7rSJhi8pipokWFHtULrHI
         187WFYDZpa7RHDOr/aOwm2uJrf4a8JmmfcmjOxGQheyRyuBkOyS+AIhYEjbgpMc5q9WA
         8XeSkMycZXTTCEsNuu7yptwaOUI75W5wX/vNlcduRHUERywQbqhvhrvG+R7wxfqaLbD8
         ldcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6k2pw07xoUFAncnGMxOpwBVGQh1ig9EOyCZMb029UtA=;
        fh=QUP8MaKoyq5h3v6jtjeHCv6pZx/F8xko1w1ZwpOZ6IU=;
        b=cnSCeTCU5aUtPoQCM6s6EAeUBsdDMXpQ2aJSNxwKKKT+m1im0lg95tM58m1wY2hhUa
         /DXj82+P3dS4rU1OrhPgOd2yFKLODQYg+NtPpM4r40BIO2DhY8qfyp1UI0Si9+4wpYZQ
         xh+Em1aHn5ixZeoSacDFMOLAl808AOSnV+tVbozjL1tFLdcxIwA5RXFJ6ZFrSRQ4PXBv
         Em9lsrhpr1HWvpE35mQlQOkJg/jYuB/ZCmcwD4HidVBeyq/uUiIYeDpk6xlQkyFkgg+1
         xk4xjvwTMhTWagJmmYVQ/dKGoz9htX4D1cUjxDG8ggDgNltsQ94IfL39LK3+UPfRYomy
         /Z2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779217649; x=1779822449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6k2pw07xoUFAncnGMxOpwBVGQh1ig9EOyCZMb029UtA=;
        b=Rfa8mWyvc2x6u5VgMMaZwid3jZ6C8+xuY1VU/9nn/BQfvhfnUwd6hbn1p/uBSa0AT/
         Ybl0cPIfWNSe+mGKbxL4aZqJU5IY7av6rALsjN1WtOKg208yvLZOViyKbP51PNJ4qz+3
         NmnaQH9WeEEDkQR1odEUf2b74SPfwdqeQHPIfwXGsguCQhYvBZ8A+VMIQDGtd6UBnRm3
         GLmx2h66cd7bRC0lUKWsrIexIkV8e5msOMzTDbPBUf3Y3Sl8bb/rrZU6DkRVsvnfJYdz
         fCGTYJo9AmRF544f8h9LCPbUH6Up3fFlCjtjJzHKmXRuNkWzqMDfRF9C9/pbDLkyN6pi
         CWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779217649; x=1779822449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6k2pw07xoUFAncnGMxOpwBVGQh1ig9EOyCZMb029UtA=;
        b=I5SVhraQHP8t8ByLvPEzVW/KNV1GK0zGhCf+mVmmBnnEdagB4AGnaT/+RdRlbrOtjD
         aoAaQZz1S+oIH7Ag5lVyqw8eRsI+lCnOEgSMkVuOMtSb2/HuEkKJE1hEySit1EcxH6yf
         D9K8eH0VWBEeqlG1gQD5ibe0kbNSQL6Mx3ZdYZg88kgxDEZhDgqbvL6mV0ujhtms0Yxd
         V4hSjeKTjMpQCq5T6PfOsxiBT974qYTSNb2+kAwRedWJ7RimY8vZCRUgErvsASmhXQrg
         3lT2lzkYMGPy9uQGrAQBRm+ChCe0DVEhem5BBqykN0DcDzzeCOPyMoEYrWq6ydqjJGOZ
         tvyw==
X-Forwarded-Encrypted: i=1; AFNElJ92g5ua3Tvad4TCcmORpcjGHkj+K3Wo8M0NUVl8E4S+e0vn1r3l+DGNyTUMg5AEhX1IvQEJiOm7qML4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9WtSw5gXWcHnTlH24CLvspgUZy12OWCJv/Ry6jLaV5xkjFxst
	YmXk0V6e/9guBuPAQ3xa1cvEpur7nzZRWs/m9DZHJz3ggKCGAuZfVtQoHRR2uzG03ApiV0qwCOH
	2xl09kZSbPSrQqVKQNIReCtDt8cmVGPY=
X-Gm-Gg: Acq92OH6fEiY4oXk03+d49TQyy9AIZv8saBVl8QWbGgelzpar1h3wa419we7/1ikXXo
	QtIK2OwCOrZWnc2KjJKIiqVAhE0nrZtIUXSPSWfPaxv3G1FBrkrewsvzGHiPsmWSc0XkQP+Emei
	+2WOQ5URHgRPEfLBNbECzq5WBc2XV+HZ1yCP+SYZchD1HWEltIx/afw0XfmHXUErkQFyA5vmudE
	gfaZ5B4zxg3uj5nukJ8wy3HZCW27+e3BqbX8zPagGa2QzSdUuLhiF2rWBxE4VUdMPqtxorw0nqE
	0IyWF5QRVd6GjUbbCiuwQdyk2MaIwBaPas1bgirAqog/x6TB8oP2jQuoGYyUGE9V7ZdNCmdCzgP
	U0wDPEFFxV6PQp3fZh8PsnzQLdEPIMyRIyvmp27ZeVL8jiBsCuaQFITnFanpBMjRPNa9vuJSKZn
	n8hog=
X-Received: by 2002:a05:690e:d47:b0:651:be50:af09 with SMTP id
 956f58d0204a3-65e2267428cmr17622134d50.3.1779217648729; Tue, 19 May 2026
 12:07:28 -0700 (PDT)
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
 <f0ee2722-1e56-41b1-b70c-5503a2495853@amd.com> <CANTFpSWT+cR8Yxyr5jrB2MUidqKteWuPjHOyK_rpSkDUN6SWQQ@mail.gmail.com>
 <c4993bce-5d39-416f-90ed-d870f4ac9254@amd.com> <CAMRc=McSLEF_nrkRdJJu9=Bc_KmPWYKDHd6tOD9tJqs0fksv0w@mail.gmail.com>
 <498bad3f-6a0c-4da8-b645-1cc837ba1836@amd.com>
In-Reply-To: <498bad3f-6a0c-4da8-b645-1cc837ba1836@amd.com>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Wed, 20 May 2026 00:37:17 +0530
X-Gm-Features: AVHnY4JLPLREjlFQlvgLENpmGP3E8pQd4KIJLbfBlcZiF8utheggWRXZeetRwws
Message-ID: <CANTFpSWB6Fb3mo9sUtxo2Aaa-Ryx-YqUw-tqT-y1RpurJfq57A@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37161-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 199A0584045
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 19:58, Mario Limonciello wrote:
> You add a debug statement to amd_gpio_irq_enable() too right? Can you
> please share your debugging messages patch and full log?

I did not add debug to amd_gpio_irq_enable() - the statements were
only in amd_gpio_probe() and dw_i2c_plat_probe(). I can add one there
if useful, but given Bart's suggestion below I'll hold off unless
needed.

> What is the boot time impact to adding device_is_bound() check?

I haven't measured this explicitly. The deferral only fires on DMI-
matched hardware (Lenovo 83TD), so on other machines dw_i2c_defer_for_
amd_gpio() returns 0 immediately with no overhead.

On Tue, May 19, 2026 at 20:18, Mario Limonciello wrote:
> I like this idea.

I'll test this patch, and let you know how it goes.

Thanks,
Hardik

On Tue, 19 May 2026 at 20:18, Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
>
>
> On 5/19/26 09:39, Bartosz Golaszewski wrote:
> > On Tue, May 19, 2026 at 4:28=E2=80=AFPM Mario Limonciello
> > <mario.limonciello@amd.com> wrote:
> >>
> >>>
> >>> gpiochip_add_data() at 0.285952 makes the GPIO chip visible to the
> >>> system before amd_gpio_probe() has finished. AMDI0010:02 starts probi=
ng
> >>> at 0.301454 while amd_gpio_probe() is still completing. This is why
> >>> device_is_bound() works and initcall promotion does not -- it waits f=
or
> >>> probe completion, not just gpiochip registration.
> >>
> >> What is the boot time impact to adding device_is_bound() check?
> >>
> >> Bartosz, thoughts?
> >>
> >
> > My thoughts are that ACPI could use some fw_devlink. :) It's not a new
> > problem, we've fixed it for OF systems.
> >
> > Could we modify gpiolib-acpi.c to return -EPROBE_DEFER if the parent
> > device of the GPIO chip is not bound yet instead? When resolving the
> > reference to the remote GPIO controller we have an address of the
> > struct acpi_device. I suppose there's a platform device that is its
> > child and then the logical GPIO controller device, is that correct?
> > Can we check if the platform device in question is bound at the
> > subsystem level?
> >
> > Bart
>
> I like this idea.  I guess something like this:
>
> diff --git a/drivers/gpio/gpiolib-acpi-core.c
> b/drivers/gpio/gpiolib-acpi-core.c
> index eb8a40cfb7a98..e3511398b1f84 100644
> --- a/drivers/gpio/gpiolib-acpi-core.c
> +++ b/drivers/gpio/gpiolib-acpi-core.c
> @@ -142,6 +142,13 @@ static struct gpio_desc *acpi_get_gpiod(char *path,
> unsigned int pin)
>          if (!gdev)
>                  return ERR_PTR(-EPROBE_DEFER);
>
> +       if (gdev->dev.parent) {
> +               scoped_guard(device, gdev->dev.parent) {
> +                       if (!device_is_bound(gdev->dev.parent))
> +                               return ERR_PTR(-EPROBE_DEFER);
> +               }
> +       }
> +
>          /*
>           * FIXME: keep track of the reference to the GPIO device somehow
>           * instead of putting it here.
>

