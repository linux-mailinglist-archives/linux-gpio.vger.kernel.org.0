Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3775728EA63
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Oct 2020 03:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbgJOBko (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 21:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389043AbgJOBjh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 21:39:37 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AF6BC051139;
        Wed, 14 Oct 2020 16:12:11 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id j8so659943pjy.5;
        Wed, 14 Oct 2020 16:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5o9LtSE4il05eduKOAcveXCckPmf/hiC2cqKYSVCGw8=;
        b=rPoqwyF5R3ai/rEV40i1oHkC2vOSk4ECeFmvlu4l/fmVkSDXk4aqRfdvnqEY17iwJE
         tC+ulP8GI6fEWas/HESneF+B4dqFQuTMvOzx88+R9WezOJREHCQQ1lap/mYIYJZKBlsH
         cg0+jUdPstSfGNk+JRuL5e3BkBPS2dtA+yge6ShzkZZhufpjulnWCmmDpIqKF48n0lSx
         Mf0PJ3ATmZaEpRHakaXdwN0AE6HUNd3asystE1129en1pqCaFjERtoc1vS1QUz/3bqDm
         zQKQBY2uj07oN05rPDynIreqoJKxLlro4dX3kNieielHxzEZaFySx05AAvv61Ga0//2C
         6HQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5o9LtSE4il05eduKOAcveXCckPmf/hiC2cqKYSVCGw8=;
        b=ODscqY/dSsVJGiiJxZJOZWq6TVS3tTCKc3EETsPQChUelFrRcyAb8cODCBZaklJTCo
         LUWt8RuFpysaTwxxJxkvsJFHcUH16jkOcI0Dy18qAjhKBQXPcYH7Jj3Xhv1g0zNRPlmJ
         F5GkP6y1FL7M9sh80DFj625EBw9icfijsJAaU0tNS1+OQFwFHAlW25Nh+COFYBVRckPx
         9k+LBDxKB8qC24GVqDWA0bSOEzRiSobWufot288viqw0lDTDPkKTHGKQWLu05SlFyYhp
         JbJ3TRjRRncTMD36NVuhoAhMxx75bCrb9n+8NzxCqQFJAMxQczQw5rNVFokPt8EQaT7P
         +VBg==
X-Gm-Message-State: AOAM532Vle94+HzJJnDLS+DrgWt6KG/1TONE9i3UrfUU227UGYBA6kev
        XHA7yTbNIGdMDDMdZZBI+96ta/AgtZTdSQ==
X-Google-Smtp-Source: ABdhPJwVHN5qJtgI8oGth1R5PzaQvke5X6HSIqUkMF3dkQtlXOWHFBB5y/ZVakssOM4z2f2WHojVEA==
X-Received: by 2002:a17:90a:dd46:: with SMTP id u6mr1496533pjv.67.1602717130119;
        Wed, 14 Oct 2020 16:12:10 -0700 (PDT)
Received: from sol.lan (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id e5sm723157pjd.0.2020.10.14.16.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 16:12:09 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 0/3] gpiolib: cdev: allow edge event timestamps to be configured as REALTIME
Date:   Thu, 15 Oct 2020 07:11:55 +0800
Message-Id: <20201014231158.34117-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch set adds the option to select CLOCK_REALTIME as the source
clock for line events.

The first patch is the core of the change, while the remaining two update
the GPIO tools to make use of the new option.

Changes for v2:
 - change line_event_timestamp() return to u64 to avoid clipping to 32bits
   on 32bit platforms.
 - fix the line spacing after line_event_timestamp()

Kent Gibson (3):
  gpiolib: cdev: allow edge event timestamps to be configured as
    REALTIME
  tools: gpio: add support for reporting realtime event clock to lsgpio
  tools: gpio: add option to report wall-clock time to gpio-event-mon

 drivers/gpio/gpiolib-cdev.c | 21 ++++++++++++++++++---
 drivers/gpio/gpiolib.h      |  1 +
 include/uapi/linux/gpio.h   | 12 +++++++++---
 tools/gpio/gpio-event-mon.c |  6 +++++-
 tools/gpio/lsgpio.c         |  4 ++++
 5 files changed, 37 insertions(+), 7 deletions(-)

-- 
2.28.0

