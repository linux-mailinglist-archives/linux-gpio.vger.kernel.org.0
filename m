Return-Path: <linux-gpio+bounces-23183-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A25B0242A
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 20:53:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 943941CC3753
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 18:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB8331E491B;
	Fri, 11 Jul 2025 18:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lwgFoPz2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193331D8E07
	for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 18:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752259999; cv=none; b=NAi1uwcUPBJ5RNu9tsd5EZMp/uBOPdAsdUGrSpA5t76uYTQMB1rfKkMdl7RHMkwDZQ8c5oJNZeRVmx5MCCO7Rxi8XdU8I+nWTN9M5fUBqycLEyrYcexg43pwbnAVLlEHZJoP5dex9toaZHJyEUMcIOzmRrfRjD6p+C7K1zuSPcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752259999; c=relaxed/simple;
	bh=6oa0VmGb0K5iYELBtraMc+ym3sVQgZnaB1e6wip7Kyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kPCKbtII4+uZCRWWYd+wfC4fTQqysele+5Uxh51XXQcmp0k1Ul/iiHGdW8MJxakJVp/fAoGHntnpLMGPmffkQ4ea+Z6CUoq4wSs/wtaurGZik6bCSusPkBYCrWPkOm7KVYyr6uU7/LMscWPv5OtCY3h/9aq24NUyHHYOO3d6jtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lwgFoPz2; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e8600c87293so1937981276.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 11:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752259996; x=1752864796; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnMNvTF+R8ofXhs9BIQ7FQl/jHKBWLPO/PBptuTPHgQ=;
        b=lwgFoPz2EVHuxJIHsoIfsNZnVcYxxE1kRoZhOs417OHb3eubPlOeWTiWEsmyI8XoYS
         uwjidk62k7FV1mWq2B9sVO9eamU+Ml+4r61lV4eX2gBeJnYCmr1v803RqgGEAMQB2MSg
         0S90oLmCea4CaQSFvjnK5/mi0g22cHlkIuQ9dhnf4Ipdz6Ew20xnjXzmZn6Y+cuhATwW
         OUTzC6ZUqeRi/V/E929+DrdLPqt1JNGMjnZL9l7fjfVobB1PXpXOjQW7jb2D4q8umDZU
         0+GjgJ9Qh6+SiTYCfASAypGLUy3ak2h97GkQSBNVUTpbE9fwBvHtZXK2vqUW5hpSQZVC
         SQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752259996; x=1752864796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lnMNvTF+R8ofXhs9BIQ7FQl/jHKBWLPO/PBptuTPHgQ=;
        b=Oyq1UAKXmbUDnDQwW8JxXPkbhSyltQOdFbZ3TYjCq/hy7EzKeOzZy6OTHBnpeRQEOl
         qlKfV45MyhKeSIowoxT1l2KVkSbLdHJtDHoHA8OpfIGzddFMuO/zSKy3n/dS8w7GuTlN
         0Q2f2bxnDh1pq3Ua/RlPPy3JsQ3bHjtLITpjX6gTWhrgOmbIXNm+UDpJxTqA9jettrAA
         zMeoOxw8AbmyNW3AQHaNXoqROX+6mau188F5owH49z4Luc7DvHvfhyXsO16LVPnoK/vI
         GSyeTWjETlpTTMYenqqH9ty/TqEzLO6HEqBcUAJwFPc8gn6Zd2CuqGdVRdU0Qf58ulSU
         XNRg==
X-Forwarded-Encrypted: i=1; AJvYcCX2owJEHjCBPi0BFFGNpV5900S+tEklNfg0r2o5eUGmFtCSPj9lFJ7XkAOd3yTdSpxha7HdvkrsAUe2@vger.kernel.org
X-Gm-Message-State: AOJu0YwI6wHdke806rTvDHO7zowS1R3WyybhFyeaDSEz6RAkv+T4et0j
	3bamjTCMp+pIp+IBuqXpm1Qgn0DnMxY2QivkaIq1UKu+hjrbNafUJD1vl4OSxuVGbNhhzitZE/5
	U59XeSUGygmmPQ0Xt8jHydrHSvpj7/xWW507XCnaPhw==
X-Gm-Gg: ASbGnctyPQSOYS7Ogtor9FMGCKsEn/Nwm0uQcLpv6vrW3WNPzDO3ki4dMor6vMWyIlm
	SphzOHp2EsLN9V8BgB74jkUh49iKGQbyhuEUTnIrNOIR3mDT0j8uPQ1CPIIws+wZNu/1x+XzhJn
	tlwrzybVI9hd2sg9GPH+2jkSiJ4BfX+HtTEt9sryZcd7qu6GI3L9FQkgQ4rrEKPKef7EtXLD7s5
	wps9fzLp58ba8X8LA==
X-Google-Smtp-Source: AGHT+IHNGHaJapXfEwRUcTXNTWlTsMHXEiPIQ/b0KTpye4KQsUdp1sxBRmAZdNG++EC1bw7xLSQza58HYJgLAxUXYQU=
X-Received: by 2002:a05:690c:6282:b0:70f:87c5:5270 with SMTP id
 00721157ae682-717d5daccbfmr86777077b3.19.1752259996008; Fri, 11 Jul 2025
 11:53:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250711-hdp-upstream-v7-0-faeecf7aaee1@foss.st.com>
In-Reply-To: <20250711-hdp-upstream-v7-0-faeecf7aaee1@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 20:52:58 +0200
X-Gm-Features: Ac12FXxLjA7peUDZIWJhb4cndI_Q2FwVXxO2uVEd8E-6LJKHyzTLqNgXqkM6VhY
Message-ID: <CACRpkda9M6R_vi5FMGvo6PyThB8OJjX7PMMusHjjs5HcX0OF4g@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] Introduce HDP support for STM32MP platforms
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Antonio Borneo <antonio.borneo@foss.st.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2025 at 9:43=E2=80=AFAM Cl=C3=A9ment Le Goffic
<clement.legoffic@foss.st.com> wrote:

> Cl=C3=A9ment Le Goffic (8):
>       dt-bindings: pinctrl: stm32: Introduce HDP
>       pinctrl: stm32: Introduce HDP driver
>       MAINTAINERS: add Cl=C3=A9ment Le Goffic as STM32 HDP maintainer

The three patches applied to the pinctrl tree.

>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp13
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp15
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp25
>       ARM: dts: stm32: add alternate pinmux for HDP pin and add HDP pinct=
rl node
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp157c-dk2 b=
oard

Please apply these through the SoC tree.

Yours,
Linus Walleij

