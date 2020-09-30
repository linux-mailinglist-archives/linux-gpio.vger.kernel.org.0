Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCEE327E7C3
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 13:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728149AbgI3Lmu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 07:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727997AbgI3Lmu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2020 07:42:50 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F09EC061755
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 04:42:48 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id s19so870698plp.3
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 04:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=22NCbkOxWlOp1qgfFePcjEYEXFLB98+R7naWov0Q91w=;
        b=QQr0W0JaZ4CvdUYlMrmJHTSLnVYMPw7xO4JNjJY7sdZeGNdvnfzIgVt3AnIKEqUC13
         3EIeK7CubrP9KrKspyYM4uRYZjG/oWrRLumiGjcfKnGPyuqlzSFNIr8qoPG7KPDQBBHx
         hhBf3A4j8EVz/hc/Uapg6MdSYYhOZNXBkr49eQsTdC2wpphJFKs6DBtxEZJimYYjLAnM
         T5rNC3e+H1G+xiIKvAKRVRBh+gNC6RHG7Ae3QdXt2LTlq4pMdf/g5c+iIp0kURHvgprx
         2ZnzVxSbxN0UrPg2MbyijUKse2ecX1WSqBg2meMlFCYahQpryrPsHsgSi9pFVTTBrdxZ
         rhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=22NCbkOxWlOp1qgfFePcjEYEXFLB98+R7naWov0Q91w=;
        b=NEnH3KEaJvr8RZrFhZAQED18NyLPqg6cGQY6RoLR6kGTDeby3ICQ7N1lOeD10YhXRt
         IUl01lxizH1kVvB/FNWx9kAhwKPqIzFv0ysI4+Bqetn6RfSk1xyI9G9fgXRcGzmKpW+F
         Em/LG5np5VlBYNoq0h+6c5If7zqVa14tBQ/ErF4BWCvTyO3Y8EuK8+zNBZAmZAikEo3g
         jd3XpK/Y6qKQ5xLx1O26+MqQTrfp2wDElS/ln5EHP+F5exZhgieKlDPzV3ZmUd60jvWt
         mmZQl4rhODITTET2bIYEc6MbXX8t8g9TqVx0IvFKwKcAY+98z8B2XPwIkDZ0xDSA89NW
         PLmA==
X-Gm-Message-State: AOAM531K37wZcYBunMb47eC1S7OxLAEU2M6eHU1V04gku6CIHVooQUUu
        VQ6gpL5aIF2JH7jA1NuOWrE+GawOi1l9nA==
X-Google-Smtp-Source: ABdhPJx/KWfch+1zfQxciOY65TllfKpP3wrCPSp4T+zrGUOmqkICi1lFnqV6hx7QNpnte/54cMGhqw==
X-Received: by 2002:a17:90a:c907:: with SMTP id v7mr2194842pjt.204.1601466167691;
        Wed, 30 Sep 2020 04:42:47 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 203sm2341621pfz.131.2020.09.30.04.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 04:42:46 -0700 (PDT)
Message-ID: <5f746f36.1c69fb81.815c6.4361@mx.google.com>
Date:   Wed, 30 Sep 2020 04:42:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-rc2-15-g17479aa39fbf
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
Subject: linusw/fixes baseline: 95 runs,
 6 regressions (v5.9-rc2-15-g17479aa39fbf)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes baseline: 95 runs, 6 regressions (v5.9-rc2-15-g17479aa39fbf)

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
c2-15-g17479aa39fbf/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   fixes
  Describe: v5.9-rc2-15-g17479aa39fbf
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      17479aa39fbf65ad1502368437875e537c2f8139 =



Test Regressions
---------------- =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
mt8173-elm-hana        | arm64 | lab-collabora | gcc-8    | defconfig      =
    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f74668cf54f3ad428877172

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.9-rc2-15-g1747=
9aa39fbf/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.9-rc2-15-g1747=
9aa39fbf/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f74668cf54f3ad428877=
173
      failing since 32 days (last pass: v5.8-rc5, first fail: v5.9-rc2)  =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
panda                  | arm   | lab-collabora | gcc-8    | multi_v7_defcon=
fig | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f746567bf7258b09a877177

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.9-rc2-15-g1747=
9aa39fbf/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.9-rc2-15-g1747=
9aa39fbf/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f746567bf7258b=
09a87717d
      failing since 17 days (last pass: v5.8-rc5, first fail: v5.9-rc2-3-g3=
c68e90fdb65)
      60 lines

    2020-09-30 11:00:49.881000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-09-30 11:00:49.887000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-09-30 11:00:49.892000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-09-30 11:00:49.898000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-09-30 11:00:49.904000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-09-30 11:00:49.910000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-09-30 11:00:49.916000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-09-30 11:00:49.922000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-09-30 11:00:49.928000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    2020-09-30 11:00:49.934000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80b
    ... (49 line(s) more)
      =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
rk3399-gru-kevin       | arm64 | lab-collabora | gcc-8    | defconfig      =
    | 88/90  =


  Details:     https://kernelci.org/test/plan/id/5f7467cbd88e31ad87877183

  Results:     88 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.9-rc2-15-g1747=
9aa39fbf/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.9-rc2-15-g1747=
9aa39fbf/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f7467ccd88e31a=
d878771de
      failing since 32 days (last pass: v5.8-rc5, first fail: v5.9-rc2)
      11 lines

    2020-09-30 11:11:01.076000  kern  :alert : Mem abort info:
    2020-09-30 11:11:01.080000  kern  :alert :   ESR =3D 0x96000006
    2020-09-30 11:11:01.086000  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2020-09-30 11:11:01.089000  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-09-30 11:11:01.092000  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-09-30 11:11:01.096000  kern  :alert : Data abort info:
    2020-09-30 11:11:01.100000  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2020-09-30 11:11:01.103000  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-09-30 11:11:01.110000  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000000eb16b000
    2020-09-30 11:11:01.122000  kern  :alert : [0000000000000010] pgd=3D000=
00000eb16c003, p4d=3D00000000eb16c003, pud=3D00000000eb16d003, pmd=3D000000=
0000000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f7467ccd88e=
31ad878771df
      failing since 32 days (last pass: v5.8-rc5, first fail: v5.9-rc2)
      2 lines

    2020-09-30 11:11:01.143000  kern  :emerg : Code: 1a9f07e7 f10000df 7a40=
08e4 54000521 (f94008c8) =

      =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
sun50i-a64-pine64-plus | arm64 | lab-baylibre  | gcc-8    | defconfig      =
    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f7469c5455d309c458771f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.9-rc2-15-g1747=
9aa39fbf/arm64/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus=
.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.9-rc2-15-g1747=
9aa39fbf/arm64/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f7469c5455d309c45877=
1f3
      failing since 29 days (last pass: v5.8-rc5, first fail: v5.9-rc2)  =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
sun7i-a20-cubieboard2  | arm   | lab-baylibre  | gcc-8    | multi_v7_defcon=
fig | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f74659bdea9a721ae877169

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.9-rc2-15-g1747=
9aa39fbf/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubie=
board2.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.9-rc2-15-g1747=
9aa39fbf/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubie=
board2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f74659bdea9a721ae877=
16a
      failing since 17 days (last pass: v5.8-rc5, first fail: v5.9-rc2-3-g3=
c68e90fdb65)  =20
