Return-Path: <linux-gpio+bounces-3557-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0927A85DB40
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 14:38:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80334B248CF
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 13:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61833D96B;
	Wed, 21 Feb 2024 13:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mN4Anb93"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBFC69953
	for <linux-gpio@vger.kernel.org>; Wed, 21 Feb 2024 13:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708522719; cv=none; b=UVefALSWuyqyDXWrmGgWTcKKS9cQILxhaiED1oLrFytkqoAhT5HsxZfceXTkJQfRRxHVlcG3WkN9lEzA8GtbS1NzU6LjrZAmo0IJyO8jacj9G4vEyPFggqEiJU05RfapNxOUjJIZt2XGWKlp8glgdkUvJ45W+bytDv6sXLKXR3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708522719; c=relaxed/simple;
	bh=ph2UbQgsrbuCfnh/AmINSm2tHoGX/U8LJgWyPisUXjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M4DE1Paa0nX4lTy52+s/rvu6BPtGdngHTttkXcgveTDkV+xHjEDKinsfpi3xbc7WvdCKdStus+W2AwPiErGU5MLjBBc+R6G4vY/9MrHeTLI5oPrcGyEFsVSgolp5pwQiLrwrPS7k2UAvePTRz4Q0v/i3LDlqvjWnZ+3UheOlV4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mN4Anb93; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc6d24737d7so5974062276.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Feb 2024 05:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708522717; x=1709127517; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ph2UbQgsrbuCfnh/AmINSm2tHoGX/U8LJgWyPisUXjU=;
        b=mN4Anb93TyOuMCHkH2B+0+jOratxIs0faqE6FYvN2AK5/qA5eyJ8A6bVX7hLpyztas
         KjwwFNlqUA1CILCqeQ2CmYGSbvod0HAccRXn6sWolw9/m1uXyvaSoz/m60xzep9zFmeu
         Jub4BYZvfiYqjcD1/6YRWOph5pW2T3T9Id0DdtmZx+QC1MW9r6bo+ov/veqB6PMLIWmB
         mP+LhIHiWKLuRaee6rXky7yYrQuMvR+RKOV8X2x4h3FQ+PjNGsfRKhkRpaPEtoZPaIIN
         caH1RmeYoXp2DMICeE1O6C/2fQM85uhJt6gtj2A+LPdCHhOMsGT6RTFRK7bny04CohjX
         CAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708522717; x=1709127517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ph2UbQgsrbuCfnh/AmINSm2tHoGX/U8LJgWyPisUXjU=;
        b=BvTpH+d0iT0Yc93X4HxJgOp1R+/PihYsfDHifKAROfOtYBgySHYxlmljtEvk6yCtvd
         /VATAQWIRRAHRhDgGZzvDZ4VxGUQbtaRbE9fYmQzNnn2IzCSSRbMG17PoX1xRrWhM8TR
         Rxe9ykSQwpkUknSI7PCyD8V0O8fNCQpohs/5Js3lzUlYhGlB95s8DLbzAq+RV0nPcdF/
         rA6ftXXKNfnAyDfdRxKAmaMbQ6TI93GkDYUA15PQbeiqpG+EgTKH71LO0Abds7XEx+6J
         /ZD2S1MDR+38dWWWms8iaipuBvxiLE3z+kBj2LZoUX9WVhKydpPWQfXzbgGykTsdW32Y
         DOuA==
X-Forwarded-Encrypted: i=1; AJvYcCXoH+/0l8dfe2kOhHUigt2yuw19qDtJTh9ei7udu9ia2Q4JMMdFAagjXuEVo7SJAh3EBp8diH5uZJUjk7zpQvuqQ09N5etqe1DRDw==
X-Gm-Message-State: AOJu0YxrjpwinqT/QUEv/k7OyTmTejf3B8EPFBv7CGD3QX9J61ix3R2i
	YTj/OsWy2+aTfnYIyI3eUoIOG5x66mOMQkbcyu89YIN4kxd43hs7O6dXm0E9kl8Ygr99HjMqSH2
	AmPYSnUDiycGYOObdYDHqXLqSPZL+4MzetmIolg==
X-Google-Smtp-Source: AGHT+IF2OkLRDdLse8vRcitJs8gTndLo8D9Y6JeTVVYt2QhVtGqFzHLke4WYR6iZMGxv/F5qvwz1XhINpDDxRT+71EA=
X-Received: by 2002:a25:ab06:0:b0:dc2:2e01:4ff0 with SMTP id
 u6-20020a25ab06000000b00dc22e014ff0mr15988542ybi.45.1708522716910; Wed, 21
 Feb 2024 05:38:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240212-mbly-clk-v6-0-c46fa1f93839@bootlin.com> <20240212-mbly-clk-v6-5-c46fa1f93839@bootlin.com>
In-Reply-To: <20240212-mbly-clk-v6-5-c46fa1f93839@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Feb 2024 14:38:25 +0100
Message-ID: <CACRpkdYNe=2w10uB1mUgs2Lgg1TRiSF=bOa45OH5Lcz6+G6FEg@mail.gmail.com>
Subject: Re: [PATCH v6 05/13] dt-bindings: pinctrl: mobileye,eyeq5-pinctrl:
 add bindings
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-gpio@vger.kernel.org, 
	Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 2:44=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> Add dt-schema type bindings for the Mobileye EyeQ5 pin controller.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I tried to just apply the pin control patches to the pin control tree, but =
I
can't because of all collisions in MAINTAINERS.

If you move all MAINTAINERS business to the SoC-wide patch I can
apply the pin control stuff directly, but maybe you wanna keep the
series together and merge on an all-or-nothing basis?

Yours,
Linus Walleij

