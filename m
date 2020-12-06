Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4DE2D063C
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Dec 2020 18:17:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbgLFRQr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Dec 2020 12:16:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbgLFRQq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Dec 2020 12:16:46 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D9A9C0613D0
        for <linux-gpio@vger.kernel.org>; Sun,  6 Dec 2020 09:16:06 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id b5so2189428pjl.0
        for <linux-gpio@vger.kernel.org>; Sun, 06 Dec 2020 09:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=1IXEfuG+kTfx2TPAlBMbI3A/FPUkaQUmDquS/BYeWbI=;
        b=i2czBB891/nf+A1oHZ4obPADYTPlobEUEkB+sQLRj3UTAysfUrs+3EblnXuNh/B5vF
         CdYeKH3pJnp0e+dD4KQoFeI7Q4vNY3FqfjPC261KiAWYhIDOHQrOrDb3L7eQRu39nVVe
         BteqXU4ayVYYG8U+uDVpAmG9cNI1NeratT1uST9BYwT4GE/d4z3TZ0gZc3Dsk3eZkFbH
         mYaIG0G+/0imRfrTIep677E6Cm6Wd4oJgXC9tvMzLXvntOeqAfLUKD1vxLlkpV7j68Hz
         zvOGhJ8j7Vx92bvRAMtsm3mhpt0Mw1J4sVSeAjYcj3w81XuHr4Z8Xjr1dv/BBcEfmM8I
         yGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=1IXEfuG+kTfx2TPAlBMbI3A/FPUkaQUmDquS/BYeWbI=;
        b=mJBv4P8HWGetd6tyT+ts2dQLbFik44nt0CwIwhUUe+gVvuzeuTh1ulV+V5oN9Bf4Ih
         eI0QiLEq17dDR++1jiokIOhEB3U0ElyVBObzj+vinE57MPd3A0sNjjgJq4LOTBFpj3nV
         n8geAvI+Erb5CtnX8NG1uYinVctKVTAmRdMzTEkkQ14ON493ozP0ya21JZJIwJKvKnj2
         jteRQ6yEzvGafFhaAOymECowkufXRsTLLBO0ag+a9BWUTAkvkwEHG8K+Ci2O85mP7h46
         i9b8ajqzonSWvjAKD6Lf5jr/HcjIisLoSs3VwYwipbXjpnlfnylil02jNeaR+Ra2cQl6
         prhg==
X-Gm-Message-State: AOAM531+J+lsxLACs9B/xe/AHlOysN1R1bFSJJoe2scnczsPJ35cJNh7
        6HR6vw4mLeSV9OOKADRZ6aSHPSAn3a4xJw==
X-Google-Smtp-Source: ABdhPJzCG3B0kUBv7K5Fv0Zl29fHNi3QgcI2L0w1E7xIhxIEFVF5UHyCXr2ganRguDXBc6IzoI/sAw==
X-Received: by 2002:a17:902:b410:b029:d6:614b:679c with SMTP id x16-20020a170902b410b02900d6614b679cmr12349253plr.79.1607274965209;
        Sun, 06 Dec 2020 09:16:05 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w2sm11933310pfb.104.2020.12.06.09.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Dec 2020 09:16:04 -0800 (PST)
Message-ID: <5fcd11d4.1c69fb81.f43e3.b7b5@mx.google.com>
Date:   Sun, 06 Dec 2020 09:16:04 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.10-rc4-48-gdd0fa81143f6
X-Kernelci-Report-Type: test
Subject: linusw/devel baseline: 128 runs,
 5 regressions (v5.10-rc4-48-gdd0fa81143f6)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 128 runs, 5 regressions (v5.10-rc4-48-gdd0fa81143f6)

Regressions Summary
-------------------

platform                 | arch  | lab          | compiler | defconfig     =
     | regressions
-------------------------+-------+--------------+----------+---------------=
-----+------------
beagle-xm                | arm   | lab-baylibre | gcc-8    | multi_v7_defco=
nfig | 1          =

imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defco=
nfig | 2          =

imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig     =
     | 1          =

meson-gxm-q200           | arm64 | lab-baylibre | gcc-8    | defconfig     =
     | 1          =


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/v5.10-=
rc4-48-gdd0fa81143f6/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: v5.10-rc4-48-gdd0fa81143f6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      dd0fa81143f60cbc90cd6ce1c9a2c51a7b40046e =



Test Regressions
---------------- =



platform                 | arch  | lab          | compiler | defconfig     =
     | regressions
-------------------------+-------+--------------+----------+---------------=
-----+------------
beagle-xm                | arm   | lab-baylibre | gcc-8    | multi_v7_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/5fcd0890e0a312081ac94ccd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.10-rc4-48-gdd0=
fa81143f6/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.10-rc4-48-gdd0=
fa81143f6/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fcd0890e0a312081ac94=
cce
        new failure (last pass: v5.10-rc4-47-gc47d9e1b7343) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
     | regressions
-------------------------+-------+--------------+----------+---------------=
-----+------------
imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defco=
nfig | 2          =


  Details:     https://kernelci.org/test/plan/id/5fcd08ba8670f7726ec94cd7

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.10-rc4-48-gdd0=
fa81143f6/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6c=
ustomboard.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.10-rc4-48-gdd0=
fa81143f6/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6c=
ustomboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fcd08ba8670f77=
26ec94cdb
        new failure (last pass: v5.10-rc4-47-gc47d9e1b7343)
        4 lines

    2020-12-06 16:36:48.488000+00:00  kern  :alert : Unhandled fault: align=
ment exception (0x001) at 0xcec60217
    2020-12-06 16:36:48.489000+00:00  kern  :alert : pgd =3D (ptrval)
    2020-12-06 16:36:48.489000+00:00  kern  :alert : [cec60217] *pgd=3D1ec1=
141e(bad)   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fcd08ba8670f77=
26ec94cdc
        new failure (last pass: v5.10-rc4-47-gc47d9e1b7343)
        26 lines

    2020-12-06 16:36:48.531000+00:00  kern  :emerg : Process kworker/3:2 (p=
id: 79, stack limit =3D 0x(ptrval))
    2020-12-06 16:36:48.532000+00:00  kern  :emerg : Stack: (0xc325feb0 to =
0xc3260000)
    2020-12-06 16:36:48.532000+00:00  kern  :emerg : fea0:                 =
                    c34e0c00 ef7d25c0 c2100680 cec60217
    2020-12-06 16:36:48.532000+00:00  kern  :emerg : fec0: 00000000 0000000=
0 00000003 00000000 00000000 8521e6ba c38fa040 cec6008f
    2020-12-06 16:36:48.532000+00:00  kern  :emerg : fee0: cec6020f ef7d540=
0 00000000 c09b3998 fffffc84 fffffc84 c22e5c00 ef7d5400
    2020-12-06 16:36:48.574000+00:00  kern  :emerg : ff00: 00000000 c1a1ec6=
0 00000000 c09b3e80 c22e5da0 c328e680 ef7d21c0 c036077c
    2020-12-06 16:36:48.574000+00:00  kern  :emerg : ff20: c34e0c00 ef7d21c=
0 00000008 c328e680 c328e694 ef7d21c0 00000008 c1803d00
    2020-12-06 16:36:48.575000+00:00  kern  :emerg : ff40: ef7d21d8 ef7d21c=
0 ffffe000 c0360d68 c34e0c00 c1a1e357 c137fa24 c0360ac0
    2020-12-06 16:36:48.575000+00:00  kern  :emerg : ff60: c328e680 c25b704=
0 c328a880 00000000 c325e000 c0360ac0 c328e680 c215fea4
    2020-12-06 16:36:48.575000+00:00  kern  :emerg : ff80: c25b7064 c0366ee=
c 00000001 c328a880 c0366d9c 00000000 00000000 00000000 =

    ... (15 line(s) more)  =

 =



platform                 | arch  | lab          | compiler | defconfig     =
     | regressions
-------------------------+-------+--------------+----------+---------------=
-----+------------
imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig     =
     | 1          =


  Details:     https://kernelci.org/test/plan/id/5fcd095202d8fe82dec94d18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.10-rc4-48-gdd0=
fa81143f6/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.10-rc4-48-gdd0=
fa81143f6/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fcd095202d8fe82dec94=
d19
        failing since 0 day (last pass: v5.10-rc4-34-g0f2c7af45d7ee, first =
fail: v5.10-rc4-47-gc47d9e1b7343) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
     | regressions
-------------------------+-------+--------------+----------+---------------=
-----+------------
meson-gxm-q200           | arm64 | lab-baylibre | gcc-8    | defconfig     =
     | 1          =


  Details:     https://kernelci.org/test/plan/id/5fcd0725217bcb0d3ac94cd3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.10-rc4-48-gdd0=
fa81143f6/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.10-rc4-48-gdd0=
fa81143f6/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fcd0725217bcb0d3ac94=
cd4
        new failure (last pass: v5.10-rc4-47-gc47d9e1b7343) =

 =20
