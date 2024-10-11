Return-Path: <linux-gpio+bounces-11189-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 279E899A550
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 15:45:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C30941F23C29
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 13:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D65F1218D98;
	Fri, 11 Oct 2024 13:45:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FD8215F78;
	Fri, 11 Oct 2024 13:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728654309; cv=none; b=FFmmk8AV3fwy4rlXrNdG4+XzRH4wvM3kl4H/2cQLvtWNBbUg7ucoL+LaMEoQNpRHR6JwjubgWniLXe2/zYE2DLsYWs7f4MXvWwvOdghZc6MMUPXwylRVM1oTmyhmjRtjFR13Z0TeQXEMJYQmnPhRyrYsNZKEup7zxvtA4p0BOR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728654309; c=relaxed/simple;
	bh=XRloh0YdR1F+oj3RMXyKeTDAWB5+0WV7BckTR8Fyyu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OEiTSmZy6OaV/0m0DjqyTcCDKT+5nk3TWlRNnI3CyHC0WuK6+JYc6SBhAdUQtJopcuBWCXX9b4EQmjdNtinugVGe/BvP1V4YoO1jNXBcthC1Vupz2VNK8hJ+xRU4BAwCag7xeB7DccwHrrY1r3n4eQRZGl1+SdAi4ZdLJ4ozao4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e232e260c2so18808657b3.0;
        Fri, 11 Oct 2024 06:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728654306; x=1729259106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9rv2uTZbpfulvFnPEK/huLdd2uWYJjM+4u6GaXf6VM=;
        b=q7rHhDqpTaO3j0srmBTGj3JOhiRxFFdy91NFarPQ6fIcFwlw/Ay4cYP4aWzqDL3v2t
         4mQsTkgksoFTNDkcU8PcnuVrWMZzSwQXen5cWZt9v1DIhZtTqOYzY3uE1Q2HDNhnGWnu
         yhyB1LEIYzofLOIVGe5GdNXxpZ57hYl+ROQn9jg/+kT4TsnErOontpU810+tLOhipz8o
         5YP9OIahsMVGIgbePWg7u4bjwVxhlYgrUD6yN4ZMGH8O/jFFT20EtMxz9f8w17E2+XLE
         ZkTpLuupk80ohSEVhxW1B/T47L9sVckCPehmjGC9Ys8L0DF4vixvLUC+9ArvWSr8Y7Ui
         YvHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUElxWNZoRwkOJN0tFcuMdAy0yRryKnHC1ion6sPufPZWF8FV5QaZA76djd2BqMU90U6s3PHbB3kMB2WL/V@vger.kernel.org, AJvYcCUV32W2pUXMb8o5xl821S3Tmu18WkaXAfxz34l3oke+S7OM0brTgm8PbAuZfp0w5LUNCy0yg5G2P1lI9m3MPRR+bbc=@vger.kernel.org, AJvYcCVURXsfGu13r/T4BpM3uRCZsfMDd2bdnpa0hpzpmacKlCs3hjjoUePh7SjWsVl7g/vfAMwjaiScQEoU@vger.kernel.org
X-Gm-Message-State: AOJu0YyLaY18t/A3078B/5t8H+K6cH8WEOftwyJGB8Z4smpePMG5H1Rq
	ITR/I5kFXhHVDHMGhqFcVP3PQ/AXY2Zm4ITc7tsfcjp0h40aNHA2dxSvNi86eA8=
X-Google-Smtp-Source: AGHT+IGqxYgkRoYxhP4532KDTMxeJ7UDYZz42JasWqC89x3vKvt3gnKfbG+BQ03Gb0+2eFkmnaVVhQ==
X-Received: by 2002:a05:690c:7:b0:6e3:3227:ec64 with SMTP id 00721157ae682-6e347c4e532mr19004477b3.35.1728654306004;
        Fri, 11 Oct 2024 06:45:06 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e332b89c71sm6018757b3.44.2024.10.11.06.45.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 06:45:05 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e31413a196so17939507b3.3;
        Fri, 11 Oct 2024 06:45:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2xl0A77EI6g5sxeqvUIX6i0xoR6gTFRIxNo61sTLwJmnnDW+BGpXu4EOZiT1Kurrlr0HT6uIkbZJz@vger.kernel.org, AJvYcCUV5NzDnSU9/VACnJtLMOLMB+LWAMQ0vlcM2MCc1+BE1b/BC/ILP65uvjCOmyRMOF4AZzuAHTQq4+AfAqxT@vger.kernel.org, AJvYcCWDpUDnETTVjcbygOqQHVJS+RaS4gH4vW8A1/MKC2Nxkr4xrjjEzXkq66Q/NlIwvwT5wnvkj51+utdjl+UkDHPAzAE=@vger.kernel.org
X-Received: by 2002:a05:690c:4e01:b0:6e3:39ed:f029 with SMTP id
 00721157ae682-6e347c84073mr13905837b3.44.1728654305204; Fri, 11 Oct 2024
 06:45:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010132726.702658-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241010132726.702658-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Oct 2024 15:44:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXGG0+J_SP4=bs_Q1PTfWCq4DuefiuQpoVRRF+hD0RW0w@mail.gmail.com>
Message-ID: <CAMuHMdXGG0+J_SP4=bs_Q1PTfWCq4DuefiuQpoVRRF+hD0RW0w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: Select PINCTRL_RZG2L for RZ/V2H(P) SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 3:27=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add explicit selection of the PINCTRL_RZG2L config option for the
> RZ/V2H(P) (R9A09G057) SoC, ensuring pin control driver is enabled
> for this SoC.
>
> Fixes: 9bd95ac86e70 ("pinctrl: renesas: rzg2l: Add support for RZ/V2H SoC=
")
> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.13.

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

