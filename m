Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7AAB285EE8
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Oct 2020 14:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728166AbgJGMRG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Oct 2020 08:17:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727978AbgJGMRG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Oct 2020 08:17:06 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56C51C061755
        for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2020 05:17:04 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id ds1so937306pjb.5
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2020 05:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=pejYK12jzdixKtRsfo/Lx1wxpEtsuZ7hx5VSQChzuGc=;
        b=vSXim/ftZ9pWCFPF2YZXoKzhFXHSq/18e/tbhONUNfA16a/Va6GoEppXCISxM0/1LQ
         ED1hZ9bIY+rnHhMRQLfyY8CBBsn+BrXcFu70OuBpF8B7VL5zFr1HGV8XFL2kXaE+oB16
         a15YInQyWYdxq//TB7gZTc2IJf++xZYCEPCinf+hWrG1pOEklVZFKQPwlW0hbTyUUhxJ
         YXgC23C9sE8FiGZ9DcVZ4In3rIClAK4+kEav4mOR/X4VWls0wXL3GhK4BZHEyYPrM8nw
         3xzVEo0lFxnHBHSfVPfJUY/IoJshA88VA1c4bANUto9nNSiJJSx9MfirSNEn5xpOfG96
         BSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=pejYK12jzdixKtRsfo/Lx1wxpEtsuZ7hx5VSQChzuGc=;
        b=rOldgHQrf5BzurR9/Sisz1eWUMdcf9d2UDq/I8d7VK9xBuRUfmE/2AfzQpFrE2rkgY
         0xP1rUDm71+Bxf9kadaubneCg2OG2gi1UKrpdDDY4H3VuZ15vWAjY/IYUAqgiQCUvW2b
         UiKCxLYgH+PnlX5Qh9uFBGGiGwvSNSuRlINJuMefghWUsG5vI0CWq3G7WmI6sHjTQmR1
         mlrThwoTtWNHF69cb9294Aog8TlBhR1IFhBNYX305oMvDY+EkRd72eyXddx6vsgUGIoj
         vDD7UWKGpz6CiAUjpva8Po9lJ1DWk0kebCqXKJj2lu0gmRBmOm14h1HffNNO5jFPI1XY
         p5wg==
X-Gm-Message-State: AOAM532pnOS9zogZIU68dQdHHicEpWPz/UPWxwJ0dHWdU9FpF05Vlo0v
        z4Ve0aMZDMsNDXVtLxIeADDDmm5IPsGj/Q==
X-Google-Smtp-Source: ABdhPJwk4DGqsBhrVqvazayhHXKTSDZ6LDGEJjLW/c8gaVAPuDEPlbeU+8CgEG84xImHrlSBjiZj3g==
X-Received: by 2002:a17:902:ac92:b029:d3:d575:e464 with SMTP id h18-20020a170902ac92b02900d3d575e464mr2689187plr.28.1602073023415;
        Wed, 07 Oct 2020 05:17:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ob8sm1642542pjb.54.2020.10.07.05.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 05:17:02 -0700 (PDT)
Message-ID: <5f7db1be.1c69fb81.6772.294e@mx.google.com>
Date:   Wed, 07 Oct 2020 05:17:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-rc1-76-g2edd92f8b6a3
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
Subject: linusw/devel baseline: 87 runs,
 5 regressions (v5.9-rc1-76-g2edd92f8b6a3)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 87 runs, 5 regressions (v5.9-rc1-76-g2edd92f8b6a3)

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
    | 89/90  =

sun50i-a64-pine64-plus | arm64 | lab-baylibre  | gcc-8    | defconfig      =
    | 0/1    =

sun7i-a20-cubieboard2  | arm   | lab-baylibre  | gcc-8    | multi_v7_defcon=
fig | 0/1    =


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/v5.9-r=
c1-76-g2edd92f8b6a3/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: v5.9-rc1-76-g2edd92f8b6a3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      2edd92f8b6a3e60f7589bd6814e972e6ebf7177c =



Test Regressions
---------------- =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
mt8173-elm-hana        | arm64 | lab-collabora | gcc-8    | defconfig      =
    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f7da271c37d5885f14ff3e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-76-g2edd=
92f8b6a3/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-76-g2edd=
92f8b6a3/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f7da271c37d5885f14ff=
3ea
      failing since 39 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.9-rc1-10-gfeeaefd378ca)  =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
panda                  | arm   | lab-collabora | gcc-8    | multi_v7_defcon=
fig | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f7da1281fd06e273d4ff3e0

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-76-g2edd=
92f8b6a3/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-76-g2edd=
92f8b6a3/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f7da1281fd06e2=
73d4ff3e6
      failing since 39 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.9-rc1-10-gfeeaefd378ca)
      60 lines

    2020-10-07 11:06:10.798000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-10-07 11:06:10.803000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-10-07 11:06:10.810000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-10-07 11:06:10.816000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-10-07 11:06:10.821000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-10-07 11:06:10.827000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-10-07 11:06:10.833000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-10-07 11:06:10.839000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-10-07 11:06:10.845000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    2020-10-07 11:06:10.851000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80b
    ... (49 line(s) more)
      =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
rk3399-gru-kevin       | arm64 | lab-collabora | gcc-8    | defconfig      =
    | 89/90  =


  Details:     https://kernelci.org/test/plan/id/5f7da1a3dff19202a54ff3e4

  Results:     89 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-76-g2edd=
92f8b6a3/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-76-g2edd=
92f8b6a3/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f7da1a3dff19202a54ff422
      failing since 39 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.9-rc1-10-gfeeaefd378ca)

    2020-10-07 11:08:15.192000  /lava-2699623/1/../bin/lava-test-case
    2020-10-07 11:08:15.204000  <8>[   50.536538] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-pcie-probed RESULT=3Dfail>
      =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
sun50i-a64-pine64-plus | arm64 | lab-baylibre  | gcc-8    | defconfig      =
    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f7da2f3499743d3e54ff408

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-76-g2edd=
92f8b6a3/arm64/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus=
.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-76-g2edd=
92f8b6a3/arm64/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f7da2f3499743d3e54ff=
409
      failing since 36 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.9-rc1-10-gfeeaefd378ca)  =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
sun7i-a20-cubieboard2  | arm   | lab-baylibre  | gcc-8    | multi_v7_defcon=
fig | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f7da1ce5d02a3ba1a4ff3f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-76-g2edd=
92f8b6a3/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubie=
board2.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-76-g2edd=
92f8b6a3/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubie=
board2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f7da1ce5d02a3ba1a4ff=
3f8
      failing since 24 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.9-rc1-15-g0a2d411b56b7)  =20
