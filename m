Return-Path: <linux-gpio+bounces-1959-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D36821E1A
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jan 2024 15:52:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05235B21FA6
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jan 2024 14:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A6913FFE;
	Tue,  2 Jan 2024 14:52:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from wormhole.robuust.nl (leaseweb-ip1.robuust.nl [178.162.147.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C96B12E4D
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jan 2024 14:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensourcepartners.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wormhole.robuust.nl
Received: from costar (helo=localhost)
	by wormhole.robuust.nl with local-esmtp (Exim 3.36 #1 (Debian))
	id 1rKg7d-0005NV-00
	for <linux-gpio@vger.kernel.org>; Tue, 02 Jan 2024 15:52:01 +0100
Date: Tue, 2 Jan 2024 15:52:01 +0100 (CET)
From: "J.A. Bezemer" <j.a.bezemer@opensourcepartners.nl>
X-X-Sender: costar@wormhole.robuust.nl
To: linux-gpio@vger.kernel.org
Subject: [libgpiod][PATCH v2] core: fix deselection of output direction when
 edge detection is selected
Message-ID: <Pine.LNX.4.64.2401021550390.16108@wormhole.robuust.nl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII

Fix deselection of output direction when edge detection is selected in
make_kernel_flags(). Use correct flag to perform deselection rather than
a library enum.

For correct usage, there are no visible side-effects. The wrongly reset
kernel flags are always zero already.

For incorrect usage of edge detection combined with output direction,
both output and input directions would have been requested from the
kernel, causing a confusing error. Such usage will now be sanitized, as
intended, into a working configuration with only input direction.

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


