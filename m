Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDFC42B7BD0
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Nov 2020 11:53:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725497AbgKRKv2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Nov 2020 05:51:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgKRKv2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Nov 2020 05:51:28 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FF4BC0613D4
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2020 02:51:27 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id 62so915870pgg.12
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2020 02:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=VUidcqq5AHGWzTS4pTZu/8xlWhLxUStAaJbWSoerue8=;
        b=bO0Pfu1QHXdg+7W5OKXl16iQ+ZlvP7Ue/WddJf3oi1bVcyXIBvl7CWKoxHeDJUv2q/
         QP7bkLJCvFTl0+f3svdLWigjL7MAciIwDQ7SXOH3fCRmCEd7cwROt78NEcLOVAFjdh5P
         ze2ZrsDh6Rsc9YNDHSGmz9rrzw9K2D+ACs5ZseZHiFIaB6zqYPXKeUulC+uBd2t6MZq2
         QjMoTF2U4F3gomef1dSpWfcvC+sWi2LvKDkNtqkmCkbqj5gDoZDyLXxbSUsrEJCJLL6R
         WNAXWgE/pew+wNENmeOVDoF6LxsZOL3wbWSbymF+E5nuYkLd7NBEKBtKeken9TVxXJxD
         JKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=VUidcqq5AHGWzTS4pTZu/8xlWhLxUStAaJbWSoerue8=;
        b=SNe567d+V/EcWnfAymB51DNHu7xClRtTRE1EMdxqldEo2h4IfJfY60FjELSpQc8uGq
         7wSn0ruRP0GMXU2q8Kxqmfs/BbYqiv2EZCZ32iZKOKDdPWnRIeSHmd7DV9pfzsS69SUY
         53WRGdm4/KEIPBTJqAh0PKfKAoH/qvTNwyOuyI3pzjAbaPTFDraHfk3GDm7tN9bO9IBk
         PFwrUvXK8OvRoqG0wRnkDP0DVMAxT9fiF3qF2wc0pz+NqTibf0Iq3KvSkKYDaKg11bHw
         PuCU7NM++nc9/8Ayl040WPGiD2NLQO26rSNXt67aNZ3n+BYvORdJ9wlGdiG14er5TDtx
         frNw==
X-Gm-Message-State: AOAM532dhtpIR1d/5YLyTuw+J9pOt/f0v9iOeZ0bw59X2W2ubFmiu0ZN
        7ui8qTJXtVY/oz40yx2wVN6vOICqs5g51g==
X-Google-Smtp-Source: ABdhPJyi9YMsruWQvGAYWSG31dA1ASby8mEz3yBUpnMMr2YnW8Sd024hRv0L2nK/M6yL/yfaq0wr7w==
X-Received: by 2002:a63:5826:: with SMTP id m38mr7530338pgb.240.1605696686405;
        Wed, 18 Nov 2020 02:51:26 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 23sm24622713pfx.210.2020.11.18.02.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 02:51:25 -0800 (PST)
Message-ID: <5fb4fcad.1c69fb81.2eefa.5661@mx.google.com>
Date:   Wed, 18 Nov 2020 02:51:25 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.10-rc4-34-g0f2c7af45d7e
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next baseline: 98 runs,
 3 regressions (v5.10-rc4-34-g0f2c7af45d7e)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 98 runs, 3 regressions (v5.10-rc4-34-g0f2c7af45d7=
e)

Regressions Summary
-------------------

platform        | arch  | lab          | compiler | defconfig | regressions
----------------+-------+--------------+----------+-----------+------------
bcm2837-rpi-3-b | arm64 | lab-baylibre | gcc-8    | defconfig | 1          =

meson-gxm-q200  | arm64 | lab-baylibre | gcc-8    | defconfig | 2          =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/v5.=
10-rc4-34-g0f2c7af45d7e/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: v5.10-rc4-34-g0f2c7af45d7e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      0f2c7af45d7eef8455d7ad39c5326229bf19a2ed =



Test Regressions
---------------- =



platform        | arch  | lab          | compiler | defconfig | regressions
----------------+-------+--------------+----------+-----------+------------
bcm2837-rpi-3-b | arm64 | lab-baylibre | gcc-8    | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb4f11db4976c44f2d8d90f

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.10-rc4-34-g=
0f2c7af45d7e/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.10-rc4-34-g=
0f2c7af45d7e/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5fb4f11db4976c44=
f2d8d912
        new failure (last pass: v5.10-rc4-34-gfec3b9548c97)
        1 lines

    2020-11-18 09:59:57.956000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-18 09:59:57.957000+00:00  (user:khilman) is already connected
    2020-11-18 10:00:12.908000+00:00  =00
    2020-11-18 10:00:12.909000+00:00  =

    2020-11-18 10:00:12.909000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-18 10:00:12.909000+00:00  =

    2020-11-18 10:00:12.909000+00:00  DRAM:  948 MiB
    2020-11-18 10:00:12.924000+00:00  RPI 3 Model B (0xa02082)
    2020-11-18 10:00:13.011000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-18 10:00:13.044000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (379 line(s) more)  =

 =



platform        | arch  | lab          | compiler | defconfig | regressions
----------------+-------+--------------+----------+-----------+------------
meson-gxm-q200  | arm64 | lab-baylibre | gcc-8    | defconfig | 2          =


  Details:     https://kernelci.org/test/plan/id/5fb4f2941f3352c18cd8d90a

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.10-rc4-34-g=
0f2c7af45d7e/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.10-rc4-34-g=
0f2c7af45d7e/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fb4f2941f3352c=
18cd8d90e
        failing since 0 day (last pass: v5.10-rc1-20-g27b5ea2fcb90, first f=
ail: v5.10-rc4-34-gfec3b9548c97)
        10 lines

    2020-11-18 10:08:15.800000+00:00  kern  :alert : Mem abort info:
    2020-11-18 10:08:15.800000+00:00  kern  :alert :   ESR =3D 0x96000004
    2020-11-18 10:08:15.841000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-11-18 10:08:15.841000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-11-18 10:08:15.842000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-11-18 10:08:15.842000+00:00  kern  :alert : Data abort info:
    2020-11-18 10:08:15.842000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000004
    2020-11-18 10:08:15.842000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-11-18 10:08:15.842000+00:00  kern  :alert : [ffcf000044e09470] add=
ress between user and kernel address ranges   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fb4f2941f3352c=
18cd8d90f
        failing since 0 day (last pass: v5.10-rc1-20-g27b5ea2fcb90, first f=
ail: v5.10-rc4-34-gfec3b9548c97)
        2 lines

    2020-11-18 10:08:15.843000+00:00  kern  :emerg : Code: f9401264 d34c503=
b f9446840 b26babe3 (f9400081) =

    2020-11-18 10:08:15.867000+00:00  + set +x   =

 =20
