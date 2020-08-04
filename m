Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A305523B628
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Aug 2020 09:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728629AbgHDH4e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Aug 2020 03:56:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727066AbgHDH4e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Aug 2020 03:56:34 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 758B5C06174A
        for <linux-gpio@vger.kernel.org>; Tue,  4 Aug 2020 00:56:34 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id u10so12908436plr.7
        for <linux-gpio@vger.kernel.org>; Tue, 04 Aug 2020 00:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=LfAkA59WVpWzyTEeCVGLV/SyJjvjZ6rFRNbGEN2yIIo=;
        b=1Iwwtjoab2mOacIkKIVtenxtOo5gsjOKD0qYVH0XtyfYI2ZkYxIOyhMcEX0EUFPZqm
         lCX/0j/jSX+1+Jwfh49FA2nj09IyTIl0fFq+/OQAw11uZ4jMpq/oPUQfnP206sPtb21q
         dQLLwXnHzkeXMeTwMnJfRdu2iNXEiWrAE4KpXdcV4MVB6gmFypjLZByIzwmCP2WUETyN
         FekIF8kdsrzA/WH5p2JaK2fqPhf1LlLh+bMtT+22R2HEEZJQZikbIFiU4sKKUjcadQKS
         AMb9P+WxnF44r39GtoWkfEPlMafyBjkbgHtn3xgg7OaHSASEuWdzNkjGAM4Pll52zBb3
         diBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=LfAkA59WVpWzyTEeCVGLV/SyJjvjZ6rFRNbGEN2yIIo=;
        b=hUpNR/jntYoZlz2sEg77PgS6r82RO50+0HWWFiv5l4eZk7TAdFt3S8AkOxA9rF4nOP
         vSfYCqmLLe68L4lW+0Zyzi4zvT/r7mKxcjp1Iqh7Vj63R/hbqhbNjdV/fofl35YThA9n
         pigbKvPqbZLL/rnmeZo35XwzzSlp7ENcL8ujfyHfJHqsFx4/Xsq88u6HbSMwgWBJSkud
         sMbOWQiSVobfppC7yGGF5VJY3BdlsXHall0Do7VJqrOUxu/hsH3fgebf2yrYYPKfJjOC
         glbKVtdtMwCIN+V84xIemE0cirRYxAzKjMDiJt6cuC6IiIRTUa6Y2JVfVSwTAk8xQkKn
         nN6Q==
X-Gm-Message-State: AOAM532BIIR5AaNBASpdtRVBGb7fnUsdYIYaknhfFpLPR2YRS7bJzT++
        /5h8hkGQ0rkdLIDWPF5pg6qq/R804rw=
X-Google-Smtp-Source: ABdhPJx2+/c2ug9zXkayt7Jd9byHpoVCjX0EEllanVpC80uZ36y2xOSIzozUqvfb9ZZdXK96uzPFuA==
X-Received: by 2002:a17:90a:e292:: with SMTP id d18mr3293558pjz.181.1596527793638;
        Tue, 04 Aug 2020 00:56:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 27sm9787910pgk.89.2020.08.04.00.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2020 00:56:32 -0700 (PDT)
Message-ID: <5f2914b0.1c69fb81.74942.778b@mx.google.com>
Date:   Tue, 04 Aug 2020 00:56:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: gpio-v5.8-2-103-g22cc422070d9
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
Subject: linusw/for-next baseline: 117 runs,
 3 regressions (gpio-v5.8-2-103-g22cc422070d9)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 117 runs, 3 regressions (gpio-v5.8-2-103-g22cc422=
070d9)

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


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/gpi=
o-v5.8-2-103-g22cc422070d9/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: gpio-v5.8-2-103-g22cc422070d9
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      22cc422070d9a9a399f8a70b89f1b852945444cb =



Test Regressions
---------------- =



platform              | arch  | lab          | compiler | defconfig        =
  | results
----------------------+-------+--------------+----------+------------------=
--+--------
at91-sama5d4_xplained | arm   | lab-baylibre | gcc-8    | multi_v7_defconfi=
g | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f290a3cc9fe8cfdb552c1cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-10=
3-g22cc422070d9/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sam=
a5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-10=
3-g22cc422070d9/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sam=
a5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f290a3cc9fe8cfdb552c=
1ce
      failing since 8 days (last pass: v5.8-rc5-96-ge80c35d808ef, first fai=
l: gpio-v5.8-2-96-ga070bdbbb06d) =



platform              | arch  | lab          | compiler | defconfig        =
  | results
----------------------+-------+--------------+----------+------------------=
--+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre | gcc-8    | defconfig        =
  | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f290abe5f2532145652c1c9

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-10=
3-g22cc422070d9/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-10=
3-g22cc422070d9/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f290abe5f253214=
5652c1cc
      failing since 18 days (last pass: gpio-v5.8-2-58-g1752911c6d10, first=
 fail: v5.8-rc5-68-geb211a587e18)
      1 lines =



platform              | arch  | lab          | compiler | defconfig        =
  | results
----------------------+-------+--------------+----------+------------------=
--+--------
hifive-unleashed-a00  | riscv | lab-baylibre | gcc-8    | defconfig        =
  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f290966ba1739468552c1ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-10=
3-g22cc422070d9/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashe=
d-a00.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-10=
3-g22cc422070d9/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashe=
d-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f290966ba1739468552c=
1cb
      failing since 8 days (last pass: v5.8-rc5-96-ge80c35d808ef, first fai=
l: gpio-v5.8-2-96-ga070bdbbb06d) =20
