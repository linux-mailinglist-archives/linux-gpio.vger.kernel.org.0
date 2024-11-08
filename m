Return-Path: <linux-gpio+bounces-12710-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF2B9C18CF
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 10:09:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8E16B221BE
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 09:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91EA91E0DD7;
	Fri,  8 Nov 2024 09:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ke1fw9pI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A368E1E00AC
	for <linux-gpio@vger.kernel.org>; Fri,  8 Nov 2024 09:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731056964; cv=none; b=jC9OoOYMsk4PwPSRJyj8OKX/HFodUTJ6iphazr3jAnDSaYsl7S6nVeA3i96oWO/A58OcRQB5Kem8LUA2F0zR8o02DadCZhbxMTmMDq00mbe1Kvya2uMV7v45/q06Tb/DCvkSCh8oztiIBE62nWGb3TxTsuRnuoKSaFA48VfTIo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731056964; c=relaxed/simple;
	bh=FA4vkNb/mitqyAciN2f5UTCEggzC8PzDjAk9Yl3f00E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JhCb2zEW0nkZ8twWDDLg8WlUd4J0/0ctzN25n4TV1okqnhDn3rrTz+piCcKvI8lUzsAJRtfTa1OZkrWRa0fc587rBpTV40n8aAPRFXb/Hw4pgi05KsaPleuKzYv2Vs8MmglfL/TCRT9Zi1thp6mOE94cIMPERz4KHT9mFIa/66Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ke1fw9pI; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539eb97f26aso1668812e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 08 Nov 2024 01:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731056961; x=1731661761; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FA4vkNb/mitqyAciN2f5UTCEggzC8PzDjAk9Yl3f00E=;
        b=Ke1fw9pIz5UfqKUPmgbYSC5Qa8sfPp1I7nVcrq4XW2W12/DHpbfnDpygH7X0mjaSvp
         xFlIGMw2bB/qTC/ky79qW7v4QA+2wqDtbSxShDyFmk1iCkXuxQb/EpNMW2SfGglhQWYn
         La088s1PWHi62Trnac4JXAvu+ryJ6QGA1mjcrDexEicB/qlIPS+jXN/FNpOLXebxhvFN
         UZJYaWNP1EfStZclagbmRV41+O3jDcNt/BHnL0JhPJ0MHjqu5sPGFL2TCsgRjtFAL99p
         sBZVIiKcoulsMDisxHUG8Lo8s9HimEvJN2LdoOCEW7iy/4XO7TXPEOLrtStvfv9+sQhz
         7mpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731056961; x=1731661761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FA4vkNb/mitqyAciN2f5UTCEggzC8PzDjAk9Yl3f00E=;
        b=bkhAnIdqNlKZKMpK69tm9YkRqXUEdFiFkQabtdj+HFkvBthYe98p9FZbG2TkumwVk2
         PdTncDtyeulfzFvXteLuRzQ11ZLe2GQ2H0+TOsZLxBcxLRly9IklkN9zDtrv98oUEocM
         3CE6dx0S90RMiE+AQyThCl2bigysAQ4tySY4LmEs1pA6dXIvl3kOXrwLYIMnVkTJ4PXY
         7DaD4Z9loIAzZeGD6jlLYhkuaFF8vjMCQPvaSbUgQU076hCneA3cz13ji32xUP66JpDD
         SrHhy/MzdH3Mj6qR9t+cczbHNDDV4jISCTE/IGi7XF1yYaQ8O/U4vMUJ6rjt40i+6orK
         trsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2tJlS9o6bvCFvSJsOiarHKc6b3ADpAjt0eXckkUztHYGFQlNCtgc+bqd5/tkHA2ZmNdn8d22Yh2Or@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1nF0LijqO/JXerYyR3+F1xWTw9u3ubaYWA5JcMR+gjdJay/E3
	RzQIAMqvnKBqBBwJpO6Mes3KgQAn3VDjdVFAUqXylSTnfCAuyhzQ/ai2Rm2PkVr09X5abvy6qF4
	/gpW/BnSKnhsJvRErfsX/20nTQEPe5uWj0q0YjBwfYH1pQsVV
X-Google-Smtp-Source: AGHT+IHhr+fMSbLe+Spkx6S2HAMA1BNkht2ZD+kKrNtINXG0wH4E9HYyfyu1IwPxOm2Qn/Xqfjd2BS52cNcB5ulPJ58=
X-Received: by 2002:a05:651c:211f:b0:2f6:62a1:25fe with SMTP id
 38308e7fff4ca-2ff2028ea31mr8862541fa.23.1731056960773; Fri, 08 Nov 2024
 01:09:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241105064206.43626-1-hs@denx.de> <20241105064206.43626-3-hs@denx.de>
In-Reply-To: <20241105064206.43626-3-hs@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 10:09:09 +0100
Message-ID: <CACRpkdZWDZcekXBJcW7XkfrmPiQqAiECVF_S9DMcFMMgRg8qsQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: pinctrl: sx150xq: allow gpio line naming
To: Heiko Schocher <hs@denx.de>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 5, 2024 at 7:42=E2=80=AFAM Heiko Schocher <hs@denx.de> wrote:

> Adding gpio-line-names property works fine for this
> device node, but dtb check drops warning:
>
> 'gpio-line-names' does not match any of the regexes: '-cfg$', 'pinctrl-[0=
-9]+'
> from schema $id: http://devicetree.org/schemas/pinctrl/semtech,sx1501q.ya=
ml#
>
> Allow to add property gpio-line-names for this devices.
>
> Signed-off-by: Heiko Schocher <hs@denx.de>

This patch 2/3 applied for v6.13.

Yours,
Linus Walleij

