Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2837C27FC92
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Oct 2020 11:41:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731619AbgJAJlC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Oct 2020 05:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731131AbgJAJlC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Oct 2020 05:41:02 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D197C0613D0
        for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2020 02:41:02 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id 197so3609600pge.8
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2020 02:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=qPBOj/0W+9h3k6nVIKY+cJm76b9Vzz21gYySwnVm0Uo=;
        b=UM73MoZd1E3ZEYfObP1iFBCVEvTawWEbg2JtE5S8BJpiY4fI5dhlouB5+4MT6HLJkN
         0iCMBD75rO9/+G9uh+64BlENVscKMv9ccxRPKKCYV7Jp0XQVchSkuy+Ji6xora9U/pxL
         POxsrus/21pOw3YaENlTDWV/Z5O5F9nIiKabFtvqdnHh2DWfGoiHjwjy75Tjc7Jx+Bv8
         XpFrTbW768Vfth2P7o3yA98dEkBIzmobwtlVYPZFsHNz9qSrZAGf5/fl/pUH7y2gjC48
         RSyGACslKKH5JKWfbhUNzL5L7M2UCsiXzOFahP2QZHcZZZgDFyPI9MEoF3VB2tm/oQwz
         t/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=qPBOj/0W+9h3k6nVIKY+cJm76b9Vzz21gYySwnVm0Uo=;
        b=R5W2A5QzfCgJcOqjlVBYWeXNRJahh3InzdZq6yUfJ/rJb6WGQLrA7RezLFb3CCkiw5
         OVqHT5jvCS0xD0jSqJg3UKSF0gdJKxmMb1Nk00KnHipq7KLBlA1tGMr+HuR3jcd3l9+h
         HAWQprHbduSgHX8DPpdv8FKM/0Eq5m1GXUvetsja0Ujs/mNNDcPDd5CWtXqq9cNNrsfi
         UsfUJqMWEwJtwU0UvHjVkABH2wLji3+0MsDA78OVQiXWgcUOweoHoJIQVOGUkkWd1ThO
         8vEJwfREfhe/oN3y7mZehNEa2aKT9rs2fqNaqdephfPGASgTbm69gofokZNtzIFUn9TL
         gBLQ==
X-Gm-Message-State: AOAM533Fa+M8DWk9YzZf0UjqzHAkEBaen1RA+0hRTJF63u1ZnRRZ04hv
        qK5MPKl229UOCZ4Mxa7NJaYcybJJfs4HFw==
X-Google-Smtp-Source: ABdhPJwdryUYgLqAAiSTb+P4Z4D0q20Feu+oBEw4aGn4bMb4GzxaYbrs4bm9tcn78srUCOrf5bf+7g==
X-Received: by 2002:a62:17cd:0:b029:13c:1611:652b with SMTP id 196-20020a6217cd0000b029013c1611652bmr6327803pfx.11.1601545261174;
        Thu, 01 Oct 2020 02:41:01 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w19sm5758788pfq.60.2020.10.01.02.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 02:41:00 -0700 (PDT)
Message-ID: <5f75a42c.1c69fb81.a1720.c304@mx.google.com>
Date:   Thu, 01 Oct 2020 02:41:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-rc2-91-g72a31192b5a9
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
Subject: linusw/for-next baseline: 104 runs,
 3 regressions (v5.9-rc2-91-g72a31192b5a9)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 104 runs, 3 regressions (v5.9-rc2-91-g72a31192b5a=
9)

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
9-rc2-91-g72a31192b5a9/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: v5.9-rc2-91-g72a31192b5a9
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      72a31192b5a9779b36411841e1d318cdab3d234e =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
   | results
----------------------+-------+---------------+----------+-----------------=
---+--------
mt8173-elm-hana       | arm64 | lab-collabora | gcc-8    | defconfig       =
   | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f759b0391cb44cbd7877179

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.9-rc2-91-g7=
2a31192b5a9/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.9-rc2-91-g7=
2a31192b5a9/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f759b0391cb44cbd7877=
17a
      failing since 33 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.8-11991-gfc80c51fd4b2)  =



platform              | arch  | lab           | compiler | defconfig       =
   | results
----------------------+-------+---------------+----------+-----------------=
---+--------
panda                 | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f759951875eb8c8c9877169

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.9-rc2-91-g7=
2a31192b5a9/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.9-rc2-91-g7=
2a31192b5a9/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f759951875eb8c=
8c987716f
      failing since 33 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.8-11991-gfc80c51fd4b2)
      60 lines

    2020-10-01 08:54:35.894000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-10-01 08:54:35.900000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-10-01 08:54:35.906000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-10-01 08:54:35.912000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-10-01 08:54:35.918000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-10-01 08:54:35.924000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-10-01 08:54:35.929000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-10-01 08:54:35.936000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-10-01 08:54:35.942000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    2020-10-01 08:54:35.948000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80b
    ... (49 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
   | results
----------------------+-------+---------------+----------+-----------------=
---+--------
sun7i-a20-cubieboard2 | arm   | lab-baylibre  | gcc-8    | multi_v7_defconf=
ig | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f759944799f33713b877194

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.9-rc2-91-g7=
2a31192b5a9/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.9-rc2-91-g7=
2a31192b5a9/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f759944799f33713b877=
195
      failing since 13 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.9-rc2-19-ga5d0fe9ff2af)  =20
