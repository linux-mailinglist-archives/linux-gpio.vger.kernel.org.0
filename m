Return-Path: <linux-gpio+bounces-5630-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 118C48A8D23
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Apr 2024 22:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95C132853E1
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Apr 2024 20:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E90D44C9E;
	Wed, 17 Apr 2024 20:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4tvzA+n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9123D44C93;
	Wed, 17 Apr 2024 20:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713386483; cv=none; b=JeYN6bS21pLCc0POjm4WhdXG0OUhPzlPYNPYILx6Mm0y9oHuA48/94S2nf3r3Y/yrUQEEN4YSly2fKFk1ee+y0z+OirnLy8NdM/4iIEj00ZTiMzQzWyS4MyS10hiqcYAGXi29OQu2od0oMH63BRPuBuIcshzHbF9joSpw3sWiYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713386483; c=relaxed/simple;
	bh=bLY6GNN/ljCF0TCnZ9VEkXrGClIqR1vihTeziYIY7Cw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vDf2C6uPOPN0qLncKR9pVz6lL3PJif65frZQp0BWSG/WG/wO6kXhAhmPsOF0MfLPFe3i/YnBQ3Y+9YK0ULBDJTPF6f07QUbNJOgdPCeb5KG5YGd9OEEchRtVB/h/V4keWhaLO68botdrUmFV3uJhh5n2HzbSBFPzvMxS7F9FmO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4tvzA+n; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a51a7dc45easo5260066b.2;
        Wed, 17 Apr 2024 13:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713386480; x=1713991280; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLY6GNN/ljCF0TCnZ9VEkXrGClIqR1vihTeziYIY7Cw=;
        b=P4tvzA+naAlSdHwvfldn5+dg0jCQdO9Jhywyidnam5gLRfXcJS5cbK1QWnTD9w4i7v
         aiDCeHHQW30AmutiDpJDExmJlIjJvi2h1GehHShF5tLs41lytQyGxg3gHsYKkamIyC6h
         rb1ilOPCMiWdjcDxnepsZa4R1OuL9YTNPdtxOxmbIueruGf2QLM2WEQozoi4O3DhXbDJ
         3hfS8dhaSSIIAvBKgOLOZZu+7hphxbOOHx4/7E784O0UCtPsF7l3k2/Uy0jBNzlXqw2t
         6AZt13ocv9FU3J4W6kcd56Ii3rVU6Nbngx6pG4Jfc859uYObO6MspQpCIAMM1a6dDQZh
         oArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713386480; x=1713991280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bLY6GNN/ljCF0TCnZ9VEkXrGClIqR1vihTeziYIY7Cw=;
        b=aQUwWC7R69dAe5EjTVkfcj2MH9vGSoW3vLuP8hVCoBJPgA2zWWtURi7gBX0WMFfF2v
         UJaZp44Zv2RDwStpYaBX1FYpYwBEdb+brOJEDZ/ibrkXCOfnMAAOKeP2Tz33M2u1QQ1O
         e93OZMolnccyGYTmMc59jd8ZE2Irecb9Ar+sBmXIzLev1wcUUCBgkVY14QIkWtyiDuJX
         szkwI7Wt6fijA+xLDPUs6+O9LgfWppCnurwaEa7jp2h7H2Ty41aAQfJXPdNciSo/YfM2
         a+q3nf26p6Xg7dETZGxtQ0MmACCyNlpss2OVvoOqRJlP/YOvi8+qx7aAJKZyW8KSU1FR
         K2cw==
X-Forwarded-Encrypted: i=1; AJvYcCX/3N1cahtqLdZelJ89S0kSZ/J1iNfRjcKqh3zQ3zhv0MNrA6zTu2n5ajag/XaeCe7asiqVWTlntjZGumY/hGgKbjk9TzFiBJIITN23VtA5I3y6JS4KA6fsLOu23k28pjQxLrcKAEvOPQ==
X-Gm-Message-State: AOJu0YwpozKC8cUOF2WCPcsRmH3OoWG0eXshLhEklMKlIbaU5XrXPED/
	MVKIR2pYNYJmKuLHpwZKZfgx/vg3IA14TmNYEFcQcdxY82xIO9opftpS/K4vflOXGMjiMWctTWt
	n70rUb/yK+n85DvYZH4P+GbxtsEM=
X-Google-Smtp-Source: AGHT+IHn/5E844nz3pu1+MqyvES9reSiOVMbkr4bbXbSwNncSiFr0VagOSryFWs1be4G/87U49KVivwEZLdPFjZ5bKo=
X-Received: by 2002:a17:906:fcb1:b0:a52:6e71:e770 with SMTP id
 qw17-20020a170906fcb100b00a526e71e770mr456266ejb.11.1713386479530; Wed, 17
 Apr 2024 13:41:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240410072102.1200869-1-andy.shevchenko@gmail.com>
 <ZhpC3lLD-BHqJEZz@ishi> <CAMRc=MerqbYue_uubSkr0ta3wr+yQxfFMfk+vAUZa+C2oR+udQ@mail.gmail.com>
 <CAHp75VcofgAQLFVLdsA-A1AkjVzQBJWtam=w00+z9-rueZyv8A@mail.gmail.com> <CAMRc=MejJTnawn1=_x9Va-QJRctjoc3TJanVqQ0uZbpmDzpyjw@mail.gmail.com>
In-Reply-To: <CAMRc=MejJTnawn1=_x9Va-QJRctjoc3TJanVqQ0uZbpmDzpyjw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 17 Apr 2024 23:40:42 +0300
Message-ID: <CAHp75VcXoEhxA+qO=MMoUanZeCP5hPXd9q7n-8AuRrotEfbYFw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: sch: Switch to memory mapped IO accessors
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: William Breathitt Gray <wbg@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2024 at 9:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Wed, Apr 17, 2024 at 10:05=E2=80=AFAM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Wed, Apr 17, 2024 at 12:17=E2=80=AFAM Bartosz Golaszewski <brgl@bgde=
v.pl> wrote:
> > > On Sat, Apr 13, 2024 at 10:31=E2=80=AFAM William Breathitt Gray <wbg@=
kernel.org> wrote:

...

> > > I applied it as is, if anyone wants it, this can be sent on top of it=
.
> >
> > Thanks, but I assumed this should go via my tree and as PR to you. At
> > least I have it already in my for-next.
>
> You didn't respond in any way about picking it up.

Hmm... I'm the author of it and I'm a maintainer for that driver. I'm
not sure if it's mandatory to respond for that purpose. Usually I
asked the opposite, i.e. when I'm not going to pick the thing up.

> Can you just drop
> it from your branch?

It's possible, but I will need to rebase, which is not a good thing to
perform. What about just leaving it as is and letting git to (nicely)
solve this?

--=20
With Best Regards,
Andy Shevchenko

