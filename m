Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 657C4232B9F
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jul 2020 08:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725974AbgG3GAv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jul 2020 02:00:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgG3GAv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jul 2020 02:00:51 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F4229C061794
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2020 23:00:50 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id h12so4563693pgf.7
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2020 23:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=eQfE+q3K4jzUcmePaMQUyNXAdCwAHex8Oenm4T9vsF4=;
        b=1D1bURp5IESLjfEU8xU+hCUseRuf+svxuIMQerxPwM441R+L3unb+2Db4TJDriVPWr
         Qe+d3SioN+LqX6LGI0Vc9x7Mrc2ZPnL3bYFh4ywsUC/CIR5U33aObxycMpx6Jqz3FYi0
         YmANaggzzIQycRuB9WviZY6XP1d5htLswBFU+j6O5/G9cPGoSSJImZ6GRGRBVlD/JhFJ
         Pz4VHVweG9+TaejAwf/p1fxuCmEMCsAoMYdYgsdvm2OXw2aIdtG2xCpPNzlf4EZXCZB/
         hHw5DLIjtTwTyQHNJXzVgXWjIE5CNcZcCyRpZiEjAL5PwvjVwQhVp2bDKfUeOaZ4RGQ7
         HSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=eQfE+q3K4jzUcmePaMQUyNXAdCwAHex8Oenm4T9vsF4=;
        b=XBOer1qIPiEJxmDSB8qkCoVDYh0RCaXrBYpIE72mzRww2oitcDQ7lq/KLo5Y1Jlx7J
         MrZCn79B6lDquFq3u4dtt5tJOHEVsRnDDlJ3Q/b6R08KNTz9PQTZ/O3ClYtkJqY/s9iv
         SAqzNe7I1pnElQIS+GBOxQIw5cXWDMG9UV9mcSQmsZakpDOCakhqIXvnexk1i4qxUAMz
         FyABQaH3Fpvsu61ery9tycCLuCfnHgfMoJJbfWeTSbXNTV3pRf48RZ3jxeKfw48ggLiX
         iLcba0fFC32Xc6zFJ+lZY2cyY6lV2VXcZ9j1uX1gGLB05iXAXQnmFt9GSGAvfvl7SLZF
         fC1g==
X-Gm-Message-State: AOAM532deNF/fIK6RA67EjkFYlQd/nGLExPfiJGPwQC06HHKJh6MaKKK
        BKENkSv96vHykzSn8yvHQbLxQIh5VSI=
X-Google-Smtp-Source: ABdhPJy3qu7nK8ggz0B81WuF6al0TJgPLRiwrM22tAoG8UthDP83gazas2hQ3OyggZDUE896pHBc4w==
X-Received: by 2002:aa7:854f:: with SMTP id y15mr1663245pfn.298.1596088850111;
        Wed, 29 Jul 2020 23:00:50 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k29sm4580071pfp.142.2020.07.29.23.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 23:00:49 -0700 (PDT)
Message-ID: <5f226211.1c69fb81.3dc68.dd14@mx.google.com>
Date:   Wed, 29 Jul 2020 23:00:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: gpio-v5.8-2-97-gb470cef1ffac
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
Subject: linusw/devel baseline: 120 runs,
 3 regressions (gpio-v5.8-2-97-gb470cef1ffac)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 120 runs, 3 regressions (gpio-v5.8-2-97-gb470cef1ffa=
c)

Regressions Summary
-------------------

platform              | arch  | lab          | compiler | defconfig        =
  | results
----------------------+-------+--------------+----------+------------------=
--+--------
at91-sama5d4_xplained | arm   | lab-baylibre | gcc-8    | multi_v7_defconfi=
g | 0/1    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre | gcc-8    | defconfig        =
  | 4/5    =

hifive-unleashed-a00  | riscv | lab-baylibre | gcc-8    | defconfig        =
  | 0/1    =


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/gpio-v=
5.8-2-97-gb470cef1ffac/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: gpio-v5.8-2-97-gb470cef1ffac
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      b470cef1ffac1acc327fe3343a2ce3ef3a526a21 =



Test Regressions
---------------- =



platform              | arch  | lab          | compiler | defconfig        =
  | results
----------------------+-------+--------------+----------+------------------=
--+--------
at91-sama5d4_xplained | arm   | lab-baylibre | gcc-8    | multi_v7_defconfi=
g | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2258c3d4d20e89c252c1c4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-97-gb=
470cef1ffac/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4=
_xplained.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-97-gb=
470cef1ffac/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4=
_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2258c3d4d20e89c252c=
1c5
      failing since 43 days (last pass: gpio-v5.8-1-1-gf6d984418ffd, first =
fail: v5.8-rc1) =



platform              | arch  | lab          | compiler | defconfig        =
  | results
----------------------+-------+--------------+----------+------------------=
--+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre | gcc-8    | defconfig        =
  | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f2257340ee37a975a52c207

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-97-gb=
470cef1ffac/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-97-gb=
470cef1ffac/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f2257340ee37a97=
5a52c20a
      new failure (last pass: gpio-v5.8-2-96-ga070bdbbb06d)
      2 lines =



platform              | arch  | lab          | compiler | defconfig        =
  | results
----------------------+-------+--------------+----------+------------------=
--+--------
hifive-unleashed-a00  | riscv | lab-baylibre | gcc-8    | defconfig        =
  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2255c7b0324ecc8b52c1ad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-97-gb=
470cef1ffac/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a0=
0.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-97-gb=
470cef1ffac/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a0=
0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2255c7b0324ecc8b52c=
1ae
      failing since 43 days (last pass: gpio-v5.8-1-1-gf6d984418ffd, first =
fail: v5.8-rc1) =20
