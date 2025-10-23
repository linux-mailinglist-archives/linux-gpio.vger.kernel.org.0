Return-Path: <linux-gpio+bounces-27568-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C429C03184
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 20:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B99094F0449
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 18:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B14234B681;
	Thu, 23 Oct 2025 18:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Phujqa+3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7212F295516
	for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 18:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761245744; cv=none; b=RnIoxs2EDYw+x0Dzoik/7T9BF4bLz3iJdYrKJgPCuAwsbpgI41mApllNbN+GyFwV8EiDlLWPyvX4VGMcSnTItC6fNZku4VAuGKHoAQ9siuUcD7rxgZuV464CNbjSuJvEOpKehXSGo5nUObz7ouMDGr5nsNANQaoxb5oyQyXzJZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761245744; c=relaxed/simple;
	bh=YsY+s/rGdh5hcfsUD4Fnaa8qCovQYoUtKz8GwNeVRpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bbdtDYMqwa7QYoJEO4h9a48ZtNjSM88N/fftkAnNMEBaKx+elcC1nDgCeux1Ra9DlLhhL53m0T4ls+knhpy2UI5O91XTIaMw56Kv452+ZZVez5VBYJh6ZEfWq76+g2j2FKrF2UIV2B3ax2vXmEY7Dvb4dCxY/nGhNv70tZ/EtvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Phujqa+3; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b6cea3f34ebso839480a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 11:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761245742; x=1761850542; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5nqesmbadsL4TcQ6pyvWq3P8etXMU87cVhZImzGQo0w=;
        b=Phujqa+3+zuqg3kTd1t9vqtp68AqFMM+/nR0KnTXStigjI5pUe5rMhfwz9KsAcpEwz
         nqIOJ42YV8LWSO9mQyLON1lccquxOsEUJ/BufvWOvBrws/wYnbHg0UyiG9uXGlJc7q7u
         cvhAfnFwTTrQ35u3peO3l7v86IikrnOvNyV5H+mm/k52eYwgo20j9z8waLpwx5FmzZGb
         felO2UsNcAZIPA+QVpvVpXbcOzG90JWhfA1ZxnQTOcfEi62U/tv+P4OZzPYZBsNxpvti
         KmxHTaX2MTB+/YZnEt7tIk9Ozfn9LrRiTaJUQj0LgjQXD41aWQkUmsWsUstbYPEc/BkD
         hBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761245742; x=1761850542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5nqesmbadsL4TcQ6pyvWq3P8etXMU87cVhZImzGQo0w=;
        b=JMLEKNbnhd4kR8adSuActoJ7DlhwXd+7dWqJaxVRcSSYI9lrlrXtdr98CB0DPP7Nbx
         eWG0+QznRSSXf4qPsH0HX3AbbNCC1ai3A6ZJp3cl40ynkiVsBtJrS3eNJ3JrP5eKIR4H
         zSnn372YGsDx3awrbx4SkWjImypnQYAkrlcGj14GJg4ThohY0LJ8xCG8vjNPs5M6l9B8
         MyawgmbfClyaPWuJxryb1v6/aDNxVYubBhAC3E9JRyQrQBCIe/PhP057y3qodSdK+hWx
         +m/LuEm9klppnZupzjg3ggIBw2Zr/8ij934CklTqXM2/0ERHBS2zFpHUHhHn86Mp6K0J
         xcrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhH8TO9xXmZ0IRQsQXMxLkBLQQhcQi7Sf5a1/f6RiYtxXDRiwZ4UPnEHiTpOd1FMFyDhV8XHgIl0fK@vger.kernel.org
X-Gm-Message-State: AOJu0YxqdDKyxGUXiEsKIe5bHbxHeRYdd+jLXePbfzRFZEVnjfOnHm76
	nX/RT2YHs7IAGp8ezC3e9zSLmcQdu2H30IcPrWHn7lObGB31hIveCpzwKhDrUdqWUzOwuS4y0ad
	jmkcEcukEDDK1RpvamXWABQFZj2hVjf8xfDCTwYHpRw==
X-Gm-Gg: ASbGncukwUA+7GZIgAtDolhQdm2iH5TsTJeh50hbdWGCmrzbwfo2bHhKzPR50GbmlMx
	9NoHLF/Tq/UyGVp92Lp/6zw5iqVbMm5+7DGOgnjq5fcXm7OxETpyNKTpkCL38ot2lvNci9xPTS3
	J5+jfo4gSsdOkmM5n6b2xG4T39AeGMP3Wqxzg6G2UUOWX5U/jWhAP4g30jDnrubcD/rWdnJuJY1
	Tt3XAP7OnqRn0VAV4ddjz4VZ4CwXqwLFKPAVRIpGs2BYOcCZjDxc7Jf3zy8Qb5iOzIMhkDwkzau
	YX8MtE/glrkR3DY=
X-Google-Smtp-Source: AGHT+IGxmBYon2RitVIqN2x+MkXSzGe0lcwNoOIre6xyOPwk6oa5iMaQ33lq9vtGEhqgaIyKokK/WKNyenpypK0wQKs=
X-Received: by 2002:a17:902:da88:b0:24c:9a51:9a33 with SMTP id
 d9443c01a7336-290c9cbc119mr319435045ad.22.1761245741736; Thu, 23 Oct 2025
 11:55:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-3-d34aa1fbdf06@linaro.org> <aPkVjoWkP04Q-2xP@smile.fi.intel.com>
In-Reply-To: <aPkVjoWkP04Q-2xP@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 23 Oct 2025 20:55:27 +0200
X-Gm-Features: AS18NWDv3cyfZzHn3g6_AZq2diutRl3UpTCleLdYUvzFU1eXCFlVn9tXiFa-dw4
Message-ID: <CAMRc=Mc165HSLdug1F+t3qcOoE52mR1e_zEh=rSTUKN_-dB5NA@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] gpiolib: implement low-level, shared GPIO support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 7:34=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Oct 22, 2025 at 03:10:42PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > This module scans the device tree (for now only OF nodes are supported
> > but care is taken to make other fwnode implementations easy to
> > integrate) and determines which GPIO lines are shared by multiple users=
.
> > It stores that information in memory. When the GPIO chip exposing share=
d
> > lines is registered, the shared GPIO descriptors it exposes are marked
> > as shared and virtual "proxy" devices that mediate access to the shared
> > lines are created. When a consumer of a shared GPIO looks it up, its
> > fwnode lookup is redirected to a just-in-time machine lookup that point=
s
> > to this proxy device.
> >
> > This code can be compiled out on platforms which don't use shared GPIOs=
.
>
> ...
>
> > +             if (!strends(prop->name, "-gpios") &&
> > +                 !strends(prop->name, "-gpio") &&
>
> > +                 strcmp(prop->name, "gpios") !=3D 0 &&
> > +                 strcmp(prop->name, "gpio") !=3D 0)
>
> We have gpio_suffixes for a reason (also refer to for_each_gpio_property_=
name()
> implementation, and yes I understand the difference, this is just a refer=
ence
> for an example of use of the existing list of suffixes).
>

And how would you use them here - when you also need the hyphen -
without multiple dynamic allocations instead of static strings?

>
> > +     adev->dev.parent =3D gdev->dev.parent;
> > +     /* No need to dev->release() anything. */
>
> And is it okay?
>
> See drivers/base/core.c:2567
>
> WARN(1, KERN_ERR "Device '%s' does not have a release() function, it is b=
roken and must be fixed. See Documentation/core-api/kobject.rst.\n",
>

Huh... you're not wrong but I haven't seen this warning. Do people
just use empty functions in this case?

> ...
>
> > +     pr_debug("Created an auxiliary GPIO proxy %s for GPIO device %s\n=
",
> > +              dev_name(&adev->dev), gpio_device_get_label(gdev));
>
> Are you expecting dev_name() to be NULL in some cases? Otherwise why is t=
his
> not a dev_dbg() call?
>

It's the low-level code saying: "I created device X for Y", not "Hey,
here's X, I'm here for Y".

>
> > +     return 0;
> > +}
>
> ...
>
> > +                     char *key __free(kfree) =3D
> > +                             kasprintf(GFP_KERNEL,
> > +                                       KBUILD_MODNAME ".proxy.%u",
> > +                                       ref->adev.id);
>
> This looks awful. Just allow a bit longer line
>

Ok

> > +                     if (!key)
> > +                             return -ENOMEM;
>
> ...
>
> > +static void gpio_shared_remove_adev(struct auxiliary_device *adev)
> > +{
> > +     lockdep_assert_held(&gpio_shared_lock);
> > +
> > +     auxiliary_device_uninit(adev);
> > +     auxiliary_device_delete(adev);
>
> _destroy() ? Esp. taking into account the (wrong?) ordering.
>

You're right about the order but if you _add() then you should
_delete(). You typically _destroy() if you earlier _create().

> > +}
>
> ...
>
> > +             set_bit(GPIOD_FLAG_SHARED, flags);
>
> Do you need this to be atomic?
>
> > +             /*
> > +              * Shared GPIOs are not requested via the normal path. Ma=
ke
> > +              * them inaccessible to anyone even before we register th=
e
> > +              * chip.
> > +              */
> > +             set_bit(GPIOD_FLAG_REQUESTED, flags);
>
> Ditto.
>

Ok

> ...
>
> > +struct gpio_shared_desc *devm_gpiod_shared_get(struct device *dev)
> > +{
> > +     struct auxiliary_device *adev =3D to_auxiliary_dev(dev);
> > +     struct gpio_shared_desc *shared_desc;
> > +     struct gpio_shared_entry *entry;
> > +     struct gpio_shared_ref *ref;
> > +     struct gpio_device *gdev;
> > +     int ret;
>
> > + +   scoped_guard(mutex, &gpio_shared_lock) {
>
> Much better to split the below to a helper and make it run under a
> scoped_guard() here or call a guard()() there.
>

I'm not following, please rephrase.

> > +             list_for_each_entry(entry, &gpio_shared_list, list) {
> > +                     list_for_each_entry(ref, &entry->refs, list) {
> > +                             if (adev !=3D &ref->adev)
> > +                                     continue;
> > +
> > +                             if (entry->shared_desc) {
> > +                                     kref_get(&entry->ref);
> > +                                     shared_desc =3D entry->shared_des=
c;
> > +                                     break;
> > +                             }
> > +
> > +                             shared_desc =3D kzalloc(sizeof(*shared_de=
sc), GFP_KERNEL);
> > +                             if (!shared_desc)
> > +                                     return ERR_PTR(-ENOMEM);
> > +
> > +                             gdev =3D gpio_device_find_by_fwnode(entry=
->fwnode);
> > +                             if (!gdev) {
> > +                                     kfree(shared_desc);
> > +                                     return ERR_PTR(-EPROBE_DEFER);
> > +                             }
> > +
> > +                             shared_desc->desc =3D &gdev->descs[entry-=
>offset];
> > +                             shared_desc->can_sleep =3D gpiod_cansleep=
(shared_desc->desc);
> > +                             if (shared_desc->can_sleep)
> > +                                     mutex_init(&shared_desc->mutex);
> > +                             else
> > +                                     spin_lock_init(&shared_desc->spin=
lock);
> > +
> > +                             kref_init(&entry->ref);
> > +                             entry->shared_desc =3D shared_desc;
> > +
> > +                             pr_debug("Device %s acquired a reference =
to the shared GPIO %u owned by %s\n",
> > +                                      dev_name(dev), desc_to_gpio(shar=
ed_desc->desc),
> > +                                      gpio_device_get_label(gdev));
> > +                             break;
> > +                     }
> > +             }
> > +     }
> > +
> > +     ret =3D devm_add_action_or_reset(dev, gpiod_shared_put, entry);
> > +     if (ret)
> > +             return ERR_PTR(ret);
> > +
> > +     return shared_desc;
> > +}
>
> ...
>
> > +/*
> > + * This is only called if gpio_shared_init() fails so it's in fact __i=
nit and
> > + * not __exit.
> > + */
>
> Fine. Have you checked if there are any section mismatch warnings during =
kernel
> (post)build?
>

Yes, there are none.

Bartosz

