Return-Path: <linux-gpio+bounces-14558-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 851BBA03CB6
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 11:43:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25FD91884F5F
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 10:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F341E501B;
	Tue,  7 Jan 2025 10:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QL+jZHQX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12E61E3DC4;
	Tue,  7 Jan 2025 10:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736246611; cv=none; b=P0j/vUFZeTSwVBb/a3MHJOCDBuBNc3HB7mIieVZ2rDs4eC8HM64wLXPJe/FsxpaqGSJvipr8oQhn7YcZrFh3+Jb/W550ZFYZM9G4tN93fVvTw5jDieTWxh6HsihjwRTEMVUpH2aGugyiJHGlskvnJZBfZeNzIYHYUbp+tjTcACY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736246611; c=relaxed/simple;
	bh=zfSedaxRrnEg9qwNoryFkDmDljDprSHVfSAPVzPwPq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FmlU37jRp2Bua77AKVzr2UjloZYUkD/RSOVIy0RYQiJvBqsVNHWMqFOJuI+HgxTUJs5Wozl1+ykyYJR99WPRC4obMWy+eVkjAOwkjZkS3sSk8828I0WC/DStTjWMFr5jo3KdLpdLOR+wxtSYia0GlCoQOHdwwOuzBrf7NbTeZbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QL+jZHQX; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e549b0f8d57so5471492276.3;
        Tue, 07 Jan 2025 02:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736246605; x=1736851405; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RjaWr/m1ql/PTx07DVa5YHipwPfnW2dlG6ymYjfatsE=;
        b=QL+jZHQXiNNS73L3DuJ5bAy8QnWkkpjBvtw1JxbYK6N1dckaMCW7suqsT3Qo+rbkNE
         XCB+JT5qdMxbYYsRmnAdr8VUHsgxTS9tv6llYRpMJrkACBlvUX+OVe8cxyhao/vk8NrC
         Q/F/jH+x//1BsC26aX6QL/s/2plziYX4ThUOdW9F9HVyEjcwgWVnpjGgNpX+Z7ELcVvr
         x2Y+HI47TYiCf8MaQf5taZMuNWvFF18+3krHG+Al6r3tN9l4/6rrB0rKWlbRaf7QBNtm
         lI4Q28tby3pQwiOmfZTHHLNyw4KSD+5K9l/DSAhyUFKAoB/B/lMeSkcWH6ryI4/R7Pta
         S2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736246605; x=1736851405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RjaWr/m1ql/PTx07DVa5YHipwPfnW2dlG6ymYjfatsE=;
        b=i5Wx9N4kgk1h+ujBHbI+lzNBwYhdYRWI5uaWAxR83R1IgU16HB9BHgAF0U/P4CP6oX
         6ubwVhdzK2ewKMnzmCpUWeMIrIBEiuoFTz/Io+gISWDUDYCSkN+Sc3HZo13btaKGU7qW
         x79X5zcQBq8oCa+Svqfr6L0vro1mAQSZFyevaHQAV8Yh/DIQrbwEhVj6KBie3ZXCSvi4
         GzikQ6XXe+T9SMWZq9RaGefSZxpyXWiD2pFanV3eaUYXddYivh1MIlCs7zlr1PTvxqJC
         /gYKNGbx+kbIJVaR+kZuUO6qQHJ4Fem0c+CyOiQmboZuljYjuxkyQSF5uZbaGwNuylIW
         z+iQ==
X-Forwarded-Encrypted: i=1; AJvYcCXysvY1/V4Zkq/jpLrGOB+mV/MiMzYzqKgPc+elCbeGdSlwuJ9AaxhJqurWrYcdFmV0h/mW8UwPtv4vT+wL@vger.kernel.org, AJvYcCXzMUN/kxmIZV0/aHrCk0rORPEbz5sq0YPuH0bdIRGjNNBnX7NskQkaoAVkrzbTFLlRhUZ5q+fZPgIG@vger.kernel.org
X-Gm-Message-State: AOJu0YxUmDMsPJDShmKsR8qiueyNWnDSSCfTAFFbUjZ8DgvN9Se/wGP7
	LoKetn5eJ9WqXsANcwlTQ/lCjulotuB0hf6aNfP3VAUf9MB/qR+MxfcvdzrtnTz32Yz1GT/7R5n
	0hy3ja6nelTKsRs/KMNXY8J/k/t8=
X-Gm-Gg: ASbGncs2S6gX/A/GVBQXOL55BPjxqmuxLotFd9ydf03MYmRmZxarkQXxKtkiQaOgTzp
	tiRksVW2QOE6hRUUBeAsGQCYvzgP8Ko0/uawj
X-Google-Smtp-Source: AGHT+IHA5+IKEpEDK+Y6p2ByYqeRH1ZCEc4ognNapfjvtd2xIAlykRLpEInGXimKk8UHG3ASy12X0gUx/iww5iwXHcM=
X-Received: by 2002:a05:6902:27c8:b0:e33:121:4150 with SMTP id
 3f1490d57ef6-e538c00bd6amr39812525276.0.1736246605616; Tue, 07 Jan 2025
 02:43:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107102735.317446-1-noltari@gmail.com> <20250107102735.317446-2-noltari@gmail.com>
In-Reply-To: <20250107102735.317446-2-noltari@gmail.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Tue, 7 Jan 2025 11:43:14 +0100
Message-ID: <CAOiHx=kawxL8ABs9D3t8OCXDX+YynpzkipqhTP1ZgpViONi+qw@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: regmap: add request/free gpio_chip functions
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc: kylehendrydev@gmail.com, florian.fainelli@broadcom.com, 
	linus.walleij@linaro.org, bcm-kernel-feedback-list@broadcom.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jan 7, 2025 at 11:27=E2=80=AFAM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:
>
> Allow configuring gpio_chip request/free functions when creating a gpio-r=
egmap.
>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> ---
>  drivers/gpio/gpio-regmap.c  | 2 ++
>  include/linux/gpio/regmap.h | 4 ++++
>  2 files changed, 6 insertions(+)
>
> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index 71684dee2ca5..32ec85b41653 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
> @@ -261,6 +261,8 @@ struct gpio_regmap *gpio_regmap_register(const struct=
 gpio_regmap_config *config
>         chip->names =3D config->names;
>         chip->label =3D config->label ?: dev_name(config->parent);
>         chip->can_sleep =3D regmap_might_sleep(config->regmap);
> +       chip->request =3D config->request;
> +       chip->free =3D config->free;

I wonder if you couldn't just use gpiochip_generic_request() /
gpiochip_generic_free() unconditionally here. AFAIU, these don't do
anything when there are no GPIO ranges defined (so should not
interfere with non-pinctrl linked devices), as well as nothing when
CONFIG_PINCTRL isn't enabled, so they should be NOPs if there is no
pinctrl link, and do the right thing if there is one.

Best Regards,
Jonas

