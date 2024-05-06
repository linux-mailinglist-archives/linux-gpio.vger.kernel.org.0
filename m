Return-Path: <linux-gpio+bounces-6120-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 758798BC7AC
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 08:35:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79A07B21045
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 06:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B33D45948;
	Mon,  6 May 2024 06:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gVliiaa5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B593A2D03D
	for <linux-gpio@vger.kernel.org>; Mon,  6 May 2024 06:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714977321; cv=none; b=Iz3VhNmA7ZdSmAZCfzahko/Gmn72uh0dRbiO2HhmBHdWD+smO4y5WcbymiV7HcX1AQIbfiMGEYyf5/s6cQ6Yi2/4ggxfS2svfTjVp7aUAxtM4ZPSIEKP5tpVopFZZfDA7bnFJiFJdl3DSikUmgEJX2HodDe04FTY6GEMr/Yy7mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714977321; c=relaxed/simple;
	bh=F4bCGtNldfkHhz1v+X5T6XqO5NjhSnpFKTEaXpHr2Fk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=otz/1dl3smXkLh06PTUIhOLbUO2avqOCmGy6kBQlEMstAFLSW51trhkBFy1MMUx2ft1IqSgQ8f0E3Qhd2YiUu/3muOLQtKaGNsEk3esN19LBtElmGsRQ3Q1+V4EWhNNklBJQEXtLS+aLhSdMJGwuZXMw0mNPHrFiYaHeVIZhgs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gVliiaa5; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so1402720276.1
        for <linux-gpio@vger.kernel.org>; Sun, 05 May 2024 23:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714977319; x=1715582119; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4bCGtNldfkHhz1v+X5T6XqO5NjhSnpFKTEaXpHr2Fk=;
        b=gVliiaa5VzWoV1MW3Tba4BK0HF0YSNAs+Aub7xhOvh11NyLGl6UffQVWNClL0j75Nt
         eGiL2frjRXe5VJPilODgZy0ixEtcK3+wQbxWOZyE2flA0bBVoG3k4O+2/tH3Rkp9Qll7
         rj6go0XKqXf4e9/U7GeKDnJ+OL4THmOpA43m02PZEsB9eaGrQhLh828LaDFKsu4Vw9GG
         VV4eBC9piLmxKYqN/8ZSWRMXWoXMNGwEMMOizPkpqKP2y3K2TxCmUe1M+eeyCsx+Ibxv
         aPQxP3onGAphnodZxS1pUaazOgoXWfPrRvvkfwr42RgMxvXdYeNkYZCgwF6l/4yZoBG/
         h/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714977319; x=1715582119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4bCGtNldfkHhz1v+X5T6XqO5NjhSnpFKTEaXpHr2Fk=;
        b=WjAy3+nyXzjlaKALd4/jAiT1Qx899K+5pvR9fUEz9LpFpmZyItGE0+5hq2zQNpkaey
         jDIqT13gH+R1wWfN+d+aVOnm8Z1Q/ByqMMrcE26wTJmx0zAyPw2pTmBLmMskk+pptny/
         nz3XNM4bZUfozragyMwjiokXARras1uWcoXfJp1CXoZahnUo8U1hbpPskuGhnMTeg02u
         pgZ29lNozDtV8f+bzpr371KeKpj1+dczl/8WkXI+qK94zFUAaSe7JrnJy1vjHzVZf+GN
         YkWs2bOf07oOWs3dpP/dIBz/pcDIW5zdPCpxeH8/Mg1WrGIxJhK6flZmvdS4MfJw27ve
         QS0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWf7CXxMUXV5WrlXicCGyrvPL/lXeixh/7gtS2QFC1Usq7uicOIvaG2UExistk5qkb+SLufEn0HrY8DX609PQvth0YXichOwiTHew==
X-Gm-Message-State: AOJu0YwetAeWiiTzcfRi+k/RylyFS2vwMvNOCJ/9C49UcPQM+3a3kY4O
	MIzRcoSl/S2O/ZQ8lolD3JXjTmbzf5Nc65p2zRCGdWOuHphG26kfGJhQqgX0NzM1xzH3MkQ6OiX
	+EapeEsyTQqo/4wSkYfSkJ2zRIAa06SLTtIPCYA==
X-Google-Smtp-Source: AGHT+IHwFBLDH7pB4BuNuBdkU/p+O0HvtvUwPbTtHfpWZ5KWh1FNTe4KBMhrRQUWSn6w8OSGytaKBjVYjoN6DHr3YUc=
X-Received: by 2002:a5b:e92:0:b0:deb:7eb7:c9ce with SMTP id
 z18-20020a5b0e92000000b00deb7eb7c9cemr1681261ybr.1.1714977318711; Sun, 05 May
 2024 23:35:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503111436.113089-1-yuklin.soo@starfivetech.com>
In-Reply-To: <20240503111436.113089-1-yuklin.soo@starfivetech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 May 2024 08:35:07 +0200
Message-ID: <CACRpkdbxzbNedWTpA5i-45AqPc4fA+GeBGkrjrD_OgkxMZRwXw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/7] Add Pinctrl driver for Starfive JH8100 SoC
To: Alex Soo <yuklin.soo@starfivetech.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Hal Feng <hal.feng@starfivetech.com>, 
	Ley Foon Tan <leyfoon.tan@starfivetech.com>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Drew Fustini <drew@beagleboard.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 3, 2024 at 1:14=E2=80=AFPM Alex Soo <yuklin.soo@starfivetech.co=
m> wrote:

> Starfive JH8100 SoC consists of 4 pinctrl domains - sys_east,
> sys_west, sys_gmac, and aon. This patch series adds pinctrl
> drivers for these 4 pinctrl domains and this patch series is
> depending on the JH8100 base patch series in [1] and [2].
> The relevant dt-binding documentation for each pinctrl domain has
> been updated accordingly.
>
> [1] https://lore.kernel.org/lkml/20231201121410.95298-1-jeeheng.sia@starf=
ivetech.com/
> [2] https://lore.kernel.org/lkml/20231206115000.295825-1-jeeheng.sia@star=
fivetech.com/

v3 is starting to look very nice, why is this patch set still in "RFC"?

I would like some proper review from the StarFive maintainers
at this point so we can get it finished.

Yours,
Linus Walleij

