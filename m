Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 688EE26DA86
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Sep 2020 13:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbgIQLlt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Sep 2020 07:41:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726928AbgIQLlZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Sep 2020 07:41:25 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D52CEC06174A
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2020 04:41:22 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id k14so1201493pgi.9
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2020 04:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=U3Dk2z1QIkQ9PcUlRp4++SZHUWHFbT2QTj68t6E19KM=;
        b=fMaoqrKcdQs/JD4REC9tjS2uDJ/EYXgB0iuThUednRHi//PvBuzxrQGPFom/mqkLUS
         65o8yf4CyalwZRoAQWG8g33d2+KhK2f3iepsCZgI0H+Xg/1ThXjauLiFQDvskJ8X4zut
         Sz1KI53AqKQPP+LHuKRxj75wDMl4OEZuSAObM6bOI1fiyZUwCI64VPo5ZRmqsTPkfYsQ
         dcvMbDQdk015EFv11UTmJJe4zBgfT/KYu4RZKhrluxhfEBNhXF2vZgphKBeCVRTt+Fh4
         e9nAJVR1BcXpnPcrkEd/AxcPPvLzVOXBHExrTnjRwnNBG5sgenAcbc5NyS/hG+LmnoSH
         85lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=U3Dk2z1QIkQ9PcUlRp4++SZHUWHFbT2QTj68t6E19KM=;
        b=m0KYi8IB4cz1DE+3kCjMaw1tu9FlF3iMzOAZRjxCcBnYHqALVM1ppn0102Ri3+QJWs
         RGZ6rNOyK/vevfsoRjaLTQpwjtlttsDCzKQKlUopoCQMSn9QOB5SWPwMa3iy9RMhhMUg
         MCBwtCzxRthCPDsRfraldPCdnqQi5+SPD7WkR8W/7wSJ3HBNsJ8oEr2KqMXYb56w6Twn
         DI7tpopCZkV0WtZEmGJ+b66V9j2YHiy+a2GYxoWfwX8ZOE3kEYNk/COj+OyYvVs/oLLU
         kp5NOMmyCYAPZsHnmmv3eG6ppRE1eSw+YCNDp8XRXb1yRWpzrM/X4cFndyOOOB9sE+NC
         AMZQ==
X-Gm-Message-State: AOAM533uLjsD7N15uegqMUkFFbLpvGKmiAm7WsX3EjRtCIlTjI08JHY+
        LMsUPsjknQytlZX28ebpTBDwZE6Xd6fufA==
X-Google-Smtp-Source: ABdhPJzw80pVCfEE0v5ttnnv5O1pmZqn5Bfj2k86Y4ZW8REEIXJLzvJxA7yIJ0F22V0R8ffeZx2B6g==
X-Received: by 2002:aa7:8d4c:0:b029:13f:e666:8f05 with SMTP id s12-20020aa78d4c0000b029013fe6668f05mr18650716pfe.0.1600342881917;
        Thu, 17 Sep 2020 04:41:21 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g7sm20794693pfr.150.2020.09.17.04.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 04:41:21 -0700 (PDT)
Message-ID: <5f634b61.1c69fb81.87d8f.3701@mx.google.com>
Date:   Thu, 17 Sep 2020 04:41:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
X-Kernelci-Kernel: v5.9-rc2-19-ga5d0fe9ff2af
Subject: linusw/for-next baseline: 123 runs,
 4 regressions (v5.9-rc2-19-ga5d0fe9ff2af)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 123 runs, 4 regressions (v5.9-rc2-19-ga5d0fe9ff2a=
f)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
   | results
----------------------+-------+---------------+----------+-----------------=
---+--------
mt8173-elm-hana       | arm64 | lab-collabora | gcc-8    | defconfig       =
   | 0/1    =

panda                 | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig | 4/5    =

rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig       =
   | 0/1    =

sun7i-a20-cubieboard2 | arm   | lab-baylibre  | gcc-8    | multi_v7_defconf=
ig | 0/1    =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/v5.=
9-rc2-19-ga5d0fe9ff2af/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: v5.9-rc2-19-ga5d0fe9ff2af
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      a5d0fe9ff2af9feb82d37782be5beb2976a4afdd =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
   | results
----------------------+-------+---------------+----------+-----------------=
---+--------
mt8173-elm-hana       | arm64 | lab-collabora | gcc-8    | defconfig       =
   | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6341af2edb0885bfbf9dd7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.9-rc2-19-ga=
5d0fe9ff2af/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.9-rc2-19-ga=
5d0fe9ff2af/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6341af2edb0885bfbf9=
dd8
      failing since 19 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.8-11991-gfc80c51fd4b2)  =



platform              | arch  | lab           | compiler | defconfig       =
   | results
----------------------+-------+---------------+----------+-----------------=
---+--------
panda                 | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f634154596a3bf80ebf9dd6

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.9-rc2-19-ga=
5d0fe9ff2af/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.9-rc2-19-ga=
5d0fe9ff2af/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f634154596a3bf=
80ebf9ddc
      failing since 19 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.8-11991-gfc80c51fd4b2)
      60 lines

    2020-09-17 10:58:22.896000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-09-17 10:58:22.901000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-09-17 10:58:22.907000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-09-17 10:58:22.913000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-09-17 10:58:22.919000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-09-17 10:58:22.925000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-09-17 10:58:22.931000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-09-17 10:58:22.937000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-09-17 10:58:22.943000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    2020-09-17 10:58:22.949000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80b
    ... (49 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
   | results
----------------------+-------+---------------+----------+-----------------=
---+--------
rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig       =
   | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6341a5d3dd57bfc7bf9dc8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.9-rc2-19-ga=
5d0fe9ff2af/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.t=
xt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.9-rc2-19-ga=
5d0fe9ff2af/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6341a5d3dd57bfc7bf9=
dc9
      new failure (last pass: v5.9-rc1-10-gfeeaefd378ca)  =



platform              | arch  | lab           | compiler | defconfig       =
   | results
----------------------+-------+---------------+----------+-----------------=
---+--------
sun7i-a20-cubieboard2 | arm   | lab-baylibre  | gcc-8    | multi_v7_defconf=
ig | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f63414176f8cb8389bf9df0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.9-rc2-19-ga=
5d0fe9ff2af/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.9-rc2-19-ga=
5d0fe9ff2af/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f63414176f8cb8389bf9=
df1
      new failure (last pass: gpio-v5.8-2-103-g22cc422070d9)  =20
