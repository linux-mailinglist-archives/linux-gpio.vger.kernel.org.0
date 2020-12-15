Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 509A32DAF3A
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Dec 2020 15:45:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729590AbgLOOpA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Dec 2020 09:45:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729576AbgLOOo4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Dec 2020 09:44:56 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5C10C06179C
        for <linux-gpio@vger.kernel.org>; Tue, 15 Dec 2020 06:44:15 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id h186so4154510pfe.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Dec 2020 06:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=1+sGJxXn0FY+vwoFE7LCBmoZpVRsPLk2EgV8Fyi9o50=;
        b=XozFHkEPFGnfPrNrFUzDND15cGIV8QqmWEEpkqcVgyAy5K8oeT5CqHKzD6QLPjTiBv
         5Yvx1AnT6+DWzLBeQ513wD3EvdGHFQr6Ahxd4Ulj+o4IHPIEbsyRzGQ+sB6vC6ukj5Lg
         1AFQ/Q5TSREDjmQ067Aj+9vq32GJy9WeHciduYInqDF23Pn1GosFQUDJjuJqTUXxAV9E
         fj6qNtP5L6GEn+FwcByCAbdauwsZefWYRlg7JRD1ZM94Td1x1S/UgxYHo0+gln24RvUt
         dVpQ69dwvaRINV3i9nDSdT0WfGuUdpVp1zkOb/s/XLtjXLlEivQqRQRF73Jk4xvA31/s
         bC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=1+sGJxXn0FY+vwoFE7LCBmoZpVRsPLk2EgV8Fyi9o50=;
        b=LDLC1ZxiYbk10eNXRMdz14/I06eWxnjR78rVVyTvDiMJomrQvZyEB/Bfo/OdXnH/Rj
         0paS1bq6T0AuHtAu3ck95DIUJmAABhLksDP+nB50RqjPlMuVhNv7aSlGfSORXZ3K7g9p
         axgl1ULcc+60JwcduEwZNuPLi4gKshQslyJAAI3yQvKuce786nMRTt17gtaho5Y3IjEG
         XgXinKsT4xnK265D7trPvt7p/eyUfF4qN037Gf+qZud93taaB+Tcm82+DtIR/UkGay3A
         DgLA2pH8JwFIwVyJhYqM9FcNQRhqYV/ybEUQyDUbJ3HmvLBU4rzf/9bXTa7RuN167WMM
         LTcQ==
X-Gm-Message-State: AOAM5319yl7A4ltMFvp6IHLhkkmm0eqiSdxdpz1iElyaaCBpTciFCdNc
        cyT27fk69clDvRvCujycMETCvie2iE+7HA==
X-Google-Smtp-Source: ABdhPJyCgsbCNUjB9N5rVOJaDD8gLzxEzmfe4Sas9bBg2hw0SCnzCqhWFEdKQ1I2baZguMNdgcET2g==
X-Received: by 2002:a63:5754:: with SMTP id h20mr28584478pgm.378.1608043454955;
        Tue, 15 Dec 2020 06:44:14 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v6sm22530126pfi.31.2020.12.15.06.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 06:44:14 -0800 (PST)
Message-ID: <5fd8cbbe.1c69fb81.3f5c2.ec98@mx.google.com>
Date:   Tue, 15 Dec 2020 06:44:14 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.10-rc4-94-g3048c5493cd20
X-Kernelci-Report-Type: test
Subject: linusw/devel baseline: 84 runs,
 2 regressions (v5.10-rc4-94-g3048c5493cd20)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 84 runs, 2 regressions (v5.10-rc4-94-g3048c5493cd20)

Regressions Summary
-------------------

platform                 | arch | lab          | compiler | defconfig      =
    | regressions
-------------------------+------+--------------+----------+----------------=
----+------------
imx6q-var-dt6customboard | arm  | lab-baylibre | gcc-8    | multi_v7_defcon=
fig | 2          =


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/v5.10-=
rc4-94-g3048c5493cd20/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: v5.10-rc4-94-g3048c5493cd20
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      3048c5493cd208540252e6c78b2252fedf6f0ede =



Test Regressions
---------------- =



platform                 | arch | lab          | compiler | defconfig      =
    | regressions
-------------------------+------+--------------+----------+----------------=
----+------------
imx6q-var-dt6customboard | arm  | lab-baylibre | gcc-8    | multi_v7_defcon=
fig | 2          =


  Details:     https://kernelci.org/test/plan/id/5fd8c25bfb71c39a27c94ce0

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.10-rc4-94-g304=
8c5493cd20/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.10-rc4-94-g304=
8c5493cd20/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fd8c25bfb71c39=
a27c94ce4
        new failure (last pass: v5.10-rc4-93-ga2e5f9277f66)
        4 lines

    2020-12-15 14:03:28.426000+00:00  kern  :alert : Unhandled fault: align=
ment exception (0x001) at 0xcec60217
    2020-12-15 14:03:28.426000+00:00  kern  :alert : pgd =3D (ptrval)
    2020-12-15 14:03:28.427000+00:00  kern  :alert : [cec60217] *pgd=3D1ec1=
141e(bad)   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fd8c25bfb71c39=
a27c94ce5
        new failure (last pass: v5.10-rc4-93-ga2e5f9277f66)
        26 lines

    2020-12-15 14:03:28.469000+00:00  kern  :emerg : Process kworker/3:2 (p=
id: 80, stack limit =3D 0x(ptrval))
    2020-12-15 14:03:28.469000+00:00  kern  :emerg : Stack: (0xc3583eb0 to =
0xc3584000)
    2020-12-15 14:03:28.470000+00:00  kern  :emerg : 3ea0:                 =
                    1e9b10fe e2e57e58 c2440080 cec60217
    2020-12-15 14:03:28.470000+00:00  kern  :emerg : 3ec0: 00000000 0000000=
0 00000003 00000000 00000000 e2e57e58 c38f9840 cec6008f
    2020-12-15 14:03:28.470000+00:00  kern  :emerg : 3ee0: cec6020f ef7d540=
0 00000000 c09b3b88 fffffc84 fffffc84 c3592400 ef7d5400
    2020-12-15 14:03:28.511000+00:00  kern  :emerg : 3f00: 00000000 c1a1ec6=
0 00000000 c09b4070 c35925a0 c3299880 ef7d21c0 c036077c
    2020-12-15 14:03:28.512000+00:00  kern  :emerg : 3f20: c3281200 ef7d21c=
0 00000008 c3299880 c3299894 ef7d21c0 00000008 c1803d00
    2020-12-15 14:03:28.512000+00:00  kern  :emerg : 3f40: ef7d21d8 ef7d21c=
0 ffffe000 c0360d68 c3281200 c1a1e357 c137fa34 c0360ac0
    2020-12-15 14:03:28.513000+00:00  kern  :emerg : 3f60: c3299880 c2254e0=
0 c3293680 00000000 c3582000 c0360ac0 c3299880 c215fea4
    2020-12-15 14:03:28.513000+00:00  kern  :emerg : 3f80: c2254e24 c0366ee=
c 00000001 c3293680 c0366d9c 00000000 00000000 00000000 =

    ... (15 line(s) more)  =

 =20
