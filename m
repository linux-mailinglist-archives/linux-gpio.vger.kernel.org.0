Return-Path: <linux-gpio+bounces-7465-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C867909637
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Jun 2024 07:46:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 133B3283C5C
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Jun 2024 05:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 477A4F4EE;
	Sat, 15 Jun 2024 05:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="FmMjI8WW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A1919D89A
	for <linux-gpio@vger.kernel.org>; Sat, 15 Jun 2024 05:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718430366; cv=none; b=qFBn+xC8+1CTYTC1hMwchFNi/Fa9/GY3STPdqio05udbbvs+8ZUobEE3kFfgAvzpD2o61GDzsiypVN9x3jPa3yzFUVaS2TB3Pcxj2XHQSZgZ3tYziI7J4eVcR2eIsDCZ8Rbmd8aRI6ur38sJKY51xubF9Ax5TWX1t79gAh7EiYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718430366; c=relaxed/simple;
	bh=McqzN5qgHgZGYYulTQdOyaIKnrw3Gkia1Y9zI0Y6DHM=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=I4XGOFTn295rf/CVQzSwQ+ScfccBqo9n/1ulsPxlsbZ0Vn603vcdyc0txoT0QHG1BpguD1PLcts74znQrsTU9Ze7ungEZfBm6Z4uMTAo8qjl6W4QSq2dKBvHX8VzWVKUF3UWTqKf4TsTfjiiSSi4nL7oQwfzd/ec7oR6R+pq23A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=FmMjI8WW; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f47f07aceaso24317165ad.0
        for <linux-gpio@vger.kernel.org>; Fri, 14 Jun 2024 22:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718430363; x=1719035163; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tMDPW7H4pU6yTz92qdcPZhH27m3R5sVCBJmXMhUz4v8=;
        b=FmMjI8WWXXhFvb80jwgthVDkNidBl9616mzHZyZprIHRBb1QRtViLkNLBXP0WLLENu
         HgiwgcS5fAFH2aDyQrra7OZDzzi3v/Ur9VCRVOewoN1nhISOYGkI1E6sTYk+D6aZk0z0
         zRCWctCK94ykAeG+AcGKZlEMByjhQW8vKmcMSHfvAZSlFUYQeOA8A9tQNLcsQvu703Vc
         N6k3y3aJX4Z0ejIFMEdXZUezHVRpCrdWrZVob3x5F7/TSz/OsHa5gDIfTzNUigjzeWRl
         x1+Jk2OtAOk7zxFP5ZZ5zgni7txnw5kf3l9QFyIo5xJ6fXR7ZNsqv6XkWfktv6HD9Dvs
         iXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718430363; x=1719035163;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tMDPW7H4pU6yTz92qdcPZhH27m3R5sVCBJmXMhUz4v8=;
        b=oLse7jhzLdqskar4pf3uVZpjJJhaR8DLYZXJv6n0fWmhhz6LTcyl31XrFeH6E6y494
         60wWW3Wh6eVNJv5NIQQagwe6KEnGop2VjH0kG10luvn5qe5TND4aqXuEkiaVINfutfmK
         5cmyH+NG3oUul+OVEJ0P/mnUsfhXmH6IxrIruwwCvxfTb77I2sSlruMlnhvbtJ1SEdat
         SoHmr7Vt1lD/69oW5Y1eAjhNI/i3+iI5q04CdLUOwZls4//hmFQfTfKgiPQk5ZP6IOFE
         0VDYjDDfNKqZcGDWdfK1rc0qbpOCTOKy6SKh8A/phVj4jLHki3oCq72TCcfphBtFQT1L
         nOVQ==
X-Gm-Message-State: AOJu0YxvhokAwamcYEu4GOQm64DQiFEsTe7zgyfxU46U+NEZS+oMGeVR
	1zJLAIw4WBcT+9gdR3BqGSyslFHU+QPDNlXbbRJ7wY7nGQ74Rsfiy0HO117762zUiHoQwJXYo/k
	i
X-Google-Smtp-Source: AGHT+IGssd21xWLNeHCOP+N0ei/epHa4aWvUDXCwe8uHZpzY65K0ivAViCHSwIn4oU+HhWtPwLmljQ==
X-Received: by 2002:a17:903:2308:b0:1f4:8b81:9889 with SMTP id d9443c01a7336-1f8625d50d2mr54314185ad.7.1718430363259;
        Fri, 14 Jun 2024 22:46:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855ee6ee0sm42056045ad.172.2024.06.14.22.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 22:46:02 -0700 (PDT)
Message-ID: <666d2a9a.170a0220.11720.d555@mx.google.com>
Date: Fri, 14 Jun 2024 22:46:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.6-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
Subject: linusw/devel baseline: 106 runs, 4 regressions (v6.6-rc1)
To: linux-gpio@vger.kernel.org, fellows@kernelci.org
From: "kernelci.org bot" <bot@kernelci.org>

linusw/devel baseline: 106 runs, 4 regressions (v6.6-rc1)

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

