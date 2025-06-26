Return-Path: <linux-gpio+bounces-22243-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3E8AE955A
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 07:51:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B45B7B6583
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 05:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5456320C00E;
	Thu, 26 Jun 2025 05:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihRwjgPh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3981991DD;
	Thu, 26 Jun 2025 05:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750917096; cv=none; b=E6+6PmoeQTghafVqIdjv7Ex+qTn8rM4XVeCO1DdR8un/CsBdqq+oZOTWg6YTwEoXOkpqvanMC1yv+aDxK9eIQRCCOMuopTHdJ+HosLVMhjRW6GSnI2+ZFNlll0vzb6T6yG1Z8fBXZSDk+XULX5PWvEox4NUwmKXw1tJQc4TAh9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750917096; c=relaxed/simple;
	bh=BW+T5cj8JNH5Q+uw9K9qoTDKRpKfF1D0y5hWbktNllw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jsH68ehUNNVmzcIR5WjP0Vyx5fpu6MnMXBqleydg0B2TNsMsDvub1pKB00U8zpRRwIRHHpqs4UB9Y3HOCKRZ8xez/n7W0yqAyTXW5XwWBraMWe415mociM7MrdbKt/BQMq9fiTSMuix77u80uyC0mXCeiueQ6c1HzQFY3+zVhxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihRwjgPh; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-236470b2dceso7389935ad.0;
        Wed, 25 Jun 2025 22:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750917094; x=1751521894; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WZkLNmcD3tIL8re0+QaFiZrcbbUqp3fydtaHwoZiN6o=;
        b=ihRwjgPheKCG2IQKjEPT/TypJ6xMKXFwJxHCBjIxvkdFIS4LjgU/El5ZTnjcgxIvua
         DRoW7IvO8Cm6kMGJABKGcwTN1yH7wgVyx7C0fcyL9EFdJhsWfAvjxK8ENa9yOQ0orQcE
         UrzSpYCUYt3GtOihQqN3jxhhbFcOXbVt5UzQDHaoMU02XgB1bAyUryQxUci6lfHE8vvm
         OyPSeSDd3HnH+3rBkJZRnDU56EhNNQ7kq4++Y/dDQ5sk9uKKEfawuPgJrGP5gRvJ/KPL
         j/PT7RlUNxtKnTfccgz2lt34wia0UwQ8D4rvEiQyNsLaGhMEw1KrIuy4ErhORovmO4TH
         CaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750917094; x=1751521894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZkLNmcD3tIL8re0+QaFiZrcbbUqp3fydtaHwoZiN6o=;
        b=LR8l0AuwiDenkgtq2iWWcWI8bse83JP5r+gwu5eXkyoYsyHWg7VjKXhwwTKXXhXx3o
         j99sMp5zmvCkx5eDHyfMl20rnf4WQ53lNnjwhcvUueE9TIYla4Baa/Acv1jgZG/J/suM
         Kxo8QH3MRT/ApWLvcvVzRoDNzJvjAR5LEO61TBACLwVz0ls+KxSuJVC17ztWcWQRJdlL
         sXp4BNy7o+iyttWT950EK8FZHFlKCS47Lf/gW3T9aaXoV7dt/ZM7WRt9AFIqM3XrQCmG
         zWX+m2Ml5hVioLWL++TN9UhzC3Sy+SbdcxhLl9DHm6Sb9obXb03VGKLXbbU8FDOsLWUQ
         7utg==
X-Forwarded-Encrypted: i=1; AJvYcCUG4g7ehM3Zevkt1twjnuENtPfu4YGGxs4guxdq7QMy7oCOsEq/wUUskJVUMx8vHTLAC61MZhirRe2h@vger.kernel.org, AJvYcCUgE/gtXTRvxnsk2I7954X5Q/RklpFtVzySTCAwZKe7vjIQKXVZCF9HsVbBBCfXdvmAIhBbTMZ5hQxtpeY=@vger.kernel.org, AJvYcCXqADcKxaAdz7orQ+s9k8OF/jCVgPz6PLPPsUBFfL4UIWA32wRCu7TXZi9yLCVnBomaGPwuAJRVZjyfaEfx@vger.kernel.org
X-Gm-Message-State: AOJu0YxCBOzL2BBXMNChRL0akML+h2Ks22VuN/aflpU0W+GEYPbFk+T6
	CdVvGxNfOTybn9KBmA6J/ieGiRAT1C26/6gVr7c8pdrPT3OjH3TzxuUO
X-Gm-Gg: ASbGncu/NyWiSfYdiWniBA0pPpJNf25vYYoJ9uFBSxgVqf58cVEvYGU93nB3pM3jgG+
	RUFYFbrp9w6lRuGilIQ55tgac8PilETPtUjT7bvkLh2r5+p54c3UAmUHvEEfd7eSuVr6RINYCdf
	8YKUj3rZBlpWBJjxLsqKSl8NvY3j/FyH70+8pXa1F/0qY8otPavPaKT19MFXHrorwEoweE2v34S
	Oj+vK7E6nbCBU/ZwwxwCl82TAnfRhdEoHxQzEQqkf+Oaq/sRL3Uc4d3LuWRQixvgNzh6sG9fMrm
	1oPUVXmt6vHE0LWuJ8xKLrqi1Fw0w6pt8GjhfhWMCt7q0TbwqIWsnR25sCWmrL2TydWLwvY0MQ=
	=
X-Google-Smtp-Source: AGHT+IELLKYqEDqvCb9SkleKwpqRZimJJ27cRxFArNcwueIn7CK7Z+BNhkmUd3Va8ICpLYMFXi8E6A==
X-Received: by 2002:a17:903:3c50:b0:231:c9bb:60fd with SMTP id d9443c01a7336-2382403db4emr100610845ad.33.1750917094041;
        Wed, 25 Jun 2025 22:51:34 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:9c8f:acd3:efcb:bc3d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8393565sm148377855ad.46.2025.06.25.22.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 22:51:33 -0700 (PDT)
Date: Wed, 25 Jun 2025 22:51:31 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Michael Hennerich <michael.hennerich@analog.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RESEND 2/3] Input: adp5588 - use new GPIO line value
 setter callbacks
Message-ID: <b6sexanzmc3cmj7r5o2brveslzbamk2g6aaoudz2rwsitua5ws@6jwobo2zfxg2>
References: <20250610-gpiochip-set-rv-input-v1-0-5875240b48d8@linaro.org>
 <20250610-gpiochip-set-rv-input-v1-2-5875240b48d8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-gpiochip-set-rv-input-v1-2-5875240b48d8@linaro.org>

On Tue, Jun 10, 2025 at 11:39:59AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry

