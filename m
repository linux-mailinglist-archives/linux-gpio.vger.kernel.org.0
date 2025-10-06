Return-Path: <linux-gpio+bounces-26811-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C11BBDA95
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 12:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A8573B87C6
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 10:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24AA11F582C;
	Mon,  6 Oct 2025 10:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DCnGb2sH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427721CF96
	for <linux-gpio@vger.kernel.org>; Mon,  6 Oct 2025 10:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759745922; cv=none; b=a/UMpAaMZmVArDirrm6eWezokuTdq55c3M/o4p9ffpPQBLoes6hY79OowLOIqgh5GZdXtFBazg32Yh3r9K+xV29SdsXe+gEAzT/v+kvOxGVUAjZho+XOUNwK19+bEeqEWSf36MZmfRDa6PXbmMsynffYpzWthCu5RXxK5YmuZVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759745922; c=relaxed/simple;
	bh=c8jgQD0fBWlSgKyeYFjHvB34q+vXTIrChfhGf3wnwrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g7Z9gYiqO3ZDnQBK4cFcxobzHOUMb3BmWWPIPBCkNDDdg96X5AAvqMUKkrVg+isCFaGL+Tz1TbnimCdheuvRWarhZ5LCTzywXbCHitNKGOLefuhcUCQP//8KtsPhuPkVg384IH7/AA4DDpQqoG94tTix6hHd0GJKaZwFufJ5TgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DCnGb2sH; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-36ba647ac9fso38273721fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Oct 2025 03:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759745919; x=1760350719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7ID9c6ife7EDvKhFFDHKe/ahl2zK6jAoYk9pzxb+kU=;
        b=DCnGb2sHxADWkASivXlgvv5x6+BHBS8BLJau7PQXL1WWVeiPJhNHYxzqwnPpIpKqtN
         gEYHhq3rDGMl0WTqcyjDZR2VEmEs0OK1PtmZVy6ikbClgvK642P6mrjp8e1qQUcJcURj
         PUWq8UPLQZplhLt5POJaKRJpOeDLHZ+0muxV4wCrUewMhiO9t0HfYn6FCewtbvgGJn9i
         UgOOuSgMo+pi7B1PH4hrWYmEHt62LQMjcdQoxH6ZadjXr+u3lJzA/5RCcmOFxFJ/bEfY
         KIWOndmBrw2zY3eYohG59hRpkpEhLedDU9RpznUL4eZ3KaPD4Y7HvugD5RR/Yo3O+FqL
         nIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759745919; x=1760350719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7ID9c6ife7EDvKhFFDHKe/ahl2zK6jAoYk9pzxb+kU=;
        b=OJ8MBL8p5yahIAuxP/4fIupy/QVZyTRJdVM50CUQg1l2TZH6OfDfOrNnFk1wzM6FOR
         qAOvVlrxTO3FQlzKRpIIB9SwY3pXTKfWLPdAcyDAuRmsagtZy9VxKRgJbvxiG7jKr9Qz
         NTiI64rnhdAzD1UzlweK27rRDwheLrcFnrvpe78OozZP8gLag27yQiLCiY5ZfR1bIzjT
         ltq8wY34zKUJwCab+M80rc71tDZhi0gDbTxvAFlPZl8NtcM+GDECu2N0QCdFk8iZ6U4r
         ddgPPyZZCHSDcBC1SOYkKIHaQOS6Y+PrrRN2q10JzmJ+SyKNtdbW0IdfmyLD3cakfaCE
         pJ0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2mIpgc97+ZHrrjM9uppbRpiBp97QXE9FFCZy2fSozqX69WwibutMOGF6Q1zDKRkNxWc7xrXF1vUa3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1nKhzrc4/XYjR3pTlAGYjrnF6uEMSIXMW+wDZH+GbmlKCcUDM
	c5f+0umQG76QuKpSWfW04C/OS59FTLKWvsYRs6JC/x9ewJkCtNOaY5WoN3MRgEyh/A+enoQ9ZFt
	pwymmyIvVj5bCGRYg5Tyt9Rrs8yP5y9U=
X-Gm-Gg: ASbGncut/N3YZcjCVypCpco77DZx75ApC8E4wEWcogJNFrGJf9CvKW2zx9WpbC0afmZ
	CIZiZ3o1hrlErtoLDUeq1bROSnAcJ1xThyNcQNjlbr8mjfTwDRXZRbNwmDgwxLKvw0ynpWJX96B
	8rpJ50jTPxuZMCfoJkNwUklTVrGBPI8tjssdKJjaeXpVYfLtjbRWNhi1aW9+/k2gK6pG/O3lxyl
	aJoUq1vu+xETd7zGQDwzpNzZs7wVq1OK9HNydZsRw==
X-Google-Smtp-Source: AGHT+IE5kaHCIQREur6bwR0bcHEnRu7SQVkT+R3gtQ45outMOheLGCbPhNJYJvMP5sZWse3tEcZGx68vveQoJHqgIRQ=
X-Received: by 2002:a05:651c:41c5:20b0:375:d8c8:fe2e with SMTP id
 38308e7fff4ca-375d8c8fe4bmr11011501fa.26.1759745919117; Mon, 06 Oct 2025
 03:18:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006074934.27180-1-bigunclemax@gmail.com> <5af22765-b428-468a-8cc4-cddc561f4a50@topic.nl>
In-Reply-To: <5af22765-b428-468a-8cc4-cddc561f4a50@topic.nl>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Mon, 6 Oct 2025 13:18:27 +0300
X-Gm-Features: AS18NWCxpXLgGFshs6THaQMHxUB8v_2QruCcnFk2Etv3mFTL-4uOqZFs6ytn27U
Message-ID: <CALHCpMj=-N5kToZ7kKbzrpeoMM=Ky+_=J=JnwDmBVRx1OPgxhg@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: mcp23s08: Reset all output latches to default
 at probe
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

=D0=BF=D0=BD, 6 =D0=BE=D0=BA=D1=82. 2025=E2=80=AF=D0=B3. =D0=B2 11:04, Mike=
 Looijmans <mike.looijmans@topic.nl>:
>
> On 06-10-2025 09:49, bigunclemax@gmail.com wrote:
> > From: "Maksim Kiselev" <bigunclemax@gmail.com>
> >
> > It appears that resetting only the direction register is not sufficient=
,
> > it's also necessary to reset the OLAT register to its default values.
> >
> > Otherwise, the following situation can occur:
> >
> > If a pin was configured as OUT=3D1 before driver probe(Ex: IODIR=3D1,IO=
LAT=3D1),
> > then after loading the MCP driver, the cache will be populated from
> > reg_defaults with IOLAT=3D0 (while the actual value in the chip is 1).
> > A subsequent setting OUT=3D0 will fail because
> > mcp_update_bits(mcp, MCP_OLAT, ...) calls regmap_update_bits(),
> > which will check that the value to be set (0) matches the cached value =
(0)
> > and thus skip writing actual value to the MCP chip.
>
> Maybe it's be better to fix the underlying issue: This driver should not =
be
> using a pre-populated regmap cache. Unless it performs a hard reset, the
> driver has no way of knowing what the initial values are, it should just =
read
> them from the chip.
>

I agree with you here, thought about it, but consider such a change
too radical :)

Okay, I'll remove the reg_defaults in the second version.

> >
> > To avoid this, the OLAT register must be explicitly reset at probe.
> >
> > Fixes: 3ede3f8b4b4b ("pinctrl: mcp23s08: Reset all pins to input at pro=
be")
> > Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> > ---
> >   drivers/pinctrl/pinctrl-mcp23s08.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinct=
rl-mcp23s08.c
> > index 78ff7930649d..23af441aa468 100644
> > --- a/drivers/pinctrl/pinctrl-mcp23s08.c
> > +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
> > @@ -622,6 +622,11 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struc=
t device *dev,
> >       if (ret < 0)
> >               return ret;
> >
> > +     /* Also reset all out latches to default values */
> > +     ret =3D mcp_write(mcp, MCP_OLAT, 0x0);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       /* verify MCP_IOCON.SEQOP =3D 0, so sequential reads work,
> >        * and MCP_IOCON.HAEN =3D 1, so we work with all chips.
> >        */
>
> Mike.
>
>
>

