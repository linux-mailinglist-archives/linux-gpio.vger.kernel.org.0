Return-Path: <linux-gpio+bounces-12231-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 702649B3104
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 13:51:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33F74282420
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 12:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7071DB350;
	Mon, 28 Oct 2024 12:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QtSP5Jcd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31681DA100;
	Mon, 28 Oct 2024 12:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730119857; cv=none; b=CFH4MqhPcdulcyr2kESkNlCUEbfmPxBraK3rIz9TLRKynF1LQUxUrkoeaDjw9M+D9/71KBSfs9lRgw/SF/pGBWubwIZo5ToJpW06coxwAJ5dGIcmTV1J+/p4afUiCSTjuq/V3pBfk/nxIF5tQgU3DjL0Ue3Oe67w0FMdDN6fR14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730119857; c=relaxed/simple;
	bh=7Ge9yzexlqDrgDbguS0+PqX9Rod1WKkx1jZBzXFlStU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rRDqbkOocERwRz/7l9GnTw8PADxcsK+qaYGppKJtWy/e8natpqnpJT5Fr4rEEU+GvqiedlIkHx/JxwW+wwoipmz1kljN5NhQ5Hiifcd6kPPrDArvNxYH72bwV8s6fZ/7XnB1XQLC8JtIWyJkeaonrQ6akIBe1bwxWPhXbuijgj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QtSP5Jcd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5702EC4AF09;
	Mon, 28 Oct 2024 12:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730119857;
	bh=7Ge9yzexlqDrgDbguS0+PqX9Rod1WKkx1jZBzXFlStU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QtSP5Jcduk9xAWbMDpZA3+URbKixIbLhWB1BmfaOfybNkhODBXC4ABFNHrE8daQEf
	 4EslBBTYM5lkHUKJNd8VXGGpMc2xqZMUMkvEcYOcIkOUTgnZxTFFy+XfCqSPQIE00Y
	 nGYtBWvFxwmVHIJx5Tek/hB3rFEichpVXxHURjksZXspx8gNmOtSm8GJhWTidKjpwK
	 oKBB3V9/iXFro2ooTeD2HxFyfrHCabT9feN8rwbj1l4MQpcU/CvDI+LefJFbcfnhwn
	 KTtKlmLseplvabaONpn2cvN5QMgyvEtiTRk3SbIP2vIEhTgxdMurQwRcVAkCc8zaRR
	 3sAxE7EOcvekQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1t5PDH-000000006ID-247V;
	Mon, 28 Oct 2024 13:51:15 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH 1/3] gpiolib: fix debugfs newline separators
Date: Mon, 28 Oct 2024 13:49:58 +0100
Message-ID: <20241028125000.24051-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241028125000.24051-1-johan+linaro@kernel.org>
References: <20241028125000.24051-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
---
 drivers/gpio/gpiolib.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d5952ab7752c..e27488a90bc9 100644
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
2.45.2


