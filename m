Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DBAF2243A9
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 21:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727821AbgGQTBP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 15:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726650AbgGQTBO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2020 15:01:14 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C956C0619D2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 12:01:14 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id z3so5827638pfn.12
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 12:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=jLfQJTbm6a6v90MFANnEEQ6rEUNw6/cySbPMopaJ46Y=;
        b=K/aMb39EBYN9zhKKc30kYqaBD9w5fKyCdBiU1yXSBXxN+hJ2t0JGOJTKkcbLs2tcvb
         LVmk9lw7vXuEqhx6wUuSJASbwYJY9CpVWo4gRaXjRFWHXBdkLSSdC1Ic2lBt6DmOUofU
         yvnbphvP5Q1cLcIMDdJtn+dSDoyl03e0dezWH6giwWHgQGrE/XFO+HOEOaJmuXDHgKjq
         lBgA3iRTEVao+02eOfQEZaViWjZF31Hx5Y7p2vJdRflAZpkTLmpzviwfxcE4mCC2lR/z
         tjMpz80mOciSfiCSWrpCfcySfB0+KXBiWZXbBTo4iDeg/mGbyJLijQmuDMyu/JrGLWMH
         ohZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=jLfQJTbm6a6v90MFANnEEQ6rEUNw6/cySbPMopaJ46Y=;
        b=XV5VJy6Fi2WECkAc2aCawpqAJ1GpWlBEvwRa9nWCsJ0Q3NDdZTKO2q/mrmXe5uLj/I
         HX1ifasTNMznJfo05RapnIKjOcydv3OmgnxEX6MIPcC5FA2GMmQoG0BkTeLJYXrgKvCi
         NLLSLxkKJ6P4CywWUuhlFFjiXL3xNFbfX/orJY6CabL2Wwx7v1TFKIWzZhoqie7kno7C
         14KT5VQXAsbuy+UxJLbgbb871t4Os6fCfcCJQ2SXqyMf84vWqjsQomrqwGNnYtGuPdu7
         6IKbK16AbmF9F+sYvfxKJlrsfHke1whmVJhZu1eckFKStgaFm6rYR4fpvS3GCDlUGqAv
         yM3w==
X-Gm-Message-State: AOAM532L69leMLTUsC9LcVXwXD5k/IPKC0Sf/MTWGOrZNIGYGg4kXLrd
        zZqPtK487qjAaRjs5tKhkJoCSQ+98SM=
X-Google-Smtp-Source: ABdhPJz5dUxcOdatr5M+JHA03FWIKzrWsNmBtVFwH+ymvZlL9bPFyUhsuTIOXNaUJLW+IwaiVLIKeQ==
X-Received: by 2002:a65:4507:: with SMTP id n7mr9565139pgq.180.1595012472753;
        Fri, 17 Jul 2020 12:01:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r17sm8621751pfg.62.2020.07.17.12.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 12:01:11 -0700 (PDT)
Message-ID: <5f11f577.1c69fb81.e2e2f.a7a3@mx.google.com>
Date:   Fri, 17 Jul 2020 12:01:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc5-69-g70d7cd6c82a9
X-Kernelci-Report-Type: test
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next baseline: 60 runs,
 2 regressions (v5.8-rc5-69-g70d7cd6c82a9)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 60 runs, 2 regressions (v5.8-rc5-69-g70d7cd6c82a9)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
| results
-----------------------------+-------+--------------+----------+-----------=
+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig =
| 4/5    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig =
| 4/5    =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/v5.=
8-rc5-69-g70d7cd6c82a9/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: v5.8-rc5-69-g70d7cd6c82a9
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      70d7cd6c82a906bfc45e5043fed5456d46a92662 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
| results
-----------------------------+-------+--------------+----------+-----------=
+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig =
| 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f11eb8ae9c3faa1c685bb47

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.8-rc5-69-g7=
0d7cd6c82a9/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.8-rc5-69-g7=
0d7cd6c82a9/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f11eb8ae9c3faa1=
c685bb4a
      failing since 1 day (last pass: gpio-v5.8-2-58-g1752911c6d10, first f=
ail: v5.8-rc5-68-geb211a587e18)
      2 lines =



platform                     | arch  | lab          | compiler | defconfig =
| results
-----------------------------+-------+--------------+----------+-----------=
+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig =
| 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f11ebc3c911c70d4385bb22

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.8-rc5-69-g7=
0d7cd6c82a9/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-lib=
retech-ac.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.8-rc5-69-g7=
0d7cd6c82a9/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-lib=
retech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f11ebc3c911c70=
d4385bb27
      new failure (last pass: v5.8-rc5-68-geb211a587e18)
      2 lines =20
