Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA5141F6C88
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2020 19:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgFKRFa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Jun 2020 13:05:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbgFKRF3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Jun 2020 13:05:29 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83DCFC08C5C1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2020 10:05:29 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id v24so2547997plo.6
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2020 10:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=85rf9ZRL1q52AWLuPADndpXRIKnB5BABbv5Jj4TM91o=;
        b=VgmWdNpe60YFLgKds+hPtF4tWl0yIM49B0w/OZbgEmh78haPKrdMcQHW++z6k++R3F
         d0jrIPDfYt1H6hA1KlnVIlL/Vwxlxf0ZMglRVz7zoJw+cdfDAF0JZoIyqC3PP5MtT0Kl
         b5nkS2YRHPHuBjsGNYy+jfWJaYXssUic+QVp96PK2MV+HWUjFTgChwHo9+2wA7hOynMM
         plqtqe5c+qIvdpSSHIHovQUjRaIfiUdHd5Yk5ZpjAVvxEfHofHr27jtssAeUmkmVs8ts
         w0R1LhfcMZeY/jOj9dvdsy3RoVqLJdQgigW1mi6zj/sTbn5kVk1F25L0xSvYCwNkacEZ
         OxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=85rf9ZRL1q52AWLuPADndpXRIKnB5BABbv5Jj4TM91o=;
        b=uMGdnbeSvDyKtNzynkoaIT0lFwa8KsyywOoA3/g7hr311KH7RsWoMzXhy1TtfWMix+
         Pf79zXkoxlOyyRT67QjhtCQYzcC1ALIwSgsN0fiVMBVIZEZE/9cUsWCzxsRty5Am7lAU
         ZqJj4qe6zgfXNXJ7BaSMzp1lNQ4SnEDAClkiR8Gpgah8RPlHI1cBwBKt4+bWgNKmfUpQ
         JDkZ7gtH8T2ypE0wqB3OD8cKhQBd45zM8ED0V5JQbVk4kSQzytJl71JzPTd0tIVkp8E+
         c4+90Zwxvqr2dusNSl76VGCgYpG1jrChAYj0SSHjwZPNi6BjSZBYz0bvWMUcxMyf9oN2
         5K9Q==
X-Gm-Message-State: AOAM533SzdiNTwYzoGnf7vpcPsX6tyoxARyBPrp3oAHTE6pIM45uO5am
        UIOyCxBmaFRNYak64S8bHt4tXgnJmZk=
X-Google-Smtp-Source: ABdhPJxMnQrFKU9O6O986FfXcpchpW/GYopY1Ry9cQjDYGIc5py50dnIxA9H12otYTG+quceG8YSVQ==
X-Received: by 2002:a17:90b:3105:: with SMTP id gc5mr8784739pjb.36.1591895127363;
        Thu, 11 Jun 2020 10:05:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t24sm3183766pgm.10.2020.06.11.10.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 10:05:26 -0700 (PDT)
Message-ID: <5ee26456.1c69fb81.99f18.853f@mx.google.com>
Date:   Thu, 11 Jun 2020 10:05:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: gpio-v5.7-3-2-gcdf59728a3cd
Subject: linusw/fixes baseline: 64 runs,
 3 regressions (gpio-v5.7-3-2-gcdf59728a3cd)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes baseline: 64 runs, 3 regressions (gpio-v5.7-3-2-gcdf59728a3cd)

Regressions Summary
-------------------

platform                 | arch  | lab          | compiler | defconfig     =
     | results
-------------------------+-------+--------------+----------+---------------=
-----+--------
bcm2837-rpi-3-b          | arm64 | lab-baylibre | gcc-8    | defconfig     =
     | 4/5    =

imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defco=
nfig | 3/5    =


  Details:  https://kernelci.org/test/job/linusw/branch/fixes/kernel/gpio-v=
5.7-3-2-gcdf59728a3cd/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   fixes
  Describe: gpio-v5.7-3-2-gcdf59728a3cd
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      cdf59728a3cdfdf59f517329d40eb2257b3fe7d0 =



Test Regressions
---------------- =



platform                 | arch  | lab          | compiler | defconfig     =
     | results
-------------------------+-------+--------------+----------+---------------=
-----+--------
bcm2837-rpi-3-b          | arm64 | lab-baylibre | gcc-8    | defconfig     =
     | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ee258ed6495916aa397bf3a

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/gpio-v5.7-3-2-gcd=
f59728a3cd/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/gpio-v5.7-3-2-gcd=
f59728a3cd/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ee258ed6495916a=
a397bf3d
      failing since 12 days (last pass: v5.7-rc6-9-g44ca08d53c6b, first fai=
l: v5.7-rc6-9-ge9bdf7e655b9)
      1 lines =



platform                 | arch  | lab          | compiler | defconfig     =
     | results
-------------------------+-------+--------------+----------+---------------=
-----+--------
imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defco=
nfig | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5ee25a6b7354f5590d97bf2b

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/gpio-v5.7-3-2-gcd=
f59728a3cd/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/gpio-v5.7-3-2-gcd=
f59728a3cd/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5ee25a6b7354f55=
90d97bf2f
      new failure (last pass: v5.7-rc6-9-ge9bdf7e655b9)
      4 lines* baseline.dmesg.emerg: https://kernelci.org/test/case/id/5ee2=
5a6b7354f5590d97bf30
      new failure (last pass: v5.7-rc6-9-ge9bdf7e655b9)
      35 lines =20
