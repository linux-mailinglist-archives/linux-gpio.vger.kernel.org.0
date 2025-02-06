Return-Path: <linux-gpio+bounces-15418-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FE6A2A340
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 09:35:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B62353A6206
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 08:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA86225766;
	Thu,  6 Feb 2025 08:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uW1eqCox"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1686F21CFE8
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 08:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738830914; cv=none; b=FyiFbfmzgI9usjofbKAzKG75cyoGac3oZq5eALosC9ye64u1LC5Ke0VwrNdLhYXKtdi3aLG7fRz8vPiiCABSY8m2t8rG4upRh7u7zt+t9Oi8u61fsz0e2YW/bjNFEkjSxP2Ee+YaJb47Cpf4m4DeV1osf3Mcbc5t3GxFKa8BptQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738830914; c=relaxed/simple;
	bh=aqSVekwags+CA0/oC4ZRKtB6fBvm3awNyJi+swkyxYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dM+8QsXGSbd+ZY9hgg7u9LFjHvQrW2144ohsmX1iwJEOBXxwSuR7/c1Yk/+YSQ8KDFqVShaFZh3Z8jF2LJgeF6oIh+oPGCvMMUBGFRU0+EK3BLrIl8+MuDslN4vmCov8DWLbceBm9KUdSDAVru5EFinkljpsLgTPWB3lyepu+6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uW1eqCox; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54024ecc33dso684291e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 00:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738830910; x=1739435710; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqSVekwags+CA0/oC4ZRKtB6fBvm3awNyJi+swkyxYA=;
        b=uW1eqCoxUAWYsqBv3S+IRJNpv6MRUbC75+5sBnTuyRiRhyQ6tA8xn/WEPYwAQqyV7J
         WkmSGjT6BWrDU3cpMCioTi/iiZOvfVL0Uu5qHsAC9DKgfJqmTtNxS+UDLjNyJ8j1yVr7
         s6ml7UDCfgyWl+aK1pwLYH6uPc4rMO5LQd0Mkhp92MvLcZGOIBZnlmlyiDTePgLUum0i
         8WD+yvzU6XNq4vnWf8gjFWFetzJaS5zpvEmx5Efa8LD9NHe9d3TlwPHkNnWwQ8hQlP8F
         lI4mA5zuZ56UmGcLpDgo7m+FqCIyGVhAr17ODYOxDqE9+7iEQNAX9EDIc1EMWZpu+CEi
         7OmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738830910; x=1739435710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aqSVekwags+CA0/oC4ZRKtB6fBvm3awNyJi+swkyxYA=;
        b=ojWdZ1In4PLls0TXuzMl5yr/4QXSlCJwiwzQGlq2yymE7bCHG3TudkzjkccV27BWLW
         FAGDpE6+tcKQ6YJNI+n290lb0ZpstW9eod8RrR1R7c1LP+IMFziys6g4vyJ1I1hQJHmA
         GuzFBHneCwxeHyMx0D7cH++/YJNSrFbZVGtQjfELbZPs/1L+f9VWb8T9k04ikJu+TQMQ
         iz5PJz8ykpLVnTMHJuSYhWNWTzGr9RfHpPZgHfCVnBcQPhIa5jm/h4LUWk61Z6s4MKwt
         +S8tciI3Uwe2K8FY1Wl53FEg8Fcgs7XUI+nUaKTu4Pezjfyu8P3XLo9R7QnNySpxMbLC
         LoLw==
X-Gm-Message-State: AOJu0YwkAziQAIfqlxFceUgpr2P9E6LcpZ4PauZtyTh+oHqz18l7IteR
	tRqOp1ZTl/x36zE9W4g42Bbo1NAFulmTL6bdr8r0SaAk0Oc7bS6p18tOdA1s5arifBQNouBZFJ6
	reI0iKOhyLcxp1Ba27f51MiNHuMN6iUKRKBHE2w==
X-Gm-Gg: ASbGncsrDSROllYGoUlHvQ4+5POny3T3wH4KueqRIn5THg9i7nj/HomVOOKp+3R1lFm
	euyRZoQyg9n38j9tHaUz5n2lmjm7jaN+460xJiPIVEP7ns/AsK4ah2CaDd/adtZZH8SuJA+A=
X-Google-Smtp-Source: AGHT+IE4jL1biJ6V9cZ4/VPk7KnL1/9etk1mBhO7a/OlzJhKKy82lzPY62t9BmXNvglrokw+AmlgJ3IQWmBjB57cLLI=
X-Received: by 2002:a05:6512:3ed:b0:544:f8e:ff98 with SMTP id
 2adb3069b0e04-5440f8f0034mr374420e87.42.1738830910149; Thu, 06 Feb 2025
 00:35:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250118031145.243104-1-yuehaibing@huawei.com>
In-Reply-To: <20250118031145.243104-1-yuehaibing@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 09:34:59 +0100
X-Gm-Features: AWEUYZlTbmZNXFLuAIG7clgvEuMK_8C5v6IB51lMqv4nWoj4Y6P6R_UYsPx-1dU
Message-ID: <CACRpkdYxpy3QbjRD5drxD7E7pO18amSvKHYukfOPmU_fp4bRPg@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: pistachio: Remove dead code in pistachio_gpio_register()
To: Yue Haibing <yuehaibing@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 18, 2025 at 3:58=E2=80=AFAM Yue Haibing <yuehaibing@huawei.com>=
 wrote:

> fwnode_irq_get() was changed to not return 0, so this check is dead code =
now.
>
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>

Patch applied!

Yours,
Linus Walleij

