Return-Path: <linux-gpio+bounces-25330-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C604BB3E6E2
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 16:22:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86F46170A03
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 14:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE5C33A01D;
	Mon,  1 Sep 2025 14:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xuge0O1j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510BB322DDE;
	Mon,  1 Sep 2025 14:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756736533; cv=none; b=iXuxb/rPukPBYNHfwFBSh6jujddyopbhHrbthBlcDcVyXrTsZo7SzAvDVxNZYaWj7ywg0biwwMXlkNnnU8ac66q+Q/bwW1S7ug1kp37YdZbTo6TAgZIBcdB/oPCWFBDFHX0/rBnpXIdp4cKMStJfP03rcN4c7nSoqKd2Dvh9sGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756736533; c=relaxed/simple;
	bh=K2kYiZiVyxUDdi5RTXdMN+aXq8wRqVqLiPiiycS+S80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lI7r7GByPpAjYH8jykwbCJrLm8hksTB4MUYznf/OOnNT8idWlbaFZ+GiXYKJVYxOl9sXRhabXQyR2gaBx289LnPorpoICuCrYCrbKaeyJ4TFOrZVWnNmoIEDlnP0eemA+OSKWD2NAqQOSFGrVZd9DqbVQBrcQJ2hIxBdjMsG9v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xuge0O1j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7EBBC4CEF0;
	Mon,  1 Sep 2025 14:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756736532;
	bh=K2kYiZiVyxUDdi5RTXdMN+aXq8wRqVqLiPiiycS+S80=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Xuge0O1jxsPquvMurMpsEq1goSLCSB4TQVET0q5VHUpmw8BXxvj/h7wDZx4W3zZyL
	 JEpcpnApT2VhRTxDbo0ICPcvVvB4p+q9uJugInQB6MPAvrTcNtNbww0dwXjTor3p81
	 BV8GhktHflF2WGcab3hb55zvQIaJ/9txEDoOqgN6hxQ89tSPTN5XYSdAr+kpbrnNf3
	 GWiv/vvgVbDa9AlxDH18hvK66BnAap8hmTmlQg1Q9SklToapfVSZ2CXM7M5dbmsEJg
	 blPhyweDf/wgAE9cjKQc7ebz31ec87+P5Dk91g/f6zz6abVh4jy1DBqRQNBwW0ejWb
	 40eQYdxEZumpg==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afebb6d4093so733991466b.1;
        Mon, 01 Sep 2025 07:22:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWvgdCFvPSfzSI+TIIpIrbRHwW8kMDN3j6nLDkz1F7Noiu/QqGX9lecoj+g7cHwwnzG4My45ome8ouixg==@vger.kernel.org, AJvYcCWw888suP4Fj1nZE6GR8/7zfyZ7Lj5x7mbpB2iMvimYLqZbW7uroJWVMoesMllT8cpbzJ+y32+NW5I2@vger.kernel.org, AJvYcCXOrFbVrIeE1osPkE7iXOfPen5XRVbnHSA4zM6nGotuJpc4iQ/ObChfGojQnlKvNRdHiEmQziD7HOv5KVQ+@vger.kernel.org
X-Gm-Message-State: AOJu0YwlkZqLK2qpGZHrVi7YhKg2QUue0+MXNOxlLakb75Y9n6Jw7v3Q
	fZ2b49ZVHyxfJ5isQXQqNThoGPzN1My6rQkZIIjuYXBD0FdN1TdVaHy1YQ0DkkzbR5sR81A0iIM
	R55gA+ghlEVBdSrJcJEbV5Aoe/09k8Lw=
X-Google-Smtp-Source: AGHT+IHPdXr/XUgtaqFQDzYP2xLH93Ng7BH9N5OvvUMrMk3SwimiCF81UfqyQVvDBKGvDKi529qh3/k2+tDF1h2tOaA=
X-Received: by 2002:a17:907:1c81:b0:aff:a36:e6e with SMTP id
 a640c23a62f3a-b01f20c705cmr845601266b.57.1756736531562; Mon, 01 Sep 2025
 07:22:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250901133804.38433-1-ziyao@disroot.org> <20250901133804.38433-2-ziyao@disroot.org>
In-Reply-To: <20250901133804.38433-2-ziyao@disroot.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 1 Sep 2025 22:22:04 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5odi479mTr0zmDnX1WF2AmJRXTL34_ts2VCM-g6N7bjA@mail.gmail.com>
X-Gm-Features: Ac12FXxNBix1pk086_kR5DsE3syM3S-nxd0w_C-yjbJoXpM057Wr2HgqOREvarg
Message-ID: <CAAhV-H5odi479mTr0zmDnX1WF2AmJRXTL34_ts2VCM-g6N7bjA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: gpio: loongson: Document GPIO
 controller of 2K0300 SoC
To: Yao Zi <ziyao@disroot.org>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, Mingcong Bai <jeffbai@aosc.io>, 
	Kexy Biscuit <kexybiscuit@aosc.io>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Yao,

On Mon, Sep 1, 2025 at 9:38=E2=80=AFPM Yao Zi <ziyao@disroot.org> wrote:
>
> Loongson 2K0300 ships a GPIO controller whose input/output control logic
> is similar to previous generation of SoCs. Additionally, it acts as an
> interrupt-controller supporting both level and edge interrupts and has a
> distinct reset signal.
>
> Describe its compatible in devicetree. We enlarge the maximum value of
> ngpios to 128, since the controller technically supports at most 128
> pins, although only 106 are routed out of the package. Properties for
> interrupt-controllers and resets are introduced and limited as 2K0300
> only.
Replace the full name with "Loongson-2K0300" and short name with
"LS2K0300", others look good to me.
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

>
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/gpio/loongson,ls-gpio.yaml       | 28 ++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml=
 b/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
> index b68159600e2b..69852444df23 100644
> --- a/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
> @@ -14,6 +14,7 @@ properties:
>      oneOf:
>        - enum:
>            - loongson,ls2k-gpio
> +          - loongson,ls2k0300-gpio
>            - loongson,ls2k0500-gpio0
>            - loongson,ls2k0500-gpio1
>            - loongson,ls2k2000-gpio0
> @@ -36,7 +37,7 @@ properties:
>
>    ngpios:
>      minimum: 1
> -    maximum: 64
> +    maximum: 128
>
>    "#gpio-cells":
>      const: 2
> @@ -49,6 +50,14 @@ properties:
>      minItems: 1
>      maxItems: 64
>
> +  "#interrupt-cells":
> +    const: 2
> +
> +  interrupt-controller: true
> +
> +  resets:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> @@ -58,6 +67,23 @@ required:
>    - gpio-ranges
>    - interrupts
>
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: loongson,ls2k0300-gpio
> +    then:
> +      required:
> +        - "#interrupt-cells"
> +        - interrupt-controller
> +        - resets
> +    else:
> +      properties:
> +        "#interrupts-cells": false
> +        interrupt-controller: false
> +        resets: false
> +
>  additionalProperties: false
>
>  examples:
> --
> 2.50.1
>
>

