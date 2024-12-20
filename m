Return-Path: <linux-gpio+bounces-14080-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F349F9380
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 14:46:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 163241888BC4
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 13:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 412A9216381;
	Fri, 20 Dec 2024 13:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HVD7FQWe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBBE215F54
	for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 13:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734702305; cv=none; b=M+pGVlK3Thov5C8+8ddtvLUfbzjOLMzHE7lfdgLFkE4XoxY4wCChnapxwTJUEKbpS1bXv/QJ9Hf5yvKIWfuKAO7iADAfeRUGQIdBMgdlNn0QXTp8AVpqqaN18TZog4Xh9ql6/3cFlDs7wr0zkQH/7C4d8/27i+V4bcG9cJbatbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734702305; c=relaxed/simple;
	bh=dX3dLVzEJaAoihIPqwJ3RhQC9WoQ7m6Mh/cZ6nw03bM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UVFHxNq1sosPsmgsy8m+a20K9PF3bOaC4Hc19Dw7JskdTnVBHCognzVfr5z3D0BjlI2Kb5TBqVzCS9rX5ckThgHV49Y56HKljSZq8PzqtCWRRO2NYHbLsKEeFzrUPk5Vb2YyfovdYxB5IsjeumQneAxxhaTG7+ylCOgk8WcSRUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HVD7FQWe; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43618283dedso18515855e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 05:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734702302; x=1735307102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfOK5uiy+mcVMxtUQsmkMv7JKC5xMSpiG4Eomz9m2Fc=;
        b=HVD7FQWe72tioPx0MBEp66l2RWZNs8qQ1HiiXZmUmVeWIQsUi/qLrx8Q/HuBSXXIzQ
         RTJP2Yc0aWFPNobIZUrA69DKS1w+AL/2H4lnWR/1Pvv2oSXf6ygXIqFufPqFcFDcgFvX
         OyzKwbjmVxY9Id7+dzbAnm7L/x6Jm3a2wOSdN01OI+WvUWiihdBAlWqmbdJz04/Bh4v0
         d8UHU6vzRI3K6NiwGGxoMh+HYFrzQFJ+wGpcLdRaYweX1nO6fkYuDh7IaqKxRHzyDQcK
         4ZG0BEKl4tNkyhtSsbb99ibTJAROmO8zGQJyTlysaJzjg3f++quSzTwb77afvJWRnKfp
         W03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734702302; x=1735307102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FfOK5uiy+mcVMxtUQsmkMv7JKC5xMSpiG4Eomz9m2Fc=;
        b=A/abYjTUZlb+Nm2q5VK2HZpRzM/3rCW7+QGwYTzoeO00Q8E6btectoFFlEn8oL+z2n
         b9iG0y304F1S2hdb0LbG2+QzN9CMJQrxLTlNZYBoAm/gWhoS06TDux26XSxwwRN/i/Ns
         ZOUlXRl7EkTbgCzf2PW55Ee0QEMTbqhhKx/+fPkzdN6f0uc9kFHZ882ky1msqhGckIO4
         wOicqVQHovgjK11kguSR1774g4t2l4wOCH3CslAiSqx668XSyBdFuLi4HUislrtYP0CG
         BK/xQJA4JQUHB/f197d6vL+mAc9bHiybRZs1oEPfO9pwLkaL7FAWLb8Dtjry366ljnEI
         P5hg==
X-Forwarded-Encrypted: i=1; AJvYcCWvBh92m8+N36hohMosiRIPKw83ZTyYsKpRjop3u2LI2cylkVMp3qDpjm9ShTdTJ9bPlRCPsamm0Edl@vger.kernel.org
X-Gm-Message-State: AOJu0YyeF0t9gkE4173msLTKW68s4HWLV30ueNnEqBTf9VTvUd+fUmu+
	da5T8lCuZJj2ZVOVBPsHYDqUOsvXVAou7RVw5eEKpLI1r8Jkc3DrHUlDOXiEZRo=
X-Gm-Gg: ASbGncsvZjkHGBheFu06T/NC0Dscw1TwD8pRRJk2aY7nHhVAb2UZGwtJtsdQBZgVTbs
	n96MAsiWcfgWwcqbrchkoNUcH/le6gPcLskFTKQUP/teDV0Xy1ShIYG9ziE88sLnS3aafsEB6ta
	Qr5ccUyiEXWKk9dCDihNarq2JzSAFVyFgjXPVtOGGkuUxJX3IiKEEyM2GS2l5mEa1NUD9zev8DK
	QKip0LSyQHwiuOry+q3E9PfsrdRF3c3+RzlnJDbYotYzfaBtoS1D/Sr
X-Google-Smtp-Source: AGHT+IE1zEfigu5Mqn/L6p1rvtHRRbDE8DUt16pdkH274SPWSfK8ipVLQmqYILs32ti77b+wRtiBXw==
X-Received: by 2002:a5d:5e09:0:b0:385:ddd2:6ab7 with SMTP id ffacd0b85a97d-38a2240874bmr3173475f8f.52.1734702302061;
        Fri, 20 Dec 2024 05:45:02 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:72db:1014:577a:9e6b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43664b15365sm30191375e9.7.2024.12.20.05.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 05:45:01 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	m-leonard@ti.com,
	praneeth@ti.com
Subject: Re: [PATCH v1 0/1] TPS65219 GPIO Driver Cleanup Series
Date: Fri, 20 Dec 2024 14:45:00 +0100
Message-ID: <173470229783.43469.10272596710530652292.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241217204755.1011731-1-s-ramamoorthy@ti.com>
References: <20241217204755.1011731-1-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 17 Dec 2024 14:47:54 -0600, Shree Ramamoorthy wrote:
> This series is in preparation to add 2 PMIC devices to the TPS65219 driver.
> 
> The changes involve using existing helper macros to simplify code. The
> intention is to remove unnecessary noise from the new PMIC patches adding
> support to this driver.
> 
> Shree Ramamoorthy (1):
>   gpio: tps65219: Use existing kernel gpio macros
> 
> [...]

Applied, thanks!

[1/1] gpio: tps65219: Use existing kernel gpio macros
      commit: c9ec045fa8053820573efbaa70137d0857e444db

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

