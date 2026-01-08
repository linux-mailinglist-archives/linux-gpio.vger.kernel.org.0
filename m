Return-Path: <linux-gpio+bounces-30295-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C1BD056AF
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 19:14:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 35019307E6D6
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 18:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24DBF2FCBE5;
	Thu,  8 Jan 2026 18:13:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1F22F12D4
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 18:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767895984; cv=none; b=FeCOp70ChPFlkCvyRwKXtpQoB75GacLY4XyP0y4beblMh0p+Q42J6mKsmQWtG7AScwyH7EzDfrfAK/ogR9Kuf8jJNY193Z/JO9awiJTk0lbRHm6W9IIGqhyd5izocd9eAvaR6Hg04mqWBceHRvWjlpwEc4HtOr15qSEkfscVXFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767895984; c=relaxed/simple;
	bh=ULWWtQEJoU/SfzM88dlQzOYLDArnaYKiaIZDg4MWB34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UQM9JIbeGQWypysrYzmM759HN1rE/Kv7Joy6iO0PKUbKEQMgIsXsCdMzyyNIdCI4f/ent4ECl/xHe6AueFxCYdk9GKT1h5tjFqrVb0iR/0I35i9Kwfh+l0hn2SVcap+x0yPye/QU/TAmCwm0cuCQEpQQD/5SkpizBJBm4djKPtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-55b265f5122so1009831e0c.1
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 10:13:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767895981; x=1768500781;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/keVNMihgBoTxrPdM/pz+huNl0rtnHqsA4wFUiQj9DI=;
        b=GA/geab3RPai+Qq03QXV/OaOgzyqCkTdwio/XOjqocxDZTLVdYKLYbVdbPzUt3iu2t
         afGAYRxiD/u67KURqgCEbKdJ6InDFxjWiwAREI9RjvtVnCmexpZ2wnarCVysUV0YxHLf
         6EyJ7R1NC5l07t62XBSDNmV9y/SxGMy9OStfsj6RLiSOQz64L4/xV8Fb2ZWFGie1q0Fg
         xX4gJ7WT0OuMZEyzj2ZrRKbR+XGBYSBIJn46AqQl0ZDpMsrcniNY7WtO/OgtURtcsPRs
         Jq1WnNhDBY3D7pqMOYMUQBOm08EpizLjbo7gDfVDQddDSvUDQlRp8W8aI7vAKhCFgdde
         ZOTg==
X-Forwarded-Encrypted: i=1; AJvYcCVedBd/FNnzpo1jkiQ7u5GKAGoHHIhUku9cRsrA0cw3bITwFAwxHBus4qjie+LbS3AsXRyooOJonbk8@vger.kernel.org
X-Gm-Message-State: AOJu0YweDNFs2HctCtuSdwI6S+/FCO9aKGLlj+AfIZhFcwX3DhfqXO/t
	drjAJDQeXuZhr0T/Ab9uhFEQwZc5FU6avk2j7oRvYt1YdtG1eJ5cfS7XiosLOjra
X-Gm-Gg: AY/fxX5oyjVLgq2m/Iqz5BX6j/Fv+ITmAnbe0pIHEBnYrlEJxOiZZ10F+DzXeNd0Bxv
	Eduzxya7TXPVgooAlesXToPf4n5hH+j9b42eISxoxpz0RqC1+/Ft0KsbAjwyOBzzCLAeXI2QMDc
	5MV0RjJ0MK1Ugp5waBTtwxlSWCGeYOn5qSMdI22gzZZLAbLfrNC9Lxyvi9qjLHvtYiXg3hc9JcW
	Zi4Q7ANagyiLT/fKSTYbw7BSXpC95EeGw+noIx3YJvqyzE/G7qDd2bhmVbefSuexh0uaivI86AH
	ITASbnk1yhK8JS8Bz0cAm4nDdmzHierbwJ48vHbQbexHRjLi251aSUjmf+yCW2KRl6eIA6rxqxT
	jsnY1MlHp2ymrDC0xLCYCmTtamhOBkHa1th3pv4UJC4ozhVvJBl14k5oU4YsQT+Bx2kSM7RdGIV
	8cwYLOmWhTj2cwSn6JRGsyjIucQ7D8LJPuQpTcK+dzRbany7sz
X-Google-Smtp-Source: AGHT+IF5K8ZfxV10jICzyzAlnkCGlrxT9k+RkaxDHEsUjEYsPnXwZkGKcGwdZ5kl+Ba6qbetf8RXKA==
X-Received: by 2002:a05:6122:8c8a:b0:55b:113f:7e0a with SMTP id 71dfb90a1353d-56347d49780mr2113673e0c.5.1767895981366;
        Thu, 08 Jan 2026 10:13:01 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a1ea48bsm6879274e0c.3.2026.01.08.10.13.00
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 10:13:00 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5eea2b345fbso233746137.2
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 10:13:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW4scOohgyur34qq5NY765eWz2Cn+fUaSxCE58kNiR1BDmtCxJucEo7sfripZcNEWXHEfzvOU2v0bkD@vger.kernel.org
X-Received: by 2002:a05:6102:4a84:b0:5db:2b4d:f1ee with SMTP id
 ada2fe7eead31-5ecb687a389mr2478442137.17.1767895980045; Thu, 08 Jan 2026
 10:13:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251205150234.2958140-9-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251205150234.2958140-9-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 19:12:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVo6qs6p9=dKOowSgVGo3gc63uPXCam_GHU0R8v36FPkA@mail.gmail.com>
X-Gm-Features: AZwV_QjJ35ks5-paZd0vwYNtwFXY939ykUrcrtOSooQMZZrbttR_00xK2IU562c
Message-ID: <CAMuHMdVo6qs6p9=dKOowSgVGo3gc63uPXCam_GHU0R8v36FPkA@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] arm64: dts: renesas: r9a09g087m44-rzn2h-evk: add
 GPIO keys
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Dec 2025 at 16:04, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/N2H Evaluation Kit has three user buttons connected to
> GPIOs that can be used as input keys.
>
> Add support for them.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

