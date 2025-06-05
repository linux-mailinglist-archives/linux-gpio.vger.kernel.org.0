Return-Path: <linux-gpio+bounces-21044-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D857BACEFEA
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 15:04:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A72EB3AD802
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 13:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83F382153C7;
	Thu,  5 Jun 2025 13:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C1VJeZ/+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84453218E91
	for <linux-gpio@vger.kernel.org>; Thu,  5 Jun 2025 13:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749128649; cv=none; b=bcsnU4BV5iclBRHgnOigHhjvHjaQQl2mGvYoSACEOnwgnSWZw+U2eRoRnFHLPzKcIu+CpCdZQjg+mcNjVKq6P7dLgWKugCFGVYrqADkcpyU/RssntCf0DSzuGry3dQsySFjsdTFEgllyWlYb1Mbbn3doD4+nvp9sTLnUFiS5lu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749128649; c=relaxed/simple;
	bh=O7dQ3m/uYmPoqyfsSUFVWBEx6l6prCA2sVcYnZrj78w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iWMbNMt2rP6D9eBcJcoABoamQ+wpNT7crmOPCTxTvRLtz0nP8Bhd0cNPeRz1zFZvWdjTgxEdSySCcqDEKs93qV6skq9SBdCUU1+QZ7+TlsP5K00xo9cH4LwTX/VTHIDVUECGdFiCyV/AqvwhVYCNuK2hwFhEIbuBiUsxmS/vNOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C1VJeZ/+; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32918fe5334so9742931fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Jun 2025 06:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749128646; x=1749733446; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTZ52CsCJSz/QeNJLPayBq/ppqiw3jdmte3lq8NK6Nk=;
        b=C1VJeZ/+J4xrKXn8eqF6PBaMHl6JwKjJcrj/vqAXV9t/U9siQdFkvxxMt0Gqi7ef2Z
         TkVa2/dBHQlm0u9FREi99lA3HiIpPIN/i78rOjp4W54BZAsNt/Ympk3ttQw2U+Xcvdmv
         mrVw6u7Rdknvy/W5+pnZu8s0B10fFUOxqjFEsj6Awg6aSU9ORelRHpHf5yadY2Nas0Nz
         IS1zmZu3gA0S1lbYyXvSO3kOyIdjMT7SvAGo+pXUyKmQ8l6Ki/uVLxjIxklrSYm3BE34
         9WhUoCNr1C6c3EWvrJTixJVeO2+Z84lTKUraoxUznX3mok5zgXoeDE5hZe96jkHqC6ns
         bKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128646; x=1749733446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aTZ52CsCJSz/QeNJLPayBq/ppqiw3jdmte3lq8NK6Nk=;
        b=hGsxkzmAb6n2U9LzRtfJzNH80GGa6wv/KDfa2xcZYAbSLp8Q3oTycbWbKCPwh1VnZl
         H3xSsrNARmtI878pRZkrXOjI7TmRY77Z9XxAiq1FsNl3zIU4+94FVglh0TjpLESZ1G8g
         WaBqJrxIWamFtU40XP4uLYvqTvR0YJGbHKTlk8Rh0CPFX4XkX7O2EjN0YdzTFrxGyrPf
         yRSzCseZczmAhtAKRxJSsT3MUwHlRKxpi/UMw9axIwp+SAMfOKNaY3mI2v4W/QK7Y8rj
         OxVWGsKFMdDqmXVicZ4RWDBrwMmPv12KO6PY7ihw1FDhtkW4hydllyIoKGfcVEsJj11r
         S4Eg==
X-Forwarded-Encrypted: i=1; AJvYcCWezD44uKGerSqw6u7FZZ0saXf8nzwCV7gAR+xX9UntZ9AUxzxhlfZCe4cPXX+XmD9Z3mrR7gAWUfMI@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Lgd9Y998Jis+OMC9fMC0tmwlQ7/GACUN3rhw1gr017SLCdCA
	n0CFTKb+NGLJ5CkUo6TUfrrxmnYaJ9/xu05cNCELi/cMTLDKiVDw89EasXGf71QMVz0CDyd/yag
	COfyPt914/Hi7zAsW0bWTBhGvtF/qxBfePhatDUWolQ==
X-Gm-Gg: ASbGnctsfeJROvtVQHGxnAFDlDEVg+TRvYnjcSP5mHKHqbihxEyd+4bfLtJmX13vr/c
	zRqknxgyhY/E36U6d2fxRk6SUbAXa9nITn5/UVyamLxzE2DVOLYasElFaWTmHOG2AvEe0KfjzXO
	WbzCU04PPjI+IKrhh+JBCPc1H2oc8WbRjK
X-Google-Smtp-Source: AGHT+IFcPULkbbdrU9YX2kszYmWTERZ0//0Le6dHomayrozyq+3I7C/+UGmesPBjV+IcBlIt/T3KkSYORg6xv8C76qs=
X-Received: by 2002:a2e:a90c:0:b0:32a:869e:4c13 with SMTP id
 38308e7fff4ca-32ac71a1ff6mr18438481fa.14.1749128645400; Thu, 05 Jun 2025
 06:04:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
In-Reply-To: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:03:54 +0200
X-Gm-Features: AX0GCFs9rU2_ZImIle5775iF8CDEkgQxBaV1si5YeNX6UMb2_fcREUrHEpczaEg
Message-ID: <CACRpkdZ2NUfcn7O7tKSFDyAr8Hni3pvpTN6QpOz7N3J+EsFdLg@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] Introduce HDP support for STM32MP platforms
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 3:33=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clement.legoffic@foss.st.com> wrote:

> Cl=C3=A9ment Le Goffic (9):
>       gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip
>       dt-bindings: pinctrl: stm32: Introduce HDP
>       pinctrl: stm32: Introduce HDP driver
>       MAINTAINERS: add Cl=C3=A9ment Le Goffic as STM32 HDP maintainer

Can I apply the driver and bindings patches 1-4 separately
from the rest of the series?

>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp13
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp15
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp25
>       ARM: dts: stm32: add alternate pinmux for HDP pin and add HDP pinct=
rl node
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp157c-dk2 b=
oard

Or does it need to be merged along with these?

Yours,
Linus Walleij

