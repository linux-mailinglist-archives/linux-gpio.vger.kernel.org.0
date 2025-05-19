Return-Path: <linux-gpio+bounces-20306-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64562ABC928
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 23:23:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F29D57A029A
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 21:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482B5221261;
	Mon, 19 May 2025 21:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kMuQ64Mw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF347220F55;
	Mon, 19 May 2025 21:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747689706; cv=none; b=gZAb8CIfswJIbe207WHo9tGx/a/fBXGdYMYpLl7EIdMs21d3pEe1Itx5tLXsixwoGPoXBu5n/Ri47CMcaKmrISJ429DMvCC4tDpfnCYBPObCytWKlXCqTmv6bSFplGFlt3HwZJJazHGXjAea36PjrgdnN9pkSXH27vB8bud6i0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747689706; c=relaxed/simple;
	bh=Z+yB0flMSft2uwS0zLLzDtNhD6mSwuSDI2LoEPob+kM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xplg0/hmCp0anNCeX47YHy370/aBtObYsoMYNtBAHY7+1qwaJsO4TS4OOwV/QMlEjnM8evs2ZMgt8RUB8jipvQ++kR5LSmhfMOUs/leop7CLCkss80j5nDlaRR7dTnnJ1BWDNLCJaWH6cpvjYTjKRnSuuhy82f2wlTUn6Qpp7jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kMuQ64Mw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 577ACC4CEF4;
	Mon, 19 May 2025 21:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747689705;
	bh=Z+yB0flMSft2uwS0zLLzDtNhD6mSwuSDI2LoEPob+kM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kMuQ64MwuKAaw4wyu8lgpFgyubKJQW1Ul54ZsOsYbZphUNgwoVWZ2TijvOeB2wj9Q
	 R9SzFOe1FVZxejJEqlB1K3Wnjxc8jqljI4viy+QCp+BjqSOodMVF7K9CDDcAjXWxeC
	 Wl4wFtEIQEBiGct0gtL6veipoEE0iDKVmvEhhkcsmDUCivq7uBdoB26LAjndiGQWFB
	 UY1ChzBlLOvBIeaNNt57YYquPkZBf7XGu9X2emGeURSmau0IQ4fy5chGiVHmaN26Wl
	 TveeIt40GZzA6lqbC6wSUzuUn+2Eb5lwI58F4rV3JwV1ndOZQ+CKcEwRA90NjNfvm3
	 ZXKK4AI4Om2eg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	kernel test robot <lkp@intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linus.walleij@linaro.org,
	bgolaszewski@baylibre.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 09/23] gpio: virtuser: fix potential out-of-bound write
Date: Mon, 19 May 2025 17:21:16 -0400
Message-Id: <20250519212131.1985647-9-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250519212131.1985647-1-sashal@kernel.org>
References: <20250519212131.1985647-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.7
Content-Transfer-Encoding: 8bit

From: Markus Burri <markus.burri@mt.com>

[ Upstream commit 7118be7c6072f40391923543fdd1563b8d56377c ]

If the caller wrote more characters, count is truncated to the max
available space in "simple_write_to_buffer". Check that the input
size does not exceed the buffer size. Write a zero termination
afterwards.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505091754.285hHbr2-lkp@intel.com/
Signed-off-by: Markus Burri <markus.burri@mt.com>
Link: https://lore.kernel.org/r/20250509150459.115489-1-markus.burri@mt.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpio/gpio-virtuser.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index e89f299f21400..dcecb7a259117 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -400,10 +400,15 @@ static ssize_t gpio_virtuser_direction_do_write(struct file *file,
 	char buf[32], *trimmed;
 	int ret, dir, val = 0;
 
-	ret = simple_write_to_buffer(buf, sizeof(buf), ppos, user_buf, count);
+	if (count >= sizeof(buf))
+		return -EINVAL;
+
+	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, user_buf, count);
 	if (ret < 0)
 		return ret;
 
+	buf[ret] = '\0';
+
 	trimmed = strim(buf);
 
 	if (strcmp(trimmed, "input") == 0) {
@@ -622,12 +627,15 @@ static ssize_t gpio_virtuser_consumer_write(struct file *file,
 	char buf[GPIO_VIRTUSER_NAME_BUF_LEN + 2];
 	int ret;
 
+	if (count >= sizeof(buf))
+		return -EINVAL;
+
 	ret = simple_write_to_buffer(buf, GPIO_VIRTUSER_NAME_BUF_LEN, ppos,
 				     user_buf, count);
 	if (ret < 0)
 		return ret;
 
-	buf[strlen(buf) - 1] = '\0';
+	buf[ret] = '\0';
 
 	ret = gpiod_set_consumer_name(data->ad.desc, buf);
 	if (ret)
-- 
2.39.5


