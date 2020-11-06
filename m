Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 003472A98CF
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 16:53:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727229AbgKFPxW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 10:53:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbgKFPxW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Nov 2020 10:53:22 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 167A0C0613CF
        for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2020 07:53:22 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id y7so1682234pfq.11
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2020 07:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=03QizUT/h9jUmkZcZgF4YHaxO/vZfmEdW4HsTYo7p+o=;
        b=lL6WK0RWmuGDugQd/yf8+uE7Et/DBygVH/+futyfPs1H6miWf+a6iERSZLw1p54yHd
         jVolpTttieQv6CJ9PNcIshBe9SmwfOXkAagfP2euPQyeWX2MqE7kMc0+0l8QdA/QB06B
         ikJSEyQxMId4W4w/UkXjhbd/GRQCP7d10qAu3LnUQnTfrwOO/5XsRym494L8P6/V/nIV
         aWj5K/xn/0sXkQeTJ+40EhmDu+I9/5m+AznVzDL07C9LE2CCkpSO1D3HHAlTuD2Jpt4G
         gLbq/V9innntMlKVFaHWFx6EHJdD6WFdJm6eYWeZvlMgBOqwXmdTIqteAffoZIwV+sWB
         CJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=03QizUT/h9jUmkZcZgF4YHaxO/vZfmEdW4HsTYo7p+o=;
        b=O5VzpKQAGj7PtC1QIFWto8uRfNER+eV7QRddpU3d8/Lub4tcgpLC0w0AVVXDLOKBev
         7T3hcofa2aYEbGfKbac0OYWm1uJ11eKt+QaKooqcQODtOu66qnCvdqXN9OdJfHzsM/+H
         8XriF9hvUxq3IUT2HQlNwQF4pWHoOeYTSPHEBggdsmbGfZZoVFlshr/4EFSDTkg/qXfM
         0Muf4gyunTTEbjjJHpaY3/gu9IajTTS59OT4c1wky/ctxfq1gOuYrxr5+IQ6ZEXzn5rU
         fjxtPTqGqhX+5Bbxaz8PolbPqyw7i2Q/61Rn8BTeY4B0o9R1O7vca9dwsgxnwmmMMcRa
         V6jQ==
X-Gm-Message-State: AOAM5303mgO+yHs7pNqFTvfoSeByEu1ZZu+Je1cq4K4Qp35D9736PGiN
        ZIaaJNl0XaqWw5/svwRDp6ukSHdDvJMA8g==
X-Google-Smtp-Source: ABdhPJzaIxIAbrLe3KV31wOHeZJmjFst1YrSyBXyK3YbaqBOPIERuMqlrGUguu5icCdNMSoRSp7Tyg==
X-Received: by 2002:a17:90b:316:: with SMTP id ay22mr256553pjb.8.1604678001250;
        Fri, 06 Nov 2020 07:53:21 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id gw10sm2809777pjb.24.2020.11.06.07.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 07:53:20 -0800 (PST)
Message-ID: <5fa57170.1c69fb81.9821b.4d63@mx.google.com>
Date:   Fri, 06 Nov 2020 07:53:20 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
X-Kernelci-Kernel: v5.10-rc1-12-g9a6907e948a3
Subject: linusw/for-next baseline: 126 runs,
 2 regressions (v5.10-rc1-12-g9a6907e948a3)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 126 runs, 2 regressions (v5.10-rc1-12-g9a6907e948=
a3)

Regressions Summary
-------------------

platform        | arch  | lab          | compiler | defconfig | regressions
----------------+-------+--------------+----------+-----------+------------
bcm2837-rpi-3-b | arm64 | lab-baylibre | gcc-8    | defconfig | 1          =

imx8mp-evk      | arm64 | lab-nxp      | gcc-8    | defconfig | 1          =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/v5.=
10-rc1-12-g9a6907e948a3/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: v5.10-rc1-12-g9a6907e948a3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      9a6907e948a36e55d45f53b5e82fdb73aa4397f7 =



Test Regressions
---------------- =



platform        | arch  | lab          | compiler | defconfig | regressions
----------------+-------+--------------+----------+-----------+------------
bcm2837-rpi-3-b | arm64 | lab-baylibre | gcc-8    | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa5655b369af741b4db8853

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.10-rc1-12-g=
9a6907e948a3/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.10-rc1-12-g=
9a6907e948a3/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5fa5655b369af741=
b4db8856
        failing since 28 days (last pass: v5.9-rc8-78-g24160a8f7f13, first =
fail: v5.9-rc8-79-g3d6e8262d3c0)
        1 lines

    2020-11-06 14:59:33.541000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-06 14:59:33.542000+00:00  (user:khilman) is already connected
    2020-11-06 14:59:49.182000+00:00  =00
    2020-11-06 14:59:49.182000+00:00  =

    2020-11-06 14:59:49.182000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-06 14:59:49.182000+00:00  =

    2020-11-06 14:59:49.183000+00:00  DRAM:  948 MiB
    2020-11-06 14:59:49.196000+00:00  RPI 3 Model B (0xa02082)
    2020-11-06 14:59:49.284000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-06 14:59:49.315000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (381 line(s) more)  =

 =



platform        | arch  | lab          | compiler | defconfig | regressions
----------------+-------+--------------+----------+-----------+------------
imx8mp-evk      | arm64 | lab-nxp      | gcc-8    | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa5676928b87788afdb8855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.10-rc1-12-g=
9a6907e948a3/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.10-rc1-12-g=
9a6907e948a3/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fa5676928b87788afdb8=
856
        new failure (last pass: v5.10-rc1-11-g50afb29ae413) =

 =20
