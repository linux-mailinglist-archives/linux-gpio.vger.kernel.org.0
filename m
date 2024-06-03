Return-Path: <linux-gpio+bounces-7044-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B518D7D44
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 10:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 410E5282E5E
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 08:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1FE36D1A4;
	Mon,  3 Jun 2024 08:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="n0u0wsn5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F256EB5B
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 08:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717403078; cv=none; b=mLH3fIIA4Vs4pxv1FYBjTNygqpT82PjfvpAq/qThCwzD7ANDDJwOwXqHVU9fNs74c7mQPPslpmTb5r9Sg5QGbR2Cg3CaEoyFfG5ppa68OKDlKZHni7OHRb+XlWkHeOfsfFGY8WjLsg8RjaQ/fA4+qWeadxvTaGUPMhERDGQefW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717403078; c=relaxed/simple;
	bh=w8Flzgxr6omuysxB/zVDD/Wv2MRLsDhFqe+NdyAOjgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oGgLcOmQxzsVIRT4W83z2dnSQnn2ndhYDlDYi1WMe1tNEjcMkzjjFWBdCLs32jv/kPDuWvsfbi88XjSUcyB8GdliDMzdqBdt/wbFDnLxg+1mxx1othqH/pLQDwVFrD7UToIAQu+d3cdTtQZMpnn7JkhYdz1QCLhl5hxysLSimrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=n0u0wsn5; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42133f8432aso12847575e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 01:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717403075; x=1718007875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYoD7NRleroa5h8G1WvcKj1uz39B0Rluk/+UjUyZroE=;
        b=n0u0wsn5bsRDbK3i/YSikL1yA6QxzPexQRuCBRZe0LCF64BxLcz0PLy5Fjj/xiU41p
         HIieliiI33pynf0t3nCLxG/1F1IkDhz4IE7EBLP73ZYKD1YwHEd+RA3OYmc9Qp1MmuMp
         n74n/yVCZRR2KeLdJyp1fgxz8R/9LaBcpM28rDOSralgcZ6CfPreXLdKOHbSRPCdzSfc
         V0pCOh+T+jC83cBIMk94+Oe8Rt3vtqbVmosevg5LxYuhomJ64iL7I0yOX1LiM4gO+OL4
         Oksfu/DokF8qEl+bwvxYm2tGwW963b21AeQyN5XPG5TdUGGFjL2/L5rDxaCc/RfLLyri
         /rZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717403075; x=1718007875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DYoD7NRleroa5h8G1WvcKj1uz39B0Rluk/+UjUyZroE=;
        b=GKkUbQCxBwkNWizgeYSFvMNwmmOg8ov4ZauIBgM+KgmGjC5bmjXvUA/0T9je5r7qbZ
         e7oou3/OVhV4+dNgsdV1qoLLWYS3zkvrLGNJLzDWcFXubwfYvQcBImcpeRYRqd9lSwQs
         ZAhpJxjOE+mYpOO38ljghOEfEBRIl9zkoz0iB9Ph9yddkuQjf3aCx7Up9WXwps1x9faK
         vrYItWFq+ErsmOZhrMFCsQtiPrDi7t3DQqWqkHusfDlUPmLV0LOQwXvOhzJEB6ftHvgX
         KSWXNsEnG+jXMUwYMXANCCQEkBkvhCToIGQfhswJTwaIExWkwoDwd1hcx1HTuqCuSYOi
         4Wlw==
X-Forwarded-Encrypted: i=1; AJvYcCWIAU8tjZFDxu4sSVCWY4Q/FbEFpl8qmnTp4SCNRRAn0X4RDmUomqbzGVDG07of9LEfFKqrRnDCkDaJAKU0HQf3zy5cY/Nky/TGgQ==
X-Gm-Message-State: AOJu0YxUNJVmYC7qxE00l0h/p5HtN1JnaIu26mUg3plYbkTKm+atMkf2
	eWZgvG01zzwpU3jvO6+2qQoP6ChFHWQbdyoJoyYQ9PessqxSoWYuEg+yqnAzpyE=
X-Google-Smtp-Source: AGHT+IHKi8KVVVFqdZsWLfi9GAnJoyzakWoKYzj9dIPgMV835EZmE5hRnkcNH43kvujeh06Rzu/jOg==
X-Received: by 2002:a05:600c:46d3:b0:41f:e4ad:9ae4 with SMTP id 5b1f17b1804b1-4212e076433mr60992745e9.23.1717403075098;
        Mon, 03 Jun 2024 01:24:35 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:5b1:48e9:27a3:7085])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4213e75eef3sm17299255e9.6.2024.06.03.01.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 01:24:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: brgl@bgdev.pl,
	Fabio Estevam <festevam@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] gpio: pca953x: Add support for TI TCA9535 variant
Date: Mon,  3 Jun 2024 10:24:33 +0200
Message-ID: <171740307062.11155.18104329080684685270.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240531121801.2161154-1-festevam@gmail.com>
References: <20240531121801.2161154-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 31 May 2024 09:18:00 -0300, Fabio Estevam wrote:
> Add support for the TI TCA9535 variant.
> 
> The NXP PCA9535 is already supported by the driver.
> 
> TCA9535 supports lower voltage operation (down to 1.65V VCC)
> compared to PCA (down to 2.3V VCC).
> 
> [...]

Applied, thanks!

[1/2] gpio: pca953x: Add support for TI TCA9535 variant
      commit: 82466bb622e921fb1a3dc552c9e3d20b3c1da8ad
[2/2] dt-bindings: gpio: pca95xx: Document the TI TCA9535 variant
      commit: 8fce7727a70e037002800eb5b70995a7cd337c7a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

