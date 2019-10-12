Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF999D4BF8
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Oct 2019 03:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727908AbfJLB4z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Oct 2019 21:56:55 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41303 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727345AbfJLB4z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2019 21:56:55 -0400
Received: by mail-pl1-f195.google.com with SMTP id t10so5261474plr.8
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2019 18:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Gq5oUfTgffiN2GsMQ1YbfvrWqjbVL8Kh5udAiPCTxQ=;
        b=JfL72wPqP/K2Q+Qhi9dQCRUIp09vE8OwLeo4HuLfTf5ljQwoWiJEZffnwiZrdoIzZ/
         XxvvkPbBXFLk2tLXX6HDwRrKsC/ngMb3xrAgFuXdWfOezTliSjUk0z6Gb4qDr4aKStED
         iNkQ5q3qrTo3vZA7GVD1nrtTZtHax5rJ2cIUQMTNnLLqo6AeKroin3mY3fGuRXzBJzqL
         AUeTztRGIFYcpBCNWym0INv8DSvcH3XUfFIhxDlRgib+N0vN/8FAr8x6THThuut/ACtD
         lUXtQxjMc+Asp4JOMK4qQYUhQVu25tMdNjlGSWxTmeXHk/5UCxw1/JzGu5GQv63duzn/
         O98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Gq5oUfTgffiN2GsMQ1YbfvrWqjbVL8Kh5udAiPCTxQ=;
        b=WSFxO/ItH9aeKNIaSZKZdUSlPq03lWZJHRwgJ8bJvmlV5zEToHmNxYJB1Xgvb2JGPY
         BiDqoAzqFoF2ZBuX07FG68VRgmWoDBhqGxMG3FttSlK1kxmYUt5DPOq5XmSIp4N+4jn1
         F/aU0ZOgqFynNyqc/QvFmSPa39iVS3QDcQswzmIYah9QYSzp3ibqgqTt427S/M0qZaXg
         CXXZA+nuHw5nYlu6abMVb4RJCUkg0fEDgqTBdZy0kvZeIywi56Z1pN3rLIt0rqbRIW51
         AH4n45ExluHji70/FkJsTEm/rjcl3QUfRqDOxDNQnjz2jE/yr0u0r0h1QaA7m+w6UPoI
         7tmA==
X-Gm-Message-State: APjAAAUmoUxGwr9G84rRHDZjTpTpxbaMhrNWtOv6gtOLPRzQkPIgiZ8N
        MmOX58tBv41TnPOtQthegMnZkfrs39J/ZA==
X-Google-Smtp-Source: APXvYqzs7sniuOLIUGgV4LwSWvuHQB903oHzvsAthYC/WAn2YJsBAmU8zu3aEN96tUze1ngcRihRuw==
X-Received: by 2002:a17:902:8218:: with SMTP id x24mr17464841pln.139.1570845413763;
        Fri, 11 Oct 2019 18:56:53 -0700 (PDT)
Received: from sol.lan (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id b20sm12042242pff.158.2019.10.11.18.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 18:56:52 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 0/6] gpio: expose pull-up/pull-down line flags to userspace
Date:   Sat, 12 Oct 2019 09:56:22 +0800
Message-Id: <20191012015628.9604-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series adds gross control of pull-up/pull-down to the GPIO uAPI.
Gross control means enabling and disabling of bias functionality,
not finer grained control such as setting biasing impedances.

The support allows both input and output lines to have any one of the
following biases applied as part of the line handle or event request:
 0. As Is - bias is left alone.  This is the default for ABI compatibility.
 1. Pull Up - pull-up bias is enabled.
 2. Pull Down - pull-down bias is enabled.
 3. Pull None - bias is explicitly disabled.

The biases are encoded in two flags, PULL_UP and PULL_DOWN, where
setting both is interpreted as Pull None. So the flags effectively form
a two bit field encoding the values above.

The setting of biases on output lines may seem odd, but is to allow for
utilisation of internal pull-up/pull-down on open drain and open source
outputs, where supported in hardware.

Patches are against v5.4-rc2.

Patch 1 adds support to line handle requests.
Patch 2 adds support to line event requests.
Patch 3 adds pull-up/down support to the gpio-mockup for uAPI testing.
Patch 4 rejects biasing changes to lines requested as-is.
Patch 5 adds support for disabling bias (pull none).
Patch 6 adds support for setting bias on output lines.

Drew Fustini (1):
  gpio: expose pull-up/pull-down line flags to userspace

Kent Gibson (5):
  gpiolib: add support for pull up/down to lineevent_create
  gpio: mockup: add set_config to support pull up/down
  gpiolib: pull requires explicit input mode
  gpiolib: disable bias on inputs when pull up/down are both set
  gpiolib: allow pull up/down on outputs

 drivers/gpio/gpio-mockup.c |  94 +++++++++++++++++++++-------------
 drivers/gpio/gpiolib.c     | 100 +++++++++++++++++++++++++------------
 include/uapi/linux/gpio.h  |   4 ++
 3 files changed, 133 insertions(+), 65 deletions(-)

-- 
2.23.0

