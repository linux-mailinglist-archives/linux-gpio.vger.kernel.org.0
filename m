Return-Path: <linux-gpio+bounces-14842-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF955A1234A
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 12:56:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C47973AE938
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 11:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F8BD29A5;
	Wed, 15 Jan 2025 11:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aCiZcSd4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1350C2475DB
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2025 11:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736941990; cv=none; b=EiBfkRN0vsmOeQ+zKGC1QwWx/DDYIfdjeq+DZZYU/rbAHYrQP7w9dHu5o5CX7kUvd0QAsqssqwtS2yqr9m6nUdNDdSJQ3nD68CyOfZmk3tV/f0RjWUfn7ivBVQ+WxpxZGUE8jWBoQyr3dLYIUuu5PzPp7zlPxU+0cXoZHL9K20E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736941990; c=relaxed/simple;
	bh=9PW1TOdF77J44g5RTKZ2+cdf9uyr6dz/SQcOrpc6uxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cz6EO+a5T2oUVWKAjZ46TjVHPBJBHK4N8C+lS2ziFCmwNFyVZ4evZoAHHlVPmhhIJD7at5X6Gd8B0nQ/JRkRiR2l9kGg3aRz6ELQVS2+tmBPcxHkKX9jiRUDMiXD/DE/qPGHi99gmH8tQuwUGS6AnvzgRuV0Uh7q1fGhApIMbmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aCiZcSd4; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5401c52000dso6734046e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2025 03:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736941987; x=1737546787; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvqSWtzGtHPP8eGp+zVA1xgjOnLlbFcSarz6cYFQfDM=;
        b=aCiZcSd4mmFeg+SaplTCvASHTJZM3iOGsKWxkDCGGvDgvpnMmRtL5+p9yZuGUrRJzQ
         s0fnH6TJhc9pNxbzGLtafQPYwEgWxP/4eLvNcpkXsCxE7oXoyoMWu643mjaiRUdZ8ywC
         a5ITdZ6RF3XQ5YjpCWJDEEMCOyajAesx0xNa9h5qEK8RCVaTakMyhiADKYAkTOopKQNK
         BIn4q9m0e2RHO93RUFfdsipaHRnfRNuIGK4m04q1d+L7xCGE2phLCrdCjJMPbL3Ncc4x
         Xqx5AyXa6LX8XVJvrPkXsGGCAIszuwoukkIChUFcYPCWGuoUFvLsSHQTt6BioarCHtHi
         4/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736941987; x=1737546787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yvqSWtzGtHPP8eGp+zVA1xgjOnLlbFcSarz6cYFQfDM=;
        b=E2iasb3Og56esS4OPYF9Lv8PyyLvVB1o2iJHklQenKG5YBRp3bmWdtysuwNt6Hq1OV
         ahpe2zLNEDOTfxBj0nkJidvN2W0ISmXWagmntpmE/SL0iQmwSJLCv/SijVQaoi7Mgduw
         uHwF2yih3GVR3W1mjf8tv4MptmVZQfjEApAmzKhaCfqsD2QD+y/1ctkK0ez4MI5RRwA7
         amMBTjJfJo8pHQmd9qKvc5aZpzJg2pRYcKecWtHks0QLy6DyTvV+JZJFpVV/cdWcY5ZY
         WmkMT3AXq/zdjxx7JHovjxrNctCGyMAGsJwtO4t5JFiJVNhlWweiOpeTJnYGzp6O1lBb
         sPng==
X-Forwarded-Encrypted: i=1; AJvYcCXfi3vwAIOlfVbziGQOSU+DWGU1KH/+tntf9sw8Yi73wilf/YATecgfwPmu9V7C3Jx/IjxqnhrY+1jq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7FB0H+EaP0YrfGXJ/RCrmu3GbI3VZ6sWqLONpJfmJk63xocEi
	MTu6OwbpVd5RwF8QNwD69u1HxzhnVtfk6l1dKRBFoS5EBB8VOQXxN4rd5WxMpCKPFcJL8GHddc8
	KPXL7ARRRQ7dmn5YCybc70O5H8otwe63W+H4EKA==
X-Gm-Gg: ASbGncvXGivB2N7JQi8lzz/8KXqczNtc1HpdhEPlZ74hr/w1NR0qSTsldsZn2BmTW0X
	3p/kluY3Jb91m8SZI+qJrJAr/8+zmX+sLj1n9yg==
X-Google-Smtp-Source: AGHT+IGBlXrCMYgYKLgZmDqCoCkzk9zXGTEbjg0n3d9TmJW2cjKGPCuhqJcY6YuLhBfY419BlW8MYE5VzPIfrs+M4Z4=
X-Received: by 2002:a05:6512:ba5:b0:542:a73d:a39c with SMTP id
 2adb3069b0e04-542a73da516mr2355986e87.49.1736941987038; Wed, 15 Jan 2025
 03:53:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114203602.1013275-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250114203602.1013275-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Jan 2025 12:52:55 +0100
X-Gm-Features: AbW1kvZ-ZJDljU7xDZeyhECu0xIb2cb416ZbrOmY5XJEA2ldhLke2kjbohdh8UU
Message-ID: <CACRpkdYPSprYwCz-Qk8a0CqEeec=HVV1AwgVbRDyv=Vk323wcg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Use str_enable_disable-like helpers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Bjorn Andersson <andersson@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 9:36=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied!

Yours,
Linus Walleij

