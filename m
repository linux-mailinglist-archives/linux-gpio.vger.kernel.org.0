Return-Path: <linux-gpio+bounces-30443-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 943C2D119C9
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 10:50:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0682930AB4A6
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 09:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDECF34AB1D;
	Mon, 12 Jan 2026 09:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HnImlPho"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05E434B18A
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 09:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768210946; cv=none; b=F04yuXOn8t6q+yyb2JDbGPUBYAMO9IDcxHGFXMtFrW9rdKWqHl76eK+9YJcpcCT2PQD4c9YNCY6cYDw53SRkfF4+YjYY34Y1Ic5oeZQbREwM/ccVTZC+FhPzz3sfHe2Ip0u5s3fRmUEylk8eEE+3ui8rJ4+pe6stp9brkD0ewVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768210946; c=relaxed/simple;
	bh=lmEIHgZZMTtEfgTs7wp1ji1qT8knJHXi6qHATGkhWmA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TR0cjc2D9udZGa/TklQk1wsjGfGe9CjXwyQ+kYHjRv6cMIY1j6QmQvozdXKMhK/3gT9CixHT/hmVxbcNmW6i4Q/TbE1CfKQWbUDKpNdwOOFtItofI6Vq9seihL2TGdDn4XnaEkU8wpK+3a0Wp/1QcKy/NFI/htkU2ZB/9DY6fYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HnImlPho; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66F47C4AF09
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 09:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768210946;
	bh=lmEIHgZZMTtEfgTs7wp1ji1qT8knJHXi6qHATGkhWmA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=HnImlPhoaCFm2bISOyjk88a4CVqpbY3KWNbeZ3jFsnwgJPxD/5yf8LKOE38hrbibO
	 zgkMRC8nsEyxceiqeSkSyZq5vlm5EDaJ8xd9/bwLJjr9HQaZ9IcoT+smpl9lrNd32F
	 jFg+KqRdPkbD68wxqM7He0GD2Yk5LK0xoMg56h1VQAuWYTQYDHDKE4NlO7B4AlSkX5
	 hdhrthHslcOMJoMC9gnM+JIIgWOhQ5AMCElOMJ4MIHmQFmijJCKn4x993YqeWj2oPn
	 SlueuNJiYUzfsLnMOFHVMEaOQV5KfgwoqDUGqBeXL2rTdx6cm/gi3QkSqA8yL3427e
	 tjt+tDhjcQ5+Q==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-383247376a4so21497971fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 01:42:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXktjAqFIkz+9vDfv7T/M74gn7t1OTmOaM3KQy8PL+sDoWrrd/DBW9lm2pUd1sZbIsiI3R34CuLzFeA@vger.kernel.org
X-Gm-Message-State: AOJu0YyUDEpq2uh9VZSuX6ZxE3irn8+gnV9NsCGNbfAqozRJzybQkzVM
	TqYTj6TwWodCOzwM6rirQe7hdZdfcULVn+FCHDT/10bzZNWP6pfK8L7HrUhVQ410Sh/9EGlBwql
	vhn1UPfYdYBFr501gx8ewnBke0MDzLOPas6f9cQtZyw==
X-Google-Smtp-Source: AGHT+IEtDU+WBNOMzPFWFYbdDtZdfSoBBnPH4bow2OTLMBFEfML1j35lhmcFxxrqS3oiMugmPR15HNq83oUCcqNtA9M=
X-Received: by 2002:a2e:b88f:0:b0:37b:b00b:79a2 with SMTP id
 38308e7fff4ca-382ff688d40mr47968331fa.3.1768210945088; Mon, 12 Jan 2026
 01:42:25 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 12 Jan 2026 04:42:24 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 12 Jan 2026 04:42:24 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260111-apple-req-gpio-func-v1-0-6deb1b695371@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260111-apple-req-gpio-func-v1-0-6deb1b695371@kernel.org>
Date: Mon, 12 Jan 2026 04:42:24 -0500
X-Gmail-Original-Message-ID: <CAMRc=MeBdpYHAxSL89t+EajJVks5Q=NxWzuBpM4gCCtBViqJ=A@mail.gmail.com>
X-Gm-Features: AZwV_Qjtecxh9G9cjaV0tjKCB1xKJ7hY_aonWV0TTWc2GDEruWoxCMny_Vcm7M4
Message-ID: <CAMRc=MeBdpYHAxSL89t+EajJVks5Q=NxWzuBpM4gCCtBViqJ=A@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: apple: Fixup and RFC GPIO mode patch
To: Linus Walleij <linusw@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 11 Jan 2026 21:29:20 +0100, Linus Walleij <linusw@kernel.org> said:
> This fixes some uses of the "unsigned" type to "unsigned int"
> then propose to implement the .function_is_gpio() callback.
>
> The Apple pin control maintainers can comment on this: I
> am not sure that "mode 0" is GPIO on this hardware but I
> find it likely.
>
> Toggling a pin between a certain function mode and GPIO
> mode happens on any sufficiently advanced system sooner or
> later and this callback was implemented because Qualcomm
> ran into it, so let's add it to the Apple driver before
> the users turn up.
>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Linus Walleij (2):
>       pinctrl: apple: Use unsigned int instead of unsigned
>       RFC: pinctrl: apple: Implement GPIO func check callback
>
>  drivers/pinctrl/pinctrl-apple-gpio.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20260111-apple-req-gpio-func-3010ca45a118
>
> Best regards,
> --
> Linus Walleij <linusw@kernel.org>
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

