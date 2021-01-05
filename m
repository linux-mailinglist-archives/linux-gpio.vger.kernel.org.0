Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA492EA851
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jan 2021 11:14:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728074AbhAEKMw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jan 2021 05:12:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727243AbhAEKMw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2021 05:12:52 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13689C061794
        for <linux-gpio@vger.kernel.org>; Tue,  5 Jan 2021 02:12:12 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id h186so18115593pfe.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jan 2021 02:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9T5heFasP6GdSI0JOfW3kJxvkt3tkvCQFRqpJPskOtQ=;
        b=Ug6vVDudVEYM+uuH9qoSoR6ej4vEYJqgwjZZrESqgtT49pwLBKPGJuvX0JdveGRwd6
         ko0LvxJ5l1IOw/EZuhUstp3jSBKqxR/jJuVU8NlvXe7/AvitCOzMnKOb5MDug9J9uliQ
         IIGwwLkuMl1cFtARCvVIghHsbFtBYyGSQdKht9g8LOQV1XaMaazoEbdkq8zY5EUIH3FP
         jIYfOvKJGf+ocxxdHBgnWMh5sJgQ2eMUshefUo1r8e/SK7upFKWBUTzorjuLftbcFVN+
         /hctAW506/671NLVEfEeTNxyPZJTUVgsz4Yk3L8qx4pvoke2qNBRgc0HZ1siQ0Rf7ep8
         gd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9T5heFasP6GdSI0JOfW3kJxvkt3tkvCQFRqpJPskOtQ=;
        b=La6zaMcilel+7Rh1HddpOa9FRPiY39yPmqhU4DS8nAsfUbVGLv1ctpmjWfX/m4q2Y9
         1a2sYLodFWWDJnZMlz4365eLUqAV6Ml2DB+IWvA57PfGbUfR754+5A9s5Mcd8/JZjLQ2
         dUkjMNxuR7GajGaP9kiolsTJoMm9kwa2OCFWpAGkzuj6J0KWPRJ4h1l7U11hrz0PrwCw
         DqIsWhAuyQwhWZGVmjiueQSk1K35mfLXz0LbLzN7CqqQ1o4u0hQW80M9euMdwO8gYM95
         dbvUxGatmYUaHpHVEb0BX8bfC2vgGssiMqjscBPsQXGh5rKK2Jr9D7xUiozsHcSJpWGG
         9VZA==
X-Gm-Message-State: AOAM531q2dheVQXR/5jm5mWhx5BqKxj9Be6X16J4S5c1+u0mPDd61dhO
        zX6GoOUMWeTQgcsc2LkNAgeYsDDCTfYitw==
X-Google-Smtp-Source: ABdhPJw1ba621KJTWA18glkDSOUZQ4FHXfpINGbaxp+3EbjdBWh6Y0QTO5gDzTvawO6Fv8S7t1Y8KQ==
X-Received: by 2002:aa7:8159:0:b029:1a5:929b:16b6 with SMTP id d25-20020aa781590000b02901a5929b16b6mr68210026pfn.12.1609841531318;
        Tue, 05 Jan 2021 02:12:11 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u68sm20897983pfb.70.2021.01.05.02.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 02:12:10 -0800 (PST)
Message-ID: <5ff43b7a.1c69fb81.443ac.e62a@mx.google.com>
Date:   Tue, 05 Jan 2021 02:12:10 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.11-rc1
X-Kernelci-Report-Type: test
Subject: linusw/devel baseline: 112 runs, 3 regressions (v5.11-rc1)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 112 runs, 3 regressions (v5.11-rc1)

Regressions Summary
-------------------

platform                   | arch  | lab          | compiler | defconfig   =
       | regressions
---------------------------+-------+--------------+----------+-------------=
-------+------------
imx6sx-sdb                 | arm   | lab-nxp      | gcc-8    | multi_v7_def=
config | 1          =

imx8mp-evk                 | arm64 | lab-nxp      | gcc-8    | defconfig   =
       | 1          =

meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre | gcc-8    | defconfig   =
       | 1          =


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/v5.11-=
rc1/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: v5.11-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      5c8fe583cce542aa0b84adc939ce85293de36e5e =



Test Regressions
---------------- =



platform                   | arch  | lab          | compiler | defconfig   =
       | regressions
---------------------------+-------+--------------+----------+-------------=
-------+------------
imx6sx-sdb                 | arm   | lab-nxp      | gcc-8    | multi_v7_def=
config | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff43207b85a29b3b6c94cce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.11-rc1/arm/mul=
ti_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.11-rc1/arm/mul=
ti_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff43207b85a29b3b6c94=
ccf
        new failure (last pass: v5.10-rc4-92-g7ac554888233) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
       | regressions
---------------------------+-------+--------------+----------+-------------=
-------+------------
imx8mp-evk                 | arm64 | lab-nxp      | gcc-8    | defconfig   =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff432f8a9b9126583c94cc1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.11-rc1/arm64/d=
efconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.11-rc1/arm64/d=
efconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff432f8a9b9126583c94=
cc2
        failing since 19 days (last pass: v5.10-rc4-94-g3048c5493cd20, firs=
t fail: v5.10-rc4-92-g7ac554888233) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
       | regressions
---------------------------+-------+--------------+----------+-------------=
-------+------------
meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre | gcc-8    | defconfig   =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff43190dfd4ee57b9c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.11-rc1/arm64/d=
efconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.11-rc1/arm64/d=
efconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff43190dfd4ee57b9c94=
cba
        new failure (last pass: v5.10-rc4-92-g7ac554888233) =

 =20
