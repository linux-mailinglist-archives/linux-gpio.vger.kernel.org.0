Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1049317267
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Feb 2021 22:35:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232169AbhBJVfO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Feb 2021 16:35:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231193AbhBJVfN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2021 16:35:13 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D43E8C061574
        for <linux-gpio@vger.kernel.org>; Wed, 10 Feb 2021 13:34:33 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id t2so1947374pjq.2
        for <linux-gpio@vger.kernel.org>; Wed, 10 Feb 2021 13:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qvqSlhch54qKd6Z/euk8bPQFbQJTiG8Sl5LeBocD2oY=;
        b=ewq2ZJYkhG+l2oxZATjN/3r6VnQhfS6os6buQNGLgJILEcHKR57DuF1R8nNJeTnh1s
         Jw3EgkrinW9DWJUpOBAwiffdCrjbWfXsfJdH3gENyl1ZzpEFTYx7gkEXi8Xk7l4ywNxb
         f9bduu2eqMOXwg4OH3HU0KbQVbKH4+pIXwCc2sxtYqlSwOIaDHrxBC5y2tsYLEyabNB4
         Xoz5XBCTb7DdKY6zRVEt1+jfxWjeOoKjb2uBbMLnhGZ8KPN70nKRlweduw2sXGXrhDaf
         aFyx7LErt0+Nz5RHgGCJ9+T60bGT//irI4MGgwrsVa6UbhMpHtgtcq4fQ/BkS3iLbpDY
         LJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qvqSlhch54qKd6Z/euk8bPQFbQJTiG8Sl5LeBocD2oY=;
        b=Re+LNrNvEwewaPIPV3LBTNDPfxUF6rRSE/NgRrUr5w5CFzgLuj27M6gartmHx3RJQR
         o1+jqlK2oOgemKtgQuYdU8GrhshV72/UpxvlCDSGAGnbyVVjiyxfbBcQtTzwZJgdk6+R
         +ZqkVylL6i6n/2v1wKnnVSPIOA3V2YOzGRaWwxn4VshPRP8vAYu+yV+dTiOSUnEkvs6R
         UPU7j1u+qf4nx+TN8ROAP9D2MLvRmM6ZEsU40JwHZv9FjHkjiUEKsR0xg7F+zodFCvXS
         Pr+J7QtyIcdvbFKyMQ7l3ZGN6V+gUHJofZSOZLjQOY4BDMAGVlN+8chvOa1d9gd81Zka
         340A==
X-Gm-Message-State: AOAM530NT62s5S98uSW9KTQyReWBy/Uri847jMRJWf73QqoEgn/1j2kY
        gV6prj7rWgaPBbfekx7jafrT7g==
X-Google-Smtp-Source: ABdhPJwfbZ/ZBw3M8AIvp+XeqMaYCaZc5iTCRPzVsQy2DgzR+QpEF/tL7YWm5YnakQeGNp4/E4wtDA==
X-Received: by 2002:a17:90a:f497:: with SMTP id bx23mr875535pjb.170.1612992873373;
        Wed, 10 Feb 2021 13:34:33 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([2601:1c0:4701:ae70:7b19:df69:92d6:528e])
        by smtp.gmail.com with ESMTPSA id h8sm3006928pfv.154.2021.02.10.13.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 13:34:32 -0800 (PST)
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
Subject: [PATCH v3 0/2] pinctrl: pinmux: Add pinmux-select debugfs file
Date:   Wed, 10 Feb 2021 13:34:18 -0800
Message-Id: <20210210213419.227285-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series first converts the debugfs files in the pinctrl subsystem to
octal permissions and then adds a new debug file "pinmux-select".  Add
function name and group name can be written to "pinmux-select" which
will cause the function and group to be activated on the pin controller.

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
  subsystem over to octal permission [1]
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

 drivers/pinctrl/core.c    |   6 +--
 drivers/pinctrl/pinconf.c |   4 +-
 drivers/pinctrl/pinmux.c  | 111 +++++++++++++++++++++++++++++++++++++-
 3 files changed, 114 insertions(+), 7 deletions(-)

-- 
2.25.1

