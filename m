Return-Path: <linux-gpio+bounces-27033-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2A2BD31DF
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 14:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68CA9189D05B
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 12:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9666D2EA164;
	Mon, 13 Oct 2025 12:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PcScEYLT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DB02868AD
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 12:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760360325; cv=none; b=uSlBSX0viWs4z67QXe50OsxLfEhmprOcuP5veNNfHWqh7EBo9EIa219e3bAtEDZdpuSLI6SoUV5Rfx4iV05XMxOu1K+ZKqta1YhjVBOx6G3nYzfDUhK9r0RQOO+U4XVwgfqWVLHhFMnkOCBvIT/K5sQk8bDCODk6uAC6MIN3RT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760360325; c=relaxed/simple;
	bh=+6DOi+zFDcSixxAiCDvNV19cTvKji5N4xXay/KDy6tw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vyr+uDuPdOySFgSNgiAAE64yj3p4RKzeSQ+t4to/uUCxsOTlc0t7CtPaTYCb3cddMZkRBzpPuvqo+441I78Ix4nUP0nMrdTRasqQV1vRLP/ZiYokVSR296xfzqUoubsmzU82WYpQOeY/ekdHDOQ2d60lZmurNLYQ0NxdXPRiemI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PcScEYLT; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3635bd94f3eso37253621fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 05:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760360321; x=1760965121; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Ht5/EMJSIYJ4/8VE7OBxc2V6zKOUNS2Eq3oer2OJVc=;
        b=PcScEYLT58MFeR4j2VmdBnQ+dVIb1gkRCReMkRUDr+BNSxT7yx9km3MBDi0NfAVMOJ
         kgpqBxXwWU1FDNNy0ZnIW0WNtkjtpe+hohNtsiR1tEVhhwko0trpJMN+mcVWk5RtI68A
         l8RHFHpe+ZLPwbE5RD7+kw/TgTyJ2raBy0xBysTKJs0IJTaIDyPIuS6EJphfRj9vQ8GA
         tsti1YsJv7Lb8FP/fsJQgX+N35SuQ4fjV31bwVM+69b4ruuEi+7ezTQOtsQPRT77yCSJ
         QZiyrbtnRoAF/8NiyuDEb76gsOmZxaxqJiRLOyJ6OHuASTXS524Szaxdq/McFlpSXa+h
         L2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760360321; x=1760965121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Ht5/EMJSIYJ4/8VE7OBxc2V6zKOUNS2Eq3oer2OJVc=;
        b=N+XFNXJDXiFb4ea5pCX6sSxBt5jtTi92JfcQnt4AhoNc6TMXLOakvHNBRrkGs4m9Ah
         dZXOmpn/kQHX8mQtbop+9Ohb8WK4EBWINv8QFaewCbXFEe6Scq4rz3ZExuDXPWwJJz8D
         mO6e1EfiQPGRiPXZCUYQouGyDe5CCpLO4Im+JZAyLOToB5yfkg1nHQmaVyMltnzgbjrI
         bn8zauCQko9EoYEUp7qQR5kh5bixaZrWVIWvylgh1T8uJOOftKn4bpjxsdS6cwyYRXCw
         LhRkY7aAYiDOUjKb7dKWllkgWPKNvOdvAZwzw9jDvnhOBhW/6aV/tDkNj21WUkos4xyr
         7qxw==
X-Forwarded-Encrypted: i=1; AJvYcCU9mIzagY4LyrmdvQ2aYl0ctHwRdEhbcccHhZmNzycIlhtKyFqdRhuFOhnW6dvt9VhvjlCkyaLxCs6Z@vger.kernel.org
X-Gm-Message-State: AOJu0YxwkIbYAcDAZ6aFG3zFDMFFhwnK/yDpT6Sit7ndBwOHz0yDBgTb
	z52Ry9kcsC5dRXTWvj6LiGUCXoONnpSeHarnmlR7gDojwR1u4XjmG/Og/custTkklYwovQ83uEL
	9uv1WuCVXs+bSZ24QbhbngLNQQOCLD9v4cUK2v3bVlA==
X-Gm-Gg: ASbGncsbMdgxDCRcxOvJWRtskypvn2NTUWfOe6Nm0te2IEGDLO8wM4GT5tzJYaCZTLU
	PuvlTbhhOa7O/BxpWN8FqzXIGtOhOqeCQWQXYvrgTpGqAd+4+QGiaoHc+1jUObSXADUMfOginIg
	F7lLsKmOaoSDm+6hB5SEc7tn3RcKnX5oSNtUDrdcoFU867074kXe/U6tF/gcMhkGm+plrSL5EoL
	kozubQ1Waj2HaURLapl5k1XpjV5p/GcCsiH2gqL
X-Google-Smtp-Source: AGHT+IGmJcna4P1VxV3V0jOZ0m71QIrApGlSi2MBhjX9FcOguThuom65noGE6ae3tVCG0FCkFDEalP3RVaBolboPqdE=
X-Received: by 2002:a2e:bea6:0:b0:372:96c1:b276 with SMTP id
 38308e7fff4ca-37609f4d946mr54391151fa.45.1760360320778; Mon, 13 Oct 2025
 05:58:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1759824376.git.mazziesaccount@gmail.com> <fe1f4a0947c864496f4eeec8eef806afcf6094a4.1759824376.git.mazziesaccount@gmail.com>
In-Reply-To: <fe1f4a0947c864496f4eeec8eef806afcf6094a4.1759824376.git.mazziesaccount@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 14:58:29 +0200
X-Gm-Features: AS18NWAGQ68Wo4eF3C0qjr38optVh4QvaXrsoq6Y2fimhDOSTIOXcNl51Lg8PsM
Message-ID: <CACRpkdZnoMvYBXN7b6dw+uPs=f1WXr9wX-0VF1c1qd-rq+17LQ@mail.gmail.com>
Subject: Re: [RFC PATCH 04/13] dt-bindings: mfd: ROHM BD72720
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andreas Kemnade <andreas@kemnade.info>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matti,

thanks for your patch!

On Tue, Oct 7, 2025 at 10:33=E2=80=AFAM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:

> +  rohm,pin-dvs0:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      BD72720 has 4 different OTP options to determine the use of dvs0-p=
in.
> +      OTP0 - regulator RUN state control.
> +      OTP1 - GPI.
> +      OTP2 - GPO.
> +      OTP3 - Power sequencer output.
> +      This property specifies the use of the pin.
> +    enum:
> +      - dvs-input
> +      - gpi
> +      - gpo
> +
> +  rohm,pin-dvs1:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      see rohm,pin-dvs0
> +    enum:
> +      - dvs-input
> +      - gpi
> +      - gpo
> +
> +  rohm,pin-exten0:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: BD72720 has an OTP option to use exten0-pin for differe=
nt
> +      purposes. Set this property accrdingly.

accordingly?

> +    const: gpo
> +
> +  rohm,pin-exten1:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: BD72720 has an OTP option to use exten1-pin for differe=
nt
> +      purposes. Set this property accrdingly.

accordingly?

> +    const: gpo
> +
> +  rohm,pin-fault_b:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: BD72720 has an OTP option to use fault_b-pin for differ=
ent
> +      purposes. Set this property accrdingly.

accordingly?

> +    const: gpo

These are a bit idiomatic, not using the actual framework for such
things (pin control) BUT: they are on the other hand crystal
clear for an integrator working with this device tree, and only
four pins so why over-engineer it. I am fine
with them if the DT people are.

Yours,
Linus Walleij

