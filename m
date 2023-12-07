Return-Path: <linux-gpio+bounces-1092-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82530808506
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Dec 2023 10:56:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E6ED283D66
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Dec 2023 09:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525423527B;
	Thu,  7 Dec 2023 09:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h5msvbpt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9E89FA
	for <linux-gpio@vger.kernel.org>; Thu,  7 Dec 2023 01:56:40 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5cece20f006so5011357b3.3
        for <linux-gpio@vger.kernel.org>; Thu, 07 Dec 2023 01:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701943000; x=1702547800; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJnq125j0YdWG47h8sgeSrpDhVFiAnTytxHlskk2EhY=;
        b=h5msvbptgCQw59PMItu4yKSNeB4votNJq7/JDvy69ZqNTpHpJTQHD7l8RKotTO+ML6
         lDus2hDTgya5dA7ZbfrEqeqVGRjlisWxJo5SLae4w65DyZxi/nROl49SKZHBIFQ1GSoD
         dOJTi/cIWKqvkcdNrvPh2WIgs0VehNfmYvtynPDAs5w1sWTOrnJJ9FFzpBxlC28PgKas
         6d6FvnW0UxYojjB4KxCvHUStWrrOsZS9vCVWU7Nzq/rp2KFYU+Z7MKt9d/cpngqcbCKi
         nQw6O3GDqUSv2ma1NZYUuH1FG9PfqUYHfim8+KkuNL9JVa18WmS54uRZE4Sjxv6SoN9l
         yvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701943000; x=1702547800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJnq125j0YdWG47h8sgeSrpDhVFiAnTytxHlskk2EhY=;
        b=pbGwvciee61qT1ROsKQPacnMXOcQISrd/zwSFHA/M0TOxyQyIs69S0UU9/eKh1uD1u
         khkxsBorCV3B6r+Y/7zsyJt6NVtpChrZK0lDG4VqVES1b0w4tY3XLlYTfvdUmAkxL4tp
         NiTK5qRtoGGI9vzrgn2Px0/5jBp0iBepEPUJqdxgVGRKv0CMMnBYg7nwFfyhloAxgOmi
         xdaVPJyngtEUUM3o3Vtc5zR4wa7XQCfBwnqFS75lCJgr03ykiz+0+L5z4XxJW3U7VNM8
         GOjLGqyAroP0/aYV0x3wC13Cp/l0FAa03aWVQQ/ct6jOkQdjLTkRAhmLbNTeLEK9BB5a
         wRcQ==
X-Gm-Message-State: AOJu0Yydf3Vi9vkZRQe6AcM8z7i+aqoes57fdi+ALEAU1spCVbaUxtvS
	r5xsFhEaBAzUOvaoVt8K2yUPlPDtkBb8okYdvsViFg==
X-Google-Smtp-Source: AGHT+IFmG5Eix/w4QK05D8maIWu4NoSnt+3uvdJ7TmBB3MpQnzAeGZpXme98S/yULZnvsP6j+GPexkcwj6QKWJI6sGg=
X-Received: by 2002:a25:190a:0:b0:da3:76d3:e4fb with SMTP id
 10-20020a25190a000000b00da376d3e4fbmr1627701ybz.26.1701942999893; Thu, 07 Dec
 2023 01:56:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231204203357.2897008-1-ben.wolsieffer@hefring.com> <20231204203357.2897008-3-ben.wolsieffer@hefring.com>
In-Reply-To: <20231204203357.2897008-3-ben.wolsieffer@hefring.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Dec 2023 10:56:50 +0100
Message-ID: <CACRpkdZKjcE5yMF0=E+4BRTEmrShSqFzCcyH8Rug7u7kOotUQQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: stm32: fix GPIO level interrupts
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 9:35=E2=80=AFPM Ben Wolsieffer
<ben.wolsieffer@hefring.com> wrote:

> The STM32 doesn't support GPIO level interrupts in hardware, so the
> driver tries to emulate them using edge interrupts, by retriggering the
> interrupt if necessary based on the pin state after the handler
> finishes.
>
> Currently, this functionality does not work because the irqchip uses
> handle_edge_irq(), which doesn't run the irq_eoi() or irq_unmask()
> callbacks after handling the interrupt. This patch fixes this by using
> handle_level_irq() for level interrupts, which causes irq_unmask() to be
> called to retrigger the interrupt.
>
> Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Marc Z can apply all the patches to the irq tree once he's happy
with the solution.

Yours,
Linus Walleij

