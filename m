Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FDFF210239
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2020 04:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbgGACxj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 22:53:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgGACxi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 22:53:38 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 910F0C061755
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 19:53:37 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id m9so67742pfh.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 19:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=tbVnNxF/guXtko01byA5Q8jVjWRvMtu0BhcsqW06NGo=;
        b=mapZB9XRV89+vdZG/WfrwWISK7YiEpJCm5t3RUxI31sllOEZltrykQTXkGxflbqDzD
         RIlGJwfi6ZCGiEus0cjntr+dVQhtnVL6Nw6UW5GU/JDAVoZxQUoGFtc2OSjtgRrWZ0qy
         b7Wquo4tkWyxtoFfEKevQ/2H+3PF+crYXMBPT8Zx2KShUI4BJpSATzcusMikQ41R3G/d
         WGF2JK8xGC60vDJlE29rCeYvlh4NT9b3zaqk4+ey3AXU9hVFrVFdxoItcO2YO3R8dA6F
         V9h0HB+bMguCK+NC45ioLdv+2T3S1nuWK4czvupoQBJmEIoFcfcHTQ7J0LoM2Hie9ho1
         +G4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=tbVnNxF/guXtko01byA5Q8jVjWRvMtu0BhcsqW06NGo=;
        b=cjrAn/ZsHo5npQ/ZvVWSGo0PKfGI4magT3Hj80+BnOapaBHu+hzXOEBJB6Gbw6vP9/
         cNAIFjkkxa07FU6HwwIJe9DiIwDf1BTbhXzTaBMiBfXUUKGuWxFi8oi/Q3r3qT/+cx5t
         gfkYjBg9T3mxxtHvGzvt1/nzJOUL8DlBWgWZiVCjJBpUgRAYrvdUbaZrrXjgmTeIjEJ+
         L0aIHoC8p4ARAcqB4YwTpXCr9c6gMyRnRwTTqp/FE85zR1a/Sh7c1RRHWree9Qz8xjYo
         OO78u9TYLah0kfbXXXWz44sVWPLisCDAuV/c9VjQnGPgUPGvtyn/BrYWZrXNWHLjH2WG
         K+zQ==
X-Gm-Message-State: AOAM530EskwdeSbNXmRXtk59Mrt3u0RSleZeAw04bXeHZ9mXt9oX04v2
        YyNmDiq/m1WkVsZh6hMtPyUwI/FbWm0=
X-Google-Smtp-Source: ABdhPJzHJ4jSTPKoHLvJ8U54pFNn6UW+oyzM8c8BB/X4F07jC27IB6xRteymAmFUV6IClQaYm3zIhg==
X-Received: by 2002:a65:67d0:: with SMTP id b16mr3272276pgs.60.1593572016695;
        Tue, 30 Jun 2020 19:53:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c139sm3976583pfb.189.2020.06.30.19.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 19:53:36 -0700 (PDT)
Message-ID: <5efbfab0.1c69fb81.619e1.bd4e@mx.google.com>
Date:   Tue, 30 Jun 2020 19:53:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc1-26-gb239e4454e59
X-Kernelci-Report-Type: test
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel baseline: 44 runs,
 3 regressions (v5.8-rc1-26-gb239e4454e59)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 44 runs, 3 regressions (v5.8-rc1-26-gb239e4454e59)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
| results
-----------------------------+-------+--------------+----------+-----------=
+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig =
| 4/5    =

hifive-unleashed-a00         | riscv | lab-baylibre | gcc-8    | defconfig =
| 0/1    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig =
| 4/5    =


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/v5.8-r=
c1-26-gb239e4454e59/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: v5.8-rc1-26-gb239e4454e59
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      b239e4454e59bc85d466eb5630da46f6a876df77 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
| results
-----------------------------+-------+--------------+----------+-----------=
+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig =
| 4/5    =


  Details:     https://kernelci.org/test/plan/id/5efbf090467c86be9d85bb33

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.8-rc1-26-gb239=
e4454e59/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.8-rc1-26-gb239=
e4454e59/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5efbf090467c86be=
9d85bb36
      failing since 10 days (last pass: v5.8-rc1, first fail: v5.8-rc1-8-g8=
4651e81ee33)
      1 lines =



platform                     | arch  | lab          | compiler | defconfig =
| results
-----------------------------+-------+--------------+----------+-----------=
+--------
hifive-unleashed-a00         | riscv | lab-baylibre | gcc-8    | defconfig =
| 0/1    =


  Details:     https://kernelci.org/test/plan/id/5efbed47bf035d72dd85bb30

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.8-rc1-26-gb239=
e4454e59/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.t=
xt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.8-rc1-26-gb239=
e4454e59/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5efbed47bf035d72dd85b=
b31
      failing since 14 days (last pass: gpio-v5.8-1-1-gf6d984418ffd, first =
fail: v5.8-rc1) =



platform                     | arch  | lab          | compiler | defconfig =
| results
-----------------------------+-------+--------------+----------+-----------=
+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig =
| 4/5    =


  Details:     https://kernelci.org/test/plan/id/5efbf1b37e0ec9442185bb29

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.8-rc1-26-gb239=
e4454e59/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-libret=
ech-ac.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.8-rc1-26-gb239=
e4454e59/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-libret=
ech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5efbf1b37e0ec94=
42185bb2e
      new failure (last pass: v5.8-rc1-8-g84651e81ee33)
      2 lines =20
