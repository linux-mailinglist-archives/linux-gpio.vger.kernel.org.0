Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 425E729F415
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 19:27:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725802AbgJ2S1R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 14:27:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgJ2S1Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Oct 2020 14:27:16 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9FFFC0613CF
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 11:27:16 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id w21so3048323pfc.7
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 11:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=wPsbDGoGZzP6uJah5LKu+pnTQjxjW33JXrKwp/w8TBY=;
        b=nuv45MpoGZS6q2AfNDNB1kxeXSSpPDaKPUAoqv+pvO967/oP9FYG/0yPq1avwh1Ew8
         foCu5BhrAKYg8QyqBfmHZgX9+C/9wwVCz3PDCqPp50ttJYEd6UBU7DMJY+BvuFunav4G
         oF7ONb4bpQn9FWKkmqSG3CXv5So9VfNItng/O3Z414mOraqABnqnByOapZnWaWX+YKCj
         ax5A9LMxhn5BZexA4Dl51s7rhG7v2Y2P7IYNBli1qckIjHHEfNXqqk9WiNH9QKmNZ7Dh
         MzIRWdgk8LwWQ+RS67QPK0kXxl11cuIoTxSC94bR+VwQ5VlHE+IezOcMZfRV57ofRpQD
         8BYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=wPsbDGoGZzP6uJah5LKu+pnTQjxjW33JXrKwp/w8TBY=;
        b=uc1RjRf4sZD+fjJAM93LJBdu8DNx1rEgvYyXUNrHngczkwYAOCrbWUOvmmSmYMJKPL
         IVs1z1rFyB4pTFbG/2w4gFlp3H7lcalALOdfHfPVn8W6PvgXQGJNxaA/bCaY1l+OTPyy
         WmaTDRB9xaN76xsVfkM5lJsgNnG+h24YJZhF55rAiz8KOKcX8t/Mei7DXdZ9ROE7uCND
         zRhMMqV2SDy/RHeb6cQWANzZnE0k1pbjHH06E7xLRJfO0QWO90Y2n3epuoJfiVgiMaj0
         R/XeOGwTBhq8qxcrfCwuKF6Vg/XN7Rczkm828zQ86ef2t3GcDRlmehdN3RWlN9+9mcbP
         qqZA==
X-Gm-Message-State: AOAM531Lc42hcmXhM131oMNzd+qur911xHHm1++JVU8GHGCrGgA02ypO
        U9PDgmSdR7XWE2P2u6xyRX6vCii/2iA1+g==
X-Google-Smtp-Source: ABdhPJwbja+7FNVT8bCWSVDbXuhgPMbmtHfM0lczzsbRWWOLyFraQuB+BXpTXuymKEdRlSmMFR/NeA==
X-Received: by 2002:a63:4809:: with SMTP id v9mr4876631pga.87.1603996035877;
        Thu, 29 Oct 2020 11:27:15 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d145sm3879709pfd.136.2020.10.29.11.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 11:27:15 -0700 (PDT)
Message-ID: <5f9b0983.1c69fb81.fba2f.8c9e@mx.google.com>
Date:   Thu, 29 Oct 2020 11:27:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.10-rc1-11-g50afb29ae413
X-Kernelci-Report-Type: test
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next baseline: 119 runs,
 2 regressions (v5.10-rc1-11-g50afb29ae413)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 119 runs, 2 regressions (v5.10-rc1-11-g50afb29ae4=
13)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig          | r=
egressions
----------------+-------+---------------+----------+--------------------+--=
----------
bcm2837-rpi-3-b | arm64 | lab-baylibre  | gcc-8    | defconfig          | 1=
          =

panda           | arm   | lab-collabora | gcc-8    | multi_v7_defconfig | 1=
          =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/v5.=
10-rc1-11-g50afb29ae413/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: v5.10-rc1-11-g50afb29ae413
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      50afb29ae41368d750cf46bece2b13065b0e9cef =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig          | r=
egressions
----------------+-------+---------------+----------+--------------------+--=
----------
bcm2837-rpi-3-b | arm64 | lab-baylibre  | gcc-8    | defconfig          | 1=
          =


  Details:     https://kernelci.org/test/plan/id/5f9afd9db4dcfac8ee381020

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.10-rc1-11-g=
50afb29ae413/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.10-rc1-11-g=
50afb29ae413/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f9afd9db4dcfac8=
ee381025
        failing since 20 days (last pass: v5.9-rc8-78-g24160a8f7f13, first =
fail: v5.9-rc8-79-g3d6e8262d3c0)
        1 lines

    2020-10-29 17:34:23.036000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-10-29 17:34:23.036000+00:00  (user:khilman) is already connected
    2020-10-29 17:34:37.899000+00:00  =00
    2020-10-29 17:34:37.900000+00:00  =

    2020-10-29 17:34:37.900000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-10-29 17:34:37.900000+00:00  =

    2020-10-29 17:34:37.900000+00:00  DRAM:  948 MiB
    2020-10-29 17:34:37.915000+00:00  RPI 3 Model B (0xa02082)
    2020-10-29 17:34:38.002000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-10-29 17:34:38.034000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (380 line(s) more)  =

 =



platform        | arch  | lab           | compiler | defconfig          | r=
egressions
----------------+-------+---------------+----------+--------------------+--=
----------
panda           | arm   | lab-collabora | gcc-8    | multi_v7_defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/5f9aff7515a7e05cbf381035

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.10-rc1-11-g=
50afb29ae413/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.10-rc1-11-g=
50afb29ae413/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f9aff7515a7e05=
cbf38103b
        failing since 62 days (last pass: gpio-v5.8-2-103-g22cc422070d9, fi=
rst fail: v5.8-11991-gfc80c51fd4b2)
        60 lines

    2020-10-29 17:44:15.248000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper/0  pfn:9c802
    2020-10-29 17:44:15.253000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper/0  pfn:9c803
    2020-10-29 17:44:15.259000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper/0  pfn:9c804
    2020-10-29 17:44:15.265000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper/0  pfn:9c805
    2020-10-29 17:44:15.271000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper/0  pfn:9c806
    2020-10-29 17:44:15.277000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper/0  pfn:9c807
    2020-10-29 17:44:15.283000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper/0  pfn:9c808
    2020-10-29 17:44:15.289000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper/0  pfn:9c809
    2020-10-29 17:44:15.295000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper/0  pfn:9c80a
    2020-10-29 17:44:15.301000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper/0  pfn:9c80b =

    ... (49 line(s) more)  =

 =20
