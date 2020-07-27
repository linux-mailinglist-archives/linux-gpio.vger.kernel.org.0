Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 880F222E50A
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 06:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726006AbgG0Ety (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 00:49:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbgG0Ety (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2020 00:49:54 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37D96C0619D2
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jul 2020 21:49:54 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d188so2312535pfd.2
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jul 2020 21:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=kdQgqWZe62o1HLKBm93ADt1G8GDGC1ST9mzGS08MI0A=;
        b=ZoZGxfS2MBOxCDmo8dwZ6LNsyeZwLrxlLNar839wJd2tnuYYGiVy3GRyfcJEKmXdby
         +OFkg+iGWGzXyhdt7b6PxKAnJ9HeZ67Jy+A6Bp5lqFUPNVvdy/gWx9Eej4lx8ASrx6Yy
         Jw5lGzOz7LoGqSSqTylGmvoaYz8aaYX1z0EtnLp9HQ1SHkx/4kTzc0IJWLwMb45z5PwB
         VwWr0tb99EIMOPyEt5jVHg/8Rkd1AFIUP3N+piATqWdjwzhXmsyPbOb1TN31t469oLN7
         JVz1PD643yqUCcMrTtQ60P1eEgPe845IbmaqW6U4zsa1YAb0H+KEa8eu3+kB9F+2ZCgt
         oEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=kdQgqWZe62o1HLKBm93ADt1G8GDGC1ST9mzGS08MI0A=;
        b=o1gVk2j5LzVyLJSUGvWSXW5okLgHEPJe3lnfKh2Qa+sx1fdnziIMEtvJUlO3NHjKH3
         Cs2JCZNhIxIGHU7c7yw3cQCn8YivXxGTnTlQXzNANO5ucYu5tUgkD+YIJcpmioEq+Ztr
         20tLYzJg2zYkNjevRZ0AILt4VruiOmwz/rmmCA8z9kA4roFsKkj+CJWojOioHjvqj9Xw
         3HjNiQoibht4bKXvWsFWC9Cm5BoN9eYybACnyvWznbSt84+xM9lKL7qfywXso6QRbKKv
         vQS2qqeWedxSUBJvWYhZNDakWfBS0US01TCf2lpc8JmLLUQ8ZPo7y+slg8pvCq5a8w0x
         DPhQ==
X-Gm-Message-State: AOAM530Yw2ZxEMYRIjALTPecDQRVmthLnByKLst3Q7j6t+C0KpI9bJL9
        hESIqNIaMxwjcvA0NpQTONiBsgBmi20=
X-Google-Smtp-Source: ABdhPJx084IHMSL/Y2+2aW1tTousJ9WmJVVw260vvahbcNdNmXsNJRo4TU+RHEm2i/5g+PMktIY2fQ==
X-Received: by 2002:a63:7f17:: with SMTP id a23mr18077477pgd.3.1595825393385;
        Sun, 26 Jul 2020 21:49:53 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v22sm13405148pfe.48.2020.07.26.21.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 21:49:52 -0700 (PDT)
Message-ID: <5f1e5cf0.1c69fb81.220c6.e04e@mx.google.com>
Date:   Sun, 26 Jul 2020 21:49:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: gpio-v5.8-2-96-ga070bdbbb06d
X-Kernelci-Report-Type: test
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel baseline: 120 runs,
 2 regressions (gpio-v5.8-2-96-ga070bdbbb06d)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 120 runs, 2 regressions (gpio-v5.8-2-96-ga070bdbbb06=
d)

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
5.8-2-96-ga070bdbbb06d/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: gpio-v5.8-2-96-ga070bdbbb06d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      a070bdbbb06d7787ec7844a4f1e059cf8b55205d =



Test Regressions
---------------- =



platform              | arch  | lab          | compiler | defconfig        =
  | results
----------------------+-------+--------------+----------+------------------=
--+--------
at91-sama5d4_xplained | arm   | lab-baylibre | gcc-8    | multi_v7_defconfi=
g | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1e539351886f0a3385bb1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-96-ga=
070bdbbb06d/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4=
_xplained.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-96-ga=
070bdbbb06d/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4=
_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1e539351886f0a3385b=
b20
      failing since 40 days (last pass: gpio-v5.8-1-1-gf6d984418ffd, first =
fail: v5.8-rc1) =



platform              | arch  | lab          | compiler | defconfig        =
  | results
----------------------+-------+--------------+----------+------------------=
--+--------
hifive-unleashed-a00  | riscv | lab-baylibre | gcc-8    | defconfig        =
  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1e4f251a0047757085bb48

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-96-ga=
070bdbbb06d/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a0=
0.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-96-ga=
070bdbbb06d/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a0=
0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1e4f251a0047757085b=
b49
      failing since 40 days (last pass: gpio-v5.8-1-1-gf6d984418ffd, first =
fail: v5.8-rc1) =20
