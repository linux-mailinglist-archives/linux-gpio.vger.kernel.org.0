Return-Path: <linux-gpio+bounces-19198-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1340A98508
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 11:12:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4B0E1B65562
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 09:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28566262FFD;
	Wed, 23 Apr 2025 09:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pl9VrsOZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D65262FE7
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 09:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745399397; cv=none; b=VQlxkr+uIbnMPz6/TodI7Yx319M0qYbW/gFDR3KciJ1wJJWbBcuFGiIuSbLZvQe6HBQ0MPiNBwj8eZMMykdtgoY7GMVNwuBZsC5X6Df9aiJ9VuTeGXdWtYsFUEH8vrDFYjvhnxBZiMB7iHwl+0FABqIZKCIkfX68K49Qg19MFqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745399397; c=relaxed/simple;
	bh=D9zJsGGNBKvUtfUTrtoCvCv7NgLrgJG8N+UC8V4uJaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cin8XJtr30swtFtdAgkSoqfj4O5z6uvvVB3QUqSdSigLDhEe/ZS1zMAD+KxYhn0SB2XKM9amGLH7LeJCekfRqXPGtoCQQwOvdWsHAS7DHm3yuR4MbMVRFD8MfnMuWyvSMtslPh8F1P3gjzFI8sOxL83gNTywOyHo1+kEDmo586M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pl9VrsOZ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54b1095625dso7146822e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 02:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745399394; x=1746004194; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WARUA/SEaM7gTnI/pqNkLOZLeUBM+XHsQtQUHb5intU=;
        b=Pl9VrsOZekY5NXHTUQ3uqtaasg2AmAMWacA56aj4pmYr1Prs/8o1NTQfEBKQSR3MTG
         x33yusnv4hNxBJjwGUA/R8qN4X6htQTjOP6XB+ebq+rSVft1iH/An3bquuLaoLAPv2XI
         SG7p4ZNnMGBVeTrFpsup2WZD/0nMmD+Su9D0petDlET0G7G4UvsXDyXxoasXiuYtQUDm
         OOjs1fsCxFnkFHjbNDEs5GmMyB8QxCQKAoWlb95KDGXZ1y5xn2uqppepECzBvM4qdYgt
         JX9JW6v6ZPbRlJNs2uj0BJN2KMyTAlvNBolSh4MbtPJx2w9WDaBPKlEAn8xjICZMLmsw
         5HLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745399394; x=1746004194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WARUA/SEaM7gTnI/pqNkLOZLeUBM+XHsQtQUHb5intU=;
        b=Nfo85/Z1WthgZVExrHEsbPhfljvGWmxOFR4CiMvxfW/JMVA7lsFkGycA7gk33IwBkb
         ZfE5NSPAUONSYkHerqSIexe7rnw1SvQpuY4iLMzxaKt+iyrBW9TXue4Cj7TJw2xdk/nF
         JIy+gJ37eWoGE2/Sy+YM1EmLTEzpk8v7RdnS3WNw7ia/juBdnLkMg6oO0RIe0uf/MRWh
         t70Z1DemOZzvE8XH+p9Io4SviXGcE7qI9hVF2Ua7QouVdhRMM5Gj/xysAf1rZk0QTSLS
         /lH1NNqbAn0CodZMoyjJWmurufzlnXJubtWkkyjkldUWwxV0qES7vFkkZZFRGlz2EElv
         xSdA==
X-Forwarded-Encrypted: i=1; AJvYcCV87VLFQDjMYs98n9ZIBPHYpyCAoAiht3dUSZodkCLHQAPrLYJZMUSV5LuxdjUE7RgNs+dyNSu8cVOe@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4RJEsT0alQuN/t4XVvlJ+6whVXvQX1uSwN9bT5dCP0QJMedzA
	wSuQ0tflJAQU1xfa26hOLUZ65+QySi05immVjFNRbemhhvjQyQ1EtHcz5d1hJHTROFvnXPvyVxd
	AUPWV1rUIrS7AZMNU33WpeKfewMLFY09KW5B7m9jWOWHqc3YRXJ8=
X-Gm-Gg: ASbGnctjlpbRmw4Lm7xlJ1ztkFs5VhSZswQPevlblX0cHz6na+8b+0DkeATN7iQ52VP
	kOlWvLm9XrwLibL/fU+btirhlLutNl4+g42lfyhg9QXa/hkh9AeNfGqGJfBPlsYtB+X3FeekMIO
	xAq2YH0S+dtwKhUEXkPu0bf1/Vs1UC/MaI
X-Google-Smtp-Source: AGHT+IGGSWx/qXe0KQyY/MREsZlIV6fNVYZhSzegs3sVGQ2Vz/xafsGBBtwjdgGYFha2pmBwx3eFZ0eFO4ELEa/acV4=
X-Received: by 2002:a05:6512:68d:b0:549:7394:2ce5 with SMTP id
 2adb3069b0e04-54d6e663182mr5664661e87.41.1745399393941; Wed, 23 Apr 2025
 02:09:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422162250.436169-1-uwu@icenowy.me> <20250422162250.436169-2-uwu@icenowy.me>
In-Reply-To: <20250422162250.436169-2-uwu@icenowy.me>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 11:09:42 +0200
X-Gm-Features: ATxdqUGJI5EWHbFKNL1piYfBX7w6VEjwsS65rRDUL2ZIvKqVpjd39nGuBX00R-E
Message-ID: <CACRpkdbGwPyQgVL18iMvUTAvh4XTjo6g3mGT4e_b2aNAjr2obg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: pinctrl: jh7110-sys: add force inputs
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Icenowy,

thanks for your patch!

On Tue, Apr 22, 2025 at 6:23=E2=80=AFPM Icenowy Zheng <uwu@icenowy.me> wrot=
e:

> +  starfive,force-low-inputs:
> +    description:
> +      The list of input signals forced to be low inside the SoC itself.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array

I don't see why you need this hack.

Use the existing per-pin output-low property (see
Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml).

> +  starfive,force-high-inputs:
> +    description:
> +      The list of input signals forced to be high inside the SoC itself.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array

Use the existing output-high property.

Now I *know* these two properties are per-pin. That is more talkative
but way easier for users to read.

Then use pincontrol hogs to make sure these configs are set up
at probe.

Yours,
Linus Walleij

