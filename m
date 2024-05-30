Return-Path: <linux-gpio+bounces-6946-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CACD8D4B07
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 13:52:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E1A51F242E6
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 11:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B328217799B;
	Thu, 30 May 2024 11:52:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2D31761BC;
	Thu, 30 May 2024 11:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717069958; cv=none; b=EqdETmyQeGESJkR4IN+Sbf/4EDR64CgUjXRXq7F/pafdZOEMlKpGg35hpD5RdWoCWFUChgtqgvns3Sc6JQR2StqEK1lzEz2AqTT8m6BrcJkULBJQtVm5cVA/WLHdD1CmbYgpARW6ZScy8YsFeRidCOHsVYPwtAOVlK9lhQB/Lhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717069958; c=relaxed/simple;
	bh=6Rb0Qi1jReQtfGAATyca6ryr20oTOSHp/NzHDoarh6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aQdUq3SUjv4grGgO29o92GGrxXKwXXnnTFvrZwuY4ePL93F8/InVoXO0eJQX4qHN4t2uN+DQrscGSq/hm6+mqk2+kQlerygwLBq0W5N28P2Oa1LwMyZA1RuxaQBz2+AovN3kcmSI8ljk4rkmyMfhAfT0ZxnB356nYLrx5I7oLYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-628c1f09f5cso6690297b3.1;
        Thu, 30 May 2024 04:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717069955; x=1717674755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vSHRU0VV5fqoB2aM9C4naW+rdYobnwtM8AVVna88s4k=;
        b=o68xmmzu6hQXOmosmvWZNLj080DNn2f2tGoDJILrXmeZF7eEHx83bd0+sZbsV5VFkf
         R6B28TxD8HK8xjiclVVuW1g/bg9l1mncDZVjU83P+IprmGYgBg05Gx5k7t7fYMzM0ogS
         vf0N3cxqsg9+nPDl60bGa5l3wWVyDjQmXWAxi4P5nTVoMHIM/2TRELrWqqboSHDDoF+9
         XQe+ngHLYolhKaEvIYsZQpN9iYay1ccSjZaS+nkjBjCKHt5IwELIMBtcjvd2VrRnY5nX
         C14tuNvazPNjIjQ2jJCwL92v2NjSdtbIDC88027tYVyIZiGZVdue67ZDAZS8tP/CzxrU
         6nSg==
X-Forwarded-Encrypted: i=1; AJvYcCU5LenZptdlZWmBvT/ARSlXEwSHznejcyEsvo+7SIpQxKHQ/CQe88+TbIVC/BQEDM/XhzOa9+W92hKvzOYdfj8lChf0rfYDuRzaQm1PS5C4s0C//2yhRmss4hYykKmA3vpvfYNQEULr0Z+2XT7x
X-Gm-Message-State: AOJu0YygwDWIBfnuw80QbS9Eq07kUDStMXraV2FvTnnhqZ7WEgpJ4S16
	8SLyyoy1uOTCZAq+79qiCzbbomb5SWqfgCmWPpxlj+D4cGA5OPz6b35pROu2
X-Google-Smtp-Source: AGHT+IEK2cVkKLXO92jEjCmGOUyAw0M3ZPvvs6P0OCHBpczcAY/y1wu4Jebm3l+K/QU2QsNiVAHOIA==
X-Received: by 2002:a81:8984:0:b0:615:22ff:b57d with SMTP id 00721157ae682-62c6bcc9e11mr20636647b3.42.1717069954191;
        Thu, 30 May 2024 04:52:34 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62a0a4ee244sm27641697b3.77.2024.05.30.04.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 04:52:34 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dfa59545e0fso756130276.0;
        Thu, 30 May 2024 04:52:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWcThnZBT5V3fwA2qvD0OtTgfaSGDNaL/nqJTq7+NS0+9ONNtsgGR4PS6Z4ZKJ6NRc6Xz094VsdU96qigvKS/t6QoriT/IqOeRhONhRLMlX1SwKiYi1qsEGf914IwjDZl9mhH+ygHuWf7cjDlIn
X-Received: by 2002:a25:dc93:0:b0:df4:d889:a086 with SMTP id
 3f1490d57ef6-dfa5a60db24mr2633672276.32.1717069953636; Thu, 30 May 2024
 04:52:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c0a28f466c42d5d59c7fadfa1fd05fd512d43b6f.1717060708.git.geert+renesas@glider.be>
 <ZlhGYFM6iVlGjZk-@surfacebook.localdomain>
In-Reply-To: <ZlhGYFM6iVlGjZk-@surfacebook.localdomain>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 May 2024 13:52:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU6V4Ooit7P5pqUFXOZawiZj7TjXY7t=KVk84xPZ0PR+A@mail.gmail.com>
Message-ID: <CAMuHMdU6V4Ooit7P5pqUFXOZawiZj7TjXY7t=KVk84xPZ0PR+A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzn1: Use for_each_child_of_node_scoped()
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Thu, May 30, 2024 at 11:26=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> Thu, May 30, 2024 at 11:19:29AM +0200, Geert Uytterhoeven kirjoitti:
> > Use the scoped variant of for_each_child_of_node() to simplify the code=
.
>
> I do not see the point of this patch. This makes code actually more
> complicated, and I'm not sure the code generation is the same and not wor=
se.

On arm32, a conversion to for_each_child_of_node_scoped() seems to
cost ca. 48 bytes of additional code.

BTW, the same is true for cases where the conversion does simplify
cleanup.

I checked "pinctrl: renesas: Use scope based of_node_put() cleanups",
and all but the conversions in *_dt_node_to_map() cost 48 bytes each.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

