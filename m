Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDB6A22E5D5
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 08:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbgG0GZm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 02:25:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726124AbgG0GZm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2020 02:25:42 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A095C0619D2
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jul 2020 23:25:42 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id w2so8805621pgg.10
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jul 2020 23:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Wdcgc2gFJgUE6HMPilJBh0jLqx8GQEZ77Mmsl3zonH0=;
        b=u6zu2GNmd/EsTYpt3AOwOtYHSq1Fgh4uG9uEWMZg7gU0MtYbeVwhAerXxEpfFubNeW
         KFMJNNnrLcqBN0GKSmT/0Rr/FpCNsif6jTtVvj8p7FA2AQI6R0wE5yRR1MFUzhZ7J8r3
         qjFILsQqWpVUHgVSG2fPsovdr4IK5Ep7ydMtH09LRV/HFUJAE8OaezQXL9hkepTNztsq
         poXxl3kJG9e/w099SUaWAggTseVrSSsijuJbpxmjLbS9VLdQpKtgpLFChO3Jf+hUY1RR
         yhYB7VxuNbnqyNBGC15pUyPM9BeRMs9ACCRjlpnP8cAKns+PLCGKMf5hOlqitGdLzwp3
         pAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Wdcgc2gFJgUE6HMPilJBh0jLqx8GQEZ77Mmsl3zonH0=;
        b=DRSYDuzZ5UmD8Ue+qw0myHfIhKt99AIMd4VYwECj5I/zAUMuv1atKXv8/7eG9Ipzlr
         pWcY0USzSp6zk/56ZP9yhvTFrN+zvsi6rGmp6v5wK8atokI8SeMu/I9aDIWypNpSzgd5
         bALlS6wBegfQE2Oxlae1ZFs5GWtnB0Hc2lhF7zg9YYO44DnSnRQuLFj3RTNkkiQEXMt6
         NHl0HmZ4kUCQmgR5visvWhKrixfPjlmUsL70hH3IsCObSSVvy0CUwURDV7DakHRERubv
         c9BFL1GZLy8dQEHvro2pNXJ2b62h678bwRiPmBqkGq3dErQBdQG1afk/kVZelumRNgeQ
         HCfg==
X-Gm-Message-State: AOAM530k3kDb/+U1W/bdg3sOAU5gWj0JRwYXIlNag7B27AoouxFAWqc0
        8pfp2kF9aIgiYZFGZTTMUN3h3jJ76SI=
X-Google-Smtp-Source: ABdhPJxqs+85/oOxUePgf86Q2USAEh0PLgSrItafHSdBZT+piiSu+KAnowoytAUc1sFuJRiFGtq3sg==
X-Received: by 2002:a63:140f:: with SMTP id u15mr17410846pgl.94.1595831141738;
        Sun, 26 Jul 2020 23:25:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id lk16sm848651pjb.13.2020.07.26.23.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 23:25:40 -0700 (PDT)
Message-ID: <5f1e7364.1c69fb81.8a2d9.31a9@mx.google.com>
Date:   Sun, 26 Jul 2020 23:25:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: gpio-v5.8-2-96-ga070bdbbb06d
X-Kernelci-Report-Type: test
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next baseline: 122 runs,
 4 regressions (gpio-v5.8-2-96-ga070bdbbb06d)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 122 runs, 4 regressions (gpio-v5.8-2-96-ga070bdbb=
b06d)

Regressions Summary
-------------------

platform              | arch   | lab          | compiler | defconfig       =
   | results
----------------------+--------+--------------+----------+-----------------=
---+--------
at91-sama5d4_xplained | arm    | lab-baylibre | gcc-8    | multi_v7_defconf=
ig | 0/1    =

bcm2837-rpi-3-b       | arm64  | lab-baylibre | gcc-8    | defconfig       =
   | 4/5    =

hifive-unleashed-a00  | riscv  | lab-baylibre | gcc-8    | defconfig       =
   | 0/1    =

qemu_x86_64-uefi      | x86_64 | lab-baylibre | gcc-8    | x86_64_defconfig=
   | 0/1    =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/gpi=
o-v5.8-2-96-ga070bdbbb06d/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: gpio-v5.8-2-96-ga070bdbbb06d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      a070bdbbb06d7787ec7844a4f1e059cf8b55205d =



Test Regressions
---------------- =



platform              | arch   | lab          | compiler | defconfig       =
   | results
----------------------+--------+--------------+----------+-----------------=
---+--------
at91-sama5d4_xplained | arm    | lab-baylibre | gcc-8    | multi_v7_defconf=
ig | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1e6a1d85250f007e85bb2e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-96=
-ga070bdbbb06d/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama=
5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-96=
-ga070bdbbb06d/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama=
5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1e6a1d85250f007e85b=
b2f
      new failure (last pass: v5.8-rc5-96-ge80c35d808ef) =



platform              | arch   | lab          | compiler | defconfig       =
   | results
----------------------+--------+--------------+----------+-----------------=
---+--------
bcm2837-rpi-3-b       | arm64  | lab-baylibre | gcc-8    | defconfig       =
   | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f1e5690a09facd39385bb2c

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-96=
-ga070bdbbb06d/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.=
txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-96=
-ga070bdbbb06d/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f1e5690a09facd3=
9385bb2f
      failing since 10 days (last pass: gpio-v5.8-2-58-g1752911c6d10, first=
 fail: v5.8-rc5-68-geb211a587e18)
      2 lines =



platform              | arch   | lab          | compiler | defconfig       =
   | results
----------------------+--------+--------------+----------+-----------------=
---+--------
hifive-unleashed-a00  | riscv  | lab-baylibre | gcc-8    | defconfig       =
   | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1e66325a0c7c943385bb2e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-96=
-ga070bdbbb06d/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed=
-a00.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-96=
-ga070bdbbb06d/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed=
-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1e66325a0c7c943385b=
b2f
      new failure (last pass: v5.8-rc5-96-ge80c35d808ef) =



platform              | arch   | lab          | compiler | defconfig       =
   | results
----------------------+--------+--------------+----------+-----------------=
---+--------
qemu_x86_64-uefi      | x86_64 | lab-baylibre | gcc-8    | x86_64_defconfig=
   | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1e656ba99ade264685bb29

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-96=
-ga070bdbbb06d/x86_64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86=
_64-uefi.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-96=
-ga070bdbbb06d/x86_64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86=
_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/x86/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1e656ba99ade264685b=
b2a
      new failure (last pass: v5.8-rc5-96-ge80c35d808ef) =20
