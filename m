Return-Path: <linux-gpio+bounces-6556-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF228CBF2A
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 12:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0915E1F23189
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 10:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95D0F81ADB;
	Wed, 22 May 2024 10:21:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAD9405CC;
	Wed, 22 May 2024 10:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716373304; cv=none; b=Tl4GFy7aSbFSifk5VBWuhlJYYPE+uuVzJZjI82h9AVTp31gizHIf6UJ8kg5rUyq6dDKswCc9KpNNwq+CKbtoLIAZQfkGuul8wa9wxQEvJXb8TlqOUU2f6lZe2SeVVEp6V5yVHCUmQPynCGijyC0Vvo5yCdgrY3YKPfbUoZIS9kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716373304; c=relaxed/simple;
	bh=DBq4Ox5uFTydSGsLfDtl08A7861OqqBL4+Cp+/Y78Uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T9CDUYmGi9xCnSpDOq9HIKMDE68Kv4awu3MYdwSglTaI311tgNFefpIi0e9cK7eJ4TDVjmQzQ6KJl+N8+zy+sSI/ZfQq0M3VPHTPz+kiGL3hA9Nx2Pzuwg0TfcaMm+O5waA7RFWq/bOMa73KhIbxiFyFZhqnnt7UG/0rsjqWt3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6202ad4cae3so46612247b3.2;
        Wed, 22 May 2024 03:21:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716373301; x=1716978101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E48NPUNSq5hL9+7t26ygo54Sg5ZDiYQpkMoK+iQmpmM=;
        b=tUpdQRSaPNgbLax8eWkGPoFTqwyB2pAOHLDH+YJD3Yz4B++pMxeSBD9MbSGFqZizT/
         RJUp5UGQlWjV1mMjTjdEmZWqLJ92UKWMAut0ZK42gzJMvo1dLtJ6nlTEgyoNlokPX+ui
         pvoDo787rizaOoIXVqeBM7I5nUZlM6rLpfnkJIMqgnmwo68vM31ZhR9VRU3P1fdHVsKL
         2PiBjArZw2aFIGrpbeBJGh/Hj30960I27wipCVB6HZxdWtsvOmY9Nh7mCQYFOj13n0Cd
         rwzQ6/Q544gSNfXe2zRZjWaYZ3Mv6UjbE8f2uKfxC/tvV8SaHziJzVSdlH8TnHDTejBL
         zg5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXghN0MCqoamIV6jX9L8UrL6m6cJIa4b7VMH57RKkX52XMT2AbuBcHjt10rxgzqKDxqylDEt0AQYnf0p19ujnYPOPYMrk9mdaDHDhReP8KKZ83PA8nBNh1X+EpYbgLrsmhnKpGDIg8dh2iiRqXD6aj5+FmdPFImTQjjkj1MeCtI/va+VEYHMPFrCrEkkhiXUaNeGuvbs96TtUDrERuRWgjwcO91LgU6WA==
X-Gm-Message-State: AOJu0YzOdZEJJAiSIGZ3Ow0EEszLx/06e6W6dRWETSG8YRW+JkaS+NmD
	NG1yrXdfHJJ5JpKhBxTiyx9JmRzNTqGMaLmdvs/y5zNTfxBkNC6ftJP/pO6Z
X-Google-Smtp-Source: AGHT+IHQfBBEfU9fj6NgNw0bCryWelzDSTlqri1D1yPMhuRNvaGejRvqvBNgj5RLm/9CdRZEtt8VPA==
X-Received: by 2002:a81:5203:0:b0:620:4018:7c67 with SMTP id 00721157ae682-627e472aed5mr15675607b3.27.1716373300313;
        Wed, 22 May 2024 03:21:40 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e2347easm57092247b3.2.2024.05.22.03.21.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 03:21:39 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-627ea4e0becso3247217b3.0;
        Wed, 22 May 2024 03:21:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWiYT/plF/SzT5QXQh2GCozZAR2kOfIy/m/p5qMD96yzGuGhS9whFQyBPEN3j4dtFQENerTEcKlOngkrdurrUenG3qUdQ+2gCZq9r2ScnxIYQT3g6LYBouVflOdal6WoN62x/X6Rp78OtQmQ4LsXH6kFuSSBwtwqtxrcIpUvgnRrBzIP6pOKDNjqXwK1RN3A+uW90wvcXiwF/RzWX/HSyXkkze1xKnpkg==
X-Received: by 2002:a25:b287:0:b0:de5:5a6f:a52a with SMTP id
 3f1490d57ef6-df4e0c1649emr1808983276.26.1716373299671; Wed, 22 May 2024
 03:21:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423175900.702640-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240423175900.702640-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240423175900.702640-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 May 2024 12:21:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWh+y++uKue6EMGmjLN+=3nhGpVAbmMFqywpCMctXe6Ww@mail.gmail.com>
Message-ID: <CAMuHMdWh+y++uKue6EMGmjLN+=3nhGpVAbmMFqywpCMctXe6Ww@mail.gmail.com>
Subject: Re: [PATCH v2 04/13] pinctrl: renesas: pinctrl-rzg2l: Allow parsing
 of variable configuration for all architectures
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 7:59=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable parsing of variable configuration for all architectures. This patc=
h
> is in preparation for adding support for the RZ/V2H SoC, which utilizes t=
he
> ARM64 architecture and features port pins with variable configuration.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> RFC->v2
> - No change

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

