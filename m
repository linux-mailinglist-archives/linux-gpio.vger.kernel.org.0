Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 938E635B499
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Apr 2021 15:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235439AbhDKNbG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Apr 2021 09:31:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbhDKNbF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Apr 2021 09:31:05 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F9E7C061574;
        Sun, 11 Apr 2021 06:30:49 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id s5so1921147qkj.5;
        Sun, 11 Apr 2021 06:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k6XFIB4STIeXtLPIKFPXYzrdbDO2OgsIOJuX+w5wyAE=;
        b=anclmgSV2jcPO2Cp8fkQyLx8f/b9dXBZOwQUN6QQDkiuf7TZ3WfD14EjAu9eEufzQn
         TEfZ6hI4P9PAOdyHMPqc1O7s+YQNgxzoUwbQGljDia+c6aH/pZbJC+gXIsHai4MV87L7
         OMF68r6oVcatfshSamARlMrRKTkUjtjSOmr/SLCvErXyDAlxiGff/j7HIar2d7CbiNrQ
         D/Fr3dlOf5uZrLJrryYx0sz3YYZ9OH3sqOdRHifhHCAVV/Kpz90aQ+qa5xFgPEZMhrG3
         Qzo2TClh5cUaYurrV3ga1c+XvXVQL+7krMTjb8W2GmOiqEFA3q2GJWX8FXx3mrhvJniD
         fjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k6XFIB4STIeXtLPIKFPXYzrdbDO2OgsIOJuX+w5wyAE=;
        b=F3WnJS8nY8+xrh01ZAQyuZh3CA/Z8XjXegw0SYt+T9wXx9pCP9590xoT6Y05q1wwfK
         nZOi/N6zNqwkbgFJfd3xQdt06DUsLteFcoLTS5qOZqKp4hXlPzKlezQvFWMoRAAyS7ms
         /15u9OCC5GQ3DvOUIGgXX4RI6ZdfHwfzps4OKDrRWD0OUCKgwwtj/TYBsACsj8dDsZlU
         8V92q5EQWAEn1W5/Y+UxKvGcoSGw1iRtUDmW6wSzyuV0c7t7v0HP0O559XiCbDxn5hrE
         +u2+1BsqBsAeB5P6vXWfz2Rf6TOeHeG5YAGajHwwZGxL+IpmpH9L6i176XqDeERux5Nj
         yGzQ==
X-Gm-Message-State: AOAM531mv5AxfaimEy0tZWkPcrGS9Wq3hQfVVApAP60EZCf/bYMzGfw5
        fIOjSW6pugWWHY/8uu3B5IU=
X-Google-Smtp-Source: ABdhPJy3fY5dm0l3x6k/JHAJaSkE66BIYn9D77v7Rq8BBYDfYP1HDeaOC5czXnZx+JZEi9RThCnGBA==
X-Received: by 2002:a37:a442:: with SMTP id n63mr10290277qke.124.1618147848135;
        Sun, 11 Apr 2021 06:30:48 -0700 (PDT)
Received: from master-laptop.sparksnet (c-98-233-193-225.hsd1.md.comcast.net. [98.233.193.225])
        by smtp.gmail.com with ESMTPSA id l17sm5734204qtk.60.2021.04.11.06.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 06:30:47 -0700 (PDT)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Jianqun Xu <jay.xu@rock-chips.com>, huangtao@rock-chips.com,
        kever.yang@rock-chips.com, linus.walleij@linaro.org,
        heiko@sntech.de
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>
Subject: [PATCH v2 0/7] gpio-rockchip driver
Date:   Sun, 11 Apr 2021 09:30:23 -0400
Message-Id: <20210411133030.1663936-1-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Separate gpio driver from pinctrl driver, and support v2 controller.

Tested on rk3566-quartz64 prototype board.

Patch History:
V2 - Rebase to latest linux-next.

Tested-by: Peter Geis <pgwipeout@gmail.com>

Jianqun Xu (7):
  pinctrl/rockchip: separate struct rockchip_pin_bank to a head file
  pinctrl/pinctrl-rockchip.h: add pinctrl device to gpio bank struct
  gpio: separate gpio driver from pinctrl-rockchip driver
  gpio/rockchip: use struct rockchip_gpio_regs for gpio controller
  gpio/rockchip: support next version gpio controller
  gpio/rockchip: always enable clock for gpio controller
  gpio/rockchip: drop irq_gc_lock/irq_gc_unlock for irq set type

 drivers/gpio/Kconfig               |   8 +
 drivers/gpio/Makefile              |   1 +
 drivers/gpio/gpio-rockchip.c       | 758 ++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-rockchip.c | 911 +----------------------------
 drivers/pinctrl/pinctrl-rockchip.h | 287 +++++++++
 5 files changed, 1073 insertions(+), 892 deletions(-)
 create mode 100644 drivers/gpio/gpio-rockchip.c
 create mode 100644 drivers/pinctrl/pinctrl-rockchip.h

-- 
2.25.1

