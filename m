Return-Path: <linux-gpio+bounces-6185-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 375C98BDCD0
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 10:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50BAE1C2237A
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 08:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151E013C825;
	Tue,  7 May 2024 08:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vylrPXx6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962606FE07
	for <linux-gpio@vger.kernel.org>; Tue,  7 May 2024 08:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715068841; cv=none; b=Q1j+yTShubziBNvRTK7cM4O7B4iD4tNl2J8xsXF2Espa34PixZNQfRqLZPYSSJKzX3E8glyVV3fF8AP8wN0mZyBNFQK2JuTHHuor6fpU9SUkeohOW/PdjPiHbM9Bd0VTu5UrcqFClF6VaPq6otMDILanuFZliBb6b/eBITkjWRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715068841; c=relaxed/simple;
	bh=9z8qkYCt734Wk64SXvM0Q3JE7RXJ/y4qVPiSWdenxAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lIYAcn4MwVWFNsJBBz6HXi9X2nMf0wh6JU5wLsoqDMP4mov3AP1xsU7EUdtL/EbDmt/vcH8+OXW3g8x6+i0fxMSkzkYmQdcCP8L9H4qpihT5t6unhQVeDjSC5vAjV/4xsy21gW8Y2V6oJMun1VcNF5BM4A8KMiB4LQmQTuzxV84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vylrPXx6; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-520f9d559f6so1319205e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 May 2024 01:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1715068838; x=1715673638; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPMzg+hqVpMnTKbLeT3z8nihOwZGBSuxBb1mszthdMc=;
        b=vylrPXx62NZctszrwnpBuiYNXdwhyJgLKbTGgZKbb+F4D9VpOyZ1lwCAzEJp54lZFL
         5o9XUZ3AQxkeOEffl1iTKWRdu2+PsfBURo9YFFQdScUL1kS2Y1e3ewJQ4TjruoQIAD4c
         gM1kWLoBTpd5SDKEgqqABqiZIxHRzb0lk5ZyiL3CI7Dt3imH4oIhr8eEuk5E5qJhFzQ2
         GzPUAsRNKQv5EzfvCJqokik3h7MGccWa72qRAw3eUfT8lFP7uCNAH/zAs+7UCgVXCjfN
         zQ+pdjtCDJmM7S+fIXM6o8RNDjPB66Mhiykmv6ttLCCcLBeswBgF7yUUR2h7NplMIDc6
         Aiaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715068838; x=1715673638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oPMzg+hqVpMnTKbLeT3z8nihOwZGBSuxBb1mszthdMc=;
        b=pw+1cltBTD+80Z73o6sum4p3gCPBVGPzcUSPX/A0WSzznH/OO16Ku/GqeSEWcxwxRc
         B14PIGGdpsM0F+OrFaMfjL6zD1AE1rtEAN6dutFxUnELAgV2xI368+xtxWuL+8AMrqxM
         0yyRLhitIgQYbSVcD0mLKTn6JGt+umrxAjktneh/Vgpp8+ibmz/KDH+XLF89+TsiMidD
         j49lPx+6mbAx1KC3ANpVsXTvUpKDLHF1ysMyMz8IRoEUzifFHuAtrQujXTlc/YfZ4dNI
         aC24hilbeGbv2gKrEIV9Oh7UYz4BFoMmkO8nFGhNPxD4zop9MdbxMfhVZLjG7sHFCK3G
         opRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnbrHdc48uqXUm0jvlm8+bkKPPKSDBsbV8y6Tp09BHjqOIl0772D34BRJiC+0aWKwDIdwod3UT6P6F0wdu//FyEASQUlEmDG6X+Q==
X-Gm-Message-State: AOJu0YzMol39jjqTVA92l1IwpZvCxxIDbrVPQYfXfCEZoqxfN0DB360Z
	b8oBhm2Mochse1Efub8mJCHHXnTwOuvTgCaKEZy2JqdMgY+cs0pq7zeqqUxBiVnMm8t9xqbhLZr
	8lDlL1aJB8G85TKi/px360NrzRe+7VJYNB2HmFQ==
X-Google-Smtp-Source: AGHT+IF0K0GgauIGvcleWp9kmdj/PO9XRepXqzT2/sVoIO9r+x8Ax+dJkKhL5UtA5BGQ9GhNnlymd4HorrgXzaz9TqY=
X-Received: by 2002:a05:6512:472:b0:51f:5853:14e3 with SMTP id
 x18-20020a056512047200b0051f585314e3mr9087924lfd.25.1715068837789; Tue, 07
 May 2024 01:00:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240505141156.2944912-1-quic_zhonhan@quicinc.com>
In-Reply-To: <20240505141156.2944912-1-quic_zhonhan@quicinc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 7 May 2024 10:00:25 +0200
Message-ID: <CAMRc=MdmOg6pJ7hvKSpkoTKjQny8xL5BFT2HNzgKgnjsCuwhwQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: cdev: Fix use after free in lineinfo_changed_notify
To: Zhongqiu Han <quic_zhonhan@quicinc.com>
Cc: warthog618@gmail.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 5, 2024 at 4:12=E2=80=AFPM Zhongqiu Han <quic_zhonhan@quicinc.c=
om> wrote:
>
> The use-after-free issue occurs as follows: when the GPIO chip device fil=
e
> is being closed by invoking gpio_chrdev_release(), watched_lines is freed
> by bitmap_free(), but the unregistration of lineinfo_changed_nb notifier
> chain failed due to waiting write rwsem. Additionally, one of the GPIO
> chip's lines is also in the release process and holds the notifier chain'=
s
> read rwsem. Consequently, a race condition leads to the use-after-free of
> watched_lines.
>
> Here is the typical stack when issue happened:
>
> [free]
> gpio_chrdev_release()
>   --> bitmap_free(cdev->watched_lines)                  <-- freed
>   --> blocking_notifier_chain_unregister()
>     --> down_write(&nh->rwsem)                          <-- waiting rwsem
>           --> __down_write_common()
>             --> rwsem_down_write_slowpath()
>                   --> schedule_preempt_disabled()
>                     --> schedule()
>

The rwsem has been removed in v6.9-rc1. I assume you're targeting
stable branches with this change? Or does it still occur with the
recent SRCU rework? This is important to know before I send it
upstream.

Bart

> [use]
> st54spi_gpio_dev_release()
>   --> gpio_free()
>     --> gpiod_free()
>       --> gpiod_free_commit()
>         --> gpiod_line_state_notify()
>           --> blocking_notifier_call_chain()
>             --> down_read(&nh->rwsem);                  <-- held rwsem
>             --> notifier_call_chain()
>               --> lineinfo_changed_notify()
>                 --> test_bit(xxxx, cdev->watched_lines) <-- use after fre=
e
>
> The side effect of the use-after-free issue is that a GPIO line event is
> being generated for userspace where it shouldn't. However, since the chrd=
ev
> is being closed, userspace won't have the chance to read that event anywa=
y.
>
> To fix the issue, call the bitmap_free() function after the unregistratio=
n
> of lineinfo_changed_nb notifier chain.
>
> Fixes: 51c1064e82e7 ("gpiolib: add new ioctl() for monitoring changes in =
line info")
> Signed-off-by: Zhongqiu Han <quic_zhonhan@quicinc.com>
> ---
> v1 -> v2:
> - Drop the excessive stack log from commit message to make it more readab=
le.
> - Add a note regarding the side effects of the use-after-free on commit m=
essage.
> - Link to v1: https://lore.kernel.org/lkml/20240501022612.1787143-1-quic_=
zhonhan@quicinc.com/
>
>  drivers/gpio/gpiolib-cdev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index d09c7d728365..6b3a43e3ba47 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -2799,11 +2799,11 @@ static int gpio_chrdev_release(struct inode *inod=
e, struct file *file)
>         struct gpio_chardev_data *cdev =3D file->private_data;
>         struct gpio_device *gdev =3D cdev->gdev;
>
> -       bitmap_free(cdev->watched_lines);
>         blocking_notifier_chain_unregister(&gdev->device_notifier,
>                                            &cdev->device_unregistered_nb)=
;
>         blocking_notifier_chain_unregister(&gdev->line_state_notifier,
>                                            &cdev->lineinfo_changed_nb);
> +       bitmap_free(cdev->watched_lines);
>         gpio_device_put(gdev);
>         kfree(cdev);
>
> --
> 2.25.1
>

