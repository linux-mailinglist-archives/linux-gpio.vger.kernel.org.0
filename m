Return-Path: <linux-gpio+bounces-5743-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0D38AE4B8
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 13:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 684F4287B37
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 11:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EBD3140363;
	Tue, 23 Apr 2024 11:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WOoBk6iA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC93F13FD91;
	Tue, 23 Apr 2024 11:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713872465; cv=none; b=cPf73kwjmlebgxUlQ2o8hs00FbwlMwoWjwt3evqcT66fmJkrIVZYy3O8ifSlEn8Ixm03QAjETycxj6W2yDbWiSv1BFtVlxpkslaZ1am9sVXYmxxmmduLojhcUebv/i571X986ruMHNqdlsdHnLEM0J8hkrLJL7yRkCtQqLVarcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713872465; c=relaxed/simple;
	bh=5RAUvk4sjc/qsa/C6BSAWC/Hw5N4z6bB5pl4q+E9wyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fN5I9Mthdm/dPnO0FB1COTtnvvK39wVjPofsnHhz+wvi1r0OIhMib0gjkbjh28Yn78yHk8Et9ixdTul/Zrusal/mHrxyEmUzuUrgc2YLnZkKlEg6/xaWyxmPjn0B6YGY9IC4DDgYx1WJTrp/m5yzV4/O4ZhV3dpQEKRlc+NKN0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WOoBk6iA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE371C32782;
	Tue, 23 Apr 2024 11:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713872464;
	bh=5RAUvk4sjc/qsa/C6BSAWC/Hw5N4z6bB5pl4q+E9wyQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WOoBk6iAiFCiRnI2M9jRonqg8iGFmcwQsBncVjVo4ouXUythOz06eXf/FaSxXfXb4
	 6IJGRRUlbObKAmAOkO5o/hmBcEwW/Ik5t95YDUPKRiPUKyqOms78LhaRrB4lHfcyIs
	 OX3AFrQywOyICin7XhczxCjkio5UKpOvcRHg1jd6NiOVLvoakmvA4r/d5GPdOTT1CW
	 Nm1i/AqITFdGMygBcEQyaE52jn/mrZLF6/JqVJAEOqm2145KtqZA4Hd+raWGZmpzPL
	 35Rx8XwXVkRIEWOTVXUMYq7V5oL0jZeH5Zz7rFLH6At5oAejkqEF47B0ikoYXkCVCT
	 BY7NoDPjnfSMA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Sasha Levin <sashal@kernel.org>,
	andy@kernel.org,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 4/9] gpio: wcove: Use -ENOTSUPP consistently
Date: Tue, 23 Apr 2024 07:02:10 -0400
Message-ID: <20240423110217.1658879-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423110217.1658879-1-sashal@kernel.org>
References: <20240423110217.1658879-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.87
Content-Transfer-Encoding: 8bit

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

[ Upstream commit 0c3b532ad3fbf82884a2e7e83e37c7dcdd4d1d99 ]

The GPIO library expects the drivers to return -ENOTSUPP in some
cases and not using analogue POSIX code. Make the driver to follow
this.

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpio/gpio-wcove.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
index c18b6b47384f1..94ca9d03c0949 100644
--- a/drivers/gpio/gpio-wcove.c
+++ b/drivers/gpio/gpio-wcove.c
@@ -104,7 +104,7 @@ static inline int to_reg(int gpio, enum ctrl_register type)
 	unsigned int reg = type == CTRL_IN ? GPIO_IN_CTRL_BASE : GPIO_OUT_CTRL_BASE;
 
 	if (gpio >= WCOVE_GPIO_NUM)
-		return -EOPNOTSUPP;
+		return -ENOTSUPP;
 
 	return reg + gpio;
 }
-- 
2.43.0


