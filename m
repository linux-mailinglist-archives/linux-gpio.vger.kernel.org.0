Return-Path: <linux-gpio+bounces-1389-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C528118F4
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 17:16:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED66D281D24
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 16:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587D33308C;
	Wed, 13 Dec 2023 16:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nhnaC05k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3027118
	for <linux-gpio@vger.kernel.org>; Wed, 13 Dec 2023 08:16:18 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6d9f8578932so4077299a34.2
        for <linux-gpio@vger.kernel.org>; Wed, 13 Dec 2023 08:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702484178; x=1703088978; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mcK4XOgKqcNfFHL25gziBNAjwVCjjEmkms+6zHPdluY=;
        b=nhnaC05kq3PKokzDucBZksgkSK21xDk6JCUHI+OewuiE27ffxmC0hrFbRLKEWDX8SK
         Z31fyKLN2G5KBQj1WU9nPfg+Tdj59z1F9h0tEr88feWUnsTctUFMqrA8oghOqtiVmLLX
         KKS/IjCvt4KRyuq9ijlc0e7GpAUHVCbjEBXYSTzNMyCV1gZgvM0lijTkvaTHP8w2gd2c
         skXU+RQjtvFk2qQ/smMn0aOciPOsOk0RGh4v9Ofb9n8Asm3k65H7GowC81V0UmXUjT4G
         VjzY4XEDvz6G3q0K/uhuZ0DOmJAEGv9l29iI09CncCP/uGi918AvJxT+NO7vQSpiSG3e
         t+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702484178; x=1703088978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mcK4XOgKqcNfFHL25gziBNAjwVCjjEmkms+6zHPdluY=;
        b=RFE+PzuMzuY1+C0RaeQL9TTMyqEdrnDzL1Jat5qDCMOpBVmIDawMYsDrvlusAM6EqV
         YLe9utyujtwTaqERnBd2UyBVqW7iPIO1vhoiMkL7MhgaAjYvcZRxOgnC0CKZI+UjMhP8
         16bW2RZORn9nWWE8YOTYreTaI3HE55equ5fOgK7uJDhlcni2TSYKKDfeZoVhaom7tvj7
         N6xu/7oFghNmjD0a+PRKVRiN5dt3ox8WVaDDDRbetZUdl7PcSA+Oxgs6CfuZGgMHCTKm
         OO09HWKvtnYF6r39YdrZnI/SaOa9i2f4SyT/YiplR16/1ErW9mHVD/hyi+A+dAVaXVD8
         s50Q==
X-Gm-Message-State: AOJu0Ywvf/ikMFpZN5wUepfVayhCkVd1uRAUpLiFu00c6Joa0mZzYo69
	TWz3YCoTuoKVfDI7kbBeKbhf55V53Z9B/JdfvXbJDw==
X-Google-Smtp-Source: AGHT+IGy4IlvSeIJvPndB1xZjI8LITnvxvWJSeenOMQb7qhzgb42xfFPZ1RIZk6ZXxVdgU1U36qcpj1NTC5f8qvjFRI=
X-Received: by 2002:a05:6830:1e82:b0:6d9:d4cd:88e with SMTP id
 n2-20020a0568301e8200b006d9d4cd088emr9023832otr.12.1702484178252; Wed, 13 Dec
 2023 08:16:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231212054253.50094-1-warthog618@gmail.com> <20231212054253.50094-2-warthog618@gmail.com>
 <ZXm3rayrcvfO1t1Z@smile.fi.intel.com> <ZXm_WsIpgIyOUNHt@rigel>
 <CAMRc=Mfri8K4ZqcHb_eQY6gi+q_-uBZc2wiMrrb-+a7Tric3FA@mail.gmail.com> <ZXnYjoXHGiar-hvJ@rigel>
In-Reply-To: <ZXnYjoXHGiar-hvJ@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 13 Dec 2023 17:16:07 +0100
Message-ID: <CAMRc=Mc45zQOQycNJ+XH-1V4=FHCXfXusrcHsKUtED1Z_4bYgw@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpiolib: cdev: relocate debounce_period_us from
 struct gpio_desc
To: Kent Gibson <warthog618@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 5:15=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Wed, Dec 13, 2023 at 04:40:12PM +0100, Bartosz Golaszewski wrote:
> > On Wed, Dec 13, 2023 at 3:27=E2=80=AFPM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> >
> > > >
> > > > > +out_unlock:
> > > > > +   spin_unlock(&supinfo.lock);
> > > >
> > > > No use of cleanup.h?
> > > >
> > >
> > > Again, that is new to me, so no not yet.
> > >
> >
> > Yep, please use a guard, they're awesome. :)
> >
>
> Before I go nuts and switch everything over, is it ok to put a return
> within the scoped_guard - it will automatically unlock on the way out?
>

Yes! This is precisely why they're so great.

Bart

> Cheers,
> Kent.

