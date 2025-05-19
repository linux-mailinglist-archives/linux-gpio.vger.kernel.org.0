Return-Path: <linux-gpio+bounces-20307-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEA9ABC962
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 23:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF7E17A5FD7
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 21:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77082227EA4;
	Mon, 19 May 2025 21:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C5jaCsAM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B24F227E88;
	Mon, 19 May 2025 21:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747689738; cv=none; b=kZb/AKo4AAMzoJsaK5PtI3EJ36uP1Xt0DltWegK+H03wyzSGF1JdKFEj9xwna8fm7OLMRPGHlxg7TsxuPtlZwfWE2T2gubahEYhiFlnS0+joR6QFq3IjXkVWEQp0I89nPlt1wZ1FS4O8vRNm8cIJ/MgmfJc8WlrpX7oF0Vb352s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747689738; c=relaxed/simple;
	bh=Z+yB0flMSft2uwS0zLLzDtNhD6mSwuSDI2LoEPob+kM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fWKxbgShZ1FKp+WLs5kAmndwn4hJSkG/1vQX4N6puGF7EzWJRBDZujDe+Vxg1vgKwaGF2BQDbzlKcBS1dl5r7r/eZPr6mCpEWIO+k8aYyNs8YhADHWGm0CMNq7yXWeZkBqlFUH4nBJfFpcqud90MAYd+wgOqliNLWaYsNw0bIV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C5jaCsAM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E92B9C4CEF1;
	Mon, 19 May 2025 21:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747689738;
	bh=Z+yB0flMSft2uwS0zLLzDtNhD6mSwuSDI2LoEPob+kM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C5jaCsAMSnr5lf/Kw+KivshRo/9arYLUGL+SL7QZh7SEdxlsZFGAkzApW7bLoYWD3
	 s3btvPVoddAoMrYUOf+6JyLUksaiPRqgvCkVWZqmzzeIuDUU5JxapvrVd5qCpyO+Pt
	 /2ib4eCk5AdlpiqvBOHNdByacoHo3xtUsHbmNz8Z+D3dvCN8NqfniC+eJY41WZDfqK
	 4FIaTKmC9VGPKoWsR+16T2vaNMYli2YTeXth2ZuYuQElm9Tcc5xqHC+vn5LNv6NhRf
	 ygmPZ3J+YedqGd5czh6X0k9jroqw7AHf+NVFuLBHiNfbhkdlx3IkhWdLXxMTqQqNwe
	 KNg1Ze8Kg6/hQ==
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
Subject: [PATCH AUTOSEL 6.12 06/18] gpio: virtuser: fix potential out-of-bound write
Date: Mon, 19 May 2025 17:21:55 -0400
Message-Id: <20250519212208.1986028-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250519212208.1986028-1-sashal@kernel.org>
References: <20250519212208.1986028-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.29
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


