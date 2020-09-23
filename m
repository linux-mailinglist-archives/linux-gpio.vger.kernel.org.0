Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0267274DB7
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 02:13:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbgIWANv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Sep 2020 20:13:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727015AbgIWANv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Sep 2020 20:13:51 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A64C3C061755
        for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2020 17:13:51 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id u24so2442012pgi.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2020 17:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=oyCK4BX+OIKtCEetyZF1a5ksqYVwUJl9325olowclLo=;
        b=lTUv7YpLc8vv9IH7pY2gSCBeybswbujXLFzMpmCRNtQYCKbGhVdPt6K9yLey/7HOci
         TqJTAPDj+Qzo3PYGB4C7XJTlbc5zuJ/cM3jHr1UmJPf6k09hRgLX6kkPyNt22LUdbjDL
         YqZLGjiBGajAEf+qB4jQjCbusJRGdxafHJNiYkpmciV6aQjt7i0gzfIDLini9aACaeC+
         Zx1Po4apBLK0h7fJMWC87v9n4xHp3Ypx/MCzbHp3orR3k+0apd8hgR1dKN3OSa3kXXrG
         1eXiM7WjyVJiZaU0epEsDq0eRMZyQTVlgDhVqfM7jZwMMkCmjpE80fyPpake71qJwgtO
         Q0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=oyCK4BX+OIKtCEetyZF1a5ksqYVwUJl9325olowclLo=;
        b=fYGYJai2p5OGeXmQaIUYV0rK9ZsMNkdn6Pv2I6io7lvgJwTFe752+g//2Pa8T30TGV
         5/Ht2K5QLgRdJdoJ6VmevR786zKN2Y1Sfq5xxAuGSZXrxsofB+DneSwFeagn/xiOmfRt
         nCY+WdaqJKjtnp/+EGOD7kwrNR7r5HulE1awEJXmSnJmi/hUGjiZ0YxpIvXJ3bo5K5Pj
         CxNEr7Wpq1h3ZnkOy9Yf7DDGd4oPaNaYNuL5ptvf0XXNWNdA3ZPIB+YDsyiT6PUVBC54
         mcgRPazQHDjzPa1JpNB8jRmBjZnW+k0YK3oJTP2ZD40i0tQxQqVbssdGlEy7AemCV6jk
         gpjQ==
X-Gm-Message-State: AOAM532r9IUacn/o9gSUBwv4v7EC7v7CgZBxv7aLoH5WsK6ikQF/vYn/
        FBAi3ut/s5Br1gZ4Szp0x2JRDiJwES7hoA==
X-Google-Smtp-Source: ABdhPJyTiVByaxHb/zo7hjwV3YBo0gvy2gZamfqUCvnr64PpsQDFZOq6kJ42AwVHw12BvWNOvTjkVw==
X-Received: by 2002:a65:5502:: with SMTP id f2mr5305548pgr.418.1600820030696;
        Tue, 22 Sep 2020 17:13:50 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r2sm15205248pga.94.2020.09.22.17.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 17:13:49 -0700 (PDT)
Message-ID: <5f6a933d.1c69fb81.adb07.3fc7@mx.google.com>
Date:   Tue, 22 Sep 2020 17:13:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: linusw
X-Kernelci-Branch: fixes
X-Kernelci-Kernel: v5.9-rc2-8-g53c14e237b01
Subject: linusw/fixes baseline: 113 runs,
 6 regressions (v5.9-rc2-8-g53c14e237b01)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes baseline: 113 runs, 6 regressions (v5.9-rc2-8-g53c14e237b01)

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
    | 83/88  =

sun50i-a64-pine64-plus | arm64 | lab-baylibre  | gcc-8    | defconfig      =
    | 0/1    =

sun7i-a20-cubieboard2  | arm   | lab-baylibre  | gcc-8    | multi_v7_defcon=
fig | 0/1    =


  Details:  https://kernelci.org/test/job/linusw/branch/fixes/kernel/v5.9-r=
c2-8-g53c14e237b01/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   fixes
  Describe: v5.9-rc2-8-g53c14e237b01
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      53c14e237b0128aed9e2f1ab3700c46fdad36ebc =



Test Regressions
---------------- =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
mt8173-elm-hana        | arm64 | lab-collabora | gcc-8    | defconfig      =
    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6a87ac54d969c4a7bf9dd7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.9-rc2-8-g53c14=
e237b01/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.9-rc2-8-g53c14=
e237b01/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6a87ac54d969c4a7bf9=
dd8
      failing since 25 days (last pass: v5.8-rc5, first fail: v5.9-rc2)  =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
panda                  | arm   | lab-collabora | gcc-8    | multi_v7_defcon=
fig | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f6a8b996a10fcaa9bbf9de8

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.9-rc2-8-g53c14=
e237b01/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.9-rc2-8-g53c14=
e237b01/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f6a8b996a10fca=
a9bbf9dee
      failing since 10 days (last pass: v5.8-rc5, first fail: v5.9-rc2-3-g3=
c68e90fdb65)
      60 lines

    2020-09-22 23:41:07.209000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-09-22 23:41:07.215000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-09-22 23:41:07.221000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-09-22 23:41:07.227000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-09-22 23:41:07.233000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-09-22 23:41:07.240000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-09-22 23:41:07.245000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-09-22 23:41:07.251000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-09-22 23:41:07.257000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    2020-09-22 23:41:07.263000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80b
    ... (49 line(s) more)
      =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
rk3399-gru-kevin       | arm64 | lab-collabora | gcc-8    | defconfig      =
    | 83/88  =


  Details:     https://kernelci.org/test/plan/id/5f6a88420790e542afbf9dc7

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.9-rc2-8-g53c14=
e237b01/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.9-rc2-8-g53c14=
e237b01/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f6a88420790e54=
2afbf9e20
      failing since 25 days (last pass: v5.8-rc5, first fail: v5.9-rc2)
      11 lines

    2020-09-22 23:26:43.985000  kern  :alert : Mem abort info:
    2020-09-22 23:26:43.988000  kern  :alert :   ESR =3D 0x96000006
    2020-09-22 23:26:43.994000  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2020-09-22 23:26:43.998000  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-09-22 23:26:44.001000  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-09-22 23:26:44.004000  kern  :alert : Data abort info:
    2020-09-22 23:26:44.008000  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2020-09-22 23:26:44.012000  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-09-22 23:26:44.019000  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000000ebed2000
    2020-09-22 23:26:44.031000  kern  :alert : [0000000000000010] pgd=3D000=
00000ebed0003, p4d=3D00000000ebed0003, pud=3D00000000ebecb003, pmd=3D000000=
0000000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f6a88420790=
e542afbf9e21
      failing since 25 days (last pass: v5.8-rc5, first fail: v5.9-rc2)
      2 lines

    2020-09-22 23:26:44.052000  kern  :emerg : Code: 1a9f07e7 f10000df 7a40=
08e4 54000521 (f94008c8) =

      =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
sun50i-a64-pine64-plus | arm64 | lab-baylibre  | gcc-8    | defconfig      =
    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6a881e4a2ddc9abdbf9dfc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.9-rc2-8-g53c14=
e237b01/arm64/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.=
txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.9-rc2-8-g53c14=
e237b01/arm64/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6a881e4a2ddc9abdbf9=
dfd
      failing since 22 days (last pass: v5.8-rc5, first fail: v5.9-rc2)  =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
sun7i-a20-cubieboard2  | arm   | lab-baylibre  | gcc-8    | multi_v7_defcon=
fig | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6a894cea697ddab8bf9db4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.9-rc2-8-g53c14=
e237b01/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieb=
oard2.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.9-rc2-8-g53c14=
e237b01/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieb=
oard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6a894cea697ddab8bf9=
db5
      failing since 10 days (last pass: v5.8-rc5, first fail: v5.9-rc2-3-g3=
c68e90fdb65)  =20
