Return-Path: <linux-gpio+bounces-6040-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B45E68BA8BE
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2024 10:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E58011C22299
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2024 08:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C46D149C53;
	Fri,  3 May 2024 08:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NLy7oWC8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD55D148840
	for <linux-gpio@vger.kernel.org>; Fri,  3 May 2024 08:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714724965; cv=none; b=tJDm0sJ89U4M5LIiNtoYhEV7x/2twF3sbqIysi5HHISnr4EFLoJ9DSvemaqAV0HwdVAE1OWfzeTKzoOEZJ4thmx1PFZqQabU2jG2tp3YaVc9nCX9gTb57yxnkcp/vKzLqxFsMVEWvt6DPsRZ0lPjfvLWsIkUDX3BaripL/P3RE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714724965; c=relaxed/simple;
	bh=/MOdj/lifA2AeS8oNIVW2cyzjNKX16mBXmADEVtzHTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BM/Oi7nEnoxOxdavY2XdKaNDgCdw3sUMVB1BXE+OyTEKLOXML+uVP76qYtGkji5fudd7oSeUmB7eyoR0DNC1F/iaDUtA3f6QMNwEGg8+nEMLYLB8sNiqX9O0AxicHgeu/Im13QObdGgC0++kj+AGKxUNPy4sxCBZcFK3QYm8xA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NLy7oWC8; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-61ae4743d36so94126487b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 03 May 2024 01:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714724963; x=1715329763; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzQNzscPC/5W0S2y6e/zudtD8W7uyT+JqOosYf+h760=;
        b=NLy7oWC8TTrNsBXz+1Bhoc02nBlA4kukWsU1I1vttmfZPlOJojsS+5tHZgZgJVPSDS
         C6A1puitbVKMx+UnqbRENcSDPsO3xq4SDFRJ+hhcvAfu0K4ZW4zIM/C1osB+qiaak7FS
         SduKaWrRPBc+/y/G4HUrD1AOF8uveEsUsZDBCb8sQPs9qnAWbJY5VzfS9I+Z9QTOFwdD
         m7+UkVDr3UXbwG/BBTvqFrLU2H/kEItKAYlOLhXOFRl8Y+++mfMMSHpClpA4kas3EIix
         NpNjEjWvgGMzJjQtItpbv7C3HQ2LeyenIvtSAbWqg/61pLDqXO5889OChoG84ooAJMU5
         +b0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714724963; x=1715329763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzQNzscPC/5W0S2y6e/zudtD8W7uyT+JqOosYf+h760=;
        b=gAwq5mW2rZ1H3pXcrtfReWZIgha2+m+XDYqIHeRIkeqyGaj4OoFQFmsBoKZXsRa2F2
         SHDFHKeHpqpv3Sqhi/M5N6IK5vco8h9tOHnBoWQJdSAtvMOYlLEEofKD81b1QgBkHD05
         UO4RADaKlz1nhWWirq/gZwwkgxvSAwGLB4DKLmQ24htq13lbacItd2Y27s6MPzgeOcWV
         OMCC3FfpRHHPDNYLIz28TSAPK+7ENjOj4WocHHQaxWV7n+ex/KHHeba/YH57HQTobsse
         K5wv5GGOZHANGG+kuYnUoUIvFdSLD49hmOkO2sPhahky4R1kuZsaHSbxD5IC+CDPCaOG
         vNGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKxnqMdsF0snj+njx0ZTr7QSpR6kKLY0wDXGbuygHsiPyB25wqDKizmlzqQrh6LzrmYnfxk59mEq12RAWlTfHivOVVv6mppnwqDQ==
X-Gm-Message-State: AOJu0YwFhwObi9jsMTL8j0fM7qkAxjsszvKYNbkMk0D2AXqmz7pFeAGM
	47E+GDIbIxZtG04syrv8nJNN/5tywhvKe6X/m1d7823tja4YknO6QzAfKIaCxccnw6JLdg+6fXD
	iW8x0T6tomY0qai0A+LFAWyQ4Iu95RhZHBKxkog==
X-Google-Smtp-Source: AGHT+IFWt9csUbF6rdhUA308re3cw714GiuH3rgl9HYzJ9A8Ue2Wv0YkRUWpPDVM8TxawqhSypKCCP0CB/OMjaYSqPw=
X-Received: by 2002:a0d:e2c9:0:b0:618:8b6c:6c1b with SMTP id
 l192-20020a0de2c9000000b006188b6c6c1bmr1824030ywe.4.1714724962750; Fri, 03
 May 2024 01:29:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240424185039.1707812-1-opendmb@gmail.com> <171411680836.6435.15788506275238936215.b4-ty@linaro.org>
In-Reply-To: <171411680836.6435.15788506275238936215.b4-ty@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 3 May 2024 10:29:11 +0200
Message-ID: <CACRpkdaBTwhmzs5guoBEqkvHrrowD8+zmSsHmFroxr7a5CCc9g@mail.gmail.com>
Subject: Re: [PATCH 0/3] gpio: brcmstb: add support for gpio-ranges
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Doug Berger <opendmb@gmail.com>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Phil Elwell <phil@raspberrypi.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 9:33=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> [2/3] gpio: of: support gpio-ranges for multiple gpiochip devices
>       commit: e818cd3c8a345c046edff00b5ad0be4d39f7e4d4

I'm not sure this is a good idea. To me it looks like the commit violates
the device tree bindings, which says offsets are on the local GPIO chip
and turn them into offsets in the Linux GPIO numberspace.

Yours,
Linus Walleij

