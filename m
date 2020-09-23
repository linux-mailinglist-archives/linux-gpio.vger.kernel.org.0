Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2FF274DF6
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 02:45:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbgIWApB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Sep 2020 20:45:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726878AbgIWApB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Sep 2020 20:45:01 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16B05C061755
        for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2020 17:45:01 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id j7so5911908plk.11
        for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2020 17:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=nEQm6K+HoneeS1z0yJoy4VuDoTz9QqoxKqtD089eMLI=;
        b=gJzJ0m0p6i9sKBKTKnlpfCqfpFKJZWOpryTS/sSXCvvv0AUQ8Y5vNpxxi6sGmn+2s+
         l4BScdF+M326oqoxDUUkBIdMAyTDB4Cbg5mxz5t0WQNh2DZ9zMQZJMAYYhVhDBsNfRQJ
         k8XEL7xnQti7WUmcKJ48yz8Dgapeu+Fz60edur14bLDp46zm3YMmngXXuyh0/A+xaMhn
         spnAyuTgon5u1A6knXhdPiHBVey+iCM2qUVB+SRjFlOWFgNg0TyhmGoDZ4dyNY0JMH3J
         2n5KXlpzkViTNLqYcAGq2m7sW786nGPBjn97WlS5YN2Xw+Gj5P9dGColdufs4nIuaZQf
         oWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=nEQm6K+HoneeS1z0yJoy4VuDoTz9QqoxKqtD089eMLI=;
        b=CCCKX6xEU80fZ21YaNCjU1/ugz2dP/Fz16P5bxO8umn270pA7EcSVHG3aeLr7No5o5
         pkuGA37GzKYYZ1MQBuNeuLqA3JNaEYxeP9RdjSlAlON32xc731UpTjRK+2Q1AFQFvYUv
         Nt5JLDvwZSJ3dugwZGuSDX7fuEfacRKHAVUwUQfy469vzYXXUpb17acN6j7EoAKbvrJ2
         LMJreBstDt1TLbAzCv7LEWNp69x5EWTAD/wzH0euQ+jJNexMXt8Xbe0KSIO8XneWcRKZ
         kScM4blWtflME9zfH4iGf/6OqnacauXGs8KPZcYPZhKPQDAB/2ReXc1YTo9SvBSsn3sS
         FqLw==
X-Gm-Message-State: AOAM533widN/DjALgnozQFezihWg2anhoF5hsE1HSjoSynZQ+DpV2DIC
        +Z8E2IrP1PIDPJFinNw0ziS8sr9k4o0NOg==
X-Google-Smtp-Source: ABdhPJwxZ0L5QB79e5ALp58u5SK85i5WUNWplguV14UDRnucj/OhWoGdblPG38IoOZ4FkB2eV9UTsw==
X-Received: by 2002:a17:902:ec02:b029:d1:fc2b:fe95 with SMTP id l2-20020a170902ec02b02900d1fc2bfe95mr7449214pld.79.1600821899949;
        Tue, 22 Sep 2020 17:44:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y203sm16210244pfb.58.2020.09.22.17.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 17:44:59 -0700 (PDT)
Message-ID: <5f6a9a8b.1c69fb81.f0579.82c5@mx.google.com>
Date:   Tue, 22 Sep 2020 17:44:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
X-Kernelci-Kernel: v5.9-rc2-41-g764e64fcda54
Subject: linusw/for-next baseline: 78 runs,
 1 regressions (v5.9-rc2-41-g764e64fcda54)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 78 runs, 1 regressions (v5.9-rc2-41-g764e64fcda54)

Regressions Summary
-------------------

platform              | arch | lab          | compiler | defconfig         =
 | results
----------------------+------+--------------+----------+-------------------=
-+--------
sun7i-a20-cubieboard2 | arm  | lab-baylibre | gcc-8    | multi_v7_defconfig=
 | 0/1    =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/v5.=
9-rc2-41-g764e64fcda54/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: v5.9-rc2-41-g764e64fcda54
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      764e64fcda547847a3a4c981bd3665e96f14ca08 =



Test Regressions
---------------- =



platform              | arch | lab          | compiler | defconfig         =
 | results
----------------------+------+--------------+----------+-------------------=
-+--------
sun7i-a20-cubieboard2 | arm  | lab-baylibre | gcc-8    | multi_v7_defconfig=
 | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6a906f64dfec2562bf9dcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.9-rc2-41-g7=
64e64fcda54/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.9-rc2-41-g7=
64e64fcda54/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6a906f64dfec2562bf9=
dd0
      failing since 5 days (last pass: gpio-v5.8-2-103-g22cc422070d9, first=
 fail: v5.9-rc2-19-ga5d0fe9ff2af)  =20
