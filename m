Return-Path: <linux-gpio+bounces-12578-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D839BDC38
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 03:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 433BC281812
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 02:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E1A1DCB3A;
	Wed,  6 Nov 2024 02:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UUEE9GdF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7281922F2;
	Wed,  6 Nov 2024 02:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730859067; cv=none; b=O1lmdEnIPcWBoDNlfbEfjIHR2GPjoITlVsj1SwqnwRDlCpyYJfyPAom3BEyxZlm6UQbof9KN486BoesWVPPGbulkLWpEfrfJ3CGcGi2FA6f/Cx6leCLE30OJMoKJXpwtKSV9wfUbgShfKpWzhY82yDeztj+TcjPy5KrhlNqETp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730859067; c=relaxed/simple;
	bh=ABChe0DDrUh7riODHraoS3VhDBIf5nNu/+LH+8P2Dyg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bf8aiuiaa0wh+RZypj1o+Fs5Ii1M56TQXdUHaoNp2JIXKM4eysytry5wir+dot/PU2rcfPQyPRoYZhoDSSU8mp0axN48AwYzyKlIe6w5jA6iFHn1dZu4i2TAhX8nd/eXpUdm4iX8x3XZTfW+nZ+EZQVtzJQ88nFKjrRd7+zjVIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UUEE9GdF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC50DC4CECF;
	Wed,  6 Nov 2024 02:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730859066;
	bh=ABChe0DDrUh7riODHraoS3VhDBIf5nNu/+LH+8P2Dyg=;
	h=From:To:Cc:Subject:Date:From;
	b=UUEE9GdF6ag+xxgb9B2Z2GKjrVtp5DYCRKlOSO0zwO8DV/+LCzIaVZGOyrfmY0o3T
	 ZjEkQ/0IwleGgeElf+yrdL53jy1c2VI86uFa2QbJf6LOAc6T3+qNNxSnRabSFH9SBJ
	 qdAn52qFNkwg8I98ijJhxKgwh+KIt1DpT9h7B54mlmoQscA7tvMVgmvXhNQHixSXbd
	 bzH7v8s03FvN/+2TR3uZcE9cEky7MfLuA3cuBwQEDT5fZYmzt/IRIrj5i+LJPD+rVR
	 Z/JEB0Hf0gkxgD+8qzQQ7JnxmNgF+OWZlT0GR+/8bGjWM+sREjj0lR/rE2Y2whTK0X
	 jQ7FcbLlQdbsg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	johan+linaro@kernel.org
Cc: Thierry Reding <treding@nvidia.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: FAILED: Patch "gpiolib: fix debugfs newline separators" failed to apply to v6.1-stable tree
Date: Tue,  5 Nov 2024 21:11:02 -0500
Message-ID: <20241106021102.181999-1-sashal@kernel.org>
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

The patch below does not apply to the v6.1-stable tree.
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





