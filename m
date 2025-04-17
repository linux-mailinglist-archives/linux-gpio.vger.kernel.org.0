Return-Path: <linux-gpio+bounces-18998-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31555A91425
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 08:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34B421906390
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 06:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BFBD1F585C;
	Thu, 17 Apr 2025 06:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lr1+HNOl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB63A1DFD86
	for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 06:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744871793; cv=none; b=WiCsj0Wqf0FsEAbGC2KFLbHSXonMTBP1SfP817Cb4l8hFSR3Fr2XRk8ImwKf3F9xINTP88ph1058uZeEdRf5BwTlFD3ycLngoOsBl1mDmegzZ0E3pj5Yt3VJZH1LKh/9HO421gKjAeIpI0JXXGFrbTbip8lVr9YkHVnEFnP9bQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744871793; c=relaxed/simple;
	bh=AITx218zMWvuhLpDRCsKR8NJvasmzKvZkb6crZkEq0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VpZWjoI/I0Tji7Ce4bDpMdk4l8pf8ceIz3Dqse2t2dwcpA/8LkQGRW5jUHWA7rLqdHDppB7MfOOnIndSxFKn5zWyZXFamjMGq4qL0FV73RZdaPeIwrutu4S/wIsJkOwfNMg4db3/yILXGdKdNeqdlq/+7FsiT00Xv9r6MBXoN4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lr1+HNOl; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso63180266b.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 23:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744871790; x=1745476590; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s+CMm2Gz6PuSS5ubYBtvC1JtAEQk7ez+tyQDP7ck0io=;
        b=Lr1+HNOlQpWKHLtbnSXX3sKh0kEu4GqXnWuC22ZzB32p7XC+Q1+iBdpfodC2+JsVLr
         AiRQAregnKyy/DL/hFlocPh6MniPn7PnMVdu/mlZasmNS8o6wR88/6FsAEtLq6n6KZJv
         /TKJjZwGSZaW3FZZdAfC+gGN49cpmdt7tVVP6BLtDIcxvEdr99xXnFev7lN2d9sQ9jlp
         lhoMxT1+HJNlv/KyLN8T2yc1LGcXHgzJVR+q64IFOVSqbtIx7xA21598UHnzJGeLp2UD
         sW+jt45QCVk+rGt7o8iiRHnuP1eD7OmnAfMgixLSWVbaPyj8ZBvjYeoI88OcuWsiiSms
         HZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744871790; x=1745476590;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+CMm2Gz6PuSS5ubYBtvC1JtAEQk7ez+tyQDP7ck0io=;
        b=VWKFPXbexB/C8oe0gNu20/ML5lWXzOUWOaTg0vZuTFWPWRNiPfnY/LDnxQEcvt5DFM
         3eXYmvh9swjmYVbn0n/Nr6KSfL+PkCUFGUI/pOcS8YYwrAaLkuW+lPVhigq9OYgSMAYs
         lp+9jNtTBHb9xLTJri6ShNtSmREePXIob3P/UdkQK6RvxCSkX++tMHAoINATXFiZnzLP
         XkXDyV8aFClyFDnz0P1PTagjWFUnhUarm79BjHx4R8vfevq/n7hxjXMoUfdnQllcEsFW
         Fjg0nW11BsfImaBWlnz2ey5txvFT3TkERsfruXxzErTnK2zwoyHHbCc2HmgTfftQQEDZ
         drrQ==
X-Gm-Message-State: AOJu0YxQgCepAYkOKUQiZaqBhyE6Yrm9e/GvN0894e/T28DZu8O4bFPx
	ptZZHGTdWWB3KwO6RclLOesEPqns2rCmbOC1GXaNdi3NHdTe1fxQHX2GpydFgMx43QOCcslvUrQ
	vDb9IgwQshGbjvNrUqnrGRQ8+YdKukGzh+cDNSfCanAtoBDMLkgA=
X-Gm-Gg: ASbGnctBNyVfmSxH1Kn/zaA1+OhUT1TzmWRVAdcikJQFJXBTNH5AJG7hh4pkq0dfOjA
	ZiZHQ4MEf36MWvlqheyc4F7ih8P6MTbIB10Ek1daLVu1RabZnExYKIYhmv7D6zuMQ4mnFQUp6F+
	Nbp1zbMbAjXfqVTy+Q2n0kYez41BtMghKRz8ddM1AJdSeljrFPLoxLvBE2uotY2u76
X-Google-Smtp-Source: AGHT+IFRV1POcfbnntnkIIgoISZqMl1YMNWh5qJLsZjAp8ZnXuiJHDtlAt0pjindb3KBG93K6QMQKSy8ayWyUcCLrZM=
X-Received: by 2002:a17:906:9fd2:b0:ac3:eb24:ab26 with SMTP id
 a640c23a62f3a-acb42ba1b04mr404565166b.51.1744871790041; Wed, 16 Apr 2025
 23:36:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417-abx500-pinctrl-v1-1-0691ad29e2a6@linaro.org>
In-Reply-To: <20250417-abx500-pinctrl-v1-1-0691ad29e2a6@linaro.org>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Thu, 17 Apr 2025 08:36:19 +0200
X-Gm-Features: ATxdqUGPLRW4hy4FssPtey4H-JuCu23_2-4ZG2Lfr1FZb-U-TBXjBZ4lBN17Y-w
Message-ID: <CACMJSevYCTAaCUBJKb847wNUo360xfaFmXhQkXhqsQ3yk4iPzw@mail.gmail.com>
Subject: Re: [PATCH] pinctr: nomadik: abx500: Restrict compile test
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Apr 2025 at 07:22, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> The ABX500 module depends hard on AB8500_CORE it cannot
> be compile-tested in isolation.
>
> Fixes: 720abc5c58d8 ("pinctrl: abx500: enable building modules with COMPILE_TEST=y")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/pinctrl/nomadik/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/nomadik/Kconfig b/drivers/pinctrl/nomadik/Kconfig
> index 2c1f8a4f5d24d116da50b7fc29f8db628170efe0..1b4fe2a4c30283b8f9914b0a71275694d46aca36 100644
> --- a/drivers/pinctrl/nomadik/Kconfig
> +++ b/drivers/pinctrl/nomadik/Kconfig
> @@ -3,7 +3,7 @@ if (ARCH_U8500 || COMPILE_TEST)
>
>  config PINCTRL_ABX500
>         bool "ST-Ericsson ABx500 family Mixed Signal Circuit gpio functions"
> -       depends on AB8500_CORE || COMPILE_TEST
> +       depends on AB8500_CORE
>         select GENERIC_PINCONF
>         help
>           Select this to enable the ABx500 family IC GPIO driver
>
> ---
> base-commit: ccde4ddfe04f3c01e80591f4e0a53ddb9ac7d265
> change-id: 20250417-abx500-pinctrl-29447c4e5a7a
>
> Best regards,
> --
> Linus Walleij <linus.walleij@linaro.org>
>

Ah, I was going to say that the CONFIG_OF dependency can be addressed
with a simple stub but the other report is not trivial.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

