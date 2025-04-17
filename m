Return-Path: <linux-gpio+bounces-19007-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8725EA915C9
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 09:54:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E1BA1906376
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 07:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B98832222B9;
	Thu, 17 Apr 2025 07:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ok8lp1SY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3289221F30
	for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 07:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876465; cv=none; b=OtjnwSoOCiwqW6RQX7PvgkYgcuw3gbsmkDM1VWxecRO/AXUHH9jF0n51L0YEZLWlLB9bLUGWmlLFukGyn8S/dO5uF7KYGS2lGCeeJcLzcK2YLncBLoyqRxvijz8I3Mdgd3OJTA/es87QMM1hCPq4K6CMqrkphvJNOZACuQDH2EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876465; c=relaxed/simple;
	bh=E+cWvRpOzM9EstZTO323diFURQBH0IhB5f0XPl7AxQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RdYQPA2rso64DYnflJ7q+k5TFoQwAQvUkGSs+r2/W/oqekIt3vQCdip4es7jRR9MSHkOXn+BL+2UCicc852soFUf/VoRxZ4m/mTPRR8EL4E7zfyDMEUu8ODI5y+JgydNDG8dxATte+LtaiPmzjGPVefY23w5C/m27RSLAkVePY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ok8lp1SY; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3106217268dso4293641fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 00:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876462; x=1745481262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+cWvRpOzM9EstZTO323diFURQBH0IhB5f0XPl7AxQ0=;
        b=ok8lp1SYtv3BvqSo5OZDAEvky+VRxYhDD8/IgRMUI8ocqnto+ScMpPsDbUTLK7ae+I
         tgGu0K92qsXmm0iWNQg0zpCiz5Zrlw7yZiA2fFLhXqhPxpjBO0fiT/gaKXzVqMZQ+EyS
         4NN63AvS/M8jaFtLF0Lwejt3yXQ7FHkQwxejhlKUYr914gar0SczVgx9o5LdmK2hJDQL
         D4ZfihM2NnWqsOU3LoLixs4SVfxSQiq84oDopmPDpX6XLoZRwYpew+GiNZ2VxuVp83BM
         DVpfqYTRB7YRYwCN8qY8MWo2uQQK+J2BpNOlcZDn/4Ltdye3aJUivhlCmM+I69y5l5vR
         rwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876462; x=1745481262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+cWvRpOzM9EstZTO323diFURQBH0IhB5f0XPl7AxQ0=;
        b=XLtMd6ufH9VFvQ4IK5mysfCJJQKAaOKSKWWa/KKC0HM32aQ/f5IUjxMYoBwE0yBSpJ
         Kb6VFA8N4enZBLucbFVmcMmVSPugN2Df1z5tIh5OhSdZh8/FAGwOG4ETRhKexlPswOdD
         D/X1Ll1OTckAduHG9NwpZckBOXTxodEnqRiEJOcKEEc0Hznoi7w88Yg+/0X4Mg22/e+j
         nejbISWGrdWk1K1qXEq7yxf8bCTZ1PDpOxIao2VqOGvZ4wCLTqJQS9PZIRsB4IcsLb8F
         ZNZR/61Hbq9JKQijt9UlFCABHc9fVsuksqZ+hO/NDDP2Y8eydA/Mu/E/R+rEbG0uCEVl
         /Vvg==
X-Forwarded-Encrypted: i=1; AJvYcCVwtSN4zcQbzel2zBHQi2bgg824yrRjAYXO443GjkFlKifEwqCQNSZqB086ZFk9hy2LCl06D4IkdhhG@vger.kernel.org
X-Gm-Message-State: AOJu0YxZsCEknK1zKuCyahRSWgvlIhz8zx0obFAI40z+yyBcXemxJZS8
	ELjANnfqqTiie8rBdoPeWkyXchoLHq+oqKlBfWU6yACTcfklug4jQVAwKU9RzbRbinbodw1ozpB
	0Sk1DjrpSFTz08Hqk93SbRhVHDIcP3W3mX+uPhA==
X-Gm-Gg: ASbGnctG7MhtDA7DeqW+v/t2NQHaaEWhmNWenEznPJtLSe86zEnpxuUTFLYfSrK9kvh
	EYSUMqHHit2qlPXfDAqQmwTKQg1BEfRCKd6VCLPxDI0TYyW90RZ5I7qfgQ5p1OwsmD2JamtvIBX
	C/CDSbpaD8+V9MQsvNK4cjsA==
X-Google-Smtp-Source: AGHT+IHeqJeA7DLUupABa8Ud9e8YNgq5BDzGIh8Gl+Y3crjuAsmKNnt9rdUKa6hE3OKThNH3SD7pCBac4LH40fduHYA=
X-Received: by 2002:a05:651c:1027:b0:310:85ba:113a with SMTP id
 38308e7fff4ca-31085ba14b3mr8694171fa.34.1744876461879; Thu, 17 Apr 2025
 00:54:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416-aaeon-up-board-pinctrl-support-v3-0-f40776bd06ee@bootlin.com>
 <20250416-aaeon-up-board-pinctrl-support-v3-2-f40776bd06ee@bootlin.com>
In-Reply-To: <20250416-aaeon-up-board-pinctrl-support-v3-2-f40776bd06ee@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Apr 2025 09:54:10 +0200
X-Gm-Features: ATxdqUE0mas_9VNdyLCcassuReHP3an8fD_wRL7nwRWQ3qMb0NZy8AdQNgx1WVQ
Message-ID: <CACRpkdZfvxo8Xt7nkRd=e_a+q3Rg8G4BQ57JKOWqjpXQ7pRoqg@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] pinctrl: core: add devm_pinctrl_register_mappings()
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 4:08=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> Using devm_pinctrl_register_mappings(), the core can automatically
> unregister pinctrl mappings.
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

