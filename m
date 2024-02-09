Return-Path: <linux-gpio+bounces-3139-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC0884F5C6
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Feb 2024 14:25:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF8321C227AA
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Feb 2024 13:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B9EF381AD;
	Fri,  9 Feb 2024 13:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eGKaKcTO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032D93771E
	for <linux-gpio@vger.kernel.org>; Fri,  9 Feb 2024 13:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707485142; cv=none; b=sMV3P3TOoreFVJhEqcf3Vv8OhV6QEo2xaM/LUEKcmzHfRPeQoRbMQgzdRRTY8Bt+TphsiHedFAK9tE9ILq9I5MLPf6krFJya1H+QN7d/Njl3/3L/UYl+kaOj2HKPEvoty2SXCpKaLlRMJYNTKP/36yYqB5VQ2rkQbi4zFO6pEk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707485142; c=relaxed/simple;
	bh=IRmUxOo8xpxTnzyDJCNyfLb+z4mUKnik1Xz78qZ/PLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h/+VAihOQj+HdMGCEO6kRAi81kb+MxfwAPKft9XfM4sOnJoO10Av5Kt2BOV/8vvjMHZbTikhZaKIUEhIoAa4/auOBi2ljO3arvxH8FYVB1XoR29lTT0zyaqssAnWO7a6t9RFGxrrnz2yScB9JUxkwqxHieASEcSD0ElMv5wi7h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eGKaKcTO; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-60492003050so9934017b3.0
        for <linux-gpio@vger.kernel.org>; Fri, 09 Feb 2024 05:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707485139; x=1708089939; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IRmUxOo8xpxTnzyDJCNyfLb+z4mUKnik1Xz78qZ/PLk=;
        b=eGKaKcTOx56l8syxpmNdORtvfXee5tlq8LQKtoASetDqHFT5gAAcQ3ZdrDp/N2bpOf
         A2GuCZBV7fLfOl5E3u5IK7XofXkJXx1avvcUcuPxuKfO+N4UWtZYisX7buCcM0kD/7xU
         bS7d7xBy/xtX7/T4bLwuSpcmL1JODEn1W39VebRBDvgbIzMcpOSk2A5a2l0JOA9h/Fip
         7frhE3m/eQQ7s3xdezZIcAKIkAgyTpK85KdXYSNKzI3dy7VD8sux5nBltNqJC+ofG6aY
         zOLues7a4ZQEjHWfS0EJUikRMQnCvPCAPvMu2oGf3lQ2F/hDELSrvdZJVL1wEC68YGGL
         xrbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707485139; x=1708089939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRmUxOo8xpxTnzyDJCNyfLb+z4mUKnik1Xz78qZ/PLk=;
        b=BWC54xcb605313IFRqdiJyryvF2IMbsVATpY0EIHwZMcBGoe7Bi+RMFiySnjUUpAIE
         q7ofy36wiz53yZ6iAewK0mMYrSkeYT3m0tXHO2u/+LlixmzR3gySfmk8X73dkRsvtdAx
         Svd5/bPQWHZbnuA3BKWOgskKQ/ws93JE33WXlXJVuLdS+eopEtJDXhtfAAxzV0Ls24KQ
         m6f40VkgvUsOiZuR+UJtBop+ISK7uGBjrW61qiYQzFUixPex86XaaiEfvFGUkof1lPpj
         VizNLqN5uxBgw4uSm+zcdQ8K5zs5fclCIo5+v6cT/lN5yRidkOaO/myJk2/LHqZPVORx
         ZBdw==
X-Gm-Message-State: AOJu0Yz+twv6AZMfxUeftBAfzxftTWO7K0G7hInWWm2tiEZ0t5R/45HV
	dsTJd90htp3aEldJRA2H/mhsPmPOouuEeIkKzyDniNU+zIGtwnkCMDZp/JLkXKp1GUK1apysZbC
	asUQD30CaLFoTCzFtTNIGFBWIN+M7LRUd1DVvyw==
X-Google-Smtp-Source: AGHT+IFKR6S4/G9DmrvM0mEtaFdZwkbCXlZkhaqKJtQhDFVowF0KrwEF85bMCAPU+yFzG20W3ToCXZz9/ObHLrZrmKg=
X-Received: by 2002:a81:7255:0:b0:604:9c2e:923f with SMTP id
 n82-20020a817255000000b006049c2e923fmr1452942ywc.32.1707485138749; Fri, 09
 Feb 2024 05:25:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208202704.631203-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240208202704.631203-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 9 Feb 2024 14:25:27 +0100
Message-ID: <CACRpkdaCNJ3g2gRWmcrBQ3KeXwfH7i2Xpmnm1NAgi2+ASLwMUg@mail.gmail.com>
Subject: Re: [PATCH] gpio: constify opaque pointer in gpio_device_find() match function
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 8, 2024 at 9:27=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The match function used in gpio_device_find() should not modify the
> contents of passed opaque pointer, because such modification would not
> be necessary for actual matching and it could lead to quite unreadable,
> spaghetti code.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

It's what we call a pure function, good const-correctness fix.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

