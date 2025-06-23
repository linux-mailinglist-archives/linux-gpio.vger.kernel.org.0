Return-Path: <linux-gpio+bounces-21978-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA57FAE3687
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 09:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8293D1890005
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 07:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CBED1DF97C;
	Mon, 23 Jun 2025 07:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LuYKb2xU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260B9847B
	for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 07:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750662997; cv=none; b=X/Gx799EYmE4uDJSyeDDetLNhkpjSs2BGCWmj95/du1oD3oyd6CeXlC2kwuV2RqFUItd9her9yYUTcTCXepWLwcZgaxjjiX7AywrTn5JDfG9uJKLpUumW+KgI3Gfaq95JmSsyDVqo+QJbOuajStQ1TyABMPBb0BR5366ls3ma48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750662997; c=relaxed/simple;
	bh=8O3gEP3+T88+/ojbk5Me4OyvYjohYzBZc1dpuIx8xFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jP/ldD8BBrloZzoJovhvWSiGkW2jU3w4kLdPdrqZ3GetT6YkYeqMVHMMYWNnpbYYiNxRuXWQFXJZ9mVaFwxdDEOTYOGCOugF7EQ24bfJSuO14ojVmlt9G07sZpg9kMfh0mDe56C0jlxIq82vlEbGQp+P14ohkw4qPJpwaPUzTr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LuYKb2xU; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-453608ed113so33316995e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 00:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750662993; x=1751267793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=liJJPl8dY//CdYSiJkeFpH4++k9pjjPDNYZyNxezwf8=;
        b=LuYKb2xUAfYl1wIPyyoyLP9z9reBK6z3qvAlj6uG8x+Yk7V+b0DH2Sz1fckIDi6Gzm
         ZZFn+diGS5rswhqotr+h/inVp8s+06sPek89sGs/nstWGgarubkXncCowgmzulw6a+q9
         bp1CYyNhiOz2/PsNG0290cv2TQWIblgPqfqSGXksPh8/iTouu+38NQDNUlyifNZbnbDZ
         VLS869ME0EKq2znK7xo8MaDOnCXa26E+udcbEQvf7p3GlsFSWtuaZ3hzJsY2mOyF20Fh
         CSVVKyEJgnKDqicgGexCDBnJNPrCZzHYFyXDdHiu0xZQByLAGJEZ8MiZSQinrJmdIAkL
         pFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750662993; x=1751267793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=liJJPl8dY//CdYSiJkeFpH4++k9pjjPDNYZyNxezwf8=;
        b=WMsq5vT1P60C5i7BLWJQFxDmKEZzxDr1HWVboq78bsi6Dlqf7gwJLWmlccTzA+OlxJ
         +20R8m6xq77S6SIwqFhpIsKP7ONiAWv/6xR80iRIj4VQcpui/bWAUuww70pwtbcGNqvs
         zWMcEwq69Q6yKXC5GYUsKfKr9kuBJLr8tFuO1Q0NbpbcpEScNHzB8YPWdnjz+cOLNguV
         JjPbtWFuEALtx1bpPDHriALsnbWmePTvShiLBog2e0YtOfj7tmWr5kZp9sK1BSdIDTjo
         Dm3Y73ljK1ULbW7ScHOnAvN8KzW6g63ahmtlWsWgfIkuuB97mUKU6i5aJAGK2xFAjAue
         YPdg==
X-Gm-Message-State: AOJu0Yzp1ql9THLCSr/XaMZeoEknubavCZMCBUDo6yOd7Hu/A8jLTyfc
	faRMgjjsrtbb6wgcdvb1izIl+TZr7nFL95/lXbPnRu3rEs6SaMhxt18PNag3NgYFFPuZgnxRThd
	85oRwLOE=
X-Gm-Gg: ASbGnctGCTWtbyxDNVpwuuIi5iYMK3illqYe3YNR2YYYD8TZ2udG05ehXKA/BeUtiKZ
	SEbpMNUyQaowt7RLn9rbCz1/kBNsXh9kw4mzHX+ABRIm6PvrVrio5fh/FkSEflnH36Da973lVDb
	5/oVePf3loCbn+guljDl4wyHDtRA6mxXY0/QJgbppNu3pKcYQm5kJ2arNcAIJ1kY7WjgmPLVZFY
	u80LD/NWI4iXcYd/pjxC+ZrofEWh9gUG7vhpeZPIsmdxCA4fpjaX2RfydOKWuKziS5vsOxkB9ps
	8iZ36fQIt9B9qM55T3aOKFoqi5gbg+5dXWUzXMNvhsNtQ6bm9NLI5UkxXRFEEBmn5Vk62jpd
X-Google-Smtp-Source: AGHT+IHzyDpp2qGypLpfXfJVxyNiDlToFHj9XUgSVxBPe6NLXlydGzO5SPHyU+bIMznf3ug7wz4S1Q==
X-Received: by 2002:a05:600c:190b:b0:44a:b478:1387 with SMTP id 5b1f17b1804b1-453659eebd5mr115535635e9.17.1750662992653;
        Mon, 23 Jun 2025 00:16:32 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5ce:238e:62a6:cbbc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535eac92c6sm134894595e9.22.2025.06.23.00.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 00:16:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Antonio Quartulli <antonio@mandelbit.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib-sysfs: fix use-after-free in error path
Date: Mon, 23 Jun 2025 09:16:30 +0200
Message-ID: <175066296706.10516.10782817854642788186.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250622220221.28025-1-antonio@mandelbit.com>
References: <20250622220221.28025-1-antonio@mandelbit.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 23 Jun 2025 00:02:21 +0200, Antonio Quartulli wrote:
> When invoking device_create_with_groups() its return
> value is stored in `data->cdev_base`.
> However, in case of faiure, `data` is first
> freed and then derefernced in order to return
> `data->cdev_base`.
> 
> Fix the use-after-free by extracting the error
> code before free'ing `data`.
> 
> [...]

Thanks for the catch. I tweaked the commit message and added the Fixes: tag.
Applied, thanks!

[1/1] gpiolib-sysfs: fix use-after-free in error path
      https://git.kernel.org/brgl/linux/c/e6bb78570f7d531622ec572ef9ddbe6e66ff16ce

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

