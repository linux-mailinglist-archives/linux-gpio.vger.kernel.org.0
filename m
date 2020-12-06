Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DC0F2CFFFF
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Dec 2020 01:43:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725922AbgLFAnL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Dec 2020 19:43:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbgLFAnK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Dec 2020 19:43:10 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A857C0613CF
        for <linux-gpio@vger.kernel.org>; Sat,  5 Dec 2020 16:42:30 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id j1so5210727pld.3
        for <linux-gpio@vger.kernel.org>; Sat, 05 Dec 2020 16:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=MNdxTGYPeo8Go0v9yz+entI5QU+qZiM76ag93g+zla0=;
        b=S2grmQ/Oxs82RSgSRaG2fBxBerkP5K+QjQ4x6lua95YZaUqjopRcYanpPFqkdh2qbX
         SpDC0wRAGwRJlTVKN1R0i52cbrYmvsZfC0kPSxQe6PdLZoSFhKEjWk1hDw67HjLx25Sr
         /7Y9o+6PLAts9Taxy0loNy3uBthR/1bDTA1FCWLJB2CTAlkB4djDOm05+HBdLr17vprz
         Rjx9cX4GcV1MDsm6VhLUuIuoWJpLcFMbqOIpmZhJoM34nD2/23lRi7AE9YBrAIxZOMbI
         wG0rKC4SY96zOlw2xRxwyTHwk9FGh6qRRLJaY9CCBnwW0j3F1pkeIwcFHBpjS/Rm8G+T
         hvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=MNdxTGYPeo8Go0v9yz+entI5QU+qZiM76ag93g+zla0=;
        b=dxM8GIbZe1azkC0+1NNct2R5lXtVA5jQAVBQRJljgLuBgck9Ch6NZ899lXl8iaKplB
         ARLqzJM/bKMnsmBsc623VAcOJwk4fUXDipL7WIOIX1rOfRL23fqQcP53fZkRtXaCO6Lb
         gs3gEwOTooqwu0BbkmTx8M4JAW4wh7jcCOKGG7DJiMUzdmRBUHyFjoqzaBK65jFQb/0z
         M8vIl8FIwkCqQfkGTu7t7BF5QDl3o2XGX6uGXsqfCiru3lupcLX/TaDGfMvN7hNS9CLl
         8mRDOay4k9BaC6eX5RgRO5CMJ6VoBOW+zlf9oigqj8G2O2MgLkppM8lx5eDvJ4ddP6ra
         SILQ==
X-Gm-Message-State: AOAM531/JflthoqnumNQ9DzGyDJaLv4zJOnunxkNSTIDfFdxNR9k89Mn
        8l0j4oiVK1MQPiN/W6yC7iWgfmwxRc0GgA==
X-Google-Smtp-Source: ABdhPJyHGxIl/HIXenMrvg22CU4icTFtUecG33j/N3BOlHkXHlMXW3l5WJa9BbNH429C+lwF41wpSw==
X-Received: by 2002:a17:90a:eac5:: with SMTP id ev5mr293999pjb.65.1607215349715;
        Sat, 05 Dec 2020 16:42:29 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u1sm8857104pfn.181.2020.12.05.16.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Dec 2020 16:42:29 -0800 (PST)
Message-ID: <5fcc28f5.1c69fb81.59e87.50f0@mx.google.com>
Date:   Sat, 05 Dec 2020 16:42:29 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.10-rc6-6-g77c12bf38394
X-Kernelci-Report-Type: test
Subject: linusw/fixes baseline: 104 runs,
 1 regressions (v5.10-rc6-6-g77c12bf38394)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes baseline: 104 runs, 1 regressions (v5.10-rc6-6-g77c12bf38394)

Regressions Summary
-------------------

platform   | arch  | lab     | compiler | defconfig | regressions
-----------+-------+---------+----------+-----------+------------
imx8mp-evk | arm64 | lab-nxp | gcc-8    | defconfig | 1          =


  Details:  https://kernelci.org/test/job/linusw/branch/fixes/kernel/v5.10-=
rc6-6-g77c12bf38394/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   fixes
  Describe: v5.10-rc6-6-g77c12bf38394
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      77c12bf3839479c3963433043e2051d738f3ab63 =



Test Regressions
---------------- =



platform   | arch  | lab     | compiler | defconfig | regressions
-----------+-------+---------+----------+-----------+------------
imx8mp-evk | arm64 | lab-nxp | gcc-8    | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/5fcc223c0f4f6963a8c94ce9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.10-rc6-6-g77c1=
2bf38394/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.10-rc6-6-g77c1=
2bf38394/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fcc223c0f4f6963a8c94=
cea
        failing since 17 days (last pass: v5.10-rc1-14-gb72de3ff19fd, first=
 fail: v5.10-rc4) =

 =20
