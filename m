Return-Path: <linux-gpio+bounces-7256-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27319900308
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 14:09:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9221328316C
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 12:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512F51862AB;
	Fri,  7 Jun 2024 12:09:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D45F1847;
	Fri,  7 Jun 2024 12:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717762143; cv=none; b=fauqVXhRVEwh9lK9JDOyKLTPmvZd/Gj+s9mA0NadOCH4lIz/z+ru9HDCOA5EbgJPAR7gUnMamy6z/l/S3jDX+ndelWfWStawDykgkhmsAFGtEPQZ5DKAcn/bGjEo36tLebsima44XNPBid3uZBuasxvL6y/bp/13UyVl7tGSJA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717762143; c=relaxed/simple;
	bh=1PjxLGfcuLVYzl+oOzGlXer6PCoQoWHAf94zr4kKv2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PTyWDrGVkV04e4q73e+2ftnMAq+liHqXXYdQFJYAskNLpDVqoyKXdsedey97kfyDWDnTwVQ+kS+O8a6YbIu+CXM5WZyogyyP4+NDzJZkqfveSNcJspOikxr5bQ6tMkXEvYwAnzdtSh3li5VXcfGKkrCCi/DNr2qFe4NtLesfjms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-62a087bc74bso20728657b3.2;
        Fri, 07 Jun 2024 05:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717762140; x=1718366940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oODmMA2OuqiB6/GDcDxIFR+jglicRt0MbUJPYnwfDl0=;
        b=jzkXdhpJ5/eY5QR2s4FQxEAsvg++ZrKhjEYj5ddZrc8yD75c1HVyOC60y3s0nWBfGW
         QNO08oizWTzesiIful5DUat9AJKb8rbchZ9JkoGJ5//9LVtlGOr1mSAAphMJh5TV8QaK
         dS/XBVGuG+OFrgHEhY9lh6f2GmjGZYlze8UyCzvfJZqpJ5B/GKMsbjYHqhzPisahmarM
         oAPVq85KpoIeegFK+2WwvM5GVlebM4j0U/i5VmakREre7OY3uwto4RoZrfOasu+c4B0S
         1HBKZaVnXOFTZbzSk5ka2YG8NDpnb3KSWTEzhJYde1l+KIBVTTpYQr0oJWxY4iNCNg7h
         qgpg==
X-Forwarded-Encrypted: i=1; AJvYcCVCyWvNhskW0QGODm8GDQa6NJJPTREf3ZmCp3UEnwCJ3YE11zN1DUEIt7jjBWkl7qaAgR5SKYYxxStGW1wOMznVyrY6HHqRLL0I357zZBwyym4vwFBvtKp5viuKD8e248y5yCpF5pfg49bUlmvL
X-Gm-Message-State: AOJu0Yx6fM+f4m+OZNXCSkWp4kCJyzh8i/P6p2RRjJp1H6XRfKCNBIuT
	eD38quat1occfZQspH3kq4LvhDs+YJkQPXavx4m8KG11uKbIEnYcVFBnxhTb
X-Google-Smtp-Source: AGHT+IGPC74QQ3MjZS4rP1unVEgg7ZjUXsvi/YGnGP3s/BOY86hXl6/VohApI6DBSXHLDi2fJWmytw==
X-Received: by 2002:a81:5215:0:b0:610:e9b2:f84a with SMTP id 00721157ae682-62cd55f7346mr21364567b3.26.1717762139985;
        Fri, 07 Jun 2024 05:08:59 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62ccad1b121sm6407507b3.63.2024.06.07.05.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 05:08:59 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-62a08092c4dso20859757b3.0;
        Fri, 07 Jun 2024 05:08:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW9PhW8sDMbTiTCa4aA6FLI5WUlCcgcN4lfd/GDdmHLQUdk8V5WrufZVFnymbnePLYwDle7Ibxxqapy25IMuEGepmV9+EgBKR02oGOLxdnLzeMnYp8HTbqpRXfpRzHi4Yj17mNhpTVfeZrOLOZu
X-Received: by 2002:a25:d38c:0:b0:dfa:599e:8b74 with SMTP id
 3f1490d57ef6-dfaf659531fmr2486092276.10.1717762139546; Fri, 07 Jun 2024
 05:08:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c0a28f466c42d5d59c7fadfa1fd05fd512d43b6f.1717060708.git.geert+renesas@glider.be>
 <ZlhGYFM6iVlGjZk-@surfacebook.localdomain> <CAMuHMdU6V4Ooit7P5pqUFXOZawiZj7TjXY7t=KVk84xPZ0PR+A@mail.gmail.com>
 <CAHp75Vd3ke3_bxwsxzSVzjnNW-6aYDTYHvZ-+B9nJtAJR1fX=g@mail.gmail.com> <7f4ef893-5ab6-4a9e-ad54-4b3587516bcf@moroto.mountain>
In-Reply-To: <7f4ef893-5ab6-4a9e-ad54-4b3587516bcf@moroto.mountain>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Jun 2024 14:08:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXp7aR6=Rvk3Fe_P3xqdavc9Bh7Df3dJfRWF1KUnOTJOw@mail.gmail.com>
Message-ID: <CAMuHMdXp7aR6=Rvk3Fe_P3xqdavc9Bh7Df3dJfRWF1KUnOTJOw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzn1: Use for_each_child_of_node_scoped()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 10:01=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
> On Thu, May 30, 2024 at 04:36:59PM +0300, Andy Shevchenko wrote:
> > On Thu, May 30, 2024 at 2:52=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Thu, May 30, 2024 at 11:26=E2=80=AFAM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > > Thu, May 30, 2024 at 11:19:29AM +0200, Geert Uytterhoeven kirjoitti=
:
> > > > > Use the scoped variant of for_each_child_of_node() to simplify th=
e code.
> > > >
> > > > I do not see the point of this patch. This makes code actually more
> > > > complicated, and I'm not sure the code generation is the same and n=
ot worse.
> > >
> > > On arm32, a conversion to for_each_child_of_node_scoped() seems to
> > > cost ca. 48 bytes of additional code.
> > >
> > > BTW, the same is true for cases where the conversion does simplify
> > > cleanup.
> > >
> > > I checked "pinctrl: renesas: Use scope based of_node_put() cleanups",
> > > and all but the conversions in *_dt_node_to_map() cost 48 bytes each.
> >
> > Yeah. so for the cases where there are no returns from inside the loop
> > I prefer not to use _scoped.
>
> Eventually _scoped() loops will become the norm.  Leaving some unscoped
> loops will be a fun surprise for the first person to introduce a return
> -EINVAL.

Exactly. So I'm queuing this patch.

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

