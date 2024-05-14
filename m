Return-Path: <linux-gpio+bounces-6372-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E993B8C57C9
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 16:19:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6293B1F227EF
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 14:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BF46144D2C;
	Tue, 14 May 2024 14:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0olyf2r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD85A1448D7;
	Tue, 14 May 2024 14:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715696374; cv=none; b=gXAl18Boy+JXAbV4621Dca8jeAdi+uAncUAzpZf2w1BgXh4jZwV3BqMmgAPqSboi2SEumdIiuSz0+T5J1OWLo7aKztE0Y18E18bKdYHZH4RTTCwU2DLpXeVXwA6rZWaXqDqh9Z0hKysc/V7xtNvDWLdUsxm6VeEIwT1rPw6TUKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715696374; c=relaxed/simple;
	bh=r1xN7xUhEHx+dV+kiWuY93GBKrBBL7jDPFL0byrbFjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q3KJESaj/pxt+W7VMig2Qpknj0w0hxQbXWMgHsmXxNSQ78Q+zSfCWwcUrHvxb/4zM4BmXden89KntN1DknVqQrnLcoYUZjSyWdUU1HRVtlD8tNwZeYE4lFbLDtM5vLwVKCsFYjedVn5q4gCzeGBdk83+GsDWwgDLd8YrEoMKnb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0olyf2r; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a59a0e4b773so45831466b.2;
        Tue, 14 May 2024 07:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715696371; x=1716301171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AS/xWef6bfATcw3hLhDNBUVW+/DIL4IeSHNuS3Wsvdg=;
        b=P0olyf2r/Klzr+Th5s92rpIKelES5nBQdSDiqJCb843mIUTWXv3427BpcnVyBh0pz8
         ieZI0OigwpCZQOOeCqxjgZ0G0C1+nLHIMvSsheUcG2uT6nFi9j4cXWWTT7YHTlUykAed
         nKw6+Wdr/naxqLLRasnO5ENXxh+5dfoGie2Fvx8l14jalxlmnTb+WBXTeabfxQkjppry
         1qlg6g3UKVL3rFYwaQszww1s6p2R+OpADuddESN7Pdk+qOVXdmQ4g6KURGLzrP9RQgAG
         YI9ux+6MV61N1VJf6L81SyBiDd3aBR0IFcHV9udhkKrtZxUhCXbhYwamG/StUnkfXfJx
         YRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715696371; x=1716301171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AS/xWef6bfATcw3hLhDNBUVW+/DIL4IeSHNuS3Wsvdg=;
        b=gdXrAM0o7ZSUBVvH6pXsRxETPdUI2SkQMEL9eLQ1hT0yhTDhoYS+2OXOS0bywoWiMv
         DJEtUmP7UXNwxO4FVbmMURFUGspNl92tDXYaH8Ft8B/tHCWG3qCa1VGOydcgEkTUFt4C
         sjlYFO+SGVrdq7pL3FxtO7bza6cMg7KMyUc87O8BFrN0N+mzwlGKY3sx6ys/7dh3jyvg
         F2lC7rhND4u4QLTJ321HIiW4eKYKh2QU1GARPrwG0bp9sutC4EDC33qqsAETx/e1rpa1
         OwRrHvM1PmT4Nv4JS4Yxxrn9rKSyOQEE9lpHRWfgw2Yfq3l9smWg+44d/siKefjbw2bZ
         87DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuLl9idAVgPBWMB7+E5EjVtFYojbIcBcYBwjVdo5WTkVTpVMoyFhZCf6XVoINeRJuhMjHvMXMU315wg5ZVQxpP8r3hPJexVDpgqcRrlfJVK8OoS6GAhcDi9ssSy+QYT67ucG8JHYf8SB6neERMISis9hRm8uW66cQsjDYA7UuQ+XiztwnGlmaYeR2tZVvFXHjJ73803YaQT8RF4Uk6wsBwVppZ
X-Gm-Message-State: AOJu0YxbGySAuuprI5gzBSUQlyXxWUOyxiH7yKbC79tSkEWwgJB1lV1l
	PwbdkVfSX7qaS33Jtlt9meI8bYEDQz4jE7DFgMVSVhg8MsNSbd4S5bVK4LCgyi7pOyW7XvNelWP
	m5prg1mWfHveWhp4NquC5u6gvJzk=
X-Google-Smtp-Source: AGHT+IFQhotJp12K8DqMgmEGSWFR/t8jbLw3SLlqQrPU09u1dcY1cowc2ccw4W4NjSbQ2Zvi1EWeMrcYhXfcp0MQDKY=
X-Received: by 2002:a17:907:6d01:b0:a59:9f3e:b1ca with SMTP id
 a640c23a62f3a-a5a2d6657camr1011541766b.55.1715696370835; Tue, 14 May 2024
 07:19:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZjpMeVk_HiixZUEu@hovoldconsulting.com> <20240514140446.706847-1-quic_skakitap@quicinc.com>
In-Reply-To: <20240514140446.706847-1-quic_skakitap@quicinc.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 14 May 2024 17:18:54 +0300
Message-ID: <CAHp75VcfYuukpLg=F36ykddsT9SpfdGNyyvVeyw-Yvz61Lrq7g@mail.gmail.com>
Subject: Re: [PATCH 12/13] regulator: add pm8008 pmic regulator driver
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: johan@kernel.org, andersson@kernel.org, broonie@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, johan+linaro@kernel.org, 
	konrad.dybcio@linaro.org, krzk+dt@kernel.org, lee@kernel.org, 
	lgirdwood@gmail.com, linus.walleij@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, 
	swboyd@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024 at 5:05=E2=80=AFPM Satya Priya Kakitapalli
<quic_skakitap@quicinc.com> wrote:
> > On Thu, May 09, 2024 at 03:07:02PM +0300, Andy Shevchenko wrote:
> > > Wed, May 08, 2024 at 10:37:50PM +0000, Stephen Boyd kirjoitti:
> > > > Quoting Johan Hovold (2024-05-06 08:08:29)

...

> > > > > +               BUILD_BUG_ON((ARRAY_SIZE(pldo_ranges) !=3D 1) ||
> > > >
> > > > This should be an && not || right?
> > >
> > > > > +                               (ARRAY_SIZE(nldo_ranges) !=3D 1))=
;
> > >
> > > In any case BUILD_BUG_ON() is not encouraged for such cases, it would=
 be much
> > > better to have a static_assert() near to one of those arrays.
> >
> > I think the reason it is placed here is that the above line reads:
> >
> >       rdesc->n_linear_ranges =3D 1;
> >
> > and that would need to change if anyone expands the arrays.
>
> Correct. static_assert() cannot be used in the middle of code here, it ca=
n only be used at the declarations part which doesn't serve the purpose.

I didn't get this. The ARRAY_SIZE():s are defined at compile time
globally. How does this prevent from using static_assert()?

> So, BUILD_BUG_ON is the only way to go here.

I don't think so.

--=20
With Best Regards,
Andy Shevchenko

