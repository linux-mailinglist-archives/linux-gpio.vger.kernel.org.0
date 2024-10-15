Return-Path: <linux-gpio+bounces-11390-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F7999FAEB
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 00:07:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C33991C20BB4
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 22:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58BF91D63DA;
	Tue, 15 Oct 2024 22:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F3pzaNih"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB041B85CD
	for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 22:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729030022; cv=none; b=HaTHJVgnvv87vt2YEJ/BA3Rh9GSE31RRDt6uc0rhexDQe9NH8HPIXvkAosIrY6qwNSxr0Q2Pe1bmFQSNataynuRWHcKq8L09dIhXgEnQ5x59DfCsBOoTSX0qTgUMCVbPnC+63tw+PHwr5f0AoxuS0WTjoKoBOJtqADuQOcX2RWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729030022; c=relaxed/simple;
	bh=8pjgUnj2wUxiv+ZEhs4guDnzJ2SvwMR/Pm0VIaPIRWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e4qIiFslDPTUFr0WSMI66gqvcd6PG0duGmCkO97fpVFK+/GsLgsgIYV5q6DNXlH8BSyHW4ktjLOtRQ+9X02TsS1jv/7X7J6T42GoBfveKhKj9qOpQ4v66LJ/bAsgRas6BfGqHowYartGGjmT49TQnsvoyVNZ0gT5GHPZ/gb3Xik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F3pzaNih; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fb3110b964so49383901fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 15:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729030018; x=1729634818; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pjgUnj2wUxiv+ZEhs4guDnzJ2SvwMR/Pm0VIaPIRWc=;
        b=F3pzaNihtDtk7PPx9Ho/xI0GR7GlzhmOfsnAfk5RsOAjjiicurixp40s77Nna1PBz4
         7MdcNZNqXb2unF5Tk/Nc2CXw3IWaeEQd9EUSXhz1aCsUj8WLuWRzyiHVTaEufwQZFYYo
         CuSRgx4Wxs5NPzczp0Tu6GUf5i+CdtkzsMr3DTxnNDbNOe37tWla3VYHp7ki5NZStI9H
         aCaawtrgG9hXtCrRcvy8bxP8FoOsqQEIJJWdheOhtiZXRkZcc6eo2s4Avy+SD3B+j78U
         2oNTzFiFSwdvMwxaL1Uh53aGRuNxXczVrnvkD20LWBZPgRK6VzCuuB1CWsJEDE4yjVLv
         /VVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729030018; x=1729634818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pjgUnj2wUxiv+ZEhs4guDnzJ2SvwMR/Pm0VIaPIRWc=;
        b=PpJA9IleeFEncNHj+XGhI6DqjkjSZGSnkLpgr7lCgeg3DfkX7eCZqv4Eg2f9eyAag/
         bD3578u2dNWJVhFlcYzGSIWt4zj+3ZpD3nV2J4yHpdZoggYNp5KjNN3qyOdikYDDQ++3
         YjPwKb0fgksKsTASZyjvNcloNtUxnLIVStNalMGXFcovQYT+Cz6vrvF1wQppMToLWeOU
         ytI58ojxia9yfoPp8ToStuwLy0WDTo/LoVtepOg5ff+ecvQxG/cRuDMzRbT05gEqdlIe
         3qm7fsMH8fyhFZ4D+mvQ0YCDQCRBGNzlxZcqP1UjcCuMUNBm73lVIdzZ36fwGpRcAXMF
         ByGA==
X-Forwarded-Encrypted: i=1; AJvYcCVprUrWlvFy70JVGk0ILKbX0Jo3DuSToWkADEdc7kGJ0Ws2lxITOWV9eRxXmKiKLzkvHHivpCOP2MHN@vger.kernel.org
X-Gm-Message-State: AOJu0YxYXhDy9skPyewTX6mX+H3QPYVUx2P3SbTzvzr8ASuZxo/qy5AC
	In8gHPDJG0jxGc8rzde+DwstyNfe9mCe29PaL+gOtK5rlFkamDU73/l7L+Xc5TSoFLfP2ge7GJb
	sEAzWHWAnA0fF3eiLGok6MbmCpi8iBAewDWItDA==
X-Google-Smtp-Source: AGHT+IHrewx2uW2O1wX1aY++a3xqOQG1Pr1rX9mO0IID1XuNhMOh/EDpRoDGq5POidQ1Sfd1Dv+NRfeCn4ylE3MZrOY=
X-Received: by 2002:a2e:d09:0:b0:2fa:f5f1:2539 with SMTP id
 38308e7fff4ca-2fb3f2472a7mr48758161fa.24.1729030017817; Tue, 15 Oct 2024
 15:06:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015065848.29429-1-krzysztof.kozlowski@linaro.org> <20241015065848.29429-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241015065848.29429-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2024 00:06:47 +0200
Message-ID: <CACRpkdbLZwLEWBjF7KPX9pDAVseujHF6_ytD9558s1B-p0M1sg@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: samsung: Add missing constraint
 for Exynos8895 interrupts
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Jaewon Kim <jaewon02.kim@samsung.com>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Igor Belwon <igor.belwon@mentallysanemainliners.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 8:58=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Expect only one interrupt on Exynos8895 wake-up pin controller.
>
> Fixes: e2d58d1e1c61 ("dt-bindings: pinctrl: samsung: add exynos8895-wakeu=
p-eint compatible")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

