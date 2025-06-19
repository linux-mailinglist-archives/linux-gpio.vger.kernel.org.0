Return-Path: <linux-gpio+bounces-21854-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F4EADFFE6
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 10:36:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02C105A22C0
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 08:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B031266561;
	Thu, 19 Jun 2025 08:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="V6uEHsRQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65B725EFBB
	for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 08:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322088; cv=none; b=TkbTxw0HEL97YYvDhHX7IT0G4E+ZaBWY7PP8oEJLiWoAi6pGbWRYVHiQe7llP+0aD0sumdwrjW3EniaPuhTZoS4T9DmUVHVbbPY8LwHahe0Sjdshg8rfLdX/E4F+cr+2OSpvxywQh4/1AIQki7dBojxVECEn9f4y0PS+0IOyrV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322088; c=relaxed/simple;
	bh=j0nhDKpQpxXWzr1mFcT2IFoKimPE79WTa7ayNr/hzWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CyoopPEbVzrT2eFiVYGRozna/edOENhX67c9tLO62S5LDV78K3DQG6PKByK1PbcONYulDENZ6mg2Yq6LcfGdu6Xi+KpLEPPsCK3VZurbtiOBWzCPno6vSCXb+uYYOovgtpQAfb3NTn/iIXvyTSiPRyr8Xnst68GWK9sXmZzxYjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=V6uEHsRQ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553bcba4ff8so508283e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 01:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322085; x=1750926885; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0nhDKpQpxXWzr1mFcT2IFoKimPE79WTa7ayNr/hzWs=;
        b=V6uEHsRQQhapQjN2CsAqzBx423DW+SZb3peSYoP3+mG0rs497S+INrigilsSKZvttA
         iuF3fd+EuOkaihTUy7IP/f52aohksq3K76/NIOrXKFo9Xg6WSmtN5PtAwKXRhaHsqDec
         aaR77NqrmYCsn6msKJQzuDOhLrCVzSp1CXu6uUS3COCKCfLBkZ/Jfb2h4mk/vIpNnnXz
         479SNAmbVX8lE5Rqvf8JIRKVG4cLEQQf7Y7dOZ1VmhgIuOr3SlGMij6zra4gRiv395RB
         z3yuSWuPTfzzteuV5AlWbK92zneYc/9/tJXTU5+zGIGPm2ziDci9qY1K9UAKJiPD0j0r
         Cfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322085; x=1750926885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0nhDKpQpxXWzr1mFcT2IFoKimPE79WTa7ayNr/hzWs=;
        b=J9qjOjzbAk87IdO+YtEYFVjs9XmtKPuygDshIvzBoo/ZcomEuRU8S5dku/Rz0IvELk
         MnC5RRKMJpnA9VnCL3uqv0q2mv0d7OSr48ONekqMC6Ub9CX6sRWH3O+ShNHRnrEIbCq3
         ntUywBU5fjkCpL++1oZFqBNOUPiZK15CNMNGfJirOy6U8oq4ev6UI+b0R6jsiDnDu6+w
         P43gacp3dDxz5gF0CorzdVbWUy/lDa49sC0krsKGgW7CPIWpfhuwce+9liUb1a/ffnVT
         XESDjqkH+zRKGzXDL4P9X6rVjZyZ5MWOh6UH87hWjPQhwVgw0J69WxBY2JkrRjA8KFAo
         2SKQ==
X-Gm-Message-State: AOJu0YzJ4yzyCELjKBTpHt3M3J12I3uknVFFECwqg6wnmrQQjxTh0QHB
	bAkUIVbGpJTjDV+B1fjCmyzx3wwajmPtOPvelCZVuv44eJuCDMyVvCGqT3+8J7RCqwDkzP2Grxg
	gkjzPJHCIks+n5EOR3+6bmCaMfi5hFcQqCVIiIa84eA==
X-Gm-Gg: ASbGncv3R8zIUr47WlzyzDtM/zGJkmc/4IS0DzC5ZFZWVQk4qjDvAcNn4exezbrRtAz
	oKPCbo5tjnJJ5lhRN/orXvrg/VkjoTlEPiKKaUiYo39aYxYxX8BHvJLmlUd65/AYB54GVvt0yS0
	+nUhuRcmUVXOS1esP2CJNWKxUFPeDy1sJ/ju9EdvzOhzCuZ8sRX4u/rVyYHzgZOmb+KZdGMEm1E
	5G5CG6+p6BcEw==
X-Google-Smtp-Source: AGHT+IFDp85PzWD62QjUEKS6MevtLH60iV1DaBb/nwT7ioJL8BslMyztOttEsa1fNI7Da/cNBk6S/D+nhCaUS1yFP4Q=
X-Received: by 2002:a05:6512:b26:b0:553:252f:adf3 with SMTP id
 2adb3069b0e04-553b6ea5ce8mr6017773e87.16.1750322084921; Thu, 19 Jun 2025
 01:34:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org> <20250619-gpiochip-set-rv-gpio-v2-3-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-3-74abf689fbd8@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:34:34 +0200
X-Gm-Features: AX0GCFuzcvha5PSQAEYMfe3d61ki6vxUCoj5DyKshbRkn7FeS0Wil9VqaZ6ngBs
Message-ID: <CAMRc=McmNfQHVpDtvJMJwGJmoVTkgQG6riGxfxYMed1Xre=GLg@mail.gmail.com>
Subject: Re: [PATCH v2 03/12] gpio: pch: use new GPIO line value setter callbacks
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 10:33=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Forgot to pick up the trailers. :/

Reviewed-by: Andy Shevchenko <andy@kernel.org>

