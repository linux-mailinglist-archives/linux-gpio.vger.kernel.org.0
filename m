Return-Path: <linux-gpio+bounces-17092-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A28A4F866
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 09:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C441F16F190
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 08:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30BF1EE03D;
	Wed,  5 Mar 2025 08:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EC7+0PnX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F5615D5C4
	for <linux-gpio@vger.kernel.org>; Wed,  5 Mar 2025 08:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741161860; cv=none; b=puKP9yRd4sSilLg7S0N7PezFQuF2IMKrYszDqZG/2O0yew+jgPOURw4D/L76OgkCdwMUi0FUZb24q3djj8yxjZ5O2+7jCS58UnEhnf9MUVoLDz0lqNyCWGxeJ4onvi7QwECY1dnPf831TVUOa23kLzIl7pnvHyQiznW9sM6cE3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741161860; c=relaxed/simple;
	bh=nwxBqhBj63GsgjlQZRz1t/wShEjjjKEbXH9bVs9ZDNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HMKasEsGeVjOfvDXk/d8mRTIsMFoI3RnGbs5QqW+snj8Q7zenjDTmxGNCmhuwIyRLdhFPxBi/4J8PwIJleJPphf4noO4bfxJ3yoNicZWqWef+Df5TftWVvvwNWcxwFTX9EQUxwHO3dGq62QhImVAg6dacO/eLmZQyPTjW422NPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EC7+0PnX; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30762598511so69677281fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 05 Mar 2025 00:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741161857; x=1741766657; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9335U4BYdb3Rpl+HkVOVk0Hdu7mYIBHGPUHbDc6Yk8=;
        b=EC7+0PnXzkUJzFFo8rHdkcegXuMIif5C8ccumaI/ZsukbDiEyvIIBJ4UHFSlVm0JfV
         914bxKFr8/WHM/Q44vyKeoQqhOGD+phFsRAdytc7GI7M8P7iinJSmlwTvrBiN3+ysYX0
         8xEKaGl7ngsjZJ08HdLXRa2Ik1c+d+aRNiFZ6eNb2dY3xswhSZiHlSbj1+x4p3osPxZl
         AiD1Mb6YCnXAWO8VRebbnH0o5IzuJr5HzHI6kXIiAIRrKzunYt9FlZk7WwtCG50gTR8g
         ymb9MMTPgBLNWIk0fj8OU44a+LnPrGKLGACVtfZBmXqif+THOCQp2jO+wA2u5m4ANmgh
         9b5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741161857; x=1741766657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9335U4BYdb3Rpl+HkVOVk0Hdu7mYIBHGPUHbDc6Yk8=;
        b=haUrX48XVL+E4vYF3XdiKEZi1VG1Df0K+pSQqe1xKY+0xYD6s5e4GSg/OaRVT3O7jy
         8yFndmZdFrQEMiQ30QxzUgTHQJ1k3ZmnmaQpTDA7TVMmUdgw9Ze/wSQ/4M0E7Q7cKQAZ
         L/yYZ5fgrSBEoslvlF7Ol5rcUNMtsm3KS2zwTnbacJhNx/0Uyi8b7I69sNehgAvHUmMF
         /c26CN6i33JyqoTADvXRpWzb76GtHyoIdzYimHB2PdXC+iVjGygmaRxVPSq107yMeAaq
         1oay+eUtW+0R5kxFDmgfS1yn4WkDamE+/YihkRSgWQrYC7o5p7GceleSMirPo3tNfD5d
         0wXA==
X-Forwarded-Encrypted: i=1; AJvYcCXCkzWOyfKM8255fJLiPMTDdOOydjLu6uFPuWkLXofKsTkHvrQfdoaBs+KB66SqBO7X24q4b4TjpLFV@vger.kernel.org
X-Gm-Message-State: AOJu0YyAB6E0SxhruwjLaFjbVpnjrcKzDvF0yvxIPP4qjb8i4AKaIGPM
	qpjNfx70RZLrD9aTGgTO+A5TLGvKE68i4W5004ZnHY2rXVarmREfQvaKUoPgSZOnx+xzSefCgQv
	hgm3xETcmNMTCcpPmxmGCV4g9+YwEYFiZKXMVqw==
X-Gm-Gg: ASbGncu7dRlNr50FOMeC911g+4Ab4TI73t1uXxeS0Ih4ucbh7DykkNip4PjJwdPvV1f
	zM9dX1r6TSFtgs650RyWtKum2qTfabei9GL7bPxofg94DGfqFvY24itH4CXjN0aoHKTeJBWtXNS
	jGOP+JQcIVwjIhDcEFUdXyqK2ecw==
X-Google-Smtp-Source: AGHT+IHxONNXRxXY/9SA/ScuPloLBavDa3lTwDH5EUDUvtRMl6Gewl1QIgssFE88vQwX5zwh5iaHK2NYlKSskUdQiJc=
X-Received: by 2002:a05:651c:2128:b0:30b:bba5:abfc with SMTP id
 38308e7fff4ca-30bd7a427d0mr8296691fa.9.1741161856549; Wed, 05 Mar 2025
 00:04:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303-bcm21664-pinctrl-v3-0-5f8b80e4ab51@gmail.com>
In-Reply-To: <20250303-bcm21664-pinctrl-v3-0-5f8b80e4ab51@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 5 Mar 2025 09:04:05 +0100
X-Gm-Features: AQ5f1Jr_36wy4P6iO_K8_dKn2UUlLFsUGnWdDx_V_chS6C1Pbzndlez70ok7ggU
Message-ID: <CACRpkdYTsym-YqV8CQh7up57q_R2ZGSnsCD8FiYSpQnS5CaFig@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] pinctrl: bcm281xx: Add support for BCM21664 pinmux
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Stanislav Jakubek <stano.jakubek@gmail.com>, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 9:54=E2=80=AFPM Artur Weber <aweber.kernel@gmail.com=
> wrote:

> BCM21664 is another chip from the Kona line of Broadcom SoCs, and
> its pinmux shares a lot of similarities with the BCM281xx pinmux.
>
> Add support for the BCM21664 pinmux controller to the BCM281xx driver.
>
> This also enables pinmux support for the BCM23550, which has an
> identical pinmux config to the BCM21664 (hence they can share a
> single compatible, brcm,bcm21664-pinctrl).
>
> While we're at it - fix a bug that affected higher registers in the
> BCM281XX driver and replace bare "unsigned" with "unsigned int" to
> comply with checkpatch requirements.
>
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
(...)
> Artur Weber (6):
>       dt-bindings: pinctrl: Add bindings for BCM21664 pin controller
>       pinctrl: bcm281xx: Use "unsigned int" instead of bare "unsigned"
>       pinctrl: bcm281xx: Provide pinctrl device info as OF platform data
>       pinctrl: bcm281xx: Add support for BCM21664 pinmux

Bindings are ACKed and not much other feedback so:

I applied these 4 patches, I had to rebase the one dependent on the
fix a bit and then Torvalds can fix that up in the merge window.

>       ARM: dts: bcm2166x-common: Add pinctrl node
>       ARM: dts: bcm2166x: Add bcm2166x-pinctrl DTSI

Please funnel these two through the SoC tree!

Yours,
Linus Walleij

