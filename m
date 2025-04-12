Return-Path: <linux-gpio+bounces-18734-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CD4A86C74
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 12:16:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 677321B82168
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 10:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E511DB125;
	Sat, 12 Apr 2025 10:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y04HooKI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D20E1C84A4
	for <linux-gpio@vger.kernel.org>; Sat, 12 Apr 2025 10:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744452933; cv=none; b=UwXkB6th4keRRHQtVXR3dcBgGwffGRA2hkjAOP3lDwZqp2xvsnbI5tksW4SNghNYMuHFPSC14D2uqdRe+SgYy7Ux4CfhZ+oJHtjacEXVw2MdIKidCo8K0nc4cCZwiDp+Yxk7U/DsRO9t7TqiwoczYAniyi2ANtqEVLwlputYy5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744452933; c=relaxed/simple;
	bh=NUlI7rfhNeG2einDOAQS0ehoOuYxAEcjEeCR3Ojkd94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MX5Bfwxabj6nm3iRUyASP+NvFJbo1zNA2UKCofRzC5G9H4G+n8u7e8zlx2X1ibSHUKz3nEf5JiF88svsJkKbexk+9/8+u4lp3JjHl+7twdqJHTIeiZzlqMR91i27hgw58JO4I3OvJRhruowKcuYACSsMGfn3IPnR0XSwrB/0ycA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y04HooKI; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39ac9aea656so2633150f8f.3
        for <linux-gpio@vger.kernel.org>; Sat, 12 Apr 2025 03:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744452929; x=1745057729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A1XAxbjahpYsXzMprDjhEjSwEqux/6xYa2KC6cfUrJg=;
        b=y04HooKIxLBF4qSp1eOrBPMgQLKnEApUdH1DCxcI0cKFlIwlCeFEzXsaifPo+jNNPr
         1XLs86FFKBrhUmYoTmVlNOQvfn1VMMiUMquN6JrMAY9/Q2oiQJoVzS9ZP9aJnzTPBY77
         oDqet4XLJ+A0QHO+AUE6qjkawtZ5phZWeTh3/XvdiJQCmggTjLgTtR0/kaJwgTqL0gDG
         BBfGoTxTYbL66bIKr5IekJIYHgwAZ71xmpxsdkhFZbYbpATLci/sfjwn33/BJghOnsLa
         rieTb/87dl/+cbayUQvkIrXNuYvukUdaU3S1JiRHIdn5XSd7I7fPEar/ajoA7pByKRxu
         wsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744452929; x=1745057729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A1XAxbjahpYsXzMprDjhEjSwEqux/6xYa2KC6cfUrJg=;
        b=ibxtdMYo5FiYZCH0moavUXOOcG4xhu/PuAYCJBpy00mG58GtNvxOFfpLuz5dLrT9KE
         FnO/u82VaUZ5LEa0oQHEiUkoeFH4Zer5SIA3aQmC9dJ+8aw8/hqOznE1xZTb5Twzh4D7
         ROf2YfMb6/nXa/fMr7jkAh2LkkCVJ6VyGPlSkF5xFLG5BUiQ397PLBpoB7Rd4C0HM3pT
         6NMVmKawDQlDdro6n8bRWjL9mDsoUMRDJ+Fy0wfIzB6lXnbwiKCR94jj2mKszu0ihh2/
         L8RpA6GveVyqw6V4Q12aVixevEtlASRUlRvM1WkSx0yjIb1CAb/StkHzsRJSgSlHkF2S
         HdpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLi3baxkRxtNB3/uRzRl8nVCwcX+jRRA8hcDbm0RR5s12UvWHAJV6xz4aqtlB51UfF/RF1NwPBmyKN@vger.kernel.org
X-Gm-Message-State: AOJu0YwBFJ2M/LCtQtXXoUQGbnxc13QD4q1Pb5zS05klWilo1yhlDQSI
	xyuRck4dFfpEgTThXR/Hu7xciExVgZcM3QkgeR8QlDk5YMQvjGMMU8+xkLhD7Zs=
X-Gm-Gg: ASbGncuqJaAMEhoFGyDgot7Uk4B6Q3ur9MyUbBNjTEl/WeE1LD0PmDf5JFBYi4DAvuO
	65dOVDCN2BNXDvwBbGGOh677UmS7XhJrE1aNES+d4eUfLSBXsS23WySTXsfIkCuAE11qSfid4xH
	b6ml2Y0kVpoJOw2IGvvitS/u6FL1KdyMABzuWcbA2FMW3oRDiYkc7TnggtF+YAWemXzOg2OlqG/
	EDgOCOSiVdZ54X1RVHytkncuLrdxspJLDTjvEqG2ZXMv+G2URs1k9Gxc8Ab2IkC7OQ1QlXLTMKP
	5a+4YS+KKN3JPvUfSuR+Nk/WrcY5yLvLBNzbJJDq2MXrXQ==
X-Google-Smtp-Source: AGHT+IHapgll/M9Y0x8YVjZfFG1kOPzA7Nw03Ls1YypBE3zK8Ial/wNTlxmGL7I6XZD3PCqHZHDMOQ==
X-Received: by 2002:a05:6000:1848:b0:39a:c8a8:4fdc with SMTP id ffacd0b85a97d-39ea520372fmr5301002f8f.16.1744452928700;
        Sat, 12 Apr 2025 03:15:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f207cb88asm112582865e9.37.2025.04.12.03.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 03:15:28 -0700 (PDT)
Date: Sat, 12 Apr 2025 13:15:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Koichiro Den <koichiro.den@canonical.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] gpio: aggregator: Fix error code in
 gpio_aggregator_activate()
Message-ID: <79b804a0769a434698616bebedacc0e5d5605fdc.1744452787.git.dan.carpenter@linaro.org>
References: <cover.1744452787.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1744452787.git.dan.carpenter@linaro.org>

Propagate the error code if gpio_aggregator_make_device_sw_node() fails.
Don't return success.

Fixes: 86f162e73d2d ("gpio: aggregator: introduce basic configfs interface")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpio/gpio-aggregator.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 62bb50af7cda..071d76dbfcec 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -626,8 +626,10 @@ static int gpio_aggregator_activate(struct gpio_aggregator *aggr)
 		return -ENOMEM;
 
 	swnode = gpio_aggregator_make_device_sw_node(aggr);
-	if (IS_ERR(swnode))
+	if (IS_ERR(swnode)) {
+		ret = PTR_ERR(swnode);
 		goto err_remove_lookups;
+	}
 
 	memset(&pdevinfo, 0, sizeof(pdevinfo));
 	pdevinfo.name = DRV_NAME;
-- 
2.47.2


