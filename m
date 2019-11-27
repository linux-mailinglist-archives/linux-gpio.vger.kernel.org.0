Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47E0610B399
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 17:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbfK0Qkp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 11:40:45 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:42530 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbfK0Qkp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 11:40:45 -0500
Received: by mail-pj1-f66.google.com with SMTP id y21so10252862pjn.9;
        Wed, 27 Nov 2019 08:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XxnZyGcP9Rmlyi/FludPQAATJUUTPMQYYmErZMfJYoQ=;
        b=e+kP32NcUaqG5wx8/nGkohEXD3ItQ8/aha7ve3XqxfVhMblGDvxeUUyCNi48rX4WAX
         G2RH/hCsTv8YroV9j5FaPEN4in8mhio2C4a6/8xvcdfkxy+4sPu+JgE0eZX7HUuqCimG
         eMy/u5PPC3X3Eee3qtbxFY92aAGsGyLaWdW5Pj56veJNVw4uPbn6T4odwbKXc36gJnCE
         V1IZ5CUqiLZ7f32a4/4vsWG2mZM8X6Y3h/e1lTBU5P9Pf66sd2HzC2py/NWzkZetZOYZ
         YGRF4/bj2J9Z2DtLX3cRou4KkuT5D7LvQVS5uyAeS7K2uX24K9BzRozkqmt9S6vQ0qM8
         ftcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XxnZyGcP9Rmlyi/FludPQAATJUUTPMQYYmErZMfJYoQ=;
        b=qmWShlcl+g/x+2BwagOCR/Zo7Rl8BcMd/dZ4EyppxXioM7CUKGcKptt8l3Ow9u55Pe
         VzzuW3VYLPr2ztddEyUKpdy6lW9NXm0yjCnOHn9RIXF1nFX+5IY80D4JdV64SDKFSOfg
         fOh+er3EAKBlAfMo2hXfETt4mrEi1UOAAt4bTQOlVe5/uUZVQ58IW5EABdvD0Q8B/YGS
         h5+MOfe1W6mCy91m2nnmp/iEcf4s0kDRgFktEI0o0Sot64C63QNaC1TaX4vdVZ1bPwaO
         6gY/mvF8Aa/DG6w6Wm/hCvUekaXHMrH86HbON+DRLsytJLYkihMm6gv+oR95Ix9DvZ9y
         +nwg==
X-Gm-Message-State: APjAAAVYEgx7xxmAeRUYQ+EwAUjUpC+qf/sHs2WQDNwMBtBQ/xWNasxs
        k34QGKMMo0fLWn3p/geLYgk=
X-Google-Smtp-Source: APXvYqyOTdv5RtT17pzoqksEp4sCN6AzyskRPbgNbPryeVBL24MqJrBpusefhvfglg/U4YVOO8vpYw==
X-Received: by 2002:a17:902:7586:: with SMTP id j6mr5091675pll.43.1574872844265;
        Wed, 27 Nov 2019 08:40:44 -0800 (PST)
Received: from nishad ([106.51.232.103])
        by smtp.gmail.com with ESMTPSA id y17sm17002645pfl.92.2019.11.27.08.40.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2019 08:40:43 -0800 (PST)
Date:   Wed, 27 Nov 2019 22:10:33 +0530
From:   Nishad Kamdar <nishadkamdar@gmail.com>
To:     Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] pinctrl: actions: Use the correct style for SPDX License
 Identifier
Message-ID: <5b588fc885efca6efdc73869aa4b1eeeb3d6f6c5.1574871463.git.nishadkamdar@gmail.com>
References: <cover.1574871463.git.nishadkamdar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1574871463.git.nishadkamdar@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch corrects the SPDX License Identifier style in
header file related Actions Semi OWL pinctrl driver.
For C header files Documentation/process/license-rules.rst
mandates C-like comments (opposed to C source files where
C++ style should be used).

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 drivers/pinctrl/actions/pinctrl-owl.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/actions/pinctrl-owl.h b/drivers/pinctrl/actions/pinctrl-owl.h
index dae2e8363fd5..feee7ad7e27e 100644
--- a/drivers/pinctrl/actions/pinctrl-owl.h
+++ b/drivers/pinctrl/actions/pinctrl-owl.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0+
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * OWL SoC's Pinctrl definitions
  *
-- 
2.17.1

