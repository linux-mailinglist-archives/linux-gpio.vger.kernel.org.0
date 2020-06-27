Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45CAB20BE02
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jun 2020 05:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725832AbgF0Dq6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Jun 2020 23:46:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgF0Dq6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Jun 2020 23:46:58 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6060AC03E979
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2020 20:46:58 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id q90so4991340pjh.3
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2020 20:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=sv++E5ghBVB3A8uZxT4RjvTEFwYIyNc/KZw+fZbSUs0=;
        b=TbQEWT40JhUF2PnzrYStAS6/F0RL+u7Dkew19Q1q0j+1iCQfXzBPWkf1n99LACCwrI
         YIJE4Qyx124bQxKKVylt2Tf1OJ/3Xi1aMZg7zvHkoX55aifX2Yv2VjGbLTCKo7nw4uZL
         jvDw4plL3cKhDmlM9dQXIaDK5E7lB8reLeuJNo41L79erdORySFf7retd+16Ls6zQxLr
         DNfKSOxyznG6XPYjz4aFwpGHHO8aGzttvhd+H1UzsSENuTqSIrmMWhjLLaORWPnCrN52
         IZWqYHvk6an/ivWUdk9VMoW1bE1WmATLwDRwpK0BMtTjL/fPPAMY0o0d9BdBFt7CF3J2
         yNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=sv++E5ghBVB3A8uZxT4RjvTEFwYIyNc/KZw+fZbSUs0=;
        b=aRmKPsFJCapJH0YmmceXlc3tstr891pKfeiFuV4NcnkIaKA7AclCoXUj98GEZWQWV3
         rsSKjSixHFH2ctHHFJOb4OnO7uPphT+d4WHKgNf1ewj/tBUQAHPaNN8j3jR2oMwDPisA
         9x+CBNyk8AH0JMN7lZZr8WpdvbFEuNCdN3vjM1awXwdY0xiruByDLStGKBOFoqPeXpOF
         b/6eQ2L9KGS3S5Z8q2Ogi0o/dfqRQN6ClBVhfbf9AiJZObdY95IhIRIA3biSjWfY5Mwt
         NPoFukFAh7myENOCi5NAcZvEU6Uue/60C8D0Aga6QLUN6OhXt2eY5IiK54W87yh7LguJ
         Gw5w==
X-Gm-Message-State: AOAM533kdnUElI0wYgqxQznh2njerfJaLVUYi2p4gL+YwL7JaCzFya2p
        FiUVDRS6khcl/8UmQ7bQ5fGtlw+xjLo=
X-Google-Smtp-Source: ABdhPJy2fYUisOdUFOb+O7c+G1fvUp+F+FLyWfdZMHxQgqxicATpz9lMu8q3qJglJhYvRjNKglARPA==
X-Received: by 2002:a17:90a:c58e:: with SMTP id l14mr4070159pjt.67.1593229617510;
        Fri, 26 Jun 2020 20:46:57 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a12sm27551357pfr.44.2020.06.26.20.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 20:46:56 -0700 (PDT)
Message-ID: <5ef6c130.1c69fb81.3531f.0597@mx.google.com>
Date:   Fri, 26 Jun 2020 20:46:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc1-17-gac261a8a6ff6
X-Kernelci-Report-Type: test
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next baseline: 79 runs,
 2 regressions (v5.8-rc1-17-gac261a8a6ff6)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 79 runs, 2 regressions (v5.8-rc1-17-gac261a8a6ff6)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
| results
-----------------------------+-------+--------------+----------+-----------=
+--------
hifive-unleashed-a00         | riscv | lab-baylibre | gcc-8    | defconfig =
| 0/1    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig =
| 0/1    =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/v5.=
8-rc1-17-gac261a8a6ff6/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: v5.8-rc1-17-gac261a8a6ff6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      ac261a8a6ff6ef7fdd66481f121f872b304c13fd =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
| results
-----------------------------+-------+--------------+----------+-----------=
+--------
hifive-unleashed-a00         | riscv | lab-baylibre | gcc-8    | defconfig =
| 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ef6b56d6b66e12b5985bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.8-rc1-17-ga=
c261a8a6ff6/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a0=
0.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.8-rc1-17-ga=
c261a8a6ff6/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a0=
0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ef6b56d6b66e12b5985b=
b19
      failing since 10 days (last pass: v5.7-rc7-82-g74910e15ab25, first fa=
il: v5.8-rc1-2-g861254d82649) =



platform                     | arch  | lab          | compiler | defconfig =
| results
-----------------------------+-------+--------------+----------+-----------=
+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig =
| 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ef6b8e3f73b9b387a85bb30

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.8-rc1-17-ga=
c261a8a6ff6/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-lib=
retech-ac.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.8-rc1-17-ga=
c261a8a6ff6/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-lib=
retech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ef6b8e3f73b9b387a85b=
b31
      new failure (last pass: v5.8-rc1-11-g42ba326cdeff) =20
