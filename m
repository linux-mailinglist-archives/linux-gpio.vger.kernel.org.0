Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68F512DA618
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Dec 2020 03:19:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgLOCRW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 21:17:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726776AbgLOCRP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2020 21:17:15 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EC61C061793
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 18:16:35 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id h186so3053133pfe.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 18:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2tlEcyGqNVZuc9emoEJkFNEUdnDNRUbBXEjfNK7T4x4=;
        b=S/Fc93BAuda/3ko8pflwycIcKhLiPHQ6/hst2o0+p1MJtFspXZZYNFXcD9m2zqath0
         eMkqjuRQAkfYof7UGgiUxQeJv83fa01drg+nXKTiAKtVQqki7VInIidyTXPPRFBpe4Oi
         n3bJVeEF5IPcEHCbxJqa2trR+d1c/HMd93bSlurihuDi06ffe0XK7ilmd2fqAN4bzQ3U
         ICIU7kZDiPRstHylgLnPJFziKhVoTEEBMSZwnBaE/JckGD1rTAOml8eb8/xCc9tTE6CZ
         e2rxFf+s8uPPp2vo8n5ZczCbiFY8n3EDHFcho6llaU1a7TQyboIPEAOHVaMDqU8tAloq
         oxzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2tlEcyGqNVZuc9emoEJkFNEUdnDNRUbBXEjfNK7T4x4=;
        b=qdwldWJOOTNTAs0q1swyM098uQ1g2zR5SrfIpGAnX7Tft7+Gp+eEhfLavPg3G3kITB
         ftlj1u41rM+BZ2/1Rjgy4sRwTWlV4IM/zT3R326cZksLstHkwv70H2FcGGnyANOoJTZC
         RxqDrTvM3YQxloSFMhuqFe+wa2dZ7MrsvkRo+SS0MvFq+MKFWTx8wwrzkWlKBThnBNQ6
         alpWTFnZoaMFYxCdTGT6dpyqcswLX9czhEp6mTtC4MrrLpoLORnIg7fsknUpZCEgGgTB
         tZ1Ri3R22+8Wfp/4xLhadTbBbxRhpTL0U3pqqonmkZlYoDGmngg+PxqLdLKUU2Yr164i
         7i5w==
X-Gm-Message-State: AOAM530JTzeV59mGSTaSyDxJP27ACPhuIQ+BhGkvW7Q6GxmqBgAET+wM
        qrgqUcLoYWWzCXcWes3LNOzzf8AEVK24PA==
X-Google-Smtp-Source: ABdhPJx8COrbAQf7LwZ3MGoayAJIti7LogjBjTVnHvp40YoDcHhMaJ0gisefXuLwxseokAQxB4pdvQ==
X-Received: by 2002:a63:c04b:: with SMTP id z11mr518296pgi.74.1607998594322;
        Mon, 14 Dec 2020 18:16:34 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w4sm20012997pjc.52.2020.12.14.18.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 18:16:33 -0800 (PST)
Message-ID: <5fd81c81.1c69fb81.98389.9764@mx.google.com>
Date:   Mon, 14 Dec 2020 18:16:33 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.10-rc4-93-ga2e5f9277f66
X-Kernelci-Report-Type: test
Subject: linusw/devel baseline: 74 runs,
 5 regressions (v5.10-rc4-93-ga2e5f9277f66)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 74 runs, 5 regressions (v5.10-rc4-93-ga2e5f9277f66)

Regressions Summary
-------------------

platform                  | arch   | lab          | compiler | defconfig   =
       | regressions
--------------------------+--------+--------------+----------+-------------=
-------+------------
imx8mp-evk                | arm64  | lab-nxp      | gcc-8    | defconfig   =
       | 1          =

meson-gxm-q200            | arm64  | lab-baylibre | gcc-8    | defconfig   =
       | 1          =

qemu_x86_64-uefi          | x86_64 | lab-baylibre | gcc-8    | x86_64_defco=
nfig   | 1          =

qemu_x86_64-uefi-mixed    | x86_64 | lab-baylibre | gcc-8    | x86_64_defco=
nfig   | 1          =

sun8i-h3-bananapi-m2-plus | arm    | lab-baylibre | gcc-8    | multi_v7_def=
config | 1          =


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/v5.10-=
rc4-93-ga2e5f9277f66/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: v5.10-rc4-93-ga2e5f9277f66
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      a2e5f9277f66a89e2237d8d7cf0e99a819304f58 =



Test Regressions
---------------- =



platform                  | arch   | lab          | compiler | defconfig   =
       | regressions
--------------------------+--------+--------------+----------+-------------=
-------+------------
imx8mp-evk                | arm64  | lab-nxp      | gcc-8    | defconfig   =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd814b06b2b05c7c3c94cbf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.10-rc4-93-ga2e=
5f9277f66/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.10-rc4-93-ga2e=
5f9277f66/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd814b06b2b05c7c3c94=
cc0
        failing since 9 days (last pass: v5.10-rc4-34-g0f2c7af45d7ee, first=
 fail: v5.10-rc4-47-gc47d9e1b7343) =

 =



platform                  | arch   | lab          | compiler | defconfig   =
       | regressions
--------------------------+--------+--------------+----------+-------------=
-------+------------
meson-gxm-q200            | arm64  | lab-baylibre | gcc-8    | defconfig   =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd813ce5d9795c6edc94cc8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.10-rc4-93-ga2e=
5f9277f66/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.10-rc4-93-ga2e=
5f9277f66/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd813ce5d9795c6edc94=
cc9
        new failure (last pass: v5.10-rc4-91-g65efb43ac94b) =

 =



platform                  | arch   | lab          | compiler | defconfig   =
       | regressions
--------------------------+--------+--------------+----------+-------------=
-------+------------
qemu_x86_64-uefi          | x86_64 | lab-baylibre | gcc-8    | x86_64_defco=
nfig   | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd80eb5bad99d1584c94cef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.10-rc4-93-ga2e=
5f9277f66/x86_64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64-u=
efi.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.10-rc4-93-ga2e=
5f9277f66/x86_64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd80eb5bad99d1584c94=
cf0
        new failure (last pass: v5.10-rc4-91-g65efb43ac94b) =

 =



platform                  | arch   | lab          | compiler | defconfig   =
       | regressions
--------------------------+--------+--------------+----------+-------------=
-------+------------
qemu_x86_64-uefi-mixed    | x86_64 | lab-baylibre | gcc-8    | x86_64_defco=
nfig   | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd80eb9bad99d1584c94cf4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.10-rc4-93-ga2e=
5f9277f66/x86_64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64-u=
efi-mixed.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.10-rc4-93-ga2e=
5f9277f66/x86_64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64-u=
efi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd80eb9bad99d1584c94=
cf5
        new failure (last pass: v5.10-rc4-91-g65efb43ac94b) =

 =



platform                  | arch   | lab          | compiler | defconfig   =
       | regressions
--------------------------+--------+--------------+----------+-------------=
-------+------------
sun8i-h3-bananapi-m2-plus | arm    | lab-baylibre | gcc-8    | multi_v7_def=
config | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd815b95ce103600ec94cec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.10-rc4-93-ga2e=
5f9277f66/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h3-banan=
api-m2-plus.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.10-rc4-93-ga2e=
5f9277f66/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h3-banan=
api-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd815b95ce103600ec94=
ced
        new failure (last pass: v5.10-rc4-91-g65efb43ac94b) =

 =20
