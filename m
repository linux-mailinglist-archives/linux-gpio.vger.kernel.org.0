Return-Path: <linux-gpio+bounces-37162-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AM4BCOO+DGqJlgUAu9opvQ
	(envelope-from <linux-gpio+bounces-37162-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 21:49:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 164D2584549
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 21:49:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9FE973029758
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 19:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFDBD3B2FFE;
	Tue, 19 May 2026 19:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JL6VGClj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89E82BDC1C
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 19:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779220187; cv=pass; b=O9H/1qDP8DOhxuct+KNTOWupt6sHxrCAN/tjO1I0yQlxms2saoyowSzgs7xHHu6Cc7gbNlcWet/wsHZxuGWQKVh9eDGZgsnc+Vx4dGOSRmWbdNvHHjBJHfeSxWPSzPUA4jO5KA7W4Zuyf8qQ7SDEICWHpmDEKqjovX7WL9FWlSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779220187; c=relaxed/simple;
	bh=y2gWKlwGRB+xVuWmkMmTtzJu8kvrmLQtIXa25GTguuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZLipXUXWmv9F7vSgZ3y09p52hjTBE+y7aSfwRU78h8tBBLQbqJUiOpOdr+2YrvGNbONSTStTmz7Xq7XYkNJyLpU/05/MxLUcH31/mAtRfFLW3CSe1ltUYLWs1gXnuaKT3df54sow9Sn4BKdkRxrSN6w70DRnJBlMs3e/h7U8DN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JL6VGClj; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-65890a6ca20so4500204d50.0
        for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 12:49:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779220185; cv=none;
        d=google.com; s=arc-20240605;
        b=J7yfAqkB1W4Ebbgudp0vR2eI8KBjdkgPPBPAjZMp9R57r1UjlMYXAT424hc3ytNMYc
         gFPWJtIMFOq4Efffulsu1SQCztFdayF6qcCS8i1R/MRPXvgU1C6MKK1fppQknHrB/HeY
         l1ySLHxj0GZQaG06PzAUzF+yIoP+TImiDZoJMLjS7Igt2Vz3yP3zHONbvnFAzzUmfyKQ
         2RRrbUbA+QptY7w5hPTa2hW4JhH+24zvYV7LuWydNMuNUP2TpI1NyfvlE/DiHjFp55ZI
         YTqMIygExsjW25mYyWd0jTUMPjLSawVSPYGNOt30WN40cUQtawgF6zxRHWMGiK2Trktu
         wPFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=68NJ95LIG8tl/ruYTxXjrAILSDWZ0MxjLi9Z7WQJkQ8=;
        fh=zPxDkgQojvCZmJ4fyia/gzUVo0Btjg3Ti6CratMfNas=;
        b=kKwgqg0LwnRdTln+7cIPMLEw6eMshKgy52FOh/aJMo8L2BHt5uC6a7cYgXmTYYKJbp
         bnexLEd/ZDJYKz+40fw22ZAgvWlzxs/roDp1g+NideIrqOogsxRtY1egUiP45Wp3u9Wv
         iRYzLPdogfSL0yYP1o8yM+6OyE316/qrCr8oBj8v1SJJALdymdHUtSJEIcDe95e1vYmN
         HK9VVxuDqxWDhZzfvZRVllD3ZxbGG+q9iHNLuEDBU2yMXwVt7h9RACCUIDgAfN47IwDy
         /YpVN9x8raImQS2z5J7ADgNpqKKA3ZIf9/nFK4lHq9sIx7LwecIQzq1S2u4sIfvW5Zwz
         u16A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779220185; x=1779824985; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68NJ95LIG8tl/ruYTxXjrAILSDWZ0MxjLi9Z7WQJkQ8=;
        b=JL6VGClj7Dr+jN8L85Rh1G/+89B/lufsBlQcZsQAOBlKLpDNldV+BTZukoOnUHFuC+
         YP/83lZ7Q8G7IXHe9jbyjsBF0wTxasectx3QjBdSdkb2y+5n+mHLgNlkDBr1u/Qd/SHi
         WQns6089KQVHRvk0/v4PSzrOK6iwrdpOF6WnqNfyOa3nksJ9LbG+kmfe+w7V2h6hFyo1
         NyPo5rUctvu7OY5xwLOxZVdAqTYUgsLPdxckzLETEIXBrftRrD5F5I0s9Pt0s5HG1Q/V
         Kncs4YK1GJv8gtTphhhu7OgIEK8drR0/bI2XdSkfEZqITrVCbH/IMAeAUuoAloLtXOzl
         KThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779220185; x=1779824985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=68NJ95LIG8tl/ruYTxXjrAILSDWZ0MxjLi9Z7WQJkQ8=;
        b=IyfqTdkSyIqUAtNMoaU9Yuw+SXL3IGsjwVJZwvVvhQhQmko+qkqZDGSgPpJBKI156r
         YlzaIu+CvmwvA59JS18HVILpW8aG4Vf1KRgTgPBJDXdtelEoLMU7yvePKQaxY8CwWMVp
         zGidDYG4QiHoCn9oWodscBg0od53o1BSMplRHWbiYd/n76TdoDAxy++RdxPr8nAWXQVc
         lAmL8X3Bdy6gYDtRl4fOGh5ywUGYDH8BubJ4FSe8zESwpnN1pg1pG5cWWcSDJq/X/l0W
         /TO0q88EAO+FLJyj/HgirClYav4GCe9OJUJEGin0+PI0KuokcZvqHf1LXIVM02jKHysc
         x/Bw==
X-Forwarded-Encrypted: i=1; AFNElJ8V7GC6nfbfHYhEGPMZ69kxae8QvMz9kYh8WDL6ybBTDGUxzeUPrABomo26kmgbulVVRRswf+hIpXBT@vger.kernel.org
X-Gm-Message-State: AOJu0YwjSndr90vOrNs7IhFzY8RrJEj/Mk5niH+JH1+bVtJ1mJw7WNTM
	wjHWdPo4dT1UAAyy2Hcg8EjJhLgIqS1TM/zRauDEWXN/SgrqjoOVGsshtvOl9VfS9HGOcgEg8oN
	0aLyNIlxoUT/MntU9GbtCRx8hzfjcy9Y=
X-Gm-Gg: Acq92OHszqSQmGXrRMGYiSNNdNANb6BVEInkBXYyX4OjsOmIrzkSiKayNgipkqsFwFO
	mVSTQ39jr1RsXodEEZrhwnmjbwmulmJ9b1K/dTnIjju7Y23n4AZ9QXUXIZXZvPQqyPBCBliVP99
	axWpQO4or1gkWNJR8DsA7gNIIkNeSO5Gqhtu8E6rmpHZn5v7MBcvO30Hgd/pm7SYWoS/k6wDNwe
	LoOc/2UJ86Twi79qX9h+I1OIDLHeDuUNHYImntOG9jhp3AvDn/OssDd972aBJmPVWk9d4eK6DTG
	liT/NLHpdT7hOLWgadQ0WgaS0AWXjyMNBEr1rlVWzplTxFifBAH5lKO8slIctJtW3jH/1BRGsii
	93RTMGhdzKdeNzO4ldDNAMh1UVaOpjmCiWzmeLPE98tUJiHfa1jDMKI4Deg==
X-Received: by 2002:a05:690e:140d:b0:65c:2738:c6a4 with SMTP id
 956f58d0204a3-65e2268bf87mr20723033d50.17.1779220184640; Tue, 19 May 2026
 12:49:44 -0700 (PDT)
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
 <498bad3f-6a0c-4da8-b645-1cc837ba1836@amd.com> <CANTFpSWB6Fb3mo9sUtxo2Aaa-Ryx-YqUw-tqT-y1RpurJfq57A@mail.gmail.com>
In-Reply-To: <CANTFpSWB6Fb3mo9sUtxo2Aaa-Ryx-YqUw-tqT-y1RpurJfq57A@mail.gmail.com>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Wed, 20 May 2026 01:19:32 +0530
X-Gm-Features: AVHnY4LNkbrr-2Aon6iJF4VRXE83j0qjSsKssy86Zag0YWxbL_nqEwjZ7gYv0p8
Message-ID: <CANTFpSU+wTQeESDGqV=xizrJeQw_LA8y7stDYMm=H-UrbWXeYQ@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37162-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,amd.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 164D2584549
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 20:18, Mario Limonciello wrote:
> I like this idea. I guess something like this:
> [gpiolib-acpi-core.c patch]

Tested patch 1 + gpiolib-acpi deferral, without patch 2. Arbitration
errors persist:

  patch 1 + gpiolib-acpi deferral:   arbitration errors, WACF2200 does not =
probe
  patch 1 + patch 2 (v5):           clean boot, touchscreen fully functiona=
l

I think the reason is that i2c-designware does not call acpi_get_gpiod()
during its probe. The GpioInt resource is on the WACF2200 touchscreen
device (TPNL), not on the I2C controller itself. So the deferral in
acpi_get_gpiod() never triggers for AMDI0010:02 -- nothing in that probe
path requests a GPIO descriptor.

The race is between amd_gpio_probe() completing and dw_i2c_plat_probe()
starting for AMDI0010:02. Without something that explicitly checks
whether the GPIO controller is fully bound before the I2C controller
probes, the race remains.

Thanks,
Hardik

On Wed, 20 May 2026 at 00:37, Hardik Prakash
<hardikprakash.official@gmail.com> wrote:
>
> On Tue, May 19, 2026 at 19:58, Mario Limonciello wrote:
> > You add a debug statement to amd_gpio_irq_enable() too right? Can you
> > please share your debugging messages patch and full log?
>
> I did not add debug to amd_gpio_irq_enable() - the statements were
> only in amd_gpio_probe() and dw_i2c_plat_probe(). I can add one there
> if useful, but given Bart's suggestion below I'll hold off unless
> needed.
>
> > What is the boot time impact to adding device_is_bound() check?
>
> I haven't measured this explicitly. The deferral only fires on DMI-
> matched hardware (Lenovo 83TD), so on other machines dw_i2c_defer_for_
> amd_gpio() returns 0 immediately with no overhead.
>
> On Tue, May 19, 2026 at 20:18, Mario Limonciello wrote:
> > I like this idea.
>
> I'll test this patch, and let you know how it goes.
>
> Thanks,
> Hardik
>
> On Tue, 19 May 2026 at 20:18, Mario Limonciello
> <mario.limonciello@amd.com> wrote:
> >
> >
> >
> > On 5/19/26 09:39, Bartosz Golaszewski wrote:
> > > On Tue, May 19, 2026 at 4:28=E2=80=AFPM Mario Limonciello
> > > <mario.limonciello@amd.com> wrote:
> > >>
> > >>>
> > >>> gpiochip_add_data() at 0.285952 makes the GPIO chip visible to the
> > >>> system before amd_gpio_probe() has finished. AMDI0010:02 starts pro=
bing
> > >>> at 0.301454 while amd_gpio_probe() is still completing. This is why
> > >>> device_is_bound() works and initcall promotion does not -- it waits=
 for
> > >>> probe completion, not just gpiochip registration.
> > >>
> > >> What is the boot time impact to adding device_is_bound() check?
> > >>
> > >> Bartosz, thoughts?
> > >>
> > >
> > > My thoughts are that ACPI could use some fw_devlink. :) It's not a ne=
w
> > > problem, we've fixed it for OF systems.
> > >
> > > Could we modify gpiolib-acpi.c to return -EPROBE_DEFER if the parent
> > > device of the GPIO chip is not bound yet instead? When resolving the
> > > reference to the remote GPIO controller we have an address of the
> > > struct acpi_device. I suppose there's a platform device that is its
> > > child and then the logical GPIO controller device, is that correct?
> > > Can we check if the platform device in question is bound at the
> > > subsystem level?
> > >
> > > Bart
> >
> > I like this idea.  I guess something like this:
> >
> > diff --git a/drivers/gpio/gpiolib-acpi-core.c
> > b/drivers/gpio/gpiolib-acpi-core.c
> > index eb8a40cfb7a98..e3511398b1f84 100644
> > --- a/drivers/gpio/gpiolib-acpi-core.c
> > +++ b/drivers/gpio/gpiolib-acpi-core.c
> > @@ -142,6 +142,13 @@ static struct gpio_desc *acpi_get_gpiod(char *path=
,
> > unsigned int pin)
> >          if (!gdev)
> >                  return ERR_PTR(-EPROBE_DEFER);
> >
> > +       if (gdev->dev.parent) {
> > +               scoped_guard(device, gdev->dev.parent) {
> > +                       if (!device_is_bound(gdev->dev.parent))
> > +                               return ERR_PTR(-EPROBE_DEFER);
> > +               }
> > +       }
> > +
> >          /*
> >           * FIXME: keep track of the reference to the GPIO device someh=
ow
> >           * instead of putting it here.
> >

