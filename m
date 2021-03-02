Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 687C032ACE1
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:09:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383733AbhCBVRg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:17:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1577072AbhCBFlD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 00:41:03 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35FACC061788
        for <linux-gpio@vger.kernel.org>; Mon,  1 Mar 2021 21:32:08 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id o188so6436525pfg.2
        for <linux-gpio@vger.kernel.org>; Mon, 01 Mar 2021 21:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BsfiHbpQP+TSXIfkDJGb4cbPsfZUec9NMz5sB3wHRO4=;
        b=1VjViXMmSxR0ahyq/suTyrNWx+Azwd49IJk5m31/Iw4xJOOfPtU/Mvm0c3N5JHcaCv
         ZvGC76QttogapkJ0wDYjzm14MP8C+ZX8pxrtzvDb/jke3VSFPhrXACcFcutaQvfprg0o
         9ZGDygkWOhw2PzzbtI2l3emF7ldQqFyrrpdrhRuGwTNPe1DdfnhsyWJ1cbDHvpTcX44/
         YBtIOJV6uW9nbM+exwil+3a17yQiHAViNbhYPNgiXAz8zSSMb63fjSz+umI+xXgVHBrG
         Jv2onVkvmTeRB75Gvm5JVY6TyA038DZSuZaVfc2guU4rHn3FzBsei+qC+VDQ34A9zMSb
         mv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BsfiHbpQP+TSXIfkDJGb4cbPsfZUec9NMz5sB3wHRO4=;
        b=Ai3gVnV/Nu51YrzMmY6pUC4SYoM3Ahnro4AKXgKRpum3w+rRPYy/d6tG+sNAX4+kiE
         jn/6CSZDL82p1ATKFS/5sTBcC6d9YLjAw8PS+VAcdwCcT+TlvN+WLIH+VeX3mPgo7QjV
         Hp9ZuNvrwzmYRfm5Sjeafxvl7OuTeUFWJ+XtMgmPxnbzdlkDLeHQvN3KSPgtQv3WxibV
         5ft6h2attnebmy1GjSGDHImOTKLx7D+6bCY/xT8pVRY4eRsseOLLOUqaoIwK9o316DV5
         u7NE8trpWYaS0tESPjq3QoxyM+jGokuNaqvLOOT0dM+HVrxKUDN7EvilCpNAaSRcGS1s
         snYQ==
X-Gm-Message-State: AOAM530G0dG59NMhTuXcy+gL9Xu0gPla/Drvj57BS5TBIIs4VB1WQlj7
        I94aKXg5z1QixT+OMSy4LzVKDQ==
X-Google-Smtp-Source: ABdhPJwG58aaHnVBSNSE72hdsvrq00R2y2UXE+UEukB2S6ZAllQmupPpwNYfd8TyquRh1WxBen3l9A==
X-Received: by 2002:aa7:8b48:0:b029:1ec:a315:bdbd with SMTP id i8-20020aa78b480000b02901eca315bdbdmr1880500pfd.51.1614663127524;
        Mon, 01 Mar 2021 21:32:07 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([2601:1c0:4701:ae70:37ab:7b44:a136:e385])
        by smtp.gmail.com with ESMTPSA id o129sm17929757pgo.27.2021.03.01.21.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 21:32:06 -0800 (PST)
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
        Dan Carpenter <dan.carpenter@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH v9 0/4] pinctrl: pinmux: Add pinmux-select debugfs file
Date:   Mon,  1 Mar 2021 21:30:55 -0800
Message-Id: <20210302053059.1049035-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series first converts the debugfs files in the pinctrl subsystem to
octal permissions and then adds a new debugfs file "pinmux-select".

Group name and function name can be written to "pinmux-select" which
will cause the pin function for the specified group to be activated on
the pin controller.

This series also renames documentation from pinctl to pin-control and
adds documentation for the pinctrl debugfs files.

Notes for PATCH v9:
- rename pinctl.rst documentation to pin-control.rst per discussion
  with Linus W.

Notes for PATCH v8:
- add 'Reviewed-by:' from Geert Uytterhoeven for pinmux-select patch
- add 'Tested-by:' from Geert Uytterhoeven for pinmux-select patch
- change pinmux-select format to '<group-name function-name>' based on
  feedback from Geert
- rephrase parts of documentation per Geert's comments

Notes for PATCH v7:
- add 'Reviewed-by:' from Andy Shevchenko for pinmux-select patch
- add 'Reviewed-by:' from Andy Shevchenko for documentation patch
- add 'Reviewed-by:' from Tony Lindgren to all patches
- change order of '#include <linux/ctype.h>' per Andy's suggestion
- change PINMUX_SELECT_MAX back to 128 as I had accidentally changed it
  to 50 and Andy pointed this out.
- grammer fixes as suggested by Andy
- rework assignment of fsel and ret from pinmux_func_name_to_selector()
- rework assignment of gsel and ret from pinctrl_get_group_selector()

Notes for PATCH v6:
- add 'Suggested-by:' for Joe Perches to octal permissions patch
- add 'Reviewed-by:' from Andy and Geert to octal permissions patch
- reword example in the pinmux-select patch per Andy's advice
- indent the example output per Andy's advice
- remove usage error messages as Andy advised it is too verbose
- return -ENOMEM when write is too big for the input buffer per Andy's advice
- handle whitespace before, in between, and after the function name and
  group name as suggested by Andy
- rename free_buf to exit_free_buf per Andy's advice
- add documentation patch to series which documents the debugfs files
  for the pinctrl subsystem including the new pinmux-select file

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

Drew Fustini (4):
  pinctrl: use to octal permissions for debugfs files
  pinctrl: pinmux: Add pinmux-select debugfs file
  Documentation: rename pinctl to pin-control
  docs/pinctrl: document debugfs files

 Documentation/driver-api/gpio/legacy.rst      |   2 +-
 Documentation/driver-api/index.rst            |   2 +-
 .../{pinctl.rst => pin-control.rst}           |  37 ++++++
 MAINTAINERS                                   |   2 +-
 drivers/pinctrl/core.c                        |  12 +-
 drivers/pinctrl/pinconf.c                     |   4 +-
 drivers/pinctrl/pinmux.c                      | 106 +++++++++++++++++-
 7 files changed, 152 insertions(+), 13 deletions(-)
 rename Documentation/driver-api/{pinctl.rst => pin-control.rst} (97%)

-- 
2.25.1

