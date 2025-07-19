Return-Path: <linux-gpio+bounces-23516-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CFCB0B0DC
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Jul 2025 18:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D0CA18925DF
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Jul 2025 16:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F9B622A7E5;
	Sat, 19 Jul 2025 16:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FvguZnfM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E135A207DFE
	for <linux-gpio@vger.kernel.org>; Sat, 19 Jul 2025 16:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752941297; cv=none; b=H1gyoCHvBrwh5HMsSSXHg+6G9jbYjklMPGQsRCNjqoKZGgl38L+6XeTbg9e/L3w/gIKfR3Hmyf6Nf/V4eTvObeXKUhZmeuzChcbUv7kF6iKRJLcmvbeNvY2eXNY8W9a+C/I9pOvvZt2kult/6C/EnCysYslAC3AN69GR4oNd8Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752941297; c=relaxed/simple;
	bh=5SiHkdSfMvJG/38SvtyuLJIKJ0dECiYN4f8f1myRAcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mj7KKRiQ/0eFzqzTKpGFPoeVK2PkUT5CxLAz1ezt8GuyjgIEjkGJn0r+Z5zsmMaK3y3jcZeBjrzTSPzRjJUkIAcmLQXwQGO4iDCpsQ5m/wZ00mAmR7/QMw026JHyOMDtoRbauXg8fh6xlBdx98U5kwf4s5D8H2LOeRUuRDjqOY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FvguZnfM; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-455ecacfc32so13854005e9.3
        for <linux-gpio@vger.kernel.org>; Sat, 19 Jul 2025 09:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752941294; x=1753546094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTlKTKLRAHSXeKTWI+ECpHm9HjExYSOWdZ9iUWEg/Lw=;
        b=FvguZnfM13nj2QfDtXK+0eshzwlkEOutWDDNgHGr8SzYta47xZK+5K+mXviNYe28Bl
         RC4wpHZgSUYzOyPI743rCUhYrDj6p7EbP0IV1Ksoqz/+UVMuMr9WoJImMKtKOT7Nv72M
         dkLvQnM46VMQb6Ef/fSyEFPR7fY5hcyv5kuXviZHhv9Gp8DMq+XQsBdlyxW38KWQuMA/
         IqwQ3OmzJCMQhuMKvuJDU44yVMjrxY44PSwYCZCZY4dqvBl3ALhouS1DwURRNF6GaiA6
         KH7sprE90Wk2Vn4IRBHVenWGErYiR9Yb4FJKokApUD6tnm/o13cuLcciocTrlZJn6Kx8
         j7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752941294; x=1753546094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hTlKTKLRAHSXeKTWI+ECpHm9HjExYSOWdZ9iUWEg/Lw=;
        b=VqAzHDWxsDAetXnXnAeq6WjW7JGqqjMynUTzoh9NnwklNGzuryPi7WNHGqSuiKvHPD
         NLeZU8iQklR89ti4Ffbp2+lkBsmDpUeoiJQuaMaOj9uTDFqug84DJ5TR6QejMubj9IzS
         aOgeW0DS27NTv939RPn9t6zaUiIZv+hUhG6k/jJYTBHpwM5GFzPzlX2GjMiMlpYzLPer
         37S3BQcx1pSCcPOpBFscEipxEId/Xb7If171+uskoX8iNEIh0GkIO0zHClp1C7K7GOhk
         eOWpkN3jVgoL+nUUPAm0HClVTKe5QC0QoamBtqjvJK8YGSAYIaW53XJ5BwmRw0eE+xqo
         36cw==
X-Forwarded-Encrypted: i=1; AJvYcCVwEaLO7NClrxctrKiGM9hu/ulUw9gglQSmV/p+XIQgVOHXjGwAtNJMYwgAqKevB3a3gtnz5hYzYFp/@vger.kernel.org
X-Gm-Message-State: AOJu0YwQtip2WNA2XRiJpPFWg32kCXFgco3hSfI3foA+4p8ecnudNp3M
	sAXHlVprHZTuFy9rAXlQk0UaMVSP7vAVaquwzg2ivq04ypPhWOC5orRx/rL0q1rsUrINMfEVZHp
	NhxNOgzA=
X-Gm-Gg: ASbGncvMoGMAh9azniWdNdThE3ZeEvRq6xC7V8sNXGEE9owOdAjnmQdZkqkY3sKsYeF
	mdaWRj6bcne7EIeIhz6KDV9BfN8zjj+Y9bq2+POoYxxmGUi7meUSLZcYswlurjfkWoMupILhqtk
	mEgUZ9Xam1Z/ynHHqqc3KGxOU31E6C1qH6k1+AtXFao2boeOAc+wqmgRU12N0FfoASrB4Euc5HJ
	IIEOWDvxU2OB8QxkwncHh2vLuU+m4ZfY4jzPyTZ3RU37S1whO6L3kGYMDWa3NNmWaIBkK5XA+VJ
	a4cEJBxsiFfwXZqKVKEJ5T0RDBAGjfT8gR/F0xo+BRZSHfyypzszlMejuHqonnUeZhb8GX1U/zH
	Np3f9CKKu073lscyBfxWR8A==
X-Google-Smtp-Source: AGHT+IGnOBvW0E6NXV1F/jlGY1sueqHdOmWBvkE0ycL/8cWGRkeUGSG3bu+eguNmgts+kPclqi1RAw==
X-Received: by 2002:a05:600c:64ca:b0:456:1d61:b0f2 with SMTP id 5b1f17b1804b1-45630b6d6dcmr139212165e9.30.1752941294010;
        Sat, 19 Jul 2025 09:08:14 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:caa7:1023:8441:61fc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b74f8a9sm51500725e9.26.2025.07.19.09.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 09:08:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] gpio: sysfs: Fix an end of loop test in gpiod_unexport()
Date: Sat, 19 Jul 2025 18:08:12 +0200
Message-ID: <175294121708.8606.9732156006120686279.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <747545bf-05f0-4f89-ba77-cb96bf9041f1@sabinyo.mountain>
References: <747545bf-05f0-4f89-ba77-cb96bf9041f1@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 18 Jul 2025 16:22:15 -0500, Dan Carpenter wrote:
> The test for "if (!desc_data)" does not work correctly because the list
> iterator in a list_for_each_entry() loop is always non-NULL. If we don't
> exit via a break, then it points to invalid memory.  Instead, use a tmp
> variable for the list iterator and only set the "desc_data" when we have
> found a match.
> 
> 
> [...]

Thanks for catching it. This is not obvious because in normal circumstances
we'll always find a matching descriptor and exit the loop via break so it's
hard to trigger a bug this way. Anyway, the patch is correct so applied.

[1/1] gpio: sysfs: Fix an end of loop test in gpiod_unexport()
      https://git.kernel.org/brgl/linux/c/5607f5ed3c5f30f41e72ce09c8e616af0fc0d474

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

