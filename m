Return-Path: <linux-gpio+bounces-22571-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 980D5AF0F3D
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 11:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B172D17AFD0
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 09:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C186E23D2B3;
	Wed,  2 Jul 2025 09:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YSstOdCz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190171EE7A1
	for <linux-gpio@vger.kernel.org>; Wed,  2 Jul 2025 09:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447459; cv=none; b=uqT0DrQMWBNGEm4/emBm9qCWpzcOjdFtva3dQtdIExfTWLJxQ4jf3I4FhfOlilAotnolF2MyLh1AAasWpdibIJ258mRBAVxg/PhVoSQjJzggM2JI2vimWogHis7i6oAdE4eMg1AEJE3S/RzNBJQpqllANUMuZMAHY6z3dHaXwB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447459; c=relaxed/simple;
	bh=pDH4h4ixIvMXtfqOJpH5T9/Ff7vK1uZlJ2JF7JrxzWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nzXiszCkoOi/tWSj/K7cSQM7pyv3Lui1f5mCG9u00bYwN99xUtvuBGAIAfB8nm6IZCcJ7lRvvHpRvF1sX00gVcf7zJNbTa6vlYfTTgDd+uYfLhfolG+j2TjA6ucxu6W1U0v9TQDT7VDGelXW2boUpjtyloL/+j1S7q4bSx+Hr50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YSstOdCz; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so46130565e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jul 2025 02:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751447456; x=1752052256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vd9qz1625SEdu3Xq2Mc3figam6WTA5Wj3do4icwwWIQ=;
        b=YSstOdCzLQRzjL8XGuKC34lZFwl9zIKhiIdN1RcuKh3dL2LTJ77PEtewLoyxXkQoYm
         6nQITK4m7rUchOeZz4HOAjtQMdlX1Al6vATnK4b9Y0NzxcwbxqHx/KM/mioCZUeyE5ZK
         FXkzz6m6SF/OAqecIzGuuSGEKwf0UiGCvFpSipjrRpv4Mwh8Z9l0kn2l5afYB66IJ7M0
         mnYFJc5FYL6KWcDzIPg/pQaIMgn7UYlo8Jw0pmU5V3EOzUYGyG309IB7k7AnW3qPJmOt
         ZXHkXetCUZKkApzXvQYp/MqeWACKpE4B1hvncH76DsZ6bfPWiWya7NYqUQAbGWy8OF9z
         iZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447456; x=1752052256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vd9qz1625SEdu3Xq2Mc3figam6WTA5Wj3do4icwwWIQ=;
        b=TsI8Ocdc9gXeImT/gEyxGXxH7QzgSXVxBXGiJfnWa8PtMjSFrIWyNlYPkXUkd9qCNp
         d+bfBy4Id6RsmBRBRhufUWumVYCsMYdg2hn33EWVs0yDaaHo86u+459jiOrVQJFbmcLU
         wG7sqponzh5Z53HbtYu1zB2hdmfLFgTyIrYhk2fsV2RW34HIsH/3pi7eD7brvWx2QKMS
         msQRegnqD15vZCpcxmhW0YTb1am93GLeiShw4uAB4om9wWk4YFrs6S0ob+5mY3dVPE6E
         Ji5YryWtcY+A9Q4Rr+PV8C0ee9ISwM8thHnq4Xuj7T7RlHZb6rj7sXwkqYd/m2nayCt9
         2umA==
X-Forwarded-Encrypted: i=1; AJvYcCV6mjN/aA0ACMTC6rKjgeV+8k/oqXNzKBrXcjh8n3emhdTIkFjpvfqFjcvLn3pGECInTQitRjMj4Ase@vger.kernel.org
X-Gm-Message-State: AOJu0YwLwESMOdquO1N3KxMrKgsxZNEbvcHNRfijq04ZzQyv45NxLuyy
	+Q4lDIMgJIuzxJlOQYmQTj2mzTlEqqdOQH4mN602uhjsquDlI7blYaWoqdyNuvigZoI=
X-Gm-Gg: ASbGnctY4Ed4wzM9uRKwQqQSsfwO2YwwbwesqiMbeVFDCxcG1xqvdGZ9Z5ZTLog2lNa
	x7GQADunVJcekv3QbSrLIqbaVHszEOp3riIZc+W7KtAbPhKhIMBQ+gWvBU7ZZ4HKhASbIAKgw6q
	HtYTf3Cd/lhRcaPrajxmY//brFtSYxD8aEpTNWKGP+I7MXsChXh/0u4vLAA3OprUV+2xqBToSit
	Ufq4HQ6MBdbU7NKRLjDQCQ9bw+o67pqbNQKdy7oeJtAoV57VM3qkoaLJBa78FSJqnqMxNF2GJ+q
	phD0V0am76SC+hR0NvipT4iSCmAg1NfNzgX6kqkjUEJ0Fx8Pvzd0ZIE8Nh+w
X-Google-Smtp-Source: AGHT+IFBiU5+2x1l4XAarHBpf/yXWqDYHDetjcWRe/wFvXFKll6sHtwMjeWcENI20hbqFMgoxKx8Cg==
X-Received: by 2002:a05:600c:c0dc:b0:453:45f1:9c96 with SMTP id 5b1f17b1804b1-454a3c610camr14840535e9.14.1751447456399;
        Wed, 02 Jul 2025 02:10:56 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3fe28dsm192866295e9.20.2025.07.02.02.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:10:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: pisosr: remove unneeded direction_output() callback
Date: Wed,  2 Jul 2025 11:10:52 +0200
Message-ID: <175144745010.23577.14132407627195211474.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250625081222.12744-1-brgl@bgdev.pl>
References: <20250625081222.12744-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 25 Jun 2025 10:12:22 +0200, Bartosz Golaszewski wrote:
> GPIO core can handle input-only chips that don't implement the
> direction_output() callback at all. There's no need for the driver to
> provide a dummy implementation so drop it.
> 
> 

Applied, thanks!

[1/1] gpio: pisosr: remove unneeded direction_output() callback
      https://git.kernel.org/brgl/linux/c/34e61ba8193945c90f1bcaa9d595fc05c586663d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

