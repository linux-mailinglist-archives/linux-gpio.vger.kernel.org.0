Return-Path: <linux-gpio+bounces-23929-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8131AB17CFA
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 08:33:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1F8556829E
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 06:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 856F51F4297;
	Fri,  1 Aug 2025 06:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGXkplkl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A079235947;
	Fri,  1 Aug 2025 06:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754030006; cv=none; b=u0MGU5EahbbRQXPulFQXLnLB+5ASeFqT3LxRUYqonLN6CMlvLU8X4FffQNf1Lq/NSCUr3bPm6KoaaKnUWERt9A3Pwa+yNHInvWxqLupdbxC54n7f5mskBFpBs4otm4qALuYjDfSqVvNg+oJzFInAOM3lLf+clW7kY+2bO7l5WZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754030006; c=relaxed/simple;
	bh=ClHaCOnt3kQBl9QG1/Rmq9rYXlC0MPYeyyIcpkkmcu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dUEk0789S7nlTHUv4S3XtJ3dja0IsecBUKUZLawDr/xbKqgd+jREX0xTzPsx35kbsmVSuQGc/X+qUxw+5f8RiSwx2hSX+fe5B8bUl1tWwECEHh3OqVc08OSwvZZizbd9HCDbv6qaAgcPrn3V/rOJt9TG7+7wklmz+Is0/8CwZjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGXkplkl; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-33245e653bbso5322751fa.1;
        Thu, 31 Jul 2025 23:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754030003; x=1754634803; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ClHaCOnt3kQBl9QG1/Rmq9rYXlC0MPYeyyIcpkkmcu8=;
        b=KGXkplklG53+8iB+tgcph5MX9coL8iLO5V2xEbD+mVrHXzGHmifHOxRoHaFLcjyDyo
         gLkB/BryorSD7YjurruWpTC5D7OUW+cb1keEBpKI6VCRvG7Nlz03boILCYvol+67XX19
         SPI9hC0AcJkWuEgWVO7TpUAK1bPzEk5zhsFM4MKlKbkFcwDOYfbHOkPL0fBI+fRd72IK
         A54MPEVm6tyMrKOghFc31ZiaNTzMgQ2ubXrfqrBSfrrf903iBNaPz5bSpyulTcDUDP9u
         UZZlFnNYINDc7zEaDo+ypNd6dalX9eymnmS5lCHOUqutYTtvbwAbblZT/J/UF3arQVpf
         l6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754030003; x=1754634803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ClHaCOnt3kQBl9QG1/Rmq9rYXlC0MPYeyyIcpkkmcu8=;
        b=cQZeyGIe2fbvqcz1FNyZxSomF/LWRoid/WP3ZiIcnjTSOqp2vPtiXXljvzSUitcz3n
         JbXTVzBdVRC/7WhWiTkvKe41bJbvFX9eh8ahl6K8lBfyU5gs7+AHtzME8hPAho0ZwMsa
         CQ+rX1XWNc6qc41vrhegI9493E05TejxYZ2yL2oNg3LtTurFpbQWvBkUIHaj4ry5kRV2
         +FyaMbL9rcsiQ0ahVBbvj1XKBpGx/pGfD+KrTdxf2Bc6es6vUpDIqwtKuRbrKbmrsTHY
         S3J+AaoXH/u9HI75TFuEePcsJmiat/jv9W2M/LkoC98L8d2hwJKMBaee5le2m7u/H2z8
         Dg/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDSJBpxpu20m8tnTVoKObR22AeOhbdv5tI9ivMY5Xg5By9qn88vJN+ncZqd4G5d8g6bNNEfyBPjlTo@vger.kernel.org, AJvYcCUrDr58XwzMvgmar4+48uOReZ1YjDDV+nJTSTI1Th7QymzUU7hk+lDdzBw1+7PrMHHMg35y/9hm3H1JaQ==@vger.kernel.org, AJvYcCVvY7IvxCEu4wFMnOTvnwobtjLu70SQlgizy7GgNRiVKcCeT77YjBYEhRY9yjo0f/rv3sfV90qSh8kXnMw=@vger.kernel.org, AJvYcCWagbhAw831NCQ4MLEvJAzLgD3QYpN9K/hkms/8r9MtkupoLxRMeIQ2+ZZ1phFRrQJdAFEKsnlFqT3knWDV@vger.kernel.org
X-Gm-Message-State: AOJu0YwwmslZyclJDe1Jcnv/xIpj3hvh8ARk8cooiwU7Aq/L7Vzent0y
	5LFAHC9RUXly0EYcJHeBIoflQZL2Np00hy1R8+m+fvFGxvYyE1H0sRn+4MRU5Lh8HB/Z0NoFRoI
	hIQKtkFuJphJK31bqVsJ9DGlYznN0cBg=
X-Gm-Gg: ASbGnctc+WB6MYtTojmNflSE2Zjpgp8AlQQTyJA2njlF+s818nP2gr+GnMnH3Y/u6Ta
	PyxxydaXfQoAAPfGA6cGcQIPeqHS8lseu2dWERHZl3U8YZKSi8C8nnAD19zlvrKo6j/sGdrVt5i
	OAfhDU7t7vyO7VLa3+CXMn2I+CD+siC0vtx1aM6l5hViG/t0OO31gDCFiAdpMPiQetGokLOnQRp
	FJ9gU6pGUULCNcAkA==
X-Google-Smtp-Source: AGHT+IFMDwwv4vMjym/9YOYF3choiIyi/iy4mgdxiu3Qz4rUCVOGPD8NjmJOnlG6xC/nlKV8DKJ0dzexc4HfazU++r8=
X-Received: by 2002:a2e:bc24:0:b0:332:490f:2608 with SMTP id
 38308e7fff4ca-332490f4a4cmr3802311fa.16.1754030002433; Thu, 31 Jul 2025
 23:33:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250608-tegra186-pinctrl-v2-0-502d41f3eedd@gmail.com>
 <20250608-tegra186-pinctrl-v2-2-502d41f3eedd@gmail.com> <yw2uglyxxx22d3lwyezy34wdniouu32zppfgwqs5omny3ge5zd@iuqo4qmi55a2>
 <CACRpkdZha_ucjWvP_NQ+z2vbD65Y3u7Q0U57NYbJ=vqQ6uPGGA@mail.gmail.com>
 <yslfabklduaybg255d3ulaxmzpghyj54zdfeqkx3oxgisxf6fo@2wecuqpvvefc>
 <CALHNRZ8jq++KVKxKP2-GwMA6CauP=cM2_wt==MRAV4mOzK2kxw@mail.gmail.com>
 <xc72g7j7png443pjxu2wpsuqofgrpxvn43emkt3rv5qrjzf7vt@qzvsiy3eakub>
 <CALHNRZ928+=85FbvfKt1c4VX7RudU7ehuOa6wwLj8JJNz+=W-A@mail.gmail.com> <CACRpkdbLzAJS=iqgOEzE9kD-fM9tx22JTDPgQeLwbTFKiStrtw@mail.gmail.com>
In-Reply-To: <CACRpkdbLzAJS=iqgOEzE9kD-fM9tx22JTDPgQeLwbTFKiStrtw@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 1 Aug 2025 01:33:10 -0500
X-Gm-Features: Ac12FXzR2XaGu2EhVaeZj5yFSNJO1kygl2aWKzwyXAzJX5xiM7g6rb4NhF1FTaA
Message-ID: <CALHNRZ_1_WeUrfqUiOTsy3cEkwm2k7nj+4hA-7xZFgoA+DZKjg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] pinctrl: tegra: Add Tegra186 pinmux driver
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 23, 2025 at 6:08=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Mon, Jul 14, 2025 at 7:45=E2=80=AFAM Aaron Kling <webgeek1234@gmail.co=
m> wrote:
>
> > I started looking at the pinmux scripts a few days ago, but updating
> > the pinmux driver import/export for the t194 style spiderwebbed out of
> > control quickly. I expected it to be hairy, but that was an
> > underestimation. Doesn't help that I'm not the most proficient at
> > python either. I'll continue the effort later, but if someone with
> > more familiarity wants to try, it might be quicker.
>
> If this means people with 186 dev boards cannot use mainline
> Linux and they would if this driver was applied, maybe we need
> to apply it anyways?

I wouldn't call t186 unusable without it. The devkits work fine
without kernel pinmuxing as the bootloader configures everything to a
reasonable default. It's only if something non-standard (for example,
an audio codec) is plugged into one of the expansion headers that
runtime configuration could be needed. However, I do agree that it
would be worthwhile to move this forward for merging. Since it is
unlikely I will get the generation script to a usable state soon. If
Thierry or one of the other tegra maintainers agrees, I can start
addressing the review comments and send a new revision.

Aaron

