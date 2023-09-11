Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D419379BAFB
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 02:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241052AbjIKU4u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Sep 2023 16:56:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236754AbjIKLVH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Sep 2023 07:21:07 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 438BECDD
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 04:21:02 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6c0f4ad9eb1so166013a34.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 04:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1694431261; x=1695036061; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AYfA7DXc23G6ybVpO85ZBVeWKUdxoWBlG9IbLmRfDhY=;
        b=B8BU56Zbmijyxm79eYAl9A4DcoO70gK593YL0WmwMfXXmKo95eQOer5c9HfiizbfX0
         sd2H7dyrtQtwy3QCBG+QY9vaZtwT20S/beLJKkgHiYv8RfAQZ72XokMIczR/qVct98Nb
         B2Zg7Jjvfu03yIQC+X0v/s7WWo/aYzooNDl9VXklhQtJxaWK3SY4IYGMu31vBXqUlvva
         xTjBbKveU610ZeqEiCYWC9c/lJYv96dCGeYQZ9LnLF9zie/5Fp0SWwWoFWy482LGMf+Y
         BfziUiYBCRx9EM+0IZohe3pyHYIsMo9tsKT/1dZCSPiEpfNPPIXCOj9pKmV/Q7jC4sCr
         88uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694431261; x=1695036061;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AYfA7DXc23G6ybVpO85ZBVeWKUdxoWBlG9IbLmRfDhY=;
        b=knF2+gb6Ig1eX+iOCMO3uirmIAtPA6uXhk5CE9x7ttE9mIFzQCvs+cETPXvHqSOffE
         uyx6+rCcU8m97t9xULAF6YtWugqyFY3KMq7rCUQVJNGJWfSaHEGSmet5y9hIW5OMvDoh
         bI8m9bEUwotCpzweWcbdGnH4JJy0RrYgNPA8VdKxYr1JOjAOhAS0U5TQaO/vx56K4UkK
         8hmZUionsmINGOxls5zdzUZwWg7ZBFlnCxZXvuCg4MtcFBAPWmFbpT/ZAI5wGf6qsBAt
         awSp9u25u27xUZ5X84fyNLcl8OvWIFcrPUpkch3hScfDJTtqh5OgrjbS0UJuYGnNDYK7
         ZJyA==
X-Gm-Message-State: AOJu0YwOPZJgIcMiGuSYytbxOXbZZxKk3zSQngBkl1ewdTrEtphrDAIi
        683+g0KfczvVkt6FSDPrBjgO23FhnQPqXtCxqgU=
X-Google-Smtp-Source: AGHT+IFR0mVfuRw9ml7/rou5ze89HO/t5CVPBvpttvHIgvosv/w7j4NfOaabliN345UZAi4ja02DHQ==
X-Received: by 2002:a9d:7752:0:b0:6bd:af4:274d with SMTP id t18-20020a9d7752000000b006bd0af4274dmr11115357otl.8.1694431261112;
        Mon, 11 Sep 2023 04:21:01 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id f13-20020aa78b0d000000b0068c10187dc3sm5399128pfd.168.2023.09.11.04.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 04:21:00 -0700 (PDT)
Message-ID: <64fef81c.a70a0220.c89bc.c0e8@mx.google.com>
Date:   Mon, 11 Sep 2023 04:21:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.6-rc1
Subject: linusw/fixes baseline: 46 runs, 4 regressions (v6.6-rc1)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes baseline: 46 runs, 4 regressions (v6.6-rc1)

Regressions Summary
-------------------

platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
juno-uboot         | arm64 | lab-broonie   | gcc-10   | defconfig | 1      =
    =

r8a77960-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =

rk3399-rock-pi-4b  | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =

sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/linusw/branch/fixes/kernel/v6.6-r=
c1/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   fixes
  Describe: v6.6-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      0bb80ecc33a8fb5a682236443c1e740d5c917d1d =



Test Regressions
---------------- =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
juno-uboot         | arm64 | lab-broonie   | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/64fef35507a67209e5286d6c

  Results:     60 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v6.6-rc1/arm64/de=
fconfig/gcc-10/lab-broonie/baseline-juno-uboot.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v6.6-rc1/arm64/de=
fconfig/gcc-10/lab-broonie/baseline-juno-uboot.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64fef35507a67209e5286da9
        new failure (last pass: v6.1-rc1)

    2023-09-11T11:00:23.565747  / # #
    2023-09-11T11:00:23.668843  export SHELL=3D/bin/sh
    2023-09-11T11:00:23.669668  #
    2023-09-11T11:00:23.771713  / # export SHELL=3D/bin/sh. /lava-99073/env=
ironment
    2023-09-11T11:00:23.772494  =

    2023-09-11T11:00:23.874503  / # . /lava-99073/environment/lava-99073/bi=
n/lava-test-runner /lava-99073/1
    2023-09-11T11:00:23.875867  =

    2023-09-11T11:00:23.888781  / # /lava-99073/bin/lava-test-runner /lava-=
99073/1
    2023-09-11T11:00:23.956041  + export 'TESTRUN_ID=3D1_bootrr'
    2023-09-11T11:00:23.956582  + cd /lava-99073/1/tests/1_bootrr =

    ... (40 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a77960-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/64feede30a536f95e6286e8a

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v6.6-rc1/arm64/de=
fconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v6.6-rc1/arm64/de=
fconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64feede30a536f95e6286e93
        new failure (last pass: v6.2-rc1)

    2023-09-11T10:41:29.940763  / # #

    2023-09-11T10:41:30.042887  export SHELL=3D/bin/sh

    2023-09-11T10:41:30.043598  #

    2023-09-11T10:41:30.144946  / # export SHELL=3D/bin/sh. /lava-11494033/=
environment

    2023-09-11T10:41:30.145591  =


    2023-09-11T10:41:30.246815  / # . /lava-11494033/environment/lava-11494=
033/bin/lava-test-runner /lava-11494033/1

    2023-09-11T10:41:30.247796  =


    2023-09-11T10:41:30.248963  / # /lava-11494033/bin/lava-test-runner /la=
va-11494033/1

    2023-09-11T10:41:30.313560  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-11T10:41:30.313688  + cd /lav<8>[   20.487117] <LAVA_SIGNAL_STA=
RTRUN 1_bootrr 11494033_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
rk3399-rock-pi-4b  | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/64feee118b891d5e83286d79

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v6.6-rc1/arm64/de=
fconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v6.6-rc1/arm64/de=
fconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64feee118b891d5e83286d82
        failing since 120 days (last pass: v6.1-rc1, first fail: v6.2-rc1)

    2023-09-11T10:38:04.730529  / # #

    2023-09-11T10:38:05.991177  export SHELL=3D/bin/sh

    2023-09-11T10:38:06.002126  #

    2023-09-11T10:38:06.002588  / # export SHELL=3D/bin/sh

    2023-09-11T10:38:07.745882  / # . /lava-11494028/environment

    2023-09-11T10:38:10.949972  /lava-11494028/bin/lava-test-runner /lava-1=
1494028/1

    2023-09-11T10:38:10.961329  . /lava-11494028/environment

    2023-09-11T10:38:10.965549  / # /lava-11494028/bin/lava-test-runner /la=
va-11494028/1

    2023-09-11T10:38:11.017560  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-11T10:38:11.018037  + cd /lava-11494028/1/tests/1_bootrr
 =

    ... (10 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/64feedf50a536f95e6286e99

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v6.6-rc1/arm64/de=
fconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v6.6-rc1/arm64/de=
fconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64feedf50a536f95e6286ea2
        new failure (last pass: v6.2-rc1)

    2023-09-11T10:41:40.240661  / # #

    2023-09-11T10:41:40.342745  export SHELL=3D/bin/sh

    2023-09-11T10:41:40.343479  #

    2023-09-11T10:41:40.444944  / # export SHELL=3D/bin/sh. /lava-11494021/=
environment

    2023-09-11T10:41:40.445658  =


    2023-09-11T10:41:40.547093  / # . /lava-11494021/environment/lava-11494=
021/bin/lava-test-runner /lava-11494021/1

    2023-09-11T10:41:40.548288  =


    2023-09-11T10:41:40.550483  / # /lava-11494021/bin/lava-test-runner /la=
va-11494021/1

    2023-09-11T10:41:40.633433  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-11T10:41:40.633937  + cd /lava-11494021/1/tests/1_boot<8>[   19=
.078338] <LAVA_SIGNAL_STARTRUN 1_bootrr 11494021_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
