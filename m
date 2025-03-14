Return-Path: <linux-gpio+bounces-17596-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 742B3A60E22
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 11:03:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B850F4608D2
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 10:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100741F2B90;
	Fri, 14 Mar 2025 10:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KYruhNyP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B1A1EB5D4
	for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 10:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741946565; cv=none; b=XH5VI+ir0T5COxxTsHkjbzi4UxDd7i7zGZ6+SBcc141P9yyCsxpuQMKqppO7IgHhxRYyw5pLoG9HNj4//wt8qvIR9jRURJVn49QVKZqsZX3JN+JKKCPaCejvZ/44DDm/NEbpw5vEsEN/OqibiMZAmJCdBLyw5bQWAw9jxXpe66I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741946565; c=relaxed/simple;
	bh=KgDGPJH/f2nB2c+Evt/o3RF6NVVH+v37aRKEs7m2bog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VLodn2j6K3cPzfKwl8T8JJ0X+iR8+vQcpM+31fEwgpJrYikEBiJZCdM0dft92yHqIl+4akFaoJUPcFjp2RJTu+2vSEqCgj2Q+2mAYSjUTIu9JAJDUyNV3N6IKAtEczpxSILQNSe/6E3SuL7S1zoiQaRvKKHJYAURAx8VK7mNE5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KYruhNyP; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54996d30bfbso1661589e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 03:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741946562; x=1742551362; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KgDGPJH/f2nB2c+Evt/o3RF6NVVH+v37aRKEs7m2bog=;
        b=KYruhNyPaKwtRLVdPnqf+Ie6TyzqwTQo4N2HTgolXedNUBOxIfmaUjSniS62uHIYco
         fNNvobB60kPuTx4d7M6xAqTOqsGb9WJ99v9p0wMIk8DmEpAlNly09XZDKyKF5B1N5pG8
         7xkxwQcWNpjtiQYLoFaaTjGi4nzKHueYS6S4TSnQEIf1oCpay2deW8h3KKhbNLKGadK7
         ZUmQAnCT0MaHAyFNGIg4rwR7pHFeLkoy/xbLjN697nwY6k5VB+5eR0QpexikvFTu4D6L
         1tIeUxH0Qt1phTrn4n7YbSRRBteXIHHMS1Yg0aSIp6MP0Hkk+OpqyS4o8yDTtdRsu8hD
         SYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741946562; x=1742551362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KgDGPJH/f2nB2c+Evt/o3RF6NVVH+v37aRKEs7m2bog=;
        b=vVFqJYEkK2PN7EIR9BNBKV+LrtpJFIYEaNDDiVGwD9qtwP4CMvxdW7CX0N+a28RO06
         sVKtqwxGu9WJgMxp4/xXJXQal3DIGJt7l3WLWEpPWSFbjeytjZV1X0KCagyv4fG2Bgl0
         +Gy7uyxEUe8sPJB56mmrGgFHFFllNF7NrtcDqmBdUJ4DizeRbuVMGDMZ4Q80zFIg1Ik4
         9MTWjp8Vdv8KuHWJ3WY2EmUAO6kzGP/M27CDgbQ2yYNmRpSeYuYeL7FzuvLvPy67vl6k
         WeFfLUkcDIGDu9j0jdXOq6F95TKbtsxl2Iv/9on8KGnDZECZh34LLaStBM3v6Pe79tRv
         zo8Q==
X-Forwarded-Encrypted: i=1; AJvYcCURKrnyo2ZR8ZOOQa+EpQN4f3TJ2/PJMjKgyDQ30wGK8AAEGhIl9AXRK8TjCpO8pb545e5TzBnLwY7+@vger.kernel.org
X-Gm-Message-State: AOJu0YyB0by4y0ppLQuqgaHyK/NqJm05cao9aWOe8+yz/U/zZesf1qW4
	Uz47n8d3/dMUhu/QX0MisVAErrGDZYJUHZn74SNtBAxnsDBLDz7JimOpoKdWb6trP6ihbj/9hW3
	BjuNdFBygVUbLlt1pDtOHNNSAaMMrkX3cxoz3OQ==
X-Gm-Gg: ASbGncsc6ewXsw9KXFVaVvh8pE/ssBSJCGS4fOM+pg7QrOpDMhfleLOMCJYNkszhLas
	2MZqmMCgalkzVOZb7CNStEiiMpA6SFgjUcf4NkY6iiAT7QeWLuUt/3lf8NH4TM6Ir6ujS9r1vbj
	P8YCgqaXFBLiyz/mdTWgNPfO8=
X-Google-Smtp-Source: AGHT+IEEU7fjMObFqi/KtorNaUacAgpVCp1R7kdy9gSMkZkxP5Vzr2YrX/ekX9hw0P90QrGqnfIHas94yzAS0vLKMiQ=
X-Received: by 2002:a05:6512:2823:b0:545:5a5:b69f with SMTP id
 2adb3069b0e04-549c38f542bmr532360e87.9.1741946562016; Fri, 14 Mar 2025
 03:02:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305102710.52762-1-brgl@bgdev.pl>
In-Reply-To: <20250305102710.52762-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 11:02:30 +0100
X-Gm-Features: AQ5f1JoBxpl_Z6DDGsIcNQamKwhe2gdhb1zrS5tCM67ikkg1OHhuzYaOr8bu7bg
Message-ID: <CACRpkdYOVoLBwd6N9xSSjufguXzN+9y-Et2uDAQDjYvXyJftCA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: spacemit: destroy mutex at driver detach
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 11:27=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The mutex initialized in probe() is never cleaned up. Use
> devm_mutex_init() to destroy it automatically.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patch applied!

Yours,
Linus Walleij

