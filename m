Return-Path: <linux-gpio+bounces-3640-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B56B785F9E3
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Feb 2024 14:34:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E0B52891B6
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Feb 2024 13:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D854F131E5C;
	Thu, 22 Feb 2024 13:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rn/flrmH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5347D1332AC
	for <linux-gpio@vger.kernel.org>; Thu, 22 Feb 2024 13:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708608842; cv=none; b=ltmZSFqmXJaD7/Srdi8eV/gyKLiroYc5qzMmcUTwNXws3c8MmFPinmzkUn4BrCYcsfET5xUg1ZfdXFDlN4AvuvxBPUyEw7k96f8PT5OiNbEtMHnrXNenIa7+OEiHBTYb361zzUrn79zZMSpZ803RQGZiRB3N/eXrXlii7g1/NGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708608842; c=relaxed/simple;
	bh=YvE91gvYv6qDIagl96E3lI3HGdScRSs/uM7SmNgXLV0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BacOu6zO0mSR6dm/6j3iBCIA5PMAkOwx+vWvDxexbC+9o3RMhqlsu/19wc8Pc6bTlj1Q8UUhqnjP7Z0EnPaZ0qLBT5T+RvSno/irO9+6dOAm4kd0ehaGwgcrsOAWVA5ZKKSii6xJXecZCz2DlhSMIyYWI2RvGsNdGqiZ8ZR9Pi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rn/flrmH; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-4c8a8f59ad0so594466e0c.3
        for <linux-gpio@vger.kernel.org>; Thu, 22 Feb 2024 05:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708608840; x=1709213640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/zj7OXfvq60AM9P/IGRFFSAL+NE8UU/57SQxGFsYNAY=;
        b=rn/flrmHaLzPwz1L/XdroqXFOyFVsjs3XGOrMoGE0wSKBivouFwPus8ri0LCr1013Y
         6r5c7IX4+ucyJxj1F7AJ3JAVgBIrbU09BT5lg6PHEJlInVQh7EuEjz53mzHBOn2MSkE8
         lWBXeu+NUTT4ESPgczc+sW9Yq2yXUYz09LlrOmhxHB0ZGv2qm1RDHPJS0gT9lGcZZwLD
         tvl1WcX19ZFBn58RolrYtMmhAFyVT1omanCW1tz7pJJvRvz3PNjK0ruJ8IGmVf2huHM+
         f1MvyjZKhNi6oNh2UEVioJblKcNMwHWvh6VDB+bZ5M9d5FPFwMt1NVXC1k+Ua5b9/pdM
         9GTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708608840; x=1709213640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/zj7OXfvq60AM9P/IGRFFSAL+NE8UU/57SQxGFsYNAY=;
        b=dvt60lka3CxgA/uVSsjFlF7+DYEMKVYCJJy56JgeNiLacDvn2LNihq/sLLqRLdaLv2
         fAAFx0OoXawUSp8A05xpOEGUrdXX6MN1KUafja/o9NTYW5wFREIkzX9N62/iJSR7Mm8i
         zpBcnN53nSBYiwLGDG3L2oiTbJ6KNWlDm+EDmWv1GCvK4Merc1ndMx6SnRihW+gm/Hx1
         wZnJW64LKC8Ip89+OqR8C+uuR9hYwff9kx/Y3NHoBAtwCRjWkgyKBa90136Rwuk1AIMl
         Uq0XQKz37ZXESIQBY76GilFExiU/VM2kVkKO4Yn3EqbTJmqEM/U5d36ENzZe4TRQIIdH
         ZbKA==
X-Forwarded-Encrypted: i=1; AJvYcCVYroeVHOpB5++XkYAeMl7u7vAcw3Cb7HA81NVKklES3c/lt7kcAGPZ3kaP0TN+xXeGb/76CU50dnMSNSp5InZY+Kd3biT5BFX71w==
X-Gm-Message-State: AOJu0Yy8Tqbc8qunoVfLXk6/G1TG+UFIGuvYRUmJja71vTuvk6xQFqLK
	s7VnRGJ3zpHWx93D99vevG1e4/HWs22rik5L1840rcXL/sfX2W28t7ko0GBhKyBvMRuHQR8PFF4
	mddawR0r8jrw6GpgZP4FKRMZiM25vk7iNJQAInTcaKL0M4Cno
X-Google-Smtp-Source: AGHT+IFvP7hSArnEBlmoKUZUs/YEQ/96aK6rKqzGDOIvNYXGA9UTu3vEei8mUt22FQcAyXdRktX8daWrSdMnE4FkbkA=
X-Received: by 2002:a1f:e682:0:b0:4c9:a9c9:4b3b with SMTP id
 d124-20020a1fe682000000b004c9a9c94b3bmr10742832vkh.9.1708608840289; Thu, 22
 Feb 2024 05:34:00 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Feb 2024 05:33:59 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <ZddLRAqxFr7v3Zqs@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221192846.4156888-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=MdvYdx6x=gSiOZ3SXAdJORnqhsNW79G2c7wABofWARwFw@mail.gmail.com> <ZddLRAqxFr7v3Zqs@smile.fi.intel.com>
Date: Thu, 22 Feb 2024 05:33:59 -0800
Message-ID: <CAMRc=Mdxtx-wh3HGu+SNrCwfSq0PEm3fG7hK_6wPAk2uzk8xpA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Fix the error path order in gpiochip_add_data_with_key()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 22 Feb 2024 14:25:24 +0100, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Thu, Feb 22, 2024 at 10:37:06AM +0100, Bartosz Golaszewski wrote:
>> On Wed, Feb 21, 2024 at 8:28=E2=80=AFPM Andy Shevchenko
>> <andriy.shevchenko@linux.intel.com> wrote:
>> >
>> > After shuffling the code, error path wasn't updated correctly.
>> > Fix it here.
>
>> >         gpiochip_irqchip_free_valid_mask(gc);
>> >  err_remove_acpi_chip:
>> >         acpi_gpiochip_remove(gc);
>> > +       gpiochip_remove_pin_ranges(gc);
>> >  err_remove_of_chip:
>> >         gpiochip_free_hogs(gc);
>> >         of_gpiochip_remove(gc);
>>
>> This undoes machine_gpiochip_add() and I think it also needs to be
>> moved before acpi_gpiochip_remove().
>
> You mean it should be like
>
>        gpiochip_irqchip_free_valid_mask(gc);
>        gpiochip_free_hogs(gc);
> err_remove_acpi_chip:
>        acpi_gpiochip_remove(gc);
>        gpiochip_remove_pin_ranges(gc);
> err_remove_of_chip:
>        of_gpiochip_remove(gc);
>
> ?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>

Yes, because the sequence is:

	ret =3D of_gpiochip_add(gc);
	if (ret)
		goto err_cleanup_desc_srcu;

	ret =3D gpiochip_add_pin_ranges(gc);
	if (ret)
		goto err_remove_of_chip;

	acpi_gpiochip_add(gc);

	machine_gpiochip_add(gc);

	ret =3D gpiochip_irqchip_init_valid_mask(gc);
	if (ret)
		goto err_remove_acpi_chip;

Bartosz

