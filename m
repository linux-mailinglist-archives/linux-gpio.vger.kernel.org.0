Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D139A2DC94B
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Dec 2020 23:56:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbgLPW4Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Dec 2020 17:56:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbgLPW4Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Dec 2020 17:56:24 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1982DC06179C
        for <linux-gpio@vger.kernel.org>; Wed, 16 Dec 2020 14:55:44 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id t22so8198238pfl.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Dec 2020 14:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=BhoEhdmmYKwmzOKxxISr9qEA2gaa/cBaXmFi0RbnCY8=;
        b=ZRTh/6dDCl6PCtyUHfwprmXIThbGb6q8cFzcuoW6yoNAr4gC/aZIuwax0PbXL1gIul
         6wCqXj0rqivGeIUIEvCuw4qd9hnn0JoTgBG3pAXiSS69pFREHqaURaLnlDDh4G44e+uq
         YgWt/OgMhaNxFhhFRVOExtIa9+mpFKHOxGdmL4bExB+xDEopMT/ADRth5cX7FjKtmR6T
         f43SMSoSu4cvvKu9h0FdcsQnCgGaeBzDda07FGuzCiyM9ZL1juxeXVWiTsJtaZ6Bv3Lp
         7w9mJPE2Gip0uwb1/l1uJvOVQZyJiqfmwQtx2NP45Dv3A81H9Rml9PJ+faXNfmIngoDk
         PfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=BhoEhdmmYKwmzOKxxISr9qEA2gaa/cBaXmFi0RbnCY8=;
        b=lh3Sgc4lM1pLBnF+MPMt182R/NQA9ZXoflACbcuFtEx6hl4AZDzw+G0HcIFW2V0fgQ
         EAs57VgJfP6rpnCre4FbDl90HYHirB+CidBfXEA6FYzxYbteEnTdwh7KmgSC+qM9Xq5f
         ZDDjzN9lGjmPJbZlH48UV/r/lsPjlEaHolIU8aoJw3l3DnXnzQijAW0vQvWvOrBeNw5O
         5ZdhhieIyyaw2wLR73WokMKRYkhuwl83qRFzVOEt9tL2jzD6hs37i9WFqrob/t5+EWHU
         drsGrNZGbC2QSNGsnHI3n379cpJ0VFe42DGQSKNmUpAFhCjqQBc0n+1o3rfIFPwsS97h
         /gcw==
X-Gm-Message-State: AOAM53013BhEn9hTKqIXKMU0MhNglaz5YQZrhc2rnFCtdj6W2aZJ2FM8
        WyEEPbZ7qNJsS2pM/fj+FmAPHIqwaIpxcQ==
X-Google-Smtp-Source: ABdhPJxKhY8IhalySWvPLAOdvwEmNWAzovC6xT8QPuvYrIFG4pP5cToeQdPlSMhNXF0I+jY4hyNSpw==
X-Received: by 2002:a63:525c:: with SMTP id s28mr35649238pgl.134.1608159343407;
        Wed, 16 Dec 2020 14:55:43 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r67sm3463103pfc.82.2020.12.16.14.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 14:55:42 -0800 (PST)
Message-ID: <5fda906e.1c69fb81.e86e5.8b46@mx.google.com>
Date:   Wed, 16 Dec 2020 14:55:42 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.10-rc4-92-g7ac5548882334
X-Kernelci-Report-Type: test
Subject: linusw/for-next baseline: 104 runs,
 2 regressions (v5.10-rc4-92-g7ac5548882334)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 104 runs, 2 regressions (v5.10-rc4-92-g7ac5548882=
334)

Regressions Summary
-------------------

platform                   | arch  | lab          | compiler | defconfig | =
regressions
---------------------------+-------+--------------+----------+-----------+-=
-----------
imx8mp-evk                 | arm64 | lab-nxp      | gcc-8    | defconfig | =
1          =

meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre | gcc-8    | defconfig | =
1          =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/v5.=
10-rc4-92-g7ac5548882334/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: v5.10-rc4-92-g7ac5548882334
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      7ac554888233468a9fd7c4f28721396952dd9959 =



Test Regressions
---------------- =



platform                   | arch  | lab          | compiler | defconfig | =
regressions
---------------------------+-------+--------------+----------+-----------+-=
-----------
imx8mp-evk                 | arm64 | lab-nxp      | gcc-8    | defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/5fda87a0888d240967c94cc1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.10-rc4-92-g=
7ac5548882334/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.10-rc4-92-g=
7ac5548882334/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fda87a0888d240967c94=
cc2
        new failure (last pass: v5.10-rc4-94-g3048c5493cd2) =

 =



platform                   | arch  | lab          | compiler | defconfig | =
regressions
---------------------------+-------+--------------+----------+-----------+-=
-----------
meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre | gcc-8    | defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/5fda85e8b2605bea08c94cbf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.10-rc4-92-g=
7ac5548882334/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s905x-k=
hadas-vim.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.10-rc4-92-g=
7ac5548882334/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s905x-k=
hadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fda85e8b2605bea08c94=
cc0
        new failure (last pass: v5.10-rc4-94-g3048c5493cd2) =

 =20
