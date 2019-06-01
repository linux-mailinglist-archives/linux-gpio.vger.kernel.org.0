Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68FE431948
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Jun 2019 05:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbfFADab (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 May 2019 23:30:31 -0400
Received: from condef-04.nifty.com ([202.248.20.69]:35768 "EHLO
        condef-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbfFADab (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 May 2019 23:30:31 -0400
Received: from conuserg-12.nifty.com ([10.126.8.75])by condef-04.nifty.com with ESMTP id x513Q8SK004197;
        Sat, 1 Jun 2019 12:26:08 +0900
Received: from grover.flets-west.jp (softbank126125154139.bbtec.net [126.125.154.139]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id x513MrHC023003;
        Sat, 1 Jun 2019 12:22:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x513MrHC023003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1559359374;
        bh=r3qAVs3xM8MaSXiqlFioeBt+ecKWRRFeKPnE+XTAM3A=;
        h=From:To:Cc:Subject:Date:From;
        b=xw0YwrrAPeAY0OlcTa3SqAJKQnezXQoI2+/7rrH2CfETfalYjs1oPY4aVPA7tr9gd
         PRENg4z1TGu6XcME/fQNuRRNr/MWUyJDUA9g6NOMDBnSEuZOGzvFEhQ27AUfnIO3sa
         i1YAFJSzyn2RPF7OIZdKRk5sifWn4Jnc1sOFY9daWmqQyNbN9Bv7WwR1Z0r2TcU1q8
         wYJjAACezYFAKTQmvSn0Nxg8GYX4RN/YnoLhUfVK+VO0x+7E0OfO0bRe/S3bJLJByI
         R2uRHaeHgFubi/04LIXnk9kFNomJCl9TkcTXqn7fOzIIxpVKdpGhv5s4zM4BOfsM7g
         mqkobRgO/jTHA==
X-Nifty-SrcIP: [126.125.154.139]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-spdx@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Joe Perches <joe@perches.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-renesas-soc@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] treewide: fix typos of SPDX-License-Identifier
Date:   Sat,  1 Jun 2019 12:22:42 +0900
Message-Id: <20190601032242.10405-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Prior to the adoption of SPDX, it was difficult for tools to determine
the correct license due to incomplete or badly formatted license text.
The SPDX solves this issue, assuming people can correctly spell
"SPDX-License-Identifier" although this assumption is broken in some
places.

Since scripts/spdxcheck.py parses only lines that exactly matches to
the correct tag, it cannot (should not) detect this kind of error.

If the correct tag is missing, scripts/checkpatch.pl warns like this:

 WARNING: Missing or malformed SPDX-License-Identifier tag in line *

So, people should notice it before the patch submission, but in reality
broken tags sometimes slip in. The checkpatch warning is not useful for
checking the committed files globally since large number of files still
have no SPDX tag.

Also, I am not sure about the legal effect when the SPDX tag is broken.

Anyway, these typos are absolutely worth fixing. It is pretty easy to
find suspicious lines by grep.

  $ git grep --not -e SPDX-License-Identifier --and -e SPDX- -- \
    :^LICENSES :^scripts/spdxcheck.py :^*/license-rules.rst
  arch/arm/kernel/bugs.c:// SPDX-Identifier: GPL-2.0
  drivers/phy/st/phy-stm32-usbphyc.c:// SPDX-Licence-Identifier: GPL-2.0
  drivers/pinctrl/sh-pfc/pfc-r8a77980.c:// SPDX-Lincense-Identifier: GPL 2.0
  lib/test_stackinit.c:// SPDX-Licenses: GPLv2
  sound/soc/codecs/max9759.c:// SPDX-Licence-Identifier: GPL-2.0

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm/kernel/bugs.c                | 2 +-
 drivers/phy/st/phy-stm32-usbphyc.c    | 2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77980.c | 2 +-
 lib/test_stackinit.c                  | 2 +-
 sound/soc/codecs/max9759.c            | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/kernel/bugs.c b/arch/arm/kernel/bugs.c
index d41d3598e5e5..14c8dbbb7d2d 100644
--- a/arch/arm/kernel/bugs.c
+++ b/arch/arm/kernel/bugs.c
@@ -1,4 +1,4 @@
-// SPDX-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0
 #include <linux/init.h>
 #include <asm/bugs.h>
 #include <asm/proc-fns.h>
diff --git a/drivers/phy/st/phy-stm32-usbphyc.c b/drivers/phy/st/phy-stm32-usbphyc.c
index 1255cd1d9a60..56bdea4b0bd9 100644
--- a/drivers/phy/st/phy-stm32-usbphyc.c
+++ b/drivers/phy/st/phy-stm32-usbphyc.c
@@ -1,4 +1,4 @@
-// SPDX-Licence-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0
 /*
  * STMicroelectronics STM32 USB PHY Controller driver
  *
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77980.c b/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
index 473da65890a7..9ed4ead2dafb 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
@@ -1,4 +1,4 @@
-// SPDX-Lincense-Identifier: GPL 2.0
+// SPDX-License-Identifier: GPL-2.0
 /*
  * R8A77980 processor support - PFC hardware block.
  *
diff --git a/lib/test_stackinit.c b/lib/test_stackinit.c
index 13115b6f2b88..e97dc54b4fdf 100644
--- a/lib/test_stackinit.c
+++ b/lib/test_stackinit.c
@@ -1,4 +1,4 @@
-// SPDX-Licenses: GPLv2
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Test cases for compiler-based stack variable zeroing via future
  * compiler flags or CONFIG_GCC_PLUGIN_STRUCTLEAK*.
diff --git a/sound/soc/codecs/max9759.c b/sound/soc/codecs/max9759.c
index ecfb4a80424b..00e9d4fd1651 100644
--- a/sound/soc/codecs/max9759.c
+++ b/sound/soc/codecs/max9759.c
@@ -1,4 +1,4 @@
-// SPDX-Licence-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0
 /*
  * MAX9759 Amplifier Driver
  *
-- 
2.17.1

