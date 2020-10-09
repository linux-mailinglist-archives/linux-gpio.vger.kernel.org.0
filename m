Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC633287FC6
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Oct 2020 03:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728703AbgJIBGa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Oct 2020 21:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726348AbgJIBGa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Oct 2020 21:06:30 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8222AC0613D2
        for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2020 18:06:28 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id y20so3622070pll.12
        for <linux-gpio@vger.kernel.org>; Thu, 08 Oct 2020 18:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=mY9FjEmlbnvKmC87ia/+uHD2ZXJYbHenf3f/5/6LVJo=;
        b=R5c13uA9yCy2PN47yASOWr4F6OmuZXHmbtZAYwv8vE60+c92SwfDX2Ii+kTFm04eYK
         uyh/QybGeu8PaTaeGvVseVCqU7qyQyWLvaudAFqyCqTNF+eiLz51T83QSgE+bFEkSBhI
         7Ko/OT93E/wnQHTBeFEBqCee5ZWA3DkHiGhUCmZiprDFtqHYerQtTPNR+3fAp8nzBoYm
         shLJPDEH6lIkT7B8aLCOQQeBBFGq7wTecZ+7ScNFPsfSK+nAaXraLFGtkLQagnR1nZNj
         dWuUfnvZKT2SuhiJ4EXBl51rW1sYTYes4c7ot/iCcM4lN0p7twH14EYfiFrGfMGtsxBD
         X6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=mY9FjEmlbnvKmC87ia/+uHD2ZXJYbHenf3f/5/6LVJo=;
        b=CKQXUABCTQAIzBCiLLQwkBFGwWalG8RTTGeYGleNN8xeHftbaTqKKTery1ScZbtXFl
         bxrlIrl3BdnziEpUy2F76vCsb0nlEAynBceL58WINxHv1Wt9IkWBicU8p1U3vuVWZrPk
         uR89tc68tr/QPySezbCAAFXLEiAiIg2y8//Ym7IUlGCFkkxQb8j9pAeyRvS7SHhasz4L
         neU6zf1rDzYDHHarZdZhhi3N3DbGRYKgrxbe7aQ3qFX9RTKL/NmA2RxjgDobDWMXHf8Q
         20AgsN5j7fuarFmijRVpHAQ3QsNfC5T+SKtsOaH9dwu8IJSWrSuqIJiCtr8CiL4AIB6A
         J4aA==
X-Gm-Message-State: AOAM531Wsmjl3+wlJdRGPWgdHn2nVDgUD0x2I5+2JsOZI3oFcPH3lf39
        mp+Gst3srKSNtuA9gGpllAYdj4GPbL9HEA==
X-Google-Smtp-Source: ABdhPJz/jk1Ah5PMDRlRVB4Q6ykyUr6C4Py9wkvCqufH7UR8bkN8yfBVqFjGMtK7R40Wk8qry5p9gA==
X-Received: by 2002:a17:902:b601:b029:d3:e6c5:5112 with SMTP id b1-20020a170902b601b02900d3e6c55112mr10253281pls.65.1602205587492;
        Thu, 08 Oct 2020 18:06:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 124sm8399644pfd.132.2020.10.08.18.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 18:06:26 -0700 (PDT)
Message-ID: <5f7fb792.1c69fb81.eb6f5.fd16@mx.google.com>
Date:   Thu, 08 Oct 2020 18:06:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-rc1-76-gfc709df553a3
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
Subject: linusw/devel baseline: 83 runs,
 7 regressions (v5.9-rc1-76-gfc709df553a3)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 83 runs, 7 regressions (v5.9-rc1-76-gfc709df553a3)

Regressions Summary
-------------------

platform                 | arch  | lab           | compiler | defconfig    =
      | results
-------------------------+-------+---------------+----------+--------------=
------+--------
imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig | 2/4    =

mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig    =
      | 0/1    =

panda                    | arm   | lab-collabora | gcc-8    | multi_v7_defc=
onfig | 4/5    =

rk3399-gru-kevin         | arm64 | lab-collabora | gcc-8    | defconfig    =
      | 89/90  =

sun50i-a64-pine64-plus   | arm64 | lab-baylibre  | gcc-8    | defconfig    =
      | 0/1    =

sun7i-a20-cubieboard2    | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig | 0/1    =


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/v5.9-r=
c1-76-gfc709df553a3/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: v5.9-rc1-76-gfc709df553a3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      fc709df553a34fd18010f52e6b47652268d83e7d =



Test Regressions
---------------- =



platform                 | arch  | lab           | compiler | defconfig    =
      | results
-------------------------+-------+---------------+----------+--------------=
------+--------
imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig | 2/4    =


  Details:     https://kernelci.org/test/plan/id/5f7fad9983d8e848d44ff3ea

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-76-gfc70=
9df553a3/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6cu=
stomboard.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-76-gfc70=
9df553a3/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6cu=
stomboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f7fad9983d8e84=
8d44ff3ef
      new failure (last pass: v5.9-rc1-76-g2edd92f8b6a3)
      4 lines

    2020-10-09 00:23:45.761000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000020
    2020-10-09 00:23:45.761000  kern  :alert : pgd =3D (ptrval)
    2020-10-09 00:23:45.761000  kern  :alert : [00000020] *pgd=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f7fad9983d8=
e848d44ff3f0
      new failure (last pass: v5.9-rc1-76-g2edd92f8b6a3)
      20 lines

    2020-10-09 00:23:45.804000  kern  :emerg : Process kworker/1:2 (pid: 64=
, stack limit =3D 0x(ptrval))
    2020-10-09 00:23:45.804000  kern  :emerg : Stack: (0xeda2ff10 to 0xeda3=
0000)
    2020-10-09 00:23:45.804000  kern  :emerg : ff00:                       =
              eddda5a0 eee5bb80 ef7aa200 c0361600
    2020-10-09 00:23:45.805000  kern  :emerg : ff20: ee92ec00 ef7aa200 0000=
0008 eee5bb80 eee5bb94 ef7aa200 00000008 c1803d00
    2020-10-09 00:23:45.805000  kern  :emerg : ff40: ef7aa218 ef7aa200 ffff=
e000 c0361be4 ee92ec00 c19b5682 c1372458 c036193c
    2020-10-09 00:23:45.846000  kern  :emerg : ff60: eee5bb80 eea2a2c0 eed5=
8e40 00000000 eda2e000 c036193c eee5bb80 ee91dea4
    2020-10-09 00:23:45.847000  kern  :emerg : ff80: eea2a2e4 c0367fdc 0000=
0001 eed58e40 c0367e8c 00000000 00000000 00000000
    2020-10-09 00:23:45.847000  kern  :emerg : ffa0: 00000000 00000000 0000=
0000 c03001a8 00000000 00000000 00000000 00000000
    2020-10-09 00:23:45.847000  kern  :emerg : ffc0: 00000000 00000000 0000=
0000 00000000 00000000 00000000 00000000 00000000
    2020-10-09 00:23:45.848000  kern  :emerg : ffe0: 00000000 00000000 0000=
0000 00000000 00000013 00000000 00000000 00000000
    ... (9 line(s) more)
      =



platform                 | arch  | lab           | compiler | defconfig    =
      | results
-------------------------+-------+---------------+----------+--------------=
------+--------
mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig    =
      | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f7facd40ba00f8ea94ff3e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-76-gfc70=
9df553a3/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-76-gfc70=
9df553a3/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f7facd40ba00f8ea94ff=
3e4
      failing since 41 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.9-rc1-10-gfeeaefd378ca)  =



platform                 | arch  | lab           | compiler | defconfig    =
      | results
-------------------------+-------+---------------+----------+--------------=
------+--------
panda                    | arm   | lab-collabora | gcc-8    | multi_v7_defc=
onfig | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f7fad9483d8e848d44ff3e1

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-76-gfc70=
9df553a3/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-76-gfc70=
9df553a3/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f7fad9483d8e84=
8d44ff3e7
      failing since 41 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.9-rc1-10-gfeeaefd378ca)
      60 lines

    2020-10-09 00:23:40.205000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-10-09 00:23:40.211000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-10-09 00:23:40.217000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-10-09 00:23:40.223000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-10-09 00:23:40.229000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-10-09 00:23:40.235000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-10-09 00:23:40.242000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-10-09 00:23:40.247000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-10-09 00:23:40.253000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    2020-10-09 00:23:40.259000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80b
    ... (49 line(s) more)
      =



platform                 | arch  | lab           | compiler | defconfig    =
      | results
-------------------------+-------+---------------+----------+--------------=
------+--------
rk3399-gru-kevin         | arm64 | lab-collabora | gcc-8    | defconfig    =
      | 89/90  =


  Details:     https://kernelci.org/test/plan/id/5f7fac0497feab6d264ff3e1

  Results:     89 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-76-gfc70=
9df553a3/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-76-gfc70=
9df553a3/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f7fac0597feab6d264ff41f
      failing since 41 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.9-rc1-10-gfeeaefd378ca)

    2020-10-09 00:17:04.719000  <8>[   50.592577] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-pcie-probed RESULT=3Dfail>
      =



platform                 | arch  | lab           | compiler | defconfig    =
      | results
-------------------------+-------+---------------+----------+--------------=
------+--------
sun50i-a64-pine64-plus   | arm64 | lab-baylibre  | gcc-8    | defconfig    =
      | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f7fad362dea8b90384ff3e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-76-gfc70=
9df553a3/arm64/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus=
.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-76-gfc70=
9df553a3/arm64/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f7fad362dea8b90384ff=
3e1
      failing since 38 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.9-rc1-10-gfeeaefd378ca)  =



platform                 | arch  | lab           | compiler | defconfig    =
      | results
-------------------------+-------+---------------+----------+--------------=
------+--------
sun7i-a20-cubieboard2    | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f7fae43d8e535c2364ff3e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-76-gfc70=
9df553a3/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubie=
board2.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-76-gfc70=
9df553a3/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubie=
board2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f7fae43d8e535c2364ff=
3ea
      failing since 26 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.9-rc1-15-g0a2d411b56b7)  =20
