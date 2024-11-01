Return-Path: <linux-gpio+bounces-12452-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1029B90B5
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 12:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23EEBB21031
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 11:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F3E19CC27;
	Fri,  1 Nov 2024 11:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KvCwlNdl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEE8196D80
	for <linux-gpio@vger.kernel.org>; Fri,  1 Nov 2024 11:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730462073; cv=none; b=qfYazhs/ogH9g6Gtz3t0m+oXB/r2NhKYvbW1yISCLriiosLWJ2reGy/MgOBgjwOEX5noJ2aCHubzXhsQID1li1jidXA8xZZVptvV2AOudgsEBPH5ODandjrWlG2DLAbpB8KWdrzHjdf8OFHg3bmUc4EdlDkfsDRPC+3p01ZJ/jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730462073; c=relaxed/simple;
	bh=VTkHIu6x6J8oDnM2EYPHGTKSx4bAvmnfjc2sBE+Lf2I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RZKihfSPscg0kDRaLWlRtghwlJFTrHWzb4vWO/oHuC5IcGTN1D4kvKf7KGghtQt0i7ecoG/97xEbZL1QtgMcZ7Wkk8VaJeCpU1Bb7JJ6FPOhMab+4QhuAqEwDS8Y0kyqdCkxqNzRa6pn9Q4sXP32O7nZOPgf+jc0MvK0GkAp/Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KvCwlNdl; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb3c3d5513so17204191fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 01 Nov 2024 04:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730462069; x=1731066869; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTkHIu6x6J8oDnM2EYPHGTKSx4bAvmnfjc2sBE+Lf2I=;
        b=KvCwlNdlZHvuAo/NQ5ntgTz2uEH4MvpJYhRtkGuJBChah7TMnK2bcJGKzICMAV4w/T
         pa4vgCG3Ap8WwjrCkmmExzda5r9G0rsbWSXPSyNdEknA3EDl4bNPtE/qXWhcea+BgN4A
         FQHWhF/OsNG8AiJvhDVHrbXaXUBXlm6jHkefkSnVJRETESexQoXHjDPLKQeCHw7ON114
         m/QLQ5EUExO2wu/A0Evc2+ix7btfJsQAmMWDYsPT1kP3izFcREiC5dOf7BvSJj/+x530
         c6LkygrZkILgtzmTVT9sT5s03GPXOCCOoH/z+dfAiEuQfzdQPZmycj5yqOobbTQWtlP7
         mEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730462069; x=1731066869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VTkHIu6x6J8oDnM2EYPHGTKSx4bAvmnfjc2sBE+Lf2I=;
        b=Lfa4Z048gJA0NOQq6PNbs5TMOPoSfq9FfaPhW/z7sW9kCGlez8Tp9UykBYA5YTS6Ex
         gsnn40tefTj4V4AE3fcGIA0Ty43Y78K1mcwiaz++T2Uxgq+NWqQaSvj0OuehSYj8P3wW
         DaCxKvem9t9vk2rxnV6CvErs2BvX8doa3BW004zMsA9sYhm/c9qHH48VOnlnENEn3hiQ
         IJaA7jIuceo+G7RgqxqewGK83uDP5ePQz48rd1CJLq4w+OZWuMhk0hGBytmN3URvBn83
         z8w9Fe5XzWk4EpQSGZkIjlP6xH0GdzsYhi1Bo+Phz02UopSl8pCA68B13gvmTh26VqLy
         JRiA==
X-Forwarded-Encrypted: i=1; AJvYcCWJnjIDjzYSEmAHYaPTV2JS4oY6msMEx5penpuPY7HqIytSfEkpTHuEAI6R5ftjCbtLtnMyMoVTG6tP@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj2UDfA6RjRkrQbJ5uUeQ+g89ElUkJjY63mCniU92/dD84aTxs
	FsLfiYBCWovOR3zhJGXgndysFWUcKr4eaO63/REhjsdtRFdDluyvg4MUc1DTSJrJrWTd6+K6Cek
	a7M+sHEQDEHYKHjFOgGL1hQYrp6sxdOn1GTZhYw==
X-Google-Smtp-Source: AGHT+IElM+4cf5nJiQK/flMPFGUQS/qscWK2wONW7FVnOjF9n3NBlck/a/D8oXjerYOiHg6n+ZKlCTOw3SU28go/iqc=
X-Received: by 2002:a05:651c:154b:b0:2fb:6394:d6bd with SMTP id
 38308e7fff4ca-2fdec4e750emr31077211fa.12.1730462068876; Fri, 01 Nov 2024
 04:54:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com> <20241101080614.1070819-6-andrei.stefanescu@oss.nxp.com>
In-Reply-To: <20241101080614.1070819-6-andrei.stefanescu@oss.nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 1 Nov 2024 12:54:17 +0100
Message-ID: <CACRpkda2Ss_oy8vX6V7KK9DCvSoWxSg2R_iCourt-XReHBcpLg@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>, 
	Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Enric Balletbo <eballetb@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 9:06=E2=80=AFAM Andrei Stefanescu
<andrei.stefanescu@oss.nxp.com> wrote:

> Switch from "devm_pinctrl_register" to "devm_pinctrl_register_and_init"
> and "pinctrl_enable" since this is the recommended way.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
I assume this needs to go in with the rest of the patches.

Yours,
Linus Walleij

