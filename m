Return-Path: <linux-gpio+bounces-6995-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2C98D5CA1
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 10:20:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8EC31F2B9BA
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 08:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A8776413;
	Fri, 31 May 2024 08:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DrluU7t+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8940E33993;
	Fri, 31 May 2024 08:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717143606; cv=none; b=uNoOqGJ7jT6wSsk8amjzuwlBEsuwYwDNOg2dclzCe6pfMFONmcbwtz/n+SEi0oJgqaJH4D1JkoARBCD80OjwUxkhFq6KczbyigbEgyT1MfJtO3yTwlB2v8FdDYyOQv/D34pl6jIuXidLPaTAaMo0TiMycBl10UymbA2cDAKV8Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717143606; c=relaxed/simple;
	bh=VXQ8PcecW3eeUBZGPs6f0AS25gyhiZbpcxJ39NVWeCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gyEDK595KOAF4qhNZWLuR1MpQMVLB6TCUOUxTDh2pP7xEsG9KpD9wYFbe/84R04/0hYOAdzhp2yjsLuYP4rzfIKeKCeCi1Lnr44xqRqrM2nU4rMee7EKb/wuqlQOizQu7dUIcrkm/j3+rpEvsZIGq4HbgAClPvU/v1+MFkYzJIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DrluU7t+; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a66e9eac48fso109561666b.2;
        Fri, 31 May 2024 01:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717143603; x=1717748403; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1rHDPos9NoMkAAFHgrzRHdcQt/E5yu09sQPK/y3CdI=;
        b=DrluU7t+Rdao1bRMsGnVDWoqdDteLni/C29HeTu9aD1mRWlBPm4xREX3+KvB8hEdgv
         b0mi0q8slabU7htwlvX4eyeNxodMB3RziPge6VgvkfWW9kL5YujMcOPcKcQzqR0eV3P2
         rqvDnT8pPilcGtO8lYaIqyx+uxunwukPvDAf5dTQRr/3Yvh7PSJlSSOFVAAJ2eUan/46
         RSKp3oEoPd+lFDm6zefXGGFZsvrFRejt20doP64IjmnUKcRhGbUqbGXF+QVl9BbbjzFo
         YBL0PC0FYXibBbFc16RRgwmVb9pSFgh+A9mQ9EiOrLGLhhifwmC13tGwxXR/RvU1tuPY
         tgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717143603; x=1717748403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t1rHDPos9NoMkAAFHgrzRHdcQt/E5yu09sQPK/y3CdI=;
        b=lGjfow96o67BAijyLp6+VIyWJpuI16XTOc0dgJtTuK9os88JhaBrFiNUkntkkKuH3G
         wUSdL4ySnMPyStWggtNknSB9zt+YQOlrvooXp5Zv2CAD4n9yKylc3Vzx+XnayB1280dc
         6VCnBeZs8fbsvIJCSrK0oBvy8hZ4sZfYMS1zVvipNXJg2VEUa6WX+lqRp10x9gFeJOMB
         k4cFNcsUQ9wIMJfwLOf54IDLB0+2rLg1lvpx469pGxa5+6Yhr3p4/PXutTmH2suvHy+D
         k+OlLPamrQl/0E+P/1Kqxpygh7bjwxSGEb4nMVPTDg729+eo/aaJelxN+Keg4IrQnA9N
         s5qA==
X-Forwarded-Encrypted: i=1; AJvYcCWln6nLU2Rar5TBnh0jOshB2cpxtZs/pqOxI+wv8awo2i8zRsvuYyfgKp37Gk1N2IKZpgnWDGc4WofMQ4mIhLCmCwNVwSfnwQXMSqSbMCdH972IBpLvYLJRnizkc5+kVhFaxKRjGUzDtGcQ/xMu
X-Gm-Message-State: AOJu0YxQcIl/PknZjlgk+fe8OsZ5a8UYbPGL1SukBzDQ7+JzRQUIeIeX
	ktVxy3zfG3kKvx8gjY+VgW8g/tHalXILE92AclZxxSb3+dnbJqSslAodxKbAiCUS1MJQIiy9EgX
	mfeDQEatg8S8WpCXMeqtLoOjAC6TXP5qJKZs=
X-Google-Smtp-Source: AGHT+IFzXBIeWUSH5TDhfeYEvpfdWrJ/1MzyDvt5ksDmR49GILouqyMH3LnNb6BDjFzvNmMvPX7RfYYrDX6rJU1ou8I=
X-Received: by 2002:a17:906:cf8f:b0:a66:5064:cc73 with SMTP id
 a640c23a62f3a-a6821f4e311mr87690766b.55.1717143602449; Fri, 31 May 2024
 01:20:02 -0700 (PDT)
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
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 31 May 2024 11:19:26 +0300
Message-ID: <CAHp75VdZXs-XCOZaG48dsLEVNsUKiL0rhtf56dnqJKycDMByuQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzn1: Use for_each_child_of_node_scoped()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 11:01=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
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

It makes no sense when we have no return / goto semantics from inside
of the loop. I don't know why we should do worse binary code for no
benefit.

--=20
With Best Regards,
Andy Shevchenko

