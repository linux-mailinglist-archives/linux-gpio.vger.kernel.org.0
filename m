Return-Path: <linux-gpio+bounces-21646-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E348DADA9C4
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 09:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBD0B1706B8
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 07:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563DF20F076;
	Mon, 16 Jun 2025 07:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bB22ruTR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B89620F063
	for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 07:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750059784; cv=none; b=DC6wKG2PQHASuhPvhppHKkE0zgWz/WUMJ1dWSRC1Rl8NtuDGO0AqwZ9roC9NndKyMnPInAPrDGXQY5UAZ+LCd/9v90SQdDlcO/S5Mh6kfs7ZTj6QUDI9A3gm1MAZpD1vsd0CkCbha0DxlInoVbm/KP5Oc6E+Lu7UbMaxzHu1fE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750059784; c=relaxed/simple;
	bh=XmwoZ/1rXiFFhp5Ery36mi7aKpTwkqPeml15koxIPs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PWHxA4fOoucCTjVURWBeRq/l02g2tOkyPLV5qR1P6ktgcjOvoCvh8N9wz0GsEH2l6uIV0mmLZlX5Zd+GE3qc+OzYZDL2zA9c4y+na4g/BCitk+u/fAEJ2AxmMFwvxqDo1CZsxqnUrB0iRpVSzNdOvB7pfv/PqXIX8Zo1H5Nw2Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bB22ruTR; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4fea34e07so2331857f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 00:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750059781; x=1750664581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTU9Zax5kLpMeKPmyeLAiww8adzxErGgDJ424AqFWP8=;
        b=bB22ruTR1CRc4zosTiyYLHOhV3+wlgE6YQfD1gSlbnsY7MzW3GJSqvCD0uKJfmiJJe
         m6pCkdGQ/T+N6n8F6RuGTLmLowFvLkv3FMxD81Uh/o3nBDazSZWqKPIiKyVEFroHMlFb
         ReDTckMqu7lxNCq89O446IvHrRd+8wqNeJjqAMj6U46r4UhcxSrRT1mYFLnWd5PT4iki
         JZl47NO10bZSaR1CnBh9/Z7Tm5yEZJwwcDwBpOHii5QtKYRNZ4hcRy/1sAtTSAJVdS79
         u1R+oM8OnLCi/jUmhQlPZ1pPOqTb3ib+jlrnnEL6m6/b5mf2uARkKnipb40vNIhA+fM3
         uGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750059781; x=1750664581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTU9Zax5kLpMeKPmyeLAiww8adzxErGgDJ424AqFWP8=;
        b=vCdMNYa7ezNZow95mCYw7Lr9zRo8rH+B0C7qJFHHiREwBZBBItDzNw+cKS3sGjVgVF
         prcsUz8rNulWZ4q3YYsgJE9M71i1lDaoUstICvcflpUuV6abpsC3y+zEERbyFf3M+jzR
         r2Lm9pLj7DkEtR3rhSrb/S6T9kDrwJcfTmtMj2kEJzmzGnmLEUtFU5RMlKCZ5kt0oe5G
         Op14NBqTYy/8yVfRjcJbWdkik0o/T9ZlfPXbfe14unAKVHBihGDlyaCwCgdpIbsNYM34
         8FHQaCduadm+YpK2p/9UmKUKySNFzV7d4NuRd0iz7hV2jMC5MEtE94OJrrrAAT28L/YN
         o3MA==
X-Forwarded-Encrypted: i=1; AJvYcCUuhnDUNuGEKma3a++h91txxlzR8Bln8HyxGdQS9pL+JD+q4Kp37wSdi1I818dRfMA32rJ9612To0hp@vger.kernel.org
X-Gm-Message-State: AOJu0YxqemiJnH8syW5FJhGwXw9a+aVp7GjRYgH5xnc2vdIVq4/44cIu
	PovVNhQrPdpxd/uAXSqTS2wR+suzp4A7PKpvXbBhjrG5NmQmQXY9CPjGD0WTh3zTInA=
X-Gm-Gg: ASbGncvZx7A8g5+ZNRDBfU0yf3vE7zBthAzQRuFh1t5ifD1AraXqvqyObtVYucRHaWp
	9kWZLW0B/kjy0er2lKCOKgqCuw8li68JsujUH7PGp8fVNcOooc5mMgGiaZYgqIUSmMfrqjCNiDn
	zfrX19DKBarWCKiicKmKnCFyLK198DhEJibAtLmrvYiP0CShg+yzgnwlz2BY+CVLmvv6/HDknLM
	8JyhPn4tXWq0jdetww6HYGCMWRJP+0YE9KwR7WznkaJziZDhB+n2CVKOf8DDYvCk9aS382o1+q8
	t20x7aZ7Srrcgy4OPNs4eaCb8frXvuWx4gHh63q+4gGfhABan+dsO3R+684Y8Po=
X-Google-Smtp-Source: AGHT+IGNJS0KEiSwDJqSBbXx8uRkNhJkRtvXE4ajBKXtNWO8NPC5+V6AIpPTIVHjojheL91aJSa8eg==
X-Received: by 2002:a05:6000:25c5:b0:3a5:26eb:b4af with SMTP id ffacd0b85a97d-3a572373c7fmr6714675f8f.18.1750059780880;
        Mon, 16 Jun 2025 00:43:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54d1fsm10151340f8f.2.2025.06.16.00.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:43:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	tglx@linutronix.de,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Keerthy <j-keerthy@ti.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] gpio: Use dev_fwnode()
Date: Mon, 16 Jun 2025 09:42:58 +0200
Message-ID: <175005977568.15490.4738567496048769972.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250611104348.192092-6-jirislaby@kernel.org>
References: <20250611104348.192092-1-jirislaby@kernel.org> <20250611104348.192092-6-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 11 Jun 2025 12:43:34 +0200, Jiri Slaby (SUSE) wrote:
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
> 
> So use the dev_fwnode() helper.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: Use dev_fwnode()
      https://git.kernel.org/brgl/linux/c/7b2c2f1eb3914f5214a5b2ae966d7d7bb0057582

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

