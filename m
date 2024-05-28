Return-Path: <linux-gpio+bounces-6771-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A28608D2566
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 22:03:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 311D01F24BFC
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 20:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C6117838E;
	Tue, 28 May 2024 20:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DVlNeqd4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9202172BDB;
	Tue, 28 May 2024 20:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716926587; cv=none; b=HM1KDmutwLJ44BYRG6wKNyqRCq9y3e4CXn4HnsowaHO3B21nGOdvjrrHuwdFyLPwKHC5OrERwhuJwcXfGGnLB2qSc+YasVcxhlJXOdwLHfl3e/WGU4VwMbET8eZBj9bt6+xlh6tpELFE4JypsgIHMn6BYa+/Lsjhe2WnYHQYHeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716926587; c=relaxed/simple;
	bh=hq6uRHm3y9M9TalehTKak0nkSHczL9psHTS4wjPnm1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fkU9NU5LsUusFtIbKznfbvbMjvmf+cG1w+ueCvxlduX5ckxBpXaLqsnH5msZyviXcPlgv4igdEd/s5wy3MGhrSzpYM6X3u0gQ0Q/wTc1Bk11QK3C9ukQlx+dczRZhIDbs7xqSGuo+LM27+hs86JSYa+z2x+Bq6kGYKmnXyosVHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DVlNeqd4; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-4e3316c0debso420265e0c.0;
        Tue, 28 May 2024 13:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716926585; x=1717531385; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSsi77YWskths0d6euwD+vNlpaxcZ5dztOfO9uvhPMw=;
        b=DVlNeqd4rllQgRgGxjln/K2lU/HCRGAuJDn8dCE33VIM+P4jKJLu2GhvL0V56faTYr
         LLXDGfi8E+x4u8JS1YlgU0ISwBqMbWPNicPuO7iD5/htiRN1fOaC6NvAjs2BUB3GhrG+
         XfXrPla49VVh5SIl+tiL1htGqOpef4n0+/ucy+6I9+mJE+OZnioWkFv1joXRzpC/7ID5
         eF6rBlnF8MdgLPpH/UcMT0EAMnx8fQ802z0AaCSHD4URU1BSFlZYdWpKJtylWuojiAeS
         79nVdwbQvvKLYgXyY0lVaDNXU30KKp/NdyunDMRheXY6UM8Nc4jz6cuNsITm5YZ+aim1
         7oRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716926585; x=1717531385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qSsi77YWskths0d6euwD+vNlpaxcZ5dztOfO9uvhPMw=;
        b=xNoQrc0lsxGxGlYjrfIt3fmgwB8ChvZjjN7K12d6JjJnCiJDCkN4byEk9YgkR7R8wH
         0L7pbozoPvSdK56La0/sSpU47OHH9J5D3V2mwQT21RNPLZGMMMt4lkXLe3bl0aPNXoGV
         YCSnXI+R9dDXFzCIUwp7iooxR5aLyzFCOnGAist71f1GDItBts45SYPRcpgzM10khYnC
         P05subwhlBlh3+r/7P/nOyn7gogXwf2XCmnEwgoalv+n25dXuRsA+McRO1WntK5EYePz
         Pq1YEeUNq318EEJ4F+/tyqhoEYjhmI7jqd4MtWNE25WnLgLcBRumGlkbwaCSPB6CmL63
         8GKg==
X-Forwarded-Encrypted: i=1; AJvYcCXqchREPF+1JGHAwt14uqdk8SDjPqyqmB8O6Cx8E3xrSQMyC+7GjkrM2k2P/qgLGJKn3p4mktaysJw6ilI5fyYTQy1KZ17ga/BXV2ZkkfRrMbQIpvHfic/eUJmib+E7nid0ni5fEqaJCSSAgQU47ub5F4c7kl4PVrDku1I3xMtFj+8HJMtdmX0SPPoXK1ZXTWl2kzRqDpWDf7Z7OOkIR96rEzmQQwjQAg==
X-Gm-Message-State: AOJu0Yw86fkUERQOwErvfJbvhnqiumk2l9oUyFgAvzwV4pouDffv05wT
	rhr+W8JvhunTIQ0B6WRu+EDL0hC/eemgGHo5R6oGGC4yECrW//FxujsE4eVhW4MHsBKhXdLPwzC
	jTlB468BsQZsK/yMnRWlRFuJHEm4=
X-Google-Smtp-Source: AGHT+IHSpS7JgZ3F7Syj4TVYDPPmkFIU/f9NUkxoYHR18ZZdZFrcScSjcjBSuBmRHMrH+vxnu5WmdvRRTvtprS2k2KQ=
X-Received: by 2002:a05:6122:3c54:b0:4d8:4a7f:c166 with SMTP id
 71dfb90a1353d-4e4f02d957dmr13450250e0c.12.1716926584584; Tue, 28 May 2024
 13:03:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423175900.702640-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240423175900.702640-11-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWS8TNVjd6UBYe1X7p=aVVFBBErh8StL1urJL7w_WYLzA@mail.gmail.com>
In-Reply-To: <CAMuHMdWS8TNVjd6UBYe1X7p=aVVFBBErh8StL1urJL7w_WYLzA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 28 May 2024 21:01:54 +0100
Message-ID: <CA+V-a8tBAZiWMXSGTjQqvKjV8AoEMNBkyn+Oa__4WU1xVww93Q@mail.gmail.com>
Subject: Re: [PATCH v2 10/13] pinctrl: renesas: pinctrl-rzg2l: Add support to
 set pulling up/down the pins
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, May 22, 2024 at 2:26=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> On Tue, Apr 23, 2024 at 7:59=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support to configure bias-disable, bias-pull-up and bias-pull-down
> > properties of the pin.
> >
> > Two new function pointers get_bias_param() and get_bias_val() are
> > introduced as the values in PUPD register differ when compared to
> > RZ/G2L family and RZ/V2H(P) SoC,
> >
> > Value | RZ/G2L        | RZ/V2H
> > ---------------------------------
> > 00b:  | Bias Disabled | Pull up/down disabled
> > 01b:  | Pull-up       | Pull up/down disabled
> > 10b:  | Pull-down     | Pull-down
> > 11b:  | Prohibited    | Pull-up
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > RFC->v2
> > - New patch
> > ---
> >  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 73 +++++++++++++++++++++++++
> >  1 file changed, 73 insertions(+)
> >
> > diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/=
renesas/pinctrl-rzg2l.c
> > index 102fa75c71d3..c144bf43522b 100644
> > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > @@ -122,6 +122,7 @@
> >  #define IOLH(off)              (0x1000 + (off) * 8)
> >  #define SR(off)                        (0x1400 + (off) * 8)
> >  #define IEN(off)               (0x1800 + (off) * 8)
> > +#define PUPD(off)              (0x1C00 + (off) * 8)
> >  #define ISEL(off)              (0x2C00 + (off) * 8)
> >  #define SD_CH(off, ch)         ((off) + (ch) * 4)
> >  #define ETH_POC(off, ch)       ((off) + (ch) * 4)
> > @@ -140,6 +141,7 @@
> >  #define IEN_MASK               0x01
> >  #define IOLH_MASK              0x03
> >  #define SR_MASK                        0x01
> > +#define PUPD_MASK              0x03
> >
> >  #define PM_INPUT               0x1
> >  #define PM_OUTPUT              0x2
> > @@ -265,6 +267,8 @@ struct rzg2l_pinctrl_data {
> >         void (*pmc_writeb)(struct rzg2l_pinctrl *pctrl, u8 val, void __=
iomem *addr);
> >         u32 (*read_oen)(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offs=
et, u8 pin);
> >         int (*write_oen)(struct rzg2l_pinctrl *pctrl, u32 caps, u32 off=
set, u8 pin, u8 oen);
> > +       int (*get_bias_param)(u8 val);
> > +       int (*get_bias_val)(enum pin_config_param param);
>
> Please use consistent naming: "pmc_writeb" uses <noun>_<verb> ordering,
> "get_bias_pararm" uses <verb>_<noun> ordering.
>
> Perhaps "hw_to_bias_param()" and "bias_param_to_hw()?"
>
Ok, I'll rename as suggested above.

Cheers,
Prabhakar

