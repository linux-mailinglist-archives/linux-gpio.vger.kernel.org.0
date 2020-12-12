Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB4922D841C
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Dec 2020 04:06:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437990AbgLLDFf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 22:05:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438000AbgLLDFe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 22:05:34 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B6A4C0613D3
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 19:04:54 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id t6so5612924plq.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 19:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=e/HfeCB+WWK8ySbwJ9ivmf7yetmkfDc+Ua9qITlDemc=;
        b=N9Mv/TnuadmRsYRUIiTi+VmS8BDZr/5/qthuHnCsBlq4Sh7KqQpcy7PeG8GAjBkZn1
         Auz1AP2cbP+kpcWwyo5kATJbh0hkEMBi7BeeV8E/uXDDu+76I2kiH5Qrijjmqx6JeA4K
         ArX2SjRdMeOzprUQwQwja/g5kp14tYJ/yrQXTY9s1jKMBpjphm0ruf39qncPYZK/OQis
         AT4WLyPgTIDmGFuL+HgUissN9ljlyrj2ekMed0uUDQVaocyj1R6GPSnqLGLFEuk2peJT
         jUZWeHo58eIfwsg/pbTaSWYljqPdGCCbVJPPTm5xy/+iXpJfS+fN2+dCZKzdA83gtRwH
         4l0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=e/HfeCB+WWK8ySbwJ9ivmf7yetmkfDc+Ua9qITlDemc=;
        b=NYNekCnxXzGSr2Tt0/YCJJDfTPpjeeupQk4GtRNuvNm/L9XO+TSJDzfb5uybR8vAjc
         kY9h5VoX09fhtg0uuErYtQrzBgL30JvTAYGQxNqwEJfL8J75c6I8wUs8ayzf6rl7B+V2
         Fzq28a2j+JPbyfgCLFiaFe/H1XZKL0U1ofbvZldlF5OgUYKsOffx71spXRQTTPhEA4QK
         WmHGuzpWNhcOOXwBsKY06QkQqVoDYJLB05zqCa7WcfRu67Je7U9j9lEVhRn5QYQdN8y8
         H18nfuZRW+ZBXv+7eQAIO2rz3SMWOpeMplIaprjyt81cbcHvaqaeMRErZx5UtrxEhssd
         z6qQ==
X-Gm-Message-State: AOAM531vkoZWBxhvSHDbWJ2/1qgXhSWGuUcUE3oe4p+qRaPpvAPCi+sd
        ws5MgPxkdusaoOQlz7lhtDKVtDaeLpeMSw==
X-Google-Smtp-Source: ABdhPJwomC1tSON0w9+tSKZwWpeLqspeFgvJdI24utFWAxwihzvUt3c2onGlN474LDTXOlsIkpBMTA==
X-Received: by 2002:a17:90a:d48f:: with SMTP id s15mr15686600pju.137.1607742293722;
        Fri, 11 Dec 2020 19:04:53 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b13sm12677936pgr.59.2020.12.11.19.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 19:04:53 -0800 (PST)
Message-ID: <5fd43355.1c69fb81.cde0a.8761@mx.google.com>
Date:   Fri, 11 Dec 2020 19:04:53 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.10-rc4-88-g9777d0bfdae79
X-Kernelci-Report-Type: test
Subject: linusw/devel baseline: 99 runs,
 1 regressions (v5.10-rc4-88-g9777d0bfdae79)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 99 runs, 1 regressions (v5.10-rc4-88-g9777d0bfdae79)

Regressions Summary
-------------------

platform   | arch  | lab     | compiler | defconfig | regressions
-----------+-------+---------+----------+-----------+------------
imx8mp-evk | arm64 | lab-nxp | gcc-8    | defconfig | 1          =


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/v5.10-=
rc4-88-g9777d0bfdae79/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: v5.10-rc4-88-g9777d0bfdae79
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      9777d0bfdae796de3f8d73879a43bc00145dc8ee =



Test Regressions
---------------- =



platform   | arch  | lab     | compiler | defconfig | regressions
-----------+-------+---------+----------+-----------+------------
imx8mp-evk | arm64 | lab-nxp | gcc-8    | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd42752ab39d1375ec94cc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.10-rc4-88-g977=
7d0bfdae79/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.10-rc4-88-g977=
7d0bfdae79/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd42752ab39d1375ec94=
cc4
        failing since 6 days (last pass: v5.10-rc4-34-g0f2c7af45d7ee, first=
 fail: v5.10-rc4-47-gc47d9e1b7343) =

 =20
