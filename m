Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8482701AE1
	for <lists+linux-gpio@lfdr.de>; Sun, 14 May 2023 01:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232713AbjEMXrN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 May 2023 19:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjEMXrN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 13 May 2023 19:47:13 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7D3B10D3
        for <linux-gpio@vger.kernel.org>; Sat, 13 May 2023 16:47:11 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-643465067d1so8383464b3a.0
        for <linux-gpio@vger.kernel.org>; Sat, 13 May 2023 16:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1684021631; x=1686613631;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aWq/hUazQVebIbOtV54Zp6QVerf1a/6l/sslS+GQxJU=;
        b=4ZIcXfVWMD4vj6XQkJQ4AneAOylG4YEaU5RGT61F997jQd1JiPWJVEkd0ez8fU+gfy
         lCo4DHcA0wVETjJIBv5I/1deYQo/JXSvwnJ7GSsytZlxfvzeV694htsKT6eLyWwIQyFu
         OPSv19UgmtUSwXP7xMqKIQyan4WgEVg/0EPuMI/aeSvLSqhePRnr9+Yt6rJYZEtqWzXO
         /Qap2cIXhf6sZ8ogOs4y+W11V5DkBVzx4uHieGLhQ5Ao6xNflMbpv9SYWx3NlU11gRM3
         vfms3OMAtM+4eGvFgFMwsX2wTjg3+xY2RbDdCTFsapXUeHdVSG+KQ00UsYH4kVc8Q1UX
         bULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684021631; x=1686613631;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWq/hUazQVebIbOtV54Zp6QVerf1a/6l/sslS+GQxJU=;
        b=hXdwPXaJ2/CeVEH/LlFboPoJXP4HU+2aaoNLa4XORggRfvEhmtgF/hjKK2l7IlEGZ0
         IGEJn8qFeaYre9CtXXHuVdsqotFHBBBw6kHjVGUW52IODNQqfjan8lhaOXNKpa0/OrpF
         mJexj+li2cpZqM9imGC34FCV7GJwauBCsQBb8DvO2brlMEAF7nwctwouJ/4UF5Vpz/O3
         gdKUiSeko9298VnHuZb0xwtwzLQ3oReC9tES1PbI7m+haplGQ7Lqt5tFFFhbWQVgrb/x
         o86EnWjCZyNts+V01ptO6s6+SAX1p+6x83FmeYP7OyUiBEgqX7hjOaFpRUsKgnNK/HQS
         zlJQ==
X-Gm-Message-State: AC+VfDxy7VthJhw0JlroKxpFXDdrFViw/JsqkWVDlQAhey62On8YEoHh
        g3SLwX5GNb6AhDiQSthhsBXXB9doh8X+ifd0iRY=
X-Google-Smtp-Source: ACHHUZ517MgoqIsq8v5VeAsA1nMVrtcm2OrvsOTN7y05s5BKgW9zvnZCTsWAcbK9HNfOAzgXD5OTig==
X-Received: by 2002:a05:6a20:3d87:b0:101:e680:d423 with SMTP id s7-20020a056a203d8700b00101e680d423mr19019708pzi.28.1684021630787;
        Sat, 13 May 2023 16:47:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j22-20020aa783d6000000b0062d7c0ccb3asm9143997pfn.103.2023.05.13.16.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 16:47:10 -0700 (PDT)
Message-ID: <6460217e.a70a0220.64b5c.34aa@mx.google.com>
Date:   Sat, 13 May 2023 16:47:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v6.2-rc1
X-Kernelci-Report-Type: test
Subject: linusw/devel baseline: 36 runs, 6 regressions (v6.2-rc1)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 36 runs, 6 regressions (v6.2-rc1)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
imx6q-sabrelite   | arm   | lab-collabora | gcc-10   | multi_v7_defconfig |=
 1          =

rk3288-veyron-jaq | arm   | lab-collabora | gcc-10   | multi_v7_defconfig |=
 4          =

rk3399-rock-pi-4b | arm64 | lab-collabora | gcc-10   | defconfig          |=
 1          =


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/v6.2-r=
c1/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: v6.2-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      1b929c02afd37871d5afb9d498426f83432e71c2 =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
imx6q-sabrelite   | arm   | lab-collabora | gcc-10   | multi_v7_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/646016662b68b934c22e85e6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//linusw/devel/v6.2-rc1/arm/mult=
i_v7_defconfig/gcc-10/lab-collabora/baseline-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v6.2-rc1/arm/mult=
i_v7_defconfig/gcc-10/lab-collabora/baseline-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646016662b68b934c22e85eb
        new failure (last pass: v6.1-rc1)

    2023-05-13T22:59:44.997904  / # #

    2023-05-13T22:59:45.100015  export SHELL=3D/bin/sh

    2023-05-13T22:59:45.100809  #

    2023-05-13T22:59:45.202635  / # export SHELL=3D/bin/sh. /lava-10309524/=
environment

    2023-05-13T22:59:45.203432  =


    2023-05-13T22:59:45.305151  / # . /lava-10309524/environment/lava-10309=
524/bin/lava-test-runner /lava-10309524/1

    2023-05-13T22:59:45.306461  =


    2023-05-13T22:59:45.320434  / # /lava-10309524/bin/lava-test-runner /la=
va-10309524/1

    2023-05-13T22:59:45.418373  + export 'TESTRUN_ID=3D1_bootrr'

    2023-05-13T22:59:45.418925  + cd /lava-10309524/1/tests/1_bootrr
 =

    ... (15 line(s) more)  =

 =



platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-10   | multi_v7_defconfig |=
 4          =


  Details:     https://kernelci.org/test/plan/id/64601660f3e6ed4cf62e85e7

  Results:     66 PASS, 4 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//linusw/devel/v6.2-rc1/arm/mult=
i_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v6.2-rc1/arm/mult=
i_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.dwhdmi-rockchip-driver-i2c-present: https://kernelci.or=
g/test/case/id/64601660f3e6ed4cf62e8616
        new failure (last pass: v6.1-rc1)

    2023-05-13T22:59:20.632456  	-s SE<8>[   21.278246] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Ddwhdmi-rockchip-driver-cec-present RESULT=3Dfail>

    2023-05-13T22:59:20.634295  P	String separator

    2023-05-13T22:59:20.638173  /lava-10309528/1/../bin/lava-test-case

    2023-05-13T22:59:20.644260  BusyBox v1.31.1 (2023-04-21 13:14:56 UTC) m=
ulti-call binary.

    2023-05-13T22:59:20.644484  =


    2023-05-13T22:59:20.649004  Usage: seq [-w] [-s SEP] [FIRST [INC]] LAST

    2023-05-13T22:59:20.649056  =


    2023-05-13T22:59:20.654099  Print numbers from FIRST to LAST, in steps =
of INC.

    2023-05-13T22:59:20.656522  FIRST, INC default to 1.

    2023-05-13T22:59:20.656737  =

 =

    ... (2 line(s) more)  =


  * baseline.bootrr.dwhdmi-rockchip-driver-cec-present: https://kernelci.or=
g/test/case/id/64601660f3e6ed4cf62e8617
        new failure (last pass: v6.1-rc1)

    2023-05-13T22:59:20.610197  Usage: seq [-w] [-s SEP] [FIRST [INC]] LA<8=
>[   21.250920] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Ddwhdmi-rockchip-driver=
-audio-present RESULT=3Dfail>

    2023-05-13T22:59:20.610412  ST

    2023-05-13T22:59:20.610625  =


    2023-05-13T22:59:20.615648  Print numbers from FIRST to LAST, in steps =
of INC.

    2023-05-13T22:59:20.618167  FIRST, INC default to 1.

    2023-05-13T22:59:20.618387  =


    2023-05-13T22:59:20.621859  	-w	Pad to last with leading zeros
   =


  * baseline.bootrr.dwhdmi-rockchip-driver-audio-present: https://kernelci.=
org/test/case/id/64601660f3e6ed4cf62e8618
        new failure (last pass: v6.1-rc1)

    2023-05-13T22:59:20.580553  <8>[   21.228792] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwhdmi-rockchip-probed RESULT=3Dpass>

    2023-05-13T22:59:20.595708  BusyBox v1.31.1 (2023-04-21 13:14:56 UTC) m=
ulti-call binary.

    2023-05-13T22:59:20.596088  =

   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64601660f3e6ed4cf62e862c
        new failure (last pass: v6.1-rc1)

    2023-05-13T22:59:08.162071  <8>[    8.808981] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>

    2023-05-13T22:59:08.167643  + set +x

    2023-05-13T22:59:08.174478  <8>[    8.823518] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10309528_1.5.2.3.1>

    2023-05-13T22:59:08.280547  =


    2023-05-13T22:59:08.381387  / # #export SHELL=3D/bin/sh

    2023-05-13T22:59:08.382124  =


    2023-05-13T22:59:08.483481  / # export SHELL=3D/bin/sh. /lava-10309528/=
environment

    2023-05-13T22:59:08.484164  =


    2023-05-13T22:59:08.585393  / # . /lava-10309528/environment/lava-10309=
528/bin/lava-test-runner /lava-10309528/1

    2023-05-13T22:59:08.586397  =

 =

    ... (12 line(s) more)  =

 =



platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3399-rock-pi-4b | arm64 | lab-collabora | gcc-10   | defconfig          |=
 1          =


  Details:     https://kernelci.org/test/plan/id/6460177e96bca0c5662e8608

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//linusw/devel/v6.2-rc1/arm64/de=
fconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v6.2-rc1/arm64/de=
fconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6460177e96bca0c5662e860d
        new failure (last pass: v6.1-rc1)

    2023-05-13T23:04:14.251747  / # #

    2023-05-13T23:04:14.354206  export SHELL=3D/bin/sh

    2023-05-13T23:04:14.354928  #

    2023-05-13T23:04:14.456806  / # export SHELL=3D/bin/sh. /lava-10309555/=
environment

    2023-05-13T23:04:14.457577  =


    2023-05-13T23:04:14.559475  / # . /lava-10309555/environment/lava-10309=
555/bin/lava-test-runner /lava-10309555/1

    2023-05-13T23:04:14.560604  =


    2023-05-13T23:04:14.574664  / # /lava-10309555/bin/lava-test-runner /la=
va-10309555/1

    2023-05-13T23:04:14.627684  + export 'TESTRUN_ID=3D1_bootrr'

    2023-05-13T23:04:14.628202  + cd /lava-10309555/1/tests/1_bootrr
 =

    ... (11 line(s) more)  =

 =20
