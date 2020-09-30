Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5796627E7C2
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 13:41:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729322AbgI3LlY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 07:41:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728270AbgI3LlY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2020 07:41:24 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36733C061755
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 04:41:24 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id md22so810365pjb.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 04:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=KLxat4tza6AY9XF4coFtZN6hf7Y9u8f2W05PMCuPlQk=;
        b=YQvbrmaRA9zhBskcC7wgbVALhCJ1xXU2KUr1pQvELVinR81YOgzvCWR3wUzq3xoPR/
         E+apPyn+74oqbYs/HOFHHaZWzF6fw/VZYaSfSOCTvnYFSCZwu7bAWScKtgNiw/ME4Ctb
         J/Czb46BmPmoTHp1VgFLxZahWgRNzfeFCPcLa1pF/BwzpDDn9DIemFvcNslodHHSL36M
         YXKEFPbuCRpVFj4bU9IemJL6g/m4/h/jMUBVQBxi2/Zk+MaOhHXNU39dxfy3EYLUusGR
         okf2mw+MHzbeDKGb5SCeN6jn7pfMcpLGkFD+KGzIXyP70Ah2ce45ZREHTEt4uMGH5Rch
         EuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=KLxat4tza6AY9XF4coFtZN6hf7Y9u8f2W05PMCuPlQk=;
        b=XzNlnpwC1467oluc13aA0sEplJgzW0yuBVNTl0vkt7XzFDsvuLacVjaV9wLzZJFfAl
         ELROZtYlFsVqGVB/NGo+W2UstAkXuWIPonMIk6YZAEXrKaAckIe/RoGIa5TNDbkpJyQW
         DkJ5g26hQloY2MygXdltn6rYgXXg9v9VcXDI1yPl4oi747TGCFCo4pQoH+ryvbxpTZa3
         nNWf4E9naJ6Ho+lcjIt/Zn/3gUUjd1muvBXNSoAuWMybFeaY7dhUu/C7l8w8WQi94NRA
         M30R0bQEDjAuhebau5NpnYu7KFQqsn6lOoDE6R2HGSUpfNh92y0aqkXZLLnTlLdl1rQg
         RJGA==
X-Gm-Message-State: AOAM531ehk0mgU4newsOnAZ/qZGpirAGVP6dZS4QypJy+qs3moGJwrwU
        kx+tIQFhOcpyX/XXekspzhGBfs6QGBVlOA==
X-Google-Smtp-Source: ABdhPJyiqrqLLWakZhqi//jbutyT6wBKZPM64K0LeYP81gT8zgMZazTH0793GDKac9WG3RusPkUeRA==
X-Received: by 2002:a17:902:9002:b029:d2:8cdd:d855 with SMTP id a2-20020a1709029002b02900d28cddd855mr2046850plp.28.1601466083273;
        Wed, 30 Sep 2020 04:41:23 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g24sm2444478pfk.65.2020.09.30.04.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 04:41:22 -0700 (PDT)
Message-ID: <5f746ee2.1c69fb81.e3e2e.446e@mx.google.com>
Date:   Wed, 30 Sep 2020 04:41:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-rc1-73-g237d96164f2c
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
Subject: linusw/devel baseline: 99 runs,
 5 regressions (v5.9-rc1-73-g237d96164f2c)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 99 runs, 5 regressions (v5.9-rc1-73-g237d96164f2c)

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
c1-73-g237d96164f2c/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: v5.9-rc1-73-g237d96164f2c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      237d96164f2c2b33d0d5094192eb743e9e1b04ad =



Test Regressions
---------------- =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
mt8173-elm-hana        | arm64 | lab-collabora | gcc-8    | defconfig      =
    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f7465c1273a3c8517877183

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-73-g237d=
96164f2c/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-73-g237d=
96164f2c/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f7465c1273a3c8517877=
184
      failing since 32 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.9-rc1-10-gfeeaefd378ca)  =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
panda                  | arm   | lab-collabora | gcc-8    | multi_v7_defcon=
fig | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f7464e712cc37df22877193

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-73-g237d=
96164f2c/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-73-g237d=
96164f2c/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f7464e712cc37d=
f22877199
      failing since 32 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.9-rc1-10-gfeeaefd378ca)
      60 lines

    2020-09-30 10:58:41.481000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-09-30 10:58:41.487000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-09-30 10:58:41.493000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-09-30 10:58:41.499000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-09-30 10:58:41.505000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-09-30 10:58:41.510000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-09-30 10:58:41.517000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-09-30 10:58:41.522000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-09-30 10:58:41.528000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    2020-09-30 10:58:41.535000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80b
    ... (49 line(s) more)
      =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
rk3399-gru-kevin       | arm64 | lab-collabora | gcc-8    | defconfig      =
    | 89/90  =


  Details:     https://kernelci.org/test/plan/id/5f7465c6273a3c8517877186

  Results:     89 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-73-g237d=
96164f2c/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-73-g237d=
96164f2c/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f7465c6273a3c85178771c4
      failing since 32 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.9-rc1-10-gfeeaefd378ca)

    2020-09-30 11:02:25.757000  /lava-2671182/1/../bin/lava-test-case
      =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
sun50i-a64-pine64-plus | arm64 | lab-baylibre  | gcc-8    | defconfig      =
    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f7467298273bf1c0287716f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-73-g237d=
96164f2c/arm64/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus=
.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-73-g237d=
96164f2c/arm64/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f7467298273bf1c02877=
170
      failing since 29 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.9-rc1-10-gfeeaefd378ca)  =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
sun7i-a20-cubieboard2  | arm   | lab-baylibre  | gcc-8    | multi_v7_defcon=
fig | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f74654f3214b56479877169

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-73-g237d=
96164f2c/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubie=
board2.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-73-g237d=
96164f2c/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubie=
board2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f74654f3214b56479877=
16a
      failing since 17 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.9-rc1-15-g0a2d411b56b7)  =20
