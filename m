Return-Path: <linux-gpio+bounces-18473-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0774DA7F8E9
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 11:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D48CB1886F87
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADBE122332A;
	Tue,  8 Apr 2025 09:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QD72MVim"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D939825334F
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 09:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744103054; cv=none; b=Cc3Z8sB+LaoKXnLgbIVk5LvNDHzHIzOj2GZDri3kHAm7+bGSX2WBsqX/jbwnZY2/eGoUauPm4W2TNm2/1UXYVimR0q4az9SQfrve/n4zpe+lzPM9EyoR00MTMeUdCX6ah3IKYFnEzHd52gLTb2tsinR2EXP2r55PjRVQmLXQNVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744103054; c=relaxed/simple;
	bh=n3yPhKBmkrZrKNmGGkYKVNWI2VnNkodGMszFRz7nRK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZtqN4DEZ6D8aBycOx3Mk2gNB6BS8k9mai6R9xNiTVSBUYCvgdGj9iJSXoHaTeXa6A+YGOQK3RKKn7go4OCsihjZw3OMkWAaZeDh6F04PXaCPSi9EcWKeI17ZhoJFWb51UhemIQsLOMrZRlL7jJsP8X8cAnLHkKePvhWcCaDbawU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QD72MVim; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-549946c5346so6253696e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 02:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744103051; x=1744707851; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtKT5PB+I8jgGburlz5n6UrHfPzs2dxAk/yRT6NP0dQ=;
        b=QD72MVimVL18kNyZqWYZ65q0JLA0IAAJx4h25n3YGjruMeQ579ZnBItiigguRReXR/
         LbzwEJoFvqmVkV2BC2lbfHFimpKoUTPOQc0/9Ktu83X5OhRSR88JuFQtVBJyncFvel6M
         8nsHoJiLX3J+/BKMHA4E6lfo3SnJ4bOB92s28tAUUZndQrVGv4ocewJ3Uh18b1VO1TQU
         qug8G13AhM5vI+zFz5moQvPUKZZNVdI5p+sp9O0cuNTWYDMzf1ga2Vgg9ym0BqSrd+PJ
         UNIe7/8D5kIq3zd0ZTWtcp9Jfz8WnSSS8SEiKwcY/su5VTUNhCmChsKnVdU9opF0cIfi
         Qkzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744103051; x=1744707851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LtKT5PB+I8jgGburlz5n6UrHfPzs2dxAk/yRT6NP0dQ=;
        b=eBtEW/h2HNPd7lvAFhTNo3yKGlq0g2Gh1oxHeUgL4Vle+syb4MjISogQIkzjfdhXQl
         hvXjxabpGEL8we5ckYvu6xmPwwADuHRPqgABM+7pcKEzUsOVBugcXyTE7LD3vAf8Y5+D
         14tUMPliSNNZ/7rrtrGxS5L1CbYCptfwtyi2VAQd/7gDajqKnHm2BNFs0DPrNKF15FKO
         KxFrb4+Gf33GJpLAakfQPPUkFLfkoOm5QjU6D2VN8PpTpibkWVnKoeSNUPow8caWcWsM
         jBpM8d4jG23GOiAPbRWKgIl04KwKSzOCNVL108yiMA9mbHCi8xEpEENarO14pW7GMoBU
         zddw==
X-Forwarded-Encrypted: i=1; AJvYcCU4hBU/W8bZA6Qd/ov4qJiZzQ9n8A0Exa/Jkc7cZpacxdrGu99eP00DzmmQLG3I5nR/UypDpL3oZSwT@vger.kernel.org
X-Gm-Message-State: AOJu0YyQdX/Nq+jcI4s34oh3UVS9CyL/SknkgCWbjJ3xlL88+aNRGGGv
	D8EiyePkMIES7ykwDJVHXGsvnNF9cdJkriCiH2eEn8pPa+eA7fyRsy0raLt3RNxpkA3JOE/qljt
	49cgzwcr6lx9wu0HL2VpULFrkchbC905fFA93Xg==
X-Gm-Gg: ASbGncuYYGeCE4xNWiT8/6CJMDQSFA/nZmxAwqtiqHVgatDgc2rrULXwN3VaSxfCVD6
	YGTHfCC/HMHwGXErgX4WOc1cx/qxVlHOAKpA7oGPkQECNFt9udpLp3/ICctH6QxfeWcOo5i0JKl
	1oSUXzV/FaP2KS0LQ+zlKEloMs4d7wASsUM52Q3A6c7h/7DDMzuvWUfsmW4A==
X-Google-Smtp-Source: AGHT+IF2WUkxm68ddIms01ocssUC4e0WNcZHFUed8nlsJd3SMfdqBt0sV6DP/H5TRFqdUI/lrkaIskfxxDirqwxdZyw=
X-Received: by 2002:a05:6512:3f16:b0:549:8c86:9bf6 with SMTP id
 2adb3069b0e04-54c227dc869mr4261598e87.39.1744103050753; Tue, 08 Apr 2025
 02:04:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org> <20250326-04-gpio-irq-threecell-v3-2-aab006ab0e00@gentoo.org>
In-Reply-To: <20250326-04-gpio-irq-threecell-v3-2-aab006ab0e00@gentoo.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Apr 2025 11:03:59 +0200
X-Gm-Features: ATxdqUGccJrFjcEWKyhVa646awyIsRz2HGjGAguvah1n6zT984GzRInZSF_52-w
Message-ID: <CAMRc=McnW0YRMmikwu6qWSdWD5Zu227dBRwd4VeWZcfcEFUMDg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpiolib: support parsing gpio three-cell
 interrupts scheme
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 11:08=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> gpio irq which using three-cell scheme should always call
> instance_match() function to find the correct irqdomain.
>
> The select() function will be called with !DOMAIN_BUS_ANY,
> so for specific gpio irq driver, it need to set bus token
> explicitly, something like:
>   irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---

This doesn't apply on top of my gpio/for-next branch. Please rebase
your patch and resend. Patch 1/2 is already on that branch.

Bartosz

