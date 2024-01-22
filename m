Return-Path: <linux-gpio+bounces-2416-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EF50483649F
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jan 2024 14:44:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96272B24EE6
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jan 2024 13:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8615E3D0A4;
	Mon, 22 Jan 2024 13:43:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735383CF59
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jan 2024 13:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705931031; cv=none; b=AUe+YQ0UnpfTAn6GejUJ8oi4W594Hw9yhKe8FXi2r8iqLGHZQD58jMUKMlQLdHmMblrPVkRk2qtT4JioEqHDrEow0KbFFVnKOcRVKNQzxjq8QSo0DH8TbJwSQbsfJfJRF6iZwmELUAYZAegeV60TDQCeCg+i8P/Ee3fewWu7YsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705931031; c=relaxed/simple;
	bh=qZCpKYRn/rMmDIaM/pktkAZ1VLB0JuYM+7dXHmKtgpw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WQsDVE/Z48NrnFp5DA/CtYyV/LKVtsxGHuvB/AEsV4+AzaTDroQZzjNkvVDu+f8TA31FSM8rynZUc4ASSqWnq4FKU4dK3rHakths51TMXWlcSkvzjgX2h1jxKVGFliaylHmI2qfr5wnYNmfwdR01lJNQnAnPzBLF3FEWKsHnl5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:955e:bba5:7ff4:cfb6])
	by laurent.telenet-ops.be with bizsmtp
	id dpjg2B0050ZxL6o01pjgNo; Mon, 22 Jan 2024 14:43:40 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rRuZf-00GGv6-2y;
	Mon, 22 Jan 2024 14:43:40 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rRuaS-00CDsf-2i;
	Mon, 22 Jan 2024 14:43:40 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: checker: Limit cfg reg enum checks to provided IDs
Date: Mon, 22 Jan 2024 14:43:38 +0100
Message-Id: <c7385f44f2faebb8856bcbb4e908d846fc1531fb.1705930809.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the number of provided enum IDs in a variable width config register
description does not match the expected number, the checker uses the
expected number for validating the individual enum IDs.

However, this may cause out-of-bounds accesses on the array holding the
enum IDs, leading to bogus enum_id conflict warnings.  Worse, if the bug
is an incorrect bit field description (e.g. accidentally using "12"
instead of "-12" for a reserved field), thousands of warnings may be
printed, overflowing the kernel log buffer.

Fix this by limiting the enum ID check to the number of provided enum
IDs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-pinctrl for v6.9.

 drivers/pinctrl/renesas/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index 93e51abbf519aa8e..8f6d7cc25b599149 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -907,9 +907,11 @@ static void __init sh_pfc_check_cfg_reg(const char *drvname,
 		sh_pfc_err("reg 0x%x: var_field_width declares %u instead of %u bits\n",
 			   cfg_reg->reg, rw, cfg_reg->reg_width);
 
-	if (n != cfg_reg->nr_enum_ids)
+	if (n != cfg_reg->nr_enum_ids) {
 		sh_pfc_err("reg 0x%x: enum_ids[] has %u instead of %u values\n",
 			   cfg_reg->reg, cfg_reg->nr_enum_ids, n);
+		n = cfg_reg->nr_enum_ids;
+	}
 
 check_enum_ids:
 	sh_pfc_check_reg_enums(drvname, cfg_reg->reg, cfg_reg->enum_ids, n);
-- 
2.34.1


