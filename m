Return-Path: <linux-gpio+bounces-21140-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D83AD2FA5
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 10:13:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3C62188F53C
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 08:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C1F6280319;
	Tue, 10 Jun 2025 08:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="r44G/iT4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855FE28001A
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 08:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543210; cv=none; b=PNUOoZdCTn6wdIHMFMgkg251YsFVJS/OGa/Tsvc7l+Cahtke997L5szHTfCj6pN86B0q8iGjy9FKSmf1BHVt2Cj+TI8bx28ECdTzhafroAix5k6R0KvRcwtZUPf+dlMvJVB/SQBS7mysIC+e2/lKIeJmBXzGFAaYLfqe5i0ZnuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543210; c=relaxed/simple;
	bh=AGrB1k2K4d+j7W5uHQba0DcCDvIDpeMB5mA7xW6HOjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tApf+5St3E/6EMWpj06ncuKvzCBjlWxBVJGMZmYh0aBhWxyhLDtyQ1zOR+DdE+JiUgWvfAvPJoxGtfCiPattDDapH0kKZ8QdoT7Mrlgp0DqVMFktwJjBO6OrClB4DFxDRX40+iG3BHuEHjQUXLiKQpYtDR4FZ1IEt38lKLAZahQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=r44G/iT4; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a3798794d3so4384089f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 01:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749543207; x=1750148007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3DDdOm3PjmMZGWv7sfjoGBzae0xVF6b9amq2E2mQlBQ=;
        b=r44G/iT4eUJB2vQYCBF9R6Rtq4Ki0QcTQkyVz5TYvM+v5xM88rUW7HzlI96+q1dsjj
         5MM1a8aMZxfmAgEV+drD0TXE/KdkJClfGWG4b+Sxlct13BHZHasqDpIbLmG6ZKcnfVqA
         IE7pHnpmBxv5GWN6MihtSuNZbVfu5Gf3BD8KWFo29vToEX9uVDSgjwnUJvkrQBBfVNIP
         aRd/ReaVihJyMFBhPCEAFOHsRWAcn2VEwrKRe/nomU4K8gcGNl15qD8EN5uuCg6XuIKu
         PN3laAUP5fTLSYZ+v6D0ahJJoi9EPM0CRutMAT+5DAkH9VlVapT5GVLPxBXMacDQ8TX0
         RfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543207; x=1750148007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3DDdOm3PjmMZGWv7sfjoGBzae0xVF6b9amq2E2mQlBQ=;
        b=c5KmCHv2iVlDtytaxnYQ9UqQ6WUGfeB8MYKjnjjDumjT6b6HuYDe+HTvWjBVo0vkZC
         at7olY9Arxz6OGsVQa05XCTYn3TAbnQWrqDomfOJ/tkWx5LPfCOPdZhZkGvdZgv9/Qxy
         R3VEC1U0xTHtRQOoqQ69X/0WQsRuPeonNnMO6F0dI8DZs4PocwOsH5uT6+PjXCNJugdg
         Fqit0WBzdR1banz/PdEMCh/q034THAg8d3o0VGGhHY/4df2G22xiqjM2b3+7gQlonqAg
         dC1wwAHdaQP7HGfCKJLdhtBhXd4bxuyV7cfRg9MIY7CvzQUBQhiIwZ0cLaB5ConoZ6iS
         5qKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCtPtD5pS46yWbFAVbkBmERqgPy4No4U1kndCMw0EUnzsF+Uh/U0LE7xxfQCfdkJNRDPLWSNiQZNXt@vger.kernel.org
X-Gm-Message-State: AOJu0YwmzMJ/Qf1Wo+g1h/4lPwDK6zskHcMEqDvD+2qg4ojzDzJ17DpQ
	9ZC8h6YF+Vtk0LDQPTzGjynCP+VWBW5yN0a+I25ihHnF5A6tcQGIjMBnHx3WNKTfRhU=
X-Gm-Gg: ASbGncuhim1X94kKiL7OVXcL8P14Tu82BaMG2Wn4n/Tbls+JMJEa0lznNyHXdIy4Ykf
	sJo91sxNcR0v1g3cV0jhTGQxP4zK5uGo8TLwe+kVj6ito2YmRK9g3H+dhzA15hIdQeBB8rqF4tI
	gqSS3MPc4IsxrgptTs0FpVx1Rdu/wURFaw91obQCs9hS04eA5Kl2us37O6ZSR+puCXNXcbxM1UJ
	9Kf19Hl/uQ1tvJex5l9rQeejhsSH+XJnuTRXf5vZ6D8WojRXBJGQkGn4EzYo4xKsQSK7YnrGzJC
	v/gUFvLE/OlymKbpmT4pXWSOt//nzNWMLbeoPlCXjeYgDSvnq596yQQHmsoy
X-Google-Smtp-Source: AGHT+IGd0hRk+75zKFj4sdKdcpiZwWHStM03Gr7kQJsVjryb0vZsuhZQnQD8wN1guY6/FynJa1139Q==
X-Received: by 2002:a05:6000:25c6:b0:3a3:7749:9783 with SMTP id ffacd0b85a97d-3a531ce7324mr11978738f8f.51.1749543206999;
        Tue, 10 Jun 2025 01:13:26 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323b5147sm11852958f8f.37.2025.06.10.01.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:13:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	f.fangjian@huawei.com,
	Yang Shen <shenyang39@huawei.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Update HiSilicon GPIO driver maintainer
Date: Tue, 10 Jun 2025 10:13:19 +0200
Message-ID: <174954319673.29199.11108527268991181680.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250529034023.3780376-1-shenyang39@huawei.com>
References: <20250529034023.3780376-1-shenyang39@huawei.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 29 May 2025 11:40:23 +0800, Yang Shen wrote:
> Add Yang Shen as the maintainer of the HiSilicon GPIO driver,
> replacing Jay Fang.
> 
> 

Applied, thanks!

[1/1] MAINTAINERS: Update HiSilicon GPIO driver maintainer
      https://git.kernel.org/brgl/linux/c/e0d4a0f1d066f14522049e827107a577444d9183

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

