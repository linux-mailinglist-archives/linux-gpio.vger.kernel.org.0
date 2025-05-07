Return-Path: <linux-gpio+bounces-19746-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA3AAAE47B
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 17:22:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D4904E7DD9
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 15:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 991E428A3F3;
	Wed,  7 May 2025 15:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7uU6SRX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C441118EB0;
	Wed,  7 May 2025 15:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746631358; cv=none; b=VPiZqeaOZJR6Gbu3p1aW1OB/mYs7ZKYufZgzmI/cc1y0j/wc+bM+62D9hDj8BsMnVKbJDgqeaoTOqKEBSQ3Ovz+ejljy66vfGwEhv6wyrTNcjp9INUrPeNcjytOSVJkSWeY83HwzFoiIdOsMa1SlSeF/1BfXZy7UnUDyISmZE78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746631358; c=relaxed/simple;
	bh=G6GIobQZjGbAv136r9m+tdpjpUDEpPUBOIo+rwGG/qE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BfdULuT2ElLYtGRv9poViQWfMfQo5E/08+0Zo0aO9i9A2iDSloJiM6Th2AOi0WdBPkUZ/wn/Z2cSWQW8hlp3xuYgqJKMQ+u34PU7xaEV+Oj6CaGBZfQPpqTyjTD6DklR3xCE0Ed54U10R5kvCe1VxveJwwvm61xoq8Zxm6lZcFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J7uU6SRX; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5fbe7a65609so2196524a12.0;
        Wed, 07 May 2025 08:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746631355; x=1747236155; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLt5UoHo/uyFct2KVPgAYy9QmHAyTkt3+bUdcit5PVs=;
        b=J7uU6SRXzQE6EccKmf+j9MC5sVrPjP/hHsf/+5oUdQMT2wUU+UQNETSuasmGSBfliJ
         cBTitvTwzNzrT2+iQPC1SnlZV5QySgocAodPI6/zApjgXWkk2L2iKFHGJKORj8YzETrS
         C7u9JXnUfqYCRSHCld63rwpfV2bI8eXaEkPFbt73xm/7a94HyUo513a3yRn2hVj8U8cm
         cJH4z0WkjuFjUToZGzOYXHyrsfkZfJ4uoDXTFT3xZGsjEuEmDr82uUhJyrBRZvOvXNas
         YRZyrZCL5cXfiAI76Fz40SCEIwhPMX/URTy6m50iNS9+vapAqZYn0fkvQVe+fQk5aU6T
         0JqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746631355; x=1747236155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLt5UoHo/uyFct2KVPgAYy9QmHAyTkt3+bUdcit5PVs=;
        b=mTSt8fDbvGD5ui+4Gts8PeifmPNGQ72+GYkI+aVJxMHuKU2gwC/Mh0krQyWBHg2afN
         fWHTgravKDAkP81VUTU3Kh6SiGyBcafQW6I7ekdk4BZaTW98dDbfDkiOF69DdLtFBrFa
         SbLBpjHEokpaXavDHM/rbX0ak4E1N2IniI2SMTdMJpDOxaqG3wfPDg4JvdwTfISSEqGd
         go5HKMAekyZVTH0OSXwQSz9PPnnAvghFLzl8cimCgWcOcJ4GVCWwlReb7mt3PtMNDU+x
         H9+EyR4HGixPmw/N0uApenTe27sVYLkvtdmOwnJMtSHcYahlqSRpdTAYMCIcClSyqqqR
         MrNA==
X-Forwarded-Encrypted: i=1; AJvYcCUH0fRzwwKuUgmm3SSxyWa2SGAwtRUWS9JHwZDVX66fn2msknHi/yFjM6HMn0cwPsjczbFd0I6GVDeBJ7a23i17@vger.kernel.org, AJvYcCVk9Yko2L8Xa73xHa+y2Wd+GktuJeq/HiACPBsI3vLo8HEx/YTS9Zzk8Xeyd8IQ9n3whRxeN8OCDAbje6yZ@vger.kernel.org, AJvYcCW9TA6WQWdBHBUa91OHE4d1evuzaq5vdwYNGPdlKSs2CEYcuZ/AvAV8+SGlGYIP70AZvQ3FmNw1h1xk@vger.kernel.org
X-Gm-Message-State: AOJu0YzBCbTCt9I+LJKm+VLWO2hngHvac/tEw61Q9IFgjB71VEvPpVc+
	4adzpY4d8Y24ZpdGb/xaFoSd+7Ih8cAOQkDOHcAdsrz3cUDMSI+s2JprQ2CgQnQHmnK1VLEdFhA
	yN4pq7wcZ66dAYKQqA6F9NOyZVEc=
X-Gm-Gg: ASbGncshpWr9BKs9Zum60GEc+sfcC4RJzKvUltFMO2oj/opeL7BQJiZe8AR6+AyAa6B
	9Lc1AqmHNEhOycEIABQLYwclpb46P9JTbeVo6XFYnMZhH9iU3hNBelvlosbZ/zO87v/3CVYm48e
	1iY0oxFN/DWwUggDTmhc0MtdgG
X-Google-Smtp-Source: AGHT+IENrHBhDJ6QmCIALW/trOZbo+S+uz/FTJiKIkupIyaB84PssD8rkhzD5vVURdYtZ1ValTicpx4mnni9dTZkiMw=
X-Received: by 2002:a17:907:7f1f:b0:acb:88ac:e30f with SMTP id
 a640c23a62f3a-ad1e8bd008dmr427685966b.20.1746631354904; Wed, 07 May 2025
 08:22:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
 <20250506-aaeon-up-board-pinctrl-support-v5-8-3906529757d2@bootlin.com>
 <CAHp75VdRp7RG-YCAL2Jx4uXsT2RVQNeu-MxPB5pWRq8TqtsSXw@mail.gmail.com> <cb98bec7-748c-4e00-aa9f-b5075bebb5b2@bootlin.com>
In-Reply-To: <cb98bec7-748c-4e00-aa9f-b5075bebb5b2@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 7 May 2025 18:21:58 +0300
X-Gm-Features: ATxdqUGUzY3A4zHzeU_ubjrnOY2zfB9ZK-KToR7BIUdNK8ReLiEBIkmZ9i8rOpA
Message-ID: <CAHp75Ve_oM6NyvLGsBK4CddEEv=cafw_VfONKwEBX2CBdNxJmA@mail.gmail.com>
Subject: Re: [PATCH v5 08/12] gpio: aggregator: export symbols of the GPIO
 forwarder library
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 5:53=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
> On 5/7/25 08:29, Andy Shevchenko wrote:
> >> +/**
> >> + * gpio_fwd_gpio_add - Add a GPIO in the forwarder
> >
> > forwarder
>
> Sorry I do not see the typo :)

Your original piece of the code. Please look better.

-static int gpiochip_fwd_gpio_add(struct gpiochip_fwd *fwd,
-                                struct gpio_desc *desc,
-                                unsigned int offset)
+/**
+ * gpio_fwd_gpio_add - Add a GPIO in the forwader


> >> + * @fwd: GPIO forwarder
> >> + * @desc: GPIO decriptor to register
> >
> > descriptor

Ditto.

> >> + * @offset: offset for the GPIO in the forwarder
> >> + *
> >> + * Returns: 0 on success, or negative errno on failure.
> >> + */
> >
> > Please, spellcheck all of the comments.
>
> Ditto

See above and spell check. Thank you.

...

> > + struct gpio_chip;
>
> And also struct gpio_desc;

Yes. :-)

--=20
With Best Regards,
Andy Shevchenko

