Return-Path: <linux-gpio+bounces-9373-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2A39646BF
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 15:35:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B34F21C22791
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 13:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4AA31B2524;
	Thu, 29 Aug 2024 13:30:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5741B1502
	for <linux-gpio@vger.kernel.org>; Thu, 29 Aug 2024 13:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724938221; cv=none; b=fX4dJFTkA5jwKUujfQnAzOekqRfx8rKBs+PFKNbyqtCxq3hqOgPGCxZYVuKssmgJVMjCGoCW2t9WPwCzgHZCuNl9YtRmPchISzhF8Uo8zKYvA9yMukqIBrCSjU9Cwl85GO0q/6bAWFkWQ4WuRz2kHELm0ThErjHkKC199MAlyEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724938221; c=relaxed/simple;
	bh=CbdIQeNWcTaquZRkiWOo9Q15bNv2vkYT5QsNGmJrwBc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=czW3yse6Ty1McFNDpMpBoqFVLgdd39K8wzy50VqFDYYO6kOpizKz3MM3wojCTOO40vWcBJQwlS37fkcvkapBOrAeBnIcXY6rwBkc1I32+QcErXu8F3cehwS8tor/NlzyvtESOcZzxh9xL4iKZX5lACV5X4XLwDwgi+yjXnVM09c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:fbdf:b855:e99a:9ec0])
	by xavier.telenet-ops.be with cmsmtp
	id 5pWA2D00B0Yrr4n01pWA8Y; Thu, 29 Aug 2024 15:30:11 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sjfDz-001GQ2-RK;
	Thu, 29 Aug 2024 15:30:10 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sjfE2-00028h-Ih;
	Thu, 29 Aug 2024 15:30:10 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Stephen Warren <swarren@nvidia.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: Join split messages and remove double whitespace
Date: Thu, 29 Aug 2024 15:30:07 +0200
Message-Id: <c8e3feeedbf42a130936a5afaea0f129bcda51f6.1724938156.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Splitting error messages across multiple lines makes it harder to find
them in the kernel sources.  Fix this by joining the messages.
Remove double whitespace (end of first line + begin of second line).

Fixes: 1c8e794432c2ee75 ("pinctrl: improve warning messages")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/pinmux.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index aae71a37219b26ff..02033ea1c643842c 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -442,8 +442,7 @@ int pinmux_enable_setting(const struct pinctrl_setting *setting)
 			gname = pctlops->get_group_name(pctldev,
 						setting->data.mux.group);
 			dev_err_probe(pctldev->dev, ret,
-				"could not request pin %d (%s) from group %s "
-				" on device %s\n",
+				"could not request pin %d (%s) from group %s on device %s\n",
 				pins[i], pname, gname,
 				pinctrl_dev_get_name(pctldev));
 			goto err_pin_request;
@@ -526,9 +525,7 @@ void pinmux_disable_setting(const struct pinctrl_setting *setting)
 			gname = pctlops->get_group_name(pctldev,
 						setting->data.mux.group);
 			dev_warn(pctldev->dev,
-				 "not freeing pin %d (%s) as part of "
-				 "deactivating group %s - it is already "
-				 "used for some other setting",
+				 "not freeing pin %d (%s) as part of deactivating group %s - it is already used for some other setting",
 				 pins[i], desc->name, gname);
 		}
 	}
-- 
2.34.1


