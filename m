Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F000C29D3BC
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Oct 2020 22:46:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725832AbgJ1VqY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 17:46:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727482AbgJ1VqU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 17:46:20 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25853C0613CF
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 14:46:20 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 10so563294pfp.5
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 14:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=D9yBEP0BC1CL/HX+S5BV6AJ+N9aTSedv3FZAQ2A8X3c=;
        b=mqY58YKKEGA9l/mhFHD4sS4N+DebhKDcecQcHIIvclavs/oj2lAylRLEjWtAr/vvCh
         t4kQG4fxq4W7dxX0ta07YQXsWKrSnpHh3qY+3z/OlVB0B7Q1bP/jciFRRcCfFhB0Vstu
         XcUkIvm2uwP2URdM8kS5Mk2cKmaOBO7VA5eYmflpYWhb4WBLQ9QrQ0mItuylm8HTFh3u
         Zlg9KF1+YC2ZRDntCIAc5qfCOUfA5IzPqPQouWEC+gVRxgB+Iiu0eMWkF+LxfOwPRzlb
         8cCcE2PR5fk+bhmnbmdo50EWy+QbEtO5/1EKPZunEaBlrLaOk5K1QP+YXJDDgT/D0rcw
         SPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=D9yBEP0BC1CL/HX+S5BV6AJ+N9aTSedv3FZAQ2A8X3c=;
        b=CAtQhASsntTIZTG9+LE7ykxlvhHuTWYrwZBdKpPWtKfnLhYhkgdsSEJiLR/b5DYQFH
         NNCxhzNqGW9zcd3qvci8Vroy0U7R2QyXArm0Ns4Nj8dJDczpjpppzmxp4UpkbtxryLkj
         vmQqs+Um6AYs0zdG65Z8crSWt9Orqvx4vW03izsTzSp4xqFuqckJLvZzJ6aMSJAAGBQd
         RARINTMAAJpTiTuU/uoTaxKDG/M2tFA/DgfMjsL3461csgwVOZxhouWIMm/Y67dH8GhM
         PrJokuFTF5/FSYvVUxjVkBNxNXdQqlKJVqHyIToWRI8Ow4uSymDVOwOxNSR1oDZ2uoG0
         dtzw==
X-Gm-Message-State: AOAM5335b8GzylFtnB9vfro1zVwZY1yqEsJ/gVfqSFvQm5z6YRogRINg
        UY2DmefBsj6wQM9X6s2fS+GD7R+y1RShKA==
X-Google-Smtp-Source: ABdhPJxLQsw7bzutqzTXD9K6KVCfPPQlksvFJS0xOH5GloE7wk3twdqZCGcMY01VVRkPofY4bbkoXg==
X-Received: by 2002:a63:8c59:: with SMTP id q25mr521735pgn.15.1603908088891;
        Wed, 28 Oct 2020 11:01:28 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id lw12sm78864pjb.5.2020.10.28.11.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 11:01:28 -0700 (PDT)
Message-ID: <5f99b1f8.1c69fb81.62d33.03f3@mx.google.com>
Date:   Wed, 28 Oct 2020 11:01:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.10-rc1-6-g7ffa08169849
X-Kernelci-Report-Type: test
X-Kernelci-Tree: linusw
X-Kernelci-Branch: fixes
Subject: linusw/fixes baseline: 110 runs,
 1 regressions (v5.10-rc1-6-g7ffa08169849)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes baseline: 110 runs, 1 regressions (v5.10-rc1-6-g7ffa08169849)

Regressions Summary
-------------------

platform | arch | lab           | compiler | defconfig          | regressio=
ns
---------+------+---------------+----------+--------------------+----------=
--
panda    | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/linusw/branch/fixes/kernel/v5.10-=
rc1-6-g7ffa08169849/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   fixes
  Describe: v5.10-rc1-6-g7ffa08169849
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      7ffa08169849be898eed6f3694aab8c425497749 =



Test Regressions
---------------- =



platform | arch | lab           | compiler | defconfig          | regressio=
ns
---------+------+---------------+----------+--------------------+----------=
--
panda    | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/5f99a90cde6fe0df00381020

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.10-rc1-6-g7ffa=
08169849/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.10-rc1-6-g7ffa=
08169849/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f99a90cde6fe0d=
f00381026
        failing since 46 days (last pass: v5.8-rc5, first fail: v5.9-rc2-3-=
g3c68e90fdb65)
        60 lines

    2020-10-28 17:23:18.829000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper/0  pfn:9c802
    2020-10-28 17:23:18.835000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper/0  pfn:9c803
    2020-10-28 17:23:18.841000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper/0  pfn:9c804
    2020-10-28 17:23:18.847000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper/0  pfn:9c805
    2020-10-28 17:23:18.853000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper/0  pfn:9c806
    2020-10-28 17:23:18.859000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper/0  pfn:9c807
    2020-10-28 17:23:18.865000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper/0  pfn:9c808
    2020-10-28 17:23:18.871000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper/0  pfn:9c809
    2020-10-28 17:23:18.877000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper/0  pfn:9c80a
    2020-10-28 17:23:18.883000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper/0  pfn:9c80b =

    ... (49 line(s) more)  =

 =20
