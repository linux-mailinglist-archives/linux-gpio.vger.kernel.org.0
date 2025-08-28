Return-Path: <linux-gpio+bounces-25151-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 878B1B3AA02
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 20:27:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2E551C845F9
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 18:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD9B127466C;
	Thu, 28 Aug 2025 18:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u5ao/qRq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146FF18E377
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 18:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756405658; cv=none; b=loil/eYDZElXjboIA19t1jas9uEHLFZPvHfOcehxpsl25KOIZE3WbSde+eGvVnWshTlCdMAnR5kdD4e8UBX7278ICMnwpyH1IRHznMNjYBv4GdYBMGlriiT6YRsAF7UgOKQgXrWve6m5QWT1LXw3j6cIuLrFfGiR7UjhfqJeLBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756405658; c=relaxed/simple;
	bh=yUudGldIdimJfnVV7F3jVvnrtrGzbpei61zCHqvYDRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SI3NP+cXZdlyW/hp35KTmHhoUeJs7Y/yURdxutvzLb9/8Wxms9drNCnx5Gd4CXWlQXgsY150cVCsVGPynzZr8aXDo4krk85OWHEwtG3HYjx2621EWWKMkJTFA0vzqJCugXszztVU2hjBq0lodYlufPXydB/BfMeH81hlroTkRDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u5ao/qRq; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55f39c0a22dso1453771e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 11:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756405654; x=1757010454; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqwyb/SnnH1TinOPkVGbJlqbh2FEY+oG9aGa26NkltQ=;
        b=u5ao/qRqEbZVbijEzO5hnSNcEZreJOpjR7t2KS384DjiPdKGM1+vJ+KClsy1z5Hn5y
         IOpO6Ik3amodLIvfe3o2oZrbO3QZa7eKG2goNKGl2M1BjMJo/u/yA2sCVlW4gsdoCwXW
         lkImRj0oda5bKS7aaBuRqQNBOW3XTdaDNXaL0obDsU0qlIXLJHxH7ooWgqKuycqXzyLy
         c7/h5XXcin866TcI9GQdG8PR/pNIWbVJAVYep0nPIyfnMooJchfAs5Ih8IBNFFZE3Ioi
         IFDZbCU/lWLg9c4iL3UafcG+9RqGdLQz6QDe/x3QmwImdO0xKEcNXj0GQ8kFw7j49uhq
         20qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756405654; x=1757010454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pqwyb/SnnH1TinOPkVGbJlqbh2FEY+oG9aGa26NkltQ=;
        b=S3cZDXuirfuO28IIY4t/k87RKf9sTZJ8MG9G+9ODs26NcweBV8R+elmiDK3FBHv8iC
         mo0rbtiLGSNZccqO8qULJAFuLFR6012jAOpFQGq7iVIFKvRiD6UBC0U9ew59dlMq4XFd
         9/N4iyMWDTUX1XcTak0YL6e8S1ZKpel6vGiy+/vyU2ttny2Caq3KzTsVKuEIoHzd1PZS
         7+Swj0XkXu6pHxifvzi2uxOoge97hf2DPlYv/BYwCY5lHoxi/LBsZgvtz5ouJNsft+sF
         54JqLH876CnCwfV4VH0w4eTF7aFJegwb75qZ8fvwAAmumMSOFJUM075ZZB61NA9vS2dw
         HwPw==
X-Forwarded-Encrypted: i=1; AJvYcCUv3B15YGIK1Q5Pq3ekM1zJHANk627gom/DCBG9UXnbD1ytQG4tSv4JJBpFW3GMdnbS5d5D4IHMVXm6@vger.kernel.org
X-Gm-Message-State: AOJu0YyKurpfhaHZcDL0BcETf9G2HtXD6Bz156cL4lOsnBPClgUsGW5f
	U1JDhhk4qlSmf7nVC6+lGNgAdS4+vrMYCvcUt3HpqiMoV3nEpzolWpDxJhs88f3HBv1iwtDPGOU
	ztIdpAkvDkJ1k/BDGiGyVzAufrdmulsbO1H4Seoo5YA==
X-Gm-Gg: ASbGncvW9nW633YuX8RD2HlnahcbbHqYsDhl3f2UKJdtLP2n6WAjebDexEUyCJQjPTr
	Ns260v+VAXO7wHEme/snwrCtCjiLcMpZQnA/tq2WVYYsSVYTbqun3aosLOv2CDbu2oSWdRq5cBA
	tQdWOP7Q5uRyysMyKciB8grpMdRzT/O5QHxCdohPsKmFN3+7LMgCTj9st/BWBw2Qg2uB4wnF1/B
	wUK6qCzK0025G2Czw==
X-Google-Smtp-Source: AGHT+IHjNr9ZC6xmrExTBjeycVEVqrH7imCeC/o/rJDawlJYvFFJ3EnVgmrnFIfcqveGRJTNAgtfNbpETKNQsRbUIjU=
X-Received: by 2002:a05:6512:6412:b0:55f:4c9c:27e5 with SMTP id
 2adb3069b0e04-55f4c9c2a0amr3876653e87.23.1756405654172; Thu, 28 Aug 2025
 11:27:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250827024222.588082-1-gary.yang@cixtech.com> <20250827024222.588082-3-gary.yang@cixtech.com>
In-Reply-To: <20250827024222.588082-3-gary.yang@cixtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Aug 2025 20:27:22 +0200
X-Gm-Features: Ac12FXxAt5VeCD-YOlaMkQli9qerZ055DqxwpMYFqqyUfOtx4GPyUpzPDPyGmoI
Message-ID: <CACRpkdaX2VPAb+vihZ5BEAsGy+jNUdQ8q+3c3Q78uWmqZYeu=g@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: Add cix,sky1-pinctrl
To: Gary Yang <gary.yang@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2025 at 4:42=E2=80=AFAM Gary Yang <gary.yang@cixtech.com> w=
rote:

> Add dt-bindings docs
>
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>

I saw Krzysztof reacted to this:

> +++ b/include/dt-bindings/pinctrl/pads-sky1.h
(...)
> +#define CIX_PAD_GPIO001_OFFSET                 0x0
> +#define CIX_PAD_GPIO002_OFFSET                 0x4
(...)
> +#define CIX_PAD_GPIO001_FUNC_GPIO001                              0x0
> +#define CIX_PAD_GPIO002_FUNC_GPIO002                              0x0
(...)
> +#define PULL_UP                (1 << 6)
> +#define PULL_DOWN      (1 << 5)
> +#define ST             (1 << 4)
> +#define DS_LEVEL1      0x1
> +#define DS_LEVEL2      0x2
(...)

As stated, this isn't part of bindings so it should not be
include/dt-bindings/pinctrl/*.

If you are using the pinmux =3D <...>: property, what you can
do however is to put the same defines into
arch/arm64/boot/dts/cix/sky1-pinmux-props.dtsi
and use it the same way.

Then it is not bindings, just some DT data.

Sometimes this distinction isn't clear, and the kernel contain
many offenders to this rule.

Yours,
Linus Walleij

