Return-Path: <linux-gpio+bounces-7368-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A794904342
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 20:13:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A676528CCE4
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 18:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38FAA5B1FB;
	Tue, 11 Jun 2024 18:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JqGNzTG0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA06238F82;
	Tue, 11 Jun 2024 18:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718129615; cv=none; b=If7bZZ49o3q/kpYKTK0jjdNmagb8zWF7ATtxU7rY1DlNsC1LyI4d4w8KgDwgfsaGQIa1nB9GB9ZqLrzDtxE9YVmRTcD4P9/RYto6hbvAsxWaytlbC10URlTXfVYVAzqaynp8w7S0z8x2TjO1TnBdksjMsWgDLJ5K/jxFOa1+x6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718129615; c=relaxed/simple;
	bh=uivTqbZoY1v55pF3TqH87ho4GbXW/I0PrebU1TrJ1FY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bKSw+HpcJpDQfjqKeHJWKIpgqukBP46Bm9G30zJdgMxD30UdZjbG6gpYBDKMT0yNXKljiP1tN4VwLujWR/3fDlD3fUCLvKT4P/yQNYqMhc5/rd7s8cRC2GkPfclpVIbp1PaLa/TLxnWiOikSyLG8/ZIRqHbavkWkE1jAK2fJ4SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JqGNzTG0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E40FC2BD10;
	Tue, 11 Jun 2024 18:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718129614;
	bh=uivTqbZoY1v55pF3TqH87ho4GbXW/I0PrebU1TrJ1FY=;
	h=From:Date:Subject:To:Cc:From;
	b=JqGNzTG0s2Ec/LNdhv0lx4CB6za6ouDuHfBjWBgjqDPsvI2R0nvog8IXEhZfo6Rdf
	 zkgR1OCItcoHVisxojlxr7/5CuNjvAcFHPsEVVhRBxqTXiYdfZ8g2RIMdE4khIzQVh
	 Jgqf6PA5y465o1294Etli6sJzvlVODREmLFNUEUoQp8NTobft1IsYjav+NG9DOwj9a
	 IxNkLEpF1kvC9J7NZiDSi1uEnWvIGp/vKB2Ik4kIpjdX0F/F6ZsJHsKpPkVnEW9+XI
	 mMrRmHaWOxeg1IMu3lOPJZg5dYLAzGKuWB44PDfZI1LQ/9LAf5or6vKVffckLiegZP
	 q2rPW8OzIxgNg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 11 Jun 2024 11:13:32 -0700
Subject: [PATCH] pinctrl: keembay: Fix func conversion in
 keembay_build_functions()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240611-pinctrl-keembay-fix-func-conversion-v1-1-3197f2ded3f7@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMuTaGYC/x2N0Q6CMAxFf4X02SbbQhT9FePDVgo0aCEdEgnh3
 50+nuSee3bIbMIZbtUOxqtkmbSAP1VAQ9SeUdrCEFyo3dl7nEVpsSeOzK8UN+zkg91bCWnSle3
 n48Wla8MhxVgTlKfZuMz+lfvjOL6x9eQvdQAAAA==
To: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-gpio@vger.kernel.org, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1449; i=nathan@kernel.org;
 h=from:subject:message-id; bh=uivTqbZoY1v55pF3TqH87ho4GbXW/I0PrebU1TrJ1FY=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDGkZk8/ujBPlMkw0Yb9RmWa9frlvXYdWde8UoQxu0z6n+
 f85i3d3lLIwiHExyIopslQ/Vj1uaDjnLOONU5Ng5rAygQxh4OIUgIm0H2Rk6BL63s2V8DZY2qW0
 4sOBGfWJbX7fV8tf+rs9Mtr0VN8zAYZ/Srrr653W3pUyaPfPYnJXff4u7z4T34L5t2MEV+sduKX
 HDAA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

A recent refactoring to use the func member in struct function_desc
missed converting one uses of name in keembay_build_functions(),
resulting in a build failure:

  drivers/pinctrl/pinctrl-keembay.c: In function 'keembay_build_functions':
  drivers/pinctrl/pinctrl-keembay.c:1630:35: error: 'struct function_desc' has no member named 'name'
   1630 |                         if (!fdesc->name) {
        |                                   ^~

Perform the same conversion to resolve the build error.

Fixes: 73ee52205e5a ("pinctrl: keembay: Convert to use func member")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/pinctrl/pinctrl-keembay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 245a74ed97ee..b693f4787044 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -1627,7 +1627,7 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
 			}
 
 			/* Setup new function for this mux we didn't see before */
-			if (!fdesc->name) {
+			if (!fdesc->func.name) {
 				fdesc->func.name = mux->name;
 				fdesc->func.ngroups = 1;
 				fdesc->data = &mux->mode;

---
base-commit: e53de87ac331eb2186477f69bf90e95d1ba39d55
change-id: 20240611-pinctrl-keembay-fix-func-conversion-70b98e2baa4c

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


