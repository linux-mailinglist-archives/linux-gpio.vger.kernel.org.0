Return-Path: <linux-gpio+bounces-9477-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A468B966C75
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Aug 2024 00:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DBB91F22AAE
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 22:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E031C2DAB;
	Fri, 30 Aug 2024 22:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gc+D61Rz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828BD1C1ACE
	for <linux-gpio@vger.kernel.org>; Fri, 30 Aug 2024 22:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725057119; cv=none; b=IviXp8ADskvcoQA0hBJqowpaJqlzbeC3DZeSpOMlmWsD5GnBH1w5nSZwXPJpaonsNip4mEpcM8ok8iSV7xQLgrq4isKEs2veLPPR+JlasOweJCtzM6T7vzFk87JxdAn31Sqi1qLX4mAGD0Zzg5KSRqqWNNXDmceMCL0gwA/x5Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725057119; c=relaxed/simple;
	bh=KFKG3Hu1nlWUnpmyKv12SHPAEdjyrNL7oAPMm5KuvUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YAYJMdIDM/T7IbKOiMf+G5SVnY8SLxKUn+n7RVGW3eiedhQFQDaKSLPnmL7p0ztv1Cu2pPEEQA4/OdQ04GQ0IwV4KCfE3S811jPNKoEUnAY55nFBeACp89P4emHJOBO5HYUbuoZR96uDDgghzF8kc3azoe6X4tdkmvw7SsoDAzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gc+D61Rz; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6c0ad8dca82so19478947b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Aug 2024 15:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725057116; x=1725661916; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFKG3Hu1nlWUnpmyKv12SHPAEdjyrNL7oAPMm5KuvUI=;
        b=Gc+D61RzNtZ5UD2WMu3a46oO1gofA35+sNAnni7LFNu8GqdGZALzc5xTz4vwpEE3xN
         jFajIqn7bK/kw2SV8A+153BFlg/Ayu9LUWFN+34uDdqMLfPdh1ifZ6jrqCx56zwjyM/u
         U4uzZ62nYxwU6H7LG8i7Wy0c5nLnijKSibQacgS7r7jXfutr85ksjFHPOM5IfofgZ6sb
         4g4M49n6OTv4o0WvuSNWqBU5ljzsnvG+OwYu6YBVjxw66Gz4qsvIV6YJd9c2kdLx8RfP
         0xMoV9+emt9bbO/cJzTtlQRVCLh8tXJO4qU9KszLaW09abGRxS7zX69CN98COuiRaT3o
         8qjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725057116; x=1725661916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KFKG3Hu1nlWUnpmyKv12SHPAEdjyrNL7oAPMm5KuvUI=;
        b=b2/0Rvze471b6E/CGmbMRzrJ71Jm56YlOzO3QFbOhiM/ss6MEgI5G6iTzayQn41DIr
         hJD+N0RcOwN6TMZO72LoevM33GAi6KhO6o3yJx8bX3SxL9XMFUeQ6JnnV57iMk/0TR+i
         yFhNk8GlAsdvT6+M6YuJ1LoGuWG24ervud0yqGV4HxXt6iNBE6Y5Q/gNpuQdnUE7xmcU
         4AgWsCH5WNQ4n96Ev1Xu9dWf2dXhNcZU5VaLuy+9hWAwzFTE1kM1nJJeGH6fjfa9XArH
         rCh96F2RXJHRXuMJeZBG+qMAmrGsxDg8S+8rXiMofBRdnfniyBOtl9UVp7VBgaKG35Df
         X4+A==
X-Forwarded-Encrypted: i=1; AJvYcCUljQr21leV7fD9CtNtlZ8jfwt0KSRJ6pB6ZdaeFh7UEzQg4/5ueDYBNxPEBs/k/TTRowaq4MYuuyfL@vger.kernel.org
X-Gm-Message-State: AOJu0YwNoOPeyT9Prev9h7JVNZZb40IDN569/rX5L9KxWs8zzmES7Msc
	VW/HMw4snazuiDAYqK2jBOfmXd56I+E+QFNRrYLMfv/r5Ab/kQKxmpeXO1gO3Ew8Jd9tFNjRQbV
	1edK3rM6+sio3gNkrHsFUAeVo+ovvsZXXLOq75g==
X-Google-Smtp-Source: AGHT+IFqP+CzrvoB2S61/4pRdTw0AxY6t4jTtKN7C5yPQXEGWe74JgnEezcm+LFW4t+C4VT7OfM7HAVzLldND7oy2+s=
X-Received: by 2002:a05:690c:4589:b0:6d4:f41d:de2f with SMTP id
 00721157ae682-6d4f42d2475mr13586507b3.39.1725057116454; Fri, 30 Aug 2024
 15:31:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org> <20240828-dt-bindings-gpio-hog-v1-1-63b83e47d804@linaro.org>
In-Reply-To: <20240828-dt-bindings-gpio-hog-v1-1-63b83e47d804@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 31 Aug 2024 00:31:44 +0200
Message-ID: <CACRpkdamSDSPmTM9eEd=QAdZPM0Mb4mjh2+mQv7cx5TRT7MBNg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: gpio: fcs,fxl6408: add missing type to
 GPIO hogs
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, Bjorn Andersson <andersson@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 11:36=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> GPIO hog nodes should define type, otherwise "dummy-hog" boolean
> properties would be allowed.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

