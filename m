Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E67EF701ADD
	for <lists+linux-gpio@lfdr.de>; Sun, 14 May 2023 01:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229464AbjEMXgg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 May 2023 19:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjEMXgf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 13 May 2023 19:36:35 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC32D1725
        for <linux-gpio@vger.kernel.org>; Sat, 13 May 2023 16:36:33 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1ab05018381so104811345ad.2
        for <linux-gpio@vger.kernel.org>; Sat, 13 May 2023 16:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1684020993; x=1686612993;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4xEvLHkUbuXOmtEjQJFZbD5K8oikO/F4IWzZR83yTrY=;
        b=JFryy2Yg5oPE+sp+SYfp9k8GZ7nyY/LR2ggdh66lHZE0P1W6ZM/52e4kP/Ani/2L+2
         0H+KIB/Xp7tnoYI5CVwRZbO5LDdbXJUjUWHOSLuDAhCvXCQ0SeLAePTjr1Pwt6Q4iFHP
         uafOdQNE0nifideNS8GBom0wtraBt5T5N7R7SAjnrh9qx2573AUT6zBKgnudDGZgOKK5
         fDvP0iyTYH5F+MoajRN4D6629nf+RF90qyJW6rH7WDQzRD7vlQgZwxW4S/rRyxDWQYsg
         Le7Oqr0S9PPa7mVJZ5ZITJLwxxLfjcbtFJt8CeD26lNn0tcvW0cmHH7LLDbcgtJYkOEI
         fNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684020993; x=1686612993;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4xEvLHkUbuXOmtEjQJFZbD5K8oikO/F4IWzZR83yTrY=;
        b=JMeISlPexYDZ6TMfab5IgNolravQegIDbcM2SSsIwuc4SA7gHk6md6UfuUpdJmC37Q
         6Fel2yZ8AbQxxbsppHF4kgP2X0XNogPqHenZAnXqLCYU5S06+rzM89RJgTe/pTrsw+IB
         0rHWeyGdKldT8FO1++0so667aQZ6beGStCx7bIQaUk6Myub2K8RvmjRd0wO26wIwAmz0
         o1ghEIlRFJXdD367cmDtW/enVBHp7u/yjyjl9PHQCRx7PDi8sz65itxeP87Cum5Vzf+o
         CFlEf9cInu6+MjOn7Y/7hLx3nJOkCZTIeT8Xxcw7HQEicMyrjP9nDvReQIaW9XMgMHRQ
         9XMA==
X-Gm-Message-State: AC+VfDzktEqH3AhAzfU8itYJkfVBwPzZqIK81kkDnhoBXwaRp8Cqv1wB
        7TvHoONwqO16Zu9+gygLWDcbpmD+H2EL0e8xfNs=
X-Google-Smtp-Source: ACHHUZ4w4b9pDU3F1yOWhktc7y5yzKfk/eMoiUtR9/soJ7+hOQSDXAbhHKlbmQ3wh8JW0yR2n2dmHQ==
X-Received: by 2002:a17:902:b907:b0:1ac:84dd:6d1f with SMTP id bf7-20020a170902b90700b001ac84dd6d1fmr19982837plb.1.1684020992894;
        Sat, 13 May 2023 16:36:32 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h4-20020a170902704400b001aaf370b1c7sm10331949plt.278.2023.05.13.16.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 16:36:32 -0700 (PDT)
Message-ID: <64601f00.170a0220.b52f.4323@mx.google.com>
Date:   Sat, 13 May 2023 16:36:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v6.2-rc1
X-Kernelci-Report-Type: test
Subject: linusw/fixes baseline: 37 runs, 6 regressions (v6.2-rc1)
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

linusw/fixes baseline: 37 runs, 6 regressions (v6.2-rc1)

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


  Details:  https://kernelci.org/test/job/linusw/branch/fixes/kernel/v6.2-r=
c1/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   fixes
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


  Details:     https://kernelci.org/test/plan/id/6460139f00241484502e8661

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v6.2-rc1/arm/mult=
i_v7_defconfig/gcc-10/lab-collabora/baseline-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v6.2-rc1/arm/mult=
i_v7_defconfig/gcc-10/lab-collabora/baseline-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6460139f00241484502e8666
        new failure (last pass: v6.1-rc1)

    2023-05-13T22:47:53.488259  / # #

    2023-05-13T22:47:53.590952  export SHELL=3D/bin/sh

    2023-05-13T22:47:53.591677  #

    2023-05-13T22:47:53.693225  / # export SHELL=3D/bin/sh. /lava-10309460/=
environment

    2023-05-13T22:47:53.693998  =


    2023-05-13T22:47:53.795621  / # . /lava-10309460/environment/lava-10309=
460/bin/lava-test-runner /lava-10309460/1

    2023-05-13T22:47:53.796769  =


    2023-05-13T22:47:53.811466  / # /lava-10309460/bin/lava-test-runner /la=
va-10309460/1

    2023-05-13T22:47:53.908396  + export 'TESTRUN_ID=3D1_bootrr'

    2023-05-13T22:47:53.908931  + cd /lava-10309460/1/tests/1_bootrr
 =

    ... (15 line(s) more)  =

 =



platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-10   | multi_v7_defconfig |=
 4          =


  Details:     https://kernelci.org/test/plan/id/6460138f00241484502e8603

  Results:     66 PASS, 4 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v6.2-rc1/arm/mult=
i_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v6.2-rc1/arm/mult=
i_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.dwhdmi-rockchip-driver-i2c-present: https://kernelci.or=
g/test/case/id/6460138f00241484502e8632
        new failure (last pass: v6.1-rc1)

    2023-05-13T22:47:34.828715  Box v1.31.1 (2023-04-21 13:14:56 UTC) multi=
-call binary.

    2023-05-13T22:47:34.828977  =


    2023-05-13T22:47:34.833335  Usage: seq [-w] [-s SEP] [FIRST [INC]] LAST

    2023-05-13T22:47:34.833553  =


    2023-05-13T22:47:34.838536  Print numbers from FIRST to LAST, in steps =
of INC.

    2023-05-13T22:47:34.841364  FIRST, INC default to 1.

    2023-05-13T22:47:34.841423  =


    2023-05-13T22:47:34.844755  	-w	Pad to last with leading zeros

    2023-05-13T22:47:34.847374  	-s SEP	String separator

    2023-05-13T22:47:34.857878  /lava-1<8>[   20.103185] <LAVA_SIGNAL_TESTC=
ASE TEST_CASE_ID=3Ddwhdmi-rockchip-driver-i2c-present RESULT=3Dfail>
   =


  * baseline.bootrr.dwhdmi-rockchip-driver-cec-present: https://kernelci.or=
g/test/case/id/6460139000241484502e8633
        new failure (last pass: v6.1-rc1)

    2023-05-13T22:47:34.794780  Usage: seq [-w] [-s SEP] [FIRST [INC]] LA<8=
>[   20.039312] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Ddwhdmi-rockchip-driver=
-audio-present RESULT=3Dfail>

    2023-05-13T22:47:34.795002  ST

    2023-05-13T22:47:34.795217  =


    2023-05-13T22:47:34.800270  Print numbers from FIRST to LAST, in steps =
of INC.

    2023-05-13T22:47:34.802893  FIRST, INC default to 1.

    2023-05-13T22:47:34.803115  =


    2023-05-13T22:47:34.806356  	-w	Pad to last with leading zeros

    2023-05-13T22:47:34.808975  	-s SEP	String separator

    2023-05-13T22:47:34.812853  /lava-10309467/1/../bin/lava-test-case

    2023-05-13T22:47:34.823099  Busy<8>[   20.068901] <LAVA_SIGNAL_TESTCASE=
 TEST_CASE_ID=3Ddwhdmi-rockchip-driver-cec-present RESULT=3Dfail>
   =


  * baseline.bootrr.dwhdmi-rockchip-driver-audio-present: https://kernelci.=
org/test/case/id/6460139000241484502e8634
        new failure (last pass: v6.1-rc1)

    2023-05-13T22:47:34.780242  BusyBox v1.31.1 (2023-04-21 13:14:56 UTC) m=
ulti-call binary.

    2023-05-13T22:47:34.780488  =

   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6460139000241484502e8648
        new failure (last pass: v6.1-rc1)

    2023-05-13T22:47:22.347694  <8>[    7.597497] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>

    2023-05-13T22:47:22.351737  + set +x

    2023-05-13T22:47:22.358669  <8>[    7.610660] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10309467_1.5.2.3.1>

    2023-05-13T22:47:22.467701  #

    2023-05-13T22:47:22.468818  =


    2023-05-13T22:47:22.570449  / # #export SHELL=3D/bin/sh

    2023-05-13T22:47:22.571155  =


    2023-05-13T22:47:22.672537  / # export SHELL=3D/bin/sh. /lava-10309467/=
environment

    2023-05-13T22:47:22.673240  =


    2023-05-13T22:47:22.774735  / # . /lava-10309467/environment/lava-10309=
467/bin/lava-test-runner /lava-10309467/1
 =

    ... (13 line(s) more)  =

 =



platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3399-rock-pi-4b | arm64 | lab-collabora | gcc-10   | defconfig          |=
 1          =


  Details:     https://kernelci.org/test/plan/id/646014fdaa624b21172e85e6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v6.2-rc1/arm64/de=
fconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v6.2-rc1/arm64/de=
fconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646014fdaa624b21172e85eb
        new failure (last pass: v6.1-rc1)

    2023-05-13T22:53:28.850822  / # #

    2023-05-13T22:53:28.953392  export SHELL=3D/bin/sh

    2023-05-13T22:53:28.954125  #

    2023-05-13T22:53:29.056033  / # export SHELL=3D/bin/sh. /lava-10309508/=
environment

    2023-05-13T22:53:29.056772  =


    2023-05-13T22:53:29.158647  / # . /lava-10309508/environment/lava-10309=
508/bin/lava-test-runner /lava-10309508/1

    2023-05-13T22:53:29.159788  =


    2023-05-13T22:53:29.174302  / # /lava-10309508/bin/lava-test-runner /la=
va-10309508/1

    2023-05-13T22:53:29.230515  + export 'TESTRUN_ID=3D1_bootrr'

    2023-05-13T22:53:29.231047  + cd /lava-10309508/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =20
