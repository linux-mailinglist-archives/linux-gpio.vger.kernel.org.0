Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64958257C3C
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 17:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728156AbgHaPYp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 11:24:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728209AbgHaPYo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 11:24:44 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 952F7C061573
        for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2020 08:24:44 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id g6so3104656pjl.0
        for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2020 08:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=EAWwHnav9joza5JeeJTl3WPXQ8sEjRG+6zXGIev/SGk=;
        b=dK3jJkmZbzFvrJvkPzzqLxYSXbVE8AEdoV5fzj2C8LRdzZX8X+QrpznGj+GbVO5CSC
         zcgqyHzuYPYEsYxZw0cm2jouCSC5jTmn6IcSO93+lQVU2zGVdrSXVteDpsb2xUy6a98S
         a/vX/GPBBQKmPnqgdTS4eF27HTiham49r+iDYkbbDTr5rD7fo8Ja66A79zSuNwFvA0R+
         SmamPd6RnPS5SpbcwCl6pcUWUETvNEMTq1NTboYsHHVbyub04vBQOE3HbAJBlINEcl7C
         fsvvL6aIfiRhb7jef3aBftEmau+A2Skdque16DrhKIw20nmrtcC1qmHUE2Ium5M4h//9
         JPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=EAWwHnav9joza5JeeJTl3WPXQ8sEjRG+6zXGIev/SGk=;
        b=JKfMkloEsZqwHsxue2ocRu1ABfuhirw5d1UDda7+ET9gGBkkv3V77YRIqodrUwHx7R
         pAAyRESWdrDis19AzFkUtoJ12sOhjr+ddXjQxBDHCl24AWORAp36QOuQxFrBNmAHRMWN
         iQ9KuqQnmg0mF4gqqmIoGJT7MLoQgju8f4kjnlwv6qjZbUFGpAbHp8irOJwxPrEr56Ig
         v011MG3dwDqdN6TMoUrNkTN0FlpUSx5+lW3/kH9YgElVRCYugv6rz1QowwdacPrR7Mzx
         4FI/2ZgbtMHWJhygB5G8DULUT69Yj6r0IdTbVrhedFlV5IYpxdenmpviymW4KR6V+9yn
         FF0g==
X-Gm-Message-State: AOAM5333AnAVwixJPnqRxtKmgZfHy1VTMCdCpB7XcFYmBn1d9d1rn8RQ
        VFUoc04C+EbyYAq/vutLd/eLekX+YMiqqA==
X-Google-Smtp-Source: ABdhPJwHIfgpmLAqK0YHTVmnw8lDJ4nQ+HBkMCXV/a2EclAVoG3xSNFeLOd6So/Q8GZekYJ0eAzfKA==
X-Received: by 2002:a17:90a:630c:: with SMTP id e12mr1786987pjj.17.1598887482659;
        Mon, 31 Aug 2020 08:24:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q5sm7676857pgi.31.2020.08.31.08.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 08:24:41 -0700 (PDT)
Message-ID: <5f4d1639.1c69fb81.5f71d.93ab@mx.google.com>
Date:   Mon, 31 Aug 2020 08:24:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.9-rc2
X-Kernelci-Report-Type: test
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
Subject: linusw/fixes baseline: 56 runs, 5 regressions (v5.9-rc2)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes baseline: 56 runs, 5 regressions (v5.9-rc2)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | results
-----------------+-------+---------------+----------+-----------+--------
bcm2837-rpi-3-b  | arm64 | lab-baylibre  | gcc-8    | defconfig | 3/4    =

mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig | 0/1    =

rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 82/88  =


  Details:  https://kernelci.org/test/job/linusw/branch/fixes/kernel/v5.9-r=
c2/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   fixes
  Describe: v5.9-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      d012a7190fc1fd72ed48911e77ca97ba4521bccd =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | results
-----------------+-------+---------------+----------+-----------+--------
bcm2837-rpi-3-b  | arm64 | lab-baylibre  | gcc-8    | defconfig | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f49292030cc7b243fdfde64

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.9-rc2/arm64/de=
fconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.9-rc2/arm64/de=
fconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f49292030cc7b24=
3fdfde66
      new failure (last pass: v5.8-rc5)
      1 lines

    2020-08-28 15:53:53.907000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-08-28 15:53:53.907000  (user:khilman) is already connected
    2020-08-28 15:54:09.013000  =00
    2020-08-28 15:54:09.013000  =

    2020-08-28 15:54:09.035000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-08-28 15:54:09.035000  =

    2020-08-28 15:54:09.035000  DRAM:  948 MiB
    2020-08-28 15:54:09.051000  RPI 3 Model B (0xa02082)
    2020-08-28 15:54:09.137000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-08-28 15:54:09.170000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (381 line(s) more)
      =



platform         | arch  | lab           | compiler | defconfig | results
-----------------+-------+---------------+----------+-----------+--------
mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f4929c3cf2fde45e7dfde84

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.9-rc2/arm64/de=
fconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.9-rc2/arm64/de=
fconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f4929c3cf2fde45e7dfd=
e85
      new failure (last pass: v5.8-rc5)  =



platform         | arch  | lab           | compiler | defconfig | results
-----------------+-------+---------------+----------+-----------+--------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 82/88  =


  Details:     https://kernelci.org/test/plan/id/5f49298c9c132e6bc7dfde5c

  Results:     82 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.9-rc2/arm64/de=
fconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.9-rc2/arm64/de=
fconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f49298c9c132e6=
bc7dfde60
      new failure (last pass: v5.8-rc5)
      11 lines

    2020-08-28 15:57:53.843000  kern  :alert : Mem abort info:
    2020-08-28 15:57:53.847000  kern  :alert :   ESR =3D 0x96000006
    2020-08-28 15:57:53.856000  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2020-08-28 15:57:53.857000  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-08-28 15:57:53.859000  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-08-28 15:57:53.863000  kern  :alert : Data abort info:
    2020-08-28 15:57:53.867000  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2020-08-28 15:57:53.870000  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-08-28 15:57:53.877000  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000000ec717000
    2020-08-28 15:57:53.889000  kern  :alert : [0000000000000010] pgd=3D000=
00000eb1bb003, p4d=3D00000000eb1bb003, pud=3D00000000eb0b4003, pmd=3D000000=
0000000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f49298c9c13=
2e6bc7dfde61
      new failure (last pass: v5.8-rc5)
      2 lines

    2020-08-28 15:57:53.910000  kern  :emerg : Code: 1a9f07e7 f10000df 7a40=
08e4 54000521 (f94008c8) =

     * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/i=
d/5f49298c9c132e6bc7dfde8f
      new failure (last pass: v5.8-rc5)  =20
