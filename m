Return-Path: <linux-gpio+bounces-3942-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 054E686C5CF
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 10:43:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3AAB1F259B9
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 09:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF3B61663;
	Thu, 29 Feb 2024 09:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VwpAPcha"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4062C60DD8
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 09:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709199783; cv=none; b=MlCymh9ryFrwdPBuolZdcrZaJaldzrLGIoevELaX+A2Us94ZI/vKLAUef8yvQwZriRD3ONvyFcN2lRNecD7M8QV9/REIFiI+m265giA6ClaUSRVyP/xT2IfUN5/KA5nK3354WrO1rFNAfEC1TFIYYJZ6FUodiTK4ijmkfFSN0bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709199783; c=relaxed/simple;
	bh=WX6ElzN18ENGeITFFDkMWABhcHlHX3NBsTlvSRXysgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mlT/tJrm67PThrsK8eyJpx6Zy5wFV6hHAPAwrnhhA1SOFXu2drwjGLm4MVVFmkRAHixHqNkC9wvZh/Isj1LZ8vAYWcBtRiwtvpleZD0/IhrC/evOKKB62P5rRXKXx+SLpPERujUsE2elb9xiEjGtyD+Ni2uENoynDNVSrtguiP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VwpAPcha; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-608e3530941so7372267b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 01:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709199779; x=1709804579; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WX6ElzN18ENGeITFFDkMWABhcHlHX3NBsTlvSRXysgY=;
        b=VwpAPcha58IVwBhOUoRrxXcCj4urcm/iMWfWwUZjGayw9A6C87UU/jo0/YS9kaMSlz
         RxQ8CrM4nRtLU48hYwDoMeTNFpYXJh+IUbvD9DFbwtnIEA7UHTwZr2PBNDvNifkGuMgK
         UCVHWJ2SnfPt7jtO+Cldq2VPS94EYrNQQn6CgcdlejoJHkMOKW8pRon3uzWonq8mRo/w
         NBL3xd2c40WKqJCz7/Oyf7auOeAgP9lyCFfbsgr7xuuYnbBMW8omDHnk3O5GB6rlgzCk
         6fhbSouQodxb/7QoUkppeH3j6k5tWfOx7QAbVGq5Un9ZzaJjtayB2Hd2/Bqsi8CZ/UuK
         Tkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709199779; x=1709804579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WX6ElzN18ENGeITFFDkMWABhcHlHX3NBsTlvSRXysgY=;
        b=H1DcgpCIKgOCSU5OaHm3r6Kc6P1+fqrf+mJ40YaRV3s38j5TD1vHgIURnozDKlB/0h
         zQQTsEI2hIjrNhP6SPilwRTUqYr7IhauOqki4Rfz5+m2T0/Mwwv40avfrS3Wv4lta+YY
         /phOvza1gv0jbvcf6YaeW0j5epUiAytSFEJFB0VhVBP0QJVkpCJ/YoONcH7kM+FD2Na/
         Zo2oy6NgSEkUxPFi59VKyVrpdWea/Ns5VKNDJu7Tlp8zlhnd2KDJojowrbvDiOfslpJP
         dFDYXB82mzIDK77dNUQudZT/M1lsOtZSgykKrSh0oq/kwcefVwvQdn4Ir2L6rTtA8o/W
         ZH+A==
X-Forwarded-Encrypted: i=1; AJvYcCVwOC7m60+0L7X5XP/CRALG/MmcNHt8FRWlWaIitv6sunCuOuHlD02Ng0JXnVzaXFudcpeF1pQlEIOZTQE1/K0uW7F5NJJQIOiFww==
X-Gm-Message-State: AOJu0Yyirdnt8CXJ8AGnnjqt8qVPQiPTZ4nnoGtJqFpw2ifkL/mUPmrW
	K1ucmftvE9S+CrHrsWznT6Ej9t02S25RWLOPsaGQzpSnIrN0IlbUlsOT0JKJKBb7Sm2iDYKzs02
	ye/EWfKJi+aAVOB7EJomzvvp+2hQ14aUi0FdLkw==
X-Google-Smtp-Source: AGHT+IGWB8ii4Rr1OBtluZ0lydmBWdI57cDGyFQbH9+5gpfG9FKxBEkZzmzb3kJFjrZ9rPeNA84QZSnk4Kq3aGP+H3s=
X-Received: by 2002:a25:b209:0:b0:dc6:9b9f:d3c0 with SMTP id
 i9-20020a25b209000000b00dc69b9fd3c0mr1735381ybj.10.1709199779367; Thu, 29 Feb
 2024 01:42:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-30-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-30-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:42:48 +0100
Message-ID: <CACRpkdbHhbxu4TX8ZnkEGA_+v2GdaYSMMgBZH6pL2a356kcS7w@mail.gmail.com>
Subject: Re: [PATCH v2 30/30] MIPS: mobileye: eyeq5: map GPIOs to pins using gpio-ranges
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 12:28=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boot=
lin.com> wrote:

> Create a mapping between the GPIO controllers and the pin controllers.
> GPIO is handled in a one-instance-per-bank manner while pinctrl is done
> with a single instance for both pin banks.
>
> See gpio-ranges documentation:
> Documentation/devicetree/bindings/gpio/gpio.txt
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

