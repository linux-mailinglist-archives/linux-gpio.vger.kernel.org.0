Return-Path: <linux-gpio+bounces-15762-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 718DAA31083
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 17:01:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC6883A955C
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 16:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D39DD2566CA;
	Tue, 11 Feb 2025 16:00:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A457B1FAC54;
	Tue, 11 Feb 2025 16:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739289620; cv=none; b=KMQVOcNB1CAz8Eo/t4zMbjfKJ0CEvh1Ne1Nt/sOgCl7dPDrT4KYql1OuI2tuUud1d2PVLFVAwgwN6rdkQnoSpgCYGQ/t3Xdg0S68VbwOvIdLdfE5UVE2OmdvmpwVZycdmbzhbLvi4+DUlv7GOSBu+BHzUGV8a4cHVSUvi2C/OCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739289620; c=relaxed/simple;
	bh=cjJM2KE2o46qVeKknzL+BNQNtpT26yoh3cOtsNK7xN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H0ilqhH4LrOdOHlHFQUfFAiODNpGQjyehA8EtHGonRlfNSIYYsDAM3z8S1VpV8OOolMzJsYugv7KwiR9y8+jdUYXWr72+Yz1ntozDnpUItRA2MXcsMtVHy/IdZt+QUNUBHZM3bKyTnGS6Qdq5Al7TNRnT2RVAuRLQW/j1j8WqHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4bbbab48111so943521137.0;
        Tue, 11 Feb 2025 08:00:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739289615; x=1739894415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=65Ob+9ribC+B3TH+jhgdsBGAdasRb7AfHL590YYnv/k=;
        b=wThdw4LUiTPtgEBo0HlDnCSmsKXbHttijEmknJbZXXfUvNosyHbSoot/rvcwt5OirF
         uhxR0sRKs9jzCEVnME1sTcQdaq3S3PNaTRN7aiQ80P782M8cCYvdT08D5x3s/c2WrIcr
         BkChrSmOeS3mUBm+aVNA8xM4MQ76lilalzIGzGpCgwJU00rnpNIMhpmkX6yyMCiZ8Efd
         NEYbtAEoCgAOBU33STEkLK4ExLm0brmEIuEFpc4fF+O2XHIp/9TTTGtT1itjQEhdiq3e
         BKWNa4qnE/dEn0lZ2k2SROeUl9tspPegxDjAlineSNp6bACSuxUuPj+6ZtAMUE0UHKe+
         w0wg==
X-Forwarded-Encrypted: i=1; AJvYcCUjmZUwYHB1y1gfOIfjIt/UJEIS+pAFJkwGJMPNFPPLfICHox136LSQ7MBxhglGFQpDELiCQLIY5IL5iKJW@vger.kernel.org, AJvYcCX2+tDLYMQTel1rEWwOLPUO3ob/x12yU7YajI+w/3wbr2d46yiR6TW0pzCypALuSgruw2OTZvlSw0P8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Jw2HIzaVFVtb3UMBzxipQhwXeRFzLMgpd084nECnwaYZPT5+
	xi7rdKhNdPt634c2oNiVoOuY1BB4mAr/IqFJfaFBTCBDFlmckIrYSTlQlFGxS8c=
X-Gm-Gg: ASbGncvbhOotDmo75YA9ctfFw27hEiH2AmI2DFGDAzeGtuR6ybQuToVvbKCzFfo8a9x
	ZcUh0xFqAVFw0/DsZ8BrwoCY8b33I9bIEpbMRT/GsRo3IzCpg81YtegidTK7zxKc1Owte4M0UZ7
	ROs2l2EoWHKTM4GXpnrLKlHmmYLGyRIDAsY0dIR8zlXUFVbWGMjT2OwJxPPaVvPRn0JUS6CQZRk
	AJe0igur1xMw5fPxu1+qjewXufqdJ8ylS4VkT+naiVU9m+ETB+OJvkW8HU2pFWBgO1cj1mkX9Pv
	mKYKL+ST9CQA9ItRd1WsfdfTfMcVL+3qmCNg/U6SStOWIDDsak58lg==
X-Google-Smtp-Source: AGHT+IG9R7bSKjdmS1s6aYWZhIkHF+21nO7Ap/2R34ECqkZdXRFEBP+3r57yO84XDc+/59RKebrHCA==
X-Received: by 2002:a05:6102:1624:b0:4ba:9abf:800f with SMTP id ada2fe7eead31-4bbf212de8bmr21376137.6.1739289615079;
        Tue, 11 Feb 2025 08:00:15 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866f9805757sm2016320241.34.2025.02.11.08.00.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 08:00:14 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4ba7ab22192so1798187137.3;
        Tue, 11 Feb 2025 08:00:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU1BXMlM7xvQfhCwPSHZxheMFWJ8tZOevuGmpqov1lt4iOOr/JS2G3H/Sq0Rc3ZsMWRzxLZN1hEv8B83vGn@vger.kernel.org, AJvYcCWspqtjtHSYnXgTaYH1tycW2WFKLPQihBL++CSg+FMZBg3dQXRsXXGxuQUmvoeeAZyuax5Sbu/MxreS@vger.kernel.org
X-Received: by 2002:a05:6102:41ac:b0:4b2:9eeb:518f with SMTP id
 ada2fe7eead31-4bbf2189436mr11231137.10.1739289614043; Tue, 11 Feb 2025
 08:00:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129155525.663780-1-koichiro.den@canonical.com>
 <CAMRc=Mdim2aSBs+JsL8dECfG0Vvrvcq6CHaGHbBoVhNhSZn9Kg@mail.gmail.com>
 <2kz6mz6nglozgrwudkgziles4wievwfkkl2oo7qyvosirchjuw@y3wfna5dsekv>
 <CAMRc=Mc3qBXaATpYRAXeHne0+mBjErivjvUe4rBEj2ksansatQ@mail.gmail.com> <CAMRc=Mc5WWNErJfEQ4sFRQm_+vDRMa7KBKSPSnP3W8scu4G19A@mail.gmail.com>
In-Reply-To: <CAMRc=Mc5WWNErJfEQ4sFRQm_+vDRMa7KBKSPSnP3W8scu4G19A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Feb 2025 17:00:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV=Nn40OgnHnDx3Cy0XsVRVwWzdopYj=XKTdefkHGQxGA@mail.gmail.com>
X-Gm-Features: AWEUYZkV35CAB6JDjgYqZ9qoV_70B0OlTiuopUalVujnG1oCI-3_-nClXEY0tKU
Message-ID: <CAMuHMdV=Nn40OgnHnDx3Cy0XsVRVwWzdopYj=XKTdefkHGQxGA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] Introduce configfs-based interface for gpio-aggregator
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Koichiro Den <koichiro.den@canonical.com>, linux-gpio@vger.kernel.org, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 30 Jan 2025 at 21:48, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Thu, Jan 30, 2025 at 7:40=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> > While at it: there's no reason to impose a
> > naming convention of lineX, lineY etc., the names don't matter for the
> > aggregator setup (unlike gpio-sim where they indicate the offset of
> > the line they concern).
>
> Scratch that part. There's a good reason for that - the ordering of
> lines within the aggregator. I'm just not sure whether we should
> impose a strict naming where - for an aggregator of 3 lines total - we
> expect there to exist groups named line0, line1 and line2 or if we
> should be more lenient and possibly sort whatever names the user
> provides alphabetically?

My first idea was "Hey, just sort them alphabetically, and use
the names as gpio-line-names". But that means they have to be
globally unique, so line<Y> is indeed better.

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

