Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70C0A79B0EF
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 01:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241257AbjIKU5E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Sep 2023 16:57:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236510AbjIKKrt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Sep 2023 06:47:49 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FD02E9
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 03:47:45 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1c364fb8a4cso38930085ad.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 03:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1694429264; x=1695034064; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/FAsTlBYaZvu0Ff/WAhJEZH8l0jVn7O3CKewPsQR4DE=;
        b=H3g/rjB0H8DgQsYcCou2320+rWT4rJbbldsmHGV2yVENNwQ0lqX4PYuS+57XpCornb
         StVANaedNwNqoIu9lKUzKiCsigFYGsiLLUyJB1/Fu8hJi6NNMuVn8PgboT2YrUgWd+92
         48DlKiRohneuQZBGeNB3LcmjpvC8xgTNRyt+uyNgKCOQWlATUKiYwF1JrELNnULsKGUQ
         vRQhsqavQ0ebkO/mr0eVy9hG3iViCjieGitfiE5+6/4EeTzJlReJEGKHKpKrzxKQVuc7
         SmCKXTke0Kg7LOsJxF7uW4isWPgi8equBA6eWlZPbUXMw8bjqU8JdB/1Fx8POtfM/aP2
         CIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694429264; x=1695034064;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FAsTlBYaZvu0Ff/WAhJEZH8l0jVn7O3CKewPsQR4DE=;
        b=cPv4YTi0nwMEGvuHa3ia4fztdsQS0Hl2P0MGMVPcCvhtPvCkK6MdivI1NKIE4tHVal
         a/41JZ3pHD+3FK1UWHHcdXE9utoKEnZzRhEU+yL1blAUP/8CIsgJCRy7APDwkQVpB2Jk
         gIbStGanEVLAXAJ29B9xlD3nnUuGRu/mjNthDq6sRk8LR225KFjJU4AU8p78DtG+mQqO
         s+bVmdqTFiaTdUcg4woFMBBiAOG9CTe1nUSnv6IuFXKUN+1GJkBwDqHtrk9az/qifE81
         flr9ecLKiS3fZe5PoLlyUTn1GUT5DjeAQsk5e7Dc9+0pNY3mR48O6DZvyK8jq2bbad2/
         PJZQ==
X-Gm-Message-State: AOJu0YzZq8+4FFp2gO1TpjWgg+u2U1E5txLzqIkuXWc1pa5yqJbhwmFg
        T+5bBgOkSU3qxHzWc1gBCgecYsZuU0ageQlnK9g=
X-Google-Smtp-Source: AGHT+IHiyNBjszsZYu4IlXLVHwb3M+lVlCrYzF3XQYD+C3aYw/aAiTMklPe1kJpupHdhRM10Jm3zDg==
X-Received: by 2002:a17:902:c412:b0:1c3:394a:8660 with SMTP id k18-20020a170902c41200b001c3394a8660mr14036801plk.62.1694429264169;
        Mon, 11 Sep 2023 03:47:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id ix7-20020a170902f80700b001bf3bdbceb5sm6147102plb.134.2023.09.11.03.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 03:47:43 -0700 (PDT)
Message-ID: <64fef04f.170a0220.f34e7.e6cc@mx.google.com>
Date:   Mon, 11 Sep 2023 03:47:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.6-rc1
Subject: linusw/devel baseline: 48 runs, 4 regressions (v6.6-rc1)
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

linusw/devel baseline: 48 runs, 4 regressions (v6.6-rc1)

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


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/v6.6-r=
c1/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
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


  Details:     https://kernelci.org/test/plan/id/64fee6ab0441b1f0b2286daa

  Results:     60 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//linusw/devel/v6.6-rc1/arm64/de=
fconfig/gcc-10/lab-broonie/baseline-juno-uboot.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v6.6-rc1/arm64/de=
fconfig/gcc-10/lab-broonie/baseline-juno-uboot.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64fee6ab0441b1f0b2286dea
        new failure (last pass: v6.1-rc1)

    2023-09-11T10:06:14.737690  <8>[   28.281401] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 98896_1.5.2.4.1>
    2023-09-11T10:06:14.840446  / # #
    2023-09-11T10:06:14.942339  export SHELL=3D/bin/sh
    2023-09-11T10:06:14.942820  #
    2023-09-11T10:06:15.044218  / # export SHELL=3D/bin/sh. /lava-98896/env=
ironment
    2023-09-11T10:06:15.044718  =

    2023-09-11T10:06:15.146062  / # . /lava-98896/environment/lava-98896/bi=
n/lava-test-runner /lava-98896/1
    2023-09-11T10:06:15.146863  =

    2023-09-11T10:06:15.153015  / # /lava-98896/bin/lava-test-runner /lava-=
98896/1
    2023-09-11T10:06:15.227614  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (41 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a77960-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/64fee611dc6a48a214286dd6

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//linusw/devel/v6.6-rc1/arm64/de=
fconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v6.6-rc1/arm64/de=
fconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64fee611dc6a48a214286ddf
        new failure (last pass: v6.2-rc1)

    2023-09-11T10:08:07.965195  / # #

    2023-09-11T10:08:08.067393  export SHELL=3D/bin/sh

    2023-09-11T10:08:08.068153  #

    2023-09-11T10:08:08.169632  / # export SHELL=3D/bin/sh. /lava-11493738/=
environment

    2023-09-11T10:08:08.170369  =


    2023-09-11T10:08:08.271861  / # . /lava-11493738/environment/lava-11493=
738/bin/lava-test-runner /lava-11493738/1

    2023-09-11T10:08:08.272980  =


    2023-09-11T10:08:08.289845  / # /lava-11493738/bin/lava-test-runner /la=
va-11493738/1

    2023-09-11T10:08:08.339024  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-11T10:08:08.339215  + cd /lava<8>[   20.379204] <LAVA_SIGNAL_ST=
ARTRUN 1_bootrr 11493738_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
rk3399-rock-pi-4b  | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/64fee6401172b06492286de4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//linusw/devel/v6.6-rc1/arm64/de=
fconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v6.6-rc1/arm64/de=
fconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64fee6401172b06492286ded
        failing since 120 days (last pass: v6.1-rc1, first fail: v6.2-rc1)

    2023-09-11T10:04:38.698253  / # #

    2023-09-11T10:04:39.958949  export SHELL=3D/bin/sh

    2023-09-11T10:04:39.969885  #

    2023-09-11T10:04:39.970337  / # export SHELL=3D/bin/sh

    2023-09-11T10:04:41.714014  / # . /lava-11493724/environment

    2023-09-11T10:04:44.918226  /lava-11493724/bin/lava-test-runner /lava-1=
1493724/1

    2023-09-11T10:04:44.929467  . /lava-11493724/environment

    2023-09-11T10:04:44.933665  / # /lava-11493724/bin/lava-test-runner /la=
va-11493724/1

    2023-09-11T10:04:44.988648  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-11T10:04:44.989093  + cd /lava-11493724/1/tests/1_bootrr
 =

    ... (10 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/64fee6241172b06492286d8c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//linusw/devel/v6.6-rc1/arm64/de=
fconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v6.6-rc1/arm64/de=
fconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64fee6241172b06492286d95
        new failure (last pass: v6.2-rc1)

    2023-09-11T10:08:16.525657  / # #

    2023-09-11T10:08:16.627899  export SHELL=3D/bin/sh

    2023-09-11T10:08:16.628570  #

    2023-09-11T10:08:16.730011  / # export SHELL=3D/bin/sh. /lava-11493727/=
environment

    2023-09-11T10:08:16.730765  =


    2023-09-11T10:08:16.832264  / # . /lava-11493727/environment/lava-11493=
727/bin/lava-test-runner /lava-11493727/1

    2023-09-11T10:08:16.833491  =


    2023-09-11T10:08:16.848732  / # /lava-11493727/bin/lava-test-runner /la=
va-11493727/1

    2023-09-11T10:08:16.917926  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-11T10:08:16.918432  + cd /lava-1149372<8>[   17.161170] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 11493727_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
