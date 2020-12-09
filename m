Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5112D45AB
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 16:45:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbgLIPnG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 10:43:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726110AbgLIPnD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 10:43:03 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DFF9C0613CF
        for <linux-gpio@vger.kernel.org>; Wed,  9 Dec 2020 07:42:23 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id 69so1410938pgg.8
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2020 07:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=94s+C2pgmg1Kx2RBwDa9+UTBPP6bm4dJfGR23kr5sZk=;
        b=uGHjrqjWL9vz7tktfiebAc65UK8Kab97bY7c6i8Fczp4ook/Cj6aSkoknPy1cfMGeb
         7KKCGYrIlw4SqJVzJDNZ8BS45Ys6ytrCFUQ7aEeoW+ze1nl4tdOJ5YhLyjWer1iICJca
         zeXcBMQWKSj+5ug9fMa5Q+dzxATyQS19rxiaW2eBy/JrZgABYBJAwz8wgvfjzwzmU4eJ
         KBamfgv861SZxKVAMmjiQFzOQFl/VltB1+DNovvShSEri2PK6TDroVtIb77pi0Re0o6P
         oXApYEKzTLPA/3Q8pkCup0kUFajDcqhErz9Idje2dG+DaHvm5ubcd9LBFWqqM3tgEHd+
         kksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=94s+C2pgmg1Kx2RBwDa9+UTBPP6bm4dJfGR23kr5sZk=;
        b=K4ywBDsWZrvV1Lrwp0NFVJEhlguYmUY3iUa65OzIrNILb2y8BWtFnUo0XorKYGIBrJ
         2ao+F/Gh/6jViKP322QFY73Tq+4ezixiNZDVVi7NNfCkhv9UxuyqPwzSpLYRp5jyp0jg
         CMVLy/ne0x6SfDnGR+xHbECeqHFzaY9bi1yFtWDY4+5834SQJ6U8YvRAOOUlYWJ4gpGX
         gjg8Wfql5UfnYU7W5g1UjHBRrrZRh/eRB1HEmEN3XzX5L/GofbNmHmQ6v6Zi4/gGYyKK
         eQd7wq4AeqDsekVpmXN2xGlCI7/Euchpj5SMFl0dr2yeHClNkpaiai130kAwN33uh59P
         SBug==
X-Gm-Message-State: AOAM530jtiXSlfLnGxjeMDy+s1o27Nj8QGjkCk2w12b+j5hkSYGneUsI
        r+LS63N2wV+izmwSZIsX1NZlOfjAeod1Fw==
X-Google-Smtp-Source: ABdhPJyRHdoNYpSeFoVGvYR8O11U5ODJFjERoCHTl8UM9iYGmw853QgxEdyWH+ZuhUNq2gmAAwjJSw==
X-Received: by 2002:a63:c407:: with SMTP id h7mr2518634pgd.150.1607528542276;
        Wed, 09 Dec 2020 07:42:22 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 22sm2919323pfn.190.2020.12.09.07.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 07:42:21 -0800 (PST)
Message-ID: <5fd0f05d.1c69fb81.b5716.551f@mx.google.com>
Date:   Wed, 09 Dec 2020 07:42:21 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.10-rc4-85-g40b37008eb5a
X-Kernelci-Report-Type: test
Subject: linusw/devel baseline: 120 runs,
 1 regressions (v5.10-rc4-85-g40b37008eb5a)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 120 runs, 1 regressions (v5.10-rc4-85-g40b37008eb5a)

Regressions Summary
-------------------

platform   | arch  | lab     | compiler | defconfig | regressions
-----------+-------+---------+----------+-----------+------------
imx8mp-evk | arm64 | lab-nxp | gcc-8    | defconfig | 1          =


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/v5.10-=
rc4-85-g40b37008eb5a/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: v5.10-rc4-85-g40b37008eb5a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      40b37008eb5a300ea35aa83432c213b6028313d5 =



Test Regressions
---------------- =



platform   | arch  | lab     | compiler | defconfig | regressions
-----------+-------+---------+----------+-----------+------------
imx8mp-evk | arm64 | lab-nxp | gcc-8    | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd0e600b945a87662c94cc5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.10-rc4-85-g40b=
37008eb5a/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.10-rc4-85-g40b=
37008eb5a/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd0e600b945a87662c94=
cc6
        failing since 3 days (last pass: v5.10-rc4-34-g0f2c7af45d7ee, first=
 fail: v5.10-rc4-47-gc47d9e1b7343) =

 =20
