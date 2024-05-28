Return-Path: <linux-gpio+bounces-6756-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F39758D2517
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 21:46:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA590287C70
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 19:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C08E717B425;
	Tue, 28 May 2024 19:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j52iyuhl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C0017B41F;
	Tue, 28 May 2024 19:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716925429; cv=none; b=rjL2RUsGPJEKXOd8iMH7NsRjSDHUB2eUU9dfFRTLuw+T/lXPnxLSLUMxnXTxOlK9hY/G6Wbhx/vs0TkyPhtJxa1fMqMyb9CoMK+SV7rc1Ol9HQxM97ND5XoAzIOIK3fzwjqPG0s/swhQCj0j9yCfaDaQbuynRuJdsK144B4A+0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716925429; c=relaxed/simple;
	bh=69vh/gQ+ZgfdOlplaJrdILym4vbp5g1P90cF9mV78D8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uEO9QcuU5R6R3hvXxK7XoN/o/1isYcVk4vOSI3A/u/I2KBZUqihVCli83IxqlBIZBMR/aR9TBea7s5kB4MmkqDsPwfAJi8hvCFegWuJWJRyywYhxAmZ8pi57y3DPZwrxKr+XRGvk7A6YjxargJaPg0DR7OY99O8zS6wwz63RgEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j52iyuhl; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-794cbdca425so90522585a.0;
        Tue, 28 May 2024 12:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716925427; x=1717530227; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHxifj1JZPcfVHpULZTUi69Y1R/bjyM81zRepeQXQxo=;
        b=j52iyuhlp234lzpCmgpwbkpORsmGq92Cze1HTX+hhWLQTGGOdmxm0mZvj4PQwl1qny
         cDIJWWjUVMNA8AZayIKujxkUaiOBFm5sFHq+YGMs6pHEG9aqsQQ0QFfItx/djrRZtWDy
         ZLnZR7SGAxdMejbh5FXgjtFbi/27nVZvqAqHHWRIiuRuUcAGoIIGb2wnfnJDrcfbvXF7
         7mt0B/gVZfV6CHBYGGQZ1hFgcqVrp/WBvX8RbS0xCvAGXuL2asdtOAFwDFJ6wM4cWga+
         hyVnCuKge08kdxkkjnK84UG7uNKTMRdsWpnlc9MYtulgfezffYqk27bfEb0ZMHsbrbLy
         JWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716925427; x=1717530227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHxifj1JZPcfVHpULZTUi69Y1R/bjyM81zRepeQXQxo=;
        b=H4f5hjTd8c13oSkmdxjSOfqvCl6M3cvdGYfSJDx9/LDYzOv8iIKSbnsz5uC+9O+2Dn
         Tvby5CIzuq6cOC5hphmx+TXsS/NqyQJc1qapePonAv9T1CMPkZ42gJjw+S3Fdmw9RCvm
         6IMS87exMKroCmEdHObT0w0gXjppW06ef/MQWstWDoQ3BoOHjNi2CWkXdaNEfmXrub2t
         /RxnVh4CgY0c6SyTa/kHvmiKshZkHa9kcZ2MY57aT9SA2OsD+2935IW7L3XlyvLdqAt8
         qGmvBPSQh+DcobVULV0xzCcQiyR2FGV2fl89SgcsZIIAWrw7vP21ht91sgGD0AD3N1uQ
         qZ0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTmvPX4tsPeOL3Q1AGV7suderit3AvjmXc/qJBOcXw0P9ko+frJKBIYUQWdIpcUk8WaRhZOuKewbQushNc2zC/bwJkDjOEaJ9RlJlqe5T1RF4AqsV/uPQgwLReai+GiwfcdrWMV/+rF++QgL8CwtMCy0UZGaZJ549Ak8LsJhDWFaiSNwVX2mjm+7IanisW6DhlwvzDYWnCUQOAYm3W0hh1d3ILN45bhA==
X-Gm-Message-State: AOJu0YxddjaPZf5nArI4s2hV0HRBbUMXlXG+0mEMhnGR9ef5HJPiE2mM
	GMloGLEPwwMeqCsNp4jUf/N9Qgdckzm9a+f6V72026GuKAKywHC2fbVqjQ8SaCicBfOI2mT0q8t
	hIRVG6VkeL1ds6D8kbPeXyQy1lckiULTccmBksg==
X-Google-Smtp-Source: AGHT+IHqVVVkFy8aXYP+ucoJtRPT0w8VJfWzx5tV5IkJZ/CEdkfBuUF77OT+zO/LyFg3doBOwsnSx69u0jyI73Xq2+w=
X-Received: by 2002:a05:620a:57b:b0:790:f36b:5502 with SMTP id
 af79cd13be357-794ab08d8acmr1301340285a.8.1716925426883; Tue, 28 May 2024
 12:43:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423175900.702640-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240423175900.702640-9-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVBbujS5VV3VKe3dtRfZBPoMZGhXn_8g13b=F0WUj+OAg@mail.gmail.com>
In-Reply-To: <CAMuHMdVBbujS5VV3VKe3dtRfZBPoMZGhXn_8g13b=F0WUj+OAg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 28 May 2024 20:42:36 +0100
Message-ID: <CA+V-a8usJRNV7TiMQ_W-+FLdsEAfMMzy8W68HF=kK7dCN_wQug@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] pinctrl: renesas: pinctrl-rzg2l: Add function
 pointers for reading/writing OEN register
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

On Wed, May 22, 2024 at 1:44=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, Apr 23, 2024 at 7:59=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > This patch introduces function pointers, read_oen() and write_oen(), in=
 the
> > struct rzg2l_pinctrl_data to facilitate reading and writing to the PFC_=
OEN
> > register. On the RZ/V2H(P) SoC, unlocking the PWPR.REGWE_B bit before
> > writing to the PFC_OEN register is necessary, and the PFC_OEN register =
has
> > more bits compared to the RZ/G2L family. To handle these differences
> > between RZ/G2L and RZ/V2H(P) and to reuse the existing code for RZ/V2H(=
P),
> > these function pointers are introduced.
> >
> > Additionally, this patch populates these function pointers with appropr=
iate
> > data for existing SoCs.
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
> > @@ -261,6 +261,8 @@ struct rzg2l_pinctrl_data {
> >         void (*pwpr_pfc_unlock)(struct rzg2l_pinctrl *pctrl);
> >         void (*pwpr_pfc_lock)(struct rzg2l_pinctrl *pctrl);
> >         void (*pmc_writeb)(struct rzg2l_pinctrl *pctrl, u8 val, void __=
iomem *addr);
> > +       u32 (*read_oen)(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offs=
et, u8 pin);
> > +       int (*write_oen)(struct rzg2l_pinctrl *pctrl, u32 caps, u32 off=
set, u8 pin, u8 oen);
>
> Please use consistent naming: "pmc_writeb" uses <noun>_<verb> ordering,
> "read_oen" uses <verb>_<noun> ordering.
>
Ok, I'll rename them to oen_read() and oen_write().

Cheers,
Prabhakar

