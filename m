Return-Path: <linux-gpio+bounces-27727-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1CFC11991
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 23:00:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 896C04E900D
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 22:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2366E31D756;
	Mon, 27 Oct 2025 22:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yUdk19iD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D3930BBBF
	for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 21:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761602399; cv=none; b=AbnhLcEOXHLRI5S1Og3dSrGBzCCAcgiY4IYNQRR9ANRDEKyW/O5sbvG/04S2dr76BmYazxUyctcwSAXo7qy0jjhMcC4RmrVeCDb3HJ/7TTzDQwc8UkwsBwAdL9ylbC3jQ7I3hQebjnhABU7sfgE23IMxhRORxuyf2Cl+iaZEFLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761602399; c=relaxed/simple;
	bh=+s9wJrUVnAiARoihgzYhQW4ZH/+T9QovHaBTy4YJrjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oQ0KLok/JunHebgU2lctxQ4SI9dNoFxC6H4TLSKsyn45VTaf2YRxiSwdVKGuI+0G9vBAX5ukMqHTYlwLDOSr1sjWLdyOy6FvslqHVlHOzBzo5Bqkh56zBzGV/ju2eL6rZotEa6yo64KRE/rX7kPKC8I3LXX6wZTM9jVPDEIOq+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yUdk19iD; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5930e30857bso841287e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 14:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761602396; x=1762207196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+s9wJrUVnAiARoihgzYhQW4ZH/+T9QovHaBTy4YJrjc=;
        b=yUdk19iDG9Y2oATyh5vf/Mmf4yZ82QWmJm65k014Sv5n4gZ8Jtr0PsS5yh2WnlL727
         26VKoJSi5DrBOoGeDw9v8PxxQWMFkJJMHss6M5DN36/u+QfNLKMX6UIKEtfzdCnQJyB1
         omitV7vv3YE9C2JmssdREvA/qWTSyJ0wxcA4Pvdr3N88ARUDIXuCwK/rqCLDId3/Vjsa
         929jRE9R23gfqJkrxyfp/fg+UDzET+oxRndmGiqh5qBVjukKWllLYLKN9vfCqZpz/iKu
         b/X4GAuASQ5wAm4EMolhPc8MpOCyI4voUbQBKrrXb5ZkDCPZb4ZABjj26VPoI5w31BmZ
         qrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761602396; x=1762207196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+s9wJrUVnAiARoihgzYhQW4ZH/+T9QovHaBTy4YJrjc=;
        b=fk0BHqvz5vb9hBj45nUVaVEa5Otqag1KMMvNI3247KEDvIbfHhC4pj1+r1D3Tu5oes
         yNejAMGS1ESPCk1pq+ssQU4aAT2NHlltYwMMplthsB+Y6kpzuE0uVxBP4NgChd76We1D
         Fo3dk6hmIAOnReNg7jXOvAcLcGiJkX7IiMOKrRd+MPVC1DBnSlYYqaI7945ZsbL1RwE3
         L8QmtiRldkFaxWUFcOJQ2tGUmrkFugDdyKGwl/RdszsZxycbRO/DJ9doZuUEbKmjvYWe
         kaU2QF5Ooo2t6/Qh9UfXt1caUWQByepwKZdW0rZxz3b9phk/LBMsgHgmdUeDR51xhVZi
         GS0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrhw49+96cnWcfYRhHU/ewPQVcmvK/V6GKXY3Mt0gxtR8kTQDzJWID9p5MAyE+H/nFh874Tzml2oia@vger.kernel.org
X-Gm-Message-State: AOJu0YwjORqyV/LVTH0b75Fi37ArPVz8a+DgUn2HqH5O4dyhdhHX3vZN
	xEkw1ciI9mHdZ/K8ldn0EhUNkDXZJHkpdx4EMTwKH9Mb9wybMCauUxvhOkXSmvkfUZ9eTTkrEJN
	qib2BysCbYiRU4JckA+4oD1+cYtGYMcyVfcUWLvJ7FA==
X-Gm-Gg: ASbGncvehVjx8A/V0f7A+KPzpB+kInpX97ka+BhGQz15U4Pwf13JXwHR/k9r52BQmRo
	v8VP762YjPowc7oVK01Y5ArDtUoIeV7zma6hm4m/6PclmEZn+wKApyRdvmEf9Jz3Cm9jfXZDTB+
	+SMoUZ0zL0OiEx7CO4olreqISR0n1/fjs6CDW0XOcmnkvGAcYHlZRBleq2nCUronlqYCgG/yfRR
	8u3Ikz9OclGsDQrR1zfC32BbitSzzzgMBwI9ioczaIko/LGP4g7r2Nqo68SUwiKnVPHIKQ=
X-Google-Smtp-Source: AGHT+IGENMuTPrZutUQ46wuswD5BGa1TjRpeG2e88psXFvOk1H1653TvwH72RHt6gkUrwbtJPBtV0+X773X1GDUqzwQ=
X-Received: by 2002:a05:6512:2349:b0:591:ca21:e985 with SMTP id
 2adb3069b0e04-5930e9dc52bmr571986e87.43.1761602396255; Mon, 27 Oct 2025
 14:59:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014153040.3783896-1-robh@kernel.org>
In-Reply-To: <20251014153040.3783896-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 22:59:45 +0100
X-Gm-Features: AWmQ_bnaFR_aOmEFaodrc7AgItv72GvXAJNlQaZ0Wjyw4FDq1FooRjnsolDKmfs
Message-ID: <CACRpkdbiJKy2KrCO2wETQzLAkFate4miWNJ2Ed=a=jzS07wqsQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: Convert Marvell AP80x System Controller
 to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 5:30=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:

> Convert the Marvell AP80x System Controller binding to DT schema format.
>
> There's not any specific compatible for the whole block which is a
> separate problem, so just the child nodes are documented. Only the
> pinctrl and clock child nodes need to be converted as the GPIO node
> already has a schema.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Patch applied!

Yours,
Linus Walleij

