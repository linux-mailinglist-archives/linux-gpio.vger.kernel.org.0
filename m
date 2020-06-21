Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FDC12027A4
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jun 2020 02:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728801AbgFUAnZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Jun 2020 20:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728641AbgFUAnY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Jun 2020 20:43:24 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BAF4C061794
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2020 17:43:24 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id m2so6555411pjv.2
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2020 17:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9WqYHcewGf1lwHBShYKe97X00dhD0Sy9/mm5QwhLLXs=;
        b=WW+9kVflxgSKL+YdwwtSvA9Fd5vYZrigw8x5BBAYwPqXmwZHJ/7nROacEDVgEULs6l
         mYBosrsSbCZDt0TUwNxwgsj6tB5YbGmnS9RhUrydB9lx9j7F2DBS7i6JeL0/9qRCp1VN
         sd8WydecBiMBjJXZlq2QcpJy+kjHjbefpU/WRyG0JTkepyG4acgpPqRSu0MpmSF4UfgA
         BQ4vGznNvnPyhJzu5AbLlq5IsXsyxFTaEpWAd5Vq3M5ptaEhPyuWPWaUk0aphnRYbL5v
         qAly6XPfxkce95CgKShLVlHnssPxH3e4Y8F6Dfoy/nfHssnr4mVskdMKYpS8GpgsEX5q
         qLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9WqYHcewGf1lwHBShYKe97X00dhD0Sy9/mm5QwhLLXs=;
        b=KQ+XlX2BDSyUcR1lVR9RJG2OQIpev5twnfTMQJuTKDEHmGZHJXaialp3KO5dFmMwtk
         gNi1TSNc/HDMI0MheUpjCCB8enkkNgzHwAsYH2N1pVnQIcPkcIY2QnMNvejmIvIr9njG
         s6FyWNzIze2+v0jAhHFw3X/74HrjGEgFnRofr9/HR/gvxBF/RQd959G4rRbfphe5vl8T
         P4Pl0A7cFHNxyO6LHm/OuLm100EyOx9bIRhwoqr5BvSUezFlZfZXkiWp2bFxKgblEYvJ
         Kw4AmvzqAxJfzCuJJaOHB3yfA5xv5vteEfxgmdLZBCDBaLw0uJul02xQ0cBR3sItaOJy
         97ew==
X-Gm-Message-State: AOAM531QoLz98LRG1EeyJ+h4//6SpgnkcBdN/PkycAT/O5h2y4wuO2CR
        igDNRSnuFWj356hWahECqVQt8ygTdyY=
X-Google-Smtp-Source: ABdhPJzfEBq2tvd4qw25SsQtdLizi6ytw0Wi/ClE9g7CmCA8qWv5bT9dg5+m9cf4XUvtQ9Mdl9m5TA==
X-Received: by 2002:a17:902:9b92:: with SMTP id y18mr13154482plp.228.1592700203354;
        Sat, 20 Jun 2020 17:43:23 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ev20sm8790520pjb.8.2020.06.20.17.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 17:43:22 -0700 (PDT)
Message-ID: <5eeead2a.1c69fb81.ca89f.ba2c@mx.google.com>
Date:   Sat, 20 Jun 2020 17:43:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.8-rc1-11-g42ba326cdeff
Subject: linusw/for-next baseline: 46 runs,
 2 regressions (v5.8-rc1-11-g42ba326cdeff)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 46 runs, 2 regressions (v5.8-rc1-11-g42ba326cdeff)

Regressions Summary
-------------------

platform              | arch  | lab          | compiler | defconfig        =
  | results
----------------------+-------+--------------+----------+------------------=
--+--------
at91-sama5d4_xplained | arm   | lab-baylibre | gcc-8    | multi_v7_defconfi=
g | 0/1    =

hifive-unleashed-a00  | riscv | lab-baylibre | gcc-8    | defconfig        =
  | 0/1    =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/v5.=
8-rc1-11-g42ba326cdeff/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: v5.8-rc1-11-g42ba326cdeff
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      42ba326cdeff6954bfd381d858e3c58f1126889b =



Test Regressions
---------------- =



platform              | arch  | lab          | compiler | defconfig        =
  | results
----------------------+-------+--------------+----------+------------------=
--+--------
at91-sama5d4_xplained | arm   | lab-baylibre | gcc-8    | multi_v7_defconfi=
g | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5eeea392b8c0745bd897bf2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.8-rc1-11-g4=
2ba326cdeff/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4=
_xplained.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.8-rc1-11-g4=
2ba326cdeff/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4=
_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5eeea392b8c0745bd897b=
f30
      new failure (last pass: gpio-v5.7-3-2-gcdf59728a3cd) =



platform              | arch  | lab          | compiler | defconfig        =
  | results
----------------------+-------+--------------+----------+------------------=
--+--------
hifive-unleashed-a00  | riscv | lab-baylibre | gcc-8    | defconfig        =
  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5eeea1c2a72e38974e97bf0b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.8-rc1-11-g4=
2ba326cdeff/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a0=
0.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.8-rc1-11-g4=
2ba326cdeff/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a0=
0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5eeea1c2a72e38974e97b=
f0c
      failing since 4 days (last pass: v5.7-rc7-82-g74910e15ab25, first fai=
l: v5.8-rc1-2-g861254d82649) =20
