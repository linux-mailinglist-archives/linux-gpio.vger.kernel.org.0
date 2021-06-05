Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D909A39CA95
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Jun 2021 21:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbhFETCW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Jun 2021 15:02:22 -0400
Received: from mail-lf1-f49.google.com ([209.85.167.49]:46681 "EHLO
        mail-lf1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbhFETCV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Jun 2021 15:02:21 -0400
Received: by mail-lf1-f49.google.com with SMTP id m21so3437900lfg.13;
        Sat, 05 Jun 2021 12:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tHFb84Yr5bHh72fIcUnmCqMMARMO9r3vbW9LsistKmw=;
        b=oKDMbDuRCkuwvcxkxsP44pQi7G58ijMtDt+v5FjpBkiphdW8zp9DOaaL5lwXNOHY7e
         EwcDg0utMSXSHDrl86cSgQ+WHOcgMwnJiKZxP4nmXROVhuV425ooKulrI/vKqjZdSsft
         0+3Sd/9NevIlB4DvYJt/XK57DiKJxddzunBIpBDiBg9GipGm6JKq01xE9vHFBqjmXkCb
         Cbdx5IAm4iIGhdbNnGhQNB1z/9vQm4d9wnFHARZw44faGbtpkBSm8RDgtGHmjICCZma6
         YghZAHaAlgGR8MCWWFPsyiHqmZjz4oFRpGqKsnzwCsmaSLIgOFpbJUdBYumQXTPfCDED
         tDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tHFb84Yr5bHh72fIcUnmCqMMARMO9r3vbW9LsistKmw=;
        b=PaWvuUxjbnqD2BYLK0FyGqwU/C1hXUxmu8zxbi0XJXCEooMJSep7Eql03A4pSHg6bI
         PCqsw1cwcxpNtBLiRtYiBXqw6RY/l5LPZ/A4DIZn5iGDinWNQqI+EHZSSzsz9Rw9qbJ7
         VMf+4z2HcTB5VPr2WiP4mFSceJfTpt0HSOelNsUMRnXW9Gkgg0asKMYqOTC3QleDp5QV
         QOaFcMiYJQZbT9pemuX8We44SlRZVqSNJWLgcdmRvv7611/ZgkTxCWNtrYZKDzGDUOn/
         DTg5cHk0/wM8l+ugqmH9rGvXqaM/tD+R9U0HGAm7JX6y7uYmItIfoTeE23FZ7Ov5u0ZS
         brUg==
X-Gm-Message-State: AOAM532x2RdM8xxMlA1O99bL7xiH6f22ttFDsQhdkVX1t9w3u7aEP4Jr
        Pv7zQSyrax1gxg0s2hm8VEdmwH3SGdgq/w==
X-Google-Smtp-Source: ABdhPJwFVuSssjNDi+AtBZgWyeUKziGR8r3K/UD94N4o7KHjzWACH5+pbwgyUmyHAuEOQxjwPwLGrA==
X-Received: by 2002:ac2:4c8f:: with SMTP id d15mr6430281lfl.157.1622919556262;
        Sat, 05 Jun 2021 11:59:16 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-193.NA.cust.bahnhof.se. [98.128.228.193])
        by smtp.gmail.com with ESMTPSA id d40sm116607lfv.102.2021.06.05.11.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 11:59:15 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH 0/2] pinctrl: bcm: Constify static ops structs
Date:   Sat,  5 Jun 2021 20:59:06 +0200
Message-Id: <20210605185908.39982-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Constify a number of pinctrl_ops and pinmux_ops that are never modified
to allow the compiler to put them in read-only memory.

Rikard Falkeborn (2):
  pinctrl: bcm: Constify static pinctrl_ops
  pinctrl: bcm: Constify static pinmux_ops

 drivers/pinctrl/bcm/pinctrl-bcm6318.c  | 4 ++--
 drivers/pinctrl/bcm/pinctrl-bcm63268.c | 4 ++--
 drivers/pinctrl/bcm/pinctrl-bcm6328.c  | 4 ++--
 drivers/pinctrl/bcm/pinctrl-bcm6358.c  | 4 ++--
 drivers/pinctrl/bcm/pinctrl-bcm6362.c  | 4 ++--
 drivers/pinctrl/bcm/pinctrl-bcm6368.c  | 4 ++--
 drivers/pinctrl/bcm/pinctrl-bcm63xx.h  | 4 ++--
 7 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.31.1

