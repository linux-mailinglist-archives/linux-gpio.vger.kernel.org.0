Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 152EB222B0A
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 20:29:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727844AbgGPS36 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 14:29:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726986AbgGPS35 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 14:29:57 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FFF9C061755
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 11:29:57 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id 207so4087346pfu.3
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 11:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=TVoSpPAIvyt6QpCYtrHkkMdo7FWkHbHgdbYqqpM+XwA=;
        b=rXpJ8PA7wG20lzRu5ERta5ixfM3ek4VUjHrvcCCrcf9DDxFAMclOPBN6sahffWNhG1
         u/Kxo4jlUIwSavOxScKiAI2tb2zmfCMzjWWPqP2SwmkYp230gSUipmf8I2szwbZz31V9
         nwm2sNMV+cNVjTzrTnDUg8dkq8jcUxPBiGfHqTYcmE66B8R2E2P1H50dkIf4qJYi3VkO
         m8Jx0t/HT+qa1XOKsi6T4+lqWYYKpY6V1pkb+uwVrdKQ3o72e0F2k0RePEpvDtr3YuZn
         lrjRz9pSI2yHXypwTDS4b6gXlNK5GcsYMJfWxBCbHXp6jgUNpGU3g9TP739rRc8Ybj2y
         6sIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=TVoSpPAIvyt6QpCYtrHkkMdo7FWkHbHgdbYqqpM+XwA=;
        b=pj7axPgTvjuefDuFuaWeocret2h/qdwnrfgkc2JNia/DdRgebl04msMdbXiGGLZ49C
         RlEjs5Rl3XSbSyK/LKB860/aPhf/04+FUgM94xeV1V8Wl8scojS0R5cf2gnWzIj+yzqi
         QdpxMSXBXue/rLvopG30/M9zMWhJFZXLm1Po15XvH0acdNGacQpBKyDxyQ6X4XEoZrjb
         KKm2wKKkI3cTFe2PB9v7BACKTEavx5+NnL+kVbveYqIseb2um0nckE14dsmPnBXNNJVt
         BomKooj/EqKzQ/LJ/a2eQkGj/wPfYQ3JQr1kIc86cpbifnc45UnIJw6Ns0PrGHU+Igze
         ohfw==
X-Gm-Message-State: AOAM531/5WdPrBd4yjaDkqFmXlqa72+lCQOLkeFWOl7MJj7MJA+eYAp8
        UzWw1NzKY81LSUKFHBoaA5mMil7/5D0=
X-Google-Smtp-Source: ABdhPJzJVAnwjMpRd6s+LuEtPEXFOpAyO1W+3e/z4DC/kkiv96puUTa5oxXEYFJ+WC/aefEAuBkNDg==
X-Received: by 2002:a05:6a00:2294:: with SMTP id f20mr4850940pfe.126.1594924196595;
        Thu, 16 Jul 2020 11:29:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k26sm5391551pgt.90.2020.07.16.11.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 11:29:55 -0700 (PDT)
Message-ID: <5f109ca3.1c69fb81.103d2.fa27@mx.google.com>
Date:   Thu, 16 Jul 2020 11:29:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc5-68-geb211a587e18
X-Kernelci-Report-Type: test
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next baseline: 89 runs,
 1 regressions (v5.8-rc5-68-geb211a587e18)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 89 runs, 1 regressions (v5.8-rc5-68-geb211a587e18)

Regressions Summary
-------------------

platform        | arch  | lab          | compiler | defconfig | results
----------------+-------+--------------+----------+-----------+--------
bcm2837-rpi-3-b | arm64 | lab-baylibre | gcc-8    | defconfig | 4/5    =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/v5.=
8-rc5-68-geb211a587e18/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: v5.8-rc5-68-geb211a587e18
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      eb211a587e18efb2a37250573492ae58126176eb =



Test Regressions
---------------- =



platform        | arch  | lab          | compiler | defconfig | results
----------------+-------+--------------+----------+-----------+--------
bcm2837-rpi-3-b | arm64 | lab-baylibre | gcc-8    | defconfig | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f1092ed404c0f611a85bb6d

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.8-rc5-68-ge=
b211a587e18/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.8-rc5-68-ge=
b211a587e18/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f1092ed404c0f61=
1a85bb70
      new failure (last pass: gpio-v5.8-2-58-g1752911c6d10)
      2 lines =20
