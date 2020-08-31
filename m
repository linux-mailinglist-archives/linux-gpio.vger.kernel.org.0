Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8C55257C3B
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 17:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728216AbgHaPYo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 11:24:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728156AbgHaPYn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 11:24:43 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D713C061573
        for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2020 08:24:43 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id z15so3180178plo.7
        for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2020 08:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Ik20QlEI9CeEDA1VfE3QZkH2ShLWWXD8OErsSe8sT/A=;
        b=rfYhoCs/uyYGVCF4A9YWF9SY49wmavAkfqGSiZtnQDDmT7HiNjRqhQmw9mPpuYvFuF
         w23xWoDZq9BRw2gMFC2pOP96qk/w+KmQ7gKviIfIzJcO0/Y3l+u/+d1ZwktMPTqA0Py3
         5L2/FCbuCxBOcXvnmAN3oIeUH0lp9PllOm/VnvnzuOvhBOLQHphmG6/L8Ec+TPdR2pGA
         fEVSZ3bWWBe0YxpSBGjJVdlggMGgZJbdAi6IONcdZ6ZO3MvKD59mRyU5UNCXMvxA/Qvs
         4i0xs7HJU0MoRTUXn+ECOQWd3eyh6vCYOF2ul5SXoXd+198SOUNbTcCF6nuAQnL3XYUj
         Gyww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Ik20QlEI9CeEDA1VfE3QZkH2ShLWWXD8OErsSe8sT/A=;
        b=jEiL3BJzq75aH3ffMSOipY8UnOeISRtqtfETUW8XifRddjyRLVpkPYOQRTpHD/AeSB
         p6Dmd5EdztrtZJOPijJVtH04PG3onrBuvPpUmAHq0Xp4k7DQOT9PWDVWKdLOMup/gsE2
         FBElFf1d9HQSpY0NvDcH29QKU3MtJM2AR8yEae0IGgT3kxOKo2zsGUn7gtRx+dpq1HNX
         7MycZGDogHttn3xEtmw3P2j/AdnxRiOcqQaqk7UDzWtkbWei/MgRelKad/RGN412x7z0
         ZP/XGtK67+mNIh6ScFrlFL8NFQxEvtuYxJ3SD58Vv+F/4KTuFU6KHUDhS+37t5jUEtdV
         lxag==
X-Gm-Message-State: AOAM533364HiXARWDbB3DpLknS9zthGy3t2kWkIguR40FfA/BqiWx2ei
        cFUSQAHX0+xfmiAv1+8mYwsSzMHZ77ZDJw==
X-Google-Smtp-Source: ABdhPJwgMyoJg2dL4p2vbhlJzxJJ04DbVZTYRcpCDRibyTMn0WnsRuE0KSx7qm9wgUexIbS42rhwbA==
X-Received: by 2002:a17:90a:af84:: with SMTP id w4mr1806558pjq.94.1598887482002;
        Mon, 31 Aug 2020 08:24:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u123sm8350327pfb.209.2020.08.31.08.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 08:24:41 -0700 (PDT)
Message-ID: <5f4d1639.1c69fb81.c64c2.b431@mx.google.com>
Date:   Mon, 31 Aug 2020 08:24:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-11991-gfc80c51fd4b2
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
Subject: linusw/for-next baseline: 86 runs,
 3 regressions (v5.8-11991-gfc80c51fd4b2)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 86 runs, 3 regressions (v5.8-11991-gfc80c51fd4b2)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig          | =
results
-----------------+-------+---------------+----------+--------------------+-=
-------
mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig          | =
0/1    =

omap4-panda      | arm   | lab-collabora | gcc-8    | multi_v7_defconfig | =
4/5    =

rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig          | =
84/88  =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/v5.=
8-11991-gfc80c51fd4b2/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: v5.8-11991-gfc80c51fd4b2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      fc80c51fd4b23ec007e88d4c688f2cac1b8648e7 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig          | =
results
-----------------+-------+---------------+----------+--------------------+-=
-------
mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig          | =
0/1    =


  Details:     https://kernelci.org/test/plan/id/5f492a51877f65eb19dfdeac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.8-11991-gfc=
80c51fd4b2/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.8-11991-gfc=
80c51fd4b2/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f492a51877f65eb19dfd=
ead
      new failure (last pass: gpio-v5.8-2-103-g22cc422070d9)  =



platform         | arch  | lab           | compiler | defconfig          | =
results
-----------------+-------+---------------+----------+--------------------+-=
-------
omap4-panda      | arm   | lab-collabora | gcc-8    | multi_v7_defconfig | =
4/5    =


  Details:     https://kernelci.org/test/plan/id/5f492b0e9ea7783b3ddfde77

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.8-11991-gfc=
80c51fd4b2/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.=
txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.8-11991-gfc=
80c51fd4b2/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f492b0e9ea7783=
b3ddfde7b
      new failure (last pass: gpio-v5.8-2-103-g22cc422070d9)
      60 lines

    2020-08-28 16:04:24.672000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-08-28 16:04:24.678000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-08-28 16:04:24.684000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-08-28 16:04:24.690000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-08-28 16:04:24.696000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-08-28 16:04:24.702000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-08-28 16:04:24.708000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-08-28 16:04:24.714000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-08-28 16:04:24.720000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    2020-08-28 16:04:24.726000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80b
    ... (49 line(s) more)
      =



platform         | arch  | lab           | compiler | defconfig          | =
results
-----------------+-------+---------------+----------+--------------------+-=
-------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig          | =
84/88  =


  Details:     https://kernelci.org/test/plan/id/5f492a47176a743fd6dfde67

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.8-11991-gfc=
80c51fd4b2/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.8-11991-gfc=
80c51fd4b2/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f492a47176a743fd6dfdea7
      new failure (last pass: gpio-v5.8-2-103-g22cc422070d9)  =20
