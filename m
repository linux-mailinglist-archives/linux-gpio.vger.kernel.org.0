Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45BE725833A
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 23:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728627AbgHaVFM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 17:05:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728505AbgHaVFK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 17:05:10 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D03AC061573
        for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2020 14:05:10 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id e33so1396920pgm.0
        for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2020 14:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9SDMjFW+lMEprLpZJvDjdgA9Hc0H2rnMYW/OSjB29tc=;
        b=ApAx0Fu/9281jQmyWBajOG8yf0qs5qw5qvbIMtMtCFDJU68aeNqVOw+snbKSWdiMFG
         oZk/2MvYz+i2F1BZhlGZ+f0WapAM92p6mSJWWdQE3P34Myu+4YjeW6iyul8iHxdQZcWX
         d2UGdJ98L92k5Du8qNuFUGREpuu/sSyMxWfFkDociJBbJXFcHpxmLY2u/S69JwgVXqDP
         CYqjh+X2fEroEb+pv3ykU2EZzsHzY4oSrtfh/W8yVLwhsC+Z56+WhlPU88RU2BnOtMfW
         P3r7szsrryvTQhPjud1ftnKiUEgVKPHNMolqG0RCzSDFrGke2++qYM7kQ+ZFOXYFJjNQ
         JW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9SDMjFW+lMEprLpZJvDjdgA9Hc0H2rnMYW/OSjB29tc=;
        b=mAeG63YruJ550UTCX/OhT3x03YMEBzR8nOlSGeBJS7MDxX7s7UMMmFj8+gg+W/de7h
         LIhXHWYAgdXzacSxlvUaetDl1M2I/1I87C5A7X+JkIvuTL5bW4SA031wbiZj9Jdv6/V0
         qlGSlxbJbiOQW9OaTkLc8HLcqiP7FZ7ckZsuC2p84AJ9qGNaJc4ND0KXGljrWUkK/SDU
         JdXxw+SfclXMrNQeYw6yZIS7WmCSYAJ9LzQJO4TOKeR7KEdaEqLpbjogmgmjvCdk5UHd
         FLrvEHE+m8UMHRazY6Y/Bh4YhKkJ7Fb+6ZOmdv6l25FTW+gxid5ppI9NFzyiz6OCto45
         zSUw==
X-Gm-Message-State: AOAM533NN2fIJk8rjODfDnNseHaLcorR2w+gX36BGEWc571WNXSTjDBI
        Yf4PigNEqIg+OIzT1DL3F1n6IIWUXYJWIQ==
X-Google-Smtp-Source: ABdhPJyqJqWex1yWcdrme7oHeJGpvyl4r4E6u0VRACwEQ5QpkvHr9Zbp6VrL7vS+Z9XbAnhwXU7K3A==
X-Received: by 2002:a63:a18:: with SMTP id 24mr2540758pgk.283.1598907909435;
        Mon, 31 Aug 2020 14:05:09 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k17sm9005111pfg.99.2020.08.31.14.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 14:05:08 -0700 (PDT)
Message-ID: <5f4d6604.1c69fb81.9e67.dab9@mx.google.com>
Date:   Mon, 31 Aug 2020 14:05:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.9-rc1-10-gfeeaefd378ca
Subject: linusw/for-next baseline: 63 runs,
 2 regressions (v5.9-rc1-10-gfeeaefd378ca)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 63 runs, 2 regressions (v5.9-rc1-10-gfeeaefd378ca)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | results
-----------------+-------+---------------+----------+-----------+--------
mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig | 0/1    =

rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 84/88  =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/v5.=
9-rc1-10-gfeeaefd378ca/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: v5.9-rc1-10-gfeeaefd378ca
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      feeaefd378cae2f6840f879d6123ef265f8aee79 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | results
-----------------+-------+---------------+----------+-----------+--------
mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f4d5c2064bb9c009a081156

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.9-rc1-10-gf=
eeaefd378ca/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.9-rc1-10-gf=
eeaefd378ca/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f4d5c2064bb9c009a081=
157
      failing since 3 days (last pass: gpio-v5.8-2-103-g22cc422070d9, first=
 fail: v5.8-11991-gfc80c51fd4b2)  =



platform         | arch  | lab           | compiler | defconfig | results
-----------------+-------+---------------+----------+-----------+--------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f4d5b4d93155e8f51081138

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.9-rc1-10-gf=
eeaefd378ca/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.t=
xt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.9-rc1-10-gf=
eeaefd378ca/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f4d5b4d93155e8f51081178
      failing since 3 days (last pass: gpio-v5.8-2-103-g22cc422070d9, first=
 fail: v5.8-11991-gfc80c51fd4b2)

    2020-08-31 20:19:21.712000  /lava-2583679/1/../bin/lava-test-case
      =20
