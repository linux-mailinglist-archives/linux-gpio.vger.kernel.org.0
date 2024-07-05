Return-Path: <linux-gpio+bounces-8068-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D34E1928573
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2024 11:50:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 892B11F22554
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2024 09:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9D5146A8C;
	Fri,  5 Jul 2024 09:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DBnLpLq0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694B5145B24
	for <linux-gpio@vger.kernel.org>; Fri,  5 Jul 2024 09:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720173025; cv=none; b=kmJUo5J/7vzGcXHuducEh2q9yes8gXYdqU6OdwcTrMMh5dl1T2U4wxg2f+VC+p+q1jeB2cN5DmI05SfP9BImi79UdK1O4jFITZ4M4YFiWVI000ui4eXQMNk43BMNr518Od45ML3jG+jNz+HrQLWPziAKIydQaCc++yzkEJkTb18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720173025; c=relaxed/simple;
	bh=d5wcdPWEyGn21x2VTQSp5n+O/1DXT3eXHWLqHh4P8rM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CeDFBWRcaKNqCiueeIaLNdf65iRrqYgXdF7XfGaQNQn2KGTeN19SvSM+FVr7IkOGuHoEBQkpRR2tA2lDL+YmiPhAvl4h32tWx+sp6IxY2iuQLexLRLrzf66feLR6HOZoUuiH/bSvuBhDd5Sa9rDNfh+8whYrPhV1wpelMnjfdo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DBnLpLq0; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52ea8320d48so99314e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 05 Jul 2024 02:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173022; x=1720777822; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9HMrCTqfqHM+5huN0YwcHxZmMO2Nm0CrRXiR6wyo0nI=;
        b=DBnLpLq0VnwZ3ZUT1pZtEKYorpK0GBbTeMmDjRBo84nFVWzYzl73NX8iIBB41ysJm1
         h9ABguJV2ur5fj67hv29aDSnqqfwxSePOqPPR5/S84G/7iF43d6QJpOOoWnvP0wyysNs
         wB+O3z6dfQdm3rN+xoaiIDWpuKvd7hnJmhIRSfHGP8PPMDOKD5h8bA5dUkKYbyn+FShf
         eh8a5KG7lSr0jR6hAXb6dP4NX1/WWg4Pjz0xmulLAHUB+xhBTdkTpbFpGLHPbQ3rzGy3
         JA8p3iWpcJTrwkUbvtj4KqXHTuH+EQnP9o3yv/I8WpYxYGj35/BVPLzPi1pbKjGGSbFR
         9ZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173022; x=1720777822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9HMrCTqfqHM+5huN0YwcHxZmMO2Nm0CrRXiR6wyo0nI=;
        b=CU39/+fe+Zpt1mnAyiNgaTsv7GwfJdSzG22cHJuyiKgbKMfO1PAUQHNF/WJrWHWyl3
         5L8z4ycVJR+C34HHb/4bZ8CbZbrPClONUrIFdNCU/rCMXSDCVwjl1YUApK1tZ6UxLvLo
         YcT1eqSBBHIEyDk7R6C4S2E1YzD1nMB4Ho9/eZKp7V+NiT3iSNtSshf8zyFBCBFLaj7h
         hejQez5Jhx1B2rLxrwyD1N2WlurCtSRv99BCTPzIUTBtkN83iqS0mJ1Tq1kZI7zpI2dq
         RahWN78sEd4FI8wLvgta47Plg5HPqdaAvV0r/N4LseaeVzQIJAmUBEV6L+PoAD2Hao2R
         BYMA==
X-Forwarded-Encrypted: i=1; AJvYcCXGhdZg1W5t7D5sFkiZGnhLTmSggYCSBHc+JxdlenTrYwAEjrhs5mqWjDgPDHnX4Q/YmIapH2ymVqdtnOOigs4OqCXJcXj659P0MA==
X-Gm-Message-State: AOJu0YzCd8Zwab3IA/i17UdnV5XhRtDhrpizaAQgIcea/ltzvAibrIU1
	fu+MYZGylhGZHGsD/lR1sCGLsQCpqb94d7GRyxthKY8mD2c8jSFutpLp9C5YwyoUd8DSm5YIqei
	pj4lPkuVzGEDMkZDL6KJSgp408Xh8qVXJtf738g==
X-Google-Smtp-Source: AGHT+IFGdMv9mOZcwNG0nGSSpL7siCh/sfgLJr6Xwf7iux7ef6YcjMqCZdysGSFZxujFPIToDjIeInlz7nhm/TgKK3s=
X-Received: by 2002:a05:6512:3a8c:b0:52b:c1cf:cecb with SMTP id
 2adb3069b0e04-52ea0e3a688mr1564316e87.24.1720173021517; Fri, 05 Jul 2024
 02:50:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <IA1PR20MB49530F0476B98DBB835B344FBBDE2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB49530D9BC6C8011B730433C2BBDE2@IA1PR20MB4953.namprd20.prod.outlook.com>
In-Reply-To: <IA1PR20MB49530D9BC6C8011B730433C2BBDE2@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 5 Jul 2024 11:50:09 +0200
Message-ID: <CACRpkdajN7RjE5LOdv_SP6rR8U-vwXHXn=kZZo7thodeMem72Q@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: pinctrl: Add pinctrl for Sophgo CV1800
 series SoC.
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>, Drew Fustini <dfustini@baylibre.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Inochi,

thanks for your patch!

Some comments below:

On Thu, Jul 4, 2024 at 7:47=E2=80=AFAM Inochi Amaoto <inochiama@outlook.com=
> wrote:

> Add pinctrl support for Sophgo CV1800 series SoC.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
(...)
> +          bias-pull-up:
> +            type: boolean

description: Setting this true will result in how many Ohms of pull up
and to what voltage?

> +          bias-pull-down:
> +            type: boolean

How many Ohms by default? It's very helpful for designers writing the
device tree to know this.

> +          drive-strength:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            minimum: 0
> +            maximum: 7

0,1,  ... 7 ... units of what? What does the values represent?
7 mA? I think not. This should be in mA and parsed to any custom
values.

If you need more resolution, consider using driver-strength-microamp and
parse that value instead.

> +          input-schmitt:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            minimum: 0
> +            maximum: 7

What is this custom property? We support input-schmitt-enable
and input-schmitt-disable, if you want to add a new standard property
input-schmitt, then send a separate patch to
Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
and explain what the argument means, it should be in SI units.

For a full custom property, use sophgo, prefixes.

> +          slew-rate:
> +            enum: [ 0, 1 ]

What is slew rate 0 and 1? What does it represent?

microvolts per second how much (I don't know, just guessing)

> +          sophgo,bus-holder:
> +            description: enable bus holder

This description is a bit too little, we need to know what this thing
is and what it is
used for. If it is definied in some other DT binding then reference that fi=
le.

Yours,
Linus Walleij

