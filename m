Return-Path: <linux-gpio+bounces-11829-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AA89AC1E7
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 10:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C183E1C25196
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 08:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A44CD15B554;
	Wed, 23 Oct 2024 08:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oOO/UH4u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C619B158D8B
	for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2024 08:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729672795; cv=none; b=fJAIAbpVfMPn2JOvdF5/A7M3dJacsksieHi4AZ4rT4pXffLuFm7vPfiO7uu2CMRzYv34x627mkcr8XeXX+GIEQZ75rPuQsLZzYP1G3yxmbh8OiE6KlIRoHqCU+yB0dhRP+RSKV++u7xaJeVF8kmN8jKEs9tnIGgow1HfH8JzQlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729672795; c=relaxed/simple;
	bh=iJbAb8skEa4Nx/8KUs6c6Kmf1XIOGfLjcxmhZaN7zqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TyeQ8oW/WFJ0ny59xULi3PBXZxcq3B4Gn8pzPxo/yVNAf1QOEGEljXxQ2n3OYGyl+tLkBd7eOHKADtmGSXN8HkevXJUvaYQpPtMWO8gFjH90+gm7iE1oKWA/yAksgaBQHgGKjE1Hy8PWDoQvS/SBXOAfQOu20rMUrHRhf9bs1R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oOO/UH4u; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4315f24a6bbso57306125e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2024 01:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729672791; x=1730277591; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2q+EqKO/SmJ+LwoOc5NqrnnNgg93ONnESekHeBkrw9I=;
        b=oOO/UH4umUXL2q/W87+IPDPrskl4aHiSoJejqSZCsxo6nL2FYwK1IkobOa/6Rf3qv6
         gEPhyDnMic6+Cv+ur5cqmhhW4QhFMLwq0t10p4TyYovexoLFKJpexO2xyTfoMtxNZuBU
         9xLO6IEKCUg+TYR5lI07LxbYa0GRMLbw+6FD/g0P1zaW3Yqda4XNRq9injEsnkqD7rXE
         6pvm1YVOuNkQcSwTC2sQtj5WMzx3PKuj1ZGdZ2c6dkxLEbPY4spsJ4dIDUHIEZ1gh6TF
         /iU8vabl1/0ZlGh4fby9v/JfWQaD4i5hhQI1Pwwa+P3RVytTRfq2WDyatAT/14LNf5pd
         ugFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729672791; x=1730277591;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2q+EqKO/SmJ+LwoOc5NqrnnNgg93ONnESekHeBkrw9I=;
        b=iU5Q+/lxfFUkPolPlh+WBXNKvCDxgeIUjhxZEYHB4OOqmFYXVFHsWnL6ZjQTRbUJkK
         /BLZPbkjgLqgkt7d8GganC0V4oDpqFO8nYX5ylbqgtwm+5YCivpaqWIrfB8kbOTUQh2n
         boRzQt/xQvJPEkHAiGHqHLRrn9YPUs1d4cEwnlIhWRcw8Vx3T1bFHKJq/4Db2BgRzRqt
         eQ6XR5IoHk7MV48lStDqg5yuWv3+kqfoIRjkKD2myZ3t+zkvd21DqpB/jCw42lquhXEh
         2OWxK5qWRS3iaHWubpGLN6GLXnxxKCYLzRs1gEotYD3oBFsngZMb9M28fyiDIj1BolfE
         ALeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK94qCozmPNN00+GrEmq6ykw/4O6SaVYtSaT+un5me3KyZcN3nblia8zjmj7OUk9pG4ceHHAKHS+So@vger.kernel.org
X-Gm-Message-State: AOJu0YyxCtsklOM7L+8He1M9Kp3T4/TnPdd7S5nCxty7dESElswDuz6M
	88JbTq9avQdvv76ZaCD5T0VgsoRCFe5xEYK75W0OhmSf9t70hpAXoxWPD4FmOzzMatLer8kqQCJ
	zdaA=
X-Google-Smtp-Source: AGHT+IH33wSfSVODDvdL/yZ91O6rmVDtlC8FIWHeTBfVcquWAPxHFeIFGhVu1f0mob8q5XR3H0fZpw==
X-Received: by 2002:a05:600c:190a:b0:431:561b:b32a with SMTP id 5b1f17b1804b1-43184158e72mr14918485e9.19.1729672790992;
        Wed, 23 Oct 2024 01:39:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9413fsm8435305f8f.74.2024.10.23.01.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 01:39:50 -0700 (PDT)
Date: Wed, 23 Oct 2024 11:39:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Subject: [PATCH next] pinctrl: spacemit: fix double free of map
Message-ID: <4b5f1306-dc01-4edc-96d3-b232b930ddf2@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The map pointer is freed by pinctrl_utils_free_map().  It must not be a
devm_ pointer or it leads to a double free when the device is unloaded.

This is similar to a couple bugs Harshit Mogalapalli fixed earlier in
commits 3fd976afe974 ("pinctrl: nuvoton: fix a double free in
ma35_pinctrl_dt_node_to_map_func()") and 4575962aeed6 ("pinctrl: sophgo:
fix double free in cv1800_pctrl_dt_node_to_map()").

Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/spacemit/pinctrl-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index c75ea27b2344..a32579d73613 100644
--- a/drivers/pinctrl/spacemit/pinctrl-k1.c
+++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
@@ -314,7 +314,7 @@ static int spacemit_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	if (!grpnames)
 		return -ENOMEM;
 
-	map = devm_kcalloc(dev, ngroups * 2, sizeof(*map), GFP_KERNEL);
+	map = kcalloc(ngroups * 2, sizeof(*map), GFP_KERNEL);
 	if (!map)
 		return -ENOMEM;
 
-- 
2.45.2


