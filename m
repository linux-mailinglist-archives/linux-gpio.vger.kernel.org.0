Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CD2D31D2C5
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Feb 2021 23:46:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbhBPWqX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Feb 2021 17:46:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230382AbhBPWqW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Feb 2021 17:46:22 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B585C061756
        for <linux-gpio@vger.kernel.org>; Tue, 16 Feb 2021 14:45:42 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id o38so7194805pgm.9
        for <linux-gpio@vger.kernel.org>; Tue, 16 Feb 2021 14:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eP744ksyIQaIeguDzD05uIZyZQDnaagW3/lzjf8E1ng=;
        b=RFMx2ZAkNGufh856SbHjGmvG4eQ8+5I3ju84KdZLiwvlpvHGt8VWqh/oRnmaM23bSw
         UR1guiNCLORuZzt6M+Dz07zD5MQdJ1J9cQfgCfIJQxWe1bL88Y36N5I139djALFZAAQE
         8brkZtSenXD/UuRtrRWSJoLPWjIOeOYFx6F+cUlQDHmIxLikurJaVGvh8tiTwqIIoDEi
         ezDuDTcvwioz2YNCyDgVzD7kl9q6zvYqEvEECveGaPV3sDMt6JHH1j8PA1EKI7jLcf/A
         2D5Dy+xsLqYIIQ1KvYiBe/sAsgmdDuwZMGyQuIyZ84Cs4AOl8AmFerTTW9NtAyKVrmOZ
         usYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eP744ksyIQaIeguDzD05uIZyZQDnaagW3/lzjf8E1ng=;
        b=YWNTM0IQvsXqPXRHW/G6dmCXvJldAzIYxN+zLUaadzdo57GFitFJTkC6IJjgCBP2q7
         fjRTD2sOSrYrIieHAVjk5uMUgNPdJR68CRbZJCjKYa8iePjyvnc5f6aihItaYj6qSBW0
         hPMwKFtxxpXI8K85qqrN+vUdxTTmJQIasRb+H+bKvhd41k4bUu5p/5Vz7I2b75lfAOM7
         qjCR6Relav7Y2pew3x3zZuq40uY6K1LRWRFK4hs8Fy9PcCCGYy+Fne4aVbNtihcI8ysY
         GE1HqtCis46o3quYAefAwJtxJatRB8489GglxWBzxflIKcBTUqUi738sWczMKeMRCkj8
         v4Mw==
X-Gm-Message-State: AOAM5304qs7SMKgto4UxPCcBrFPjeW9ly9IH1Loqznvvwv8FAUvpzgYF
        VuH1syEt2Z3LwSkMFiQiHayWyw==
X-Google-Smtp-Source: ABdhPJygOZL2zIMJOQTRwDsQPEqwintQgZG4g/8iRWPJ0p/OVyPuWu59GXB6zqtjecwhyuFWXGKrUg==
X-Received: by 2002:a63:cd41:: with SMTP id a1mr1877049pgj.177.1613515541378;
        Tue, 16 Feb 2021 14:45:41 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([2601:1c0:4701:ae70:4e06:8d2c:6f9:5b31])
        by smtp.gmail.com with ESMTPSA id 184sm1922465pfc.176.2021.02.16.14.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 14:45:40 -0800 (PST)
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
Subject: [PATCH v6 0/3] pinctrl: pinmux: Add pinmux-select debugfs file
Date:   Tue, 16 Feb 2021 14:44:52 -0800
Message-Id: <20210216224455.1504008-1-drew@beagleboard.org>
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

The final patch in this series documents the debugfs files for pinctrl.

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

