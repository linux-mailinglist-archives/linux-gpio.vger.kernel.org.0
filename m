Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEA0B27E6D5
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 12:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729166AbgI3Kkj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 06:40:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727657AbgI3Kkj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2020 06:40:39 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C3AFC061755
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 03:40:39 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id x22so881567pfo.12
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 03:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9L6cGYUqGrUnWnm/CFL95phbhL6Rzp/MWztGQDQCj3M=;
        b=yaj1DVoypGbNJrLDWi6uC1+6ctBLL9f8SMB+TRTn1PohM+AHA0a3Tpp2PYhvJjKhfm
         kawR58KgLSlpWU+Fuzp6vGnSEED4TfxU+A+DJemtGVZX/Kb/tOMNDMuXv2FLbM5FOKLs
         xjOVQZzJT+j+FJvRGy6DTlmPE1r7o2NOVPVC9om879QgsTZsdXOCYRH5xbqGOfq5a0k6
         CXJEdpwG+WZG3iKQHO4TPJ4brQRDxcXbC+CKFDRj9MjNo+o2+zaSlM6O8DEzacINyqzd
         pwra3ZJ7p1Znr8A5CgekeqTqSwwA0XYQuZUedG9q/BI1BZceKWQJuTBhqKwkHpvWIbwo
         7X1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9L6cGYUqGrUnWnm/CFL95phbhL6Rzp/MWztGQDQCj3M=;
        b=Fk1GCteBpY2937QhGetXSRJWzFyFT55Pj3kZQ8/NiTGmDtqPPhHkg1NnAPfctGVvWq
         M9yhgK02f7lFQBQvh669hAxYPtobFdoBaJSIJhm9UGVtRtOmjDsfnH9qDx7fys3RLTzU
         6JMrQqRnM/lA4Z6HVw2vlf4y2MxHodHK55lG0MxzSWbpYOEoDPUjlyU3aTa8WvWfekUD
         2Zupx+qRtT/yAJotjnuprb0wi/0P1MgFm9IyUIJpZ3JPN0C9a6SkdM82L9a50bfEH2V+
         brJetmtCiX+cClRDFm5MJgwgbWVTPms60vIipo+pbw8fgE/lZ+DJpiAslLCAUbu7T0qy
         +8zA==
X-Gm-Message-State: AOAM533NlG7isVH7cT8HdPUxbPSw92ZqAUc9uCQd5SvxKpHJee6ZGfUt
        KaMSk8GEoROFTaDVcuSeGm5367XgJKz1iA==
X-Google-Smtp-Source: ABdhPJyhVtRhShnYq+6BTghA6MOAP572uzNXrPgw/02SgcHiS4dgpVRCixexqgH1JWF2nQH2JqfY4A==
X-Received: by 2002:a62:14d2:0:b029:142:2501:39f2 with SMTP id 201-20020a6214d20000b0290142250139f2mr1881537pfu.65.1601462438121;
        Wed, 30 Sep 2020 03:40:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j144sm2101228pfd.106.2020.09.30.03.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 03:40:37 -0700 (PDT)
Message-ID: <5f7460a5.1c69fb81.a5ef8.3d72@mx.google.com>
Date:   Wed, 30 Sep 2020 03:40:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-rc2-53-g7da6060fb2fe
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
Subject: linusw/for-next baseline: 100 runs,
 3 regressions (v5.9-rc2-53-g7da6060fb2fe)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 100 runs, 3 regressions (v5.9-rc2-53-g7da6060fb2f=
e)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
   | results
----------------------+-------+---------------+----------+-----------------=
---+--------
mt8173-elm-hana       | arm64 | lab-collabora | gcc-8    | defconfig       =
   | 0/1    =

panda                 | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig | 4/5    =

sun7i-a20-cubieboard2 | arm   | lab-baylibre  | gcc-8    | multi_v7_defconf=
ig | 0/1    =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/v5.=
9-rc2-53-g7da6060fb2fe/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: v5.9-rc2-53-g7da6060fb2fe
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      7da6060fb2fef4380d13cc48790c0425c0a95401 =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
   | results
----------------------+-------+---------------+----------+-----------------=
---+--------
mt8173-elm-hana       | arm64 | lab-collabora | gcc-8    | defconfig       =
   | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f745780a4ba68272a877172

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.9-rc2-53-g7=
da6060fb2fe/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.9-rc2-53-g7=
da6060fb2fe/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f745780a4ba68272a877=
173
      failing since 32 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.8-11991-gfc80c51fd4b2)  =



platform              | arch  | lab           | compiler | defconfig       =
   | results
----------------------+-------+---------------+----------+-----------------=
---+--------
panda                 | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f745670a45542aa6d87717b

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.9-rc2-53-g7=
da6060fb2fe/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.9-rc2-53-g7=
da6060fb2fe/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f745670a45542a=
a6d877181
      failing since 32 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.8-11991-gfc80c51fd4b2)
      60 lines

    2020-09-30 09:56:58.774000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-09-30 09:56:58.780000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-09-30 09:56:58.786000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-09-30 09:56:58.792000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-09-30 09:56:58.798000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-09-30 09:56:58.804000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-09-30 09:56:58.810000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-09-30 09:56:58.816000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-09-30 09:56:58.822000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    2020-09-30 09:56:58.827000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80b
    ... (49 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
   | results
----------------------+-------+---------------+----------+-----------------=
---+--------
sun7i-a20-cubieboard2 | arm   | lab-baylibre  | gcc-8    | multi_v7_defconf=
ig | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f745625e5bc32687687716c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.9-rc2-53-g7=
da6060fb2fe/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.9-rc2-53-g7=
da6060fb2fe/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f745625e5bc326876877=
16d
      failing since 12 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.9-rc2-19-ga5d0fe9ff2af)  =20
