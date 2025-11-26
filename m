Return-Path: <linux-gpio+bounces-29075-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4502C89572
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 11:39:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B5123A9DE1
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 10:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0115E31A7F6;
	Wed, 26 Nov 2025 10:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Oz8iRin+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C344C3191DC
	for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 10:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764153582; cv=none; b=bxwCqbI4Bm3S+Huk+PpUwFMRqm+1kAurCbGTZMPA4gNLJeiQiknUm+g8pHX6mRNlzhMoCFDsAZbxwd/R1JMjo/bOyKK0O7u06IGqw2FQAl82721+eO87EKWaAT3Zs1oVrK1Lczt5f98RB5jg5QEdF3wpjycTVKLEy3KWuxAL97g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764153582; c=relaxed/simple;
	bh=Ma+j9/IG0gN/ZMtP3TKUGZ11Gs/QhGIN9uMeMZmqeXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i976x6Dapfq3PNvX7pPTjaYNBcH91Mn1smHRYbJGbidiZVImkRaO/cw8bpWzC5FqdW5ABaBS9FJ8pdm0T4BhHmX4+taqlRljAO1lw1WV3Go6bqBQgK8ke9gmtpfqj1FjWd9B9Yxjz9TcAcR7g74OtOIruGdoiFQt1koI/kefz0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Oz8iRin+; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477a219db05so38891705e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 02:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764153579; x=1764758379; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JGVus5CDA/A0OxI5mofdpy0uE/6hkaceE4RdVntZ8gs=;
        b=Oz8iRin+MJ+BQ8g+T85uY77q5CEiqILD6pTaN5UWdZgqxz/Mxckes4Z5vsgrCNGlOr
         /hYFypca5wlf2uiiQKIC6ATNRpJzg/k9uwZZhUcKe+5W5jCKNl3IS+nuUyCGcHPTkMFe
         bcr6tOBBSWmWgyF+Y+/h/G+X1naCqHtduoQC5xZpESl88W+XCXv786DGNuyreMNyE8eF
         IEeN0gG28LtbcC0+/VCCMFI1XLv+oyV2aw5nZMdhn3RpnRyHpxiUss2KYZvqJOTa1qqN
         dim0Mq4Mc/Do9ujxcivARuk8FfpXhc+e7VP578+UXeZzpbsiSiz7IC9xyIRnUKts6iCn
         N3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764153579; x=1764758379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGVus5CDA/A0OxI5mofdpy0uE/6hkaceE4RdVntZ8gs=;
        b=LwSvk6T0+Ig9ymoPRRXXKmGOpeJVmEg3RPJVxKKPPXHHM+9SPTaXqAQQhUhQ3JojI2
         IKXurEp/M3/WeRkhkvv2jCfiY7p1AavutMcCov4vUU6GgXEE+L/uNidjzN1hxJM0t6dJ
         6zqGZT/4C3PHGdlhLIOs5HIeLJgRu+K1wmOFcMhvFkEcb5l9PgUAF56VaW1ZyI6eIuNo
         8O2wNCPpud/1132QmQDPihDynRhmXIx6M3EHg4Xz+pNYLmjBAg6lnMqEnhqe+eRAIMOw
         APZ2lK0PpQzX3HkDknrOfnn9szHtp3M+vM6lSPmfsot7/KWmVPy6rtZZ7N127IdMYjns
         6fyw==
X-Forwarded-Encrypted: i=1; AJvYcCVY7+gmsf83/tquRiA3xCSUenhin+kPEi9QufUNNrxc1zq+VlFAim3+41HDv5cj0iy28ZOQ5kW4q53g@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8K0p+c/hf4+zpBcyHNj/Jv0E7/25Wrtf4ZQ+9ioTZcoy7JHCn
	i61U+PkQiZ9as1OuhCApS0yO+4MRDCssEeF2t0x379sFTofYFOGskzQVJt9sIlC+tzI=
X-Gm-Gg: ASbGnctSPUr+QH1ZFksFC0YuSdc1Hue4hV9jD3QIUMIDN3bPeDZyrlDLKrg+lsfjbEL
	+/PrLkyGOy7XnL5SH0SompPIDyHDtFuiMmXXZ2dnTgQ89yt4VfU4OI+fxpKeVQixRufLUYjbOqG
	8zbqXxRrdmH//jTxFCir/kt9SRf2C2r4U5fa9Yk5lJKzF++orkTqfbtUyM+u7TsOyIup2Rr+M9J
	biGww9b1cNiLx9NVhQT7+gLpyrRPbNo9Pi2G8+9Ll4os4rDcJZ4NzIgg11C9d+WWD/Zr4arGnbV
	07mEYFkqg3/0xwqET8qlcptb16zaUDYgV0NNVja22fGKhZMDDjgInAZsk7YJHykYGBG23JfXHVO
	7Qb8wMrYgXiLQ6j2luY35mKEBh12SZptJGCRsRcXWVYsqF1IpC8E08lP5cNOXSZYmxhtuTBJXKF
	8jq6jh5hM=
X-Google-Smtp-Source: AGHT+IEhisDRJKx3724AhFETUp/XTi9FCjcatqKQGEMNBIIRl2bRvFx5a0Gu/L9CGl93q9KQ1RFytg==
X-Received: by 2002:a05:600c:450f:b0:477:54cd:202e with SMTP id 5b1f17b1804b1-477c10c84b8mr182307075e9.2.1764153578995;
        Wed, 26 Nov 2025 02:39:38 -0800 (PST)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adf0b2asm34698135e9.11.2025.11.26.02.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:39:38 -0800 (PST)
Date: Wed, 26 Nov 2025 12:39:35 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Val Packett <val@packett.cool>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2] gpio: shared: handle the reset-gpios corner case
Message-ID: <wa5fnedqtf2prksnqmb7oin5j3e5tqx7uopypkl2qwbker3inm@ed7tag6bk2qw>
References: <20251125-gpiolib-shared-reset-gpio-fix-v2-1-4eb6fa41f1dd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-gpiolib-shared-reset-gpio-fix-v2-1-4eb6fa41f1dd@linaro.org>

On 25-11-25 11:19:09, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> There's an unexpected interaction between the reset-gpio driver and the
> shared GPIO support. The reset-gpio device is an auxiliary device that's
> created dynamically and fulfills a similar role to the gpio-shared-proxy
> driver but is limited in scope to just supporting the "reset-gpios"
> property.
> 
> The shared GPIO core code does not take into account that the machine
> lookup entry we create when scanning the device-tree must connect the
> reset-gpio device - that is the actual consumer of the GPIO and not the
> consumer defined on the device tree, which in turn consumes the shared
> reset control exposed by the reset-gpio device - to the GPIO controller.
> 
> We also must not skip the gpio-shared-proxy driver as it's possible that
> a shared GPIO may be used by one consumer as a reset-gpios going through
> the reset-gpio device and another that uses GPIOLIB.
> 
> We need to make it a special case handled in gpiolib-shared.c. Add a new
> function - gpio_shared_dev_is_reset_gpio() - whose role it is to verify
> if a non-matching consumer of a shared pin is a reset-gpio device and
> make sure it's the right one for this pin. To that end make sure that
> its parent is the GPIO controller in question and that the fwnode we
> identified as sharing the pin references that controller via the
> "reset-gpios" property.
> 
> Only include that code if the reset-gpio driver is enabled.
> 
> Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
> Reported-by: Val Packett <val@packett.cool>
> Closes: https://lore.kernel.org/all/3b5d9df5-934d-4591-8827-6c9573a6f7ba@packett.cool/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Tested on top of next-20251126, with Hamoa (x1e80100) CRD.

Tested-by: Abel Vesa <abel.vesa@linaro.org>

