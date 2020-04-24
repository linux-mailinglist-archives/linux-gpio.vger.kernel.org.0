Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC91F1B7A44
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2020 17:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729163AbgDXPlP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Apr 2020 11:41:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728488AbgDXPlP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Apr 2020 11:41:15 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F36E4C09B045;
        Fri, 24 Apr 2020 08:41:14 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id hi11so4009584pjb.3;
        Fri, 24 Apr 2020 08:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yrssVl5uvJMgOzzbpGHEcXQI4lSvlAJjsgZ6qUXvhlQ=;
        b=GF7nzNe2K4WbMFwU2VcvLrfuF8pFUUGZ6uac7PjQlS/cHEh9XCGdMKQyPXDWadUnKU
         3hkms5PTzPg8NeZYOzK2fZkfFE54nA/RHmVldhS0txRMuDPj56MoLIrXkK/kOwpwKSZp
         tNirYy+juPzX1pYFblyPWu0mTL9aJpxcWP90Up4vWGJ/mwR8SGb5jP5NGctVQymymMnO
         zXRzD91Mh45TiZl6qDnm9wHNx/olULWw1AwBHDx3wf0s0XPmJQbWV2IFQyNmsAhKCDjn
         9oHExH+KcC2CK6HCc5GWn+rkvwBcKRXUDmv6PgkIyDlch5Bc/BVPIun+N66Dpr1digF5
         gdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yrssVl5uvJMgOzzbpGHEcXQI4lSvlAJjsgZ6qUXvhlQ=;
        b=UPxnLGF1/zAhn6o3eTLGFd9eu/9AMEiguo3bybHCvXwQxTVwNRi7aOm+rw1aomdChU
         5AxIKaqc7QJ4Ik+yCE7d/ZJwcE7cIKW28yPDCrQaYcc4GPpG/xVeTj8bL/9n7YLHjimh
         Ky7likZm5/gk4RMo0IPZgeTQXOStHmDxkYHVdOc0GUj0w5rmAxUsihkS6ZPw8LLUTZdO
         TGRGwXLfoIM2e6/3wcNG7qGwfiZMPJ4MEDN4/rk+H3tVbe9wyypwP731QkLP+Tj1QtbT
         IBySZmX+qqQmNw1Aeyzaow1Je9fd998ul2NJ0QN1W2RSjYimk/SCueWtHZnA+Xwl77lU
         VB7A==
X-Gm-Message-State: AGi0PuY5UGdJ03E4VVsp0Pro9L507LE8dv++ciUoqlvLsHqkpLJ75DgU
        COFnsUSF9tCPPGyYrL2iI+8=
X-Google-Smtp-Source: APiQypJpEVNi235bq9qEY27x1koxLWnJD8Cu6F7er7Y9lXvaeo1g0dSqYrdTsfOmso7zn50eIos0EQ==
X-Received: by 2002:a17:90a:23ad:: with SMTP id g42mr6488956pje.35.1587742874369;
        Fri, 24 Apr 2020 08:41:14 -0700 (PDT)
Received: from localhost (176.122.158.64.16clouds.com. [176.122.158.64])
        by smtp.gmail.com with ESMTPSA id w11sm4954939pjy.11.2020.04.24.08.41.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Apr 2020 08:41:13 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v2 0/2] gpio: fix several typos
Date:   Fri, 24 Apr 2020 23:41:01 +0800
Message-Id: <20200424154103.10311-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use codespell to fix two typos in ftgpio010 and mm-lantiq drivers.
s/desireable/desirable/ for ftgpio010 driver.
s/dont/don't/ for mm-lantiq driver.

v1 -> v2:
	- split patch v1 (only one patch) into patches for each driver
	  by Bartosz's suggestion. thanks Bartosz.

Dejin Zheng (2):
  gpio: ftgpio010: Fix small typo
  gpio: mm-lantiq: Fix small typo

 drivers/gpio/gpio-ftgpio010.c | 2 +-
 drivers/gpio/gpio-mm-lantiq.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.25.0

