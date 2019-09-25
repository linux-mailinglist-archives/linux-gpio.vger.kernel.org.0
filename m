Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4C24BDB9E
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2019 12:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732561AbfIYKBM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Sep 2019 06:01:12 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:36849 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732929AbfIYKBL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Sep 2019 06:01:11 -0400
Received: by mail-pl1-f194.google.com with SMTP id f19so2201173plr.3
        for <linux-gpio@vger.kernel.org>; Wed, 25 Sep 2019 03:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=uzZ8DPf6NIW9EBVqRR0XbHjRTYj7wBRwWhdqQxzfdOc=;
        b=pX0x+D6ebrVJDrq5zD4RO2FtBs2ewMN6Zi/1V5mPNy4/LeQD/H8OU62wxE15vOw03M
         b1YduOzP5xSt5nCc15YWYBN54koL6AD/dhoDXbsi3wl4KeUwMInH/Vw9KM6lwLVNpeIF
         f0pazUbc4kvNC0TrMPANcX1bLJhHUa+Kl5wNrD3uSuQu+hg/Dc260ZIBq9Lf0xPwNUyi
         8AXPHo7/PSDtRLPf8erC0ORT5eDosl7dw0e66r5mBmCRM/QsNGjrgQHQHJ9fSLt+Mqfj
         yvmyvSF4G4Gnv8SIMRoCZbzz3mcfYmgWut6yahdqK9jrB3ZMCwf1tlUkO+01MmyHHbZN
         bOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=uzZ8DPf6NIW9EBVqRR0XbHjRTYj7wBRwWhdqQxzfdOc=;
        b=RaDTiZPYM8ApvXWlFFB41kYnWE54se8yC9DHtXKJkZth6h5wrwWoOMULNiqSuXjVWJ
         Y5MJ+UvuqC9uDAoEJN4onIMcko7gtnsoh8r8DH2gWG8pkmZw+XNmLLlkCJ9i0DJeviwm
         VyQuPiDZPn9Xr9iBYuQ9As04WldW2XHMpkK25MUYWq0z0arJw907ydyaPGI6QdKPAUns
         bf2TLGshtBK8br+zwBX37iXZyejZGFPEhF0ZeXIhOpkhKrnTLadTQBIoHS6SGN23s+Ad
         KSWCxmxf3e1+SKNgoI3FpZcksBDwIvSibcTTsITHi2rk1HP0HQK2g2Rn43+eIq217SK1
         /M8Q==
X-Gm-Message-State: APjAAAU5pPCoIQsRVHHM2kKUIAdubbqeTz2o3Q+bPYYyCKXfZWh6X4A4
        n+Zasznh+LxI3X0DGrD4qVhvEQ==
X-Google-Smtp-Source: APXvYqyZiVNZNLInx8rqubvBh27cWe1x6GJopIyzVDed+DSk7m3a79qaCZlOpAkdTjZ+xXYikJ/O2w==
X-Received: by 2002:a17:902:d201:: with SMTP id t1mr7842966ply.337.1569405669418;
        Wed, 25 Sep 2019 03:01:09 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id x10sm6348741pfr.44.2019.09.25.03.01.04
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 25 Sep 2019 03:01:08 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     stable@vger.kernel.org, peterz@infradead.org, mingo@redhat.com,
        linus.walleij@linaro.org, natechancellor@gmail.com, sre@kernel.org
Cc:     longman@redhat.com, linux-gpio@vger.kernel.org,
        david@lechnology.com, linux-pm@vger.kernel.org, arnd@arndb.de,
        baolin.wang@linaro.org, orsonzhai@gmail.com,
        vincent.guittot@linaro.org, linux-kernel@vger.kernel.org
Subject: [BACKPORT 4.14.y v3 0/3] Candidates from Spreadtrum 4.14 product kernel
Date:   Wed, 25 Sep 2019 18:00:49 +0800
Message-Id: <cover.1569405445.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

With Arnd's script [1] help, I found some bugfixes in Spreadtrum 4.14 product
kernel, but missing in v4.14.146:

513e1073d52e locking/lockdep: Add debug_locks check in __lock_downgrade()
957063c92473 pinctrl: sprd: Use define directive for sprd_pinconf_params values
87a2b65fc855 power: supply: sysfs: ratelimit property read error message

[1] https://lore.kernel.org/lkml/20190322154425.3852517-19-arnd@arndb.de/T/

Changes from v2:
 - Drop 2 unnecessary patches (patch 1 and patch 6) from v2 patch set.
 - Backport these patches to 4.19.y.

Changes from v1:
 - Drop 2 unnecessary patches (patch 1 and patch 4) from v1 patch set.
 - Add upstream commit id in change log for each stable patch.

David Lechner (1):
  power: supply: sysfs: ratelimit property read error message

Nathan Chancellor (1):
  pinctrl: sprd: Use define directive for sprd_pinconf_params values

Waiman Long (1):
  locking/lockdep: Add debug_locks check in __lock_downgrade()

 drivers/pinctrl/sprd/pinctrl-sprd.c       |    6 ++----
 drivers/power/supply/power_supply_sysfs.c |    3 ++-
 kernel/locking/lockdep.c                  |    3 +++
 3 files changed, 7 insertions(+), 5 deletions(-)

-- 
1.7.9.5

