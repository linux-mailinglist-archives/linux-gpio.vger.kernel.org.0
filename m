Return-Path: <linux-gpio+bounces-1937-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAB382068F
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Dec 2023 14:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 237741F21352
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Dec 2023 13:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E338489;
	Sat, 30 Dec 2023 13:08:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from wormhole.robuust.nl (leaseweb-ip1.robuust.nl [178.162.147.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 653ED8F52
	for <linux-gpio@vger.kernel.org>; Sat, 30 Dec 2023 13:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensourcepartners.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wormhole.robuust.nl
Received: from costar (helo=localhost)
	by wormhole.robuust.nl with local-esmtp (Exim 3.36 #1 (Debian))
	id 1rJYlp-0007vQ-00
	for <linux-gpio@vger.kernel.org>; Sat, 30 Dec 2023 13:48:53 +0100
Date: Sat, 30 Dec 2023 13:48:53 +0100 (CET)
From: "J.A. Bezemer" <j.a.bezemer@opensourcepartners.nl>
X-X-Sender: costar@wormhole.robuust.nl
To: linux-gpio@vger.kernel.org
Subject: [libgpiod][PATCH] line-config.c: Fix library enum used for kernel
 flags bitfield
Message-ID: <Pine.LNX.4.64.2312301347330.29540@wormhole.robuust.nl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

Library enum was used to sanitize kernel flags.

This will probably not have broken any "correct" usage: it would clear
GPIO_V2_LINE_FLAG_USED, which is not used on setting, and
GPIO_V2_LINE_FLAG_ACTIVE_LOW, which is set correctly later on.

Signed-off-by: Anne Bezemer <j.a.bezemer@opensourcepartners.nl>
---
  lib/line-config.c | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/line-config.c b/lib/line-config.c
index 2749a2a..9bf7734 100644
--- a/lib/line-config.c
+++ b/lib/line-config.c
@@ -381,18 +381,18 @@ static uint64_t make_kernel_flags(struct gpiod_line_settings *settings)
  	case GPIOD_LINE_EDGE_FALLING:
  		flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
  			  GPIO_V2_LINE_FLAG_INPUT);
-		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
+		flags &= ~GPIO_V2_LINE_FLAG_OUTPUT;
  		break;
  	case GPIOD_LINE_EDGE_RISING:
  		flags |= (GPIO_V2_LINE_FLAG_EDGE_RISING |
  			  GPIO_V2_LINE_FLAG_INPUT);
-		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
+		flags &= ~GPIO_V2_LINE_FLAG_OUTPUT;
  		break;
  	case GPIOD_LINE_EDGE_BOTH:
  		flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
  			  GPIO_V2_LINE_FLAG_EDGE_RISING |
  			  GPIO_V2_LINE_FLAG_INPUT);
-		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
+		flags &= ~GPIO_V2_LINE_FLAG_OUTPUT;
  		break;
  	default:
  		break;
-- 
2.30.2


