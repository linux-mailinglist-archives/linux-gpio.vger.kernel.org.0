Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53132267B69
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Sep 2020 18:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725385AbgILQ1U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Sep 2020 12:27:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725846AbgILQ0k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Sep 2020 12:26:40 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF779C061573
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 09:26:39 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id j7so2391971plk.11
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 09:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=cRpF6C2rI4nfF704IgMp1KzoEsHsTwAC7VofuD1P+kg=;
        b=UNvOB4KI3smxvwFY1ZQtmg6ZanoqfaCGEm14sSHm5tXSfinE1LOASBIsQtxh1HsQpr
         TWBIhzbLYkhxs51qk2kzAijGUFo7VU6fq7jH+DoumqIH6E7iokYSGTWMV5lJg9mVg4Jm
         zkmwr8R7S333MbTXB06Sy+gzfE/z6tYEDg9fBVVJmeTwtg4RfiZBB6Jqy0QcAkKzftF/
         vtQcZLf/7rAeZQO4NB+ILmabd61FoVgFiVTjqEQK70MdoIRA7WopQCnH/CLDZjQs5p4G
         q+E6lzsg39frwrV0+fhP6e/2lpFc3ymq1t2YWOMc5B9HtyB53RSJX1HLlVUVIdol/dTk
         nY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=cRpF6C2rI4nfF704IgMp1KzoEsHsTwAC7VofuD1P+kg=;
        b=oo8OwGOJ0Ei0lpQl0bm+z9OlhPbHMiyg8YdWfqUvETpWRMj7Tw4bTlzQSOQXPxm86p
         HAPf4Y7f4McYQCYlHRIRMLYOkJnNVQH60P95mpSRYMSAXg45VKOnzkfVmoLIhe1Seakq
         v2/PUfxO6n3a48kwrb8r1g7NwnuI/DRCInIq3cjjR7T0ixDPiDPRNVTEWclNb48wyBUi
         LAr0Ee8086R4uHkEgcRBrjknAaIs5PSn88sNWJaWRS4qV6J0dH2vnPsyHZSXhtkYcRud
         ujgR4kv3dZIAncZ/w8kONIzbruQTMAJugpi8l3NwdF1bpjnDjkm8qTPuhG2blonsaVEn
         gwnQ==
X-Gm-Message-State: AOAM532fCBHuBGvtTQ8uRXch5BCO9MUu3iW6hzRsWxBeIsrtsTbBBAPd
        VZawIRfuonzZE//pMRwa+B2KQNS965977A==
X-Google-Smtp-Source: ABdhPJyvJjH/pTQ1g6l1ToFF6iNl9rVvPdZWDcuBdgs/tZ1O0/wnPkl/DiI0cAv0Nzu3Bqmx2Xe4vg==
X-Received: by 2002:a17:902:8bc2:b029:d0:cbe1:e709 with SMTP id r2-20020a1709028bc2b02900d0cbe1e709mr6980486plo.23.1599927998486;
        Sat, 12 Sep 2020 09:26:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f4sm5664213pfa.125.2020.09.12.09.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 09:26:37 -0700 (PDT)
Message-ID: <5f5cf6bd.1c69fb81.8cbcd.e975@mx.google.com>
Date:   Sat, 12 Sep 2020 09:26:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.9-rc2-3-g3c68e90fdb65
X-Kernelci-Report-Type: test
X-Kernelci-Tree: linusw
X-Kernelci-Branch: fixes
Subject: linusw/fixes baseline: 104 runs,
 7 regressions (v5.9-rc2-3-g3c68e90fdb65)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes baseline: 104 runs, 7 regressions (v5.9-rc2-3-g3c68e90fdb65)

Regressions Summary
-------------------

platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
bcm2837-rpi-3-b        | arm64 | lab-baylibre  | gcc-8    | defconfig      =
    | 3/4    =

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
c2-3-g3c68e90fdb65/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   fixes
  Describe: v5.9-rc2-3-g3c68e90fdb65
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      3c68e90fdb65d7884e34d2f0bf900cdc76ba0192 =



Test Regressions
---------------- =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
bcm2837-rpi-3-b        | arm64 | lab-baylibre  | gcc-8    | defconfig      =
    | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f5cec79ee7aaee9b0a6091d

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.9-rc2-3-g3c68e=
90fdb65/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.9-rc2-3-g3c68e=
90fdb65/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f5cec79ee7aaee9=
b0a6091f
      failing since 14 days (last pass: v5.8-rc5, first fail: v5.9-rc2)
      2 lines

    2020-09-12 15:40:01.935000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-09-12 15:40:01.935000  (user:khilman) is already connected
    2020-09-12 15:40:16.939000  =00
    2020-09-12 15:40:16.939000  =

    2020-09-12 15:40:16.939000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-09-12 15:40:16.939000  =

    2020-09-12 15:40:16.939000  DRAM:  948 MiB
    2020-09-12 15:40:16.954000  RPI 3 Model B (0xa02082)
    2020-09-12 15:40:17.042000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-09-12 15:40:17.074000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (386 line(s) more)
      =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
mt8173-elm-hana        | arm64 | lab-collabora | gcc-8    | defconfig      =
    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f5ced0a8a1d0b354aa60947

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.9-rc2-3-g3c68e=
90fdb65/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.9-rc2-3-g3c68e=
90fdb65/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f5ced0a8a1d0b354aa60=
948
      failing since 14 days (last pass: v5.8-rc5, first fail: v5.9-rc2)  =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
panda                  | arm   | lab-collabora | gcc-8    | multi_v7_defcon=
fig | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f5cecc210cdeb2248a60914

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.9-rc2-3-g3c68e=
90fdb65/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.9-rc2-3-g3c68e=
90fdb65/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f5cecc210cdeb2=
248a60918
      new failure (last pass: v5.8-rc5)
      60 lines

    2020-09-12 15:43:56.489000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-09-12 15:43:56.495000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-09-12 15:43:56.501000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-09-12 15:43:56.507000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-09-12 15:43:56.512000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-09-12 15:43:56.518000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-09-12 15:43:56.524000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-09-12 15:43:56.530000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-09-12 15:43:56.536000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    2020-09-12 15:43:56.542000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80b
    ... (49 line(s) more)
      =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
rk3399-gru-kevin       | arm64 | lab-collabora | gcc-8    | defconfig      =
    | 83/88  =


  Details:     https://kernelci.org/test/plan/id/5f5cec43582a9463f1a60915

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.9-rc2-3-g3c68e=
90fdb65/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.9-rc2-3-g3c68e=
90fdb65/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f5cec43582a946=
3f1a60919
      failing since 14 days (last pass: v5.8-rc5, first fail: v5.9-rc2)
      11 lines

    2020-09-12 15:41:42.468000  kern  :alert : Mem abort info:
    2020-09-12 15:41:42.472000  kern  :alert :   ESR =3D 0x96000006
    2020-09-12 15:41:42.478000  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2020-09-12 15:41:42.481000  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-09-12 15:41:42.485000  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-09-12 15:41:42.488000  kern  :alert : Data abort info:
    2020-09-12 15:41:42.492000  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2020-09-12 15:41:42.496000  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-09-12 15:41:42.503000  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000000eb7ee000
    2020-09-12 15:41:42.514000  kern  :alert : [0000000000000010] pgd=3D000=
00000eb7ef003, p4d=3D00000000eb7ef003, pud=3D00000000eb7f0003, pmd=3D000000=
0000000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f5cec43582a=
9463f1a6091a
      failing since 14 days (last pass: v5.8-rc5, first fail: v5.9-rc2)
      2 lines

    2020-09-12 15:41:42.535000  kern  :emerg : Code: 1a9f07e7 f10000df 7a40=
08e4 54000521 (f94008c8) =

      =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
sun50i-a64-pine64-plus | arm64 | lab-baylibre  | gcc-8    | defconfig      =
    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f5cedd4aa7d43f9fca60919

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.9-rc2-3-g3c68e=
90fdb65/arm64/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.=
txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.9-rc2-3-g3c68e=
90fdb65/arm64/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f5cedd4aa7d43f9fca60=
91a
      failing since 12 days (last pass: v5.8-rc5, first fail: v5.9-rc2)  =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
sun7i-a20-cubieboard2  | arm   | lab-baylibre  | gcc-8    | multi_v7_defcon=
fig | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f5cec803a4356e7aea60936

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.9-rc2-3-g3c68e=
90fdb65/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieb=
oard2.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.9-rc2-3-g3c68e=
90fdb65/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieb=
oard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f5cec803a4356e7aea60=
937
      new failure (last pass: v5.8-rc5)  =20
