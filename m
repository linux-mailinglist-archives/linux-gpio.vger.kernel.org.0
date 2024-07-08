Return-Path: <linux-gpio+bounces-8109-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FBE92A94E
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 20:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 105AC1F21EB0
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 18:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6372614A614;
	Mon,  8 Jul 2024 18:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HO3tqSr2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E1714884B
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jul 2024 18:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720464846; cv=none; b=U5IYbCS5a1Nzk0ocMnTDcCm+5gwJa6Agm8Dq0KwzPDmAJiGX5Glinn0jE68GyuQC/XqmAlaz+uiScfd0rP3ZySHTrCL52gO+rK85DXCTgpYu4rYSpU/pEZle+PuhlAFbc8fqQ7jeoBcIAiFM3N4QDujnLZz29F5lvHXl5iS6C+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720464846; c=relaxed/simple;
	bh=8Hf2Har4Mq1yc4LSyBaNZEnpxLWHvAxzMvfXIfsh9j4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RFtibXvfe05Ezz8RYPpMuYzB+2czEFOxyqaba3klrfYotkxBUIkRJy/VgDSEJO4RriCcM1/jphnPU2Swdwh5bBZfJe+oVKVeBp+xPc313vj4RLAi27M68GIjOON9xKm/ydq4YfK2Cx9zN/gF8eoGn7FAK+QiiDcYP4cODCpwJA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HO3tqSr2; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42573d3f7e4so29719005e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jul 2024 11:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720464843; x=1721069643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pT01EVYT8ABUHPJ7UsGC7hqSvxo/HZtVP1+623dge1s=;
        b=HO3tqSr2BY5qZ//Fgj9wz8owZ6uRA4BiLbyQ8i6lppVzEs9zf9rflEN7n24PHaHkoT
         EXdfube9ZURkoxYKkneMNiR/+txvvrnndczTh2OKtWkPOYocStOCzhdm+IS0NK0UzSrj
         k509VERhVACo0l7w80Kt5e044RyUAUxviDonvQ1WByufZhr7jl2yRrOEHl1f6pCN1Gv1
         6WxYJvOA1OuX/m580zIhKznUm9PDEElZ+RN8Fw7r/aTi7F/Cnk8Hn4a2LkWu+i9t/C27
         MthujZQ4wLkBJgj1WvOxtdzO0bwXf7Z4MlhbvNZI1bKysdC/LVT2ECavJ8gMLq1DBJSg
         aujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720464843; x=1721069643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pT01EVYT8ABUHPJ7UsGC7hqSvxo/HZtVP1+623dge1s=;
        b=PO5G3ewlt732z2kdwJAvagUO6PGMjzNIDtG7V1ivlAVD9eeCLKaSdATrI5rz12P1zq
         +DcwCBhAECBipwKnPgpgA34w6/WnJI+UPojd+ChO9EvBia4RA1SoEYSktgY1H19IgCMM
         z04dD6gS3cQ/ue9B29qfP1VKzYj7HbebTJgYzshu3VJzouf4Ip79Xn/bd6sEEi9XGZmr
         dWecrOAUrgsc0hL74/UKmYE5O/YVod/Uscqjabymn5KPvjtDDw4Lf2bwGtvrQp/eYcE1
         RyLZHpRJvFK12JB8ucsiQTNdxVoKhsdBIINyzTGJsnrw0ZmsHSHvCwgnmeuX157XGu0g
         AOxQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+A1Wo4wYa0UDcz1S25VpBM4wBvBJKQ/0Fb3wipxv9O+LPRNNgrdRnAFrkHV9gFMeCozvl9FEr/t+fDA/WKYT/QVjbsy5nKCJWmA==
X-Gm-Message-State: AOJu0Yz6I5w6TBjD//XX3gteO5uz05JzfdHQUgQKtvdgzLctFruzzj81
	zARsxGyxQNYm4gl0vYtbY/rHGwY+ECdYLJ+9765SJGuuUnWozrXW+lG16k5KpWQ=
X-Google-Smtp-Source: AGHT+IFvGlaP1zFQrTElETV+qhEPpbKR2XlsLS+p5i+P5Y7C4+7jlg8FCm/3DqqAJsmvDoL6vZjMGw==
X-Received: by 2002:adf:fa4c:0:b0:367:98e6:362b with SMTP id ffacd0b85a97d-367ceaa0cf1mr285727f8f.42.1720464842821;
        Mon, 08 Jul 2024 11:54:02 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a2a3:9ebc:2cb5:a86a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfab80asm472091f8f.109.2024.07.08.11.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 11:54:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH] bindings: rust: tests: set direction when reconfiguring lines
Date: Mon,  8 Jul 2024 20:54:00 +0200
Message-ID: <172046483123.131736.12540549871846925304.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240708094858.85015-1-brgl@bgdev.pl>
References: <20240708094858.85015-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 08 Jul 2024 11:48:58 +0200, Bartosz Golaszewski wrote:
> Linux kernel commit b44039638741 ("gpiolib: cdev: Ignore reconfiguration
> without direction") made the direction setting mandatory for line config
> passed to the kernel when reconfiguring requested lines. Fix the Rust
> test cases which don't do it and now fail due to the rest of the
> settings being ignored.
> 
> 
> [...]

Applied, thanks!

[1/1] bindings: rust: tests: set direction when reconfiguring lines
      commit: 2515fae57d88e0f4e916e66e358912b9f98914dd

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

