Return-Path: <linux-gpio+bounces-22608-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3F6AF14F1
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 14:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 222B2189BB1A
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 12:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA8A26C3B8;
	Wed,  2 Jul 2025 12:05:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED74F253F15;
	Wed,  2 Jul 2025 12:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751457934; cv=none; b=UgHiSWs+KpxEjQsOzkjcZYUiyUKVzWm143zY5KZZLeY79sIXNYCMXjczNfiRqZfa1nEXLIDzOVxsmX/94rn7e81MInM0pPGpRPGPbK8y9lvWSxh4WoV/ag4A8XrYEhaFhPVuaM2m1NE5o9JX/l5ijUjZ4OfXME0abNrd7zyz4Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751457934; c=relaxed/simple;
	bh=UiDm7a9UThCV+8q/0XXk+kAX0bvrKKV7VdUwrD2V2OU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EZY9rOxkd6PaLeLSUrN8p+G8Shfub9oXqEGAsaJUlXrZBlWrQxis4K/i3OkaWQGCqgBRJECiQmFdMZkq0mS0PV+FRjQqa+IHDj6RIyjOgIjXc358rb8iiE2jj7FA7isUCIs5DD/6Id0jxatg8RV3ODRXG4tHJdaPMB8oefK/jPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7d09f11657cso623010685a.0;
        Wed, 02 Jul 2025 05:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751457930; x=1752062730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FHdlp2ZdrIG3etpYbGlvmwT2yy2H0TFuQerZNRAw3Xg=;
        b=MdOcOfEGn4JerMUTgBCFPSmwwRaqFYB/zWKEMjgqqvbCsXvXiyqNSiJnRcblDR3+Gn
         UzjA6Kc20qugJRulalmjmCHL0EK3ERt3B3a0c0tGOOKQK0J/ZOx/ocmUwoNH39PQYXLq
         oGsW0kOuo3wGXiO4zYYT/6OeYppLu2ckjXfXmTCE6VarXqVi+jr/+8i9+OwbLuCAZ931
         HOgOzPB4MrD8nWSosbu8Bm9SLYsb0djVdwWBbllWI6ItB4HNe3bRwNvNVLhyGZhlS4LW
         IyNVD04ZzX0NIdusxZaAy51hLrdzwIiAPOnASaoBFQljmA9/7TutT9+1BkEX8SBLPxwT
         crpw==
X-Forwarded-Encrypted: i=1; AJvYcCU3ZTi1FDeRK+tFIVJumg1/8ZDouyT5e0x+YBN5KQ6cNdQgK9cz5o/D0Dll6RdnNeA66vXxUoYqvFGc@vger.kernel.org, AJvYcCVYeJIY9MkhrVcDO80BTFcxejWxd2vFOjxvLD8+YuVoZEOp2gogom9wnXICXcVFoBpoYQIdMwIU9EnzLWf8@vger.kernel.org
X-Gm-Message-State: AOJu0YwyzwWRjc3LwnwGm7feYML/BY4+TzA24vgBWwk1jg9FpwOQ5GsG
	mlj6xHS0bVfqifiTxSPCSX3ehliNG4U9eExVBnipJ4WJyjEFYgiug3YKjINrDI56
X-Gm-Gg: ASbGncuCLcdL922g9v2PJrfuYxSROieKwX0loGgI9wsvrXyY9svYGrRMiiBSNB72Wlc
	EJOZovsAi4pZJ3WJJ+40IitMbFGMiz7gUlTMimA6R7uKhizhmkhGs4jn+6m7OAcLPOX90w9EkQd
	OvxHjPY7GKLh54jijEIBZ2LuWXFCZTPkwlPRibDLdOiTXthBVSnbxI15Wxo30qSMvx5XOU1Ppt/
	KUtni85tzPGU94HYqxVkbFevO/rceoH6DETFaBENuQyU1gEO0ABOncg3zDaafTXHATi58Br4Vq7
	mzuMKVbFi9GPUUgo0Z7lj/ZUIvOLPyZ5/smkyMqnDCCoZC/RzEx6Y/jKgapf6XY0rdUF71aJCm9
	NNH/q+Yj0xb1WtQH0LlteL8/9vou8
X-Google-Smtp-Source: AGHT+IFe6DUfG+wlnC4UE9wPq5TXur0VjbKotgt0+clxjN+Sv0Oc3dniv/8Ovz9/ANPcH0lXlND05w==
X-Received: by 2002:a05:620a:2693:b0:7ce:b7fc:6b6f with SMTP id af79cd13be357-7d5c47f757cmr366406185a.58.1751457930252;
        Wed, 02 Jul 2025 05:05:30 -0700 (PDT)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com. [209.85.222.176])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44320572dsm920928185a.69.2025.07.02.05.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 05:05:29 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7d09f11657cso623005785a.0;
        Wed, 02 Jul 2025 05:05:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWj3iHUS1bnQB3W0NbsqhNFogIH2l8/Bu5KHewzBxbXLQdkAhEgjZ+LaibWC+s7arr6+I3R/3/cHW8Yep3B@vger.kernel.org, AJvYcCWvkXtJXA8eTJxLEbAR9iMSfR773dTpU27ZJJ9/t6yiGGAwhbT+IrJcmwLzxgEY1JOAYobxh+19xqpu@vger.kernel.org
X-Received: by 2002:a05:620a:46a0:b0:7d4:5e0a:28cd with SMTP id
 af79cd13be357-7d5c47c60d8mr449259985a.49.1751457928033; Wed, 02 Jul 2025
 05:05:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org>
 <aGPrFnDxG4W7S9Ym@smile.fi.intel.com> <20250702035439.GA20273@rigel>
 <CAMRc=MftawBB4rtj4EKS_OwMCU9h53sA8QxcFq_ZY0MRg2OLag@mail.gmail.com>
 <20250702101212.GA47772@rigel> <CAMRc=MeuMpo0=ym+FvDh5sCNXM00+iOSNFgTxMqagO78ZS64_g@mail.gmail.com>
 <20250702110127.GA51968@rigel>
In-Reply-To: <20250702110127.GA51968@rigel>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Jul 2025 14:05:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVFURtVovo4xUddULjchzK2Qae+ePHA3VKBeBo700a=gg@mail.gmail.com>
X-Gm-Features: Ac12FXxAle-6go22Q_dabyHOkvjGoV0yuEFExkrpUFVeVY3yXxBt9jQV-ftKO74
Message-ID: <CAMuHMdVFURtVovo4xUddULjchzK2Qae+ePHA3VKBeBo700a=gg@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] gpio: sysfs: add a per-chip export/unexport
 attribute pair
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	Marek Vasut <marex@denx.de>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2 Jul 2025 at 13:01, Kent Gibson <warthog618@gmail.com> wrote:
> On Wed, Jul 02, 2025 at 12:28:01PM +0200, Bartosz Golaszewski wrote:
> > On Wed, Jul 2, 2025 at 12:12=E2=80=AFPM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > > >
> > > > I tend to not interpret it as adding new features. We really just
> > > > *move* what exists under a slightly different path when you think
> > > > about it.
> > > >
> > > > So what are you suggesting, remove the `edge` attribute and polling
> > > > features from the new `value` attribute?
> > > >
> > >
> > > Exactly. I'm not suggesting ANY changes to the old sysfs, only your n=
ew
> > > non-global numbering version.  The idea being don't port everything o=
ver
> > > from the old sysfs - just the core feature set that non-cdev users ne=
ed.
> > >
> >
> > I mean, if someone shows up saying they need this or that from the old
> > sysfs and without they won't switch, we can always add it back I
> > guess... Much easier than removing something that's carved in stone.
>
> Exactly - expect to be supporting whatever goes in now forever.
>
> > Anything else should go away? `active_low`?
> >
>
> I don't personally see any value in 'active_low' in the sysfs API if you
> drop edges. It is easy enough to flip values as necessary in userspace.
> (From time to time I think it should've been dropped from cdev in v2 but,=
 as
> above, it is carved in stone now so oh well...)

IMHO active_low is only really useful if you have some hardware
description that provides it, at which point you may be better off
having a real Linux
driver for the thing connected to the GPIO...

People who mess with GPIO /sysfs better know their hardware,
so they should be aware of the polarity.

From my toolbox:
  - For pcf857x (which is pseudo-bi-directional), I usually just set
    direction to "in" (pulled high) or "out" (driven low),
  - For everything else, switching direction to "out" is ill-defined,
    so I do not write to ".../value", but set direction and value
    together by writing "high" or "low" to ".../direction",
  - For reading, I do use ".../value", of course.

My 0.02=E2=82=AC...

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

