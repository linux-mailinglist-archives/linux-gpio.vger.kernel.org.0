Return-Path: <linux-gpio+bounces-30754-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E78B9D3BDD2
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 04:09:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 94FEE344DC4
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 03:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42424315785;
	Tue, 20 Jan 2026 03:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uD8lmFlo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BE4314D25;
	Tue, 20 Jan 2026 03:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768878553; cv=none; b=gQKATzfSZtVXrteJxFnc6/SzBMu227g4jg3FZEr7xBVjaNQtH2bFDPIBXV1ReP1c/9qdfypAvxDNSnKjdGn+LBD+cnQxhyhUj32aKXiyTZjUPpeRkNvxohGEqP0wcgLqhHDt2+sH0LqeJ3N0knLrh0D96DLj683oazC2Gbzqa/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768878553; c=relaxed/simple;
	bh=xZCXxSqXeWx/yDTsOqcgj/NqLvuAdxSSffJY5VldioE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mnXSq/vgyt/sQXRMYQskIPIAB3q/ro1u0h0GItTACdn5iHe0yIZ/QhYlwrCF8zEPX1IBdO+3FjcZdqMHZVPw9bS3lE25Vb27EiBGBh4mBPzpz4tnqfv875ZP7zbJXFEkoh0shQimXLZi0fLf3qrXLkiW4geyM6G1AQ2139HQLf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uD8lmFlo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE113C16AAE;
	Tue, 20 Jan 2026 03:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768878552;
	bh=xZCXxSqXeWx/yDTsOqcgj/NqLvuAdxSSffJY5VldioE=;
	h=From:To:Cc:Subject:Date:From;
	b=uD8lmFloTFGTDajNp3xEAceNo6W9kHDoD85S0GBFsoAe1vUXmih08QOrtIXWNk9nw
	 e3E6qfxqBaRdxV32PPyVEd02wlTXvyOrnUNUjpEi8asolMnaxTAH63xJRdlCW8B8ir
	 LoeOfs8Ql7n1Pse6PmB/aeb44Pj5ukmMqcyhfRED2k7g8V3diW0SefERNEgy3gVTa6
	 bE0yCVn+5rNCGZfIfQtDhbCHmN7iRa0pDUZq96z/3uY577uXSeN7OmTSAPbqdPjPKK
	 cIbziGW8PSUnJreotfRcFlwPKI2XPKma2/NpMpAbnH83h7XdxaBgOEFEY0l7STrkBC
	 vfUgtQGJU9PHg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tzungbi@kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] gpiolib: cdev: Fix resource leaks on errors in lineinfo_changed_notify()
Date: Tue, 20 Jan 2026 03:08:56 +0000
Message-ID: <20260120030857.2144847-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On error handling paths, lineinfo_changed_notify() doesn't free the
allocated resources which results leaks.  Fix it.

Cc: stable@vger.kernel.org
Fixes: d4cd0902c156 ("gpio: cdev: make sure the cdev fd is still active before emitting events")
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v2:
- Drop the label "err_put_fp" and fput() in the error path directly.
- Add "cdev" prefix in title.

v1: https://lore.kernel.org/all/20260116081036.352286-5-tzungbi@kernel.org/

 drivers/gpio/gpiolib-cdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 550795987da0..b886f4474e5a 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2549,6 +2549,7 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
 	ctx = kzalloc(sizeof(*ctx), GFP_ATOMIC);
 	if (!ctx) {
 		pr_err("Failed to allocate memory for line info notification\n");
+		fput(fp);
 		return NOTIFY_DONE;
 	}
 
-- 
2.52.0.457.g6b5491de43-goog


