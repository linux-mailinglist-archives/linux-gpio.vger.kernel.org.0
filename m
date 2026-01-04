Return-Path: <linux-gpio+bounces-30102-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A3CCF0D9A
	for <lists+linux-gpio@lfdr.de>; Sun, 04 Jan 2026 12:48:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72ED1300794B
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Jan 2026 11:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD17928851C;
	Sun,  4 Jan 2026 11:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jQMmL8a/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9402882AA
	for <linux-gpio@vger.kernel.org>; Sun,  4 Jan 2026 11:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767527298; cv=none; b=P565IhMQMJDIeSvMypxoqNyMd4yhdq0/YCSKoIs1Kc3IfLoygKdxhYsuWT5wcEGxf82BS3SObuhCNfuJ8oUpRbGeWARxdaxLjx5fibf3AX62tPa1qX/2usCwST37HsuqV8bmKsYlI8MZ1BpGox6P8nuGshr/LljPvEWmsqjydfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767527298; c=relaxed/simple;
	bh=I0lPw9M6IVwRkDiioixB1o0oDbNxBQ4cmgrqp3BqxJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GwQvY5JHuqYLPVcEmv1TdS6hEVfpK5F1EQg0/6/Ulgya4jflr9QcN+M6HjWaKV+65EjU5Rkm+yvQGLry3VJ+IwlmJMd1p/+dTJ/goVMPVxrV58UiupY8VXGuGSnf6G8M5t8nB8ZnE3VKPgY6Vw6Xgxo8SdvHPGZrCP82wuhuI5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jQMmL8a/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1895EC116C6
	for <linux-gpio@vger.kernel.org>; Sun,  4 Jan 2026 11:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767527298;
	bh=I0lPw9M6IVwRkDiioixB1o0oDbNxBQ4cmgrqp3BqxJ0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jQMmL8a/TRlzhOs3evUcHXe905Z9a28a6X18YAHZF9r3DD/mnrfIFD8qKqhPUNYTT
	 0Nav0leuhuqYS7bHfb3208hnTQnL+HEajK0ZHXWYpOglDFQfWcCseHFK5kjvsR7WsD
	 C0HFTkFfYAS/Y0BIsdejVzyTSGSh2XLE9EojZtTHb1fHXXYqhciu9xMmZufPATdaJa
	 szBBtuPrbe60dOVl3Wfe3aAcuiSosr4W8/LBBEnhdvlbOtPY0O3UDHxNJskqxPYOMW
	 cw4V22Ic56VV6ovMOvaSjRUBzbICFzx4inhoh9wrrlgW7CBKtAm/CkAjouRvCdetdS
	 8dzQPOU6TIY1A==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-78f89501423so10891467b3.1
        for <linux-gpio@vger.kernel.org>; Sun, 04 Jan 2026 03:48:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUtUIsKMTIIcbkXxLiZoYhhLLXPxNqW/6H07xzCOPELsx3ACzvKa1OBeHnsIy0KVfAa/u5MrYwafmM6@vger.kernel.org
X-Gm-Message-State: AOJu0YxZHswnTThfFxC2Q7IovF7mPRCyL/znOlz4By6+lsiaGPnVJnoe
	sCvsuohlYaUiz9IDjsGK2ZnLz9rSuw0m7YY42y1mFHOsjpqA9nLYKrqWlrX0aMjcsj+cLPM1+hq
	OHcijPicwm4XQSBFLdFp2DOot8TSSx4A=
X-Google-Smtp-Source: AGHT+IEH4Sm8WJaFK+x+RlCyRzWOrDqAadQrajL3EXv2yzCn2zhpj2YARFH+oUXmFDV1NIRkB+W/xitiP829rCgCnRg=
X-Received: by 2002:a05:690e:4189:b0:645:559f:d7dd with SMTP id
 956f58d0204a3-646e3398ac1mr3243278d50.14.1767527296406; Sun, 04 Jan 2026
 03:48:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251227114957.3287944-1-ye.zhang@rock-chips.com> <20251227114957.3287944-6-ye.zhang@rock-chips.com>
In-Reply-To: <20251227114957.3287944-6-ye.zhang@rock-chips.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 4 Jan 2026 12:48:04 +0100
X-Gmail-Original-Message-ID: <CAD++jL=fri43Q1XbMJoOUeoWJw9RwMDJLjcjO8zSbyHb7z+Dzg@mail.gmail.com>
X-Gm-Features: AQt7F2oTWlXUXjidoWo77Ak7o32fHRY2YlKW0oxaqrPEmcpXVDJKxEyAH8MVM9k
Message-ID: <CAD++jL=fri43Q1XbMJoOUeoWJw9RwMDJLjcjO8zSbyHb7z+Dzg@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] dt-bindings: pinctrl: rockchip: Add rk3506 rmio support
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tao.huang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 27, 2025 at 12:55=E2=80=AFPM Ye Zhang <ye.zhang@rock-chips.com>=
 wrote:

> +      rockchip,rmio-pins:
> +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +        minItems: 1
> +        items:
> +          items:
> +            - minimum: 0
> +              description: RMIO ID (Controller index)
> +            - minimum: 0
> +              description: Pin index within the RMIO controller
> +            - minimum: 0
> +              description: Function Mux ID
> +        description:
> +          Configuration for the Rockchip Matrix I/O (RMIO) block. The fo=
rmat
> +          is <rmio_id pin_id function_id>. This acts as a secondary muxi=
ng
> +          layer when the primary 'rockchip,pins' mux is set to the RMIO
> +          function.

I think this should just use the standard pinmux =3D <>; property
with some shifting and masking.

Yours,
Linus Walleij

