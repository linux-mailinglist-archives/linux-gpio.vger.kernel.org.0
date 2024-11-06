Return-Path: <linux-gpio+bounces-12581-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D09C9BDCB4
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 03:29:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AD5C286E6C
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 02:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA7E1217336;
	Wed,  6 Nov 2024 02:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s7R4TaON"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640CA2170DC;
	Wed,  6 Nov 2024 02:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730859235; cv=none; b=VMsRzuFq265dpV/tluj6BloCwl6rTZK0RcfBpZ6tQ5T6lgZ3pW0xyFdieG8FPQNVzVWvWWLQ5RdO3QmN/gh6dEzC5MGSF7xNJ3qIBT2tnxaXyw1+RotJRiYZDVFeTwFIG60IvWqmZIiVuKVGWxzy8dPlz+ERAUlw24yyiBnNS8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730859235; c=relaxed/simple;
	bh=AbgOn6IIWglOxnKt5D36jG2+elDyOStFw9KzaK2X6/8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J/iBd1M8sRWSqM79eB1PR/lxoZ1hgp+9dgbZwoQFshzpL5LT9HLtfqfKeT9z3shsCRYV4z/yd3RjQEv4qf6btV6a+eHUcIh2TyfujbyGpUi//oe/nohb1bUj008OxoX34kejbO7g9U3fCIfWLbY1cEhtKobJ5ocjQiNmZtw597M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s7R4TaON; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6567C4CECF;
	Wed,  6 Nov 2024 02:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730859235;
	bh=AbgOn6IIWglOxnKt5D36jG2+elDyOStFw9KzaK2X6/8=;
	h=From:To:Cc:Subject:Date:From;
	b=s7R4TaONu/E88w1iBbUvVS4gh11Efym6uACoAc145YSrqXC4w31j5yp0zT6QZ9IVw
	 Cb7Rbozyib/u8hc/WeJ7Bx47EVl8vM4ynZ6Ii4Tp3uvRVBeFAA4ULHtnAIppMnycxY
	 PmD3eo3TfA8sccVKEZuKv/1qIreuQvuwcUhaj42Y4UBAnP0g0M+JP8KfUe05oAB0/3
	 0wnX5q89WfB12ool4/aB6fJH8WfzFYm4ZPbLJKzrNff/jEjYc2ex+2u07qUOo7ah36
	 H1n/Z9GTen+SN6hNAqZ6pewzuEh8yybGK1ZGa9Gayl7AXso82hvmxOiteL/MM+Pged
	 9SX4rw2IIka7A==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	johan+linaro@kernel.org
Cc: Thierry Reding <treding@nvidia.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: FAILED: Patch "gpiolib: fix debugfs newline separators" failed to apply to v5.4-stable tree
Date: Tue,  5 Nov 2024 21:13:51 -0500
Message-ID: <20241106021352.183884-1-sashal@kernel.org>
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

The patch below does not apply to the v5.4-stable tree.
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





