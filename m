Return-Path: <linux-gpio+bounces-11737-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D86C9A9A76
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 09:05:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83AC31C21E47
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 07:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D1C146D59;
	Tue, 22 Oct 2024 07:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WafpElgq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466A812FB2E
	for <linux-gpio@vger.kernel.org>; Tue, 22 Oct 2024 07:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729580749; cv=none; b=s8Iq4BzpQyntDygDwbnUTHHFmlgRsyKfbi19ZnPLUJn9XkQf0NX50KRUyR4CQhrm5IciijHylL/04jHjQ7sQM9wz53zGqtSBHxI66RL2GCCbrspnbHEas8jVww2l/GCbhnLYnf7PaW4D4qHJTVnZPSF006/ohgI7i6RymShOAEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729580749; c=relaxed/simple;
	bh=fU1pq2YDkARn/8i13M3r8zhhZ54jIPbZZcEn/2a3SRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NFkAKXrUf0KqxArJWxiz4ay2x1c1DsVkY+vwN6R+5bqfiSAswxru6NWSd72jEb4cCa3HRHH2TBTF6Q7AuMZk7yef8wGu9cD0jo4OtJ/UwXHIKTC9uNf4idlWbOCcWbqV2cI723g4uh8kWt4qfFRi+Jo9yU03z0oot1WSTn4IbpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WafpElgq; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4314a26002bso58288375e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Oct 2024 00:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729580746; x=1730185546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3/nDqMJPaNJuf00YBjIDVG9gKreA0a75aL0NV/IaJc=;
        b=WafpElgq6dZT3atwVorV7GPkbGDSKn6ooM8fPyb6vPTbprLh1op87sdE/Jg2QkP2mr
         7MMr10581g//Vz5A9xzX1W0R1vYebgiEwEMDBWwzjVyNJnuHXRoSvIkgrJnaCB4Z51h9
         9coYkTAwsg9rzVMl5Y6KJm8/DgrSNwIlEXFEBxxjUulBBwL9pF/HoEj3FmuGN9G5p+2I
         mI6I9Zw0fA3AD/U0lxgAKXt6NGlNNw7pV8ZVIaDtKdKFspBSy4LIvdyR4ocPzGN6qk+a
         rr3WPpUpK7dEQPaFAOnGDELzUkS1Z4hs4NfhrOITSPFB2KKTzEBGxbI9ihHA1sQZrTDd
         SWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729580746; x=1730185546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o3/nDqMJPaNJuf00YBjIDVG9gKreA0a75aL0NV/IaJc=;
        b=RtpcJD3qEUmtRl3hglCbX5heepq6fcecKhmE3RYq/bF/xKh158FGQGnkoGSHQ+RjYz
         ACegLKmWC2rBLVhE3hwkrYp7p7tlFcK1IoDixQMWhPyO0FN48XGpuTD+/h1lFbToeMxn
         b6wD80PFxR/Y3iVx7Sww9dc8+2oHR+ZGC7X/33Y178sFExMJzw49XuPrhAteg1pMngk8
         XSYkyIRflWcfa+3MMDv9D8mM58xaF/yM4ch7o3G4tL1yicwtQyhtEyJHLY8NrzzR7egN
         +6OnlA9bZwLbF/Nhcayf+evBRGyJ9YVkj6Yft6t9/RXc6xV8yyuLMWU5nE9IEwOEYWFj
         84nQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxi/Vqr8g7GsAOvd7HvkDJMz6wB0a3DtUdYECC0AbMnnHAI9H2JndI+VXfqyeYMDjhFPjFaGkNEQOO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6LUbMKJBN0K8wuNtx8KaFF1J4r44gvzPTby4V5LML8qkM90mp
	TJoMmzgD7CBPIQRBCb6zwJwQRqUIZMTxmt47ogcgpCIJje1sc6IfwlpDmBd7bfs=
X-Google-Smtp-Source: AGHT+IHCRI46hWEzcFDBUNJsCq5UYzke26llX68brkWC87ZRtJmssoG+5yvrlMvbV4uGaWUYps1NSg==
X-Received: by 2002:a05:600c:4f8b:b0:431:46fe:4cad with SMTP id 5b1f17b1804b1-4316163bbe0mr122933005e9.9.1729580746551;
        Tue, 22 Oct 2024 00:05:46 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:9c8b:c7e5:66f5:b8f1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f5c3173sm78618925e9.33.2024.10.22.00.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 00:05:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] gpio: grgpio: drop Kconfig dependency on OF_GPIO
Date: Tue, 22 Oct 2024 09:05:43 +0200
Message-ID: <172958074196.16776.4696590101270582746.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241015131832.44678-1-brgl@bgdev.pl>
References: <20241015131832.44678-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 15 Oct 2024 15:18:29 +0200, Bartosz Golaszewski wrote:
> This driver has no build-time dependency on gpiolib-of so remove the
> Kconfig switch.
> 
> 

Applied, thanks!

[1/4] gpio: grgpio: drop Kconfig dependency on OF_GPIO
      commit: bc40668def384256673bc18296865869c4a4187b
[2/4] gpio: grgpio: order headers alphabetically
      commit: 537ec282f52a4b4b8921c3a395d721affd29c225
[3/4] gpio: grgpio: use a helper variable to store the address of ofdev->dev
      commit: d036ae41cebdfae92666024163c109b8fef516fa
[4/4] gpio: grgpio: remove remove()
      commit: 3aba8402910bfab998d5cf6c84744de5db466936

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

