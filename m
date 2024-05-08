Return-Path: <linux-gpio+bounces-6260-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F10D28C0728
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 00:07:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DDD51C20C0A
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 22:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143D4133414;
	Wed,  8 May 2024 22:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mrJCh/vA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523DE132C38
	for <linux-gpio@vger.kernel.org>; Wed,  8 May 2024 22:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715206005; cv=none; b=ewWexzt9o7CTLPe3ekckkGSVXXZvyCe1xpqabAS9ZT9Fkj0sF2AoMQd54k+lg5OG2BsnQmFiFVoVFwp2D1+T8G6t/lGSnUE50A+qy+FCIl3h794u9Je54paRo2lB+ghrvEHR8OxZndBv8AgHL6eJ5tdfaPuvls9Tvw/O0tKZdGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715206005; c=relaxed/simple;
	bh=MYf2C+IVa2MHv22SQrK22GbmF6wjXC51pjaBmwgA4/c=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MntdLobhbk1xEvUEE1gPw5tAQ6ARryrTFdF0zpNUhCcDpV/Y4/49pstqPRUES1JDISQgN7LxnrygsRzr8eQBx7mbbJZwTtOWMs8gURRp++s9l+2GswXzEE+3SRHNg8rmFdbXsdJ3C/LUkdVLOxmpNlMp+NHEATQhqhIL2g44kIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mrJCh/vA; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-deb65b541faso315838276.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 May 2024 15:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715206003; x=1715810803; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dMHzkcCEM6WKf+0ckd7ajH+dnlQXB7OMmlnsiVH7l2Y=;
        b=mrJCh/vAvZn/GDiaThVj4tVHRhEHhCjGfbWk22fIqaVJh6N7yaIFZT81rdInfoSeb/
         GIyrVM8eaSyktetNAojuKdFjPAn6G00CyNKOqXJYPp74pWL1cK6PXdV8O+oNLPNuJlqP
         nEEBmwzpKnn13jkNHD3kxEUKs50ZcFhrp29Lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715206003; x=1715810803;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMHzkcCEM6WKf+0ckd7ajH+dnlQXB7OMmlnsiVH7l2Y=;
        b=TzF+zHoSod24G+bHE6rSQWPPhPJdQwQ3X1Tdq5LOqNvvf1bCkfbzoAg7e0K/V62uFE
         R5kQuAnmkp3i9L/pVA+hy9fFOoHGS+caVcGwNxxl7rj9qt6zO9RPNzzryTQNUlvOaKLN
         PE399JUBtoETMvv1ZTKkWolNF7Hv4S0JI3eekJVnL0WMWQTsY6fSdZm7vucZGOWBWLYA
         P8hxa1D7yC09TeaoEx3+1lgLhNB0Fm5V1uTILs/vkED4VYeWvXUAiviYApvXCvR5vNdh
         TzE4zzFX+xJOKaFUfl30UiK2PqxU23T8YM4FyquND0xne2xT7h37TEUkguqEAvNoSDVD
         72iQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoeYyCVvSyRPjdaeg1vAqTVECCE0zfvm9To8MGeywKeKHkESkjtSCB3M/PdtEzJh3ZFkgvTH2YMoQi/El/lAp7Ws13/nFM5gfd+A==
X-Gm-Message-State: AOJu0Yx07zqu3K1QyzQaujDrN/wvJFRI1lwRRZyCds+R2rdUufzmZ6Yp
	+9WXI60fqJFIW1jYoWq0SCAKm/HEcRbKYJzSn4ADUahqzyT0UGLaujp/FhQJh0TZfO5QcA4ad+r
	NMvl/kIUQAzy/H8GyFxDHP5x7pjUjgY1kY/wE
X-Google-Smtp-Source: AGHT+IEdwkrhfX0w2UniR3n9+sRy8cxE66X/Cjr3CnSlguofehS2mZBYzAz3B0TdrHNIzoagJzZ/piqfBJIMxUVv2nA=
X-Received: by 2002:a25:bf8e:0:b0:de6:80a:f7f2 with SMTP id
 3f1490d57ef6-debb9d711f0mr4319909276.28.1715206002100; Wed, 08 May 2024
 15:06:42 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 May 2024 15:06:41 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240506150830.23709-10-johan+linaro@kernel.org>
References: <20240506150830.23709-1-johan+linaro@kernel.org> <20240506150830.23709-10-johan+linaro@kernel.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 May 2024 15:06:41 -0700
Message-ID: <CAE-0n52+d4s1gJGWpiuCc1vc-rM-d-6FE3VC_qm78kNcKyrb=w@mail.gmail.com>
Subject: Re: [PATCH 09/13] pinctrl: qcom: spmi-gpio: drop broken pm8008 support
To: Bjorn Andersson <andersson@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Mark Brown <broonie@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	Satya Priya <quic_c_skakit@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Johan Hovold (2024-05-06 08:08:26)
> The SPMI GPIO driver assumes that the parent device is an SPMI device
> and accesses random data when backcasting the parent struct device
> pointer for non-SPMI devices.
>
> Fortunately this does not seem to cause any issues currently when the
> parent device is an I2C client like the PM8008, but this could change if
> the structures are reorganised (e.g. using structure randomisation).
>
> Notably the interrupt implementation is also broken for non-SPMI devices.
>
> Also note that the two GPIO pins on PM8008 are used for interrupts and
> reset so their practical use should be limited.
>
> Drop the broken GPIO support for PM8008 for now.
>
> Fixes: ea119e5a482a ("pinctrl: qcom-pmic-gpio: Add support for pm8008")
> Cc: stable@vger.kernel.org      # 5.13
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

