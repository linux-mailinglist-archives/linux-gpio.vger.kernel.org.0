Return-Path: <linux-gpio+bounces-18731-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7ACAA86C76
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 12:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D8FA9A315E
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 10:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F1E21A2C11;
	Sat, 12 Apr 2025 10:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F1PVhk6Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C131DB13A
	for <linux-gpio@vger.kernel.org>; Sat, 12 Apr 2025 10:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744452908; cv=none; b=rNvGJ46ISCI0ZfF8bbQvd1+HwAjeJfiDdHfvJqSShju42IiWF0rLiOjm0XlNvFyzwDofrClxk8hw6kLnhb6AO5o3Wdw2oxDCxKgfx9Sa80+bTw30YmiV1U5pbEGwdYs39pA93rakT2exVnCVci0+iL26xyEWmAs/FuKfa48pGh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744452908; c=relaxed/simple;
	bh=ec9o+usvzaDmx3DGgMMTtjczEBdGtLbMmGO/AqUrtyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXSJPKRue2ygIV7kEUawclg+QkCfvIgY9NMXpMUojk7X/cY3CVfXlZU8Es2Kd31gRynDdPO77mc3imDkbFecTfO5WJ2qEha43CRNQOxNkYkJh+jmmNNLnOpEtWoPPoSLybzeJA+xMOPZedA/vs85FBjXpWrg6WeMcmGsu6JF4No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F1PVhk6Z; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso28398485e9.1
        for <linux-gpio@vger.kernel.org>; Sat, 12 Apr 2025 03:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744452904; x=1745057704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A7fHQVByAhO5ET8TfAMvUtvtE+Jqiz2kAUnhQyP8lMo=;
        b=F1PVhk6Z51Oudl1g3lLBJ7pmr+ufCqsoQq0K6obGNgVmnzRPgWJHKWJIX9hJYKD0Uc
         lfwWu0B2MwIh5JzpyCpbQmpg2xiH1QYa2NLhoqjoEstoZ6RJW0VNaig2UhCeM0ghI5jm
         ucdk2tTHqK45RBjtLPdOFN8EFadyvOxAy1IDaUkSXGxmyLwTGga+JRO1fdKmjNneGGHR
         gXA9aucLQhEbmMWzFlahBWHD0DA+5zH1zor3Yxw5SKItJS+Hj43VdN4MEjA3Vv570ZRy
         DoiFckxN+pynPNJsqT/YD5YNeRP27vOFYrk8Ue8d1a0Bm4VkjsfcDfDHDj22QTYo5VcX
         c14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744452904; x=1745057704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7fHQVByAhO5ET8TfAMvUtvtE+Jqiz2kAUnhQyP8lMo=;
        b=uLL8qB5zfbxveiiNQt76STXS/az2z3jpaCeMWnQnuLRwL82zc4VyzAlygmblSzXeBZ
         GSnBqIEl9uUSEF0Q3kCuaENAY6o/HWKFP9g75b5gOkeq4YA5tTjQfEXg08++dsWBrr/e
         RM0e/ZNc4eSADGSyRZOtbxocelv8AAixbMgZ5pUjHGsal0PFdV68YhRk8C8vlc33yMUe
         PIq8kt5u6dhCGO+2/ori5QTs/pMqx7q6fZc1Kel/Eh2wSTPm6uME6UEn3b9kDwHki7Rp
         BEpJHk6sB9maqTIFu+WihMFExq8aXUW4ZNhokYYrLqyv8bCANIQl5Xk6XTVCvNVwt739
         WAJw==
X-Forwarded-Encrypted: i=1; AJvYcCVuHlRPo/U4Y/3nd82wgtyHY3slcrGjcpBbZVa6+/32tsWhR1fGXGWG0stFfmSQSX7bDL+MJGs8Z7jl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2aVKUwH9S5jSjk7k37E7mE5zxFAJENjL1XXyKPiizRH5QK+dM
	93Xk8Xng0oHbIdb1EXa3sBeRn2CvTbTL6qaMFkI+LVKsy/ktQpVU6N/a2zu5xEQ=
X-Gm-Gg: ASbGnctsx1pGl9QM6XHlu8Lgj5gxMKVGiqq0lwoahDagmzmkCo6N6xb3QOq1VJ3HXAO
	+pEmvtmeQjA3jnmgQTHcm+J3PT8RXOFiyKR7MoEUvk6bpDt1cC43pZ9S1r7H5fNgKE8a1Q2ZF2Z
	FANP6DyuxNsRyiQYIv4l/lkXAFt4CfoLziFjEpJR/16UndtlIZKr99KkmLMusTXMFNORLDxlfbW
	rLm/moQZc95Z9pB8mqtcZvEm2EXijvaXzIiwXN58GJ/MVnKYzEMojRZuacGe0RcBUplUMTkKZm8
	u2TFw4tuhgmerZjtf4NnH25oqiJ9Jd+Lrn8/X0IZZH0pgA==
X-Google-Smtp-Source: AGHT+IEb2YD4p8Gn575c6+UDDJnXqr10gazTooH6MgrOd67+x5QilRkEOOPF4Jo0Z3LOPZCEzBmVgQ==
X-Received: by 2002:a05:600c:3848:b0:43d:988b:7732 with SMTP id 5b1f17b1804b1-43f3a94d9bbmr52535175e9.14.1744452904493;
        Sat, 12 Apr 2025 03:15:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f23572b5bsm110862445e9.28.2025.04.12.03.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 03:15:04 -0700 (PDT)
Date: Sat, 12 Apr 2025 13:15:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Koichiro Den <koichiro.den@canonical.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] gpio: aggregator: fix "_sysfs" prefix check in
 gpio_aggregator_make_group()
Message-ID: <30210ed77b40b4b6629de659cb56b9ec7832c447.1744452787.git.dan.carpenter@linaro.org>
References: <cover.1744452787.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1744452787.git.dan.carpenter@linaro.org>

This code is intended to reject strings that start with "_sysfs" but the
strcmp() limit is wrong so checks the whole string instead of the prefix.

Fixes: 83c8e3df642f ("gpio: aggregator: expose aggregator created via legacy sysfs to configfs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpio/gpio-aggregator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index dde969f29ee2..b4c9e373a6ec 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -1016,7 +1016,7 @@ gpio_aggregator_make_group(struct config_group *group, const char *name)
 	 * for devices create via legacy sysfs interface.
 	 */
 	if (strncmp(name, AGGREGATOR_LEGACY_PREFIX,
-		    sizeof(AGGREGATOR_LEGACY_PREFIX)) == 0)
+		    sizeof(AGGREGATOR_LEGACY_PREFIX) - 1) == 0)
 		return ERR_PTR(-EINVAL);
 
 	/* arg space is unneeded */
-- 
2.47.2


