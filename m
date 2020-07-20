Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5737227358
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 01:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726949AbgGTXyp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jul 2020 19:54:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726907AbgGTXyo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jul 2020 19:54:44 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D449C061794
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2020 16:54:44 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id p1so9443024pls.4
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2020 16:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=tMHFE2fiPzi2MGf0+65Hs60dyxcWJFaUuPbTjuM7b1c=;
        b=I1yXWw4zHw61gdMktFvjl/DnCpWzg67temy9xgmZVSl3njxyfQH3R8IVj7l0wIfA7+
         PCOhecPYHMVvu3v+ixAajnCiszcCTm0UDew5Jq9dEHCEiSRuEaEur1cHJ53P+qIn/45a
         lZK4xl2yfLOE2IvtJGpPZNQHKh3gL0yIcysmjFzS0sy45PVJXdIJLTztxfwE2q2xGMRK
         GYttVwXMBWNQZLMaIjk5u870df5Do56amUgpPTcFLYpNI/VrdlOIWNXp4eKIVlvhBMbu
         GTD5Ewi79wQyoVldBSJLNi0F5VyPQd2TyLOnByvec/UR8C4nfVTMDR1qnhjC9c3XU/Uw
         bgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=tMHFE2fiPzi2MGf0+65Hs60dyxcWJFaUuPbTjuM7b1c=;
        b=DJ7pfhploL080dnFuEEx84KA6/CqiBXr5qnfLxgV6+kW7R2G439rXO2fq1RsYaiBvU
         Dh4c6WwFAAc+wHeIfC/7ePA6jJkZBbFvj8iN+zJpF6s+kJBguSTh/ndNiRI3sA432D4J
         Ow5QZTKS3y+1YW8QSg7UD7+Uk3xCT+8gpjB8wo2+rTrhv+2/3NqnOL2hxjjZKOa/jDlX
         YkEd5Kxprhgmtn8Y8+lS3Vxz+T38g+0zhUCk8KezNLXVi+7946jX1fvA0JGj3Ve0KnfC
         NlK+FYQxfT47FenNP9YhYMpXK+eYgNGZmHh+2y0xJ/AB/koHar5BA/l3C16JpGyYJxkm
         24+w==
X-Gm-Message-State: AOAM532lvN0xeixaBD6cMH/H+zPz62c/Hu2OpzwBqgISb36aPtszVAvd
        tmKlG/qiSnaPd/4w02g5+ka5+1cfQ1A=
X-Google-Smtp-Source: ABdhPJwpLrIWwVMLUw6Cis2HajJYbjM1t3JmJGIpXqqgjuH88pOi3H4irWp1zQ35C+0ZNLyGPtZEBw==
X-Received: by 2002:a17:90b:1a8d:: with SMTP id ng13mr927936pjb.24.1595289283565;
        Mon, 20 Jul 2020 16:54:43 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w12sm719186pjb.18.2020.07.20.16.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 16:54:42 -0700 (PDT)
Message-ID: <5f162ec2.1c69fb81.2fd7f.3254@mx.google.com>
Date:   Mon, 20 Jul 2020 16:54:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: gpio-v5.8-2-75-gedee3bc65894
X-Kernelci-Report-Type: test
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel baseline: 89 runs,
 2 regressions (gpio-v5.8-2-75-gedee3bc65894)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 89 runs, 2 regressions (gpio-v5.8-2-75-gedee3bc65894)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efconfig | 0/1    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig =
         | 4/5    =


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/gpio-v=
5.8-2-75-gedee3bc65894/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: gpio-v5.8-2-75-gedee3bc65894
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      edee3bc6589484ec8c32b04c3b83497acfa6102f =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efconfig | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f162394d91bb88e9e85bb6c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-75-ge=
dee3bc65894/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4=
_xplained.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-75-ge=
dee3bc65894/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4=
_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f162394d91bb88e9e85b=
b6d
      failing since 34 days (last pass: gpio-v5.8-1-1-gf6d984418ffd, first =
fail: v5.8-rc1) =



platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig =
         | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f16255e0f6589cc0185bc1d

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-75-ge=
dee3bc65894/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-lib=
retech-ac.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-75-ge=
dee3bc65894/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-lib=
retech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f16255e0f6589c=
c0185bc22
      new failure (last pass: gpio-v5.8-2-68-g80606cb24161)
      2 lines =20
