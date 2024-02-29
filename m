Return-Path: <linux-gpio+bounces-3931-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D799986C54D
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 10:33:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 159571C21464
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 09:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2EFF5D90F;
	Thu, 29 Feb 2024 09:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nFkqfJvQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099AE5B5D8
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 09:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709199196; cv=none; b=fjPMK+DPveCS1BhhMCUW1PLxTMhstfKkD5QgTdBOaeyaGzgWNyg61mvQ+gr6sE/7Cgg9fTpumZHqdrY9t9DCZLojwS3wM7lfZ0vR06o9youB9RBdWLFLZhmPfvoqmbfix2e+mgR7cmDao3Qlku+ER0aWNzRoCMqQMcMU+mMapDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709199196; c=relaxed/simple;
	bh=TA5XDR0sixwyfoYxqxJ3AVyk4Nya6rVcdVMTi766fKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fr1sVAt40k4xDkdbjLU5T0tRzdrB9Unsp+sXH+MUsIvbbxkZAIaI6x7vkwiXz/weuSRvj8e+WduqBAKo02KyOz+E6MWvfoaoWIF+7yblD8rPuAd9lyzYcrsvVHpvKxxuV/4p47eWeeZ6geanvF4MxEUCk3eblLFkDqkOti+lUYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nFkqfJvQ; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dcc73148611so771263276.3
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 01:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709199194; x=1709803994; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TA5XDR0sixwyfoYxqxJ3AVyk4Nya6rVcdVMTi766fKQ=;
        b=nFkqfJvQwFs+cxOrekeldas6aoDkkenIwcmU6e7vjZu9qZ/Xt01YdsdMlX5PJE+wF1
         FKC9RHavdw7abnQhAQF9nF9cqLj5LuKrhCLGBUIluqeXWrIPqbeiV8COJ6eQHfaYiJi/
         /e5g+q92Iz1j5AxoHXRfXlsxBlWEfqZEmNzwJiC4b21+9Egwx7i//D7rwHH8Fo12lING
         HqlUsg7fIMUIHrpFhUCOgvnpRmlk/jurq5+XvQwktDfwnOkBTfeoKVMO4YHE25s/vYW/
         OYub1WhyeV8XYVG/vewgNd7EHn55TihvNMg5TTXL2FXq9/ekgqnNJw4Ube2x15649p0K
         HPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709199194; x=1709803994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TA5XDR0sixwyfoYxqxJ3AVyk4Nya6rVcdVMTi766fKQ=;
        b=o1uTA6XoI2OnAfqGaz4goUcN/OIZKlNLPcm4ZXSzJhqpMEXQoOyywXhTIGC4vhBeOF
         J/dicZH8tOb8gzyib4oQ8AF90wGhEpFZ16Ik3owojjMQCS+pzffjwSnWfAQ7odLm3LlM
         d6yq/fr2sZ+mwof3aIM4i+Ja9E9y+Rv87fg/FnVA7X+DVQPX3iSWo0Fo7C4JOFyBGLZc
         F1DS6wCUW8SEu5pW/A6e/O+Exn0DjoPR6rU4+OaqmqaVqD2lLhPQJwi5pbeMjOPDoP95
         3WvxF/8LfmNknhLBanKKyDPfwBGycVLQZqW6NkIF2Mk9r5kyBbGx2BuzgFqXVAt+ADt4
         aMtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVy6aDaCIRrbLc05LIz35awZnpNYC3bakgBCZe9jbdOxPgOlRp4BFdRTR5vuMlPCCfszIWLl8prp6vVzrH24IHo2VSSnkHxzTHhrQ==
X-Gm-Message-State: AOJu0YwAm0YunWcEeNMBL26oUrgPX9L0sBW0ZST/AhaBk9HBQc7uIGWk
	zEVDtiLlp3Ml/RzCcnzl8Y/Pa6ZRDqRaKDgXQq6Je1w9N9UIGEOSDoU3bl96uOy0Zg7Ca+neL2t
	6rq+Od/3Rd1Y35KTYKHiGqYeTiJZ+r15rsn5dWQ==
X-Google-Smtp-Source: AGHT+IFJx7qNkajaqQQOEZz9bg4d/0XSAClSsgSr7+DWG04FeqoP5n/XZvXvx+LASciVRHXOSFjzxgkNPnaVjJuZjkE=
X-Received: by 2002:a5b:f05:0:b0:dcd:aee6:fa9 with SMTP id x5-20020a5b0f05000000b00dcdaee60fa9mr1802025ybr.53.1709199194095;
 Thu, 29 Feb 2024 01:33:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-19-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-19-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:33:03 +0100
Message-ID: <CACRpkdboVcO2+RT5r+FkJ6t-Uru3vrwOodRPn+vmBvv7LFtM1A@mail.gmail.com>
Subject: Re: [PATCH v2 19/30] gpio: nomadik: request dynamic ID allocation
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 12:28=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boot=
lin.com> wrote:

> Move away from statically allocated GPIO IDs. Switch to dynamic ID
> allocation. Static IDs are deprecated because they cause issues when
> multiple GPIO controllers are to be found on the same platform.
>
> Add a bit of complexity to do pin number -> GPIO chip + offset.
> Previously, bank number and offsets were retrieved using division and
> remainder (bank size being constant 32). Now, to get the pin number
> matching a bank base, we must know the sum of ngpios of previous banks.
> This is done in find_nmk_gpio_from_pin() which also exposes the offset
> inside the bank.
>
> Also remove the assumption that bank sizes are constant. Instead of
> using NMK_GPIO_PER_CHIP as bank size, use nmk_gpio_chips[i]->ngpio.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Patch applied!

Yours,
Linus Walleij

