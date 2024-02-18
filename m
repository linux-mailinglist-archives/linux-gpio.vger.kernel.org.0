Return-Path: <linux-gpio+bounces-3434-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EEC859849
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Feb 2024 18:50:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDCE91F2172E
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Feb 2024 17:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD2B6F06A;
	Sun, 18 Feb 2024 17:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="S1cVHQ0i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635C6376EE
	for <linux-gpio@vger.kernel.org>; Sun, 18 Feb 2024 17:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708278612; cv=none; b=HSIxkHGOrVEuOsFec0HYDqeK2WESSMtqFuFQ3B31UhcbAQwJtm3ISPB/IzJeRFZWcufMZlt+D/9YYTiHzFDQnYrkMbNi34UvyIv8jJHdBsspVadZw0sol9T7fB7WU/Jguymybfs+rEibeBF8dzyGeiXTGbJe+CP0BJ2hdXv6ing=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708278612; c=relaxed/simple;
	bh=ft0qda2TT0VrHbR+goKKn53dFGPgx7HUfMQGw0PLK44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rg4lMcWyGLx8eZ880GuyceHaAbRGGFKuKQu0m+r+Zegk/FE76X4Q8dmJzmsnuq1C//9FYrbuY7ALaE7wYuH8mYOvIfh3flzrYjBvkG8BvBfObvrtbwsRr5fHsKli5aYZORjp+jTK/yEZaFYGFp5Gwwh2Kb6qAAN1mffrtwYYMSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=S1cVHQ0i; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-20536d5c5c7so2109982fac.2
        for <linux-gpio@vger.kernel.org>; Sun, 18 Feb 2024 09:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708278608; x=1708883408; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QglCmuihZScz0IJGwcmkNekXbZT0Ym+rOpXRMVc9jnk=;
        b=S1cVHQ0iAEP3eqZs35/i7Ucw9F800/dkX7pF8qqMBaUZMBTs5wH9sPEQvw9jLor5qu
         p1slzDV8IornG3CSHLOCubPLVT5a5gQAGUKUryUnDazaBk+YuN7X/TyojqPh4SjVzcyM
         qrBCyf7JDyvH+HB5B3Ods++3TvwyLyX0n9c8f82OoGp3YgCaZJP7fXvPSFh2cMHCNi8d
         b5Zt9AkGUKdrF4Q+vSCNWzj8UeSQAlBVhlFcUykFnlV9EITUbrNO7AiFKNNc80bRsXMl
         tZyNnpYxbNLnTHwU1vc2cSylS5K3ri9GF1Z2Fd0x9H3/++vOhZkzIBPcrVp5thEpOR3p
         V/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708278608; x=1708883408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QglCmuihZScz0IJGwcmkNekXbZT0Ym+rOpXRMVc9jnk=;
        b=oc8wl0FcYWasR3i/0O85GUiSoRYc+SutWZP59ZrTnNyrcl0yMgsJWdXJD5ItrzOIZb
         ENdAjAmd7sBO5PunLZiv2YBM9mgKx6SXqBNxfH8KkQ15SWhFeo8jbklgZqsdactrmiCR
         PHWRH9GnjW8nV0hnRQSham45sMfjyzsgbTy5BVzJ32Elm0uzhszAYvqKUuFYaPxmqm/E
         GH40U8v5CtaD6EU4Y52DvoTSDb4ACT93vlY+z0zaFzRQRxJdlYA25m31bFl5csdkl/ZO
         WxtvV2AkxvAVwvdLGtr/MR2a4Pj341cSWmLqfjfVQuUad8jHyzshfQXA3vY7iDBAsBU+
         n4Nw==
X-Forwarded-Encrypted: i=1; AJvYcCVUDulLXMokjk68pEf5kX2iQYGiLVwDxWY+CueloswlZbz0utBnJly4pt4MG9vK8SHtZ7p3RVECFiUNqwa1XeNfq4NwRlPmuBKB1g==
X-Gm-Message-State: AOJu0YzW1VduGiZstyq5ZWsXF8omOmD5+FtmbDy0NxH/rPPS6WTs/sDC
	mEH3iqx6GvQ72USkMJm5GEwqrtteb7LjWC9MAW2qUpaCuFYAUZjDrMryAAQ64PSVmmDqIxMFhPC
	Kp0ZZmJsUlDGABqLKW8zwiE8lqqsKV/KVIbx/BJ+XROhp+2Sa
X-Google-Smtp-Source: AGHT+IHI2opoylUZD5RdVXTz05DuUfPUU8QkrYo9wu2ATtpEPBSM99dik/SJL5BNiXl9XCgKXRU/QP71nyRcUoDVt3k=
X-Received: by 2002:a05:6871:5827:b0:21e:4a2a:f060 with SMTP id
 oj39-20020a056871582700b0021e4a2af060mr9062566oac.13.1708278608334; Sun, 18
 Feb 2024 09:50:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240217135255.1128716-1-xiaolei.wang@windriver.com>
 <CAMRc=MdGhfHSWPB0FCHbK+uA0MAZNFstupgm7-Zkw9dbuTmyVQ@mail.gmail.com>
 <CAMRc=Mfb1Vg1qnwE7c95PBroDFySZ6c0b0HgUhyrHFFpCz0Diw@mail.gmail.com> <b50a72ea-1b14-4bd8-831b-468d2aa988fa@windriver.com>
In-Reply-To: <b50a72ea-1b14-4bd8-831b-468d2aa988fa@windriver.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 18 Feb 2024 18:49:57 +0100
Message-ID: <CAMRc=Md8O6i6WwRhOJX+gxP1wXL4Z_Ab3iy+pMnrqMeU0utXhw@mail.gmail.com>
Subject: Re: [linux-next][PATCH 1/1] gpio: Delete excess allocated label memory
To: xiaolei wang <xiaolei.wang@windriver.com>
Cc: linus.walleij@linaro.org, andriy.shevchenko@linux.intel.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 18, 2024 at 1:55=E2=80=AFAM xiaolei wang <xiaolei.wang@windrive=
r.com> wrote:
>
>
> On 2/18/24 02:52, Bartosz Golaszewski wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > On Sat, 17 Feb 2024 19:35:43 +0100, Bartosz Golaszewski <brgl@bgdev.pl>=
 said:
> >> On Sat, Feb 17, 2024 at 2:53=E2=80=AFPM Xiaolei Wang <xiaolei.wang@win=
driver.com> wrote:
> >>> The changes in commit 1f2bcb8c8ccd ("gpio: protect the
> >>> descriptor label with SRCU"), desc_set_label has already
> >>> allocated memory space for the label, so there is no need
> >>> to allocate it again. otherwise memory leaks will be
> >>> introduced.
> >>>
> >> No, we *want* to copy it if it's not in .rodata for the same reason we
> >> introduced SRCU. This may be a valid report but the fix is wrong.
> >>
> >>> unreferenced object 0xffff0000c3e4d0c0 (size 32):
> >>>    comm "kworker/u16:4", pid 60, jiffies 4294894555
> >>>    hex dump (first 32 bytes):
> >>>      72 65 67 75 6c 61 74 6f 72 2d 63 61 6e 32 2d 73  regulator-can2-=
s
> >>>      74 62 79 00 00 00 ff ff ff ff ff ff eb db ff ff  tby............=
.
> >>>    backtrace (crc 2c3a0350):
> >>>      [<00000000e93c5cf4>] kmemleak_alloc+0x34/0x40
> >>>      [<0000000097a2657f>] __kmalloc_node_track_caller+0x2c4/0x524
> >>>      [<000000000dd1c057>] kstrdup+0x4c/0x98
> >>>      [<00000000b513a96a>] kstrdup_const+0x34/0x40
> >>>      [<000000008a7f0feb>] gpiod_request_commit+0xdc/0x358
> >>>      [<00000000fc71ad64>] gpiod_request+0xd8/0x204
> >>>      [<00000000fa24b091>] gpiod_find_and_request+0x170/0x780
> >>>      [<0000000086ecf92d>] gpiod_get_index+0x70/0xe0
> >>>      [<000000004aef97f9>] gpiod_get_optional+0x18/0x30
> >>>      [<00000000312f1b25>] reg_fixed_voltage_probe+0x58c/0xad8
> >>>      [<00000000e6f47635>] platform_probe+0xc4/0x198
> >>>      [<00000000cf78fbdb>] really_probe+0x204/0x5a8
> >>>      [<00000000e28d05ec>] __driver_probe_device+0x158/0x2c4
> >>>      [<00000000e4fe452b>] driver_probe_device+0x60/0x18c
> >>>      [<00000000479fcf5d>] __device_attach_driver+0x168/0x208
> >>>      [<000000007d389f38>] bus_for_each_drv+0x104/0x190
> >>>
> >> Can you post the full kmemleak report for this, please?
> >>
> >> Bart
> >>
> > Ah, I think I see the problem. Can you test the following diff:
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index 02be0ba1a402..0fdd4ad242bd 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -695,10 +695,15 @@ EXPORT_SYMBOL_GPL(gpiochip_line_is_valid);
> >   static void gpiodev_release(struct device *dev)
> >   {
> >          struct gpio_device *gdev =3D to_gpio_device(dev);
> > +       struct gpio_desc *desc;
> >          unsigned int i;
> >
> > -       for (i =3D 0; i < gdev->ngpio; i++)
> > -               cleanup_srcu_struct(&gdev->descs[i].srcu);
> > +       for (i =3D 0; i < gdev->ngpio; i++) {
> > +               desc =3D &gdev->descs[i];
> > +
> > +               kfree_const(desc->label);
> > +               cleanup_srcu_struct(&desc->srcu);
> > +       }
> >
> >          ida_free(&gpio_ida, gdev->id);
> >          kfree_const(gdev->label);
> >
> > and let me know if it fixes the issue?
> I tried the following modifications, which did not fix the problem,
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 02be0ba1a402..5940ef88399c 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -695,10 +695,14 @@ EXPORT_SYMBOL_GPL(gpiochip_line_is_valid);
>    static void gpiodev_release(struct device *dev)
>    {
>           struct gpio_device *gdev =3D to_gpio_device(dev);
> + struct gpio_desc *desc;
>           unsigned int i;
>
> - for (i =3D 0; i < gdev->ngpio; i++)
> - cleanup_srcu_struct(&gdev->descs[i].srcu);
> + for (i =3D 0; i < gdev->ngpio; i++) {
> + desc =3D &gdev->descs[i];
> + kfree_const(desc->label);
> + cleanup_srcu_struct(&desc->srcu);
> + }
>
>           ida_free(&gpio_ida, gdev->id);
>
>           kfree_const(gdev->label);
>
>
> unreferenced object 0xffff0000c0e83740 (size 32):
>    comm "kworker/u16:0", pid 10, jiffies 4294894561
>    hex dump (first 32 bytes):
>      72 65 67 75 6c 61 74 6f 72 2d 75 73 64 68 63 32 regulator-usdhc2
>      00 37 e8 c0 00 00 ff ff 00 00 00 00 00 00 00 00 .7..............
>    backtrace (crc 222fadd4):
>      [<00000000cd106dac>] kmemleak_alloc+0x34/0x40
>      [<00000000e084cf5f>] __kmalloc_node_track_caller+0x2c4/0x524
>      [<00000000746173b0>] kstrdup+0x4c/0x98
>      [<00000000f79b3bf4>] kstrdup_const+0x34/0x40
>      [<00000000f47eb728>] gpiod_request_commit+0xdc/0x358
>      [<000000003a6899af>] gpiod_request+0xd8/0x204
>      [<00000000c93118be>] gpiod_find_and_request+0x170/0x780
>      [<00000000660eebdd>] gpiod_get_index+0x70/0xe0
>      [<00000000eb599be3>] gpiod_get_optional+0x18/0x30
>      [<00000000e8b3cfcb>] reg_fixed_voltage_probe+0x58c/0xad8
>      [<000000009737579a>] platform_probe+0xc4/0x198
>      [<00000000405158e3>] really_probe+0x204/0x5a8
>      [<00000000772dd378>] __driver_probe_device+0x158/0x2c4
>      [<00000000ddc25aba>] driver_probe_device+0x60/0x18c
>      [<00000000cc4413ff>] __device_attach_driver+0x168/0x208
>      [<00000000e04f3755>] bus_for_each_drv+0x104/0x190
>
> I'm a little confused. In the gpiod_request_commit() function, if label
> is true, we allocate space kstrdup_const() for it, but desc_set_label()
> will still be called. If label is true, space will be allocated to it
> again, desc-> label will be pointed to the place where new is allocated,
>

Ah, right I see it now. I sent a fix, please leave your Tested-by if
it works. Thanks for the report.

Bart

BTW: This is still not a complete kmemleak report, please next time
paste the entire thing.

> thanks
>
> xiaolei
>
> >
> > Bart
> >
> >>> Fixes: 1f2bcb8c8ccd ("gpio: protect the descriptor label with SRCU")
> >>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> >>> ---
> >>>   drivers/gpio/gpiolib.c | 6 ------
> >>>   1 file changed, 6 deletions(-)
> >>>
> >>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> >>> index 02be0ba1a402..32191547dece 100644
> >>> --- a/drivers/gpio/gpiolib.c
> >>> +++ b/drivers/gpio/gpiolib.c
> >>> @@ -2250,12 +2250,6 @@ static int gpiod_request_commit(struct gpio_de=
sc *desc, const char *label)
> >>>          if (test_and_set_bit(FLAG_REQUESTED, &desc->flags))
> >>>                  return -EBUSY;
> >>>
> >>> -       if (label) {
> >>> -               label =3D kstrdup_const(label, GFP_KERNEL);
> >>> -               if (!label)
> >>> -                       return -ENOMEM;
> >>> -       }
> >>> -
> >>>          /* NOTE:  gpio_request() can be called in early boot,
> >>>           * before IRQs are enabled, for non-sleeping (SOC) GPIOs.
> >>>           */
> >>> --
> >>> 2.25.1
> >>>

