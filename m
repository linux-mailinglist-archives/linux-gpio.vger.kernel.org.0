Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7F4B2DC920
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Dec 2020 23:44:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727164AbgLPWnl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Dec 2020 17:43:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730240AbgLPWnk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Dec 2020 17:43:40 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F59EC0611E4
        for <linux-gpio@vger.kernel.org>; Wed, 16 Dec 2020 14:42:47 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id s21so17543131pfu.13
        for <linux-gpio@vger.kernel.org>; Wed, 16 Dec 2020 14:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ODAVPfXBH+tgFdlpZRWx/mtAvlFwhFs+GxN2jTfCvEQ=;
        b=bTc/Ja7+je/PmLtU4Ca+H4ntRNbaZ+N2TLSBMhu8mcAlwUEtqZc/7iKkAXNvVu3zgq
         jFPBQYsFL35nQz6i1uauHu2Y9t1ESzMiB2Bj6FUP1wYG3cYUChnbWePectW/3U8ff02t
         9wv5OQimntSJTc660LTKoKh7HITJPJuMyf0w8h3oSl2ACVGr97K/Y1gLpeC4kyLKB/Op
         wYRSbVNZtd6xzkm0LBTwWqCSBN95lX9qqp5h6li1ZFqjGlr+oj6wkQAD0V9T1ABZVXm/
         PqunJH8MLhBLTyYeL7VcNgySfP2gk3fe16+aIr4i68IaSv+tmdoAkyBA7UtZWeRJXuY4
         LtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ODAVPfXBH+tgFdlpZRWx/mtAvlFwhFs+GxN2jTfCvEQ=;
        b=Gogs2iEz/g6s1VoOd+nKL7Hou3UEwLM0yZ6kirG5taLdLJgFPrnvFHHU38eTQ0eMp4
         ZJSo+3BZP+U8oQ+B84JXxA85Bij1BQdHLuTyR5tQ+me29mUURZ62z//d6qXW35OeGj5d
         wRFNlo7yUXMOubL53PRJZYa+WefzDNWWOhMVaUTke/T/MINU93BX8lHY8wn005AlTR8J
         PaRdEGO6R4S6THA44nQqxZ3Hd00YL/ERJn9/V611CQohDJSsr119YeKnHPKwp36E6Wab
         rs6zNeZr3kyZqBukc1VQnzFI9VFRgxTuGAi+jNNaXMDg3mpTxrXN+qgkh3g8fa9sCdYz
         SmVQ==
X-Gm-Message-State: AOAM531Alzqa92Y+tQ56iUSS/rPtvaYGHhMuVjFQu4EnF52UssJksF/C
        ogKtJ7QXqOdwkimjeawIDK1GZiPkyfOltA==
X-Google-Smtp-Source: ABdhPJycByguR+ykRSSUpSNTGVAgnfdMACryk8PxT3piXU+7JRQ3GuPS+YbNtRQXuflINQten5A/QQ==
X-Received: by 2002:a63:c908:: with SMTP id o8mr12216634pgg.124.1608158566774;
        Wed, 16 Dec 2020 14:42:46 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g202sm3532961pfb.196.2020.12.16.14.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 14:42:46 -0800 (PST)
Message-ID: <5fda8d66.1c69fb81.341c8.88d4@mx.google.com>
Date:   Wed, 16 Dec 2020 14:42:46 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.10-rc4-92-g7ac554888233
X-Kernelci-Report-Type: test
Subject: linusw/devel baseline: 104 runs,
 2 regressions (v5.10-rc4-92-g7ac554888233)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 104 runs, 2 regressions (v5.10-rc4-92-g7ac554888233)

Regressions Summary
-------------------

platform             | arch  | lab          | compiler | defconfig | regres=
sions
---------------------+-------+--------------+----------+-----------+-------=
-----
imx8mp-evk           | arm64 | lab-nxp      | gcc-8    | defconfig | 1     =
     =

meson-g12b-odroid-n2 | arm64 | lab-baylibre | gcc-8    | defconfig | 1     =
     =


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/v5.10-=
rc4-92-g7ac554888233/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: v5.10-rc4-92-g7ac554888233
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      7ac554888233468a9fd7c4f28721396952dd9959 =



Test Regressions
---------------- =



platform             | arch  | lab          | compiler | defconfig | regres=
sions
---------------------+-------+--------------+----------+-----------+-------=
-----
imx8mp-evk           | arm64 | lab-nxp      | gcc-8    | defconfig | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/5fda8139baafe9cb87c94ccd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.10-rc4-92-g7ac=
554888233/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.10-rc4-92-g7ac=
554888233/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fda8139baafe9cb87c94=
cce
        new failure (last pass: v5.10-rc4-94-g3048c5493cd20) =

 =



platform             | arch  | lab          | compiler | defconfig | regres=
sions
---------------------+-------+--------------+----------+-----------+-------=
-----
meson-g12b-odroid-n2 | arm64 | lab-baylibre | gcc-8    | defconfig | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/5fda80eb36238d8219c94ccd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.10-rc4-92-g7ac=
554888233/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-g12b-odroid-n2.=
txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.10-rc4-92-g7ac=
554888233/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-g12b-odroid-n2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fda80eb36238d8219c94=
cce
        new failure (last pass: v5.10-rc4-94-g3048c5493cd20) =

 =20
