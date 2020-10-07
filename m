Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B48DE285EBD
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Oct 2020 14:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728003AbgJGMHF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Oct 2020 08:07:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727960AbgJGMHF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Oct 2020 08:07:05 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 865D8C061755
        for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2020 05:07:03 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id u24so1265862pgi.1
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2020 05:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8y05zVe2BKfViCUAtUHnIrCPgyra2RcY/QOzqv2sdOc=;
        b=nV54yhQB4LIEong+IYeDl7KSwb0LQUWqZxL3/F0J3xE5YbeabiJngBnOGu3w352R1U
         cCCGsrt76AWUvaCqNB1zEh00VuKEMcDhU+YjY0mbUBUqU3k2hqBath+2siukgbE2Y94F
         lfIG2iuoJCDpPM3qxHCJMhtRHYG/sijBevGXEsO+D/q2fBIatV3i8VA9inTNQy9vmzdH
         YWFIQiu/Fx25XU+50DguE9nti2RM0h+f1ce6Xvsbw1o2nPoJNlgINYO0q2+SFQaZ3lKM
         +PURVviuolQ9Qin5OZJivGyH0IUXJhqWAudyklprh+8cZP5SwyoexA7CJ/u+xPIiv3jD
         RHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8y05zVe2BKfViCUAtUHnIrCPgyra2RcY/QOzqv2sdOc=;
        b=eLm8Cz9alSptkh/SwypFStRBgbwEa9/6LQDpCs0IasKwTZlxiljcGjrbTiq7t1+2Ns
         0upCyZD1IsvGFw71KPiFIB9Apadt9aIX3O8uqLLynDYxLXudU9MOVniWmyndzVyMeVSn
         W80n3gMlHPQ/6Odp1DZWknFOVfdQ/9Ree4U7vQnNNF7W8qbAWgQUYNj80KzbubsMvTBz
         Y9b4bNxaoYdGMEcR7Nh9qtrwoUzsTz3BG+0aBC0cl7XGzriq4pwn0VfGfLpIvNcfOhFY
         +KpeCEzsBftb0J9dqmJCgI5zuuO9Y5R9Wkfame7mVRuOaPZljjTKdkO7D7iniYt7toKF
         wTpQ==
X-Gm-Message-State: AOAM531sPTzTbZeX9ciKk236a+LECnhsMZsYb2FfZG+KAak2d7nfWirT
        pjJf4AaouZ+n1QeW+KSrGURE/VsJZ8iDBg==
X-Google-Smtp-Source: ABdhPJz5V2NuNpbqBc3E0iHiQOUBWN424KAt2kDdOvBWTkwPSOHDIEJLhsJYxGBQOHRTBcKJWHT39w==
X-Received: by 2002:a65:4d42:: with SMTP id j2mr2702446pgt.182.1602072422075;
        Wed, 07 Oct 2020 05:07:02 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b5sm2804730pfo.64.2020.10.07.05.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 05:07:01 -0700 (PDT)
Message-ID: <5f7daf65.1c69fb81.1a2bb.556f@mx.google.com>
Date:   Wed, 07 Oct 2020 05:07:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-rc8-1-g47e538d86d57
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
Subject: linusw/fixes baseline: 48 runs,
 1 regressions (v5.9-rc8-1-g47e538d86d57)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes baseline: 48 runs, 1 regressions (v5.9-rc8-1-g47e538d86d57)

Regressions Summary
-------------------

platform | arch | lab           | compiler | defconfig          | results
---------+------+---------------+----------+--------------------+--------
panda    | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | 4/5    =


  Details:  https://kernelci.org/test/job/linusw/branch/fixes/kernel/v5.9-r=
c8-1-g47e538d86d57/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   fixes
  Describe: v5.9-rc8-1-g47e538d86d57
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      47e538d86d5776ac8152146c3ed3d22326243190 =



Test Regressions
---------------- =



platform | arch | lab           | compiler | defconfig          | results
---------+------+---------------+----------+--------------------+--------
panda    | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f7da335e04f5f697c4ff40a

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.9-rc8-1-g47e53=
8d86d57/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.9-rc8-1-g47e53=
8d86d57/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f7da335e04f5f6=
97c4ff410
      failing since 24 days (last pass: v5.8-rc5, first fail: v5.9-rc2-3-g3=
c68e90fdb65)
      60 lines

    2020-10-07 11:14:56.317000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-10-07 11:14:56.323000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-10-07 11:14:56.329000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-10-07 11:14:56.335000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-10-07 11:14:56.341000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-10-07 11:14:56.347000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-10-07 11:14:56.353000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-10-07 11:14:56.359000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-10-07 11:14:56.365000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    2020-10-07 11:14:56.370000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80b
    ... (49 line(s) more)
      =20
