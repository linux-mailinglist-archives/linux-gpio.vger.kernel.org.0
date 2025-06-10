Return-Path: <linux-gpio+bounces-21169-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13407AD35AB
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:11:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7F2718983C3
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 12:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28ABA28E59B;
	Tue, 10 Jun 2025 12:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qA8OmISY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7B428E591
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 12:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557464; cv=none; b=mPZiD/ocm1scSFlm5caEoT9kM4OE/SfJG+mKBPSbnAyNeTZCQ2rHDoEsivvLNQOkI2XD01v49kaDc3XtXx4XlNPLMLJVtlpCiE8lLjlwuO3Jd3aPqvKJwvB6WY1mjnDggx0o0CaAqgDnIBQjZZHyYLqIFLn82mMew0m9S0JBOVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557464; c=relaxed/simple;
	bh=w1Llf8EPf4z/jroevvo0GVj85/0YAeGUzCIO2oQllTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d1IrB801nMJIE5QBqRtielWH/b9fbJNbWeMuSWSsTWjRqdNE3NopckiVu9kzTDm8dG8XSEnV48WX7MmoBhNTuakxy9x+QDAHHkJyNNDEYekIXHS8xJOZolnsxqVGUz4gkQhQHrZPFOpinln00FUPC54wLJSGY4hclNzVlhe/1yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qA8OmISY; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5534f3722caso6123327e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 05:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749557461; x=1750162261; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NOuROJ72i5jBg6IZns7LWWw5bhW6PqP3nknc7q7Xb8=;
        b=qA8OmISYZhD/wD1r/7m77r5nkiZ/yepSu9M5PJdeI9QrKdqG8tEQZ5BcsjBUG9tR81
         kSHNoTSv6spY1XVsW9DWqY+dPCXr9VoU/LjX+j1C/FJitrrXQV7knzlax8BgzBTyuhZX
         skN5lUtVejn8o7EivsOyHszssiMwLoR/Boa1jjFEFKUv/v3tuKt72G0XPgJCrL8WQom8
         kM385dG5eBrRutefcIqQErfVaIINiU3km47wtKBa5as4jnf2QeSyUnobJjbaVxlFGI17
         NvRdlQg7pgULbdfdpQiMQpL/Qn49as9atSpRnus+dDjkVr8Jez6a4gdq76D6lVEBmlb2
         cSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557461; x=1750162261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+NOuROJ72i5jBg6IZns7LWWw5bhW6PqP3nknc7q7Xb8=;
        b=pBqXBGhyEoZhJytehgdf7T04Cw27eQ97H5SUSO2k+qugsNHx9gMYH3k05zf2jUgxom
         3qZJJ5OLtO60GBec1B/HE80tSwEPJTuy5tkL65zmrbeXNNQXob0VpFbvT7ECOrfPmOuV
         /k/OiZuOAVzzdyg77D7nR5R3rZcikwQ/ZGFbegfTunMao6+Ijn/ZLOurdmxp/7Q74B9i
         VyTnZQc/nCujUnbbZw2zKMNYO1SM/Iv4azNreMKMmnx0K7mlcOBCxoX78oansEmSXzKP
         RKPHuY9iQ9XtfZaf2AuD2dLNxek0GEBdOwIbE5k0EVTBgxS9QAyTsWncb6HHqZpzwPG4
         IWLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKX1xub+9S9eKdNH8E3yEOvbYaajy3qYVUHUz87gkwWTmPvIHgPsII0cYi/MZ13uaDALWOTg8wyR/Z@vger.kernel.org
X-Gm-Message-State: AOJu0YzaHNcjby890ZIyRwbm1xy+FtzseZklEh3NrGBda88o2GjJyoVH
	EBaHuFfg54miojZd9dzSgi369BG6NIB78GVduxPvPmKTpodKbjVOqSnT95lrYlcniEBUacqobdu
	Op41hV1RaIn8vzsfDfLsyFpQ9Wi9Chind/mwoej6G1A==
X-Gm-Gg: ASbGncuo3IbQWUTMSHfD0MZQitx3OrR2IOj+1NRyu7pHh/cl940ytPlkK2Dkc3MCX8K
	7QQ7suQ7hQDmQoCN3bsMl9yNsgKBYA9VHkADbRCih056RoLrYLlb+iWHMMSY+zmSB4RGMVWOTH6
	suau7iQ52to/grmBP0Xi9suJTHg2hCHV/kKALvIgnmmaw=
X-Google-Smtp-Source: AGHT+IFOaMh8nguz7KHH0YUJYEvUW0KxuIsZirmTBD11BY3isr05ce1T1ObffoEpspV/AnboQI2h1yWBLpHu5xR5+Ac=
X-Received: by 2002:a05:651c:1545:b0:32a:8bb1:d971 with SMTP id
 38308e7fff4ca-32adfc290f3mr40168071fa.18.1749557461281; Tue, 10 Jun 2025
 05:11:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527-s6-s7-pinctrl-v3-0-44f6a0451519@amlogic.com>
In-Reply-To: <20250527-s6-s7-pinctrl-v3-0-44f6a0451519@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jun 2025 14:10:49 +0200
X-Gm-Features: AX0GCFsNvqdvdVYFA3r4z4h1YT4-Cj2REHImr1bxE1u6VG-oVRcj138Ag5WMjho
Message-ID: <CACRpkdacp1YVjrjfGvHu_8Y2hq03LNwG8Yka30xMbTEwtQ_drA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Add support for Amlogic S7/S7D/S6 pinctrl
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 7:23=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> Xianwei Zhao (6):
>       dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible string for =
S7/S7D/S6
>       pinctrl: meson: a4: remove special data processing
>       pinctrl: meson: support amlogic S6/S7/S7D SoC

I have applied these three to the pin control tree for v6.17.

>       dts: arm64: amlogic: add S7 pinctrl node
>       dts: arm64: amlogic: add S7D pinctrl node
>       dts: arm64: amlogic: add S6 pinctrl node

Please funnel these through the SoC tree!

Yours,
Linus Walleij

