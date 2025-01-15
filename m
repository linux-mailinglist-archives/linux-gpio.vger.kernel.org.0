Return-Path: <linux-gpio+bounces-14847-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A884A12711
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 16:17:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0505B3A182C
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 15:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A254B1459E0;
	Wed, 15 Jan 2025 15:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRXBPmZf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4D612AAE2;
	Wed, 15 Jan 2025 15:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736954253; cv=none; b=bIVsZbAjjQlUSUJSTCNABy/I5VaC6UI4rxPuM1KgewMsd7BCS4cGzsX2EzhuahPf74q67W5Q3czWxkp+wS3R2qwCQZrjplsajqFsVCJZrsDusDHo0hO8QdtzV1VVEJD0oWjoF4B/OQOI2+7UbPllizJANYI9ybajP8xpdW2wbY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736954253; c=relaxed/simple;
	bh=Uif1glbP6fdYuWDq3VFY/NUU+QWzrN3dw23Wecy6Pzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KXsMiKl/sU0jvfvlGzeqoAH/FJZOotQUtasRQikc/Gij9aiepFbX8zDIU8lHs8219cEM0JNbGIRSP0OKGkZTEIcwJTFNP+waRpbq4zTg1Y9eSu1zR7p64bCVEUc/5dDD33I0cv2UIcf1Xapv9i0IVHV7ApgL3I0m6vM9G+xMoQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRXBPmZf; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5401c52000fso5820962e87.2;
        Wed, 15 Jan 2025 07:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736954250; x=1737559050; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uww07cUdp7duxGiMrR7iOp8DgfbxO1hObNoJqUTt4uE=;
        b=dRXBPmZfoktjRRAB42Pj/gtvtML1KsM33IZXkz+qI+WqCxcOYMrcDzKfIhPeyV1Gee
         vI10csG5OjYrSPSwiNQ10FqYp3//DY2xvbT6nzr/0FytpzXIHqBDE7MBGZ5QgghlRxTq
         /D/Eo2q2GIEkt8RSLnDr3JuawHYOaXcx+bw9PfawXkFhdEn+5jIb4cSuQyL07Cov+ibZ
         QFF/zLSA+v/I0PuRrVhY4o1RZGdV1LaND1z50HPKfioHwATMMeBmU5eeYxsfK9K8hgRY
         o4GoGw5uzQq1IVNn4loDoKbzDu/IYZuPDrEEOXHTE9BnBlOD4mZOumM5wMIJnTF81xv/
         nC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736954250; x=1737559050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uww07cUdp7duxGiMrR7iOp8DgfbxO1hObNoJqUTt4uE=;
        b=o0TxAdpom7hxm6iJX12nvlAfsPbyWjTtl5uipUAr3mvOVbxc60B2bmMvAVWuXw0ZgF
         iTpLv2D0zLILzIY32x4VuQ3D+O5nVwLGYMXxWMDpOl3IeiBni+XTGSTKsXtSgrZAPAnw
         XslBnc4pBFu2wVtKqfGq60PbwVKBre8d1JSv47lGS+JVVCPvaq4XIUWJtjYqjxDGfich
         MuitrjftFhjptu8S+t8GFI4sOwEX+yVF6Q8pckTUUZt6ppze+vreC7G3ZwtxMcR5a00A
         +qNn/9t+eiw43tpf9SFhcV0Rf1YGONJ5gbgR9KqNhEnWCcUD203/BlWCl2tjMr7LfBhq
         SPug==
X-Forwarded-Encrypted: i=1; AJvYcCW3xucsht5ioiG3kdkV0dmDLIzRXfHWugsIx/SHzPDwNbxbZ+rS3KuyZx4wV5IGgq0wnomwP+XB2EA6@vger.kernel.org, AJvYcCXaX1x1lwXyev3DAySjCE74FY+IkzNBeRc5knmJ6Qs2AaQWt9Fcd6DexM3ItMcM3/o2VyVt1A9lFyIF3DG1@vger.kernel.org
X-Gm-Message-State: AOJu0Yys1GJErVOusJOL1P/C+YRh+qGFQkFQIh1E3ue1etUgJGRqauMj
	g0tpJ+TdHg7+TOSGjUkO5QfI6/z1te0Dei4muL1G9mTcFNmr9zy/nD9VZzqg4qdgG3UmfSFut10
	CJj1SQLfTA9TewlDtpZVlg3qrIns=
X-Gm-Gg: ASbGncvbrUDQEI+L3ivgtOSceuM2tul73nU08/m/w0DfcA1xYTnnNg9bckdnBJk/d0t
	I2E+Z3X+vAr6JsVLBaC5tagz2I4OdqKZIz/iZsKsM
X-Google-Smtp-Source: AGHT+IHGJenQer00L8FQdCDyLhA9ljuwUu/NbZxKPmPHZwEXGy2YYYib0yUljfuUi7FMmKfhxtEzdPm1wl4o71fhPWE=
X-Received: by 2002:a05:6512:4029:b0:53e:2900:89b4 with SMTP id
 2adb3069b0e04-54284820222mr11108397e87.49.1736954249510; Wed, 15 Jan 2025
 07:17:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <CAHp75Ve8d96Uw1obJVwRPyRE5E0eC8qU7uXe-UKuZeB-3XLPcA@mail.gmail.com>
 <528b6695-387e-436d-98fc-6f576636d16f@pengutronix.de> <CAHp75VfOhAmkpB_nhQE8m25p=3P2wvTfOnQFEsLR5KEktLy4vQ@mail.gmail.com>
 <43ecfb45-d96b-46e5-95e1-2ece32532e74@pengutronix.de>
In-Reply-To: <43ecfb45-d96b-46e5-95e1-2ece32532e74@pengutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 15 Jan 2025 17:16:53 +0200
X-Gm-Features: AbW1kvaECDnmeWgZSodqxxBJzlN_QPL7YCb8AhABJXAcNlpFGDGQ5vdnnE27s7o
Message-ID: <CAHp75VfZHZ7Xx1SnryBX683B=gm70SE_bvhivn+ecUePebQLdA@mail.gmail.com>
Subject: Re: [PATCH 0/4] gpio: mxc: silence warning about GPIO base being
 statically allocated
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Catalin Popescu <catalin.popescu@leica-geosystems.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 9:03=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutronix.=
de> wrote:
> On 14.01.25 20:43, Andy Shevchenko wrote:
> > On Tue, Jan 14, 2025 at 11:55=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutr=
onix.de> wrote:
> >> On 14.01.25 10:46, Andy Shevchenko wrote:
> >>> On Tue, Jan 14, 2025 at 12:19=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengu=
tronix.de> wrote:
> >>>>
> >>>> The i.MX GPIO driver has had deterministic numbering for the GPIOs
> >>>> for more than 12 years.
> >>>>
> >>>> Reverting this to dynamically numbered will break existing setups in=
 the
> >>>> worst manner possible: The build will succeed, the kernel will not p=
rint
> >>>> warnings, but users will find their devices essentially toggling GPI=
Os
> >>>> at random with the potential of permanent damage. We thus want to ke=
ep
> >>>> the numbering as-is until the SysFS API is removed and script fail
> >>>> instead of toggling GPIOs dependent on probe order.
>
> Please read my cover letter / commit messages. I do nowhere object to dep=
recation
> and removal of the sysfs interface. But I strongly disagree that a necess=
ary step
> towards that is having Linux start toggling random GPIOs after an update =
on
> platforms that behaved consistently for >10 years.
>
> Can you explain why we can't remove the hardcoded base at the same time t=
hat
> sysfs support is removed for good?

Because (if follow your logic!) it won't ever happen until all the
platforms that are using the non-dynamic bases are being removed as
well.

Otherwise this situation isn't anyhow different to the broken platform
as you described.

> >>> While I understand the issue this tends to get never fixed until the
> >>> entire support of iMX boards will be dropped.
> >>
> >> i.MX is an actively developed and widely used platform. Why should sup=
port
> >> be dropped?
> >
> > Exactly, Which means "tend to get never fixed".
>
> Imagine ReiserFS deprecation strategy involved shipping an update that
> just corrupted your existing file system and developers insisted on calli=
ng
> it a fix, as ReiserFS is going to be removed anyway.

It's not the same. If you still want to compare, then it means that
what I suggest is to move from Reiser to say XFS.

> >>> Personally I do not like
> >>> this series at all. Rather let's try to go the hard way and understan=
d
> >>> what's going on to fix the current issues.
> >>
> >> /sys/class/gpio is deprecated and when it is finally removed, this ser=
ies can
> >> be reverted again. The alternatives are either do nothing and live wit=
h 6 kernel
> >> warnings cluttering every boot or show users the finger as described i=
n
> >> the cover letter.
> >>
> >> Do you see a different path forward?
> >
> > Yes, try to write your scripts based on the libgpiod or the tools
> > provided by the project. I.o.w. follow the warning that SYSFS will be
> > removed at some point and prepare yourself for that. If some kernel
> > work needs to be done, contribute.
>
> I have been using libgpiod for many years, but have in the past used sysf=
s
> or been involved with projects using sysfs. I agree that these projects
> need to switch to the GPIO character device and that they will be eventua=
lly
> broken. Yet, I still get warnings despite doing everything correctly IMO =
and no,
> I don't want to fix a warning by doing negligent stuff like jumble GPIO n=
umbers,
> with the reason that it's going to be broken for good in the future anywa=
y.
>
> To reiterate, my issue is with the manner of breakage:
>
>   - broken, because /sys/class/gpio doesn't exist: good
>   - broken, because script executes successfully, but toggles arbitrary p=
ins: bad

I understand that, but what the series is trying to do is to put on
hold _any_ sysfs removal activity along with reducing test coverage
and motivation to fix the certain platform to work with dynamic base.

So, prepare your scripts not to toggle arbitrary numbers then and use libgp=
iod.

P.S. I think this discussion goes nowhere. Talk to the GPIO
maintainers for the matter, I'm not preventing you to put on hold GPIO
development for _this_ platform, but I'm strongly against that because
of your platform others should also be on hold, hence my NAK for that
gpiolib patch.

--=20
With Best Regards,
Andy Shevchenko

