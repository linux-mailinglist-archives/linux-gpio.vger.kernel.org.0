Return-Path: <linux-gpio+bounces-14860-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C56EA13635
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2025 10:09:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4206A7A2A63
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2025 09:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E581D90A9;
	Thu, 16 Jan 2025 09:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IQ4xu/k2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158431D89F0
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jan 2025 09:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737018547; cv=none; b=HD7LlOP8sHwJwZV9cA7d38DpfV8zDNHXqIOSA50RLPWwOvL5muchCOx03peOCkENDC1hoQChhrrtsCEvvTv25GKSjtkTMG8RtMYlKA/VtCtGQ2U2WDfyeGHg42XXrolt8uqeiqkWuqKBb+4dVnBD2Z7IqSxOgWH+8IQ1GrojNr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737018547; c=relaxed/simple;
	bh=6oElNuHGnh2SndiJKSmzP3b2+Y0n7fF/o6Bw/SCWA8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ACHvZ/2cunKuRYXUpoDJeIYQtXOtAHe6CWgFwhBoJxw4Jc1dBSgE9bbCGAa9nPDOG1Atl0ZbrKf8RIb/aQOLRtc+yRDtXQe9KFLZl40e2Uyh0SUsMA+Mg6cHirvSCc51spoZWh5JDsB5TnKyMOz51k9tQRqKJxAVHOmVziCVHdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IQ4xu/k2; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30229d5b229so7193131fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jan 2025 01:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737018543; x=1737623343; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6oElNuHGnh2SndiJKSmzP3b2+Y0n7fF/o6Bw/SCWA8s=;
        b=IQ4xu/k27KRRWT8+BR952Rp6sKVE/VBK5DV2ZXczu1NXcUukvmSRhxYLL+0UXBIJ4c
         3XLFDkgeNmHYnmaZ1Y+a9giINHrU31aBwZYdr2dnFxiFW1/qGxFPCUuOm9gPYsHh4oHG
         0vzH+G0XYL84pZEwCnLOqSj66IjfcnuQlbsgN/qIvOrhWppNR7wGIUs1hexzLPxTpmyt
         3hbCRYP/n4ekMfXpEKGouRTTopOyA6dAL2JuiYN7x087ZTdBG7STUK9luWQEInOjkGUe
         hBgxFng++giL4qYxSLhDii9GH5/I3L8nHqsV4VGu8zTpo4mXnEuh6k3KbDxJ3Mg/WwBz
         L5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737018543; x=1737623343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6oElNuHGnh2SndiJKSmzP3b2+Y0n7fF/o6Bw/SCWA8s=;
        b=btsiZjybyWPajYXNdCfJYzXlD/3waoEcrsscNqleeTfyQVoyD/IpjV5Bal/KJxl39y
         c6ww2oLn/YuYQk7sU+lVKDnwKNCWGzU+9NZc7gq/aKV7uW0XBKd54K0kTOeC874Canen
         xAqK1VChmpncwkPC/mYVSQyWRg4OeB6vc3PpihaVsqa2BXB2UOWz70tPSxDMLujstI1y
         41ipqKvxAyQsDQzGAGi6Et+rzpeARBQf3zCtQp7jioLC9KKnOAYAfIUv7h6Y5FSdcyRq
         JcYPxnFpuGftujUrh4kV0AkfKgfa5S92TRZgdr8BysiUdelWTgqZmJgAEss8XohWkfJt
         j9Qg==
X-Forwarded-Encrypted: i=1; AJvYcCXttJnTeR+Onvg+OgD2RDD+x0FkA+jn3AP6cyzOcD1SR8FHonKYwwM/EImyrcPdq5csKNrg2QNFoouM@vger.kernel.org
X-Gm-Message-State: AOJu0YyxtsOKL/nY1B1oSvcqxze+68NVM5ilGwvjbzoIFM8qig1cWS1E
	HnD9AnrqUB3pauSRtUyHGHeBamJDP9CtNJxvDmsLxsIqM9peVyS6fVNEXeSIHGjJtSUceJiWJ5c
	0EEnaQv1nFw1B+doRrHBO69H5z/ptdhL0nxgICQ==
X-Gm-Gg: ASbGncsLo5zCp8yoMAmAUmRjxNt26UBvYjWybM4OcPBz2roewb34HumsGD0ivHX/qAh
	RyLx208LHyQMnQ0Q52o8vAhg1RNnbxBnQB9PR
X-Google-Smtp-Source: AGHT+IGshDnah7yTVkge7frSzXP6u6YQ9EMlI5n0k71zbBXiVfkDniOTr0RXn5mT0CNZhOwwkIPYxH+G4Ml04S4rkI8=
X-Received: by 2002:a05:651c:221a:b0:302:1e65:f2ab with SMTP id
 38308e7fff4ca-305f45dcb78mr119399301fa.20.1737018543217; Thu, 16 Jan 2025
 01:09:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110123923.270626-1-szemzo.andras@gmail.com> <20250110123923.270626-3-szemzo.andras@gmail.com>
In-Reply-To: <20250110123923.270626-3-szemzo.andras@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Jan 2025 10:08:52 +0100
X-Gm-Features: AbW1kvZEtDtDDV1b-JCy06VodlCu92OcKCF4KhRqyAArlBqTeeutEPgAkUkNoec
Message-ID: <CACRpkdZ6yNvtqjYHaWC6ynP4CdkGSdt5AH9ZrZDqYq=wTehu-g@mail.gmail.com>
Subject: Re: [PATCH 02/12] dt-bindings: pinctrl: sunxi: add compatible for V853
To: Andras Szemzo <szemzo.andras@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maxime Ripard <mripard@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 1:39=E2=80=AFPM Andras Szemzo <szemzo.andras@gmail.=
com> wrote:

> Add compatible strings for V853 family pinctrl.
>
> Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>

Patch applied because stand-alone, clear cut and reviewed.

Yours,
Linus Walleij

