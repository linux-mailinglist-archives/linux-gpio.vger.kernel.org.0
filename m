Return-Path: <linux-gpio+bounces-28644-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4EEC68B8B
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 11:11:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 058C9382A5A
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 10:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2B4330B14;
	Tue, 18 Nov 2025 10:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IS/wEZ2d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C49B311C14
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 10:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763460194; cv=none; b=QnC1yxJtDRX0oZrAJWB8iHWIXvQanH36ZV4U9XpeaQc6EgnCiMcCO9pXvl0b/idXMEq8bUs60REJWwIlIUvZf8SD7rFRI7dttAiNK+8GBaZ87JE7wpCJ/s5g/Aep6s1pvhzg/FeaB8JclwvoycpiKhZDSih3MuFGNw+/JPcF0kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763460194; c=relaxed/simple;
	bh=l/G3vsYSGBAYjuoPZkUX7z8obbKtc3jiqu7wpzfrIpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F2JludnQmP0mxF1unRZGYMewJ/PgB+nJmfKQfds3ox0yAtWNZfJmDq7bJ3IMqLk/rBo9fPv/lJAG8hEvTU1TLBGKPbXzdCK6+yRIPdbrlA7GHyf/EMcUL0y+MFgywQliX/eGNYJjdoWJeBA0EVm6uI3gIXcmBZXLAYdJ+bKKQqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IS/wEZ2d; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64165cd689eso9705475a12.0
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 02:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763460191; x=1764064991; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mB/sIhPW1gN3tcZpXRL5coOFmEA0TsaGSzvhPsvKtd8=;
        b=IS/wEZ2ddcor6QlzrQ7ecYUrgtSA9TqJb7oR/2xI+8pzwEW/RLo4nZj7slHGzlmt87
         YehVqkDCfL5uMAtOEevjFy5gtJrHae2PTLAuJVTgQNXMy8H4Nd59rQSFSAwShtd/NPSa
         yKrpbvBUbJ4Qj0YYgsO2rpq2fi5wNq6m/ALKyDKBJBkUmtWzyYudo3iVN8O+oozTvQBG
         ncVmgt3v1GcnqqbMQ70dKMo51489bfsypVb5yYW6XH7w5Nkx68tPJM+gd3f9pC5faCQI
         d/tKZyXiaxEOPgUk3cyTBU+Xi2Q6dwFKe0EHi9Z2SjiaNQeJpSSjVlibq3DPRy3xADEA
         9h6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763460191; x=1764064991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mB/sIhPW1gN3tcZpXRL5coOFmEA0TsaGSzvhPsvKtd8=;
        b=IxgwJikNvKpC29r7/TmY74gXyidQhO0N8ad36B/E/3ZJNAG5O34RQA3XnYXgG999+D
         e32jpASDkYD9ooXvzKd5VvY8DPnyeS3OcEI58mRiSczrJUoE+usMbsd25DV+hI/aYlYi
         tFP8ivLuOQ9vB/dQZoNWKQi++zx+yfVp05ep7Ks1umNuVk0pLfpDjHQcqYK/pXFhnrNb
         70fKgxKb3fwQKRYTm9y6JmKZ8Uzw/oe1IO5cfZgpV1jvoA6+VZ+Ppz4eaU9vDAHrmy6Y
         NYYiAejzncKbS2USP1ORh+Zv48sg/z3a5fu7rBRnp4iEYAs/VO6XN8JIgzstjhhNHrxV
         0nhg==
X-Forwarded-Encrypted: i=1; AJvYcCVl12IadsG3KbhDmYLSZCm0fsSWvwHnDji/2151ewgKomuZAZOms7zYpMC/dBDNjQCm0X/j3yfZxO0j@vger.kernel.org
X-Gm-Message-State: AOJu0YwrixTru+0yOYl2S4062d7KnXU2kugE9/jcliEoCbUw2RHIB0EL
	NnCWPAAX0evMWAY1ytJT+BSgjA+uefpCLFQV6Hyr4RAb5giRQWdeah8xXXqT1fVZvrsW5Z1WBMR
	yezbmwJrGcDHN5/0GBqLJSYsc+yLAY0s=
X-Gm-Gg: ASbGncvtj8Vget7K7qYr2+RpEqEc3SYFJ1Y+QsJy44bmBzVtMdAEer66TuYqu4FFYt5
	bjULhPx/iz01pG+yNNkJKX5A0jqmydCnVeQZnxyMsRAyn0Dv7+Llron+rzyUf0tHXp0zYNKTLOe
	7nCP1w4Ymk5n/3dVCsjJnPf3NjEpoz4XwECyshAzPI24WVHfMniP3dSalrLBpfxiG/Pb0Lxw84W
	T67qf2KbS/7eWHkReu9fS0s8KRLl/5lfPikG0+0s1cA7odEeen0BQv9LuP1NRsrQPpEzO+IeM2L
	s0h1UN0pTgYFDd4J7jyWwoYKnIFD4uJpMChk5kGeW5/TzemT4cFjAxAwrljEUX70NSpFtM4=
X-Google-Smtp-Source: AGHT+IEwCP2A8UKJcJgm5Q3O6rX3dSW0qispZ7CqMA+4OdO9+vcJ62wolQ38IotKKwCYmqcBvIObLxH+o/iPac6JqWM=
X-Received: by 2002:a17:907:d8d:b0:b72:7e7c:e848 with SMTP id
 a640c23a62f3a-b75a0a03e96mr325380266b.17.1763460190419; Tue, 18 Nov 2025
 02:03:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117075826.3332299-1-andriy.shevchenko@linux.intel.com>
 <20251117075826.3332299-2-andriy.shevchenko@linux.intel.com>
 <20251117112702.GZ2912318@black.igk.intel.com> <CAHp75VcJD5RnVgcCiB3C=BjDGvui_ESBUPXZhDO3NUVcEKF+Lw@mail.gmail.com>
 <20251118052731.GC2912318@black.igk.intel.com>
In-Reply-To: <20251118052731.GC2912318@black.igk.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 18 Nov 2025 12:02:34 +0200
X-Gm-Features: AWmQ_bkYk7VHivKmxsthU8EcP5JN9nwAeC0cQoriySYkuBKTglDychdeVFB_mgk
Message-ID: <CAHp75VchSE38aw39eDmeZQi1RTQ-nESf-MsOKAhsFe0xOSsTWQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] pinctrl: intel: Refactor intel_gpio_add_pin_ranges()
 to make it shorter
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 7:27=E2=80=AFAM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Mon, Nov 17, 2025 at 06:06:16PM +0200, Andy Shevchenko wrote:
> > On Mon, Nov 17, 2025 at 1:27=E2=80=AFPM Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:
> > > On Mon, Nov 17, 2025 at 08:56:59AM +0100, Andy Shevchenko wrote:

...

> > > >       struct intel_pinctrl *pctrl =3D gpiochip_get_data(gc);
> > > > +     struct device *dev =3D pctrl->dev;
> > >
> > > I prefer this keeping the reverse christmas tree.
> >
> > And I prefer the logical split, if possible. putting it in between the
> > intel_community and intel_paggroup lines seems worse to me than the
> > proposed case.
> >
> > > Also it can be const.
> >
> > True, and it makes things closer to what you want if I leave it on the
> > same line. Do you agree with my reasoning?
>
> As long as it keeps the reverse chrismas tree after you add const.

So, it means "no" then?
Let me try again. The current looking is this:

> > > >       const struct intel_community *community;
> > > >       const struct intel_padgroup *grp;
> > > >       int ret;


After what you are so insisting it will be like

       const struct intel_community *community;
       const struct device *dev =3D pctrl->dev;
       const struct intel_padgroup *grp;
       int ret;

which disrupts the established grouping of the Intel pin control
related definitions. And in all other functions where two definitions
appear they are never interleaved with other definitions. And I would
like to keep it that way. So, with my proposal it will be like

       const struct device *dev =3D pctrl->dev;
       const struct intel_community *community;
       const struct intel_padgroup *grp;
       int ret;

or like

       const struct intel_community *community;
       const struct intel_padgroup *grp;
       const struct device *dev =3D pctrl->dev;
       int ret;

which is not strictly reversed order (but the upper one is close
enough, like a couple of characters shorter than "required").

If you are still insisting on the strict xmas tree reversed order,
assume I drop this change because I reasoned why I want the way I put
it, can you review the rest of the series, please?

--=20
With Best Regards,
Andy Shevchenko

