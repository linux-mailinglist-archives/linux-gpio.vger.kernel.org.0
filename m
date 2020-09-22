Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98778274D66
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 01:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgIVXhA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Sep 2020 19:37:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgIVXhA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Sep 2020 19:37:00 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59EA8C061755
        for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2020 16:37:00 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id x123so13881737pfc.7
        for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2020 16:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=glUyis9sidf43iytDo4T3rzoUgrFULKI+XIP2P81fx0=;
        b=HyvAAso7aD3gnkW3JHO3OQ7DwYlhHkhJaezglg0Qhq7/J2Nx7dXhPyZoMFf1fdDkn8
         ae5o3D1F+QjY+k4w3VNxLiP+HrQ0In31+xJX/OS8wopUteVDAJ4QrfX9Y9qkAqjUXPbq
         TODaop896QMynRAgMOrGaRSw9tc6UjMj+XrvugysfTXSAX/YHdZvixDwGS0zkcUYqG3h
         ELt0An3KjLPjglmChhN3aAwJxzmm03D6RQtY/NulSTL/ah11zqdjTJVV365iR4qEMP8S
         GZP7bILIkorlQCuolYEwMXMYkXHW3fmW/mb+lgOv5+gz2QKtY1+CjmloNFNsRtpd3eZ/
         7s4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=glUyis9sidf43iytDo4T3rzoUgrFULKI+XIP2P81fx0=;
        b=HN6nldCtmf+1+krdn3vm2oi/ISojLLE7A2LlWhxQwxH1GdEXkURNB4sT/4NgGtIbN5
         6138e7RO3QOhb8Wor0h4CapY0QiZdek+aMYdoGBYfQqxkMC4RzTVg2T8oyf7CSHAdn9W
         zHcdTbVCi5bac3/eDDt3tmTZ3F5h0yL4XV2yzVf8FkZ2iZ+HHeTd484uRDmbEcLVFhFM
         72qB+/JFVV5YG4hdDkm9OkHbAeuXQs7p61n/KVWjYgUiRqZMt7exLWKwudwv8Mu+mFDA
         BJJCZjWz5HjmmuPqU4cRGWodSt4Q0J+b2FcDvt63hWXExDjpvUnBXC3YQj6yFZBJekVg
         0Lqw==
X-Gm-Message-State: AOAM530PypFhmqgTJ+2RrRS5A80svLqiKaCqtvpuSxvt+VEto2rut2Qj
        ZXD8Ic9PdSkYt3LM3rftYRLXclBnwuBOIA==
X-Google-Smtp-Source: ABdhPJwfT1r0+TPU3rj2g7+Hpa3+5aaorvuenNEI3LTeu8gXvw4PA4lbTxxNcOcCKA93aO6IWyhITQ==
X-Received: by 2002:a65:6286:: with SMTP id f6mr5515602pgv.32.1600817817608;
        Tue, 22 Sep 2020 16:36:57 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q10sm3187417pja.48.2020.09.22.16.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 16:36:56 -0700 (PDT)
Message-ID: <5f6a8a98.1c69fb81.91361.89f7@mx.google.com>
Date:   Tue, 22 Sep 2020 16:36:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
X-Kernelci-Kernel: v5.9-rc1-32-g36eccdb58fb5
Subject: linusw/devel baseline: 90 runs,
 5 regressions (v5.9-rc1-32-g36eccdb58fb5)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 90 runs, 5 regressions (v5.9-rc1-32-g36eccdb58fb5)

Regressions Summary
-------------------

platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
mt8173-elm-hana        | arm64 | lab-collabora | gcc-8    | defconfig      =
    | 0/1    =

panda                  | arm   | lab-collabora | gcc-8    | multi_v7_defcon=
fig | 4/5    =

rk3399-gru-kevin       | arm64 | lab-collabora | gcc-8    | defconfig      =
    | 84/88  =

sun50i-a64-pine64-plus | arm64 | lab-baylibre  | gcc-8    | defconfig      =
    | 0/1    =

sun7i-a20-cubieboard2  | arm   | lab-baylibre  | gcc-8    | multi_v7_defcon=
fig | 0/1    =


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/v5.9-r=
c1-32-g36eccdb58fb5/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: v5.9-rc1-32-g36eccdb58fb5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      36eccdb58fb55d2bea6a0e62932e4d7e5192d409 =



Test Regressions
---------------- =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
mt8173-elm-hana        | arm64 | lab-collabora | gcc-8    | defconfig      =
    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6a7f57850e2d08f3bf9dbe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-32-g36ec=
cdb58fb5/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-32-g36ec=
cdb58fb5/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6a7f57850e2d08f3bf9=
dbf
      failing since 25 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.9-rc1-10-gfeeaefd378ca)  =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
panda                  | arm   | lab-collabora | gcc-8    | multi_v7_defcon=
fig | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f6a808bc921fa1088bf9db3

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-32-g36ec=
cdb58fb5/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-32-g36ec=
cdb58fb5/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f6a808bc921fa1=
088bf9db9
      failing since 25 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.9-rc1-10-gfeeaefd378ca)
      60 lines

    2020-09-22 22:53:56.089000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-09-22 22:53:56.095000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-09-22 22:53:56.102000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-09-22 22:53:56.108000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-09-22 22:53:56.113000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-09-22 22:53:56.119000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-09-22 22:53:56.125000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-09-22 22:53:56.131000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-09-22 22:53:56.137000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    2020-09-22 22:53:56.143000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80b
    ... (49 line(s) more)
      =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
rk3399-gru-kevin       | arm64 | lab-collabora | gcc-8    | defconfig      =
    | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f6a80f5f6fcdc4b0ebf9dbd

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-32-g36ec=
cdb58fb5/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-32-g36ec=
cdb58fb5/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f6a80f5f6fcdc4b0ebf9df9
      failing since 25 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.9-rc1-10-gfeeaefd378ca)

    2020-09-22 22:55:44.290000  /lava-2645214/1/../bin/lava-test-case
      =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
sun50i-a64-pine64-plus | arm64 | lab-baylibre  | gcc-8    | defconfig      =
    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6a7ff782e79863d8bf9dc1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-32-g36ec=
cdb58fb5/arm64/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus=
.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-32-g36ec=
cdb58fb5/arm64/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6a7ff782e79863d8bf9=
dc2
      failing since 22 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.9-rc1-10-gfeeaefd378ca)  =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
sun7i-a20-cubieboard2  | arm   | lab-baylibre  | gcc-8    | multi_v7_defcon=
fig | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6a812be8427fe47fbf9db3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-32-g36ec=
cdb58fb5/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubie=
board2.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-32-g36ec=
cdb58fb5/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubie=
board2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6a812be8427fe47fbf9=
db4
      failing since 10 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.9-rc1-15-g0a2d411b56b7)  =20
