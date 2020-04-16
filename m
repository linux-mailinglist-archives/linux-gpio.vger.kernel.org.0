Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA9441AB708
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 06:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404706AbgDPE5x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 00:57:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404633AbgDPE5v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Apr 2020 00:57:51 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA6CFC061A0C
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 21:57:50 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id w65so1111694pfc.12
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 21:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=QIrp4BsHbnoi9uksfcwVqmQIUo65lOopJM2hKOevjPY=;
        b=VyrBZg8TkEmP5I6UxOQ8aHj/8GiBYO/C7dkofYfY0kCEVoUWdZrs7fw1PtaAUFBht8
         q4TGh04l+XGCRynESDKd3MvSXxqjn2PURqQA0nmDz757r7PTlGgUhcz71Facd0o9+YZU
         DJiWB/JYxroruR9H6/2uaZf1Jb7uQtF0bIyayOZuxB2MJ4GGCJTMUW+HP3LLzPvsVVWF
         sFtOk7v0yPrwjhJuBo53Miio1juLAaPfhK0bOobdemEm7Z5R8C6+usB6eBien1EoZ3cy
         ZM1TyJuYya9d/EvlZxKRQTNqnowfEIDuoZC3lJluGg09XYHzvesyKUpTPGqBaAth5p95
         6xpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=QIrp4BsHbnoi9uksfcwVqmQIUo65lOopJM2hKOevjPY=;
        b=hgB8U4Sc9sYar/cyzK9bq4y+sRlv5AHbhpFeFmayuv/GRtoAYy+jT6A5RMHK+Yn8a+
         BiuhgdMcnUMHT3+o/AU3xitJqCOi5yX3ZC4d86yBvBzsiBoDdwbBxUYPGhGG6ICaTCN3
         Els/p5RWRpZvsAMpDWxtjuTbkl3FGjjN/eJYRUKLN22ECVc/xS6YJVDzF9MZQcVCgGc/
         9hBZF1Id7iE7nxfx8uqDoXAJWws0D6E9BHvlD4fJFBppEDU1gE7vLYZZuIfyjLX59ov/
         WhYv4/i2TNDbawOlylnMhvVZbYhYidJmBtX+ovn+LxaotE0MyJf29IibHxEoyu+xrZQ2
         Weeg==
X-Gm-Message-State: AGi0Pua5BzdSQ7d0MwW/PdjmyGH2tUQRg1nBNxPUD9KV7g5nxnqjRRL5
        mK+YXlskkYm5t5JZPzDs8Ji1alx+wcY=
X-Google-Smtp-Source: APiQypKWIMh4+eCqWplgO9VAS7KfhFuPnK8CvPpNDpSQqYVbuJyKk1FbxQBf9e9RCZNgpT/4mBj5Fw==
X-Received: by 2002:a62:1a50:: with SMTP id a77mr32414949pfa.289.1587013069449;
        Wed, 15 Apr 2020 21:57:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y123sm15173723pfb.13.2020.04.15.21.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 21:57:48 -0700 (PDT)
Message-ID: <5e97e5cc.1c69fb81.429a7.3cfe@mx.google.com>
Date:   Wed, 15 Apr 2020 21:57:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.7-rc1
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next boot: 20 boots: 2 failed, 18 passed (v5.7-rc1)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 20 boots: 2 failed, 18 passed (v5.7-rc1)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.7-rc1/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.7-rc1/

Tree: linusw
Branch: for-next
Git Describe: v5.7-rc1
Git Commit: 8f3d9f354286745c751374f5f1fcafee6b3f3136
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 20 unique boards, 9 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 64 days (last pass: gpio-v5.5-4-=
45-gd18fddff061d - first fail: v5.6-rc1-12-g612e35e76ec8)
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: v5.6-rc7-64-g4ed7d7dd4=
890)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            exynos5422-odroidxu3: 1 failed lab

---
For more info write to <info@kernelci.org>
