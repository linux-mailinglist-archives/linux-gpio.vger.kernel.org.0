Return-Path: <linux-gpio+bounces-21856-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C089AADFFED
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 10:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3638B4A1839
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 08:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D732741DC;
	Thu, 19 Jun 2025 08:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ga5jSC+C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAE7264F9B
	for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 08:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322180; cv=none; b=YghH2CKhlz1OrnFDhBHRMeQ5lTSh4kLfW3DOi6U8kaFOuc22V10Apt0h/VLqmAi7vN5uCfp3xet++MLbc5hIsL2IcCVzMCrXz1NeE+9ThzvebQ2vUG6SxFlzuNOZYONHbB2cUNL1y50GszySXt0fZDjRrQ/6s/fo+tDNzu2jpl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322180; c=relaxed/simple;
	bh=yzf9de8tjudMgAFImVxK60pD4txhktnI7YYgbi2dkYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l7jENZkGAjcNXBnj6d9eoIAY4WpCRLxvwglNzEQnKxE6OXOz6CsQG2Xt2kKXOZRLdvpcFR0anFcHarpMc+jvBxPRisJGaLidlXSWsqJ9yoFxuNx64iwqulTLzyP30xIPcH8GQcBo3JTSJ/8d+jzhH6XsHNBnKOb1vilCi0xgLkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ga5jSC+C; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54b10594812so519271e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 01:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322177; x=1750926977; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzf9de8tjudMgAFImVxK60pD4txhktnI7YYgbi2dkYs=;
        b=Ga5jSC+CC3c57/umT5qA2vmrESoZ8QHlsHGHMsnOmZRE7np10F/p+RmzJv5rtSMcK6
         9gh1mctNVcC3pEpiryO4IuFeZsfMkqdYktPgtzmztNQ3o5rNAlG03jim/A+CnrekZ8uX
         dVyltll1LczZBlCOVoVul44mt8+tGbDVAstk7+sqrPa8EkPWiQQQXJNf06gbweZFptsx
         4q4HUDa3EMPEhIgKefPuq9Oqz1nlptZeFzq4btoAa0atFoQ1jtJC68ajX4AIEfaBTxQw
         P+28uLnYnlT5eBlXCnTR4hAQzLJzy+Us5ujrdCF+ypicKf2jlD7JqHDeJcx3ih0nr5Gx
         Plaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322177; x=1750926977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yzf9de8tjudMgAFImVxK60pD4txhktnI7YYgbi2dkYs=;
        b=ps4LT2cDu0nCdnSVMlQokQSunpQHve/g0IzRXY7axFUiEAt6vA3pqlOl3IrawMaGn+
         UIk/1+U6g0b2EPvJjkLaUwO1J6iqWdZ/Qdd24nOKZkmnLQCaUEwmvaOqaXvltBB8Td/N
         kzJ6H3Rukk3samPC51O3G+ebN7FoAa/X0kY4vPeHcQxZ41jMyL8IJ0NzMfjuvjl+Xx4G
         MLb/CMbgCL84zchnOAscoTgVUtlfcCLXy5w5qb4R697sEmvu3xIf7WkEKXyhE4HPKRyR
         jDfIXPbDfWQc5wBB9LltAD02Qhz5hm9FHGm6DPdU9gLbmHlAQqSgIeOy0Fw3ZfGqFmo3
         ELqA==
X-Gm-Message-State: AOJu0YxSs1H7bj7Nqmy9i13dFI6NDej5lU2pEiTSUmeKFeOinWkrWSV/
	Vgh0XgHj4uI2VMAl7c4mtDAlZ1GAVc7RKRv3y5ppAgH+xiDF5+vtm2MVWS0ukeGnhoGtx21uucN
	yo+bToNpUxc+IK57Ry9eWqO8lPViINHXGRQjqApACOw==
X-Gm-Gg: ASbGncsRXLWmvXX76mRaijTXsA48tLg62RdgQC/Nf/feDQTEhEEDcU57gDT3ogPMilw
	lqEKjnyE+CJHYdQKDOFU6a+J5puab0Qrog1QTVzECBvqLAMjBzZVL0NL+TgeuBBEEfFohmxoORx
	52bS4pfUuxiCIV7g+8JbGpjCXtCMTHTVMlZSkOBE9p33yElX5BV8AnUaFdAekx8s4hdhR6k7ocL
	3o=
X-Google-Smtp-Source: AGHT+IGROhB1BHEhVf7lp3K17L78LdhcTvHXtwk6/ks9ka8oVJATyogYr8tNLZyP1iVXGY7Rk+OL3YCyL3i+oERqtJI=
X-Received: by 2002:a05:6512:23a7:b0:540:2fd2:6c87 with SMTP id
 2adb3069b0e04-553b6e74f1bmr6127957e87.16.1750322177403; Thu, 19 Jun 2025
 01:36:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org> <20250619-gpiochip-set-rv-gpio-v2-5-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-5-74abf689fbd8@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:36:06 +0200
X-Gm-Features: AX0GCFte8Q5wHOGkWFWXjfIA30NLlYd4ISVYqo5eAKH8rrJ08AS71jryqV8KALU
Message-ID: <CAMRc=MdkDF_HjRvCvUdKueRgNYDxe=aeGeWAw9bBgnAZ=kxZAA@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] gpio: pmic-eic-sprd: drop unneeded .set() callback
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
> The lines on this chip are input-only. GPIO core can handle the missing
> .set() callback so there's no need to implement a dummy here. Drop it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Baolin Wang <baolin.wang@linux.alibaba.com>

