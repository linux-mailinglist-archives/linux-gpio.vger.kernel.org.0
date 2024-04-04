Return-Path: <linux-gpio+bounces-5090-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C53898E88
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Apr 2024 21:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90F021F2601E
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Apr 2024 19:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8431131753;
	Thu,  4 Apr 2024 19:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SCMe2af4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05F913281A
	for <linux-gpio@vger.kernel.org>; Thu,  4 Apr 2024 19:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712257396; cv=none; b=ECMrT0jOoCN/u5an6JLMtd6uYrOFKq1Q7nQk2AKWE9W0hm+8bxZ/yync2Ki/LRoYANa0IcLwhUaBA0Q1lJgWT4KOXr+Ks+nDgoq6Fml3WcjgkyR+IMOyZAmwo2PRSSLNHNbwFL8ijbpNDcS09UZ8Zn34FXaH5PmnMgJQZz7yGkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712257396; c=relaxed/simple;
	bh=Up4fTzTynoabJ2E7aaGaGTB5fG3flPTeSrq8xC4kwsI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sIqCrkCo5+xyCTFGiU21fI/a65xBfcsCMInuH1MkYnt3seHg79DlTK+7y2J8oh8VZSkDK+zl0VBLCepcBIJD48ETzA1jq9/M9GPUFDCWcPIpZDhD/cYibn79mrPA94vsKqxAiQDbbhnFlF7BPyFwQnyOZzEzUjDY/8E3dTQw6Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SCMe2af4; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dcc71031680so1420881276.2
        for <linux-gpio@vger.kernel.org>; Thu, 04 Apr 2024 12:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712257394; x=1712862194; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slnGfuuzmIMf6Z733Fe9b+D2m+7gmHDi6Pd+kB2215g=;
        b=SCMe2af4MMfZ2/cl+d4PENvE2MUnmyb0OMeUNagz8xAPwXZDqzUDh+8pROvP2E1i86
         R+5FCxt/Prm2r8yQri0X8LleeeocXxgy2lDGO3MZPPweJEcnqVfQNP2W/8608tbJFD1w
         rFrdijnaBFfXo6Ij+fECQfiVfUFfF3lVapKIHBwcT4k39uKC6Azcx6k+58GkoE1PZeK3
         5tf3ZjTgpSAicDT6ZB+6omgMNVKpCyiXJn+TA9Xur3tRJca4Of55gL8DSsYPdJhRMkws
         wlZSpEvIdZgis0Go3spWC4fmc7caMjkGj9Ex+BuvhVwBaNlwzJ60B4HXFDGDuvrwl2lp
         0ulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712257394; x=1712862194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=slnGfuuzmIMf6Z733Fe9b+D2m+7gmHDi6Pd+kB2215g=;
        b=if0d5kiLPf/TVUAECfilfLk2N1qJ+2OSJ2/OBS62pRvJqvwpgMF2NDh5fNqg+yYafa
         Pj4y7I3rS/Ho6fruDcWhRCG45mdVZFqyiGkIk2iFufX4HXOGWP5+/fyFbL7K+/D6TeXL
         H69ARIHPtsNJggZKG1mI8aSnrT643vXBkii/l73n1kaWLV6woadpJeXm7BgNo8QwDprQ
         ciVrmhhJiD/vML9m1xT02E8YjShixDOjMxqGI7G3PHVeAfC0mppK9h5RBcaIt/AfgOot
         uMqfqlVMbe8iFUBM9khyAMcW1Tav+aKlt94HoHruOLyn1Cu7YfEFvsCEZdAfzEFe9+l4
         dwVw==
X-Forwarded-Encrypted: i=1; AJvYcCXOZ2XJzrTIGjwoXMC1lfhaYO1RpBjXUpo1upCN4d4f0FCNfrVo3Pyhg3lcpPx10zzlRtnfehwleD9kaLLcDU75pIY2xqizs31FGw==
X-Gm-Message-State: AOJu0Yx6g8pvuYMn7/I+D3iOJilYwcgDGp7mUjQuyEaFIj8zSjsA1aNx
	SKcAL0fVBCXDvXMjmkOMY6PRsJ9fBSXeB1mLd8AHq7+LshHT+o9My7SkWrksKjFxuI37ff+o2a+
	mqoeQjcKKRM8tEvU9zf1Ir+Ro9epoWDDa1itrkQ==
X-Google-Smtp-Source: AGHT+IFvM8rqYI1T67O8DXnXqrU7ruyZEXe824lrTAb9rX/aRN74jrOAC2QGbb9GHQwfakLVE7pncf1/FqUcHhATKUA=
X-Received: by 2002:a25:8691:0:b0:dcd:19ba:10df with SMTP id
 z17-20020a258691000000b00dcd19ba10dfmr3380010ybk.56.1712257393756; Thu, 04
 Apr 2024 12:03:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240401141031.3106216-1-peng.fan@oss.nxp.com>
 <CACRpkdZAuNXGyg2wwYcQG4oO9w7jPS6vj4Vt0=kqX5fJ+QpNmw@mail.gmail.com> <Zg7dwcFz5eD7Am2u@smile.fi.intel.com>
In-Reply-To: <Zg7dwcFz5eD7Am2u@smile.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Apr 2024 21:03:02 +0200
Message-ID: <CACRpkdYLqO1XGMiWuGhZoM5wn8T7kFOvJ9LkiUp9W6zPufiP0w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinconf-generic: check error value EOPNOTSUPP
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, brgl@bgdev.pl, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cristian.marussi@arm.com, sudeep.holla@arm.com, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 4, 2024 at 7:05=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> On Thu, Apr 04, 2024 at 01:44:50PM +0200, Linus Walleij wrote:
> > On Mon, Apr 1, 2024 at 4:02=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp=
.com> wrote:
> >
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > The SCMI error value SCMI_ERR_SUPPORT maps to linux error value
> > > '-EOPNOTSUPP', so when dump configs, need check the error value
> > > EOPNOTSUPP, otherwise there will be log "ERROR READING CONFIG SETTING=
".
> > >
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > (...)
> > >                         ret =3D pin_config_get_for_pin(pctldev, pin, =
&config);
> > >                 /* These are legal errors */
> > > -               if (ret =3D=3D -EINVAL || ret =3D=3D -ENOTSUPP)
> > > +               if (ret =3D=3D -EINVAL || ret =3D=3D -ENOTSUPP || ret=
 =3D=3D -EOPNOTSUPP)
> >
> > TBH it's a bit odd to call an in-kernel API such as pin_config_get_for_=
pin()
> > and get -EOPNOTSUPP back. But it's not like I care a lot, so patch appl=
ied.
>
> Hmm... I would like actually to get this being consistent. The documentat=
ion
> explicitly says that in-kernel APIs uses Linux error code and not POSIX o=
ne.
>
> This check opens a Pandora box.
>
> FWIW, it just like dozen or so drivers that needs to be fixed, I prefer t=
o
> have them being moved to ENOTSUPP, rather this patch.

Andy is one of the wisest men I know so I have taken out the patch.

Peng, what about fixing the problem at its source? Patch away,
we will help you if need be.

Yours,
Linus Walleij

