Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF3D2B74F3
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Nov 2020 04:49:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727135AbgKRDrQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Nov 2020 22:47:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726989AbgKRDrQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2020 22:47:16 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85B39C0613D4
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 19:47:16 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id 34so246188pgp.10
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 19:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=qIAw8SORVey5lPIPQxQbQ4vqipKlaOWCa1GBi1DCxM4=;
        b=TwZnLmY65xXbrLqqCo23fzPIe67g+YqXpNDs+yl6ouYOIkdzZccfWWXyuXz5+RcrOA
         ltiGnzaYY0XsjmHA7VoUlsVqRAWl2empLFHvN0Sy692KO1CQl7zCh7JcORCQx5TgLcSr
         2Vi5HytsYz0OaasjRcFmPhTVR6W0MbcHFkJD6lFLjfdm56d9lX8HMM/QDzz+gHdpUjpg
         gBoo8BuSaARWHDxyBA6F9wcR3mnm/qemwxA1eYJUqtDQcUnQZ62WKL1o9KYP6o2xOmOr
         AN8SdAbzKiwTbHZXKaCuYwVimyjmh7TYtuIFiXp2Pu0nIZyeHfSQL1Q8D83zO3uaziZv
         qqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=qIAw8SORVey5lPIPQxQbQ4vqipKlaOWCa1GBi1DCxM4=;
        b=uhbB4FPb07qz8EOL5L1N1F882AbKGdXMQc0etDFJ59+1dDv5a3cf7seyI4Hvzj0P8g
         WqBomwi3D5FXRESpdg2wGvUVyALpcbjp2YjdNKlsiZufkSZHscgXqk5Eeq1SQdh7vzLw
         FYc+iUYZ0Ee2I3ha9UsoUvaVe5aaZ3aw+iza+X5jF6azcibckNWTXnBvp9c/itiRh9Mx
         QqyxWIr8t8m2mscgHO34QhbSJbc9XDBV4eIInm4cyFWu/lj73YxnRCF/GrAQfOqwJys2
         kchxmszXY0B7dLDckzXemjhuh1EJvqI8U3n/NxNFqt2DwoeZh1Fkbe9Oy8o+P3bPkQmw
         f7+w==
X-Gm-Message-State: AOAM533Trg9zmyOcthCkGQnBXQtByjLiRU8gAWToNVRHgUl/Fh/7x4ub
        Q8u15Vu4w9wzH61LFeKDEZGHnzk3XxgqDA==
X-Google-Smtp-Source: ABdhPJy/bcI8zlhsrZox+tDHMG1Vpv+v/N3wxF+mBnacrXZow/emgLkLjBc1yIRrYSAPrfp2rJNWuQ==
X-Received: by 2002:a63:1e5e:: with SMTP id p30mr6257788pgm.159.1605671235761;
        Tue, 17 Nov 2020 19:47:15 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 205sm20290124pge.76.2020.11.17.19.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 19:47:15 -0800 (PST)
Message-ID: <5fb49943.1c69fb81.9c2a9.cc16@mx.google.com>
Date:   Tue, 17 Nov 2020 19:47:15 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.10-rc4-34-gfec3b9548c97
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next baseline: 61 runs,
 2 regressions (v5.10-rc4-34-gfec3b9548c97)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 61 runs, 2 regressions (v5.10-rc4-34-gfec3b9548c9=
7)

Regressions Summary
-------------------

platform       | arch  | lab          | compiler | defconfig | regressions
---------------+-------+--------------+----------+-----------+------------
meson-gxm-q200 | arm64 | lab-baylibre | gcc-8    | defconfig | 2          =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/v5.=
10-rc4-34-gfec3b9548c97/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: v5.10-rc4-34-gfec3b9548c97
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      fec3b9548c97c2d8e96d1b402a1b376ffcdbf8d5 =



Test Regressions
---------------- =



platform       | arch  | lab          | compiler | defconfig | regressions
---------------+-------+--------------+----------+-----------+------------
meson-gxm-q200 | arm64 | lab-baylibre | gcc-8    | defconfig | 2          =


  Details:     https://kernelci.org/test/plan/id/5fb48bb22b3e55f281d8d909

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.10-rc4-34-g=
fec3b9548c97/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.10-rc4-34-g=
fec3b9548c97/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fb48bb22b3e55f=
281d8d90d
        new failure (last pass: v5.10-rc1-20-g27b5ea2fcb90)
        11 lines

    2020-11-18 02:49:17.489000+00:00  kern  :alert : Mem abort info:
    2020-11-18 02:49:17.489000+00:00  kern  :alert :   ESR =3D 0x96000004
    2020-11-18 02:49:17.530000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-11-18 02:49:17.530000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-11-18 02:49:17.531000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-11-18 02:49:17.531000+00:00  kern  :alert : Data abort info:
    2020-11-18 02:49:17.531000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000004
    2020-11-18 02:49:17.531000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-11-18 02:49:17.531000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D0000000044ed9000
    2020-11-18 02:49:17.531000+00:00  kern  :alert : [0000030200000418] pgd=
=3D0000000000000000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fb48bb22b3e55f=
281d8d90e
        new failure (last pass: v5.10-rc1-20-g27b5ea2fcb90)
        2 lines

    2020-11-18 02:49:17.561000+00:00  kern  :emerg : Code: 12000b56 1400000=
3 f9400273 b4000893 (b85fc265)    =

 =20
