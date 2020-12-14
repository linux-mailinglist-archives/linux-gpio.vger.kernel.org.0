Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 507CD2D9867
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 13:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407501AbgLNM4B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 07:56:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439357AbgLNMzu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2020 07:55:50 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB66FC0613CF
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 04:55:09 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id g20so7732840plo.2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 04:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=EWRXbZH3dM0IdM/2eDYXDAoWiBlrbOWKXB2umLBjYi0=;
        b=Jd3GiGNSEa0WEEedgzFhU00kqCGv4BsQ7+ZqgJPlQ1w1jaq+ouJWBJ4B8RLK+Tuvek
         gX7i92ZQhO05l1bmajCLBT51xcQXdC2fnHHJtEFhhHgf8KfCSxtXc664YRCBZauNvUXJ
         /VQQ6uSE1YhNws8tkJnpKLjFmUURBD9RPnKxdzH4zxFp0FB4GJs+AUVhdZgXHlgrV7x+
         7l75LdA3WpqD3vPIt/t5fNjFjK0OA6aAjqRUcmWkOsR6kv29pfQGYhrlQ/yfZwj4NxLp
         Sr0EV9QpXriSN4CaWSmq41dWm+YwSYtC6S3ZxeLGp+CwL8shhBJKNY1HCmYbr5wKc2k/
         nuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=EWRXbZH3dM0IdM/2eDYXDAoWiBlrbOWKXB2umLBjYi0=;
        b=KuCz4hT+csmn9m4tlSgv3mEL57JquSTp9LHeOQb+1/TZSPmApw5wXkdJRTLRtxXYAk
         NpQ7FXAHHF7km2t0tErEzzVOaOKjfoczE3CXUAgY/MYObZ47KkSy+JgEzudyOqU2iq6o
         RCQ7KP507XqzTNB+6LIqgLV/qbfd4f5e/uxHV2beh3s/bgmesdpX4SY/ULNBFP/iGxkB
         rWSWuapcamhFF+cd9Gn7dzd5RYJt2Uwt2DFXSk+dZ0VbP9ioBvq2T4kLCltLu0vWdIPd
         xLfj50a0zDL+WC+M12Suh+rQJHQGfwUSQdgFyhAJt1POXLLjISpEUC/U1Ombfq/cg9AF
         IinQ==
X-Gm-Message-State: AOAM532wbE//M2ejYO2iKAjgFI9vdj/WSl2XLfyfm+Q8HDUlD7o4E3Ex
        Z1DfuTh+EeTU/sw+VKIA9AYTXVIO1UFdvA==
X-Google-Smtp-Source: ABdhPJwyvXaRdYbGrrj9EPY7HYCCQY8DwE8YroxMEfNTE6T27gaRC12ihs9Zjybcj4c3y1i/iqS68Q==
X-Received: by 2002:a17:902:7207:b029:da:fd0c:521a with SMTP id ba7-20020a1709027207b02900dafd0c521amr22568294plb.45.1607950508817;
        Mon, 14 Dec 2020 04:55:08 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y189sm19974549pfb.155.2020.12.14.04.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 04:55:08 -0800 (PST)
Message-ID: <5fd760ac.1c69fb81.3a590.8581@mx.google.com>
Date:   Mon, 14 Dec 2020 04:55:08 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.10-rc4-91-g65efb43ac94b
X-Kernelci-Report-Type: test
Subject: linusw/devel baseline: 104 runs,
 3 regressions (v5.10-rc4-91-g65efb43ac94b)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 104 runs, 3 regressions (v5.10-rc4-91-g65efb43ac94b)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig |=
 regressions
---------------------------+-------+---------------+----------+-----------+=
------------
imx8mp-evk                 | arm64 | lab-nxp       | gcc-8    | defconfig |=
 1          =

meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre  | gcc-8    | defconfig |=
 1          =

mt8173-elm-hana            | arm64 | lab-collabora | gcc-8    | defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/v5.10-=
rc4-91-g65efb43ac94b/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: v5.10-rc4-91-g65efb43ac94b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      65efb43ac94bffeb652cddba4106817bb38c5e71 =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig |=
 regressions
---------------------------+-------+---------------+----------+-----------+=
------------
imx8mp-evk                 | arm64 | lab-nxp       | gcc-8    | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/5fd75aa2669cae3aa5c94cbe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.10-rc4-91-g65e=
fb43ac94b/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.10-rc4-91-g65e=
fb43ac94b/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd75aa2669cae3aa5c94=
cbf
        failing since 8 days (last pass: v5.10-rc4-34-g0f2c7af45d7ee, first=
 fail: v5.10-rc4-47-gc47d9e1b7343) =

 =



platform                   | arch  | lab           | compiler | defconfig |=
 regressions
---------------------------+-------+---------------+----------+-----------+=
------------
meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre  | gcc-8    | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/5fd756ad0dc2ed18d1c94cf1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.10-rc4-91-g65e=
fb43ac94b/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s905x-khada=
s-vim.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.10-rc4-91-g65e=
fb43ac94b/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s905x-khada=
s-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd756ad0dc2ed18d1c94=
cf2
        new failure (last pass: v5.10-rc4-88-g9777d0bfdae79) =

 =



platform                   | arch  | lab           | compiler | defconfig |=
 regressions
---------------------------+-------+---------------+----------+-----------+=
------------
mt8173-elm-hana            | arm64 | lab-collabora | gcc-8    | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/5fd756ba35dcd20ba0c94cc8

  Results:     19 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.10-rc4-91-g65e=
fb43ac94b/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.10-rc4-91-g65e=
fb43ac94b/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.mediatek-mt8173-pinctrl-probed: https://kernelci.org/te=
st/case/id/5fd756ba35dcd20ba0c94ce2
        new failure (last pass: v5.10-rc4-88-g9777d0bfdae79)

    2020-12-14 12:12:39.946000+00:00  /lava-2949520/1/../bin/lava-test-case
    2020-12-14 12:12:39.955000+00:00  <8>[   26.305286] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmediatek-mt8173-pinctrl-probed RESULT=3Dfail>   =

 =20
