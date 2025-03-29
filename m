Return-Path: <linux-gpio+bounces-18099-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E383AA7541F
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Mar 2025 04:27:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE9E1189B097
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Mar 2025 03:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BEA62C859;
	Sat, 29 Mar 2025 03:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=exmakhina.com header.i=@exmakhina.com header.b="Z34aD5NS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from exmakhina.com (exmakhina.com [69.70.16.43])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F3E023774
	for <linux-gpio@vger.kernel.org>; Sat, 29 Mar 2025 03:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=69.70.16.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743218852; cv=none; b=MycCt65INTOrs9rSbKC0XSD58TRmi0S6k6Q5IbazMJbBeaHkV5eyPc/jcdaahF3ZIHMhq/dC0ZbWjUxXrP95ZUyYP0rnGDviyJXsOlRCsnTiIGVbmu8BLnuRLL60CzCx1aQIniXtHae91IWvitmCtBGUhECSFW6bjlkjuM5/N+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743218852; c=relaxed/simple;
	bh=+1MAVDE2bNCutiUF46NiXnNhZe2P6ZLtgPrjqB2Fg0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PrQaCr6fLZDvHTrB3Ql82yczqUdGWSn0jTxQYXBC2YjeBKfRuOYoiMBeeOXXsvGWK6uX/NLammV27Sn91EqRGH5TfbQz/qYnZdCxu4D7CULPzWU8W9K5EZJnhqW465WRb3Bur/o4GDUPn8fGUZobuwx/MdVr1CP2F4DeFYpYyXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=exmakhina.com; spf=pass smtp.mailfrom=exmakhina.com; dkim=pass (1024-bit key) header.d=exmakhina.com header.i=@exmakhina.com header.b=Z34aD5NS; arc=none smtp.client-ip=69.70.16.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=exmakhina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exmakhina.com
Received: from fedora.. (bras-base-mtrlpq1925w-grc-31-184-145-243-85.dsl.bell.ca [184.145.243.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by exmakhina.com (Postfix) with ESMTPSA id 9FBCA9E9870B;
	Fri, 28 Mar 2025 23:20:15 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=exmakhina.com;
	s=exmakhina.com; t=1743218415;
	bh=+1MAVDE2bNCutiUF46NiXnNhZe2P6ZLtgPrjqB2Fg0M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z34aD5NSDFvDIxj4JXmW76BD+hdHu3yZDwcQnJ3AguKInbozw6lXUrwx5Y5e2Y8wL
	 k37HOsyigJpJPup+BZo97b9UWt2walbKR3aN6bFlmmsuY8eaQFi2xOa8ble/08WjjI
	 72HNmroXbiz29wJOItl2DAPKmxUypwscni9+fczQ=
From: Rostyslav Lobov <rostyslav@exmakhina.com>
To: linux-gpio@vger.kernel.org
Cc: Rostyslav Lobov <rostyslav@exmakhina.com>
Subject: [PATCH] examples: reconfigure_input_to_output: Remove useless variable
Date: Fri, 28 Mar 2025 23:18:07 -0400
Message-ID: <20250329031923.564215-1-rostyslav@exmakhina.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250326041707.GA62833@rigel>
References: <20250326041707.GA62833@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `req_cfg` is declared to NULL, never used and then freed.

Signed-off-by: Rostyslav Lobov <rostyslav@exmakhina.com>
---
 examples/reconfigure_input_to_output.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/examples/reconfigure_input_to_output.c b/examples/reconfigure_input_to_output.c
index 451bb0e..734a99c 100644
--- a/examples/reconfigure_input_to_output.c
+++ b/examples/reconfigure_input_to_output.c
@@ -71,7 +71,6 @@ static int reconfigure_as_output_line(struct gpiod_line_request *request,
 				      unsigned int offset,
 				      enum gpiod_line_value value)
 {
-	struct gpiod_request_config *req_cfg = NULL;
 	struct gpiod_line_settings *settings;
 	struct gpiod_line_config *line_cfg;
 	int ret = -1;
@@ -95,8 +94,6 @@ static int reconfigure_as_output_line(struct gpiod_line_request *request,
 
 	ret = gpiod_line_request_reconfigure_lines(request, line_cfg);
 
-	gpiod_request_config_free(req_cfg);
-
 free_line_config:
 	gpiod_line_config_free(line_cfg);
 
-- 
2.49.0


