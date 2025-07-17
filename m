Return-Path: <linux-gpio+bounces-23414-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA81B08FEB
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 16:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5724F3A4D98
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 14:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC34F2F7D04;
	Thu, 17 Jul 2025 14:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lW3185EN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C0514E2E2;
	Thu, 17 Jul 2025 14:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752763883; cv=none; b=s+7NYvZotLU93gtKeWDabdjA1waK7o1WMwdybP9l+KFBl6ESKw0FXzZORgan7lJERoYimZQwZjfnpqcizII6QnZOGeF4IyTeDWMmXe+HObr/Npc6H9gPbMreYsCoc6nKL/i45hLcBoArZXRI0Omdr3+/lulNW2O/vIT/ZlHu/eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752763883; c=relaxed/simple;
	bh=MP9BmCbwpKpHjixUZfTCj8rTrM1iVy1gnis52tX8tgw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SlM3fV4R76YmY836F9t0t30Cm/ZbUKWGfm/7fH0ikylG2dzp6wPxmwjy0IbI+UuU4DDongTaIBTk/AJXdjeOanJ8UvpuXUSBDwoFpAKquLZZ1vI5ah9STYgqXqwcIdlxacCS4lbG7HgS5aczhfAH/6zjKFvMRIML0Z2AUxxu/KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lW3185EN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D3DCC4CEEB;
	Thu, 17 Jul 2025 14:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752763883;
	bh=MP9BmCbwpKpHjixUZfTCj8rTrM1iVy1gnis52tX8tgw=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=lW3185ENnwmrOFhKcU5lDziS9wvic8V3+AfQvu7fwITJIZFxVnpVoBR9XgNjUp8Nz
	 BDCnB9pvRwLGFLxQEiZUpX1g4QSkPUdMNfkUIYfg4/zaZbWvHq/WEkxM+Rw6cRF6Rv
	 FfpBZsxeJ+CQIzW8aU5FHTZe5d0XmFMUVSg+MKKxIFz3CVzroJBQFy3oZpEKb3eVuE
	 M5f/ISBPKt+DXDbUKQu9J23Oy/p44EEsLxLJIwMjn46GNEoha3WGZ/Sq7PBkVZFiFU
	 g9QkNO9Z3RoG16NdyGhWsBawdUOPGpImkMjt/XNl61wAmnkvZAbe6IsKDawXt2Fi0D
	 1T/kXQCTeP+CA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 229A8C83F34;
	Thu, 17 Jul 2025 14:51:23 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Date: Thu, 17 Jul 2025 15:51:34 +0100
Subject: [PATCH] mfd: adp5585: Drop useless return statement
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250717-adp5585-drop-ret-v1-1-2ae65bd780aa@analog.com>
X-B4-Tracking: v=1; b=H4sIAPUNeWgC/x3MQQqAIBBA0avErBvQwKyuEi0sp5qNyRgRiHdPW
 r7F/xkSCVOCqckg9HDiK1TotoHtdOEgZF8NneqMstqi89GYwaCXK6LQjf2qtRqtdcp5qFkU2vn
 9l/NSygfVjARQYgAAAA==
X-Change-ID: 20250717-adp5585-drop-ret-6b110977a0ad
To: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Lee Jones <lee@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752763896; l=1199;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=fa2lU4nXFqoCVVCIfit96zG313AYsYjHUMW+fLWBw3E=;
 b=GiPWHTiCOaER8fe0hS7yssIfg0FKiPLqsOJf5qw/KWPP/gHcS0Kfr3Z8XPeTl0hrOj1aeyVKq
 k91h25x/INrBz+yG0MNRoZFWCp/XSIsuCDZfZmlNahBrcY3zchJ9HwH
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sá <nuno.sa@analog.com>

In adp5585_reset_ev_parse(), when parsing the
adi,reset-pulse-width-us property, we were returning in case it was
found and valid. No point in doing that as we'll be returning anyways
after the exiting the property scope. And it could actually lead to bugs
if new properties happen to added after this one.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-gpio/c85604d9e077511b8aa6ee0786579594cc0103d4.camel@gmail.com/T/#ma25557bd06ccd2531dc9c85ba6be74af781b81aa
Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/mfd/adp5585.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mfd/adp5585.c b/drivers/mfd/adp5585.c
index 58f7cebe2ea4f2c68f64370449f5fbce8a2f14ed..46b3ce3d7bae8981824a957f6b4ee471d803c981 100644
--- a/drivers/mfd/adp5585.c
+++ b/drivers/mfd/adp5585.c
@@ -432,7 +432,6 @@ static int adp5585_reset_ev_parse(struct adp5585_dev *adp5585)
 					     "Invalid value(%u) for adi,reset-pulse-width-us\n",
 					     prop_val);
 		}
-		return ret;
 	}
 
 	return 0;

---
base-commit: 8f3ef4da96dd3f3e12f6313cbe8cd16a39e9abae
change-id: 20250717-adp5585-drop-ret-6b110977a0ad
--

Thanks!
- Nuno Sá



