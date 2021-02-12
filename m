Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 662BD31A7B7
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 23:33:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbhBLWda (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Feb 2021 17:33:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232152AbhBLWbE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Feb 2021 17:31:04 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8BB4C061574
        for <linux-gpio@vger.kernel.org>; Fri, 12 Feb 2021 14:30:22 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id r2so564922plr.10
        for <linux-gpio@vger.kernel.org>; Fri, 12 Feb 2021 14:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hqun1mCL3Uj8nnBET9CEvjX/lw7OX880oHLfK8YQm3E=;
        b=z0oIZhb0JzsRbNMFDHzZw+XcEQqd4fPjxTMRM+ynICX6gDjBSqzsyQh1LUZoKeDnbS
         6eloasQgzsH+eywOjGtQVSxctD06RZHYp3SdFL4nOjW0Vqqaa/zUn6+OBbF7Cu19pJye
         7fRP+aRaGXyHFuXJJEMpMVU+mCjnwvjDWAxDZhsXuutlnQ1RmcK6kJzp/zjl3HO/Lx0C
         b03BguXUgKLYnHQBISL4TALAx9aJIemWV+enQHXT4JQPlYNq3RMWKll+65KMJv7foUVG
         d5I4+TE9bu7zq89Le28gkJBOaH/UelqGgt5PhL1/evbkmBMbd5lrKuaEAvtwRDAO7V+D
         o8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hqun1mCL3Uj8nnBET9CEvjX/lw7OX880oHLfK8YQm3E=;
        b=m2tys2hjdr9LmWkMWzAd5VTZivWSHXB9S+iR3+zNFFjZin0N05J2yYn5QMy/T8z+XU
         wvhKLpmT0L0TKIi/bJD2fGw/3JJMpmZQP0jN+oxoO0FC7a4aDwDzsX/aQvLM5jc72v0y
         XnRGh6h5TULeIgmVkC+ZC85rsG+Wa7BsWeW4ly2ndJF3ladVZW8xji1nBW1upfUHWUIz
         Ty4phltLTARASjesON50qYN+P1+0YSYYUlixesKAt/akJZS5wP+aNAhzdRdKFLd3zn19
         7TJLgfdw1BkbyNaya8FtkPeHBYP12x9gA8y2dbORNA2f0XQTa0SWU3t/d4SH/ijEto9/
         4bXA==
X-Gm-Message-State: AOAM531MnFMBhGsjttIRC2LUXDeILSdPUxJZd7sUfclZziE5NJwibCuE
        QxT0ECCUBmCnvcZyFWtmo077Ew==
X-Google-Smtp-Source: ABdhPJzCt9f6OATe4sn2T1ptWunulz+QS3wgNEWUiWa4ib24beXi361QiuU6ByAWi3GMntf0xwRfcA==
X-Received: by 2002:a17:902:b598:b029:e2:daa2:161c with SMTP id a24-20020a170902b598b02900e2daa2161cmr4616900pls.20.1613169020863;
        Fri, 12 Feb 2021 14:30:20 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([2601:1c0:4701:ae70:55c2:10c0:c1dd:8558])
        by smtp.gmail.com with ESMTPSA id j26sm9530351pfa.35.2021.02.12.14.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 14:30:20 -0800 (PST)
From:   Drew Fustini <drew@beagleboard.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Joe Perches <joe@perches.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH v5 0/2] pinctrl: pinmux: Add pinmux-select debugfs file
Date:   Fri, 12 Feb 2021 14:30:13 -0800
Message-Id: <20210212223015.727608-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series first converts the debugfs files in the pinctrl subsystem to
octal permissions and then adds a new debugfs file "pinmux-select".

Function name and group name can be written to "pinmux-select" which
will cause the function and group to be activated on the pin controller.

Notes for PATCH v5:
- convert permissions from symbolic to octal for debugfs_create_file()
  calls in core.c that Joe Perches pointed out I had missed
- Linus W: please let me know if I should break this series apart as you
  already applied an earlier version of octal conversion patch today [1]
- switch from sscanf() to just pointing to function name and group name
  inside of the buffer. This also avoids having to allocate additional
  buffers for fname and gname. Geert and Andy highlighted this security
  issue and Andy suggested code to use instead of sscanf().
- switch from devm_kfree() to kfree() after Dan Carpenter warned me
- remove .read from pinmux_select_ops per Geert since it is write only
- add usage format to error when unable find fname or gname in buffer

Notes for PATCH v4:
- correct the commit message in the second patch to reference function
  and group name instead of integer selectors. Apologies for not fixing
  that in v3
- fix typos in cover letter

Notes for PATCH v3:
- add Suggested-by: Andy Shevchenko to the "pinctrl: use to octal
  permissions for debugfs files" patch
- change the octal permissions from 0400 to 0444 to correctly match the
  symbolic permissions (thanks to Joe Perches and Geert Uytterhoeven)
- note that S_IFREG flag is added to the mode in __debugfs_create_file()
  (thanks to Andy for highlighting this and Joe for suggesting I should
  add a note to the commit message)
- fix order of the goto labels so that the buffers are freed correctly
  as suggested by Dan Carpenter
- move from devm_kzalloc() to kzalloc() as the buffers are only used
  inside the pinmux_select() function and not related to the lifetime
  of the pin controller device (thanks to Andy for pointing this out)
- correct the pinmux-select example in commit message to use the
  function and group name instead of selector (thanks to Geert)

Notes for PATCH v2:
- create patch series that includes patch to switch all the debugfs
  files in pinctrl subsystem over to octal permission
- write function name and group name, instead of error-prone selector
  numbers, to the 'pinmux-select' file
- switch from static to dynamic allocation for the kernel buffer filled
  by strncpy_from_user()
- look up function selector from function name using
  pinmux_func_name_to_selector()
- validate group name with get_function_groups() and match_string()
- look up selector for group name with pinctrl_get_group_selector()

Notes for PATCH v1:
- posted seperate patch to switch all the debugfs files in pinctrl
  subsystem over to octal permission
- there is no existing documentation for any of the debugfs enteries for
  pinctrl, so it seemed to have a bigger scope than just this patch. I
  also noticed that rst documentation is confusingly named "pinctl" (no
  'r') and started thread about that [2]. Linus suggested chaning that
  to 'pin-control'. Thus I am planning a seperate documentation patch
  series where the file is renamed, references changed and a section on
  the pinctrl debugfs files is added.

Notes for RFC v2 [3]:
- rename debugfs file "pinmux-set" to "pinmux-select"
- renmae pinmux_set_write() to pinmux_select()
- switch from memdup_user_nul() to strncpy_from_user()
- switch from pr_warn() to dev_err()

[1] https://lore.kernel.org/linux-gpio/20210126044742.87602-1-drew@beagleboard.org/
[2] https://lore.kernel.org/linux-gpio/20210126050817.GA187797@x1/
[3] https://lore.kernel.org/linux-gpio/20210123064909.466225-1-drew@beagleboard.org/

Drew Fustini (2):
  pinctrl: use to octal permissions for debugfs files
  pinctrl: pinmux: Add pinmux-select debugfs file

 drivers/pinctrl/core.c    |  12 ++---
 drivers/pinctrl/pinconf.c |   4 +-
 drivers/pinctrl/pinmux.c  | 103 +++++++++++++++++++++++++++++++++++++-
 3 files changed, 109 insertions(+), 10 deletions(-)

-- 
2.25.1

