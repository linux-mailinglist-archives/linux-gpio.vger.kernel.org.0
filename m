Return-Path: <linux-gpio+bounces-10457-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E3698752B
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 16:11:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78B001C21266
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 14:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BEAE146A7A;
	Thu, 26 Sep 2024 14:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNFDVJvA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D92B13635B;
	Thu, 26 Sep 2024 14:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727359877; cv=none; b=D86ke4n31SrF6/cv1X7j9z2NEaQU8LibskprLts0kUt0IaNkK5m9eJSzOLhlGNfotTi+7rWH68GlNmtoyaD8tAaNgEvJiDH7IDqXULqR5/d0G6q6WY43lXr6jeaz4fIzQxKGgeKL2jZH5Rbr2dwcZbSqbikh/cwBN9RWHG4fDYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727359877; c=relaxed/simple;
	bh=hIgS0abct7k73cRUqrRv+pssPSaxyTvM8bbfQ9Nc/cU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IVXIfkSFW/R5PrkPzt9tK9Fp9gTcKknK6jPt9cHiGAsQbB33tIRWiufM7r+HRlGFPlWvmvg0W6fE+FCy9UxwmIVSYCb8dhO5FzxYGKZa/QzrdyvdMtuz0X7PHE5UP59Gsh49S6/yUJG5Y70LyZILAK45gdFfeBn6E6laJY56Vj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNFDVJvA; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c718bb04a3so1238849a12.3;
        Thu, 26 Sep 2024 07:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727359875; x=1727964675; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CDLW+ahil14VVbokXmkrACjSas1yGjqF032hu3qw1pw=;
        b=QNFDVJvAvAMsqg0lvpRE5FjATt+5PjniLqxFLELvHLlpSohlT1R4Fl26yoZZ8yUBUM
         4j3eebDbZRXeguYOSTpq7FwoMhq2AdreNuwR3FIC19oonGHlMx+CV6RpZv4rzdM9o8BM
         OQYbrr9PFVJrdFB5W397zJjObJXMdQ/TxPBuZJBulRn3b9nfFKvG42WvJzmxIVb9q5AM
         OrgMF4ZjF6WQkxLcunV55MQoPyLwzMucK08Qv5glumybybgisaQijr8eiSGW/b8IiyLH
         yoPwMmtkt1z51vVparmt2H7cwToLnJmJKh0s+eexK+AaoWX8bjksU5pVpmbUZvvlFRKU
         ZOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727359875; x=1727964675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CDLW+ahil14VVbokXmkrACjSas1yGjqF032hu3qw1pw=;
        b=FL5BZ3YnETBLmipHvTwXXeNsQzKEEIik5cta3Oh3x/OFHOD/ew2cRF20FG4sdUr45x
         ARqJCaSbGGB6He1jo2XWTr631kJGKKPTnogRcnDHG5zZtumQ2ysoPbVRy7eDU6xd6L7w
         Opit5E/LEIs5qiWcF8i6gL3j4co1iHfLj+/iHViSmNZSUoJhupNE6D3tJv5fA+pBlmHS
         mZa0TXipHSfmBllGV+eckf2c4uujBywke2clrMihtnSd+7ePddrHO1sFDFwCdVQ06EcR
         Qh6pOsVCBx6jpJSMOWBAaPsqB6AXJbTMOcgLKyg3DDbTSOW0WzeIV7sGuRBJ8y90DfW0
         yN4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWp7Qxk+WpC11Orc9NaUtaRh/pxW9x2LPv65RKmALJ6H1JH6Fj8U+XvkHBPzO0+YYRzYdPZeqHGeNiGG6Fv@vger.kernel.org, AJvYcCXs/i5c/5svMcKWlShFywPtZnX5Yqg5pPNws9WkGSlYFo7ZHrbzU5/wSBjT7SS8ae2MeOycw8wGpOf/@vger.kernel.org
X-Gm-Message-State: AOJu0YwdUxDOpf7+aY8bs2ByQ5F6oX5zJg5a4RKSBJH4KqBSuEf267wc
	du/hnkiKTxn2XPA8bFjdSQiKS7iP41lqwr+6ho+8xY2U5wfQOP07
X-Google-Smtp-Source: AGHT+IHn0TuZveX/3tC1YU4PdfQVGg3OLRpmfNWqEyYD6hdxKsXTUJK2l6073A6+0miR78UiBA3arQ==
X-Received: by 2002:a17:906:6a0c:b0:a86:9793:350d with SMTP id a640c23a62f3a-a93a06a46c1mr734433566b.62.1727359874448;
        Thu, 26 Sep 2024 07:11:14 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-4e5f-6907-08e4-04ed.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:4e5f:6907:8e4:4ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27776cesm2498866b.40.2024.09.26.07.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 07:11:13 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 26 Sep 2024 16:11:03 +0200
Subject: [PATCH 2/2] pinctrl: intel: platform: use semicolon instead of
 comma in ncommunities assignment
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-intel-pinctrl-platform-scoped-v1-2-5ee4c936eea3@gmail.com>
References: <20240926-intel-pinctrl-platform-scoped-v1-0-5ee4c936eea3@gmail.com>
In-Reply-To: <20240926-intel-pinctrl-platform-scoped-v1-0-5ee4c936eea3@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727359869; l=956;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=hIgS0abct7k73cRUqrRv+pssPSaxyTvM8bbfQ9Nc/cU=;
 b=/OWhC2JDj29etn04UL/vKwP5FjUhZkfIodwxbe5jqYBgTruWh5Nw7z9zHG+SZU3mrlohuT1Wp
 StH5IB6iSPjAH+c2E6hDIcVQYY2ihMEREYH2y2kFIyVc+XUMmXpv0mR
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Substitute the comma with a semicolon in the `ncommunities` assignment
for better readability and consistency with common C coding style.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/pinctrl/intel/pinctrl-intel-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel-platform.c b/drivers/pinctrl/intel/pinctrl-intel-platform.c
index 2d5ba8278fb9..016a9f62eecc 100644
--- a/drivers/pinctrl/intel/pinctrl-intel-platform.c
+++ b/drivers/pinctrl/intel/pinctrl-intel-platform.c
@@ -158,7 +158,7 @@ static int intel_platform_pinctrl_prepare_soc_data(struct device *dev,
 	int ret;
 
 	/* Version 1.0 of the specification assumes only a single community per device node */
-	ncommunities = 1,
+	ncommunities = 1;
 	communities = devm_kcalloc(dev, ncommunities, sizeof(*communities), GFP_KERNEL);
 	if (!communities)
 		return -ENOMEM;

-- 
2.43.0


