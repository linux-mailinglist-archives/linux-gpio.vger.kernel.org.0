Return-Path: <linux-gpio+bounces-19210-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CEDA987F3
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 12:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B303443E2A
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 10:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CB8026D4D5;
	Wed, 23 Apr 2025 10:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qVuQPSwL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657D826D4CE
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 10:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745405734; cv=none; b=NIXM//4M8atX24Vilphlrn7+H9KGFNB07KmTAquDGY+5KEq723HHj7iuZ5Uq0uO9t1BnpSbdfZtdcdqcBNzbrofvtKv6x/bHzJhRuJFbJ9I3AmGAyOAqhgwxv30r52JsbwU+myqCRZCUHPSlQX1y5MrEMywaSGMmvM/1BJORlNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745405734; c=relaxed/simple;
	bh=SKjFk3ffMxkD+dpYkzedNGkdOncbZzOJkyC9yRRgP4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZSSjTuPBim1AXHttqxJ4YvAZ22RaDBukORW5hW3m/UY3ZUOJB+WeVUz5iL0sgDJBjn/vmyez88GNbo4tT8YMm+kziPika8PMACYrp4IE70jidKcGogm1iSavASKaDu8dXVuejuJf7SlTdK/q08MYOSrxaCd0YGWG9E9apeALUs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qVuQPSwL; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5499c5d9691so7037910e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 03:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745405730; x=1746010530; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=izklXv4BZeIiwFrKYnOhuYZikqixEWPdKCdY/Q0QGIw=;
        b=qVuQPSwLwgkX3QNhRQpYTK/PvXRDY6DjmASI1/oqILesDlz7NAet+z8NQOp086efis
         brb2hSV3iZv7EOlcj/44dPta3cLI25UruAo+iQ7H6hWBLZIwMnCV1ybfDEK+qzdql1Yu
         YlzaQgZjDknt0+JaEYhQ2GpuEh+As01MJeV4p6GnBWMo6FXzwQFFgT/PcM4y3XEgnMDi
         ifYOIH/D9faqE5V7q9b/lfivnZLiH21XxybncxeRe3WylaoWLqMpkX+IbCPNYt0te80L
         QnU09eGtV268Jia/l6vQVU1IiFmIGtP2ByAmhyfYN6sQnZVo9qgx6AT/w9aKy7nvodk5
         kPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745405730; x=1746010530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=izklXv4BZeIiwFrKYnOhuYZikqixEWPdKCdY/Q0QGIw=;
        b=mJzqO0rzZGpHIYiavonF8kGQVl1aqvifxhvdtoNwqNkh2rz7MqSZeIs3LGZT25G6xM
         pBrfOpmaVQAPw2JzWuGxqNZQaFcLnO3vbNEqBUCUiBxjURdZfaq3teNbqojMdd2oLBUe
         3F7VqgSu8UGb7XJE4wa4rTltaalWzt3LRDdEMTRLcPEjbpcvF5YDBnKHlC96MWH06YkN
         RJEOSZ/JoI5Ye4IXpNM8EPeEqxmSRKF7hwy5F2iZpPwdxh8r6nI14XdbjgMJlgaKfWK2
         xhorjaWmwkDoy8oDg3Synunbz59iyVOXfQv6a5rW+oTtrW6Ci2FXKWGQqyJH44g2it3f
         3CLg==
X-Forwarded-Encrypted: i=1; AJvYcCWdntfjvRSHnT3Pbs/1wb4BpUxrfqBTQ4FRgb/N89BAIFxGYn59P0kLscJGMQl2iS3jaTun5d6RZIUB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5zQ+5UTWNQW6kznkOMxpI7ASHhuzrVjPLzenCJEzUEkfxIjwb
	RkuChwXkd0WKh3egryAJt+k/VIURDnn16c+CJxMMtqbZL0wCjmKLW01dqlbDaZfVU1LeYypPhud
	Z2EfOYE6ZeNaDFcPdbuZUR6PuulKB9EQSlz0XSg==
X-Gm-Gg: ASbGnctPfF0j2Hl4l7GqIUvx0lxXlbvlQOzXH1XTNHXQ8lgHyb5LJsWcdUvkQjr9oZ/
	r52gwHKroZMOcTsOOPun+6Aa8ZtX6uj5DtuCdf9rM1awOVgUca0o4DznvlMBGYF31wyFX5qLkZ7
	yT2G+c4Om4G4dQLgeSLA3jfA==
X-Google-Smtp-Source: AGHT+IH+wCC5kClOVa4KPQf9TkYFzC5VIZsHRFGsDXyoHjryg0sqITG6UMuWyQQrZUY+WCXhYGb106JflCU2vKSyjt8=
X-Received: by 2002:a05:6512:2315:b0:54a:cbfb:b62e with SMTP id
 2adb3069b0e04-54d6e657553mr6996509e87.35.1745405730442; Wed, 23 Apr 2025
 03:55:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422162250.436169-1-uwu@icenowy.me> <20250422162250.436169-2-uwu@icenowy.me>
 <CACRpkdbGwPyQgVL18iMvUTAvh4XTjo6g3mGT4e_b2aNAjr2obg@mail.gmail.com> <B4C8B369-E345-4133-A106-7C5E71513329@icenowy.me>
In-Reply-To: <B4C8B369-E345-4133-A106-7C5E71513329@icenowy.me>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 12:55:19 +0200
X-Gm-Features: ATxdqUFXqKFRF-URPzhUFDAqkzV6vbnyL8yKyfMNTaK_xdGbJBDYNfkObBbEMA0
Message-ID: <CACRpkdYgkDpC1iJ-KaZj2GZ3A3_V=3-KQef_nCRhMDrUK=FHXg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: pinctrl: jh7110-sys: add force inputs
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 11:41=E2=80=AFAM Icenowy Zheng <uwu@icenowy.me> wro=
te:
> =E4=BA=8E 2025=E5=B9=B44=E6=9C=8823=E6=97=A5 GMT+08:00 17:09:42=EF=BC=8CL=
inus Walleij <linus.walleij@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
> >Hi Icenowy,
> >
> >thanks for your patch!
> >
> >On Tue, Apr 22, 2025 at 6:23=E2=80=AFPM Icenowy Zheng <uwu@icenowy.me> w=
rote:
> >
> >> +  starfive,force-low-inputs:
> >> +    description:
> >> +      The list of input signals forced to be low inside the SoC itsel=
f.
> >> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >
> >I don't see why you need this hack.
>
> Unfortunately these properties are not for pins, but internal signals tha=
t isn't
> bound to external pins.

We don't really care if pins are external or not, we are an operating syste=
m
not a philosophy department ;)

You calculate the offset and shift like this and write into a base+offset:

+                       offset =3D 4 * (pin / 4);
+                       shift  =3D 8 * (pin % 4);
+
+                       val =3D readl_relaxed(sfp->base +
+                                           info->gpi_reg_base + offset);

Compare to jh7110_pin_dbg_show():

               unsigned int offset =3D 4 * (pin / 4);
                unsigned int shift  =3D 8 * (pin % 4);
                u32 dout =3D readl_relaxed(sfp->base +
info->dout_reg_base + offset);
                u32 doen =3D readl_relaxed(sfp->base +
info->doen_reg_base + offset);

So clearly the entities that you affect are in the same numberspace,
and that is all we care about. They are not enumerated in any way
orthogonal to any other pins AFAICT.

Both pin control and GPIO handle chip-internal lines that are not
routed outside sometimes, that's fine. Just deal with them as any other
"pins".

Yours,
Linus Walleij

