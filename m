Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A3D223B53B
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Aug 2020 08:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725909AbgHDGtC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Aug 2020 02:49:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbgHDGtC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Aug 2020 02:49:02 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECEF0C06174A
        for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2020 23:49:00 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id z5so21579659pgb.6
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2020 23:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=KADQTzJ9xRs47g1uEdOagGYHenUk8qIaATnviR3AgI4=;
        b=Pp9CKvfuCfIGlZlkYYnfC9FpIul1CkKGSHiEReNfNUtp8hqFhKaiClk6WETIki9I8P
         4kq6pYJQNHQzrfAeG6TcsGtCMGdZ6UpevNvh9SCs0YYa9BLS59bv7NMUWTRQ0Ll9Poqi
         DCM5w33460gXOwqqpVKTbLjjtK8qfkRDf081cI1LCktFRdZgm73vJRuhEOTIvPkZSSpa
         o6+Z8W4KSu97gkSd872b6pIyryMqqJ1CkfjpQ/yeUfTa/g08B/iC9DmDO7iSnLIc0G7N
         QyovmnEHERKD6Qkn4CCx1fjyT6vcZV7zye7iSXneGW/VzeXJu0B18WWpndpHzLJxpBsz
         oZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=KADQTzJ9xRs47g1uEdOagGYHenUk8qIaATnviR3AgI4=;
        b=mXpUkHuW/DoAP6jKlcpJFuAEK3RVhz1jQYSg072nkCGaPtd5Vow3jRfawxHG3/f0lo
         VX+vZ8fTfhApEHfTHTJgN9ZywI2kQbNQd/fvA7EWlaXdkmEbKQkGxgFqMjsEzYFvn7a8
         /24EW3VHVFsiK1hpBPBoyf/PbkePMqgNMAoPFDf29EEpHeImICcxjD0NOBDeai9BUx/9
         2jX1mcZkfw9A1+YrCIEA6kB71cu2FoSGpbwL17uubX2BG/9y0prpM7Or+TR+GCqltL/S
         bMbIus2I8oJuLNvyzxL5q3T31LzYtliGKDabyXwEBSLghhvCcTa5lOMuCMG9WbgJCynS
         WYPQ==
X-Gm-Message-State: AOAM530Vf6XhkY/B78kHfHeNcXSkjwpPR+rpBJRStd2daAJWbRE9jM/c
        4crTogp1ABBH5NqL9kPxeif7SIhlSTU=
X-Google-Smtp-Source: ABdhPJx4+jE0fnipFYRc0YdtjDSBXL0x5qA7dPCpR8SIx3RX4tTiUi+OQLLs/bdVLOVmO5cgpVlS6Q==
X-Received: by 2002:a63:b90f:: with SMTP id z15mr6727625pge.400.1596523740037;
        Mon, 03 Aug 2020 23:49:00 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x10sm20181877pgp.47.2020.08.03.23.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 23:48:59 -0700 (PDT)
Message-ID: <5f2904db.1c69fb81.70439.20b8@mx.google.com>
Date:   Mon, 03 Aug 2020 23:48:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: gpio-v5.8-2-103-g22cc422070d9
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
Subject: linusw/devel baseline: 117 runs,
 3 regressions (gpio-v5.8-2-103-g22cc422070d9)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 117 runs, 3 regressions (gpio-v5.8-2-103-g22cc422070=
d9)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efconfig | 0/1    =

hifive-unleashed-a00         | riscv | lab-baylibre | gcc-8    | defconfig =
         | 0/1    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig =
         | 4/5    =


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/gpio-v=
5.8-2-103-g22cc422070d9/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: gpio-v5.8-2-103-g22cc422070d9
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      22cc422070d9a9a399f8a70b89f1b852945444cb =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efconfig | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f28fa5b36ffa8f25352c1cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-103-g=
22cc422070d9/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-103-g=
22cc422070d9/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f28fa5b36ffa8f25352c=
1ce
      failing since 48 days (last pass: gpio-v5.8-1-1-gf6d984418ffd, first =
fail: v5.8-rc1) =



platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
hifive-unleashed-a00         | riscv | lab-baylibre | gcc-8    | defconfig =
         | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f28f79ec0f110202a52c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-103-g=
22cc422070d9/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a=
00.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-103-g=
22cc422070d9/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a=
00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f28f79ec0f110202a52c=
1a7
      failing since 48 days (last pass: gpio-v5.8-1-1-gf6d984418ffd, first =
fail: v5.8-rc1) =



platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig =
         | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f28fb4104623ae62e52c1b0

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-103-g=
22cc422070d9/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-li=
bretech-ac.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-103-g=
22cc422070d9/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-li=
bretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f28fb4104623ae=
62e52c1b5
      new failure (last pass: gpio-v5.8-2-97-gb470cef1ffac)
      2 lines =20
