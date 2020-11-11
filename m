Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEAC52AEDBB
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 10:29:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbgKKJ3X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 04:29:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgKKJ3W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 04:29:22 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01ACAC0613D1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 01:29:22 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id t18so695316plo.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 01:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8oieCEWdzaPy4Q3rW5gyLhTkgxormOwVCgQ64DnuKUI=;
        b=GPpdMs84Ku8LOtMv4Fwnv0nAb/IFlJqiz78cicteV0E5fQEGVcwGTIxEKi2NBufNoy
         leS2I2KnOZfHFdadyLIvQAQa1R/dQ/0PvSRPdYRVygHhdsajP5WRM44Ni3Mh/gEsKQzf
         kuP6AULYymyEftZXZqU4mnc/oUit6ukrKOSNK+I845ZeVJstY96Cr3OgalJConwQCZfz
         m+KSfFaYaqvjr4TgXOrqFfRCaD2HhkKmKlBh66CGm4iSCEQbzHkxWEtw3lcMJ4c/DJ4Z
         TYfJH+pz0ABqfIONJY+LDh7ryAOGJ4rUWEdzAeFFrkLpa/jNjAW8Gez5H/mqAUg4S1xK
         NQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8oieCEWdzaPy4Q3rW5gyLhTkgxormOwVCgQ64DnuKUI=;
        b=DTM1NdTKdfHfR97pbmvU4BDQr0xBMm1wpxPp6fxn1qrgmWcYmXTZ8gTmmYPCHvAYni
         jMp3dL/ZRgjXVbpjkYz92nLdbkDuXnay+LNoB/YGbULU+15yDJ84TloC8aQEfWvAdYd8
         +hQVZt8J5As7pv9eGiogBrGtBh6/WtUbGwqbXJP2O5NMk+m+mD6ob0F/2zEOXhjVKLm4
         mIgaqdW+ANwNYGEnBzehebcTJi2oUy2Ab9poVAgzYWjgKpmmONmrOyvVg00RKhmAJZnp
         S0t/1IkMA7uJrvuWlX8ZRT/yoN9oiVQMg0ZwG8TSs8b1ytqAwNNHqfIDdonZ9Mac81D8
         PwIg==
X-Gm-Message-State: AOAM530KwJ8kr+RLrg9W58rcasD6bC5R9/pqDNMOFdGeyzf1c76GbyDU
        KhzEyz/OY722lj9SV4wLOa18shsYjtgHtQ==
X-Google-Smtp-Source: ABdhPJyyCIRFcDkNgAgoKUMuZBo4bFntd+ddp11YxhKbgi7hXkNMc1ZflPWMlCnvMDKkww4SOx+Gug==
X-Received: by 2002:a17:90a:8912:: with SMTP id u18mr2994033pjn.40.1605086960281;
        Wed, 11 Nov 2020 01:29:20 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g7sm1661019pjl.11.2020.11.11.01.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 01:29:19 -0800 (PST)
Message-ID: <5fabaeef.1c69fb81.b47f3.3e67@mx.google.com>
Date:   Wed, 11 Nov 2020 01:29:19 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
X-Kernelci-Kernel: v5.10-rc1-20-g4c15bd0cae70
Subject: linusw/for-next baseline: 113 runs,
 2 regressions (v5.10-rc1-20-g4c15bd0cae70)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 113 runs, 2 regressions (v5.10-rc1-20-g4c15bd0cae=
70)

Regressions Summary
-------------------

platform        | arch  | lab          | compiler | defconfig | regressions
----------------+-------+--------------+----------+-----------+------------
bcm2837-rpi-3-b | arm64 | lab-baylibre | gcc-8    | defconfig | 1          =

imx8mp-evk      | arm64 | lab-nxp      | gcc-8    | defconfig | 1          =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/v5.=
10-rc1-20-g4c15bd0cae70/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: v5.10-rc1-20-g4c15bd0cae70
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      4c15bd0cae70169f69840930ccaef7243db158c9 =



Test Regressions
---------------- =



platform        | arch  | lab          | compiler | defconfig | regressions
----------------+-------+--------------+----------+-----------+------------
bcm2837-rpi-3-b | arm64 | lab-baylibre | gcc-8    | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/5faba505ce53b762cddb8854

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.10-rc1-20-g=
4c15bd0cae70/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.10-rc1-20-g=
4c15bd0cae70/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5faba505ce53b762=
cddb8857
        failing since 33 days (last pass: v5.9-rc8-78-g24160a8f7f13, first =
fail: v5.9-rc8-79-g3d6e8262d3c0)
        2 lines

    2020-11-11 08:44:47.953000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-11 08:44:47.954000+00:00  (user:khilman) is already connected
    2020-11-11 08:45:03.115000+00:00  =00
    2020-11-11 08:45:03.115000+00:00  =

    2020-11-11 08:45:03.115000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-11 08:45:03.115000+00:00  =

    2020-11-11 08:45:03.115000+00:00  DRAM:  948 MiB
    2020-11-11 08:45:03.130000+00:00  RPI 3 Model B (0xa02082)
    2020-11-11 08:45:03.217000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-11 08:45:03.249000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (383 line(s) more)  =

 =



platform        | arch  | lab          | compiler | defconfig | regressions
----------------+-------+--------------+----------+-----------+------------
imx8mp-evk      | arm64 | lab-nxp      | gcc-8    | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/5faba6b388b6c3a7c8db885e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.10-rc1-20-g=
4c15bd0cae70/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.10-rc1-20-g=
4c15bd0cae70/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5faba6b388b6c3a7c8db8=
85f
        failing since 4 days (last pass: v5.10-rc1-11-g50afb29ae413, first =
fail: v5.10-rc1-12-g9a6907e948a3) =

 =20
