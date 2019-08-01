Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D17BB7D228
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2019 02:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728178AbfHAAI5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 20:08:57 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42]:52697 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbfHAAI4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 20:08:56 -0400
Received: by mail-wm1-f42.google.com with SMTP id s3so62652938wms.2
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jul 2019 17:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=rsmLqs2IfNYCR0Hj9zt7t71QNCJUA/keEGr31qJ8mXE=;
        b=Q8aFU3ymTtykScZFrqCCDBJhHB1t4eebmCK6c2vH0Bl38Q+w+pSX5dY/Wh+NSXIxdS
         U6lG3rTfPSaxjMRaywrth8u2CrsBXUX/2WQWpI5dEe6xVwsj++J1vs83qxJqtNid8rYh
         RsxN+b+8GFAPt4gtpDQJlksrNg/AGyDn70NhIbMKCqppqicT/OyzNV2TZeZ3cRevmGBj
         5Rp7o4mFDHkbVWwnZShaiF8wpnzQHgHUEkThK8ss5vfEoES7Jqdy3toJOA7F1C6OvERr
         ZFii4FoaMjk29i2xxduH7Ts5PnRWXe28h2OFOdpqcWIjHYWSUIsdWJnAh6FANFQE+rYG
         oCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=rsmLqs2IfNYCR0Hj9zt7t71QNCJUA/keEGr31qJ8mXE=;
        b=mHS98CGVSCmooecnTrCA0Q1BV5qPS+ImPerrVbb/7GoV4RtTfxZzSKCetjxJ0CSHms
         dlJWj5wFWIMLgvZq0Ya+XJqVrKwrJ+kCrAka6rQ9V+5t617F/R4/q8d8ZkIU++7sSJQv
         izTvwwsVH5+48TZyAtHly/lKa9nZEuZ0mniMM4+gLvCcFgUkUk04UbYs7VWf9TPNGyPO
         5F1vQV4qc14HS4WCdv3DJ9KGLgyBPxfKR/u+uYDCT+AR44xWdDO0GiiiHrR1cd3206II
         mmGpWXP3mbyGyCCgtFbfPdiU6wUSlDhjkt+vKUtWU1bk1v8yhhBJk0/UIzfQbaMVf310
         IAZA==
X-Gm-Message-State: APjAAAWh6RzqaFjRkhq7KxzjQuYQjNlXpC0/mPBn+XS9qVkh4Ae9ieuk
        iiB+FTy/LzsWYKA2X9/GmxczstNoze8=
X-Google-Smtp-Source: APXvYqy8+6VQp4uWlX34JCXnUFukHg+0QSiEruY8yh4gNPcLEHNmKtt8MJ+Kx6YsqSBsjSksj9tTAw==
X-Received: by 2002:a1c:d185:: with SMTP id i127mr116363765wmg.63.1564618134629;
        Wed, 31 Jul 2019 17:08:54 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id e3sm59088643wrt.93.2019.07.31.17.08.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 17:08:54 -0700 (PDT)
Message-ID: <5d422d96.1c69fb81.727f6.17cf@mx.google.com>
Date:   Wed, 31 Jul 2019 17:08:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.3-rc1-9-g8825e356f52f
X-Kernelci-Branch: devel
X-Kernelci-Report-Type: boot
Subject: linusw/devel boot: 43 boots: 1 failed,
 42 passed (v5.3-rc1-9-g8825e356f52f)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 43 boots: 1 failed, 42 passed (v5.3-rc1-9-g8825e356f52f)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.3-rc1-9-g8825e356f52f/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.3-rc1-9-g8825e356f52f/

Tree: linusw
Branch: devel
Git Describe: v5.3-rc1-9-g8825e356f52f
Git Commit: 8825e356f52f3af8b86e916e650a091a21fe25b5
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 29 unique boards, 15 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-mhart: failing since 1 day (last pass: v5.2-10808-g9637d5=
17347e - first fail: v5.3-rc1-5-ga299726da44f)

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab

---
For more info write to <info@kernelci.org>
