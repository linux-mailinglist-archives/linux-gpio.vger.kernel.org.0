Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1169A1FB16B
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 15:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726306AbgFPNBk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 09:01:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727966AbgFPNBQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 09:01:16 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76CA9C061573
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 06:01:15 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id k2so1409896pjs.2
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 06:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ALZLfzm/PmuByry6svIPzdLjReoP86ruKdENW9iFROk=;
        b=hqrStfAj/fbbar7MiOqeO97gyC/1wGhEPDfyoYqJu44F8xH3NLziz4JuBQKHEyqm+b
         1HPirwPJ3EPd36BMgfxxby9RQwZFHvTjN733ibP7ES/eDxzf/wra4CBX0pOylC3xxYmM
         bGRUm3/z7VNgPFuAMNaeYl6UPTOzHh7rAcsVq5Bk7j+8p7sm6Ozef4P72N3qK5w8d6Mb
         LuDM1/xqn+ZDxtbNuabl4C0TsIVb7QMDnn41Rnn7ycxJewThO/9luyACjbz1mggPtnA6
         DtkBO2HC/xe47waTBLz+sWnVoIr+bzQdtYCNGxLWEwrffbUS5tq9oJFGJ8jt+SYL2Hr1
         oYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ALZLfzm/PmuByry6svIPzdLjReoP86ruKdENW9iFROk=;
        b=JyrNJgQbTvBP2lHR71tuHpsW1r3U1aDJ2h7BfaQ7Ta2wJdyBGHQyLnBse6TY48cDS5
         XqLAO2LBHQJWoWOt4Uslfm5o15hBQXApkzc+5mBPSx0hyL5KnKg5/YSlxsxKR2u++O9E
         TEW4Rm3qHBhJHd740bngYE4kgxSTD/cnXAwtD++ZLOwxRs5nUC0r87YgzdUHLTAqpgPj
         xgSDu1y+GcXwF50aCsaw9ZszKRrnMAwAkNBSoG5i7q0LeXI35Pyyrq7UdpW/Q8dn1+gQ
         5YR9VOTINuqvEAf6tRvuIGGdExczH4rmpDkspc7+9vH8cA4IBCUrpc1MVprFgF8R80o4
         ikuA==
X-Gm-Message-State: AOAM532DOcyIpc4ghNa3myS7RenssvUxB+Yg6axRKrsz2e3toFWvv92D
        mjI2uu6AqoqNMwTdDJtrCshhhbiEq5A=
X-Google-Smtp-Source: ABdhPJyEHKWAVjKg1B6mN+ZdzZSK3E8sLJWNuE1gHXSbF8hv+mSUoEh6XFK8EFTpp7I9q74UQuU7uA==
X-Received: by 2002:a17:90b:3793:: with SMTP id mz19mr2614053pjb.12.1592312474095;
        Tue, 16 Jun 2020 06:01:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u12sm2515261pjy.37.2020.06.16.06.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:01:13 -0700 (PDT)
Message-ID: <5ee8c299.1c69fb81.e610b.6dd9@mx.google.com>
Date:   Tue, 16 Jun 2020 06:01:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.8-rc1-2-g861254d82649
Subject: linusw/fixes baseline: 45 runs,
 3 regressions (v5.8-rc1-2-g861254d82649)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes baseline: 45 runs, 3 regressions (v5.8-rc1-2-g861254d82649)

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


  Details:  https://kernelci.org/test/job/linusw/branch/fixes/kernel/v5.8-r=
c1-2-g861254d82649/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   fixes
  Describe: v5.8-rc1-2-g861254d82649
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      861254d826499944cb4d9b5a15f5a794a6b99a69 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efconfig | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee8b96b996e5c179d97bf17

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.8-rc1-2-g86125=
4d82649/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xpl=
ained.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.8-rc1-2-g86125=
4d82649/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xpl=
ained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee8b96b996e5c179d97b=
f18
      new failure (last pass: gpio-v5.7-3-2-gcdf59728a3cd) =



platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
hifive-unleashed-a00         | riscv | lab-baylibre | gcc-8    | defconfig =
         | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee8b704519257687d97bf11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.8-rc1-2-g86125=
4d82649/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.8-rc1-2-g86125=
4d82649/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee8b704519257687d97b=
f12
      new failure (last pass: gpio-v5.7-3-2-gcdf59728a3cd) =



platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig =
         | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ee8b93a8aa561f1f297bf16

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.8-rc1-2-g86125=
4d82649/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-librete=
ch-ac.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.8-rc1-2-g86125=
4d82649/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-librete=
ch-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5ee8b93a8aa561f=
1f297bf1b
      new failure (last pass: gpio-v5.7-3-2-gcdf59728a3cd)
      2 lines =20
