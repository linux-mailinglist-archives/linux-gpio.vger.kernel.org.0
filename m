Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE41227047
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jul 2020 23:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbgGTVYw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jul 2020 17:24:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbgGTVYv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jul 2020 17:24:51 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D91CFC061794
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2020 14:24:51 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id o22so587675pjw.2
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2020 14:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=na7QSLIyJofnR5xnnp/2yusjoL6/Euq7/ySxV958KnQ=;
        b=mJJT5YHrUcIp3ec7I25mxrR+y57B+S6JcJm1bERh9vIUFcDYoP5QHxBlK9sfi+/KcI
         f0jAHTGen7HykEcEjBcCiY/ACg87u/lXZc18DvMljBxOvRl4tA6hnShuaCVRUwrzsGt/
         pNFYwuuUoBZca5hO50f1/ihcSznk0hC5M72QyCtdfvgETyvSzRe0Is3bw5VrkVwcmQ34
         3xuDMoNSN3bhtsNIjkaEJGxUCfIxNYkYPPvtOjip6/WmVYROM3le8COJaHA+g2LecNw5
         pMgdAakfNeqs5YPY4Fy++bzdwNwLYlM39pTqqo/z4lhpqelK+haoViP0UGXWxuH9yxPW
         GPWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=na7QSLIyJofnR5xnnp/2yusjoL6/Euq7/ySxV958KnQ=;
        b=dmNo1BhM974jK/YqEkEfHmzI9ynvOuJH2syHqst1DQGydoRAY9mRqs+3nui8OO0Ngu
         pMXVQTI588AvnOnskKbXCxZLohaHWMbAj6fNSMiOI0XyxUqEjKjjXlb9wRjg8fquzzXQ
         LXUwrvRuWBFle6ZESr7HDCmXb87Emtbs+BAJ/da86McPOuZYN0Pj2T9EDeiim5hWZJJc
         YexpsKBp4TVeS2pbXYNWBVJPSYI6+Wk77AWktIpATeVCLQwzoRUu8SQuOKJH/qlDkz6S
         fAkNGjUaz8xE6CpC6vtgi0Jxp7U8XmH6wxXc3uiVBGcEvKoqCyODlFrfx2TTgUUPGzQr
         bp/w==
X-Gm-Message-State: AOAM532gW2ui1GmfiRW6tCrX5kgFG+vieIpAHfAHdE+6xQHSySmoy473
        cSYeEpvS8E5RmPyIvFdcvoGHK3spAcQ=
X-Google-Smtp-Source: ABdhPJxz+p4cIT9wnSOwJU2IuDE62SWWXienlHIeVHFbaVnXaWtkBpJ1YHWmjgYT9UK//scUQmBfSw==
X-Received: by 2002:a17:90b:1b06:: with SMTP id nu6mr1334398pjb.106.1595280291029;
        Mon, 20 Jul 2020 14:24:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s22sm15702307pgv.43.2020.07.20.14.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 14:24:50 -0700 (PDT)
Message-ID: <5f160ba2.1c69fb81.e8b6b.332e@mx.google.com>
Date:   Mon, 20 Jul 2020 14:24:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc5-76-gac7642b67d10
X-Kernelci-Report-Type: test
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next baseline: 88 runs,
 2 regressions (v5.8-rc5-76-gac7642b67d10)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 88 runs, 2 regressions (v5.8-rc5-76-gac7642b67d10)

Regressions Summary
-------------------

platform             | arch  | lab          | compiler | defconfig | results
---------------------+-------+--------------+----------+-----------+--------
bcm2837-rpi-3-b      | arm64 | lab-baylibre | gcc-8    | defconfig | 4/5    =

meson-gxl-s905d-p230 | arm64 | lab-baylibre | gcc-8    | defconfig | 0/1    =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/v5.=
8-rc5-76-gac7642b67d10/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: v5.8-rc5-76-gac7642b67d10
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      ac7642b67d10ac32951cbc1e5b3e0d2129ecf899 =



Test Regressions
---------------- =



platform             | arch  | lab          | compiler | defconfig | results
---------------------+-------+--------------+----------+-----------+--------
bcm2837-rpi-3-b      | arm64 | lab-baylibre | gcc-8    | defconfig | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f1601d16a27035fac85bb34

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.8-rc5-76-ga=
c7642b67d10/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.8-rc5-76-ga=
c7642b67d10/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f1601d16a27035f=
ac85bb37
      failing since 4 days (last pass: gpio-v5.8-2-58-g1752911c6d10, first =
fail: v5.8-rc5-68-geb211a587e18)
      2 lines =



platform             | arch  | lab          | compiler | defconfig | results
---------------------+-------+--------------+----------+-----------+--------
meson-gxl-s905d-p230 | arm64 | lab-baylibre | gcc-8    | defconfig | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1602cecc25ff098185bb19

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.8-rc5-76-ga=
c7642b67d10/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s905d-p23=
0.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.8-rc5-76-ga=
c7642b67d10/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s905d-p23=
0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1602cecc25ff098185b=
b1a
      new failure (last pass: v5.8-rc5-69-g70d7cd6c82a9) =20
