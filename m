Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8457C2ADF1C
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 20:11:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgKJTLv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 14:11:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbgKJTLv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 14:11:51 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6940C0613D1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 11:11:49 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id q5so9331915pfk.6
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 11:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=X16aaeeaAGxYbt0GdtLrFoKPLBb9HwEtH7D1nSp7eiA=;
        b=E9h+TgiKD10E+CKdnFWyqNtD/azM6SIXAxGGgDOdIcaTIM83z7TkF1lgRij5lo7n3T
         OV57LBIDfJyfd1BGpXpsgJ9lXs9JfKs8NiaN4xhjGMuLBXXWecm/+hT42jc4lG88Kv63
         mgj6YzmqMbREa0ka15+SV5B1WlicT62WUGLc/Vx2X/xIiQLLz6uYyH1w1ktrLjZipGJq
         bLid3xn1CE20XjC75cuAQSyowYrDrhn7kNhuf4P5Er5fl+0O4mk4nBruQq+2GnFQx8UQ
         ykFhjlVNgDCFvZAVjUsdZmwlGqAoycwAUlGy+TanR4xvZqHSSeZ032a3yt1tmtxTR2Eh
         8vsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=X16aaeeaAGxYbt0GdtLrFoKPLBb9HwEtH7D1nSp7eiA=;
        b=WyKIXhXPBxyf0vQnMwQwzSVpwFI2pIEZQzQ90+BsOFKHZpAXu2DaLc0VPgb8WT9Glw
         8pN8APe4foc30sGeXzHX1XMW6Cd1QQU3/ZWpc0GLNPHsCVRWgkxVzZgKjo5T2o2z9I/P
         Oy+Qy2LzE3FKbX11g7di/b5g8nsfA6n+b+jqDSSsNfDY4bJW23l2SP5/Y+/esNZdj+RJ
         JVBMIE/mRLc58wOG16/H3HUHoq1BdLgbEELX7n+PfBpPiCUjhUqULc0OwFMCnejomrFe
         zqZ1cnwapDTUyaGCg5wfqo2wdzdNP5e0sbPg6oUST9MMT4hmGk/HVuLeYf1+GF2fxtBx
         mc5A==
X-Gm-Message-State: AOAM531pxm5UmBDlO8pOk5f3iLBUE00zRu9LX+jSFK1F9xiX9J+E8fD6
        3JZBMp0sxjs+meT01Y1FXRL2fbaOHVGiVA==
X-Google-Smtp-Source: ABdhPJwGtmzlwwKj6vbplmuIchdXkEn7GuyOGDkN/jTjflJLp/c7usiCcayIhT0M7yUubiNzBTNmwg==
X-Received: by 2002:a17:90a:5b15:: with SMTP id o21mr572238pji.45.1605035509022;
        Tue, 10 Nov 2020 11:11:49 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l7sm3980790pjg.29.2020.11.10.11.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 11:11:48 -0800 (PST)
Message-ID: <5faae5f4.1c69fb81.2d4fb.9942@mx.google.com>
Date:   Tue, 10 Nov 2020 11:11:48 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
X-Kernelci-Kernel: v5.10-rc1-6-gff0e46434147c
Subject: linusw/devel baseline: 115 runs,
 1 regressions (v5.10-rc1-6-gff0e46434147c)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 115 runs, 1 regressions (v5.10-rc1-6-gff0e46434147c)

Regressions Summary
-------------------

platform        | arch  | lab          | compiler | defconfig | regressions
----------------+-------+--------------+----------+-----------+------------
bcm2837-rpi-3-b | arm64 | lab-baylibre | gcc-8    | defconfig | 1          =


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/v5.10-=
rc1-6-gff0e46434147c/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: v5.10-rc1-6-gff0e46434147c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      ff0e46434147ca330e03a68bb34ba1f446e5c763 =



Test Regressions
---------------- =



platform        | arch  | lab          | compiler | defconfig | regressions
----------------+-------+--------------+----------+-----------+------------
bcm2837-rpi-3-b | arm64 | lab-baylibre | gcc-8    | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/5faadc0e29cb5842d2db887d

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.10-rc1-6-gff0e=
46434147c/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.10-rc1-6-gff0e=
46434147c/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5faadc0e29cb5842=
d2db8880
        new failure (last pass: v5.10-rc1-5-gb9bf97105f4b9)
        2 lines

    2020-11-10 18:27:21.517000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-10 18:27:21.518000+00:00  (user:khilman) is already connected
    2020-11-10 18:27:37.556000+00:00  =00
    2020-11-10 18:27:37.556000+00:00  =

    2020-11-10 18:27:37.557000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-10 18:27:37.557000+00:00  =

    2020-11-10 18:27:37.557000+00:00  DRAM:  948 MiB
    2020-11-10 18:27:37.572000+00:00  RPI 3 Model B (0xa02082)
    2020-11-10 18:27:37.660000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-10 18:27:37.692000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (384 line(s) more)  =

 =20
