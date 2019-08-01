Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 843177D9F7
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2019 13:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730681AbfHALEa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Aug 2019 07:04:30 -0400
Received: from mail-wr1-f44.google.com ([209.85.221.44]:37975 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728095AbfHALEa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Aug 2019 07:04:30 -0400
Received: by mail-wr1-f44.google.com with SMTP id g17so73106196wrr.5
        for <linux-gpio@vger.kernel.org>; Thu, 01 Aug 2019 04:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=xXsj3k115egs5+x4+DbvAv8FHvu1PupUtmXH05/IjZE=;
        b=xf7WjsIeRvC808XeTlJ4F67FeW3CEYU85GDigSPo6acJHZBgEc/GOfnEcxQk2TmFwX
         62tew6o/O0zdkb8iviv8vZqBOrMG0pi7tq+j2qeGsfNBmsHtMBeDROUm/VdSNpL7f5sk
         iovWi6SH8XYpFMrrkLBKLFpty48JhTDqpJ4/R592DSxZZ7zBJ2IwfwtY1H0jVelZOGHS
         11gA8Y4UxC66Tb91iBIET5ZCQDV/GJrak8W9DFCDuVwtgt2Who6reddNxQKU8Dp1hPxH
         ZkZOLQZHPvQlheSiZB2DJsJ0DTfTHCxDsDFUKH/v3sfYgnVR3BK69fDCYph9c30RCZNE
         4aWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=xXsj3k115egs5+x4+DbvAv8FHvu1PupUtmXH05/IjZE=;
        b=Ezaqb56KBicN4U+7olBOYbrxDTqs2LscTWYyJ6p08qaiWDCbGCPzG5sXPhS4OR6KY2
         7vyt4+vK+3sMhjZ2DCdPZ7flZVdyYhL7uRGvY51zSiKccpg7VsOzcwTU9sqCRySkyKyo
         Y90r7ZUg3IjGGHfNDeW1JZHhX7QdiuC0p/9XgaMWJbStDEkE1o0m82vPCCpQFBNH8Zag
         bx46wplXfzEQsnwOzk7GOOKJfVRUl+dbPvOt18+dELLIVzpJZiwIJgLGPhYqDbV4aZP7
         PMKU/WDg2evqw2IJ/uCCr86eW1+AXgiqIJxd3imfrrlufdYl7SznHTV8adI1iiHancd2
         4noQ==
X-Gm-Message-State: APjAAAXd52R/2nzMUP9XxluenzthQemtUlKsJSCeNNKxUb5TPMzxG19l
        7R2fLIV562bcfBEVKKMBR3d1EG0gXFM=
X-Google-Smtp-Source: APXvYqynYV2PnnsPIfht7MQa13p4ZOJJC2gDMz9i/k+5QPpDXhYyPgLIXmXyZoGsyQ2fKYqGu7PGYg==
X-Received: by 2002:adf:cf0b:: with SMTP id o11mr6208557wrj.10.1564657468594;
        Thu, 01 Aug 2019 04:04:28 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id t63sm66292747wmt.6.2019.08.01.04.04.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Aug 2019 04:04:28 -0700 (PDT)
Message-ID: <5d42c73c.1c69fb81.4e1ae.8fac@mx.google.com>
Date:   Thu, 01 Aug 2019 04:04:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: gpio-v5.3-3-10-g27b7f71a7b92
X-Kernelci-Branch: for-next
X-Kernelci-Report-Type: boot
Subject: linusw/for-next boot: 40 boots: 1 failed,
 38 passed with 1 untried/unknown (gpio-v5.3-3-10-g27b7f71a7b92)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 40 boots: 1 failed, 38 passed with 1 untried/unknown =
(gpio-v5.3-3-10-g27b7f71a7b92)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/gpio-v5.3-3-10-g27b7f71a7b92/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/gpio-v5.3-3-10-g27b7f71a7b92/

Tree: linusw
Branch: for-next
Git Describe: gpio-v5.3-3-10-g27b7f71a7b92
Git Commit: 27b7f71a7b92900eee979c2ba3675e0095e71e00
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 28 unique boards, 14 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-mhart: failing since 2 days (last pass: v5.2-10813-g88785=
b7fa74a - first fail: v5.3-rc1-10-gd2a561ae1961)

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab

---
For more info write to <info@kernelci.org>
