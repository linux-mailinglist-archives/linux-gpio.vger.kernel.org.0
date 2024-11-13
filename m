Return-Path: <linux-gpio+bounces-12915-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 815759C6AEE
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 09:50:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40964283218
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 08:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4713618A6A6;
	Wed, 13 Nov 2024 08:50:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55100175D38;
	Wed, 13 Nov 2024 08:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731487838; cv=none; b=W35xonfVPmJmsSyNKwIbqFwBPskY1C7iYUIjd3ehqH6XeiYjdaus8PzsSugTHrxdtNXSy4Rfvh9K2URBmVofVpQEy+YVuNx+EQV1aC2Cl2KZeU9Pby0jJ1efiyEILP/Q29LQg3vfio2prOBykqiRuY3f5ab3ImslNbDAaYEIm84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731487838; c=relaxed/simple;
	bh=kVFxWJzrPuWll8DgFXFbv7lBgh/gNNMdDt7g127NaRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AYWovc6nRYvEM5qc3ggMinWxOQmVAhg+SKpcY9L99x9bIzwAfY6AH0egK4iNZaPeanZ40zo2uT3tml/feMO4WNjxGiKBxX2v3w45UlOX/acaAQDG24wdATThHFxQ5GsMA64ni8OvfCV92/TjExOv0WOpHMTj37dV307ForvUbVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb6110c8faso61077361fa.1;
        Wed, 13 Nov 2024 00:50:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731487833; x=1732092633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QI8MidwZZ5apE6IYuuUbrPqi3d8lcdFWg29g280gmXo=;
        b=q+NbjFSEVbGf1C3MsbJMXc4hnEBWe6q/Iv9FHMaNRQxCRSoZTJY+SKF0JbhCAE3Zpi
         m85O2KjtOjvLrgyg7eY0qkv0pOQihpsjeGDErihx+fUKa9IRJwiAF2KsZaonVgT1JQvo
         HsQB+44xuXaOZRcwZzF9piCB6rxwfIwybakWuTOheWkRJRFCmdzx+DKqvP4KhNkj7Iw9
         ke1bsI/KFj64NCplbt+1ulQ/8Did7gOgJGnnQl0wm0YwHgxo3e0nzhXPJZDiFASjTDrk
         R/D58GyNL8awD54TFa6bUoVgyOGygqtTpxCoPdnZFTaHJJ3rYd/EqjxpKUk7j+P/r1Be
         WqVw==
X-Forwarded-Encrypted: i=1; AJvYcCUZsu6a0trorqoi/UCLZu7DX1JusXUAOt8lt4lef7WVu6qSmTCJcz2NCloMU4p/OL19YIf0bplsATiyWA==@vger.kernel.org, AJvYcCVOyOwWwxdIvso15KENuJFFDG6bwrVGK/638E1V8bwqBbmr32McYMSgXdTfuxSQ6prnFHyyjuQJyrEo@vger.kernel.org, AJvYcCW1naAzgINItpR/cUCEmq5jyFeFbmXH94QfBQkR+NuVCtSoFnCp+Xcel3NNqaDNULOJ3N1vZE23DqzLtnoA@vger.kernel.org
X-Gm-Message-State: AOJu0YxM1qMGzTD1TgthXepZp0dwJFFc4ZUc+E0/oezSBuzoXabVV8lR
	Zbwi3262BkBeeKZCa0IJRKa836AlHjOlkfC6+sCfR0CM7cIPvuYfE94eVZ5f
X-Google-Smtp-Source: AGHT+IGq6PlDbpjgN/gGgzuVZEHr1X/VeBeQzPZhM2ZzLDgDL/YJk2SypRb57g7YKBxvTg9w/k8ZXQ==
X-Received: by 2002:a2e:a812:0:b0:2f7:4c9d:7a83 with SMTP id 38308e7fff4ca-2ff202a71c9mr90284141fa.40.1731487832644;
        Wed, 13 Nov 2024 00:50:32 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff178dfb57sm23116541fa.19.2024.11.13.00.50.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 00:50:31 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb6110c8faso61077071fa.1;
        Wed, 13 Nov 2024 00:50:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCViKDH/tgHBKnQp1GFIOCcTTRZkBAgFjLbsaWQ5ywewwCVYCZDA0+CMS5iIbsPjldZW8ipKVmDub0tDBw==@vger.kernel.org, AJvYcCWfI+z1xblSciqTS+HBviCJV52uERIrWsN0OHmYP5LQXEjEsfCBXoyP30I56qqZ+6rKrTg1hBrfVpcB@vger.kernel.org, AJvYcCXv9mV8mkbbviXaVbrxm2TOD2uOsggfXvEL4IlgX3Ehmx699yxRFLRXeIGkWjbIC/Tfyo9EzfGh34PuQkpC@vger.kernel.org
X-Received: by 2002:a2e:a551:0:b0:2fb:4b40:1e18 with SMTP id
 38308e7fff4ca-2ff2016fc88mr87156771fa.13.1731487831435; Wed, 13 Nov 2024
 00:50:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241111005750.13071-1-andre.przywara@arm.com> <20241111005750.13071-6-andre.przywara@arm.com>
In-Reply-To: <20241111005750.13071-6-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 13 Nov 2024 16:50:19 +0800
X-Gmail-Original-Message-ID: <CAGb2v64x_QE8w_4h10waG33xNpkd9QLt_B=xSPMMe0M=6bqsJw@mail.gmail.com>
Message-ID: <CAGb2v64x_QE8w_4h10waG33xNpkd9QLt_B=xSPMMe0M=6bqsJw@mail.gmail.com>
Subject: Re: [PATCH 5/7] dt-bindings: pinctrl: add compatible for Allwinner A523/T527
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 8:58=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The A523 contains a pin controller similar to previous SoCs, although
> using 10 GPIO banks (PortB-PortK), all of them being IRQ capable.
> This introduces a new style of binding, where the pinmux values for each
> pin group is stored in the new "allwinner,pinmux" property in the DT
> node, instead of requiring every driver to store a mapping between the
> function names and the required pinmux.
>
> Add the new name to the list of compatible strings, and required it to
> have 10 interrupts described. Also add the new pinmux property.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 23 +++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a1=
0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-=
a10-pinctrl.yaml
> index 4502405703145..6fc18e92e1e94 100644
> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinct=
rl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinct=
rl.yaml
> @@ -56,6 +56,8 @@ properties:
>        - allwinner,sun50i-h6-r-pinctrl
>        - allwinner,sun50i-h616-pinctrl
>        - allwinner,sun50i-h616-r-pinctrl
> +      - allwinner,sun55i-a523-pinctrl
> +      - allwinner,sun55i-a523-r-pinctrl
>        - allwinner,suniv-f1c100s-pinctrl
>        - nextthing,gr8-pinctrl
>
> @@ -64,7 +66,7 @@ properties:
>
>    interrupts:
>      minItems: 1
> -    maxItems: 8
> +    maxItems: 10
>      description:
>        One interrupt per external interrupt bank supported on the
>        controller, sorted by bank number ascending order.
> @@ -119,13 +121,17 @@ patternProperties:
>          $ref: /schemas/types.yaml#/definitions/uint32
>          enum: [10, 20, 30, 40]
>
> +      allwinner,pinmux:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description: pinmux selector for each pin
> +

Why not just the standard "pinmux" property, as given in
Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml

>      required:
>        - pins
>        - function

This section should be made to apply only to the existing
compatibles? Maybe we could just split the files and have
a clean slate for sun55i?

ChenYu

>      additionalProperties: false
>
> -  "^vcc-p[a-ilm]-supply$":
> +  "^vcc-p[a-klm]-supply$":
>      description:
>        Power supplies for pin banks.
>
> @@ -156,6 +162,17 @@ allOf:
>          - interrupts
>          - interrupt-controller
>
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - allwinner,sun55i-a523-pinctrl
> +
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 10
> +
>    - if:
>        properties:
>          compatible:
> @@ -166,6 +183,7 @@ allOf:
>        properties:
>          interrupts:
>            minItems: 8
> +          maxItems: 8
>
>    - if:
>        properties:
> @@ -244,6 +262,7 @@ allOf:
>              - allwinner,sun8i-v3s-pinctrl
>              - allwinner,sun9i-a80-r-pinctrl
>              - allwinner,sun50i-h6-r-pinctrl
> +            - allwinner,sun55i-a523-r-pinctrl
>
>      then:
>        properties:
> --
> 2.46.2
>

