Return-Path: <linux-gpio+bounces-20107-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA98DAB5EFC
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 00:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4367C4672A1
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 22:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B196320B7F9;
	Tue, 13 May 2025 22:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uGSuCyV6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19EE20B215
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 22:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747173769; cv=none; b=twFmHxcWCOmwnccihrd86pGafMGpZbGjCNbNRx2fErz1hF2Dfescy3pb4zuIQ8M/PofLpHdH7A9ZaFPt8fp29gsy9/mBfPPdaP9MrktPBdncO8kge8FMhEvKhz3r30HjcCKKr4ZkEBhF3NPrnayBeDydfOeAAvfjFR/bW8gJZmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747173769; c=relaxed/simple;
	bh=1EAngaPc7uOdyOtINcBruD+FdbRowx/2Y1slal9XMzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WtSVexZ+fbz+oqYPeKr/9MIiPqMh18FMP0Igmo5BOKwgtiYQs49GOxTuUt81Be+vELCLsabB7E4a7tliRzTf8nR0HeOuqxjAndI6byIrdJew0rS+Udt9PmUlTm8yXnLgpueC39I0+dv1g1Z42GI8aPLEpZhdOpXEBAzFbSnQjqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uGSuCyV6; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-326ced52aa9so37778181fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 15:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747173766; x=1747778566; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OF3Y7OxM3P8Aw80IWQnBi8AWbTqWJX1OjgpSqEvS6a8=;
        b=uGSuCyV6qvuY4kVmd6bgVP0SGhvTTQEEFv/GDUKXxq49KIt6NY//cl4MMWxM8hGqey
         tLHsas5Rd0KLjqy8fB+tcTCOWK94biaj5HCGCBffyvP/DInryyMUapPHuM2rfKivT/j5
         JckKhAfCSFiIUOc+oGICQqyXuQeroMlgAQK5dylFaPj4g7zUkFluCNAUOv5mcepurwlu
         RyhaBw9uhFspiu+et8C+cys55TAWAD2/vVFnw1mA5pTXcaTVkTlkNr5HpQtUgemW8cio
         /vA7+yde8d6NN2Fk4bdxj2P8yOJOFrMeyzhTKUsgBEUcGfmlyiwUIWkO6tTcHjVXC829
         ajrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747173766; x=1747778566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OF3Y7OxM3P8Aw80IWQnBi8AWbTqWJX1OjgpSqEvS6a8=;
        b=H0FjJj9mggN0ufJhlZv+uBUgKUUK+RpBP9wwHO8LO3orG0JEJhE4qOZE4SIO4xWrbL
         GYI/5eXmwR5bBfgST75TV+fPFBt7AT5sVg+R/EzXemuHO4pXuNvwSIozNBxBdCpwK+X/
         zzZTyAGaqisXk0XprcmX5Xr6rAbFSOGdzVun9pRuA9PZKxu67KbMXKZkA7QeT2fHUyEz
         RYfTK2Gda61tHZx8HlIYx/jvxLArotz6WM+3XiRIKbN8q2VGMoFu9W8HfunW7w1Xb0vn
         63q9oeCuoSWLXDLUY7Zh+MB8/0ate7R4TQ3TP2+49HYPl8v/6Wu/4X0yd0Wj+8b+22cn
         bQQg==
X-Forwarded-Encrypted: i=1; AJvYcCWE+y56E7qTWa+Bn4bV5oVRnesUwgxdkEN8OGe6SYI0IDd7A35psPUFCFeHv6lPyzRlBjh7R6TeSW7t@vger.kernel.org
X-Gm-Message-State: AOJu0YyFaR0qn4FPFMvv5oFaw70k6ztxUykl+9q8Eq7Dc7rF+wXHskdq
	+6A4ZbEAitQtnm/PlpaaCeogx+m3DZP0W6M0gOUg3gC/yE9rcwsk8y1RxDudO3afvCW05G1kyC/
	q7ip64NG2y+EfPD4OxoFDf+5134e52BWuclAeXA==
X-Gm-Gg: ASbGncvn9snHSs0iBoD/4uy2aB2aiYDhkDr6DEoFVJX+cr03Sn17/no04aimLcq8jpA
	8PEtmHfWrcy1Rz8SEZ56TvtAPbitBcyFxinjFf3rCOAQ1yrpspmpPh+EgIrDnQ5EWQoin8kkKLt
	IaDztsIPUw6vCPPXytWIkPDg6kPie8M0S3ovOavDJbngw=
X-Google-Smtp-Source: AGHT+IFV6oM1huMeF+j8D3av0zRQp+sO6a3WETyY9TcoM8z4D0gAPRxDZ6Iruo7oYj1D+k2aLqn2jGcIPx0XlTck+IM=
X-Received: by 2002:a05:651c:30d3:b0:30d:e104:b67b with SMTP id
 38308e7fff4ca-327ed22688dmr3408491fa.38.1747173765836; Tue, 13 May 2025
 15:02:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513105941.28448-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250513105941.28448-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 14 May 2025 00:02:34 +0200
X-Gm-Features: AX0GCFvrX_aqXbESUgpoRHsXNXvkw7MLENgWNexCpBHmO_EVXfh1y4WvP_Nh-o4
Message-ID: <CACRpkda6zzroe3XbPpnrRMqbHcCsiczEQM9JW7c-hwhiV3vtNg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: drivers for v6.16
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 12:59=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089a=
c8:
>
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tag=
s/samsung-pinctrl-6.16
>
> for you to fetch changes up to a30692b4f81ba864cf880d57e9cc6cf6278a2943:
>
>   pinctrl: samsung: Add filter selection support for alive bank on gs101 =
(2025-04-08 20:57:51 +0200)

Pulled in!

Thanks Krzysztof!
Linus Walleij

