Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE5927DA26
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 23:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729351AbgI2Vcd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 17:32:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727740AbgI2Vcd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 17:32:33 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74097C061755
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 14:32:33 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id jw11so3462537pjb.0
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 14:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=GavHugu+2ViTXthKZHffU5lNdihGg+h4KpNUI/0epmM=;
        b=lWyDAaYGmSBSqEHvTKe1q7GZd1H1XCunEWOY5yklSY26wQK1M9YCYEVQ1OuhlqXhvc
         8X8IJlO8f65KLQLVJv/rPaIPN2pw5fM/8QFeLbwsb2Vxa76UW7KGKs+puRu1aX9Ytrfe
         e/IwfHJPSSCTaxCSAadTYH6R2i27pw23ZY8pSIpOI5NYu500FEqMZpsbrXI0S8GV4e9t
         rlqw0sxbX4tqbt8AYoCRQYlFOAkkAAR//NXwFN17Cmd3ZAo000eMkpBP6ntQTUvkSv4R
         lKGf3S+2GHDDD3D0pCPc1++WwcBfSarzuzGawxuIlfBys+wNguvNw1i+zN49Cfj1pUoU
         uOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=GavHugu+2ViTXthKZHffU5lNdihGg+h4KpNUI/0epmM=;
        b=VP8QRloTbVy1XnM4g2XSHl3QfGrQSosEFLNgroOlZvj53vePdDM4aACnyckYgZak2X
         1i8sr2obBk9OBQ0f79agc/ZRDqMBaMs0laTeAg5aSCrl1k7t8yGj5julqH7pGgLBuRcW
         NaxlMmztDMb3/pdQTPYPs2E9MT6svBjacT3+y/Z4xixy4cN2Q3KLTfT2paZCzKtIIplR
         /pRYPAMagwkaKKbRHEJM75oVotwZp/lUFNlQXJcdUR2O1jtKugQHLmYBROH8LDuBygkG
         6gXOaKj7m/d3Abqh9I0ELBWQ5jOrqDzaG6hIiiU1NZijFCi7tSJnU4Vi7aT+2+4hLSZ7
         3I1Q==
X-Gm-Message-State: AOAM532gjjzYUJGRKU+QVOitboGs+8Mwad0RXf2qPZcob6vpTboYtnZ2
        caoTfUiYJ19Wezhui49ZS6NXzswmmoJnoQ==
X-Google-Smtp-Source: ABdhPJyJ6I00xYC8gtEjmNRNePzf4TM9Pi5bxppg18VRQAJNZRtSrPS3kOQxMLXj5Ric3WSmXkvsaA==
X-Received: by 2002:a17:90a:1f43:: with SMTP id y3mr5522010pjy.28.1601415152518;
        Tue, 29 Sep 2020 14:32:32 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j4sm6867356pfd.101.2020.09.29.14.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 14:32:31 -0700 (PDT)
Message-ID: <5f73a7ef.1c69fb81.aee45.e38e@mx.google.com>
Date:   Tue, 29 Sep 2020 14:32:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-rc2-13-g2e969d8a7f99
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
Subject: linusw/fixes baseline: 93 runs,
 6 regressions (v5.9-rc2-13-g2e969d8a7f99)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes baseline: 93 runs, 6 regressions (v5.9-rc2-13-g2e969d8a7f99)

Regressions Summary
-------------------

platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
mt8173-elm-hana        | arm64 | lab-collabora | gcc-8    | defconfig      =
    | 0/1    =

panda                  | arm   | lab-collabora | gcc-8    | multi_v7_defcon=
fig | 4/5    =

rk3399-gru-kevin       | arm64 | lab-collabora | gcc-8    | defconfig      =
    | 88/90  =

sun50i-a64-pine64-plus | arm64 | lab-baylibre  | gcc-8    | defconfig      =
    | 0/1    =

sun7i-a20-cubieboard2  | arm   | lab-baylibre  | gcc-8    | multi_v7_defcon=
fig | 0/1    =


  Details:  https://kernelci.org/test/job/linusw/branch/fixes/kernel/v5.9-r=
c2-13-g2e969d8a7f99/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   fixes
  Describe: v5.9-rc2-13-g2e969d8a7f99
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      2e969d8a7f9903e8d015885bdfd031a6809a4d02 =



Test Regressions
---------------- =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
mt8173-elm-hana        | arm64 | lab-collabora | gcc-8    | defconfig      =
    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f739ec7272520e60f8771a0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.9-rc2-13-g2e96=
9d8a7f99/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.9-rc2-13-g2e96=
9d8a7f99/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f739ec7272520e60f877=
1a1
      failing since 32 days (last pass: v5.8-rc5, first fail: v5.9-rc2)  =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
panda                  | arm   | lab-collabora | gcc-8    | multi_v7_defcon=
fig | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f739d72efa733e57387726c

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.9-rc2-13-g2e96=
9d8a7f99/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.9-rc2-13-g2e96=
9d8a7f99/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f739d72efa733e=
573877272
      failing since 17 days (last pass: v5.8-rc5, first fail: v5.9-rc2-3-g3=
c68e90fdb65)
      60 lines

    2020-09-29 20:47:40.291000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-09-29 20:47:40.297000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-09-29 20:47:40.302000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-09-29 20:47:40.308000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-09-29 20:47:40.314000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-09-29 20:47:40.320000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-09-29 20:47:40.326000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-09-29 20:47:40.332000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-09-29 20:47:40.338000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    2020-09-29 20:47:40.344000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80b
    ... (49 line(s) more)
      =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
rk3399-gru-kevin       | arm64 | lab-collabora | gcc-8    | defconfig      =
    | 88/90  =


  Details:     https://kernelci.org/test/plan/id/5f739deb026eb18e45877197

  Results:     88 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.9-rc2-13-g2e96=
9d8a7f99/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.9-rc2-13-g2e96=
9d8a7f99/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f739dec026eb18=
e458771f2
      failing since 32 days (last pass: v5.8-rc5, first fail: v5.9-rc2)
      11 lines

    2020-09-29 20:49:40.396000  kern  :alert : Mem abort info:
    2020-09-29 20:49:40.400000  kern  :alert :   ESR =3D 0x96000006
    2020-09-29 20:49:40.406000  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2020-09-29 20:49:40.409000  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-09-29 20:49:40.413000  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-09-29 20:49:40.416000  kern  :alert : Data abort info:
    2020-09-29 20:49:40.420000  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2020-09-29 20:49:40.423000  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-09-29 20:49:40.431000  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000000ebf2b000
    2020-09-29 20:49:40.442000  kern  :alert : [0000000000000010] pgd=3D000=
00000ec6ba003, p4d=3D00000000ec6ba003, pud=3D00000000ec6be003, pmd=3D000000=
0000000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f739dec026e=
b18e458771f3
      failing since 32 days (last pass: v5.8-rc5, first fail: v5.9-rc2)
      2 lines

    2020-09-29 20:49:40.463000  kern  :emerg : Code: 1a9f07e7 f10000df 7a40=
08e4 54000521 (f94008c8) =

      =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
sun50i-a64-pine64-plus | arm64 | lab-baylibre  | gcc-8    | defconfig      =
    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f739ff46893e9d829877173

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.9-rc2-13-g2e96=
9d8a7f99/arm64/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus=
.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.9-rc2-13-g2e96=
9d8a7f99/arm64/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f739ff46893e9d829877=
174
      failing since 29 days (last pass: v5.8-rc5, first fail: v5.9-rc2)  =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
sun7i-a20-cubieboard2  | arm   | lab-baylibre  | gcc-8    | multi_v7_defcon=
fig | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f739d3e8ee8f2d074877170

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.9-rc2-13-g2e96=
9d8a7f99/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubie=
board2.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.9-rc2-13-g2e96=
9d8a7f99/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubie=
board2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f739d3e8ee8f2d074877=
171
      failing since 17 days (last pass: v5.8-rc5, first fail: v5.9-rc2-3-g3=
c68e90fdb65)  =20
