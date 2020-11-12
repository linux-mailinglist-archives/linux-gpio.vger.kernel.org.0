Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 885EB2AFD03
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 02:50:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728063AbgKLBcV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 20:32:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728019AbgKLAI4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 19:08:56 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77D1DC0613D4
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 16:08:56 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id w4so2577065pgg.13
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 16:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=4S3DxjruWsVZ/KDrvwBi5yQXWHr+/IHqDxaeX8SnNJg=;
        b=JipJk4q6XbAUHIy6liqKZF19HvnReQ4SE2OLFvHYelw+1ybiWL21TbK/RGJXtk93fZ
         AFCdhdI3cP8m+0jDMPFLSj+PGp7/v2IqnHCh6g/mKZe/iXqpGtgDGAnvkvN4FxAp/5OX
         hJRbO7yCV9YjRUMuMyug3ZIZWlHD12XVmXd1lB2zU1DiRTe61KipDZaX1ahnkivRLo8I
         VrlM0TsZr2kKHBevv4QJWzeFK6CXh5mqDSncMQPLJ0yolpj/Q2lwGeskrPMUUUF7EuGs
         HjAnfJ52LkKKsJn6c2Msg7NkE+p0iaZTq63ujWNMt7MYix9eyyobME7Q/gGGBy/1sPcA
         NAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=4S3DxjruWsVZ/KDrvwBi5yQXWHr+/IHqDxaeX8SnNJg=;
        b=KRvY6ZzmEs4gTOjV5/KhYDpWP6hDZ6m3VN4JtxOpSn3br8pe0RZU7pfz3ipbT0KDqE
         HiES6Hjsyd4fq2hHTSvUOXEZWr8ifhRWK+S5raT9mxvdCFmicLoeGBivsz/69z51xUpz
         KD/4okYpyrf65SQYyt7JMzweg6lwh3sSY7TT0Ez5kVXS1qp8xpVPBOp/UfwJpBDnh4d/
         gu6UlEkPsU1o4hkTlXU5+XSPdUE5XuR9NroMBWq47iHOpJZLy3LoGRFM6htqJm20L6ik
         BULR8Ngqqt3JXHILgXFE/f2l/FsbtMvzVpGhnD0wX1e0S26T2qQkxo1kyWqYyBKLKrAd
         SkhQ==
X-Gm-Message-State: AOAM531alRWRJg7SmVZXNAegYNUUkLqwxPPBYm4f2jHE/FAxPjdJKo9j
        YEo49czQjTYNxpmAHa8lHP1uiTaESq/uTg==
X-Google-Smtp-Source: ABdhPJzBZ2TK7crhO6IKOqxLI9wN8wqTR0OHk3BfYBwrKSaaHQ38HUodN8pk0a0U8OZyAZIvH4vkvQ==
X-Received: by 2002:a62:3004:0:b029:156:47d1:4072 with SMTP id w4-20020a6230040000b029015647d14072mr40678pfw.63.1605139735755;
        Wed, 11 Nov 2020 16:08:55 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y8sm3926295pfe.33.2020.11.11.16.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 16:08:54 -0800 (PST)
Message-ID: <5fac7d16.1c69fb81.8e4c3.89b7@mx.google.com>
Date:   Wed, 11 Nov 2020 16:08:54 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
X-Kernelci-Kernel: v5.10-rc1-20-g27b5ea2fcb90
Subject: linusw/for-next baseline: 123 runs,
 1 regressions (v5.10-rc1-20-g27b5ea2fcb90)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 123 runs, 1 regressions (v5.10-rc1-20-g27b5ea2fcb=
90)

Regressions Summary
-------------------

platform   | arch  | lab     | compiler | defconfig | regressions
-----------+-------+---------+----------+-----------+------------
imx8mp-evk | arm64 | lab-nxp | gcc-8    | defconfig | 1          =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/v5.=
10-rc1-20-g27b5ea2fcb90/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: v5.10-rc1-20-g27b5ea2fcb90
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      27b5ea2fcb90d2dbc3be03e3a171bc28117eef14 =



Test Regressions
---------------- =



platform   | arch  | lab     | compiler | defconfig | regressions
-----------+-------+---------+----------+-----------+------------
imx8mp-evk | arm64 | lab-nxp | gcc-8    | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/5fac747fbefd3d8078db88eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.10-rc1-20-g=
27b5ea2fcb90/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.10-rc1-20-g=
27b5ea2fcb90/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fac747fbefd3d8078db8=
8ec
        failing since 5 days (last pass: v5.10-rc1-11-g50afb29ae413, first =
fail: v5.10-rc1-12-g9a6907e948a3) =

 =20
