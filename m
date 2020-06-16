Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBA081FB16C
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 15:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727966AbgFPNBv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 09:01:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728617AbgFPNBk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 09:01:40 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01D56C06174E
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 06:01:38 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id y18so8369572plr.4
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 06:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=eypxC5N2sWw0VaXEy94EpLM+bGHzxlTU23i5/Lqjlq0=;
        b=KsuGXSLnN677YZcrtMca/1HrwGfFCth4ah6PGFACRWOA11pxOcAbML1J9I9mvQOEDv
         O31HY+2Kjn93KGDT9P6izFiIAKUIe081BCYCRXq8uFPn8RN/hepmdDFO+qgZMN4lu7Dj
         DKuL6xef26HvFPoGuJeasJldhBQPffqi6SWuStvZ5uwBg6WJ4yjHnqrjlqgRWnC1kpmz
         dKaKUjGvR13Y1zIA0xv1DBby/SvxHRXc61XaTc14eQuHRnpNeCEq8FDgGwau4tZd1iWW
         Cjvc2EinSQCo6cg+vHMrl7Jqhhr6YYgS4tpWhYFYaLx6q5FIlHVgU4CmvlGIjmc0wMFC
         0KJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=eypxC5N2sWw0VaXEy94EpLM+bGHzxlTU23i5/Lqjlq0=;
        b=lgC56CND0k+x25S0XBRHcFKosoGuGIFsWGtB27+wm0HPGnN4FG0kvkz86RRUkln9G+
         ayxKqg4omr4MIg/9li6laldid3FdcUWDLDRZHdHnEiykXA91bg4LJxQMTE8LLbDN5wM6
         x3pTZQAqhQy1WUguwy6ZiDfEJBiR1xV6dTSANnx1ilP9XgDwNqpPTlOR2eHFju6jUiDE
         e9QRPVRRhgw2lDCvubfKJ4aibjyDU8bb1aM7YdttV0XTVu/gjPtUwfmsWxo0PKTCIoqK
         JLLcqzU5AK1jumnymqq5A4XIgtX1qG64McugmPrnYqTmDvOw1PE1F6QGsABEIGl0cGyw
         R0pQ==
X-Gm-Message-State: AOAM531GTzbppdBV3UslfPU/vDTtoYZVmsRfBlUPHR0B6lOYlZg5wF9b
        Iw9A+y7epTT3P+TpoN3owKM4UmIAtFk=
X-Google-Smtp-Source: ABdhPJwsozBOKlgwtKfgtoE3/HVN0AIXMignbOsghQr/biZ5B4Co8/YNDF7A5cFeWoumDUw+pvtgRw==
X-Received: by 2002:a17:90a:648b:: with SMTP id h11mr2610229pjj.59.1592312495621;
        Tue, 16 Jun 2020 06:01:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w5sm16752937pfn.22.2020.06.16.06.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:01:34 -0700 (PDT)
Message-ID: <5ee8c2ae.1c69fb81.d04ce.87d3@mx.google.com>
Date:   Tue, 16 Jun 2020 06:01:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.8-rc1-2-g861254d82649
Subject: linusw/for-next baseline: 24 runs,
 2 regressions (v5.8-rc1-2-g861254d82649)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 24 runs, 2 regressions (v5.8-rc1-2-g861254d82649)

Regressions Summary
-------------------

platform             | arch  | lab          | compiler | defconfig | results
---------------------+-------+--------------+----------+-----------+--------
bcm2837-rpi-3-b      | arm64 | lab-baylibre | gcc-8    | defconfig | 4/5    =

hifive-unleashed-a00 | riscv | lab-baylibre | gcc-8    | defconfig | 0/1    =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/v5.=
8-rc1-2-g861254d82649/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: v5.8-rc1-2-g861254d82649
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      861254d826499944cb4d9b5a15f5a794a6b99a69 =



Test Regressions
---------------- =



platform             | arch  | lab          | compiler | defconfig | results
---------------------+-------+--------------+----------+-----------+--------
bcm2837-rpi-3-b      | arm64 | lab-baylibre | gcc-8    | defconfig | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ee8b8d962357191f497bf1c

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.8-rc1-2-g86=
1254d82649/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.8-rc1-2-g86=
1254d82649/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ee8b8d962357191=
f497bf1f
      new failure (last pass: gpio-v5.7-3-2-gcdf59728a3cd)
      2 lines =



platform             | arch  | lab          | compiler | defconfig | results
---------------------+-------+--------------+----------+-----------+--------
hifive-unleashed-a00 | riscv | lab-baylibre | gcc-8    | defconfig | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee8b5c469d708e24497bf1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.8-rc1-2-g86=
1254d82649/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00=
.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.8-rc1-2-g86=
1254d82649/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee8b5c469d708e24497b=
f1c
      new failure (last pass: v5.7-rc7-82-g74910e15ab25) =20
