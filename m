Return-Path: <linux-gpio+bounces-2897-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8E2847124
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Feb 2024 14:28:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E3D01C255B7
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Feb 2024 13:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 728C846535;
	Fri,  2 Feb 2024 13:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lF97AFde"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B882C46450
	for <linux-gpio@vger.kernel.org>; Fri,  2 Feb 2024 13:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706880508; cv=none; b=NprAe7xft2t7Xv46/BGozgLxHYGkK9uhQxr5Ps5PyUCMaKEs+bkwHmNEsAcmw4XNZaDUUozjmumhlyY4ovokpiHXXtPitW3Z5w8x1KfvYAHQlhGtDBg46+FQQI8ml6rwt8iYOYMWj3LqzpINal6ytCy90yo1QeZHx+ADOSj1dRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706880508; c=relaxed/simple;
	bh=BX/nrSJ26UNgPaQvMAOQquAxe5vot0Brx/Y75YalW60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pOIDQkHHB1HeUFJDrQDV1/ialqLR8gUukfcOgh4sSwVrMq0p+9q1YifKW5nhUMbKcEBExjO5K9XaV6Hg+c2iYWRsmRq4L2JERZqMAsiwuyk0PdfkgbWV3uRm2+jpdwDqVory0WXoGCSsweFw6MhcAb7nwD17Sm4luNPY6pEB4wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lF97AFde; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-7cedcea89a0so1020104241.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 Feb 2024 05:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706880505; x=1707485305; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qO/FJ5v1rhdzPQg4RCUr0Y1NCuRnzELZwPJgRqCWeRk=;
        b=lF97AFdebi5VgT6s2ICn1XDMBu+qSPt2ZvS2uAQJbAcX7un+FAG0qAFwmS3Zg9Bq+h
         xNYu88vMkNr+AdYQ0xH3FieFiTOjmguP1MeIKfs6supInLUpGknnKj+SZGn0gw+0Xsk8
         X46coAPOy7q5m5E2KirL5G1w87UcoaFJhHQfAzbaeVWLBqyXwr7NHtjIjEkKh42JO4J4
         ZqVOLEmf5Jo5Yb8JtvdPfvlwSBvJvrQdeB62nDSruBQTvlcUAlOEoPFaYl1Y6YpvQug8
         oOtKP3UbL0nQPS0MymVNvdxDw3zCVzcoCdicMmCa7oYuZ9NGuu/xEteecMLsD2ndirhS
         MTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706880505; x=1707485305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qO/FJ5v1rhdzPQg4RCUr0Y1NCuRnzELZwPJgRqCWeRk=;
        b=O729PvvbakOKt+bHNpp9hCeKaVoneONK2yI4SSdgLn+LrCBsFTPOHxcZlArhk3G15+
         2u4SDLLk/Kw1Gh257r4UR+nMx2vKtf8CGhiRq3zDNe6ZZg3WvgMc54jWDQTDN2B9YNO8
         3FEB0iP+YsMIXFevbXQ5kxucNj96+KVUG0xNF4A4mpiFl88qF2tnqHPSlfi/uDL+9jUB
         C2JRR9LF5vW1IzL8Gs+oowlVaVXl6QmQbh7ASrLlxQ+QD/ccPaU4iRWQwStB4bIyy8lN
         uo9ksN7xHhxO8kmU54KQqcBTrelLcucGSrHHgP04d5ZDK90V1AJaf4APX0h/fSWHf2/J
         jX5Q==
X-Gm-Message-State: AOJu0Yyw8KDVPhloQFZSs6qFt/TppeOdP1fxi6COK6uFujl5BjUMzvgM
	dl0ldWYioTGyGZZmgIGyupJFwVxbCxjQHGboukvPQG6/GgTkinw1yKZrCpjxzHN/gOvq3jA/0HI
	5iGsCiysz6dsuUAIR6+vBvxFUvQLro/oJGlzITQ==
X-Google-Smtp-Source: AGHT+IHZ2OgpK/144aZ4nYRNPd7uvKRQuVZ+GoPHmVFPyxjOQJaAcA1NuPFWo3/20ruLewLjIGuHaxd3yQReokZhECc=
X-Received: by 2002:a67:e94c:0:b0:46d:5aa:2470 with SMTP id
 p12-20020a67e94c000000b0046d05aa2470mr1022687vso.30.1706880505594; Fri, 02
 Feb 2024 05:28:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c5681eb5d28641d9b51ac2066b56b52d23defd85.1706789728.git.geert+renesas@glider.be>
In-Reply-To: <c5681eb5d28641d9b51ac2066b56b52d23defd85.1706789728.git.geert+renesas@glider.be>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 2 Feb 2024 14:28:14 +0100
Message-ID: <CAMRc=Md=LLtxV-P4VWTvs9gem9FLvAnz+BUjLrZdaS2GOh+Dcg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: renesas,rcar-gpio: Add r8a779h0 support
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 1, 2024 at 1:16=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Document support for GPIO controller blocks in the Renesas R-Car V4M
> (R8A779H0) SoC.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yam=
l b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
> index aa424e2b95f87a51..cc7a950a6030999e 100644
> --- a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
> @@ -53,6 +53,7 @@ properties:
>                - renesas,gpio-r8a779a0     # R-Car V3U
>                - renesas,gpio-r8a779f0     # R-Car S4-8
>                - renesas,gpio-r8a779g0     # R-Car V4H
> +              - renesas,gpio-r8a779h0     # R-Car V4M
>            - const: renesas,rcar-gen4-gpio # R-Car Gen4
>
>    reg:
> --
> 2.34.1
>

Applied, thanks!

Bart

