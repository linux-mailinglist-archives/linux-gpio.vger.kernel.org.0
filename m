Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7080322D1D2
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jul 2020 00:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbgGXWcB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Jul 2020 18:32:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726154AbgGXWcA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Jul 2020 18:32:00 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D2F4C0619D3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2020 15:32:00 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id k27so6209929pgm.2
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2020 15:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=fAv0bKiFq4pru02G9PQb8/at1Mkoakw+o/ek9rHppBs=;
        b=rXjKRJs79g7Qd0i3yi9DtsinQhaEzxLBeeDgYJS5Ad4/4F08GMZl68pw7/g2qhwhOP
         qtSXyu2Aaq0xmRHbr0BmsUQh0TiRQRbcWy4MzyIFefSXsZVIHWOFAI7OzelniIJHGbee
         VsH7wGBmrP8oFNZv4/a6/GIKxWo1jOFphQtoaBmFOm5dAKM8ogdxuwfdTVEpKn4NIsab
         /YOgtqWXmJEYsNCnhLwAcOPWhRcixSClga3GZKLF0WcNmYy4mwR7uaHXQMu2N5E5NdAN
         7lJT3dIm5YUS1HOBKdGQ8Gu/p+hIWkB6P8j9KhloIUkjOG/r36ycr696QEvQz8wPV2O6
         7jAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=fAv0bKiFq4pru02G9PQb8/at1Mkoakw+o/ek9rHppBs=;
        b=IGUOJqjXNkUfYLJWWHBvMAYgvQ5KQgtS66TQiHlDiG7jf2ZvoG1c0i8A8Kaly0A90F
         hzExJs/R1nweow0s4xMHcTvOiFLahS1tfhx61SfQBxpUaFA/HvnFILvi05BNDQE7vyR2
         oVHL4deGr7HJ+ENMp/DX1RBdT9it6+FcdepS+GUvbqov1IoRr8SVWdpTRW6tjhwgRwZe
         ve0ASsrx4Dp1D0Qi3GZy6l796CbKQEvlEIw3h+OECOqzcMkVC5jr8s2cb9zJggi/JOSW
         r37+W5O/Wb02pt5S3KKYk3cZcwnamg3OtpLWCA/APStMxUE7noFSSaXTEHkCBKUHXPDA
         5aVg==
X-Gm-Message-State: AOAM532nT9VLWg8/tlDdqy1iKGV1ixXfocX6NkCoTrF7ZQuPAfzaowiR
        1xRfRUnMbpltpmzrbHSl3gf9qdA1NpA=
X-Google-Smtp-Source: ABdhPJxmQIYokxoEMH7akwXRxKwCz0qHcbfYhesPwz5Z3E5RJiOdRJ/YuHtPf+FZAI/tq4iyDd4gPg==
X-Received: by 2002:a62:8407:: with SMTP id k7mr10921976pfd.258.1595629919416;
        Fri, 24 Jul 2020 15:31:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k63sm7579900pge.0.2020.07.24.15.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 15:31:58 -0700 (PDT)
Message-ID: <5f1b615e.1c69fb81.a4741.9c23@mx.google.com>
Date:   Fri, 24 Jul 2020 15:31:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc5-96-ge80c35d808ef
X-Kernelci-Report-Type: test
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next baseline: 125 runs,
 2 regressions (v5.8-rc5-96-ge80c35d808ef)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 125 runs, 2 regressions (v5.8-rc5-96-ge80c35d808e=
f)

Regressions Summary
-------------------

platform        | arch  | lab          | compiler | defconfig          | re=
sults
----------------+-------+--------------+----------+--------------------+---=
-----
bcm2837-rpi-3-b | arm64 | lab-baylibre | gcc-8    | defconfig          | 4/=
5    =

omap3-beagle-xm | arm   | lab-baylibre | gcc-8    | multi_v7_defconfig | 0/=
1    =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/v5.=
8-rc5-96-ge80c35d808ef/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: v5.8-rc5-96-ge80c35d808ef
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      e80c35d808efc91427c50b8f4d8ecde8cee5050d =



Test Regressions
---------------- =



platform        | arch  | lab          | compiler | defconfig          | re=
sults
----------------+-------+--------------+----------+--------------------+---=
-----
bcm2837-rpi-3-b | arm64 | lab-baylibre | gcc-8    | defconfig          | 4/=
5    =


  Details:     https://kernelci.org/test/plan/id/5f1b4bfccf751730f285bb78

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.8-rc5-96-ge=
80c35d808ef/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.8-rc5-96-ge=
80c35d808ef/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f1b4bfccf751730=
f285bb7b
      failing since 8 days (last pass: gpio-v5.8-2-58-g1752911c6d10, first =
fail: v5.8-rc5-68-geb211a587e18)
      4 lines =



platform        | arch  | lab          | compiler | defconfig          | re=
sults
----------------+-------+--------------+----------+--------------------+---=
-----
omap3-beagle-xm | arm   | lab-baylibre | gcc-8    | multi_v7_defconfig | 0/=
1    =


  Details:     https://kernelci.org/test/plan/id/5f1b5758a0a6e4444985bb32

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.8-rc5-96-ge=
80c35d808ef/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap3-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.8-rc5-96-ge=
80c35d808ef/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap3-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1b5758a0a6e4444985b=
b33
      new failure (last pass: v5.8-rc5-76-g60e149cc2965) =20
