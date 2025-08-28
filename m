Return-Path: <linux-gpio+bounces-25165-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A21EB3AC27
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 23:00:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCBD2580684
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 21:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0796F2BEC20;
	Thu, 28 Aug 2025 20:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dC1uDxHL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACD129A322
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 20:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756414796; cv=none; b=fZpkL5VWxnyE57kGqVXvMS1r/GjASIjKeH9XhdLuKdU8qkZjXZPsr+my4QVyu0U71zeEpVWDTagUeQpQtsUgTxvaH1OGQUjQuCZ2mpzKnvwcprv6KH9J3olYfKafQiTtbz3bYfqfD25Z0qUdWNxmYQAgXrxkyYw+38iauLotGMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756414796; c=relaxed/simple;
	bh=vcH+lJXlXkzbWh1s+giYmvp9r3m+hUxJ894v+cf3nQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=snpMvG2uzUGjRIaQkuVveym4lFfieK3q5CStaHziGT3DEM6bH0Mkswib3ouXsZmbC4p6Q41LI45NJZ62m5AGd9I/60x61kIyB9ErMdXXfiiYo+eSNlVbEcy2JhiH5TH63V0J5z6zFuH14gyobM0vgONqlVtxfgso0px0vzEul0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dC1uDxHL; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-336b63d2e56so1217481fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 13:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756414792; x=1757019592; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcH+lJXlXkzbWh1s+giYmvp9r3m+hUxJ894v+cf3nQo=;
        b=dC1uDxHLdzR89Uj56ebMGaoDeRvegTy02rmD4lDoUGNwIlNRsYa+MDnEwUwxYsuVya
         Y8brW/f7t8jPxSO+kvkkj5EpDjPec/e6TYHDcu5+BEGKhiYpSHNcgh4PjIPQTjSrFuGv
         29bmDkLl6eQ4isdMBsaJKvQxTXRA97n+Owzb0UaOKn2DK5J6NDKruHPhNyLdj28A6f1U
         xa7AB1eEBovGXqonRimswFIIH/UBqn7V2U2Bz07sKbRA7ciRp74+aSbBdni3PZz/n9wh
         ArMCqsNRws0dRWKWBV/F+8m8qKVhCtZunjvcaF8fk8oIzDZryq51BDa8XZkckv0/glo7
         4tVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756414792; x=1757019592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vcH+lJXlXkzbWh1s+giYmvp9r3m+hUxJ894v+cf3nQo=;
        b=KQGxsF9wcZCDdOuxH7WcTeiWVqyPagKsWZKTS6NEZCLsqzga0k0cXOFDcrXvLtXAWd
         bnd6bmRCIOWwjoeCnhltWFt8wLj1yWUVmVUB1x+Mn3fettGRs/qcciXGOJu3gmftoW/7
         /qbQzeul2RGkADPs0n1RgWoTociVQNIRiA8LuWJurQu/60YfdeiRYnUxQfRIM4W6dZZB
         UiUdTBs/E/L1p73I5voySKUh4V4MZqj4TOhEiZ2MWRCqN5719tpvbfhQcfbD+jzLMMUH
         VEoUMSHHFgpuEMwIBgqlxF3XnrcJWCCouEiyhUTEv4aZTFIrNXUPpBF+k+73WgfhTjnI
         VVIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWExKRDxZt3qtPRutPcIV+5vGWQ7ya8vgu65TAZ6wWwOxFgyOJe7ogeUDbk8hXWJYtX8ndAdMeMmkuy@vger.kernel.org
X-Gm-Message-State: AOJu0YzxXpfNEaFGq+zI2UP3Yn4gMTFZZqEKJ4PYvGBGKoxlMGSBWe24
	AMuJe+0jmeLFAowVea/epZovQh2smqXZDSj4gA1Sm0tJA7NUsHX1cW2oMiL+I+sD+7YqSarKrpe
	L3PaTGxCRszBI3RKWJ4v82LGqwF4jSvy/ustDxVuTGQ==
X-Gm-Gg: ASbGnctod7q0NMDb0B3ZrY3N4AOLlq/G39R+yasMAJgXlK04llcAqOiK1uSWXOpr5kS
	Va2npS6SUW9ISHwonPgQxlshexxoXys7B9uX0uVDUkFJCSM72uTe5TH4Yh/aHgE7vGCoi9JkuKY
	LbNbDep4Z7TUBqmyk+HRUZ7WoxblVUQyrGV1paDWULEn1q+py61OtcxfbyeREaU7QFuLXXu8BoQ
	fPLfuY=
X-Google-Smtp-Source: AGHT+IEvCK27Dx3T+NwB4QTV9UIlsAab63smCZ6D7uUks2NtQZowbM82iFbh3N6kvr8t1WPK8CdOU0xtB51L+4ds/dQ=
X-Received: by 2002:a05:651c:3256:10b0:332:3fd0:15fb with SMTP id
 38308e7fff4ca-33650ba8612mr48592831fa.0.1756414792241; Thu, 28 Aug 2025
 13:59:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net> <20250828-dt-apple-t6020-v1-9-507ba4c4b98e@jannau.net>
In-Reply-To: <20250828-dt-apple-t6020-v1-9-507ba4c4b98e@jannau.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Aug 2025 22:59:41 +0200
X-Gm-Features: Ac12FXyoYnYKNXDomZzl4EdS0dXvIhCV2tkZJGb1B6Y1kaQgUA-l_NpqH411N_c
Message-ID: <CACRpkdbg8KYcDpqDKn9fqs+rL9hLK9mGCj0PTXPBGDW7A_AZbw@mail.gmail.com>
Subject: Re: [PATCH 09/37] dt-bindings: pinctrl: apple,pinctrl: Add
 apple,t6020-pinctrl compatible
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sasha Finkelstein <fnkl.kernel@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Johannes Berg <johannes@sipsolutions.net>, 
	van Spriel <arend@broadcom.com>, Lee Jones <lee@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Michael Turquette <mturquette@baylibre.com>, 
	=?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Keith Busch <kbusch@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-bluetooth@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-nvme@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2025 at 4:02=E2=80=AFPM Janne Grunau <j@jannau.net> wrote:

> After discussion with the devicetree maintainers we agreed to not extend
> lists with the generic compatible "apple,pinctrl" anymore [1]. Use
> "apple,t8103-pinctrl" as fallback compatible as it is the SoC the driver
> and bindings were written for.
>
> The M2 Pro/Max/Ultra SoCs use the same pinctrl hardware, so just add its
> per-SoC compatible using the new base as fallback.
>
> [1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@k=
ernel.org/
>
> Signed-off-by: Janne Grunau <j@jannau.net>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

