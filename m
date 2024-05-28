Return-Path: <linux-gpio+bounces-6772-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFD18D257B
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 22:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CE5C1C212E2
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 20:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A01FA17839D;
	Tue, 28 May 2024 20:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gK8Rcx5R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBF210A3E;
	Tue, 28 May 2024 20:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716926920; cv=none; b=gIAnjIMVgPqCY/B7/65vCVaLubLguN9M0RGz13ffyQ2g/MaDv5m+iToULnmZbRtjxnT9gjVhha8fnz3H2v7gp8LpNDH3RqhqwLpqEWu1LmyvhR7zz8pOD4IUh+UoosobS0z4a6IGbW2Ed6NKG/mJmpo5ryY05kRV+tndeQjgdIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716926920; c=relaxed/simple;
	bh=3iCdfDLl99/CGt5OYXsgO2nuQJGe/AEnLEcBIQLsQrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iAu7iUXNvEFI+jSuYWNZFisCmndtkUwxUfktxbe6QhB6+DILzADFQ8zVf87ZtRESZCSu7QV/IbqKMG8Um/o2sSzl8bi7Gueb1FdOFWihT+yT7qjmprQMPwYrCPFSihLX1WIxXlc/gB2xpPgkGY0CI0vnuYRMPvw6DrQE7SaSe0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gK8Rcx5R; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-804e25cdd65so396564241.0;
        Tue, 28 May 2024 13:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716926918; x=1717531718; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWan09o2cS7AEXz0ZLVPwTi2FL7CeMGhj9lxWBPJhdM=;
        b=gK8Rcx5RSlKMr7Y7jvKLTn7CRt/5LKp5TYmlhDmJE5cuSzn/V0E8cBGU5xZ4tn15oa
         L0K/6jURBFQm0L5rz2Z+is7QdOemgdLZh+sexKXgSVEQn7iJMlQfFvNAzzIANcq6BB79
         aNFQExGY8ELPbEahMBJrLG3skHx+VpFcGEeZXbadrsqryWBk7F3AJ2oEwjpjeyKuOHCf
         OCnX9S9R5GHz8UhgyzgWlfFB3PBcExXZirsG6sBqFjaKTNcGOeIOMYYTORCwlz8/u7/O
         fY8c4Bp0f91Vres7dn0lFTd8CFw/dOgTbnZEnsokOFJn4S3wqw7ahCBwQh7OsM/sMQDk
         CkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716926918; x=1717531718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GWan09o2cS7AEXz0ZLVPwTi2FL7CeMGhj9lxWBPJhdM=;
        b=Bc+UjcerZYyqvHt3MgBn7q+XCleVyBO1bW2eCx+XdBU8rWTyPPp9HJalZQRk4jjl2P
         MestvGm7/kS9BIs27eWVofKIZgvKKn1AKBI/xsAiuJnelFiy3fRpgb22BJ8T4LSzzE+0
         xjMPs4CFlmkMglliB4zrMFkNd1qkIKBf7BXWcHoNJO/HO6efjCrnz9a9t/bIHdYPoZ99
         4DLodIMXCzmL1z8KAspMatEgfwPh5nEcKunZp+F2L0e/lAm9NSiOG6FU2UnDRhucwzzw
         S5gaV3flPxNqbnakZvexTw4X3S1C6oWlpjJBUU3D0SRixOOYjMz8rTW2AeAdl+iMXr2p
         lRdw==
X-Forwarded-Encrypted: i=1; AJvYcCXXWOD/8yyFqTGj/J+HOE2Mj/md6Yxu+Mt6eHTqKoISW6oST6kJAk//rQsWvg0PDB2Lb0QT8XqH2nI9YP1BJQ3evwjR+IwM8xgPioLXvCpEfhMmtS0nC123y7KdvkgcPq6K4YS4hwmCEXcdqI0Bx9yXLDgXtC1d5bZMF3peqHachFRS1Au8lr0h6b6NEEsSG1FdlLiNKKjTitVXxEwTOwJzwTF5HXWTNA==
X-Gm-Message-State: AOJu0YyH8JOYncgEjWibpEpHmv4dEoh6XgJBBa1/rHnYr67isJXTifhE
	QID5sBaMZatbn4CYupYDGQtSlTUabe7/RqlaPX8yVX2Jhsf1JVhK4WAngW2G3WQrMg0Je414Pyf
	emdVM6vfn+hTMvmfKqbjXtwyO8FM=
X-Google-Smtp-Source: AGHT+IFfJJ5HFZzJyQa9/CEYfyE8LWkzb4Q/29Ke4jwKfXtLTA98EbWRSp4pH5wT6KLVanMlHazgb/V1ONa8yBqFufU=
X-Received: by 2002:a05:6122:2015:b0:4e4:e998:bf7f with SMTP id
 71dfb90a1353d-4e4f02d5449mr13996969e0c.11.1716926917774; Tue, 28 May 2024
 13:08:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423175900.702640-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240423175900.702640-13-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXA8hnV6NTSNdYQNvuBsK5Os9CDgE64xLN3R0wAAmtJgA@mail.gmail.com>
In-Reply-To: <CAMuHMdXA8hnV6NTSNdYQNvuBsK5Os9CDgE64xLN3R0wAAmtJgA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 28 May 2024 21:07:27 +0100
Message-ID: <CA+V-a8t_6xm100n=t-u38-NAE3dOK5F6cp9Y=gZV6JcxT_+8mQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/13] pinctrl: renesas: pinctrl-rzg2l: Add support for
 custom parameters
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

On Wed, May 22, 2024 at 2:21=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, Apr 23, 2024 at 7:59=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > In preparation for passing custom params for RZ/V2H(P) SoC assign the
> > custom params that is being passed via struct rzg2l_pinctrl_data.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > RFC->v2
> > - No change
>
> Thanks for your patch!
>
> > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > @@ -262,6 +262,9 @@ struct rzg2l_pinctrl_data {
> >         const struct rzg2l_hwcfg *hwcfg;
> >         const struct rzg2l_variable_pin_cfg *variable_pin_cfg;
> >         unsigned int n_variable_pin_cfg;
> > +       unsigned int num_custom_params;
> > +       const struct pinconf_generic_params *custom_params;
> > +       const struct pin_config_item *custom_conf_items;
>
> Perhaps this should be protected by #ifdef CONFIG_DEBUG_FS, too?
>
Agreed, I'll protect custom_conf_items by #ifdef CONFIG_DEBUG_FS.

Cheers,
Prabhakar

