Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79A522CB1AD
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Dec 2020 01:48:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbgLBArV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 19:47:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbgLBArV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2020 19:47:21 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E2DBC0613CF
        for <linux-gpio@vger.kernel.org>; Tue,  1 Dec 2020 16:46:41 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id q22so82705pfk.12
        for <linux-gpio@vger.kernel.org>; Tue, 01 Dec 2020 16:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2NUQzAdUXGjcUbTWTVmYKjboyKsvj7O4gnGYAiKLzkE=;
        b=FrguryEdCAoak9QEBy4YS0bZhpLr0GvCYn51s7QaM8D4MY3xZgcdBV5yGn1+HNAf7t
         Q8zO7SOKkcSlV7FshR37BGGjpJmoqAyUc39zk8C/mwFPQQcfZYfOmOiDfe47hwDOsx6e
         w9ox2Ki4rP4APNHW/oy0sKzDf6uB8L2iPuqmMxos0PFJaPqp/PI2+NaZT2Oi6b8mF2SV
         30FTijR1GWPCgTNG7eq0vlUcV2CNphmFsz0gg7UcpKv60oiTngIaXtWWo5Vemwticmcn
         C5UZqpIdhH+2q7+yuVsHcbe//QqLaoSamYgkzsiQmyWnz4bgp7UKasWU2JWFjiO90wbN
         UoBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2NUQzAdUXGjcUbTWTVmYKjboyKsvj7O4gnGYAiKLzkE=;
        b=cZ/L0obiomzQMb0qj/Plr8kJqfPeQ1QYJYW62VcRbWKSjNT/uu/3fv4LnJ3/JhxO7x
         DhsoG+cOCxVrVaGY9umYcSIB7JfT2IbqxCJy/IfS5VUkCzVvruCbrE5ejXtZoph/nKcO
         nX7p8Wn4RB6Okiu5M/tF6X1HtKwjs4CoFUu0ft/mDJJDxpUyv/1BmQ2EKonzodfM403t
         NMor0nBNtoSEpUy/XWPsQj2dzq79HzpLPK5tyD6i/vOa8V3n7UkKpvx8A5KxnQUoaJpR
         H8uvtRGaQskjF6pZq65ChkWXD4aWakfqvKshAok2EeeBGjMUZNOX0+DHQOEAdhW10jpr
         OAOw==
X-Gm-Message-State: AOAM533/DXOj4GznZUutZN2Cr417bNNzn6fNVvpHpi1Z8fRvBhvPbuXZ
        CPfFP8Kj4Fl4RMR2cQrvB4afrhFXfxEFPQ==
X-Google-Smtp-Source: ABdhPJx7g0U1U8sRcQUZGq9HyIfblaeU6RcclYz/W6CTfmb8r3J82+BrbafgDxYYPx2982XCYlfVlg==
X-Received: by 2002:aa7:9edb:0:b029:197:f0c9:f5bc with SMTP id r27-20020aa79edb0000b0290197f0c9f5bcmr36724pfq.10.1606870000186;
        Tue, 01 Dec 2020 16:46:40 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e17sm95822pfm.155.2020.12.01.16.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 16:46:39 -0800 (PST)
Message-ID: <5fc6e3ef.1c69fb81.6d339.06ee@mx.google.com>
Date:   Tue, 01 Dec 2020 16:46:39 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.10-rc4-34-g0f2c7af45d7ee
X-Kernelci-Report-Type: test
Subject: linusw/devel baseline: 100 runs,
 2 regressions (v5.10-rc4-34-g0f2c7af45d7ee)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 100 runs, 2 regressions (v5.10-rc4-34-g0f2c7af45d7ee)

Regressions Summary
-------------------

platform                 | arch | lab          | compiler | defconfig      =
    | regressions
-------------------------+------+--------------+----------+----------------=
----+------------
imx6q-var-dt6customboard | arm  | lab-baylibre | gcc-8    | multi_v7_defcon=
fig | 2          =


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/v5.10-=
rc4-34-g0f2c7af45d7ee/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: v5.10-rc4-34-g0f2c7af45d7ee
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      0f2c7af45d7eef8455d7ad39c5326229bf19a2ed =



Test Regressions
---------------- =



platform                 | arch | lab          | compiler | defconfig      =
    | regressions
-------------------------+------+--------------+----------+----------------=
----+------------
imx6q-var-dt6customboard | arm  | lab-baylibre | gcc-8    | multi_v7_defcon=
fig | 2          =


  Details:     https://kernelci.org/test/plan/id/5fc6da8d3fe13322fbc94d38

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.10-rc4-34-g0f2=
c7af45d7ee/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.10-rc4-34-g0f2=
c7af45d7ee/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fc6da8d3fe1332=
2fbc94d3c
        new failure (last pass: v5.10-rc4-34-g0f2c7af45d7e)
        4 lines

    2020-12-02 00:06:29.991000+00:00  kern  :alert : pgd =3D (ptrval)
    2020-12-02 00:06:29.991000+00:00  kern  :alert : [cec60217] *pgd=3D1ec1=
141e(bad)   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fc6da8d3fe1332=
2fbc94d3d
        new failure (last pass: v5.10-rc4-34-g0f2c7af45d7e)
        26 lines

    2020-12-02 00:06:30.033000+00:00  kern  :emerg : Process kworker/0:2 (p=
id: 75, stack limit =3D 0x(ptrval))
    2020-12-02 00:06:30.034000+00:00  kern  :emerg : Stack: (0xc32c7eb0 to =
0xc32c8000)
    2020-12-02 00:06:30.034000+00:00  kern  :emerg : 7ea0:                 =
                    c32c6000 ef78fd80 c189c834 cec60217
    2020-12-02 00:06:30.035000+00:00  kern  :emerg : 7ec0: 00000000 0000000=
0 00000003 00000000 00000000 c47abb1a c3915040 cec6008f
    2020-12-02 00:06:30.035000+00:00  kern  :emerg : 7ee0: cec6020f ef79940=
0 00000000 c09b3958 fffffc84 fffffc84 c3b1ac00 ef799400
    2020-12-02 00:06:30.076000+00:00  kern  :emerg : 7f00: 00000000 c1a1ec6=
0 00000000 c09b3e40 c3b1ada0 c322cf80 ef7961c0 c036077c
    2020-12-02 00:06:30.077000+00:00  kern  :emerg : 7f20: c328b000 ef7961c=
0 00000008 c322cf80 c322cf94 ef7961c0 00000008 c1803d00
    2020-12-02 00:06:30.077000+00:00  kern  :emerg : 7f40: ef7961d8 ef7961c=
0 ffffe000 c0360d68 c328b000 c1a1e357 c137fa14 c0360ac0
    2020-12-02 00:06:30.077000+00:00  kern  :emerg : 7f60: c322cf80 c23312c=
0 c3237240 00000000 c32c6000 c0360ac0 c322cf80 c2117ea4
    2020-12-02 00:06:30.078000+00:00  kern  :emerg : 7f80: c23312e4 c0366ee=
c 00000001 c3237240 c0366d9c 00000000 00000000 00000000 =

    ... (15 line(s) more)  =

 =20
