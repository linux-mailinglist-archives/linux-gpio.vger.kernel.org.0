Return-Path: <linux-gpio+bounces-13695-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DA69EAE26
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 11:39:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEF87188857B
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 10:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF2F197A7F;
	Tue, 10 Dec 2024 10:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Up5mfGAV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0506223DE9E
	for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2024 10:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733827172; cv=none; b=NI1xrRa8zAO0TwslkGwagBnzVprYHJEdrP0iepHXJ9nJpTMREAybjz1ElKWZgvUCYKLlWhKn6NLZI3nxqMuctW7G2UwmNiMvXFnxfZEvridSW8SL2O5THHbWahSRLEgkVVRQJo6lSrkPyEo18JLuqk6exMQcw5ZzLPzsnSADdgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733827172; c=relaxed/simple;
	bh=o7CgEI6iSVp590w99ku9lXpUsxdXbV5CjhKumuzj6mE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BJzI9DS6Xas3eHEyT1QtfgT6rT3caT0HQxmdkP7fa0+ardc0lwym68e+niKD97aftnyMB7GJKhRCPLwr5Wy19V9qzzW8TSqCi2HQCiPs1JU+z7OTJEybHRIJKxtFFYwbuDn70KLZSwV0Zcuq2JpNP7AJ63dV1lufZV5umoSNCWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Up5mfGAV; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-435005192d1so10665715e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2024 02:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733827169; x=1734431969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcfeEXe1mNA4P8zvxGvKZ5/Yhu8uMJi8MiJ6AFNB4Oo=;
        b=Up5mfGAVAF2zZfI4VAVt5XRbdS9Hr55th47FP+H76RSo861IR4+OaJH3TRGfYNLwPb
         HqPKcQC3Wc9wUbyridHDuFSylIxV9GezujfsuQCU0l6SVxRmXDJZapyjJvDb/6DDCnl9
         0PDO9X7q8jTNx+I6E6uz0AJ6H5K05hsd/1UCm8JrTtZo1xBD70dVTu3D1+QjTbLxm8+r
         gUB2xbAIPVvsiukiOFpe3ofo+1bjHWxqZJCaUedHy/0KuuOVmVj2EX256N+xkxdUwPb4
         B2x3sDNeV5/UBh8UQPVdCJ9Ix4cz2LY9Equn+G1ubDsEAvGadYcWLGZ7OD3zce0DlD+p
         q5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733827169; x=1734431969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wcfeEXe1mNA4P8zvxGvKZ5/Yhu8uMJi8MiJ6AFNB4Oo=;
        b=b9lcxEl7UaABAO/PdH9bkGMlRNj4i3SjOO4nAoz3NLujQGU4Im0MpyL+Jr4AXAgRHj
         XwB+9+173ynL/cTvojnk4y0khJc8tAGHO1wgSat0YlpQWG75a0IIrRYGgYW/s1hw1M9P
         iKQIxzNtVAeEqVyJE/fFHuYAIj4bgheUNbL7rO2q3O1k4hgXolqR3zYBSu0WvoIU0Nuq
         v9I/PL7Zl7JhIUVpNFlKT180YqoaYsaaajgCF3WA4X5T6XOLEwyM44qNvivZsj9B1SU3
         TNHrrmyQzq5X2+I2QynOsTz/gLpMcdTQmsxszZn3Mtv/ZB+ZuIU/vtUpj7G4pQ3mVM0y
         vsHA==
X-Forwarded-Encrypted: i=1; AJvYcCWu6r6oFcs5acqqr+rzhBY1grgvawZ6ejAZV1uFLGU/mUe/5ZRjMso+CjvqCcUSr+PirNzmZs51nk+T@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+wRcFVnulBpWmz+9B2XtfbkpEtwLFX2SMvACYMb1kabwBx5t2
	aw1nO+5a/+j7aCYLD+h2sfdIBPBeer0P1C8/5+EmQur10fBacI2Seyq8geflGag=
X-Gm-Gg: ASbGncsZBeo7W1kTlg24dXlTsRmyDZgYTVnBFpNTT0ukkg8ubFyxoBSRNn0o1DS51aK
	5ojRgIIcN1H/K0DQQ+05dS/KaPiK4Xi4AaTBUzh3mrRDclx5Sha7xBI2EyOWO7rjUSAbwGeHpdI
	GGEcUr79qw256yglp/xOJQXcCEDIX9YJJEo/zrtb1rCwN8cDVZX+DYSrPnC8g4yR52kb9p52zdY
	Am1KTB12MQfOEeQR/WhSZ9k3H5Dl7YrWipEwDKa+sB1678IvWm4HQ==
X-Google-Smtp-Source: AGHT+IEmepQ/PX8SQY63GgEwSKl0Ke1i43IGbYtEq6GDgTYIR3xbzdFvuqOEnvSA0bpn+uLjbWm5Vw==
X-Received: by 2002:a5d:59ad:0:b0:385:e013:b842 with SMTP id ffacd0b85a97d-3862b35d194mr12249557f8f.14.1733827169064;
        Tue, 10 Dec 2024 02:39:29 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4c2b:c454:658c:f771])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862a9705dfsm13272317f8f.4.2024.12.10.02.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 02:39:28 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: William Breathitt Gray <wbg@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: idio-16: Actually make use of the GPIO_IDIO_16 symbol namespace
Date: Tue, 10 Dec 2024 11:39:27 +0100
Message-ID: <173382716259.49612.14787326338988861616.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241203172631.1647792-2-u.kleine-koenig@baylibre.com>
References: <20241203172631.1647792-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 03 Dec 2024 18:26:30 +0100, Uwe Kleine-König wrote:
> DEFAULT_SYMBOL_NAMESPACE must already be defined when <linux/export.h>
> is included. So move the define above the include block.
> 
> 

Applied, thanks!

[1/1] gpio: idio-16: Actually make use of the GPIO_IDIO_16 symbol namespace
      commit: 9ac4b58fcef0f9fc03fa6e126a5f53c1c71ada8a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

