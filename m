Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3BED1D171C
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2020 16:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388768AbgEMOIw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 May 2020 10:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387608AbgEMOIw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 May 2020 10:08:52 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D708C061A0C
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2020 07:08:52 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id k19so6860858pll.9
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2020 07:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=HDDDor5uDTMJnyg3e21PG0+5s1zniMsb6uco9mZEG7I=;
        b=GZypDeOhfD6JsuGzvGPTeFzIbj3BOgIiFv/lUTArzWq0D4L3H3ks3fEZhmmSA/BIDe
         /oFgtEEEVeG5/Lc/DIMU88iQgpYAxSsSVyks2OtDhJacwjoX9mWi1h5q7+WUBRfVGq25
         +eF13h5nVQjd3srElaZBNBzAKtOXYvAL9O3YkBxRZNqO5j5rLHC7keVUb6Ld0vlTMh8W
         cZfSyXpXmMtyFAt5drxKQhQjmIv6jE8Sin2Ze4JlM0IoB3Iieh+bn0ZqMuXKdM6gkGOr
         /29qYVrQcAwBYlpu/Nx6mx+D4DtfRkS74PNCpsaJ2XeFRQNuso1g0CNEtIZskmJyY59B
         W5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=HDDDor5uDTMJnyg3e21PG0+5s1zniMsb6uco9mZEG7I=;
        b=Dk3jJrfkIYNq3d4U/tcnNC6k2aw6NCceR3RYaQrXkHemvnptBXhFkSn5kqFOBoz1kA
         4n3XTt1KD1UHTf/j1oz+GXJaeoliAPjxX7i3dLs7NG5V88vT0pqnfDpbQamsRIKKpxl3
         nzU8Tz31DR9H/B9imnEd6H9Oc+dPNPKCaV5TTf6pQYdxZ16X5xUN6x1rC1g5Bqu11sZr
         pq33swC3k+Z2E88y6sLljYzB8iYNwRaxyeLeg8VUVDLLNtHttS3AE1yqM4fc4F4d75lw
         kZyOUL39yep6lnDUPdfuMFZiDjI6M8pZIXMJX1Q7VApmmA6IFSg/5JrWLGezKSGvLQtX
         ZYfw==
X-Gm-Message-State: AOAM53215FgA6guS/5f7no5063qyLAUkzwvDwlrjeyun8rg2ZcnjKUxb
        UjQGB56/IJ9wawSgA3YRterY9qKxtzw=
X-Google-Smtp-Source: ABdhPJzvnYTH4ADftNTPbe4BnsWaCnZDhk+9szQckNjldKtwOmKYvc1bEqaqBFWMvS1GFE1ObzeNdg==
X-Received: by 2002:a17:90a:d254:: with SMTP id o20mr4669981pjw.185.1589378930629;
        Wed, 13 May 2020 07:08:50 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e1sm9207980pgj.0.2020.05.13.07.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 07:08:49 -0700 (PDT)
Message-ID: <5ebbff71.1c69fb81.5bd5d.1c3c@mx.google.com>
Date:   Wed, 13 May 2020 07:08:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: gpio-v5.7-2-52-gccec57d2a1fb
X-Kernelci-Report-Type: boot
Subject: linusw/for-next boot: 63 boots: 3 failed,
 60 passed (gpio-v5.7-2-52-gccec57d2a1fb)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 63 boots: 3 failed, 60 passed (gpio-v5.7-2-52-gccec57=
d2a1fb)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/gpio-v5.7-2-52-gccec57d2a1fb/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/gpio-v5.7-2-52-gccec57d2a1fb/

Tree: linusw
Branch: for-next
Git Describe: gpio-v5.7-2-52-gccec57d2a1fb
Git Commit: ccec57d2a1fbc5b2c2e75647fab08a2b8a662c68
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 56 unique boards, 15 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 92 days (last pass: gpio-v5.5-4-=
45-gd18fddff061d - first fail: v5.6-rc1-12-g612e35e76ec8)
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: v5.7-rc2-34-g9e581cd14=
663)
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: v5.7-rc2-34-g9e581cd146=
63)

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: v5.7-rc2-50-gaa0334bd4c=
82)
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: v5.7-rc2-50-gaa0334bd4c=
82)
          sun50i-h5-libretech-all-h3-cc:
              lab-baylibre: new failure (last pass: v5.7-rc2-50-gaa0334bd4c=
82)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            sun50i-h5-libretech-all-h3-cc: 1 failed lab

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            exynos5422-odroidxu3: 1 failed lab

---
For more info write to <info@kernelci.org>
