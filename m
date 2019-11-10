Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5F5FF61E9
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Nov 2019 01:26:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbfKJA0k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 Nov 2019 19:26:40 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41784 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbfKJA0k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 9 Nov 2019 19:26:40 -0500
Received: by mail-lj1-f196.google.com with SMTP id m9so9991290ljh.8
        for <linux-gpio@vger.kernel.org>; Sat, 09 Nov 2019 16:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=kNdZCj9DxVSyJ54jFBc2LZR95Z/ZrF07viZLOlvp5Oo=;
        b=B2L4v7kV4XR3aAFp2SwaJgfqWPhwTPGC+uzshrMX/vej+uxLd8WPOm5+A5M3P4GM+x
         WzkjBm1nLbaPI5JMlolB/vz76ZUR/XswHCNN323qePpp4sAYrWbD5RzQVeaq2CtEqVBx
         NiILr228Ny1GzAWhf8zSoOT9EDr305jVgTZCBYlOD2GuGhoWiX1eALyP10A9/cFBP8Dk
         WMQ6L0DWG6IcILnaaqqddLB7h3eZAsxJFiyiJ5X33v8+eaT1XjuXApUwE6dosJgqaQsS
         7ZZfwsf0zjglOK/gX4v0LKXE4gSeaG29HHxYuXyo7x/8BC211LMUY9dWp6DicutHhBvO
         VsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=kNdZCj9DxVSyJ54jFBc2LZR95Z/ZrF07viZLOlvp5Oo=;
        b=EkyTf8sTalSPxRVr1QP41pxhIaEDZz8yfn4jTMcj0ecPZdy/RT0QWCJ2rrOp1FhJdx
         mYvsuUW5j3ar7ufbhJsxERlLElZs8cYnmDdSbAaruzyXtSwseZBVC2XooOJHeiOtJhNj
         9+JgO5IexMDmdIz8FuWI5CNFvrWwd7YdmotVfGP2q5xfPvRVI6rFD+e+PEeZWALsjWPm
         BqteAvjVyc2XuGvCZZ4rtrActYB6O4rR8TIuMrzJyBEpjr8H1E3uAsNRtJ2L9YZQXwSa
         M2papDIl/sTjs0uSoSdzmVmAaU2g0qfM4l84CQA/A2iESWbXzJXNOdrE8LbWuv58AAY/
         4UOA==
X-Gm-Message-State: APjAAAUguXhbCcJutggvTAPJdgEWgjbmZwCNsMocjf0e1c/Z9mhWu2LI
        fVW+NkVF58ieFCb/iUgRKvhNRcKQJKs58iWOtAeu3w==
X-Google-Smtp-Source: APXvYqwwaWtPuF8fF5ikvLI1b9nFQd7zXD5T43bCvBvGUWGON/qsxJ1TDidLoXKq3/SN2x1D7qqx1ozVfJ5eB9hKBcI=
X-Received: by 2002:a2e:9a12:: with SMTP id o18mr11484420lji.191.1573345598170;
 Sat, 09 Nov 2019 16:26:38 -0800 (PST)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 10 Nov 2019 01:26:26 +0100
Message-ID: <CACRpkdaomX3PGdf9LPvi+S2yzTCs0f-G+TJkdfo=5HcoOJjehg@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v5.4
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Amelie Delaunay <amelie.delaunay@st.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

some late pin control fixes, mostly Intel stuff.

Details in the signed tag and the commits!

Please pull it in!

Yours,
Linus Walleij

The following changes since commit d6d5df1db6e9d7f8f76d2911707f7d5877251b02:

  Linux 5.4-rc5 (2019-10-27 13:19:19 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.4-3

for you to fetch changes up to 63e006c107ff4235d2a8fd52704f283d23642537:

  pinctrl: stmfx: fix valid_mask init sequence (2019-11-07 10:06:46 +0100)

----------------------------------------------------------------
Pin control fixes for v5.4:

- Fix glitch risks in the Intel GPIO

- Fix the Intel Cherryview valid irq mask calculation.

- Allocate the Intel Cherryview irqchip dynamically.

- Fix the valid mask init sequency on the ST STMFX driver.

----------------------------------------------------------------
Amelie Delaunay (1):
      pinctrl: stmfx: fix valid_mask init sequence

Andy Shevchenko (2):
      pinctrl: intel: Avoid potential glitches if pin is in GPIO mode
      pinctrl: cherryview: Allocate IRQ chip dynamic

Hans de Goede (1):
      pinctrl: cherryview: Fix irq_valid_mask calculation

Linus Walleij (1):
      Merge tag 'intel-pinctrl-fixes-v5.4-2' of
git://git.kernel.org/.../pinctrl/intel into fixes

 drivers/pinctrl/intel/pinctrl-cherryview.c | 26 +++++++++++++-------------
 drivers/pinctrl/intel/pinctrl-intel.c      | 21 ++++++++++++++++++++-
 drivers/pinctrl/pinctrl-stmfx.c            | 14 --------------
 3 files changed, 33 insertions(+), 28 deletions(-)
