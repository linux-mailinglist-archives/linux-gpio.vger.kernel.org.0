Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 217282101BB
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2020 04:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbgGACG2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 22:06:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgGACG1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 22:06:27 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73B21C061755
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 19:06:26 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id l63so10877077pge.12
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 19:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=LccrlTaLAT7/CUj0pQpwFT+oq1bak4XLxKQ6p8Or7Jg=;
        b=y/4rCsr7XGFWDum67gCriDQtnLwCuoCa0MuY+J+P9o8du99ejv992Wb+oQNKCZEMm6
         rirqb9Qg+4uG2RtsPmhqfrac+RYfSUqXWX2Zu9hd2GJrBLLD75Ib0WtjNBG0lENvY7pi
         ErJqjNtSLfwF/4gG93CDuqFrFVsEqFw1CX7v0D8hKWbnOzITNWnHuDMU0lA59iHdxskq
         oVN/w6eX2CExmqDfpeDEYihnuujYep/sesVYO4EGiFjVMZtoTPvj3s2I2IVS1hxzxCwL
         3P3hAmVYPsGeBvTMegL8QShPj9JJSyUt5r+34JX+d6RaxCzBp7QkE62y2nazdjr18q3x
         rIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=LccrlTaLAT7/CUj0pQpwFT+oq1bak4XLxKQ6p8Or7Jg=;
        b=Jzs7PrvlBacHI8MRvoc1hRMtIgJm8loVL3LCYnJt3dw8bOhh5UqTjl+3t8dRCdBDcs
         i4S4oWbJ7iKFoGvquLJGFR+f1+lZxo9Ybjen8Gh44agy27Ya0d0DdgD2g3e+RQOmTJfL
         pllpdUNQvl90VcAQh696a2tfinD3jHr9b3eItCNQQa3bJuegts38y4yfHT7PPNDfHHfX
         ETSQnc/gRLcTmEUG3bwoFNXgZRp5F5WVEcpTkaKrGRtj5gXoRllKVcURj6zG8pJobxYh
         9FscECUN1sKzgvYkfc8YibSq6VZsLJ07ULh3wWbOLWnug/Wbeh2KWVJT+yVrPRY6E/Cl
         P+Mg==
X-Gm-Message-State: AOAM5329BYHQtKKIeiDfzunzYvQDnf+bFyGdFU4cnuHk3e4wYrpoYpCs
        Jw+cCdhUKU9QyG0p5MZoEpEmS8xLk5g=
X-Google-Smtp-Source: ABdhPJwT/uuaKvUd+NUPKk4YrnrmrJMDX6NwB5k8eRcpgOX9vbajoIWHahLM4bagwpQV4BLsAPkV+g==
X-Received: by 2002:a62:5e83:: with SMTP id s125mr20404414pfb.315.1593569185559;
        Tue, 30 Jun 2020 19:06:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u26sm3847036pfn.54.2020.06.30.19.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 19:06:24 -0700 (PDT)
Message-ID: <5efbefa0.1c69fb81.88a1c.b881@mx.google.com>
Date:   Tue, 30 Jun 2020 19:06:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc1-35-g65884065616f
X-Kernelci-Report-Type: test
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next baseline: 61 runs,
 2 regressions (v5.8-rc1-35-g65884065616f)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 61 runs, 2 regressions (v5.8-rc1-35-g65884065616f)

Regressions Summary
-------------------

platform             | arch  | lab          | compiler | defconfig | results
---------------------+-------+--------------+----------+-----------+--------
bcm2837-rpi-3-b      | arm64 | lab-baylibre | gcc-8    | defconfig | 4/5    =

hifive-unleashed-a00 | riscv | lab-baylibre | gcc-8    | defconfig | 0/1    =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/v5.=
8-rc1-35-g65884065616f/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: v5.8-rc1-35-g65884065616f
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      65884065616fc34c9613fd743c022716083a9ccc =



Test Regressions
---------------- =



platform             | arch  | lab          | compiler | defconfig | results
---------------------+-------+--------------+----------+-----------+--------
bcm2837-rpi-3-b      | arm64 | lab-baylibre | gcc-8    | defconfig | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5efbe5b21ac654927785bb40

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.8-rc1-35-g6=
5884065616f/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.8-rc1-35-g6=
5884065616f/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5efbe5b21ac65492=
7785bb45
      new failure (last pass: v5.8-rc1-17-gac261a8a6ff6)
      1 lines =



platform             | arch  | lab          | compiler | defconfig | results
---------------------+-------+--------------+----------+-----------+--------
hifive-unleashed-a00 | riscv | lab-baylibre | gcc-8    | defconfig | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5efbe39323d07c9adb85bb1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.8-rc1-35-g6=
5884065616f/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a0=
0.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.8-rc1-35-g6=
5884065616f/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a0=
0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5efbe39323d07c9adb85b=
b20
      failing since 14 days (last pass: v5.7-rc7-82-g74910e15ab25, first fa=
il: v5.8-rc1-2-g861254d82649) =20
