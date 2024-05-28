Return-Path: <linux-gpio+bounces-6753-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BDB8D24B3
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 21:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50451281E9A
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 19:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32CC7176FB3;
	Tue, 28 May 2024 19:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j2LAsPaS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD16172BDB;
	Tue, 28 May 2024 19:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716924902; cv=none; b=OfOmtgjiPuyBQVl4ztRb4AjdnvzVsKpCfYXtXO89W444xyfbp7Cg4+jVCB6cnPdX8/mrpHGEgbVsVkz8GV1nUHW1tRbxk2oJ3ykObRMhYEI78fYzL3UUOdUP9pP3IojSJpoIn5+I8vY3to6lqqmqbZLwAcyxD4hyK484KaDiAjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716924902; c=relaxed/simple;
	bh=a4uznpruD3HcWpD/E1ppFvqI/FqLUVpI+8khoWDXyQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mzjpvPsvx8x+vPI2hbVNWCvmpKLq0rNf2dpmUbza4cBtHRP7xI2L+ZExcO925EBJseE+AHI3q+A1r5lwYhhPxvr0ZbCMJS36UQ9O1qwOl80kuoP5yn1Z8y2tDxq3rxEzLaR4Any+gflHm1XJi2ONFmZW60SIgMw3XQ7mFDNpIvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j2LAsPaS; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-43fdbe0f072so4157911cf.3;
        Tue, 28 May 2024 12:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716924899; x=1717529699; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KdtDEp3SXeyF+Tbij3Ph4M5b7pZ5MX93mXDPrVvI40E=;
        b=j2LAsPaSoITuGFsJayIoezCYw23iYLE2Fjd/gTt10rnV+rEULLBWTLwuHNzjY1nfq1
         hqAUAXpS8RA2QDrs0hN6M8MWCSGkBoqwLELyef1JUxE+fzy7QVMEuw659bdhJTRFxXBY
         khMd1/C4FJnJKYfWtWV9CMy7R6h+b31weNYxQDSm0jlL1/z636bQAIwFAQQyNSB8lrys
         XRJLhObUSqTE2HyNeKlnA3sMAwyKWflDvLxps7pCqULDcZTTr1x28b5GWzfpDIK5jSp1
         1jOOzSgwVS3+kbyijmFfPY3CXhh+sR+XVlfIDTtxJGAE86wwOvqRSxq5qKVQCb3Hztif
         3O4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716924899; x=1717529699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KdtDEp3SXeyF+Tbij3Ph4M5b7pZ5MX93mXDPrVvI40E=;
        b=YwWlQqsee3Zl1WKIxoK4eZmIPIEMFbGpp6+Ml1ySUXxee9zMTl9V6fl+oXflCF1BVV
         jisiWuwBPb7/0CTa/GFPzk5L3xl3e9/62eyyDV7HzDzfyzfNhXDobv38hkYlDmtbTQKo
         sxjOW6U/TVpmC5XPRpfrcwLe7ZF4IJcAf9ECTa4jx58GmOWDEGoGgxnkUqAbAprEPeXd
         R4cebS1SxJWAsyupZ7aFxPMVSDYTwRkkeXp+rPPqLcDkIztIR+kEBe/oBZZNcNyhhNme
         3HEwR0/BDyR31KdMkUfBdbf9wKE/qNJrj7GzYLro0QScfULk5H1DIdjSGiIfsvwYsTc6
         Nrzg==
X-Forwarded-Encrypted: i=1; AJvYcCVn7cQ/Cctu382WVP5Enq3TMQwhIx8qY8frrvkONTPN+YBr4z0BTz5Y8hMtbC96HcBI8KRZRZnQGLPlSNTL2iPzPZHsu2kWhgTJI2k6rldB/iueHWSoxiQOHcsqt9ZMc0r+h0TYCrai/iq3jmEDAvjma8PdCNVaaqF9oazdPq85x7lvMCG5On3SarXZRCdVHZdjuCWkhmrPwJWYG0CwUGpO78JhSlzcHA==
X-Gm-Message-State: AOJu0YyIbPywoj0W/BvufAJxqPyHSWVIM31aBJq2jzEtsXWJ4xVJdAmF
	FeX21UoLtIF6hU/y6PIg2xLQlt+k5OBU0JnIhH/fN2L6XljFr6Xtv+F6or7fAUiDx8vh4HAZAUu
	K979MOIf2CSc4h8YkgX6SmfV7nc4=
X-Google-Smtp-Source: AGHT+IFtO90IJsqrOIlOd9fK4e9h+xVk02J0iqzPfqhBlTatBJhC8UB8BJvdxbtfnLSxzZQhBclaFa69Zym0aNOg/Ec=
X-Received: by 2002:a05:622a:1991:b0:43d:dc3c:3c5e with SMTP id
 d75a77b69052e-43fb0e512b0mr165482981cf.1.1716924899362; Tue, 28 May 2024
 12:34:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423175900.702640-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240423175900.702640-8-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWh5dD_dT6+SvxycgfX6OHw0m4Lu+QoRE33HgG_-AyYaQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWh5dD_dT6+SvxycgfX6OHw0m4Lu+QoRE33HgG_-AyYaQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 28 May 2024 20:33:48 +0100
Message-ID: <CA+V-a8vV3ASyaLrzKK0XsLZseZECQhMbCy=APQqN+831AQGFrw@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] pinctrl: renesas: pinctrl-rzg2l: Add function
 pointer for writing to PMC register
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

On Wed, May 22, 2024 at 1:39=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, Apr 23, 2024 at 7:59=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > This patch introduces a function pointer, pmc_writeb(), in the
> > struct rzg2l_pinctrl_data to facilitate writing to the PMC register. On
> > the RZ/V2H(P) SoC, unlocking the PWPR.REGWE_A bit before writing to PMC
> > registers is required, whereas this is not the case for the existing
> > RZ/G2L family. This addition enables the reuse of existing code for
> > RZ/V2H(P). Additionally, this patch populates this function pointer wit=
h
> > appropriate data for existing SoCs.
> >
> > Note that this functionality is only handled in rzg2l_gpio_request(), a=
s
> > PMC unlock/lock during PFC setup will be taken care of in the
> > pwpr_pfc_unlock/pwpr_pfc_lock.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > RFC->v2
> > - No change
>
> Thanks for the update!
>
> > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > @@ -463,6 +464,11 @@ static const struct rzg2l_variable_pin_cfg r9a07g0=
43f_variable_pin_cfg[] =3D {
> >  };
> >  #endif
> >
> > +static void rzg2l_pmc_writeb(struct rzg2l_pinctrl *pctrl, u8 val, void=
 __iomem *addr)
>
> Please pass the register offset instead of the virtual register address.
> You do have pctrl->base here, and rzv2h_pmc_writeb() will need to use
> pctrl->base for all other register writes anyway.
>
Agreed,  I will pass the register offset (u16 offset) instead of
virtual address.

Cheers,
Prabhakar

