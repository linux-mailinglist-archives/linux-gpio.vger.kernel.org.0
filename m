Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEFD52C1B4E
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 03:11:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbgKXCJM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Nov 2020 21:09:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgKXCJL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Nov 2020 21:09:11 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DD5CC0613CF
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2020 18:09:11 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id t21so16059708pgl.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2020 18:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=W/t66gqhx1wDirZTA1MHAOPcz/lIepafC3j9a8e6aJQ=;
        b=1JsvW+9liLZkzbhbxI4OB0N5YyZXlCjpHjKrWvkROm/uF4h5ZSK7wrAxRCI4i0kq9I
         taCS/GZ/fSs5Jq2BFwnbrdWCf5zDcBTnCsBeeK+PEBYbY8ywTmh4ghjpbyMmWPJXOHOW
         hh0Ps/Pc3PI7Z3LiJcgoJKdsi9IhwPlbC7rdBh9esqyLK1VwYJyPfrLPB0OKXBs+YiCI
         6cNbp0L46qtB9vT0URcMfNGVNJLUKlDK6po4q3bLzl7WGUeIcBt4s3SGy/anihRgdUw0
         rxV6X4uPp9LOsjP+XFIg7zh+yyiCj4oV9Fy+kcRgg0pC1IlM2udeo76Tgy3rBEgWx3rW
         nO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=W/t66gqhx1wDirZTA1MHAOPcz/lIepafC3j9a8e6aJQ=;
        b=XkN9756PECwO9P+08YKAeuqbytCIZGXoa3DGf7Rdn6/vOs0FLHuGw7gRBVDSs8beBC
         B/EdVF4ezezOI2/HXDi5sp+VHItGuI0f5oyHPCvVGl+MXULvgswtWF+OEP6fxvVT1Cws
         f8lCETEaOqr8Eng1HJHNqISlyjrqIxqOGndm/803aCaKp8TbeJyomqkeAuGQUdt2S388
         /cUtAls/84n4vrF1gNei6ukLNnQQ8ba5hgSE7XLGwslzWbvDZIWdgNv9T4iK6xD9Yti6
         QJllXgXX6Tl/YpOAu3nk57pc+lm5QfwYFzFfDJsBfldi/2UGl5D3+2BN70KkDCpJbwoE
         Otkg==
X-Gm-Message-State: AOAM530mNw2m0bn+pfNiPUeyRIEjTnRbIrxOFavv/rLQL5WUgrBt5+EZ
        w5YXSsoWTkAozJbX8F7aagJplDWTLFewGA==
X-Google-Smtp-Source: ABdhPJxqbkQNzVRiS/Xkx66GlyHZkVzeuc+8LHiZsB78RnAP1HX95noLx8zB3t4RrL8k8c9XFFnH0Q==
X-Received: by 2002:a65:4346:: with SMTP id k6mr1814215pgq.83.1606183750379;
        Mon, 23 Nov 2020 18:09:10 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 194sm12281951pgf.72.2020.11.23.18.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 18:09:09 -0800 (PST)
Message-ID: <5fbc6b45.1c69fb81.d351a.be37@mx.google.com>
Date:   Mon, 23 Nov 2020 18:09:09 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.10-rc4-36-g6c33287665e0
X-Kernelci-Report-Type: test
Subject: linusw/for-next baseline: 119 runs,
 2 regressions (v5.10-rc4-36-g6c33287665e0)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 119 runs, 2 regressions (v5.10-rc4-36-g6c33287665=
e0)

Regressions Summary
-------------------

platform                 | arch | lab          | compiler | defconfig      =
    | regressions
-------------------------+------+--------------+----------+----------------=
----+------------
imx6q-var-dt6customboard | arm  | lab-baylibre | gcc-8    | multi_v7_defcon=
fig | 2          =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/v5.=
10-rc4-36-g6c33287665e0/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: v5.10-rc4-36-g6c33287665e0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      6c33287665e093cdf885e700487380b65e402d33 =



Test Regressions
---------------- =



platform                 | arch | lab          | compiler | defconfig      =
    | regressions
-------------------------+------+--------------+----------+----------------=
----+------------
imx6q-var-dt6customboard | arm  | lab-baylibre | gcc-8    | multi_v7_defcon=
fig | 2          =


  Details:     https://kernelci.org/test/plan/id/5fbc61bc1ba878cfc0c94cc0

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.10-rc4-36-g=
6c33287665e0/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-d=
t6customboard.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.10-rc4-36-g=
6c33287665e0/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-d=
t6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fbc61bc1ba878c=
fc0c94cc4
        new failure (last pass: v5.10-rc4-34-g0f2c7af45d7e)
        4 lines

    2020-11-24 01:28:14.304000+00:00  kern  :alert : Unable to handle kerne=
l NULL pointer dereference at virtual address 00000313
    2020-11-24 01:28:14.305000+00:00  kern  :alert : pgd =3D 4f4ead58
    2020-11-24 01:28:14.305000+00:00  kern  :alert : [00000313] *pgd=3D0000=
0000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fbc61bc1ba878c=
fc0c94cc5
        new failure (last pass: v5.10-rc4-34-g0f2c7af45d7e)
        47 lines

    2020-11-24 01:28:14.348000+00:00  kern  :emerg : Process kworker/0:2 (p=
id: 80, stack limit =3D 0x44ea85c2)
    2020-11-24 01:28:14.348000+00:00  kern  :emerg : Stack: (0xc36a9d58 to =
0xc36aa000)
    2020-11-24 01:28:14.348000+00:00  kern  :emerg : 9d40:                 =
                                      c3ace5b0 c3ace5b4
    2020-11-24 01:28:14.348000+00:00  kern  :emerg : 9d60: c3ace400 c3ace41=
4 c1448be0 c09bac3c c36a8000 ef871580 c2001e40 c3ace400
    2020-11-24 01:28:14.349000+00:00  kern  :emerg : 9d80: 000002f3 c09bbff=
c c1448be0 c2001d80 c39a9980 ef86b520 c09c838c c1448be0
    2020-11-24 01:28:14.390000+00:00  kern  :emerg : 9da0: c19c7640 3d2649d=
a c19c765c c3cacfc0 c3ab5980 c3ace400 c3ace414 c1448be0
    2020-11-24 01:28:14.391000+00:00  kern  :emerg : 9dc0: c19c7640 0000000=
c c19c765c c09c835c c1446908 00000000 c3ace40c c3ace400
    2020-11-24 01:28:14.391000+00:00  kern  :emerg : 9de0: fffffdfb c22e0c1=
0 c3a5f140 c099e29c c3ace400 bf026000 fffffdfb bf022138
    2020-11-24 01:28:14.391000+00:00  kern  :emerg : 9e00: c3cac5c0 c358310=
8 00000120 c22568c0 c3a5f140 c09f7bf8 c3cac5c0 c3cac5c0
    2020-11-24 01:28:14.391000+00:00  kern  :emerg : 9e20: 00000040 c3cac5c=
0 c3a5f140 00000000 c19c7654 bf0a8084 bf0a9014 0000001d =

    ... (36 line(s) more)  =

 =20
