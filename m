Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6AD2D000F
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Dec 2020 02:20:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbgLFBUF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Dec 2020 20:20:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbgLFBUE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Dec 2020 20:20:04 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 986B9C0613CF
        for <linux-gpio@vger.kernel.org>; Sat,  5 Dec 2020 17:19:24 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id p4so648373pfg.0
        for <linux-gpio@vger.kernel.org>; Sat, 05 Dec 2020 17:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=sRoEGj5Hcpj463OKWsM+M0Awa+v1iD61In8OT2kZiDA=;
        b=hPcwkcTIC+O7dL9A+sT31DMUydFehFFHs2EZmbPtSttie/X2RDWWFQ0ec3B7lP6nhQ
         LczSciOAvls+kO/XHvcylotKzaxhqmgXuBhB/9FBQwYD+8BeI/p1O5hU+pAOh6T7F/9q
         jEuqI5A/A2oybmTgzsSsSnBgW7vonVkGazaCNxEFEXsuTdA1Y4BSu/UTGvCdx3wWkSZe
         X/7x81OGibMqvWGQ1+52+uaJLGRcgvPv8RZY6Qs6AYi9VcHyEHlQcXWG08/WjD6vUbKL
         eIeuFuFRQ+WBJQ5O6UNYZu4UB/H1ZXgvEJ0KVq/N+Fk9pxFs9fIGaq/d44NPFPcOhqOY
         oq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=sRoEGj5Hcpj463OKWsM+M0Awa+v1iD61In8OT2kZiDA=;
        b=DQsG5kPrDKCSFyJID3In379xEKs/Gady7yfu2fPGpbSEV37+skO4+osl9cZshkL870
         Szdz/fEpS5IpFuvG965g3lyZlLq3g4GxliOxbuDeSyVbRXue5LJJioAUDabmzPHxiKBD
         Axwh0CZsN1DHpjZ4yG0ITcZmeN/9p5L4Fn3wjGMxcjB36A4A0tFpWkif2k/dkrx5L1Fk
         a0kEV+hoRoteGebMVueOEd2l899EsoXt3k72dw3sFRpN+PDJSo47UM8u6YCtbrsMe1d0
         zu7MI7o6lfaJJLMWxAqKcPwDOzCdWay6s046KACLRjxYybGaGBe5Cy0l4VqWCH/DLRch
         74Fg==
X-Gm-Message-State: AOAM532fjTOX0lqKOgGrtGMlYTkAcscoSkrTec71FMhROLTFFz+PesQk
        iofH/cy0sueHtu9FyDDETrrAHpP3jSyPJg==
X-Google-Smtp-Source: ABdhPJwjn0gdFKAD7DYJUHOU3xi4958Wih4VhHnKvzqwp4Y/yQhemcenIP4HsAbBHWpiM6pLfF27Vw==
X-Received: by 2002:a05:6a00:80b:b029:198:124a:d58a with SMTP id m11-20020a056a00080bb0290198124ad58amr9953974pfk.56.1607217563308;
        Sat, 05 Dec 2020 17:19:23 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id bf3sm6423746pjb.45.2020.12.05.17.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Dec 2020 17:19:22 -0800 (PST)
Message-ID: <5fcc319a.1c69fb81.43d78.f75e@mx.google.com>
Date:   Sat, 05 Dec 2020 17:19:22 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.10-rc4-47-gc47d9e1b7343
X-Kernelci-Report-Type: test
Subject: linusw/devel baseline: 124 runs,
 3 regressions (v5.10-rc4-47-gc47d9e1b7343)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 124 runs, 3 regressions (v5.10-rc4-47-gc47d9e1b7343)

Regressions Summary
-------------------

platform       | arch  | lab          | compiler | defconfig | regressions
---------------+-------+--------------+----------+-----------+------------
imx8mp-evk     | arm64 | lab-nxp      | gcc-8    | defconfig | 1          =

meson-gxm-q200 | arm64 | lab-baylibre | gcc-8    | defconfig | 2          =


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/v5.10-=
rc4-47-gc47d9e1b7343/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: v5.10-rc4-47-gc47d9e1b7343
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      c47d9e1b734361a5d809fae02a268b85ab0f95ee =



Test Regressions
---------------- =



platform       | arch  | lab          | compiler | defconfig | regressions
---------------+-------+--------------+----------+-----------+------------
imx8mp-evk     | arm64 | lab-nxp      | gcc-8    | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/5fcc27283ef03e5895c94ccd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.10-rc4-47-gc47=
d9e1b7343/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.10-rc4-47-gc47=
d9e1b7343/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fcc27283ef03e5895c94=
cce
        new failure (last pass: v5.10-rc4-34-g0f2c7af45d7ee) =

 =



platform       | arch  | lab          | compiler | defconfig | regressions
---------------+-------+--------------+----------+-----------+------------
meson-gxm-q200 | arm64 | lab-baylibre | gcc-8    | defconfig | 2          =


  Details:     https://kernelci.org/test/plan/id/5fcc252cdcb62f9040c94cb9

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.10-rc4-47-gc47=
d9e1b7343/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.10-rc4-47-gc47=
d9e1b7343/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fcc252cdcb62f9=
040c94cbd
        new failure (last pass: v5.10-rc4-34-g0f2c7af45d7ee)
        11 lines

    2020-12-06 00:26:14.836000+00:00  kern  :alert : Mem abort info:
    2020-12-06 00:26:14.836000+00:00  kern  :alert :   ESR =3D 0x96000046
    2020-12-06 00:26:14.877000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-12-06 00:26:14.878000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-12-06 00:26:14.878000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-12-06 00:26:14.878000+00:00  kern  :alert : Data abort info:
    2020-12-06 00:26:14.878000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000046
    2020-12-06 00:26:14.878000+00:00  kern  :alert :   CM =3D 0, WnR =3D 1
    2020-12-06 00:26:14.878000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D0000000044e23000
    2020-12-06 00:26:14.878000+00:00  kern  :alert : [0000000000000010] pgd=
=3D0000000044e24003, p4d=3D0000000044e24003, pud=3D0000000044e20003, pmd=3D=
0000000000000000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fcc252cdcb62f9=
040c94cbe
        new failure (last pass: v5.10-rc4-34-g0f2c7af45d7ee)
        2 lines

    2020-12-06 00:26:14.915000+00:00  kern  :emerg : Code: b4000e60 d538410=
2 b9401040 11000400 (b9001040)    =

 =20
