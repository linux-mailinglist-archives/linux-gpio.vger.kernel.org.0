Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5050B10B38D
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 17:39:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbfK0QjD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 11:39:03 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36950 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfK0QjC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 11:39:02 -0500
Received: by mail-pg1-f193.google.com with SMTP id b10so11146973pgd.4;
        Wed, 27 Nov 2019 08:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=a5uCI8sDk06L3eBN4lbKYbKhhJe2khqKsQK/HeBIflE=;
        b=q6/t6QHFrX/IIKybww/twC4NWcDBGujHbbW6ZuVds6JG9ulrqK5lGwr1HEBFZ4qBMz
         KqP6zyPrBs3/04rc8fYDrdNoQdEevLJOUBc8uPUWa+zRDeHtu8gR8xl/QIibsnwYu0yL
         UoN8lGq5hVtEUcpRqBZH8G0VcwLCbbVIwQNS/gH4HJ2CfGuoozN/DCE7dcd32FEsYFb4
         0EzrAg0jCspjpo+faC6Swl+nwb9tiK0BlLK9a+ro9ULbguCqhX1B5Hgz+HaxnPV0DafW
         ov01MNMyPRgxNBLbfpIaQoX5yHLNMiAgPGNW2CvWdKalrlQc+yPBiubqa6nDWJtJDMfy
         RKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=a5uCI8sDk06L3eBN4lbKYbKhhJe2khqKsQK/HeBIflE=;
        b=NzTwzobKSCPDYRsCZwFx6QolHW3Bqx5g71vD41DfkdBTBDebo7/3P7y8J8BB0ERK/T
         /wn3LcRC6tEQpJcV+ABazn4r8FYPT4K4uvbNp7lHedFfIhLc7EHR7WGXXTB3VfXyp5LK
         mApelIjIQiFdIXZbXtVRkl1n5hCZ1Wbhqi+rt5GBzdz4Tahkm6HcUix33TNLCmKPG1CY
         A+Eqq6aDYLEW8RUQcfKHz5OAdFKJw71vTAAZlvOOoLfOgZEM/hTagMDTqx+Cmdc2DzBK
         m2fh7QvjzUtczyLAG+1pVsqHNkr9IFIXFY/aCXAI+gy1lX7Img3w+LkxYnpWiss8zM+p
         eXKg==
X-Gm-Message-State: APjAAAUnJo9fEV9fc+ysmef8Vcy+h4Iw3dJO2UByd6lkKnUNQmZnHvYL
        DPTVK2ALq7PfnR/TzGfAxsY=
X-Google-Smtp-Source: APXvYqyhFzYRUOGgpal+39IdvGP69h56LXE8h32YtVVh0FuJl/Vspv8GKTCoDBf/zWCNFBX2XPiQ7g==
X-Received: by 2002:a62:aa0a:: with SMTP id e10mr47148355pff.46.1574872741931;
        Wed, 27 Nov 2019 08:39:01 -0800 (PST)
Received: from nishad ([106.51.232.103])
        by smtp.gmail.com with ESMTPSA id c17sm17084710pfo.42.2019.11.27.08.38.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2019 08:39:01 -0800 (PST)
Date:   Wed, 27 Nov 2019 22:08:50 +0530
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
Subject: [PATCH 0/5] pinctrl: Use the correct style for SPDX License
 Identifier
Message-ID: <cover.1574871463.git.nishadkamdar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch corrects the SPDX License Identifier style
in the pinctrl driver related files.

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46
and some manual changes.

Nishad Kamdar (5):
  pinctrl: actions: Use the correct style for SPDX License Identifier
  pinctrl: mediatek: Use the correct style for SPDX License Identifier
  pinctrl: meson-axg: Use the correct style for SPDX License Identifier
  pinctrl: sh-pfc: Use the correct style for SPDX License Identifier
  pinctrl: stm32: Use the correct style for SPDX License Identifier

 drivers/pinctrl/actions/pinctrl-owl.h         | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt2712.h | 2 +-
 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h | 2 +-
 drivers/pinctrl/sh-pfc/core.h                 | 4 ++--
 drivers/pinctrl/sh-pfc/sh_pfc.h               | 4 ++--
 drivers/pinctrl/stm32/pinctrl-stm32.h         | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.17.1

