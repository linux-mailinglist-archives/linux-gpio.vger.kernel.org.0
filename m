Return-Path: <linux-gpio+bounces-16988-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F3FA4D526
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 08:45:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A52841899BCA
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 07:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB9D1FE46F;
	Tue,  4 Mar 2025 07:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="keokISX1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDA41F9ED2
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 07:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741074017; cv=none; b=q8p8rHyai8wyhjQ35AXNQ/n+20XADTdefEQ4wurb+hQnqy3MCVK0Ngay33V1Pc0HlHxG4O4ds9DeT7R8hRnnIsuPmR3pgwVv4lDaq6Al6itbctH+NoYYC+QFVoh8iXey/TCPP2K4bj13eoVOfLZIBsWTpDiaUUfc2Vi41MPBq4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741074017; c=relaxed/simple;
	bh=3T+luX8w3tRQBHenZr4Mib8LyLSph+Ibdvl/8KKqw98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jtomjAttfYM+fke9oZR1IaFHQNUKb4tniv9j+V05oxh/fBPw6MNE3+NcxCBkeW0uPF7WbL/WxnPmrdgEZFWRBD6Td5lOkg5YlI8WLrKQ6B+LDH5yZT9IuoYarOwl2BsP8ANOP5S5Hyz4WmrehN6/91lBCZ9uFy33Yel2v2evM0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=keokISX1; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30bbbd0ea7eso17287941fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 23:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741074012; x=1741678812; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYa7EfywJTw6o3MYMu3IjFEnE/ok1aP+gt2n/HM5KmA=;
        b=keokISX1Zuf4x8H8C2osLFVu7Dn/xGzX3xfWoRPvcN9QNkYmnLsiUHA3/HZ5aOwHTf
         MwgXiFzFwwp+qDAeRahjBUuqtQVkNd5/9UgT7ahlGZahd7+UvF2hT7kQk/zQRg19TX0v
         IgTEpNcMkwEUIH4BaJANb/lQGN5AtRDeUo+35dP2IP7WpMFBXpqWiD3C05LF4vMFDZgc
         ktPohCl3kl9sjbTO08V0p8CIrl3rUJLYmBs0DGuWpmMwqqIBZPAXlrkmUVvBqYB25nhN
         0AJAmDlD6g2/tYkrWMVs32zeMpXEMtjeDES8NwiH3tziDcQvMMnwCoYsbHiIBsjTxpLe
         9WDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741074012; x=1741678812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYa7EfywJTw6o3MYMu3IjFEnE/ok1aP+gt2n/HM5KmA=;
        b=IUVxjQ7MyOOgD/q92+xQEGt6DSEZduI6olXXJBuXWjX4QBp9+FxXGUgdGnLDwX4wc+
         0Z8fGlithFh3n/iJNSv15w6/q982hNqu8QcPHv/mRZhrCtfrTDBrxAykcEXdtDMw3D0U
         lRyAVuPMUqUhSPEx8TFwTfyNs/7MBegkNmiil58KqyW3qWSbd1uU5r6Cj3wJl3D+jyOU
         Anx3jBEztuJRVNsPVED4An46eJdntQ2lseqgGwfB3Mv06aD4LHeg+y++qpqYoV26rE2z
         Aj0GFCmcOKslmZpZqeJwcH3u5UQxJqeHl7WunRwmIjwf1q8zMA3OXJwdTl2RS1xUXJ4t
         4+Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUqG5/wI96jiuk2hKokMOiAYUZFm4n8sPFiidm9f/Y21I2AZJcmFDbbSwLCWY3Qwxkb80NgBDAZsJ6y@vger.kernel.org
X-Gm-Message-State: AOJu0YyaTYbzdHFPIDzncyI4D3eiQlowOaZ8xVhu8H+EdgHRxiZA4lJ2
	ysEKgHDdAti6Qr5NXA68/Fc7bsgG6M8DnOyHKWPXiWHtzZ9qLFaKJn+p+KBPXtxj7P4onqV3niE
	EfV0qA6vpJOl7A8h1v7TbtT4Fijt3YEUUBLrJvA==
X-Gm-Gg: ASbGnctrD9uxvtRLqNwH2g1ufrz0TvHLTfzEOjoLvoP0ke1qqVxDwnQeyb28KSvFuSz
	FbRD1bFRLYPsJAIeU7iWXQODBjm17o5zpLrJSCfAxbZ/VQe6nKGnb7jq3CGCx/piIx3LvTSjueA
	RMLqCe5jDwsB/iF2UzcP0oGXstIA==
X-Google-Smtp-Source: AGHT+IHXJH8RsSh9MugAj23AQppoEi7+HBO8uvCiCpR+EoTX8kmz1M4QPFhcf3U1tuxSzojD8Ca99DcRZmVr3olmu1M=
X-Received: by 2002:a2e:a716:0:b0:309:2267:32d0 with SMTP id
 38308e7fff4ca-30b932443e5mr44153791fa.21.1741074012067; Mon, 03 Mar 2025
 23:40:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250302-04-gpio-irq-threecell-v2-0-34f13ad37ea4@gentoo.org> <20250302-04-gpio-irq-threecell-v2-2-34f13ad37ea4@gentoo.org>
In-Reply-To: <20250302-04-gpio-irq-threecell-v2-2-34f13ad37ea4@gentoo.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Mar 2025 08:40:01 +0100
X-Gm-Features: AQ5f1JpaPsAGaJQpCY5h6TnkBJvDhbXUxtDbGepWe3FtwHACW1AT0pWNBP_lsZY
Message-ID: <CACRpkday=ZgxovKB03PCweh_rGzaJjSJ3ezC_UzPacQPPNJ6KA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpiolib: support parsing gpio three-cell
 interrupts scheme
To: Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, Alex Elder <elder@riscstar.com>, 
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 2, 2025 at 12:16=E2=80=AFAM Yixun Lan <dlan@gentoo.org> wrote:

> gpio irq which using three-cell scheme should always call
> instance_match() function to find the correct irqdomain.
>
> The select() function will be called with !DOMAIN_BUS_ANY,
> so for specific gpio irq driver, it need to set bus token
> explicitly, something like:
>   irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

I read up on the bus token code and it seems to do the right thing!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

