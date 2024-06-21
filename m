Return-Path: <linux-gpio+bounces-7608-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B3D9124D4
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 14:14:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20DE7286C8C
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 12:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8A4F174ED2;
	Fri, 21 Jun 2024 12:14:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A733B495E5;
	Fri, 21 Jun 2024 12:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718972064; cv=none; b=iaol/Ts4pvuFy9QPUV46lxnpaHp7WEP0myCQpnnRnAbEc94z4OmZSY54wQBC3HhwalVd3llSqW28dgNwi+0DUeibjkO1VW0ljh8FWfMl3dXrYB5Nf2cFiDrXoxhlDTCYNI5ntXVU/DFYyU4ObKrZ8YzPBXDvO2Y45xeb5ozSA9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718972064; c=relaxed/simple;
	bh=x4vqn5Hh8k99MfrNwz41Ev55uDW6SlGUmskYi4S6Zjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hyp4O1DK7srmJf0DTa46agGHV9H7tngQgdukWd7UBGbawokClKm5fOus4LhUcgxUPkch2DmdfAoJ8ho+C180A4xGMgr7Xv6fic7iwQvfHjnZyGnxdggXNjaXwwM4mtaGe9KSLDpYjy4EOPP1CacOl8s3r24pjy82BSBfINgpaO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-62cddff7f20so18613137b3.3;
        Fri, 21 Jun 2024 05:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718972061; x=1719576861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QcWHAhSO81y854xZHbFbt4ihTOVyDirYk3vDpI2/9rM=;
        b=KnikcwJsUNc/AlVm8aCGsjvZsQakpvSL3Qy2EmkiKpXk16okHSiLTdgGsL/nTkSWCT
         CNA2TGAvTjP+/wk2QCVz/iKDwE11+N1lCJdt6A6JB2hwKkgVQo2F/FRUl1wWolug+O7F
         TZOBmT5u1HHEqVYCQZcjE42deOeoppUM9wl6bRtFmynlkARpjySF//Tj0tDMzbSpOyP/
         69LfHmKTMud7OnB8ZK6ghSyQ4/HB/khlZTu6CZbnpJ12u4T8d/bpoK3hEc5Z2X7fLp8P
         6/Qa2mJV6NtRnIS8m9LSXiwEmeAvurDEWCYBQDieV08e5USAhGvtEJwXyD2bvFzueyiM
         PpQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUYzHgtioxBX3EhlQGHZ+tp51AUjZmJ4KLGRSxMsbR8TszFYmqh7tRwYj3HXQo7SAwQKOywGDBGgkTDRGizuf6agy2ckMgn4BdqnevoywZU1F4VlraRbLl868Zoa8vFN79I+/U0gwAWxj8QswuFHPI2Mi3q7t3mDBe86mCAE0IBxrczNrDAyWLmRxn
X-Gm-Message-State: AOJu0Yy6bkaA9LQT6bPqAzNkzPD7NGO/YCRKyjpBBkTM9QICwkDorntX
	bslq0SaL6VAWpDIxZgCk0+/aDzL0hwQiBXp1jZqx2PWIZWbMwvDdyouL96Hj
X-Google-Smtp-Source: AGHT+IH/5ChzJr5RjYiCwbXy8Y6Izt3WFkC8l60TmJ0EHP4W0Haf9uDvmMpEoC7+F2CMaqfIfB52lA==
X-Received: by 2002:a81:4c49:0:b0:63b:ce8d:c7db with SMTP id 00721157ae682-63bce8dc8fdmr50485757b3.0.1718972061163;
        Fri, 21 Jun 2024 05:14:21 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63f11b0f98esm3027867b3.35.2024.06.21.05.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 05:14:20 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e026a2238d8so1997767276.0;
        Fri, 21 Jun 2024 05:14:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVFiK+RyRyNQu9r49lXygis9AhEEy7qsMqxSbaEI3IOaJ+sfCT0ojJiAAfxyDpZQ4MN5dqQD6Ih2j/mx3C+c+jEHus2kSK1peM9MNOhpatiGzRHqtqxTLSbjqD9ucW+8mT1d3V7ZDgwgQzw0+70IVlHUfWmaItIiktwASFtnR2fR+cGV+4Uw9sEW9yO
X-Received: by 2002:a25:bd5:0:b0:e02:bc1a:8ee1 with SMTP id
 3f1490d57ef6-e02be16fd4emr7657695276.29.1718972060172; Fri, 21 Jun 2024
 05:14:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618174831.415583-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240618174831.415583-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240618174831.415583-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Jun 2024 14:14:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV8jNPeRbrxAxej3FZEHzregsLpYi9e=pzCLVSpVSBm5A@mail.gmail.com>
Message-ID: <CAMuHMdV8jNPeRbrxAxej3FZEHzregsLpYi9e=pzCLVSpVSBm5A@mail.gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: renesas: rzg2l: Update PIN_CFG_MASK() macro
 to be 32-bit wide
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 7:48=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Modify the `PIN_CFG_MASK()` macro to be 32-bit wide. The current maximum
> value for `PIN_CFG_*` is `BIT(21)`, which fits within a 32-bit mask.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.11.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

