Return-Path: <linux-gpio+bounces-21857-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1708CAE0015
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 10:41:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2C7918996C9
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 08:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B3E26462A;
	Thu, 19 Jun 2025 08:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zNCrB10v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9595E2475CB
	for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 08:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322504; cv=none; b=rzo00dM48bETnfiZHlRUYbSGbvo/1/R9N+/M6pNRtacprHKGQltBve3sdTf2cL+SVoS4OZhbnZB68YxB4b5czqX4a0unF39syhTLpp2Ma3ysHd3q4oo0NbKhmWbhN2gb92cvme66XsZFEFK4PP5KOxwWLI4krdbKKT38LdiNqKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322504; c=relaxed/simple;
	bh=n/3JI9hpwUNX1wRMtpySGbKxpzNwm/24BRDXUmlzv08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X90hLCsLRIPp/gS7trKzYbQzZZgn0h/okeK/bmPTQRTce1UamVnySJFO2dhy82xOEfMperFnoKEJx2UxEBDsXwijqSjuaUJM6bYLclBKLcIEr2oVtdoFthGEhYeEIZ93eGSxesSb/+Hom9GdXWwZjUMEak+tsjljUfMj1FHCDRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zNCrB10v; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso573994e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 01:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750322501; x=1750927301; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/3JI9hpwUNX1wRMtpySGbKxpzNwm/24BRDXUmlzv08=;
        b=zNCrB10vTbnnjpLM9SrZ7zvfJ1MMlIjC0So6wbKQbA1hpQ4zv+oSCCri3SPd/PUCPy
         hJnynzeKKl/5PfuD1pSipTuRZpdA8F+o26aXN+vYn6YUAi9F4RAnw4UYV6sfQ1IO7a+4
         JE+OcK6RbXh9NvKjszgRams/pD9C5mmr5ri+95kMpVYR+hWOf9zDPmV0YXmZaPMmn2DV
         BhbiuKdOJEE9t492VXtTkJ58v9qt55I2+kMB6ZOU7plBZXssjLvigrC4JaGT5Q9X+mGB
         SJW1RSv5zWAorcsQ7MgClmVHjqJJEnFyZPSYRzaTM5mZF4UWURGLCaFNw98MJS68+Qw6
         yjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322501; x=1750927301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n/3JI9hpwUNX1wRMtpySGbKxpzNwm/24BRDXUmlzv08=;
        b=PVpZhQBR9O44LdB3Oh73QRtrxykGsiaVb+FzR9X1HsFmwAr0Nom7oJ7T5njRvBVl0e
         iahBAuWZT++wT86+aKkawsCndVKjaYGUwHlCbfPFqUNtlnV3B/ZQV7v6XvHSm0+TOk4y
         /l9tklCs0zgqtwxApoELf1J1AXIX/FPRcz2wiPPDYwRyiRNBIZ6D2YCz9owHznOujatf
         sauxjEyhUF6yCM5hl3yTCDAPMIuZmWR8GyMuyqfRGp7W8+ptX5UAGwExte6P4t/oW+q7
         Ia95cD7fk0i6fShkRLxEugthSfExs8f2wtNYVMGoPGPL0EQxhdhrsN+e/CV2Plb3AF9Z
         RiVg==
X-Forwarded-Encrypted: i=1; AJvYcCWsjEPC/ZzCrZX6L+Oq7z23O8PY4HR9BMBwKlfQJC6vv0UaMratLLFH34nEYTns2hNDAJ3EArOrIKmb@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1AQYZ9GRhqAIW7ELHQGzrH9UoNvYaPnko7hJhgTr18XepT7Xz
	gKYBZvhXxHuVmf3iwPT1tqnOY0etrpNUaLDLVoOB4bKcSDf+ETwQ2nvAQ08Lf7e0cbJJGg5vZWQ
	bntgHPaLsx9LJcfuqKuddvz8fwlHz84Rxb8CkOWjC/w==
X-Gm-Gg: ASbGnct1jxpMjQgA1BGWKMfCX0AFSZSXmx8lG5lQ7m1cIQC+2vm8ymev6gdc92LRfE+
	19zaDB0LSogLO13HDe/xoR4EPt0gLZxFgAcqe3J2i6LRcEs3kCmeZ2WA3ksxUCV4M44tvSr6ajb
	v4qwOBIotOg1A+yU/VCwkIgirflfbEy4yvFfnacJc9MSU=
X-Google-Smtp-Source: AGHT+IHVGgFPaQG0OhPXqsCqY9LUDkKPUDQE3Jy/DgzWX341H6DxvHpFRsv8n2zH9CF8v26QIPfqbwftMAeHyo7UZV4=
X-Received: by 2002:a05:6512:b9e:b0:553:a64a:18b0 with SMTP id
 2adb3069b0e04-553b6f3ed33mr5548057e87.42.1750322500571; Thu, 19 Jun 2025
 01:41:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
 <CAMRc=MeTmwgbHv9R_=GFmjkAV4Nvc-SeSCOz1k6pnGUrF+R9Mg@mail.gmail.com>
 <CACRpkdax9ojguF1SAfiN9iZi=x3VFpCea6KnhzL3JBD9EXZepw@mail.gmail.com>
 <CAMRc=Me8KZPU_KbbifL-j74GMPSuDgmmacw9g1UEfy=zeGyZcw@mail.gmail.com>
 <CACRpkdYUr+82AKndieXm24Eg1-HY4LyfKZ9J_kTFKT1Nyyju1A@mail.gmail.com> <CAMRc=Meq9+hnmvjXnq-YUJRPOOBvAV+pjHQ25k1wgFqV30Vo=A@mail.gmail.com>
In-Reply-To: <CAMRc=Meq9+hnmvjXnq-YUJRPOOBvAV+pjHQ25k1wgFqV30Vo=A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 19 Jun 2025 10:41:29 +0200
X-Gm-Features: AX0GCFu8Dbo5pcDv8ujsp9IKLDaddp4Y2N5p47cQpThWdtIAL2mf912Bw-JLnyM
Message-ID: <CACRpkdYNRC14d-jBbJy9-0OfdXR2anUJ6osw+DWsLNPf4VymnQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Introduce HDP support for STM32MP platforms
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 9:21=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Sorry I didn't notice this one. But I see you already responded that
> you pulled my PR from today. Should I ignore it?

Yeah ignore it, let's use your PR instead.

Yours,
Linus Walleij

