Return-Path: <linux-gpio+bounces-17895-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AE3A6D567
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 08:47:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20E5A168654
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 07:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F57425C719;
	Mon, 24 Mar 2025 07:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kFubLlqx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E467C17084F
	for <linux-gpio@vger.kernel.org>; Mon, 24 Mar 2025 07:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742802462; cv=none; b=HNHWOySRTXjxQ4NwsTvHpi6L+qtUoSGoYKvja5hpP4qkZ7/kDtlJ0/6vOm7YtYpdkQ47wJOMJNUNQOvSpK865CZByQsGiqkLM5Gq0Mka7zG28qKj0rubRTPHY0irSr7o+LyCSEWRvWMN9d2UX6kSgicX3peLNIad59bv2rHPp1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742802462; c=relaxed/simple;
	bh=LADn1kANv9yfbuyperCIqqOS/gvroECf2fXmlFm+UsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aRawLi4vsQ0J8wpMa+tgJ8efoIla1lyFCxgE2cu5vK0GIrYlMA1qM6CGgZ37vlkVRn5vYoZqHTk0FMcpIIHBhu5kI41k+g2fNK9WrT/4RkbRTmC13K0esMsiEbb27nlqaHLbZWjancAlxT9Kmo8FQfsalbL/SekKavaHKylL4+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kFubLlqx; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30c416cdcc0so43768981fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 24 Mar 2025 00:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742802457; x=1743407257; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LADn1kANv9yfbuyperCIqqOS/gvroECf2fXmlFm+UsU=;
        b=kFubLlqxdANp2SaBSJ2+aCPynJ9e/fXGr5+x5KsTu0KEQ5Z1rx+KrlGUENa/0QMuaH
         /5/t5mcT6gkVfaR4n3y/X4KhLEw2JF5yP0zVYJ5yn6ld+Be3LJKfWXuQ4TI1URgLrNyu
         9pt0pjs7qtqpLpGcU23v782REk8MgkyBhtq3q261lfdA+Ru0hNFCI/VLzVSmB3pPHhOZ
         GXl1S/WBnLQe7fRWeCtipLe48yeN+K+4eJtMm6SHFHLG5+EXn8A6BOwxzv8T1oQujO9E
         u6crXoeupzIXprAianNGWSNTAU5ckrOsndm5I9CHxAlJWJ+6IFWixJtyZvchiCj8ozXq
         58JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742802457; x=1743407257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LADn1kANv9yfbuyperCIqqOS/gvroECf2fXmlFm+UsU=;
        b=tXvFvREK1/0aAcsnHi/T0f8PSP4yKLCBVBYybePQ7sCjYcvZb5vn6GijgGFFJYvHDH
         euu0thiK9FiT6begYJdl6qZccd8hlKSGIOURPbFCApUd0GYM59UgfecLgHusjUefGlG3
         MSZNe39ztqoVPiaj+W8XEReX11dm/y98k3+xSoj8gu24BLVST6kpou55Atsu5vYYh3a9
         JpqDz8Du9L4/jPzG8OF6Q+rWHVcyrs3hGtYdg/4fIPwn9eRzPxoL4jOEMyhX9KZZ4Mki
         fwqrytcNSUCegxcU2K0V/7+6DO3m58EGQbLaZxquRWqm1QnOk79QZLv+Y8BPSIM3y4DD
         glHA==
X-Forwarded-Encrypted: i=1; AJvYcCUndrqQpj9X8Ju51C54ikTYXTT0zJbZgD7Ycpj25blPT5+h77+L2VyhBCJmv0E59pk0zLX6+8/okMMk@vger.kernel.org
X-Gm-Message-State: AOJu0YwyWrxGWLipotYCX9YSsHt61NstZaZdJgXKu1D6bAr8itqzF5kI
	opsuhYd73JLb5bx0zh92nm/OQMh1MMQkp+EDpeAq0nkOgt3EXmd6m5pjh2Lz3z7Wcr7olUqI+6D
	3LuJ9aJRZJUhC/VpEmtGfMBERq7eZyZUlb1ishg==
X-Gm-Gg: ASbGncsoYj/pWICqT71XduuEFlr0yvBPuHZp4aITjUo8oWXxes+Xhh3tUSBzr0bGWNb
	0QpLspx0HefUbNXymqtMSdJrMXHvsF2hQ7T7JFwMdDk+qEc3MO1OGjvITpGn/7YQbElL1vk03Xc
	+6lEuGxXn8ZuKRo2Qohc9h0WY=
X-Google-Smtp-Source: AGHT+IFoKZEu+cWJ6kUjBS4RpIBDAR0l8rGtHeVCikA1xU6nS5VUl5q1Ld16dkGWapP7A6sIfZYBs2kqSSLj1B5qKIw=
X-Received: by 2002:a05:6512:3f05:b0:549:4e79:dd5f with SMTP id
 2adb3069b0e04-54ad64f7da2mr4777907e87.37.1742802457021; Mon, 24 Mar 2025
 00:47:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324-wcd-gpiod-v1-0-27afa472e331@nxp.com> <20250324-wcd-gpiod-v1-3-27afa472e331@nxp.com>
In-Reply-To: <20250324-wcd-gpiod-v1-3-27afa472e331@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Mar 2025 08:47:25 +0100
X-Gm-Features: AQ5f1JoLqXpK62k6ENcNGiw40yjAMqH6KjKoeHo5l6jpodi-SVCf3FhtdJEoj-w
Message-ID: <CACRpkdYLMJaC7XREXL4m62B6x8fc6XvmR3FfXYUfh=QKM3whmA@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: codec: wcd9335: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 3:28=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
> - Use dev_gpiod_get to get GPIO descriptor.
> - Use gpiod_set_value to configure output value.
>
> With legacy of_gpio API, the driver set gpio value 0 to assert reset,
> and 1 to deassert reset. And the reset-gpios use GPIO_ACTIVE_LOW flag in
> DTS, so set GPIOD_ASIS when get GPIO descriptors, and set value 1 means
> output low, set value 0 means output high with gpiod API.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

