Return-Path: <linux-gpio+bounces-27569-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED72C047B0
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 08:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 899F73BA575
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 06:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED3927146B;
	Fri, 24 Oct 2025 06:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="atL7cSc5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0310125A640
	for <linux-gpio@vger.kernel.org>; Fri, 24 Oct 2025 06:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761286770; cv=none; b=Hz8/jQqTdxXcX0lSjzvuwld9BNwlBcv4QlHUYk/nH4LptPhl2e7dJn9ICUX8ixjV+xePK8c8zrANaZcko7rkpRMBqT5YwLJgPrA8fVddroiDDonALMzyDzTjlBgi6SfWWBL3eis3UL4T8anAZM+p/INbu0eBrkGGSgA62FZ8W34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761286770; c=relaxed/simple;
	bh=MjiIMaVHnxv85Sm0BB/UlJ62CEBZJOgW3U0C8rO6buI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XzjTygdQF46b+btPYk0kGcpe0xXeKtP/nWQw0UoJ7o9sMxenJlOsATnKGz01zbGa/GgMcEYCYcq94vivzmx5gq159D29aVb/EItUyEvNwVjfnDcJ0crluQTU1hQsfMkBg47f9Hjd3qHDbqVqv7aLqnni0a9fCP3BrLNi2RS+9kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=atL7cSc5; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-426fd62bfeaso805583f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 23:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761286766; x=1761891566; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iuW7JMitWdY//EYRZ6hUg7/sC/5FBOcO0+pu8iYSN+U=;
        b=atL7cSc5/Ej7zPQ7n2QKen4qg1yhVqDWtKpvlEK43J03d791ymvxss64cDsU2+C9+P
         FklFpCf/E0YNZmocWnGM/vjbp/eoyp4LwMvnvGiRW9751fI9HMh/GVxTuC+P+sD7dNrZ
         Xi6nD/kMIS+tK5VbrCrfoupVlqwHVZNTzk2baUBQNGBmOpr3gcUCUFQOXFday8GDNTpU
         hmvgTkqhcokaic4v2eoUh1AqfzUGUZT5iQVqkfB58EpgMYB6L2H900gf5GyfVcCeC4ne
         0fe4tuRtrkndVfYQhpMjvgVLCjtfofyEXVaTU2OmCL0UXX+2BL3olqZbtZ5CvIBThutg
         8UJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761286766; x=1761891566;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iuW7JMitWdY//EYRZ6hUg7/sC/5FBOcO0+pu8iYSN+U=;
        b=l+30qRoJsvtLVzWJ4w0EoxnrkG0b9egREIyPItnFT0P4Iu7o4mUMTdlDhxjEtgGdcz
         TPKgGQ9D5hQkR344CR8ReITIzNaUHDaH9I4B7XuhtgkBXTiJO1P19DvSdWEM7gB6H/ZO
         kcT9JP1P28u00DTawZVNhoqbsqYloIvnXnaqzPaqCmrMplqiUAMz8t0CpCJ+FPo1Fdu/
         dKLg1PyLP2gN0IdF+6LwZhatyX/bLy+AmPd2bDYnVhyGZSX8yWL8L/lEEcFHnUokk7ma
         VHG2sW7zndX9yRTeJtAaQP1cB9KTSfqp5K6Z55rgc1pOelU4doe+Li6StDDtyQyqpD6+
         gZ7w==
X-Forwarded-Encrypted: i=1; AJvYcCXAiUN/igpxlN0axxO8gd+D7sal+Vjv5Df4u7YFzw079cj2XKT/t6aBQOvvtn5zCPx7H8YniKWEkyyi@vger.kernel.org
X-Gm-Message-State: AOJu0YxtNf/1h6rnQLuKQ/vZ5aHMY+lWEIhLY0pSLz4tLDA5N2cOj52Q
	JOoPfJmop7lbWOgsg2WJiuGkYTv8UM9CW7pJJ8YWLeiTJLj701NBhDMqoMqW319gJp4=
X-Gm-Gg: ASbGncuqd2ZK0AuEkxlboCeQDlW0HUqsEWkwDcJEqUj1KDbaj0E5iUqY0YhbNlo/+PP
	TK871JmaJKmNt9GsP3JO1HNip9Zh1ytEn/Ia397GK6C6Ya2f2Aj4LT8zC7X2HCQwrLiwNxG/1dx
	cT0xXbjOb0LsdP96mF60inYsd2Ky5aQ90TfBIL1A31xVrdJKYc1v2D/SXB9YxRpD1kBoMk1kdRq
	bW+X1rJHQFAl+iDfEu8iI+ntHLnkVEXlutrvpAmvYUpBHnwrgSRDhiQncq/0cUlUvkRSEzZn6Eo
	e1LIWdopfH2C98V7/Wn9lq2nQixGZ4XSebH7798f9LgrE6EdojrxPwMFKGvtxu4BAlyUV2NhOdd
	n+vhEsdhtkaHBfzVqL721wM+wYtyNEui/kWS+52ZSaCItXzjkfgcY530uNyCOwfCPr1WfIC/e5r
	sSnWpC//yyH6wuhzoT
X-Google-Smtp-Source: AGHT+IGuaT91f6JlqW4V0ICbs5URxpfktlg0GOQ7b4e28m0jHXiomSrIXCP/t5AqtpgGIxAmYlkf2Q==
X-Received: by 2002:a05:6000:200c:b0:428:3ef4:9a10 with SMTP id ffacd0b85a97d-4283ef49ddamr15607904f8f.54.1761286766184;
        Thu, 23 Oct 2025 23:19:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429898adf78sm8054566f8f.32.2025.10.23.23.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 23:19:25 -0700 (PDT)
Date: Fri, 24 Oct 2025 09:19:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Michael Walle <mwalle@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] gpio: qixis-fpga: Fix a NULL vs IS_ERR() bug in probe()
Message-ID: <aPsaaf0h343Ba7c1@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_platform_ioremap_resource() function doesn't return NULL, it
returns error pointers.  Fix the checking to match.

Fixes: e88500247dc3 ("gpio: add QIXIS FPGA GPIO controller")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpio/gpio-qixis-fpga.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-qixis-fpga.c b/drivers/gpio/gpio-qixis-fpga.c
index 54c2c76822d5..6e67f43ac0bd 100644
--- a/drivers/gpio/gpio-qixis-fpga.c
+++ b/drivers/gpio/gpio-qixis-fpga.c
@@ -56,8 +56,8 @@ static int qixis_cpld_gpio_probe(struct platform_device *pdev)
 		 * create our own from the MMIO space.
 		 */
 		reg = devm_platform_ioremap_resource(pdev, 0);
-		if (!reg)
-			return -ENODEV;
+		if (IS_ERR(reg))
+			return PTR_ERR(reg);
 
 		regmap = devm_regmap_init_mmio(&pdev->dev, reg, &regmap_config_8r_8v);
 		if (!regmap)
-- 
2.51.0


