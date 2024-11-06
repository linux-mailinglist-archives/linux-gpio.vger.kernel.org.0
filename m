Return-Path: <linux-gpio+bounces-12579-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDE89BDC68
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 03:21:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EA6128360B
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 02:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 923271DF27C;
	Wed,  6 Nov 2024 02:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VPKLBnFM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B3918FC7E;
	Wed,  6 Nov 2024 02:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730859131; cv=none; b=eSCV53WQ1SwnBzx97RO4EuF60eoGvtzy2oI7of1xQieH3F1eWTHSZnaBpOJ1HmjcQu6PkLJgAebIc2XyKuC8mjAxeAOnTv/GtPuLsfWCXxrYq9bafW9XsKa3L66H13GOQvrG/fAQPYPHDRLd5Fx8gSc53cJjP6Cb8scvRwuDlp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730859131; c=relaxed/simple;
	bh=epotG0UywHITg66mlUYmS2o+kh1DHsZhJ2NRSLK2mU4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U0zyGxkp4VpEfV7ZBWHySWLUqnaDzbKsSzewwrjWfhLstkvbvKqbOuA8nN2FsGAM1huYd5p/7aVYqyxNN4ZA0RL8UoUMk9VYdSMXYB5VNIky54yXAq9HD+3Cgtg2dHp1b5QaFXafV4OMDmY4KTShrNXVfNFl0tEVQXdmDsWoHr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VPKLBnFM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D524CC4CECF;
	Wed,  6 Nov 2024 02:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730859130;
	bh=epotG0UywHITg66mlUYmS2o+kh1DHsZhJ2NRSLK2mU4=;
	h=From:To:Cc:Subject:Date:From;
	b=VPKLBnFMg7ZFC7hS1WheH00wiPNPTlbnRyRy8WPZsVay4e8TftHlxzWt5cyUC0059
	 GORJccqScYjVT3mFcihRCISsji4l8OlZtiqZHRP5uQ2SfVuwv16gcGbSJ2h0XTAEfN
	 YlB6syQ92YfeXcUaKX0tOkuDWfJe6QRSV7CwvnApk5JFHxheX7U4kHPa7TNEWPzeYt
	 63tfkQ8sVidmEmYgJFaR+bQWhkDbOGRszCBIbnAXCj3VH+GzChsmAPWAR+CZmch6Ty
	 w2pPvxI8G4LOrIW1fwOwrW/aLZVd0sNNwn4B6mlPDWBUSd+cG3DHqsy9cUZ9oLxuxK
	 GH8mduns8U94A==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	johan+linaro@kernel.org
Cc: Thierry Reding <treding@nvidia.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: FAILED: Patch "gpiolib: fix debugfs newline separators" failed to apply to v5.15-stable tree
Date: Tue,  5 Nov 2024 21:12:07 -0500
Message-ID: <20241106021208.182701-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the v5.15-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 3e8b7238b427e05498034c240451af5f5495afda Mon Sep 17 00:00:00 2001
From: Johan Hovold <johan+linaro@kernel.org>
Date: Mon, 28 Oct 2024 13:49:58 +0100
Subject: [PATCH] gpiolib: fix debugfs newline separators

The gpiolib debugfs interface exports a list of all gpio chips in a
system and the state of their pins.

The gpio chip sections are supposed to be separated by a newline
character, but a long-standing bug prevents the separator from
being included when output is generated in multiple sessions, making the
output inconsistent and hard to read.

Make sure to only suppress the newline separator at the beginning of the
file as intended.

Fixes: f9c4a31f6150 ("gpiolib: Use seq_file's iterator interface")
Cc: stable@vger.kernel.org	# 3.7
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Link: https://lore.kernel.org/r/20241028125000.24051-2-johan+linaro@kernel.org
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d5952ab7752c2..e27488a90bc97 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4926,6 +4926,8 @@ static void *gpiolib_seq_start(struct seq_file *s, loff_t *pos)
 		return NULL;
 
 	s->private = priv;
+	if (*pos > 0)
+		priv->newline = true;
 	priv->idx = srcu_read_lock(&gpio_devices_srcu);
 
 	list_for_each_entry_srcu(gdev, &gpio_devices, list,
-- 
2.43.0





