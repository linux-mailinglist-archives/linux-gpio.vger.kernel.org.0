Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B02CA1ACCB3
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 18:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728114AbgDPQHT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 12:07:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2388603AbgDPQHN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 12:07:13 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C814DC061A0C
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 09:07:13 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id g6so1830857pgs.9
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 09:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=uiygRmSzsqOw5hZ2LUlG+XolnGyFeC6yCDv7wlqFO7U=;
        b=KDKU74Iyn2h4ojXeB5LkeDTnuMm5r+YD7haJG5YqAZwAKe4qi+2jgoH4GwRl5FYpyi
         saiDs2qjsStcG/pI2YFg9pCCTpLgbo/vubwGwQ9v8famf5EZX0IL4rpovO39VIgb5kio
         c9RdbYBQmctptFyrQ9GL6/ZmHVbIZVvAHVwMq/zhH8D/KlXqtC+txL4kRiYHRpawUvNw
         YkRSq6/UvfUBfu5Ihgbrk4WbJb30hi1yOlpPXOXWEsWE4ZWYF0VDoQa/1/7tx5D/WDhf
         ftgfFUmWuLajtQbdonPbKLgMzTgDSBhkZGaGWpXh41/X57WXHONkMrqWd63jnymhznCn
         /ymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=uiygRmSzsqOw5hZ2LUlG+XolnGyFeC6yCDv7wlqFO7U=;
        b=Xlm0P9Uyp9g6PMuo520NsKwMkKZYR47gR29yAOaQ2OC128Vf1uFtv5s74V1T7TFRWo
         C2G1ZbVvbGW1ctPw4ixPaLVjE4ISBLdZrMrgn/1EqekHn9nA8M57eAO/fQwu/vqdcS4u
         3MtgN6jI9CrJvvxi5oM/QStBmXW4IRRLQ1efPJZ1slgp3eRAoIcFgmRQne//K8CEQa+E
         xse2jOR/nJM34D4j3y1NjV7HBmMmhKsc2BbnKV+gNmXrmEh2AXqZbxQ/tcU7Lxh6zjIR
         qjSbG8oTToXDZGSxLD2uWC7E+0r3jKnP7dGn7UTOt/17P8y8/dTkKWrl830dsh+re1vR
         18nA==
X-Gm-Message-State: AGi0PuYfwiMojCZF00ho7aTREN7Sfwcu4lwHWcQ2BFkkSar+YNR17M3m
        x7lURx4yfeOZRRefKQXyODAMUkFujlY=
X-Google-Smtp-Source: APiQypKM3e4m6++q+ZRgn84FyitoPK5PL3lwbE35TYKTLnSZ+IbizoI/W3mnBtfMqEGeEY905vysBw==
X-Received: by 2002:a62:6443:: with SMTP id y64mr1466167pfb.13.1587053232926;
        Thu, 16 Apr 2020 09:07:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i16sm7910674pfd.108.2020.04.16.09.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 09:07:12 -0700 (PDT)
Message-ID: <5e9882b0.1c69fb81.88428.dc0f@mx.google.com>
Date:   Thu, 16 Apr 2020 09:07:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.7-rc1-23-gbbcb9d87dfa9
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next boot: 65 boots: 1 failed,
 64 passed (v5.7-rc1-23-gbbcb9d87dfa9)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 65 boots: 1 failed, 64 passed (v5.7-rc1-23-gbbcb9d87d=
fa9)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.7-rc1-23-gbbcb9d87dfa9/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.7-rc1-23-gbbcb9d87dfa9/

Tree: linusw
Branch: for-next
Git Describe: v5.7-rc1-23-gbbcb9d87dfa9
Git Commit: bbcb9d87dfa9f4d83de87e401ad3aa087adf7c70
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 57 unique boards, 15 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 65 days (last pass: gpio-v5.5-4-=
45-gd18fddff061d - first fail: v5.6-rc1-12-g612e35e76ec8)

Boot Failure Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

---
For more info write to <info@kernelci.org>
