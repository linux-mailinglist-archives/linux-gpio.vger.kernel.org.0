Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7E842D9848
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 13:51:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731859AbgLNMvC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 07:51:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728486AbgLNMuy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2020 07:50:54 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E080AC0613CF
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 04:50:13 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id n3so255963pjm.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 04:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=IrZPeYWxeD7JdQsye7I4SEUwaFVskyIq849bPtHHR1Q=;
        b=E0D8oyD47S2Yxdj9ysllbL4n0WhN72KE5lLwlThnMRHgKugtOf+Snk9e2Q8Fr6Hehr
         gUkIrdbmpMj0ZXRWup1CqPnG0oYlG6d/JQw5OnGebIK9qPCLh6pKovZARYadxJJmk/0I
         hfalf0WFRhVV6hbOjm2LmOQ070mZ70oHS8XtDVFlbFZ3n/wMttuow/a3LfrHVNUk3nCo
         ZWIt1e1fEc8uVwLWnLXS6LgxdFI6PxbmGYADS7O0hEm5Y7SmB/fEjJOLpKxpn9HPtI5N
         ih6sJYY/qe5a41kfO/tXAA91mSZeGm4THtZ5giA54pTt6pVNKitg9yb9tNucfyjK4Xqe
         m0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=IrZPeYWxeD7JdQsye7I4SEUwaFVskyIq849bPtHHR1Q=;
        b=rkCE70gVivyPTJETKNh9R9Bgtnq/Ho0tBT/nhzSfjJRidlsJKkBk5vap9h+1Eqsbhw
         KeaDgvlC2+7G8oyhNlfbmtJwDu5XgC0TSjr8KTTlKWvPYdYtji5lKbTbCbEmi1Ss/AT4
         sTXuoa0a/WOIR95JMIpfKje0WZONEnJ0fL+N84vu31DyBtmc/6+WP/OQrsPOfJMJB/pb
         Lwe3mpS7V0IVZqqWIjYaPpouHMPkUWlNp1fuaMlwoFhZb1yMgOgdCBCJMGLkn9+B0nne
         oA+aXBXk6mWI9LoxteR5ucjQjEp8blK6F34fUyVvfltl5LqglFM30cFzI2jMYcwnnNZQ
         Bwtw==
X-Gm-Message-State: AOAM533LjpezOSYl1oLIEG0YDuKraLU13FDDGfQ0dvDWP96D4i5fDksU
        M32XcDupmQ9K2W4cMvmsoQq0uFTVHn3xYw==
X-Google-Smtp-Source: ABdhPJwbeu+Hf3oC3BD3SkvcLmp/4dGGm0HcCZEyiROeXTMpW9zflhgDtoBxOcH36k29+ysQNGvr+A==
X-Received: by 2002:a17:90a:a595:: with SMTP id b21mr24930796pjq.206.1607950212299;
        Mon, 14 Dec 2020 04:50:12 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e24sm15648725pjt.16.2020.12.14.04.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 04:50:11 -0800 (PST)
Message-ID: <5fd75f83.1c69fb81.da4af.082b@mx.google.com>
Date:   Mon, 14 Dec 2020 04:50:11 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.10-rc4-91-g65efb43ac94b
X-Kernelci-Report-Type: test
Subject: linusw/for-next baseline: 75 runs,
 1 regressions (v5.10-rc4-91-g65efb43ac94b)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 75 runs, 1 regressions (v5.10-rc4-91-g65efb43ac94=
b)

Regressions Summary
-------------------

platform   | arch  | lab     | compiler | defconfig | regressions
-----------+-------+---------+----------+-----------+------------
imx8mp-evk | arm64 | lab-nxp | gcc-8    | defconfig | 1          =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/v5.=
10-rc4-91-g65efb43ac94b/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: v5.10-rc4-91-g65efb43ac94b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      65efb43ac94bffeb652cddba4106817bb38c5e71 =



Test Regressions
---------------- =



platform   | arch  | lab     | compiler | defconfig | regressions
-----------+-------+---------+----------+-----------+------------
imx8mp-evk | arm64 | lab-nxp | gcc-8    | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd758c187a0c48ec7c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.10-rc4-91-g=
65efb43ac94b/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.10-rc4-91-g=
65efb43ac94b/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd758c187a0c48ec7c94=
cba
        new failure (last pass: v5.10-rc6-93-gb8fbfef1595c) =

 =20
