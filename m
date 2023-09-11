Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E650F79BDE2
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 02:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238224AbjIKUzi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Sep 2023 16:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236515AbjIKKs0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Sep 2023 06:48:26 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E202BE9
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 03:48:21 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1c1e128135aso33925125ad.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 03:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1694429301; x=1695034101; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bh/3bvXJjkdWA9eQWfgm7bqC0vWTa9YQq+q8pnZr/e0=;
        b=ib2CgQJRXMpe8/k1zFdM2JsLagqd8sgAT72dXy/tNQijikUz4zth9B0d6tYVCTHKuL
         FD8jipmkjkLNyGkoPVLNz9ldkAcic7T5vp5GDXtA2MIi/ni333J9mMPc/YftuDqv36tc
         OZlpxJywaZHjk/7aWsjk33RrPg7GHOQDhtFUKvzrEjcwZNs2NxzL2f90WB5No3IbZlR2
         3kvephpLIgGv+XoVCBnzLJe7qNpG5ZtkRZhzVP11fW+9LeD8xYcfkNFtaVAVo6yv8xQX
         1nqK+yvwNJo6ugpkcmJZfvin/yIOUPWKo1cwOlCUkfkTPoDQgxjZQ+n5zfs34EYtvYUn
         x0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694429301; x=1695034101;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bh/3bvXJjkdWA9eQWfgm7bqC0vWTa9YQq+q8pnZr/e0=;
        b=akSKsdTKLa9wMpJHZOvJV5YqJnXwouUfkpLMnyJnkMEF5CKCZGoO4bIgMtSzWdC7qp
         FUVgogxy9Ae42fa6WgcQ2K4lPzUhLgoL6/Dn6iT3tV38/z6IsAjZSXtq0wE2UnWCXOzn
         toHyfIp+FzmLwQwUVhXkekr12fYa4zOxB6FnQ3nrplMtzSqac9CduFY65nh1ftBcL92/
         q0p6AL6B2/DJ0QRdHNOB9/suKcRe8vYyD8fJYFqmM4MiJLo/9Phtzs+WMMjg6qmkHfd1
         dEfZ3t79zTN/2JaUFMMwQYc5MAzgcJATeSLXyd39Xf2EMN3DjsDhJ0dmXCfSNPoXyssS
         9ypw==
X-Gm-Message-State: AOJu0Yx/Q4PVWS6gTt0cNe2YoO2vxsLOhHngphUzAym8/P9fvwb+HRvh
        lHrDOVof2OqPVB9DO4SM7C3RiS96XT1BZIFut8I=
X-Google-Smtp-Source: AGHT+IG0rPGpX6TS+tRFnSKPKoWw6pqe4H7zOpp+XEdYAF/tHtOSSwWgHig/yKtWz2HlsNtSVmmdAQ==
X-Received: by 2002:a17:903:2291:b0:1c0:8bf3:eb15 with SMTP id b17-20020a170903229100b001c08bf3eb15mr9185568plh.30.1694429300738;
        Mon, 11 Sep 2023 03:48:20 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id y7-20020a1709029b8700b001bdbe6c86a9sm6115084plp.225.2023.09.11.03.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 03:48:20 -0700 (PDT)
Message-ID: <64fef074.170a0220.8bb85.e3c7@mx.google.com>
Date:   Mon, 11 Sep 2023 03:48:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.6-rc1
Subject: linusw/for-next baseline: 47 runs, 1 regressions (v6.6-rc1)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 47 runs, 1 regressions (v6.6-rc1)

Regressions Summary
-------------------

platform      | arch  | lab           | compiler | defconfig | regressions
--------------+-------+---------------+----------+-----------+------------
r8a77960-ulcb | arm64 | lab-collabora | gcc-10   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/v6.=
6-rc1/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: v6.6-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      0bb80ecc33a8fb5a682236443c1e740d5c917d1d =



Test Regressions
---------------- =



platform      | arch  | lab           | compiler | defconfig | regressions
--------------+-------+---------------+----------+-----------+------------
r8a77960-ulcb | arm64 | lab-collabora | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/64fee612dc6a48a214286de3

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v6.6-rc1/arm64=
/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v6.6-rc1/arm64=
/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64fee612dc6a48a214286dec
        new failure (last pass: v6.4-rc1)

    2023-09-11T10:08:04.598904  / # #

    2023-09-11T10:08:04.701027  export SHELL=3D/bin/sh

    2023-09-11T10:08:04.701461  #

    2023-09-11T10:08:04.802475  / # export SHELL=3D/bin/sh. /lava-11493746/=
environment

    2023-09-11T10:08:04.803176  =


    2023-09-11T10:08:04.904655  / # . /lava-11493746/environment/lava-11493=
746/bin/lava-test-runner /lava-11493746/1

    2023-09-11T10:08:04.905780  =


    2023-09-11T10:08:04.922887  / # /lava-11493746/bin/lava-test-runner /la=
va-11493746/1

    2023-09-11T10:08:04.971933  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-11T10:08:04.972435  + cd /lava-114937<8>[   19.194846] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11493746_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =20
