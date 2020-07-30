Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF438232BD8
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jul 2020 08:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbgG3GSj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jul 2020 02:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbgG3GSj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jul 2020 02:18:39 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED246C061794
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2020 23:18:38 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id y206so4142323pfb.10
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2020 23:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=d8auDQtVJ6g8+X+wsH2Ftstts02RQy9VV52Da88trrY=;
        b=0Lgt/huEmIGA0sjRscZpOZ/Xt6vG6kHlLOQ0EbAp6YyKYdevdWhrwqk/O641V5rGWG
         PIRRV+TDR/C1IN+KRlS3ETD4PeJcq+lPP9pB03uHi2AfthQisVNa4r3xmoav+5dP3A8A
         xh3RHA56w/tBaHz7LmdTUz0afK4/kcVfFef07vOQWCd2jlTFkGBbeRMn81cOgmgeEInd
         uzG+0GLUxBAJ7IkZmrD5ZwEH6iXawpzJWLj7W6sWvM8fBTTIeX5m1T55r3PrYm0M3+ir
         OdDKn/Tjq48wBHJ0sZYUk4X3bbMlhmGJeapmNj0JY9uhM73LQOdI9orQJWtdAmTpQuuk
         Yehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=d8auDQtVJ6g8+X+wsH2Ftstts02RQy9VV52Da88trrY=;
        b=FfdlbU7smVm8YqUATVz0hCPUJenBGNN/z313u0+ujm6ANcmE2AxdRGwWOgXQfgGNLh
         Vdoam61MOZRwhBhu/0xGhLzakMqd7hIXGO5CkqCC2jDM5Y7v7O5e0yv6/0xlHcrX6CG9
         X17mOBMQE+VOGaNudxwC3RdgyeLVzcS2XZE/hhbnQVJvBbnhCyBM39xDLcBBOcyqrbsB
         MCtdWKSBvqfPd5mirkbx6VwKBI1ZbUj+w7V90rZkGhVEfW8jW9KHkkhV0tiPA3Ywglmz
         HLgi+od/XZpSGB3K93P6N4pzQl+8YPXM+DQbo0JkaCVZXSHLDwNPjCZr+sPydp88qR96
         dYoA==
X-Gm-Message-State: AOAM533g87L9+sglC0IXarPhFRZJd4QQHk/elFVEbInXOSBwCf9zlDbo
        pwuPHQFmTGkf7AIoOpwI/fXN32hRB48=
X-Google-Smtp-Source: ABdhPJx0ud/uHEfaNtE+F1u8pEgWFRMRML24+/6cRYLXQzQSamsdlUCRCgTM1FNGt5X3MvJrYjfqcQ==
X-Received: by 2002:a63:5412:: with SMTP id i18mr33913005pgb.63.1596089918058;
        Wed, 29 Jul 2020 23:18:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r25sm4270640pgv.88.2020.07.29.23.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 23:18:37 -0700 (PDT)
Message-ID: <5f22663d.1c69fb81.e207d.d075@mx.google.com>
Date:   Wed, 29 Jul 2020 23:18:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: gpio-v5.8-2-97-gb470cef1ffac
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
Subject: linusw/for-next baseline: 117 runs,
 9 regressions (gpio-v5.8-2-97-gb470cef1ffac)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 117 runs, 9 regressions (gpio-v5.8-2-97-gb470cef1=
ffac)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efconfig | 0/1    =

bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig =
         | 4/5    =

hifive-unleashed-a00         | riscv | lab-baylibre | gcc-8    | defconfig =
         | 0/1    =

imx6q-var-dt6customboard     | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efconfig | 3/5    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig =
         | 4/5    =

omap3-beagle-xm              | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efconfig | 0/1    =

qemu_i386                    | i386  | lab-baylibre | gcc-8    | i386_defco=
nfig     | 0/1    =

qemu_i386-uefi               | i386  | lab-baylibre | gcc-8    | i386_defco=
nfig     | 0/1    =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/gpi=
o-v5.8-2-97-gb470cef1ffac/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: gpio-v5.8-2-97-gb470cef1ffac
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      b470cef1ffac1acc327fe3343a2ce3ef3a526a21 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efconfig | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f225cf91b5acf979852c1d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-97=
-gb470cef1ffac/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama=
5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-97=
-gb470cef1ffac/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama=
5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f225cf91b5acf979852c=
1d2
      failing since 2 days (last pass: v5.8-rc5-96-ge80c35d808ef, first fai=
l: gpio-v5.8-2-96-ga070bdbbb06d) =



platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig =
         | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f225846061d827d4a52c1cc

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-97=
-gb470cef1ffac/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.=
txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-97=
-gb470cef1ffac/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f225846061d827d=
4a52c1cf
      failing since 13 days (last pass: gpio-v5.8-2-58-g1752911c6d10, first=
 fail: v5.8-rc5-68-geb211a587e18)
      2 lines =



platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
hifive-unleashed-a00         | riscv | lab-baylibre | gcc-8    | defconfig =
         | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f22591a933e770c4252c1c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-97=
-gb470cef1ffac/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed=
-a00.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-97=
-gb470cef1ffac/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed=
-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f22591a933e770c4252c=
1c3
      failing since 2 days (last pass: v5.8-rc5-96-ge80c35d808ef, first fai=
l: gpio-v5.8-2-96-ga070bdbbb06d) =



platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
imx6q-var-dt6customboard     | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efconfig | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f225c3140d0273e1052c1b0

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-97=
-gb470cef1ffac/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var=
-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-97=
-gb470cef1ffac/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var=
-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f225c3140d0273=
e1052c1b4
      new failure (last pass: gpio-v5.8-2-96-ga070bdbbb06d)
      4 lines* baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f22=
5c3140d0273e1052c1b5
      new failure (last pass: gpio-v5.8-2-96-ga070bdbbb06d)
      54 lines =



platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig =
         | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f2258b47b4875de1352c1c3

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-97=
-gb470cef1ffac/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-=
libretech-ac.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-97=
-gb470cef1ffac/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-=
libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f2258b47b4875d=
e1352c1c8
      new failure (last pass: gpio-v5.8-2-96-ga070bdbbb06d)
      2 lines =



platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
omap3-beagle-xm              | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efconfig | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f225cf5629fc1220e52c1d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-97=
-gb470cef1ffac/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap3-bea=
gle-xm.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-97=
-gb470cef1ffac/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap3-bea=
gle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f225cf5629fc1220e52c=
1d1
      new failure (last pass: gpio-v5.8-2-96-ga070bdbbb06d) =



platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
qemu_i386                    | i386  | lab-baylibre | gcc-8    | i386_defco=
nfig     | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2258a172f860aee452c1b3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-97=
-gb470cef1ffac/i386/i386_defconfig/gcc-8/lab-baylibre/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-97=
-gb470cef1ffac/i386/i386_defconfig/gcc-8/lab-baylibre/baseline-qemu_i386.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/x86/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2258a172f860aee452c=
1b4
      new failure (last pass: gpio-v5.8-2-96-ga070bdbbb06d) =



platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
qemu_i386-uefi               | i386  | lab-baylibre | gcc-8    | i386_defco=
nfig     | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2258a6b4b07ef01852c1cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-97=
-gb470cef1ffac/i386/i386_defconfig/gcc-8/lab-baylibre/baseline-qemu_i386-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-97=
-gb470cef1ffac/i386/i386_defconfig/gcc-8/lab-baylibre/baseline-qemu_i386-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/x86/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2258a6b4b07ef01852c=
1d0
      new failure (last pass: gpio-v5.8-2-96-ga070bdbbb06d) =20
