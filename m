Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93C5C287FF1
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Oct 2020 03:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbgJIBTK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Oct 2020 21:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbgJIBTK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Oct 2020 21:19:10 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C6A6C0613D2
        for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2020 18:19:10 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id x13so2836314pfa.9
        for <linux-gpio@vger.kernel.org>; Thu, 08 Oct 2020 18:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=LX1cwzPWTR5KybFArqe5yfYYa/NpkrhAvXQvNzIx1MY=;
        b=y5pShUfI0ykKPUPlYqHwtY21O6M22IEXG9lfRqPOiV+GBSBGg8R/LHbapmnBYgjnwS
         1/m1lAcvcEKyCPuXIvYv9XUMi0wYCRdTd6NH0Y1btHvrdhqjhzPlPudIrIZ/subc5lR4
         fachsqU6bPjEhMj5fJnOWxnnqlwAjn43xeyifNKNonXjPOk6HmrdnLWzmjdzYlwRtHf7
         y7/FSMk4V5sWJuSDL+MrSNEabmfMUuEdhKDWhRylEmh8ZmTgxlcbQh33U8USMZN80xCX
         Z1mnUKAd3gudUbWgI/6Kdxze5fKu6TBYkTcD0Rt7ZNStltbgYvSxdqPJ3k4N/EIFhzlj
         i9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=LX1cwzPWTR5KybFArqe5yfYYa/NpkrhAvXQvNzIx1MY=;
        b=dZGKPB2vyVsXVZt2E2HjMFYXsDaZeTuSTWmkCRgGVbo8rTdu9No0h0625/wyYKnzag
         OjFpViOVCUcBWF2LcVLY1qC5DHjfnUTzo5IXc/jydkTCA3LzMwFoJ3UJxOAwSCSSiUF/
         JVM/5zLIZaDNKVcujXRx1S21Z+aSETooMAY6+57A/tXUrz/Gnxf3xPjWl/0Qr1ZwomsQ
         Sx5BR4RHYES0Z3nswkfxFFuDMJdaee3WZhCIcxkKkoMVcA0LrX2IxK9dAcWKHsjBzz9z
         kKeAGRhIroN+XDERJ/1LzjfWBgKxqDWTRd/ZKM5VlUr4puWbbO3mQYunbSrQES3n8ZfS
         Hhdg==
X-Gm-Message-State: AOAM533MiGy1mVk37umuz73Ingbd39OxSxJuJF9T3WS07Wgj1nrIahp/
        a2LgO3totCAnNvyhypc4+er2TyG6IDiVyg==
X-Google-Smtp-Source: ABdhPJwq3XphaXaEZhdXZ7BRh7HPCejx+EIjhES1VDHFqxx5ij58tqWtw68GCO6FO2trRb0wGWDRpA==
X-Received: by 2002:a17:90a:e015:: with SMTP id u21mr1743426pjy.33.1602206349333;
        Thu, 08 Oct 2020 18:19:09 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w14sm7916255pfu.87.2020.10.08.18.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 18:19:08 -0700 (PDT)
Message-ID: <5f7fba8c.1c69fb81.44c5f.f804@mx.google.com>
Date:   Thu, 08 Oct 2020 18:19:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-rc8-2-g8b81edd80baf
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
Subject: linusw/fixes baseline: 65 runs,
 2 regressions (v5.9-rc8-2-g8b81edd80baf)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes baseline: 65 runs, 2 regressions (v5.9-rc8-2-g8b81edd80baf)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig          | r=
esults
----------------+-------+---------------+----------+--------------------+--=
------
bcm2837-rpi-3-b | arm64 | lab-baylibre  | gcc-8    | defconfig          | 3=
/4    =

panda           | arm   | lab-collabora | gcc-8    | multi_v7_defconfig | 4=
/5    =


  Details:  https://kernelci.org/test/job/linusw/branch/fixes/kernel/v5.9-r=
c8-2-g8b81edd80baf/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   fixes
  Describe: v5.9-rc8-2-g8b81edd80baf
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      8b81edd80baf12d64420daff1759380aa9a14998 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig          | r=
esults
----------------+-------+---------------+----------+--------------------+--=
------
bcm2837-rpi-3-b | arm64 | lab-baylibre  | gcc-8    | defconfig          | 3=
/4    =


  Details:     https://kernelci.org/test/plan/id/5f7fa1036340aa86634ff4c5

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.9-rc8-2-g8b81e=
dd80baf/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.9-rc8-2-g8b81e=
dd80baf/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f7fa1036340aa86=
634ff4c9
      failing since 7 days (last pass: v5.9-rc2-15-g17479aa39fbf, first fai=
l: v5.9-rc2-17-g8c1f1c34777b)
      1 lines

    2020-10-08 23:28:05.727000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-08 23:28:05.727000  (user:khilman) is already connected
    2020-10-08 23:28:21.469000  =00
    2020-10-08 23:28:21.469000  =

    2020-10-08 23:28:21.470000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-08 23:28:21.470000  =

    2020-10-08 23:28:21.470000  DRAM:  948 MiB
    2020-10-08 23:28:21.484000  RPI 3 Model B (0xa02082)
    2020-10-08 23:28:21.571000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-08 23:28:21.604000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (379 line(s) more)
      =



platform        | arch  | lab           | compiler | defconfig          | r=
esults
----------------+-------+---------------+----------+--------------------+--=
------
panda           | arm   | lab-collabora | gcc-8    | multi_v7_defconfig | 4=
/5    =


  Details:     https://kernelci.org/test/plan/id/5f7faa7304a05335ca4ff406

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.9-rc8-2-g8b81e=
dd80baf/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.9-rc8-2-g8b81e=
dd80baf/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f7faa7304a0533=
5ca4ff40c
      failing since 26 days (last pass: v5.8-rc5, first fail: v5.9-rc2-3-g3=
c68e90fdb65)
      60 lines

    2020-10-09 00:10:22.001000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-10-09 00:10:22.007000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-10-09 00:10:22.013000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-10-09 00:10:22.019000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-10-09 00:10:22.029000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-10-09 00:10:22.031000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-10-09 00:10:22.037000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-10-09 00:10:22.043000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-10-09 00:10:22.048000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    2020-10-09 00:10:22.055000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80b
    ... (49 line(s) more)
      =20
