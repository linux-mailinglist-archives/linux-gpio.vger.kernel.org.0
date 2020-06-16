Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ACE61FB3DF
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 16:13:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728928AbgFPON0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 10:13:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726606AbgFPONZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 10:13:25 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BA83C061573
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 07:13:25 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id s10so9297695pgm.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 07:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=j3/Ql+0NDr5RXzvoz7kJFkx/jCRBsPzC4PmUdAek+Vc=;
        b=AsDtINo6ypi+vyrg6bUVWIinzgAnrWsguBD/Dc6X5xYpxoajk3c3ZF0Qt2X7LJvZAh
         1QNYcmdromWQl2D9KI/ND8XPRvVJvBWAKh7+YNB/nMJEFMajv1xstZZMByUwXOAw2Im8
         Mg8g58mngmVgYULFfmgLqrJ+VwRg4aLMqW7Ya0K5hMondT2uV8JzaO5vvnkjhCrBHzyQ
         rCzRbqq5BzWDsLrv/BQH781vLNayKeO7uDGwXPg+t9XWAht2oQtCutLUmEvhGaGsltSg
         gx1hD5kYZNw0OctP3K69x+pV6FjPuYLom3bR3U9R4ydKtQHntMy+sIzzb90EyPRF6+G4
         R0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=j3/Ql+0NDr5RXzvoz7kJFkx/jCRBsPzC4PmUdAek+Vc=;
        b=RzZtQRnLF50zlR39xO5EexkCmJPeH+vprX0VkGoqXb2/cvobuFY3rDyly9uiv2zaCq
         zAK2VTHv40RHX6PxatIRqrOjK3UVcv22N8PDSwJSJIN2r4TnZlSVYue/TkhoEY+6plLV
         NmFlgBHPnTpKqk5FS3QSSrXxbrJlhi0R2izx6Zrmw1/ev/zvhppLx1Lv80Wj+OuVc19U
         LTp0Xs4PV5MaLKdXj33jbmG8O6atzOwIqWbL4mxlYKDVuqTgq6QTmil2xv5EsUaa+ga2
         LGhjmfvYgnVmZ+f7Dtg3G3Hau3GQUmv/oeQ1Fa9ziYzxN8fYBuoPzEyMSzXkVrdPHA83
         wPng==
X-Gm-Message-State: AOAM531Hu3scoDrQZvgkZaEpi8/5eo/mxJDgg3yFU72A/kp+u3J4UTZt
        iP7rzMIgP8FNXiM1fab/Kqr4lZE+jSI=
X-Google-Smtp-Source: ABdhPJzF0fwRLo41o5nZc8IQbFye4po/+VariGAtQAXJjwKTZuP1Wy6QMe4PyEVjJaHJCw904Re53A==
X-Received: by 2002:a63:e314:: with SMTP id f20mr2184894pgh.116.1592316803960;
        Tue, 16 Jun 2020 07:13:23 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z1sm2799408pjz.10.2020.06.16.07.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 07:13:22 -0700 (PDT)
Message-ID: <5ee8d382.1c69fb81.c98ba.73af@mx.google.com>
Date:   Tue, 16 Jun 2020 07:13:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.8-rc1
Subject: linusw/devel baseline: 46 runs, 3 regressions (v5.8-rc1)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 46 runs, 3 regressions (v5.8-rc1)

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


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/v5.8-r=
c1/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: v5.8-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      b3a9e3b9622ae10064826dccb4f7a52bd88c7407 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efconfig | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee8c9d4ed3d444d1a97bf0a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.8-rc1/arm/mult=
i_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.8-rc1/arm/mult=
i_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee8c9d4ed3d444d1a97b=
f0b
      new failure (last pass: gpio-v5.8-1-1-gf6d984418ffd) =



platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
hifive-unleashed-a00         | riscv | lab-baylibre | gcc-8    | defconfig =
         | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee8c5b7287c51cc9797bf0a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.8-rc1/riscv/de=
fconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.8-rc1/riscv/de=
fconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee8c5b7287c51cc9797b=
f0b
      new failure (last pass: gpio-v5.8-1-1-gf6d984418ffd) =



platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig =
         | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ee8c9e3a9d8d6bedc97bf31

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.8-rc1/arm64/de=
fconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.8-rc1/arm64/de=
fconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5ee8c9e3a9d8d6b=
edc97bf36
      new failure (last pass: gpio-v5.8-1-1-gf6d984418ffd)
      2 lines =20
