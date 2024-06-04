Return-Path: <linux-gpio+bounces-7138-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5085F8FBD99
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 22:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82C601C24134
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 20:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BAB714B97D;
	Tue,  4 Jun 2024 20:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xqTXgVWq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB4C14B977
	for <linux-gpio@vger.kernel.org>; Tue,  4 Jun 2024 20:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717534482; cv=none; b=MGfLanUZXVypmaFt0y2UB++UUWV76HS2BNlTJsAVQNwFGjSS+tSBnkiMux5isi4IIhPgZFXS24rwtdVPjp6v/iPoR960iNqBDGkF3eopxkmx2Rza4usus7RnEiTc0E0Owy5k8/gHFLnfeHbAEPxTGvbwvmOu3IlcUDXTedtK7v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717534482; c=relaxed/simple;
	bh=VBAeMq8KfjUFFuqTOk8422KB8nblZA3D+lJujgVivKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bcyqU1jFHesTJRmQfXIfz3MtNrx/LgvqPJfUG7FcmZMc5UUAAUN2uwZjmWiwS7yrlrZjR+ExVQkizr5FhsqhKFJ7l2rIuajhOvgV8BcMdpZR561c2AEIhToOBGYcbnLnaTgOWm4vCGCZ093/C/YD2UlDdOUWr0n6Y49gvd/jzcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xqTXgVWq; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e724bc466fso70920721fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 04 Jun 2024 13:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717534477; x=1718139277; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VBAeMq8KfjUFFuqTOk8422KB8nblZA3D+lJujgVivKU=;
        b=xqTXgVWqJRQ6BqAsp/TbPJsTTjFzacBProXFH2b4xFwHUbmIP103UUeR1SUvadbKDR
         GzS9Bf1Mzzcn+6zOYeb/6IkyofM4gYKxOFgyIZBsvZmNvKlhz/VUNo8ia+4vpU99N0bM
         C1z2QUiaKPX7xyhVHeCVbFGlHB0mp7PIW/T5zOPMNAo5Ho6wpswm00cz7q/8jBLQVdn/
         hy2m4VffPlCotkLa14W5wfSGMYcOxZuO7gfJxNW/M3Jz7t5eK1H4Qsp0gx3mQzk46R1A
         093wBkjcoYBm7LNpQX97KbaZ72P7PSqTNbBj/IijSHvEWPfZ/5D1s654vti7pZnmhCjq
         9Vww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717534477; x=1718139277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBAeMq8KfjUFFuqTOk8422KB8nblZA3D+lJujgVivKU=;
        b=hXuMvtmjo3sZ89uafZI5HbiO01uTOGYqQ7YDwQR1Tr7ofjnFLG7GOdezmZtXjtPBLN
         I2lQ+G+aiUPKMCpQscN6mA6/9rRXGugGqitgjrxafgQ8Y9yeoO+E9vJkoq6o6CoEdvDE
         4kkXNDgvYsyJZQY7iiijwmeR3zV0CLC37x7Du96tDBuRirAKryqxU9xydBoypi4A/A9Y
         VWePhR449svXB0vgkKsrHFKFtpYXP8LqHl2P3PEphqLD/W22r/jxHsyU6schxyEHOku8
         bsQ97YYV9i5hbclA/1KqVl783bBNI+Uj27liPmzZs1lQPqS5Xp+M5o5jaWVNBCdNgxCG
         8zig==
X-Forwarded-Encrypted: i=1; AJvYcCUHwfdQUcPkvtDEl/GMMPhOibzznB2cJ30LhvOFwDrXELZb7J1uApUY7s+ABFnZ3vLUTuwbfv3P81XmAc1NoER75itaEddgUT1ILQ==
X-Gm-Message-State: AOJu0YwAsUB4vP+Pjw4nh92afbhup3gA1rYnAJQEmQByPZkJwWJnvSC0
	INHIEidC5AZaZp1LkMBWEfduMvWODvlnDVcRxOV1/Rf3uhmfYMAkHjX9U+2S23zyPjTMKd73oz9
	OPS06NEP8tEgD4sL3s/h30vK33CIbDexBFBLp8RnpoMmJ71kEENw=
X-Google-Smtp-Source: AGHT+IE2YUjdEQCPYNzAzvq05kgFO3gcsrBJu0oDcdozbnSjCpn58jIr20zM456R2tCctmXmb1rQGsA1gIsJI6A9KkQ=
X-Received: by 2002:a2e:9a95:0:b0:2dd:ccb6:e836 with SMTP id
 38308e7fff4ca-2eac7a0de42mr2264861fa.25.1717534477526; Tue, 04 Jun 2024
 13:54:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240602-pwm-gpio-v6-0-e8f6ec9cc783@linaro.org>
 <20240602-pwm-gpio-v6-1-e8f6ec9cc783@linaro.org> <CACRpkdbPGEx9QSazVfP7rbkM7x2MnJbrACdTi3zyniQhZSyTbw@mail.gmail.com>
 <20240604-creole-easiest-2146ac2ea996@spud>
In-Reply-To: <20240604-creole-easiest-2146ac2ea996@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Jun 2024 22:54:26 +0200
Message-ID: <CACRpkdYDcR_ysF4rX6Zx6ZjQpgzYxxNKR+U=PJOVCndy2hrGaw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: pwm: Add pwm-gpio
To: Conor Dooley <conor@kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	andy.shevchenko@gmail.com, Philip Howard <phil@gadgetoid.com>, Sean Young <sean@mess.org>, 
	Chris Morgan <macromorgan@hotmail.com>, Stefan Wahren <wahrenst@gmx.net>, linux-gpio@vger.kernel.org, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	Nicola Di Lieto <nicola.dilieto@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Dhruva Gole <d-gole@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 4, 2024 at 4:14=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:

> > The #pwm-cells are currently not properly specified in the bindings: fo=
r example
> > pwm-tiecap.yaml says "See pwm.yaml in this directory for a description
> > of the cells format."
> > and that file says nothing about the cells and what they are for, shoul=
d
> > I send a separate patch for that?
>
> Does this suffice?
> https://lore.kernel.org/linux-pwm/20240517-patient-stingily-30611f73e792@=
spud/

Indeed. You can add:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org> for the above patch!

Yours,
Linus Walleij

