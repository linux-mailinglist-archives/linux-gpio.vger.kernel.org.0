Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18A35224347
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 20:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727821AbgGQSnD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 14:43:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbgGQSnD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2020 14:43:03 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AA61C0619D2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 11:43:03 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d1so5819596plr.8
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 11:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=rUD2KPnLUNDL7CK+HnfLP+bw7yQIIuKr9ajo85O+EY0=;
        b=OUdT0Hf4vwj9wnz8ScramBrtitVAc3uCK43ysBTR9lihTqNUD0JH8XuWFpqZWP5K0u
         yoRDG7PjEcfhNQgUZNtorpUFwekfL5ddLwnzj5vcB+8jY4Fchlw7v9g8GateEvlTSmYE
         jvEikMv3TrMIC2DDh+nmdwS1iPap07GMuxw2hin4WdJeMKovgNlX6v6c9QytjhKk7OqH
         L5ZEDPA5QhPokzSO72taQ54B7IsNj77UtOztBClecL0fJWDlvm2L5/XAKKvTxl/6gGiE
         qlbysnESODAsCR7CihcFPhkx+Cr/ZjbdtVcAOnibVyIzpFHjdiTHZ+MP1/rqNMNRYTMn
         7b/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=rUD2KPnLUNDL7CK+HnfLP+bw7yQIIuKr9ajo85O+EY0=;
        b=rC3XakADbFVdb6CqYkQ8vaYRtRkqm65xBXGk2WXJSBeP2U7GUkKMz9feb/jn/gZlIJ
         1agjZxVopDD7FgiDd80xic+/p/SCatagOZsQrSy7xfMJ+VFluYtU6P1kx2c7eZtXRMv7
         naHAov3M1rrw04jKzgtr3ojG4YkKZdGb4TpeTgDqGlCh+YGbruI4qrLMjqJ3NJ1l6nLF
         SRWX1DreabQHhwY37nWdSwq2o0ex9JqcM9Fyx7RWCe0l0oaj4BK1u7nprpfQfH7ak0OV
         SJi9SHwdZ5NBqhb27VgkwUzhjQIEIKNBrqoo4zCPaH3hhLxIk4FCQaI9ZWSjCViDMy+p
         WvMA==
X-Gm-Message-State: AOAM530zY38kANCXz5vr2nnAjHHjR0LqckpTRHEpadDyX5WdTLsPtVq+
        kZu6OXTrlXeOCenxTLYLCqAurLHaVc0=
X-Google-Smtp-Source: ABdhPJyQmo1MGLqLGKNj9bO8/kCfWBylksgaQf6YLB/k1ypE55PqeB8elhs1mk4pzHYTCJ9+d0jsuQ==
X-Received: by 2002:a17:90b:4a4e:: with SMTP id lb14mr11750772pjb.196.1595011382448;
        Fri, 17 Jul 2020 11:43:02 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ng12sm3626776pjb.15.2020.07.17.11.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 11:43:01 -0700 (PDT)
Message-ID: <5f11f135.1c69fb81.8c439.c596@mx.google.com>
Date:   Fri, 17 Jul 2020 11:43:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: gpio-v5.8-2-68-g80606cb24161
X-Kernelci-Report-Type: test
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel baseline: 71 runs,
 2 regressions (gpio-v5.8-2-68-g80606cb24161)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 71 runs, 2 regressions (gpio-v5.8-2-68-g80606cb24161)

Regressions Summary
-------------------

platform              | arch  | lab          | compiler | defconfig        =
  | results
----------------------+-------+--------------+----------+------------------=
--+--------
at91-sama5d4_xplained | arm   | lab-baylibre | gcc-8    | multi_v7_defconfi=
g | 0/1    =

hifive-unleashed-a00  | riscv | lab-baylibre | gcc-8    | defconfig        =
  | 0/1    =


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/gpio-v=
5.8-2-68-g80606cb24161/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: gpio-v5.8-2-68-g80606cb24161
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      80606cb24161d504acb4d89f406d68f72196575e =



Test Regressions
---------------- =



platform              | arch  | lab          | compiler | defconfig        =
  | results
----------------------+-------+--------------+----------+------------------=
--+--------
at91-sama5d4_xplained | arm   | lab-baylibre | gcc-8    | multi_v7_defconfi=
g | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f11e310f6e8e8654485bb28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-68-g8=
0606cb24161/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4=
_xplained.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-68-g8=
0606cb24161/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4=
_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f11e310f6e8e8654485b=
b29
      failing since 31 days (last pass: gpio-v5.8-1-1-gf6d984418ffd, first =
fail: v5.8-rc1) =



platform              | arch  | lab          | compiler | defconfig        =
  | results
----------------------+-------+--------------+----------+------------------=
--+--------
hifive-unleashed-a00  | riscv | lab-baylibre | gcc-8    | defconfig        =
  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f11e08b858665a13285bb25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-68-g8=
0606cb24161/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a0=
0.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-68-g8=
0606cb24161/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a0=
0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f11e08b858665a13285b=
b26
      failing since 31 days (last pass: gpio-v5.8-1-1-gf6d984418ffd, first =
fail: v5.8-rc1) =20
