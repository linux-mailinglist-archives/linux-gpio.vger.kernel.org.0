Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD1D022BBCF
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jul 2020 04:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbgGXCC2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jul 2020 22:02:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgGXCC2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jul 2020 22:02:28 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8483EC0619D3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2020 19:02:28 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id t6so4346835pgq.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2020 19:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=iwetYrexxlDUJMEumDvGf6Hf2OidV9dSv/5PhJYoCTE=;
        b=lgthpWjgg8HMK01giCspIFMGmcDoRbomMnR+pRQ57gn06UL2YVl69uN2TikqJaAm5n
         GFPF6K5jFgGKSqm8PBavWB840zfggCQQpnJ+YpFc01YqoLiAgi3J4TQUUkW06ZfwYLbI
         rVGnE3YvvFOlQhP79BdwZpoDOJ8fA/+0f+PZ9RQmxMh2uN2Y+Qg/B4xP6O0cNhnZARzT
         jYdxFrJXqW7eBp65pZCE0Pp5RIz7QYGkUeo+nERv6Qy1uehqgmec81q5jSxQr0YidbAi
         LroWnBxEPFpTG/vlWkPvPmEXxx2MAMFA6KNzuJfmht1/ZCICkeOTD3F0D9KPsGAPFNy0
         q25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=iwetYrexxlDUJMEumDvGf6Hf2OidV9dSv/5PhJYoCTE=;
        b=J4tUrP62PZstWIBiYoM2//VKUOBq0CTJ9hksuZgKovSjIiwBj+SR0vj91ewfJdWVc5
         6GDnokDlWREKIrHxt7yV67eZIhd2aenUAf1wu9eN93y7irTVdUQZxGGucRhCb6ag9lU4
         lvm8s9ctkBpIcg5XutHatqxKCLuQfJu0zGp1TEoj6WM/S6GfUp+ynS7q5kYgYAVcRsR0
         rDldV2lVO4akSiEKA+y3YU4UujTpHOJkdsM/sMGBlzMbsFsrfzVf+3bkp9dQcjyFU+R3
         hbRWbmKYG6BHKD2Nhc18egff9t3h4ld2OGd5JmM7Y/vBA/7dnwsDHiAtWSt35aeeJ7DF
         NJVA==
X-Gm-Message-State: AOAM531SqlMht05l59xzuYFCvp++9y7Y5Q6qPcrZAy0hGYRJdzwy5jhZ
        ma3Zyt3VPSbl1WKlmCRdB1tdorNDHHw=
X-Google-Smtp-Source: ABdhPJxH1xTMMtDdRcXgZ18/qmgSc7Jv5rjPwNonWXaURXNDk52x3EckOpE3bcSVzRsxc9PAWnN5RA==
X-Received: by 2002:a62:3741:: with SMTP id e62mr6571892pfa.127.1595556147504;
        Thu, 23 Jul 2020 19:02:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a68sm4124006pje.35.2020.07.23.19.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 19:02:26 -0700 (PDT)
Message-ID: <5f1a4132.1c69fb81.6a40b.af2e@mx.google.com>
Date:   Thu, 23 Jul 2020 19:02:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc5-76-g60e149cc2965
X-Kernelci-Report-Type: test
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next baseline: 123 runs,
 1 regressions (v5.8-rc5-76-g60e149cc2965)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 123 runs, 1 regressions (v5.8-rc5-76-g60e149cc296=
5)

Regressions Summary
-------------------

platform        | arch  | lab          | compiler | defconfig | results
----------------+-------+--------------+----------+-----------+--------
bcm2837-rpi-3-b | arm64 | lab-baylibre | gcc-8    | defconfig | 4/5    =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/v5.=
8-rc5-76-g60e149cc2965/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: v5.8-rc5-76-g60e149cc2965
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      60e149cc2965b77a0d1c74c04bfd1e156b8fb083 =



Test Regressions
---------------- =



platform        | arch  | lab          | compiler | defconfig | results
----------------+-------+--------------+----------+-----------+--------
bcm2837-rpi-3-b | arm64 | lab-baylibre | gcc-8    | defconfig | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f1a2e400aaf81587d85bb51

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.8-rc5-76-g6=
0e149cc2965/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.8-rc5-76-g6=
0e149cc2965/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f1a2e400aaf8158=
7d85bb54
      failing since 7 days (last pass: gpio-v5.8-2-58-g1752911c6d10, first =
fail: v5.8-rc5-68-geb211a587e18)
      2 lines =20
