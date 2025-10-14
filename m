Return-Path: <linux-gpio+bounces-27072-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 54084BD8CBA
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 12:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B40954FC4F3
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 10:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582092F9D86;
	Tue, 14 Oct 2025 10:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lhv2rd2W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD722F7ADB
	for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 10:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760438673; cv=none; b=pHzXuCUOgu8rhQzjJHj/sKkkepigC/dCzaNHdp/rrqDemxLdX810uadGioC3bB+7zWusZmP8DbJo/P1ZQ6HXYFx/aPEsay2kVLxYaMX7o+mO6eHSFHH0E66n4QNenzCznlZJ2oldeWIQOj0HffdMowCQ3KhBsrL9Rq3JfwjrAJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760438673; c=relaxed/simple;
	bh=s3P3SxQQQdWjgG+0wxnCeO4S365wlkK1npK4z7KMX4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cuAdhSugrBuUUp+FOpFtDFNfo35/AKbpydciBmXzYjWH78eOV2ok1rT9WOrrFwckhfto2mbUibUKiP4uWX6mj7rU58STV08D3yUaRTm0POMoKLGh5v7h5/8V+GH2fbS+Qd+dUMRDiBqn5q9jSjkSFcyoqBFF6TEXvUF8VdTRzOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lhv2rd2W; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-63605f6f926so3173816d50.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 03:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760438670; x=1761043470; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THAYM86a8lGfJC89oRqulnlUSAmMtqdsc6KSglKPv6Q=;
        b=lhv2rd2WH9CZuFONezi4NEyOx2PohReRg+WuXsteVAy3mTZnfIBBL0yKNW6pshaf+c
         L1uouiMZwnO0gI2ActMrSsqF5O5g3GTH8FyddAYuOPjB/ZnegPG6gf4V+cfPKztQme66
         Y1/TbVe+Nxje5DEYZ9rRCEx7L6qFh+BKONDI6IxppbCCcDXmsqeovfq/f7CnFZo9bMwF
         XWvSPpYpWsxexsIIH26rE9POCgGKjvhKNOtEkIFxYYueUl9CgF+xh6hRf6cURJufu1L/
         YATa3cFJOo4HKE/Qg1vnoj3wIGpU9/gR77YBAi6FSIqWe3wbKZVM9JzapJCqH0yS1fr/
         nFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760438670; x=1761043470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=THAYM86a8lGfJC89oRqulnlUSAmMtqdsc6KSglKPv6Q=;
        b=xCPFLYBjfIVhBms/UIWX3MBh0nbQFL7nFUc87dgbv91mhzYEayv6LMPtIUTuaYfxty
         87nxPU4T0HMzzts0qmdr32X0oC5PINu2BoX5dl8fxK8t9u73Tbi2vNonIPKblQ8SBJMD
         E45RJDU6o7PE62Cl++tW8XgkkvYRYK783EpqDdlxLpUizBED+voi35WBU8RJsxINXCpv
         0UGkw9RFC/Lo/bBhRIfEvEGSZ7OrkbKvGEHJtA4NWz3sO/VvSYxUkDqmdcAO+SRM7dMX
         3e56Rr1EBSBECzTHZo1R4u0ZL64aED4rm0BI4MOoJYwRaod8o+K6alA3/zAjN+oc0on9
         i6nw==
X-Forwarded-Encrypted: i=1; AJvYcCW+XD6/FgAUUfhJvVrl6gT7aSiG8Ud0M3YQdSW2mI+pVE9SDuAhv7+ZFJUN6FxtlyxZfNZ84+tfGpmb@vger.kernel.org
X-Gm-Message-State: AOJu0YxVzcHJeOCYdHPWNVAKag92GtL2RW2ZCAEZRhOCUW+v5w9zoKGv
	qi3usB2SBPnoKXKLtP0M+IF/t+hWnGGjZP4A7lHXHOx52WeBjNibMu2jXlcC3DeU/sgZ6uf22My
	ui7bY1r0s5W8rtUZf0WRuQAhG19kEyhkRp5p4/n7fsQ==
X-Gm-Gg: ASbGncvU04yaDp1f9BHmGr9pb14+HeV7Bi+HPdEU/DsbnrjQm1vGBvXjj12AtMVta2w
	K7dODiT7AKmhph5AKso4d1JhPBCU6NGjt/2f3qo6YAbvNOrksBCfXjMh1rwefKQXQnrpwVe+KGI
	J2Sr+oPetosGmMn6YysnprkUNPlRDosCRiwyXeEvrX9rvVZRCpgvdtBFy6aJskHGMcAt/F28siG
	w8E9Ns4/FJsl5KdwZgGkt41MQbRJA==
X-Google-Smtp-Source: AGHT+IFp4+6M8ipAZ5PvzMBFmhPMOi8dNCbnfx7iCHUB+I0mJ3szARsJfZuBKpYg4FajfdIRV8gYXT4SlaoN9/M/6LQ=
X-Received: by 2002:a05:690e:182:b0:63c:f5a7:400 with SMTP id
 956f58d0204a3-63cf5a70a44mr7374154d50.68.1760438670439; Tue, 14 Oct 2025
 03:44:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014015712.2922237-1-gary.yang@cixtech.com> <20251014015712.2922237-2-gary.yang@cixtech.com>
In-Reply-To: <20251014015712.2922237-2-gary.yang@cixtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Oct 2025 12:44:15 +0200
X-Gm-Features: AS18NWAu8xsDVfGUGNQZd3TKgpRR7nZFuc-hAgCzcqzNK32irDscIbUpkUaITw8
Message-ID: <CACRpkda-2BNj+Pt2kS9u_bbr41bsWGRGDqNd3EXVnys-xSqg0g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: Add cix,sky1-pinctrl
To: Gary Yang <gary.yang@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	cix-kernel-upstream@cixtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gary,

thanks for your patch!

On Tue, Oct 14, 2025 at 3:57=E2=80=AFAM Gary Yang <gary.yang@cixtech.com> w=
rote:


> +# Client device subnode's properties
> +patternProperties:
> +  'pins$':
> +    type: object
> +    additionalProperties: false
> +    patternProperties:
> +      '(^pins|pins?$)':
> +        type: object
> +        additionalProperties: false
> +        description:
> +          A pinctrl node should contain at least one subnodes representi=
ng the
> +          pinctrl groups available on the machine. Each subnode will lis=
t the
> +          pins it needs, and how they should be configured, with regard =
to muxer
> +          configuration, pullups, and drive strength.
> +
> +        properties:
> +          pinmux:
> +            description:
> +              Values are constructed from pin number and mux setting and=
 are
> +              defined as macros in arch/arm64/boot/dts/cix/sky1-pinfunc.=
h directly.
> +
> +          bias-disable: true
> +
> +          bias-pull-up: true
> +
> +          bias-pull-down: true
> +
> +          drive-strength:
> +            description:
> +              Can support 15 levels, from DS_LEVEL1 to DS_LEVEL15.
> +              defined as macros in arch/arm64/boot/dts/cix/sky1-pinfunc.=
h.
> +
> +        required:
> +          - pinmux

Can't you just include both pinmux-node.yaml and pincfg-node.yaml
to get validation from the generic schemas?

'pins$':
  type: object
  additionalProperties: false
  patternProperties:
    '(^pins|pins?$)':
      type: object
      $ref: /schemas/pinctrl/pinmux-node.yaml
      $ref: /schemas/pinctrl/pincfg-node.yaml
      additionalProperties: false

Something like this, I never get this right before actually testcompiling..=
.

Yours,
Linus Walleij

