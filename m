Return-Path: <linux-gpio+bounces-21252-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A0AAD3D48
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 17:34:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13B211BA2E10
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 15:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B850242D7C;
	Tue, 10 Jun 2025 15:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oEmtT1/U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0262623A9AE;
	Tue, 10 Jun 2025 15:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749569075; cv=none; b=Ba0htS5Ed5c9wT8zJkbFNmuBNcln567z2/HurBkIecY6uoqRDAr8r7su1bhK2gSIq0ID3lKyHzOUtCDDhzaxd4MF1wZ35SsUvFV+dH88aGqM6GZ3Bfrps24ZQ/qEt8dcgTpPh5DA0/9p77U9SRBrol4rwdiSPvqRHl/VfTfMbw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749569075; c=relaxed/simple;
	bh=9EzG50zmklwqkLtNYDsMxJRJq9OzH8/9w1jVUWFTeec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fDd49s5iRH7fzLy/qXC0lqNTdE5HPPtRgISip9MnJTp8ZxEnPKUrYpWTWhkBEtVlSeP8voy3r/NUGGNNRAjiHgCERtYGga87V1JN7CliYNKnXiFdNheVOKSAS+BI4qQdELbr+oESILB9AHkon7Y3QuOC37G6Kh0r579OIvAnRLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oEmtT1/U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B471C4CEED;
	Tue, 10 Jun 2025 15:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749569074;
	bh=9EzG50zmklwqkLtNYDsMxJRJq9OzH8/9w1jVUWFTeec=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oEmtT1/UAyqoeKTCGCTiyB6HA7bai3cyL0Nn/hBCDcizAbWkEiRYf1ujzdNUkP/A0
	 CRP7luS3i4k6sedzpFkq/VgbUaDf63c59qcSuqd/G6lZxrtrRxWv5zwrkzflMbR7dc
	 cfC0vs6PmURonti47/5FNasrmQMhi9FyB8T8Q296+Fwjy9YrkdZZUwHuN8IfdX7GBP
	 7wuBAcTSH1nZrkiN4D1X6ufMKyiwT47yYokDHNF85zxxbbJbZEjjSuBJH39TQTyLc/
	 I4Y/HwMw0+tqnDFg1Cjd1zTYpX2qrwmAWrowI9aqhHbRzsl+BS/PUYAIVnnPtpvMWx
	 uwfS405/Uqh4Q==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-606b58241c9so9166816a12.3;
        Tue, 10 Jun 2025 08:24:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWDUXlDQk/gns7rjRJa3iCk0SComsojzxPen84nYJLmHkqIReK4GgF0FuTClCJ49vlzZsOlYE1CINjl@vger.kernel.org, AJvYcCXgJn9QhDboIZPjhhRoDBIFHFVQJfcynOE5DKK0Gkx+3Y+8ZmqbBbbo5cz9RrAsbQjGssvCaDw37EGfgtXU@vger.kernel.org
X-Gm-Message-State: AOJu0YyXaMxOUd3vjg8Zjtpib0gkusSwGgRnx3Xqtnz69yx/SxJpTxqD
	+kjwF732p7mhM/lAfn9KE2FDEnKdo2BflHdLfGFNR1D0IGGuZcQz47GaThRclol41UP0I7Z4qnK
	RLOnBpE6qbhn1W5xQzb3z6Fxy2vfuQw==
X-Google-Smtp-Source: AGHT+IE/bTf41c1MCWAs/qaN8tJRT4CrBsJmwTgJ2Ig3qBSTWnCihvTZO1jnrYtYgLXlw8GISSG55IL54srBs4PbEbM=
X-Received: by 2002:a17:906:ee87:b0:adb:23e0:9290 with SMTP id
 a640c23a62f3a-ade1a916fe3mr1622209066b.4.1749569073224; Tue, 10 Jun 2025
 08:24:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609220900.3035642-1-robh@kernel.org>
In-Reply-To: <20250609220900.3035642-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 10 Jun 2025 10:24:21 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK6uEtAKwAdaC3gbORQxKuZ0xNp3H=KrN=oh0eLELYZ1w@mail.gmail.com>
X-Gm-Features: AX0GCFugunme4yfbhJ71CA25rsSPK5iPYIbKpy3-oWLjfXfpa3P4TwhSGt4kirU
Message-ID: <CAL_JsqK6uEtAKwAdaC3gbORQxKuZ0xNp3H=KrN=oh0eLELYZ1w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: arm,pl011: Drop interrupt properties
 as required
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 5:09=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
> It is possible that the PL011 doesn't have any interrupt connected and

err, PL061

> can't be an interrupt provider, so drop the interrupt properties as
> required.
>
> The LG LG131x SoCs are one example of this.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/gpio/pl061-gpio.yaml | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml b/Doc=
umentation/devicetree/bindings/gpio/pl061-gpio.yaml
> index bd35cbf7fa09..c51e10680c0a 100644
> --- a/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
> @@ -60,9 +60,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - interrupts
> -  - interrupt-controller
> -  - "#interrupt-cells"
>    - clocks
>    - "#gpio-cells"
>    - gpio-controller
> --
> 2.47.2
>

