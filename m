Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 117822027A8
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jun 2020 02:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728978AbgFUApL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Jun 2020 20:45:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728531AbgFUApK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Jun 2020 20:45:10 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6880C061794
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2020 17:45:09 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id v11so6391542pgb.6
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2020 17:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=egH0RbfE6eNHdKtvdYtJRec2SaZzxPM10+x9gjJk32k=;
        b=w1GYv+bgi/Fc0ZHVkiNYsbeo7TkuQ+0XP1IPLrAlezqOWvEaJlWQ8CASGgoGUoPCaz
         KaH7l16z+w+RoJDMpvnKZsJJ/D13GX/YDZl4fPmdqxwwAKZySOJ7Zp6GC2YEb6AbuD1A
         PiWqGbXDH6x8jAI8UC2weZauKezVFR9h6e92QXzRb1uGkNuWQYMQph9LsM10uMI+kKX1
         PpWZzLQmpka98/DMUvVorNJ+P5SSHKOHvNfjQDAZ1B4otmc4EwNLAirdHKoCe5KSRC60
         0LFwhWi5ejmGBOEu58iko2o4inYHaSJXDk1amQ39yuUGesbmjY8lxU9jbxZ2G2dMuU9G
         yaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=egH0RbfE6eNHdKtvdYtJRec2SaZzxPM10+x9gjJk32k=;
        b=D0zh3wBI4Glrr8KPzfUspmZBm3hxwMl6SVh9ipGhhZYjQuy+fHt5B2SJCMWabCZIwi
         TDbmweXox8oG2VvhL+7DW33HRG5bd/0Ba27PxnhF8ZPqmULRdRnNHyfNzX2PCFpn6esb
         eZUq9dzu5+UOHqBd93MwfTkM9pHMBXh7s0EffKmLwtykqFnKOBMDOE4K8WWj4Efz/k18
         87Eeh20Xsbs8uJOKN3E5w24t5lynK3nfYSdCvcKbf736zCXDsXYwCedQIq6VrzIiTdYK
         Byhnj3Bwdgt736XlEdXWd/XAoVkkNaj4tcRtCu68yBP4A02YJk5wORFcBhLinprQ7kV8
         +PQQ==
X-Gm-Message-State: AOAM533umE5e2riz9OYlPIlAvTjuxLLz4njwifnh/SiYLigpSTUm3NyF
        n+S3DrAHOQtJ8b9bhXxQbUl4RCf2zy0=
X-Google-Smtp-Source: ABdhPJyWdSUR316n7J/AdEO0eWbFOKz+u4lh2YhKEh1STtVvu/M+vRVZUB8txp6s3yCSgHvMPpOYZA==
X-Received: by 2002:a62:cdc7:: with SMTP id o190mr13989904pfg.292.1592700309179;
        Sat, 20 Jun 2020 17:45:09 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g9sm9615756pfm.151.2020.06.20.17.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 17:45:08 -0700 (PDT)
Message-ID: <5eeead94.1c69fb81.f15c7.e036@mx.google.com>
Date:   Sat, 20 Jun 2020 17:45:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.8-rc1-8-g84651e81ee33
Subject: linusw/devel baseline: 46 runs,
 3 regressions (v5.8-rc1-8-g84651e81ee33)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 46 runs, 3 regressions (v5.8-rc1-8-g84651e81ee33)

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


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/v5.8-r=
c1-8-g84651e81ee33/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: v5.8-rc1-8-g84651e81ee33
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      84651e81ee3323c7d544edfa6ac6026425fe5a52 =



Test Regressions
---------------- =



platform              | arch  | lab          | compiler | defconfig        =
  | results
----------------------+-------+--------------+----------+------------------=
--+--------
at91-sama5d4_xplained | arm   | lab-baylibre | gcc-8    | multi_v7_defconfi=
g | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5eeea4d35c3f3738c497bf09

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.8-rc1-8-g84651=
e81ee33/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xpl=
ained.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.8-rc1-8-g84651=
e81ee33/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xpl=
ained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5eeea4d35c3f3738c497b=
f0a
      failing since 4 days (last pass: gpio-v5.8-1-1-gf6d984418ffd, first f=
ail: v5.8-rc1) =



platform              | arch  | lab          | compiler | defconfig        =
  | results
----------------------+-------+--------------+----------+------------------=
--+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre | gcc-8    | defconfig        =
  | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5eeea3c6cc6f80e4ca97bf0d

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.8-rc1-8-g84651=
e81ee33/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.8-rc1-8-g84651=
e81ee33/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5eeea3c6cc6f80e4=
ca97bf10
      new failure (last pass: v5.8-rc1)
      2 lines =



platform              | arch  | lab          | compiler | defconfig        =
  | results
----------------------+-------+--------------+----------+------------------=
--+--------
hifive-unleashed-a00  | riscv | lab-baylibre | gcc-8    | defconfig        =
  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5eeea082a73eb9d39f97bf3e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.8-rc1-8-g84651=
e81ee33/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.8-rc1-8-g84651=
e81ee33/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5eeea082a73eb9d39f97b=
f3f
      failing since 4 days (last pass: gpio-v5.8-1-1-gf6d984418ffd, first f=
ail: v5.8-rc1) =20
