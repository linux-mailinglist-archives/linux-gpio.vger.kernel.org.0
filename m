Return-Path: <linux-gpio+bounces-18925-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A372BA8B415
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 10:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27D93189E921
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 08:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE92230278;
	Wed, 16 Apr 2025 08:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TWtqMtqU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F80E1B6CEF
	for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 08:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744792846; cv=none; b=pvthTjUYT09f9EpGsEyZOcpHNunVwgF/3OjmLEFK8YQctCqsTYWtegjViIZTOHCiZ9YWpvRDTFcSujjZBI1UdAcqpvKp1sQYDrsAYXU861NvYJdenmqxasBbYjBhDu+OyhUaLxAH0qOUTSRKtuvRelNyg02gKnqAI/NvrP4Sn6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744792846; c=relaxed/simple;
	bh=PHh/aRfY8+wUypvKP+e4vTp6hWiLK4jdDrHqCsUKIVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J9ETTVUZY0EoWDQ/bySq9+s4a4CrCDouO7F5Nn2DHi0t+P/i213BfLWV5NX7cgCIsstUt9ACdl9nqis2ZorPnPCAhDmCALG+koFXbRDxL45cGzAm+rLkp0xr/qXbTqaqa6hwhTY8vBbMMmm6Su8F8iX3BoJFsS3IcBU+dY9vP4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TWtqMtqU; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30de488cf81so62342311fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 01:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744792841; x=1745397641; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHh/aRfY8+wUypvKP+e4vTp6hWiLK4jdDrHqCsUKIVs=;
        b=TWtqMtqUbnndlZXrcmqxJo3t578XoneUttraopgU45wThvOwP1PIciuUVUUb1wFmca
         gLOk0Au3Ocb340W11xPvUNe7JQpwW719P2vRDLwCY6sxtyGoVTVQf3v2T1wmXv/YvGtz
         N06BMHcxnzD71/SUsFTK5qjehpJwGLpn9nRp5DN8aXP7hT3B23pg2Pcybt/Nt2aHXAFz
         fSRhYU9MpmF4lG7jngZjXLg4RwoybwhcFUN5Ay0+iHABt88gBeYsgdp8WTHQFEhDrDc3
         fXXLqNI28Q4rwYS0jB3Rh/aAS4MdRvWd7o/MWCM5U1Bl9wlJUa4xp8uKIszjLBptdyxW
         F8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744792841; x=1745397641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHh/aRfY8+wUypvKP+e4vTp6hWiLK4jdDrHqCsUKIVs=;
        b=oVGQJZP5YYK6AB4J/XcV8mfteuS/qkGVvf7pQvuEPwKKg5rYqMubemeSMRxUDrai6Q
         brIOjFYiwWj18mRu+TyCLNOQFBYvFovJOMyXCZog1+MnKRx7iMYvIovyqSaMpU0bUEvh
         khDIdT0qW+/ZUqNs9arLFwksEIDQ3GMSUA0monOeBf8U1PQ4GCO9Us6yevQ0xvHeVJuC
         aL9X4BpNQBMQgWtlnz0UhVKJdJwTTAOVpJOhDwyvtfFIEn/XYeHVFDMxPETbzeVaDTBE
         HuCdZiZjT7a0ZdHt0POIjoZhJvVqjbv5Q5MKxPAYiWgbdpQ/yZ2COesp0eJi0MWses2e
         5+Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWq1G3wVrGbhoOzqVz+5z5kDR57WLTVn5OJ3ibXit1SHh5Ipvo87kVMEDvJd1beGwYpwBLqJEohzdIW@vger.kernel.org
X-Gm-Message-State: AOJu0YyyZo7ykh9v39afkwpU8p0xpF3q1u/zhRXXFOWVDdNQl6ZPbmZT
	hoLHLVYkzfiLj2+zOG0XxiL5fYaopwL4rDqTA4bqjanvru9cHjjn/OI16+PEq4tm3UStqtXlYJ1
	a3Mi3KkYjoMzvf6uoJCzfyd9QQAuKorfBVfCrVcmgOhiH6+D2
X-Gm-Gg: ASbGncs+4VXb1NBnO7t+XFIQuBnGyPYZhwkft2DWGL2X8+FcI4MR2dsZ7fjGTXsp+zm
	TETT+va1SMfHBxhlFU5uVE+2UHLaFZ+Gweau9jVV+ipkGcbTDnHrD/Aa48fjanGuwsk1RwYi5dt
	B+dIGiTjRdh3nIbdLp/QMqQQ==
X-Google-Smtp-Source: AGHT+IGXJGhNz+mk0TZsHepSj89HZ4QI/X4KU0wcHP9b9BgfARe2HBEH65LiLbnFi6YoSiuC7mQMfBNes0SrZS9sbw4=
X-Received: by 2002:a05:651c:1449:b0:30b:f775:bae5 with SMTP id
 38308e7fff4ca-3107f695229mr3732551fa.6.1744792841610; Wed, 16 Apr 2025
 01:40:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415111124.1539366-1-andriy.shevchenko@linux.intel.com> <20250415111124.1539366-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250415111124.1539366-2-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 10:40:30 +0200
X-Gm-Features: ATxdqUEgZrbGhdEVx341NHRm2q6vw1HK4P4Z6_t5Dx0MHtFEnd7bfBAyLDkiym8
Message-ID: <CACRpkdb7uS2fGsjeeLsZeBEpqGnCOeotdkTd50DGr_sWC_ZEGA@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] gpiolib: Print actual error when descriptor
 contains an error pointer
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 1:11=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Print the actual error when descriptor contains an error pointer.
> This might help debugging those rare cases.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

