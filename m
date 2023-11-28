Return-Path: <linux-gpio+bounces-585-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CABA27FBD3E
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 15:52:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07EF11C20E26
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 14:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 377105B5C8;
	Tue, 28 Nov 2023 14:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ipu1x7sa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E87DD1702
	for <linux-gpio@vger.kernel.org>; Tue, 28 Nov 2023 06:52:17 -0800 (PST)
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-4ac1988ca66so3033654e0c.0
        for <linux-gpio@vger.kernel.org>; Tue, 28 Nov 2023 06:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701183137; x=1701787937; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUFCdjj6KweraZbgFnvcdT6qQJR48sxHc17tLoetRbs=;
        b=Ipu1x7sa1LVGcPnrZhioSIe0f7XKV5BzbJNuadbQ7MTnRj+X/2jzk9t7qk7sSnKjZx
         pbydwfW61TqZ3oPr3kOe0Q09Pzr9uX6JevrhntxrcxcqcA/38n1RREM0UcpkBesV4K8S
         krzXTAayILIRxqxLv7xA4egfNcYGf0skEt47jzP0H+TAcV/aNHJ8kJiOelfrDo84311W
         g1xcwqnLN8hV0dOlBY5MGZJhhSb+9ucrChgE9n4DL+L9vzPAz20zjprECKXJ8oCsI8AJ
         wm2Ib1CZ5pEVigsm9zm+hHo699PuI2/IacQitFjIaH7288bt9SllW+vcjy1qGIO4nlm5
         Z9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701183137; x=1701787937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUFCdjj6KweraZbgFnvcdT6qQJR48sxHc17tLoetRbs=;
        b=p3vZAh7qVo7x+/x87tpzV/MH1yp81vy5Ybb3tROT+TCSjEJbehbBjXWvbG0JdPnb0l
         VrI+GqXBAWQIIJ/a5xlpeeJkDdRtqSZOQhs7rQDd0FY21GXa/pgccBXhgwhH/h5SLq6Z
         +XTxMLGOCKZJF+4bHD5PXgNyCoJk21YDS2FdiVJwHnJzHVs32FPoxqOwXLK/T7ga+dKa
         oFazxPp5gduOpW1lnImGXNlFAqcM6TeoyL2yrXEfZjJuR2hfD5DEVXUe4UtvS+kUMj3T
         qJqhWoScDK7utkmtk1sQv4RTELy5zvs5JiCAse6+PFs5aojJ7ZoYOxs7LqlPhtDAGumS
         skqg==
X-Gm-Message-State: AOJu0YxqxgiNldoPs3HEspYhOJfh+xtW2wyX+lButIYaLIE2umlximx6
	IGZGkkSgwueuxJPx0ks85/jTegt04WHpP+c9/T0pJw==
X-Google-Smtp-Source: AGHT+IEQE+IhvE8xm4/QE8ljBQ6yzfz9383hhTbW4b3pcYoRCHKY2aERTpyTDKGMWHUEtrWHdh4Yxvr3d5rkRljoPQw=
X-Received: by 2002:a1f:c582:0:b0:4ab:da7a:c573 with SMTP id
 v124-20020a1fc582000000b004abda7ac573mr10394319vkf.8.1701183136967; Tue, 28
 Nov 2023 06:52:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231127193716.63143-1-brgl@bgdev.pl> <20231127193716.63143-2-brgl@bgdev.pl>
 <CACRpkdYG5FbOLDLM+WGEbX-42mjkALU-HfAgdLLhHSq+K1gnaw@mail.gmail.com>
In-Reply-To: <CACRpkdYG5FbOLDLM+WGEbX-42mjkALU-HfAgdLLhHSq+K1gnaw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 28 Nov 2023 15:52:05 +0100
Message-ID: <CAMRc=MdSO_Zp2wqyZQvqadDoUdZVi09vE2fo3oZF3161W-+Qhw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: use a mutex to protect the list of GPIO devices
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 3:21=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Mon, Nov 27, 2023 at 8:37=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The global list of GPIO devices is never modified or accessed from
> > atomic context so it's fine to protect it using a mutex. Add a new
> > global lock dedicated to the gpio_devices list and use it whenever
> > accessing or modifying it.
> >
> > While at it: fold the sysfs registering of existing devices into
> > gpiolib.c and make gpio_devices static within its compilation unit.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Nice! I might have found some snag:
>
> gpio_device_find() still does guard(spinlock_irqsave)(&gpio_lock);
> shouldn't that be switched to the mutex?
>

Good catch!

> On top of this I can update my patch to the delete the comment
> for gpio_lock to just rename that thing to gpio_descriptor_lock
> and document it as such.
>

No need, this will soon go away anyway. See below.

> But when I think about it: gpio[_decriptor]_lock can now (after this
> patch) be moved into struct gpio_chip as it is really just protecting
> the descriptors on the same chip from simultaneous modification,
> especially desc->flags. This is a BIG WIN because it makes it a local
> lock not a global one, do you wanna try it or should I? (On top of
> these two patches, then.)
>

I will have the series making locking in GPIOLIB more fine-grained
ready tomorrow or on Thursday. It will have separate locks for each
descriptor. We will use spinlock or mutex per descriptor depending on
the value of gc->can_sleep. I think it should work fine as a sleeping
chip can always use a mutex and a non-sleeping one cannot have
sleeping callbacks (correct me if I'm wrong).

We don't need to lock the GPIO device or chip separately - the
descriptor structs will stay alive as long as there's a live reference
to the GPIO device. GPIO device will have an SRCU cookie for
protecting API calls against removal of the chip.

To summarize: one mutex for the GPIO device list, one lock per GPIO
descriptor and SRCU protection of the GPIO device's chip.

Does it make sense?

Bart

> Yours,
> Linus Walleij

