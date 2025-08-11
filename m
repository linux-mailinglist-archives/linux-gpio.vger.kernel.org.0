Return-Path: <linux-gpio+bounces-24167-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2B0B2097D
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 15:00:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A594F3B05A3
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 13:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4882BE650;
	Mon, 11 Aug 2025 13:00:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FDF2D77E7;
	Mon, 11 Aug 2025 13:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754917207; cv=none; b=lYATNxKxjRqz9mIhMbE+SayiK7txPb1lkWuYDhy0HifothbTP89ncdrskw2LADnRwnBVptwgIZ+L4A1wSiTa9z/df3bEzhw0GPAjhTTeCug3SnSlDPkjxjWK9MoefdhFkzqh5APpdC9jhphNKfISi2m6QCMOkRExPoF8EzxnQm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754917207; c=relaxed/simple;
	bh=elE5KHarqV3QAn7l4P4nQO8oZta8f7de373yMKWNBnE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cgd8vdB8KfPzm5gPqgm5d4r1yD7x9JshquCSRitaLyWBt9DrJ7RhEBh3Fx2gzwyiLO7GZUjLqa5i6QRdxEUzjhZxzPmZ+RP2MbruWZo2l8vauT0tv5Rbkujl/5ImJNAW8CiBM/ICr2tSoZ1drTEppgoyX/s+oZWq+2LqLAn8f5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9C1EC4CEED;
	Mon, 11 Aug 2025 13:00:04 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: TODO: remove the task for converting to the new line setters
Date: Mon, 11 Aug 2025 15:00:01 +0200
Message-ID: <417af7e5a110c527eb759289bd5d2fd6885f4e01.1754917104.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The task is complete, but this was not reflected in the TODO file.

Fixes: d9d87d90cc0b10cd ("treewide: rename GPIO set callbacks back to their original names")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/TODO | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
index 7a09a4f58551b51c..b797499e627ee9fd 100644
--- a/drivers/gpio/TODO
+++ b/drivers/gpio/TODO
@@ -176,18 +176,6 @@ cannot be converted yet, but watch this space!
 
 -------------------------------------------------------------------------------
 
-Convert all GPIO chips to using the new, value returning line setters
-
-struct gpio_chip's set() and set_multiple() callbacks are now deprecated. They
-return void and thus do not allow drivers to indicate failure to set the line
-value back to the caller.
-
-We've now added new variants - set_rv() and set_multiple_rv() that return an
-integer. Let's convert all GPIO drivers treewide to use the new callbacks,
-remove the old ones and finally rename the new ones back to the old names.
-
--------------------------------------------------------------------------------
-
 Remove legacy sysfs features
 
 We have two parallel per-chip class devices and per-exported-line attribute
-- 
2.43.0


