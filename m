Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC8E232070E
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Feb 2021 21:28:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbhBTU2k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Feb 2021 15:28:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbhBTU2k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Feb 2021 15:28:40 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D86EAC061786
        for <linux-gpio@vger.kernel.org>; Sat, 20 Feb 2021 12:27:59 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id l18so6280617pji.3
        for <linux-gpio@vger.kernel.org>; Sat, 20 Feb 2021 12:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lh1fqu5jQvUJWqN2vGIZC04+SCim6mRTkhKCU1/DMZk=;
        b=GSWfTWMxq6Abe7PcxhzK1GpfgjvrDWkvJPfM7DF2f9TcBqQJi51BenJooWmaDFeLaW
         PpG9i7kNCHyRMs/IEy1/V2eBv3t+DB3q3+LZCk6bjh/q8sdaZqf/pbK8sPcxEGdcqaal
         XPtRCI14JqPZCuVli9hNTCTRIF43WY3vfv9QHYSjIbTwQEwRqJ/3swpZV8lKnEDh4oTA
         p7o072F+wmDG1TasG7ZpPyZIMG+JTtWU5avoMYNTrJXYUD5WS8A4miDO322ku3R8NL2b
         aLLCWHd1CcEWIJFhoQZ6QeGQ3nCLdIjnrSKiZwo0f6CaygOvdcMobzDjAGfpZGMuZTbL
         Iq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lh1fqu5jQvUJWqN2vGIZC04+SCim6mRTkhKCU1/DMZk=;
        b=XE/H8rIXVP7lDQbL/0Ev7p2P+Ps4esKsgXMS8oKcoOiVCAb3PFIJ70g8z3TBypofYf
         Uu3PJaxbKZf2uCCrsbj1JtUtL2JbBSur+50nmRd/97z93/V3APJr+RtSF3ELUJ8lJTRO
         0aBXYl22yZYw/6UhRIQSzeWjK/kym/DLE8uQie43VNjMtBsGndLrle5V6a8UQAC32S99
         Zbn10sSYLJBcnuorVvn+tnKbFG7LpkPXPtwQ6dPH8MeH7N1XioAsFqTwHYuL62c3Mwxh
         iZeUzTw5gPMQhUIwcXaLp/qmWiGqxvqC6Lx2tZfftjSmSXlIdPwvfDVQXlCc4ZtNK35u
         jISw==
X-Gm-Message-State: AOAM531nXfDeXFEdVmq/5J2PwGaZtoq6l082P5WEyVZs6MjrAT/aDP1v
        P9TFb1CmV+LmSte127ksrhVEp131rOMKfRey
X-Google-Smtp-Source: ABdhPJwl395g58YLdoeoyqrGzA8R1aAp12GC1uiM8E+6Vm78XEAF6uhSj9Uo6tWHJl6txsfcD6pSlg==
X-Received: by 2002:a17:90a:e64f:: with SMTP id ep15mr13790522pjb.151.1613852879210;
        Sat, 20 Feb 2021 12:27:59 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([2601:1c0:4701:ae70:3902:ca9d:7b75:1d0c])
        by smtp.gmail.com with ESMTPSA id 125sm13497871pfu.7.2021.02.20.12.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Feb 2021 12:27:58 -0800 (PST)
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
Subject: [PATCH v8 0/3] pinctrl: pinmux: Add pinmux-select debugfs file
Date:   Sat, 20 Feb 2021 12:27:47 -0800
Message-Id: <20210220202750.117421-1-drew@beagleboard.org>
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

The final patch in this series documents the debugfs files for pinctrl.

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

Drew Fustini (3):
  pinctrl: use to octal permissions for debugfs files
  pinctrl: pinmux: Add pinmux-select debugfs file
  docs/pinctrl: document debugfs files

 Documentation/driver-api/pinctl.rst |  37 ++++++++++
 drivers/pinctrl/core.c              |  12 ++--
 drivers/pinctrl/pinconf.c           |   4 +-
 drivers/pinctrl/pinmux.c            | 106 +++++++++++++++++++++++++++-
 4 files changed, 149 insertions(+), 10 deletions(-)

-- 
2.25.1

