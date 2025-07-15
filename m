Return-Path: <linux-gpio+bounces-23300-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99808B0616F
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 16:40:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86A5E505869
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 14:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A7EB1EA7CF;
	Tue, 15 Jul 2025 14:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="X2NjWf0T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9E71E834E
	for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 14:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752589794; cv=none; b=u8+LiYGVsyYv6iyE/Eh2TqcqWLHRN1Xe2kH+TdlXWvEn23RYASX4fruvR5fcTvRUQR/naeC7CRo5IG7eqK+ev3os7Vhv6wDmNrZugofImHGcvNNzBZtjgg9g7fw6gEbZ9xBX1tea4TLtP/nF6toUDTymg68I1FhYiZPEwCT/FAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752589794; c=relaxed/simple;
	bh=zWAaEL2JzeYsL13AYlJ8q46U97iP3YuD+h6PLZaJO2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RZy+8xZGJtUCzRPyuMR97ouaflRAXrCMgkNM3Dn+IDas3ArxwTr+Hp8DXrgE4DDEe6nQ5ZTlk112KCTjIKkOUsOdfB8j14rPef+m9TydmCkHdxzaIVyazr0k910yqWJIyfJBt+YxSGpWJRZnlz0CrzqgV15oFt0dVc73gca4mEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=X2NjWf0T; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b45edf2303so4767264f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 07:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752589790; x=1753194590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaCO1i2HMoUVQ2obL9JJgr4t9a4dYHoNbtH4QyB3txg=;
        b=X2NjWf0TuPkNFeLgKZpPbt8dBrqQPGhnoR6Q/hsgLBiQCBQhKu1R6Zy9hFtg2Gmhkd
         9NLvKTqsFhCZSJVdCmzvsCIpjJ4/39JagA9X+nF/58pK5Goitv9NKMNECiysHA1QIfN5
         4jG5J9hMwgJuxL9RVg0ZlAwC6vgcaqWkQn7wLIvPOvuzC7eZBIAyz0y9rqQFE+C1eN4B
         3nvf3a9so/+jvPy7cZKUvrI6Hhaw2pFPDQdc+FiJwFXThNSGq87o/CF5HaA6bIsTyoY6
         O+j4BPW4KXC4MaVCFsW/XEU/Xc/OFzUYLKUhmMQ7HL85byDnAnIlwXmc49RpcZSd3+Ks
         yXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752589790; x=1753194590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yaCO1i2HMoUVQ2obL9JJgr4t9a4dYHoNbtH4QyB3txg=;
        b=nEcq5oRowbmUV4vhN3RKEJI3khuTfItAHScUh8dSLXlEy9fPAIiqxZG2DTXOE5sLa0
         OOysREongkj+Ye1BEHY3NQ7NEEVELZcL37OyOFE2ELLTOWrmWTpsSQmoaLJ1LEdEFkCj
         0L+4KRSDxWk2usVdi+K5gEyv4U/4dvKLV32F9OLTSzlNZgk6tPH20x0o0gFkTq4C8RM4
         hjktQ0eAgnzm9dtvu+p243Ynmh63NJeXDu9XxsRx0Nd6iZGI3V4z+3tM1GTAUSiO2nWX
         HLxCa1SyaI6sM7FGKhSpPNuL2RdsTxN78hyWnmCThrq5TdvH4HBPbi3CFpS4Tez4+oka
         LB5A==
X-Forwarded-Encrypted: i=1; AJvYcCX6kQXnWfPyLxdq5aLWK4CMpmb3ld/ucBkd+zx6XGFZ82vAmVlK9zkl+7dnxUJTtldf/LbVAtsDLZHE@vger.kernel.org
X-Gm-Message-State: AOJu0YwYICpvL3UCtm8cqiFrv8NqaYrkUeZGgzhavhnzP14WrngTV03s
	yPHd/tUgt4LtzCXwsKe0p5fCx+szSOGO1JU72JJWL7WvHllfR3LSALQiciSdfVLEpgF3DZ4+voY
	YhI7IjSk=
X-Gm-Gg: ASbGncvfGe05jlt6de4wYNPCqs3CXXJ1jozQUbT5LijVF5sHYeSWF9uHJong023C6+j
	EKTs845bRZS+wyD9jJuJHpH+pqExfmRPCTdbrFPrCnikjc7xLcZIYSI+8SV2IRVIPSlskJXBxqZ
	WWHjvZLZu5IVdIbGXnYudAiyN5iAvb/eHye+AK4QAe2/c6v4RG4wuHPF0p63jLUS4ZNPhnW9mOU
	eQTWyZkLM+F0AS404gXOz1AySrrcfJO3rxGQJNVu94iQMN8YENvhx/UPHHzHY95hauUYAtWtnfB
	Wvs/6w1VINq+Axcba+lS6iRqTsPAQsLUsBl4BF9o5q+GJnELgSgdMPt6qUjwwxuVn+dgXroO2D3
	TXRfL+hyTYRcl0JFO+ks0r9M=
X-Google-Smtp-Source: AGHT+IG+pbfHokdo3TaJ16zifD4swF4fUN4KhF43m51PEbV24kQ3tkZ0HUMR5PbjtEK1JA+TtM0XtA==
X-Received: by 2002:a05:6000:18a2:b0:3b6:936:976c with SMTP id ffacd0b85a97d-3b60a155f0emr2276454f8f.17.1752589790182;
        Tue, 15 Jul 2025 07:29:50 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5631:db97:f06d:3c45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e26f45sm15447531f8f.92.2025.07.15.07.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 07:29:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Hugo Villeneuve <hugo@hugovil.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: pca953x: use regmap_update_bits() to improve efficiency
Date: Tue, 15 Jul 2025 16:29:48 +0200
Message-ID: <175258978660.65843.2188692091974545508.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250714133730.6353-1-hugo@hugovil.com>
References: <20250714133730.6353-1-hugo@hugovil.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 14 Jul 2025 09:37:30 -0400, Hugo Villeneuve wrote:
> Using regmap_update_bits() allows to reduce the number of I2C transfers
> when updating bits that haven't changed on non-volatile registers.
> 
> For example on a PCAL6416, when changing a GPIO direction from input to
> output, the number of I2C transfers can be reduced from 4 to just 1 if
> the pull resistors configuration hasn't changed and the output value
> is the same as before.
> 
> [...]

Applied, thanks!

[1/1] gpio: pca953x: use regmap_update_bits() to improve efficiency
      https://git.kernel.org/brgl/linux/c/2aa8ccab5ae67281e4d3660f8d9ee68d8b76fcef

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

