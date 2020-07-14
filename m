Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0CB21E757
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2020 07:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgGNFLL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jul 2020 01:11:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgGNFLL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2020 01:11:11 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F7F0C061755
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 22:11:11 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id s26so7073296pfm.4
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 22:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+IkBHV+85csu48ATal5ZpYBIq0YdZ1hYfEaOKmN7ucs=;
        b=1S/QjL2GngnAEqHUtUX7dRjB8faDp7W4xW8Dqsry0o6FTMds5w3BIFKL9tYgM2eKYk
         GVXV0TW4gX7i65E9X73rcG3+nNlmtU6f3vlD7HlnwCyfUpgoPwDcX7lMp8JAHnXo2zCS
         B5hZf5NW/6Gy+xGv3TJU1ZyEXGMnx0Jutt5F72GdcPhQFXF58rM4ZpXL9eWSqgtRnfVM
         7kjUQdFi9SHXTwQj4ps3dcri6xUDOaUjh9WImjvBkFpZGhLFvFfT8jpH8LDm57ACKTVG
         4zqeGH6n7ItTm973hcP0D4k7jd8HmEc8pz2ASJug0okFPM34RiLBCbLNxQ9QrsuIaCIY
         60cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+IkBHV+85csu48ATal5ZpYBIq0YdZ1hYfEaOKmN7ucs=;
        b=tIWLp8vwzaDMzmNcLOnTeos61MWopI1per+kMP7+oOwfJ4kkfR5r0yamlf+VtLGn4B
         Ye0fuGMCKJNmUtpOBmjm6Fz7rnQGtqVp6Xps8g0kqtXwE/EFzqkMgwZz/bVKOytlVOyA
         sJVn+WkPlQm5KR7Mvt5iZ72miYu/VnL6XYGYad+vdEUElu4qOSdfgeq4agx1E6Zwe6FF
         ZPqd/qqQ8nQekvYWHVT5JU7c/YdU2H9PHEFsrSz5dkD14DNUJYK+aqxSzNpa7vG5yeRI
         PSVgtFURN822ptPh8QH7FEa4R0uXS4VEwcu78xz+HWssLlJ5eVZWaKxEDBcjz4PM7f5r
         iB6A==
X-Gm-Message-State: AOAM5307TCSrbe9X6SARrZ0Eu4PRv+Jg8lzT0rj07RNusSrfPc7l4x5R
        VTc7mJUTWkZUtivUColioV0WmUluEvM=
X-Google-Smtp-Source: ABdhPJw4TJnFKDRY1iM1+m8m3GcYxan9/ez0u5W0wi0jbYwM+IhKrLGQzTvdOgRvddxaRABzkYNJ7g==
X-Received: by 2002:a65:400a:: with SMTP id f10mr1991834pgp.197.1594703470197;
        Mon, 13 Jul 2020 22:11:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ia13sm1074315pjb.42.2020.07.13.22.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 22:11:09 -0700 (PDT)
Message-ID: <5f0d3e6d.1c69fb81.79004.4407@mx.google.com>
Date:   Mon, 13 Jul 2020 22:11:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: gpio-v5.8-2-58-g1752911c6d10
X-Kernelci-Report-Type: test
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel baseline: 85 runs,
 1 regressions (gpio-v5.8-2-58-g1752911c6d10)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 85 runs, 1 regressions (gpio-v5.8-2-58-g1752911c6d10)

Regressions Summary
-------------------

platform              | arch | lab          | compiler | defconfig         =
 | results
----------------------+------+--------------+----------+-------------------=
-+--------
at91-sama5d4_xplained | arm  | lab-baylibre | gcc-8    | multi_v7_defconfig=
 | 0/1    =


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/gpio-v=
5.8-2-58-g1752911c6d10/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: gpio-v5.8-2-58-g1752911c6d10
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      1752911c6d10675154f1c8c8ba54331604cdbca7 =



Test Regressions
---------------- =



platform              | arch | lab          | compiler | defconfig         =
 | results
----------------------+------+--------------+----------+-------------------=
-+--------
at91-sama5d4_xplained | arm  | lab-baylibre | gcc-8    | multi_v7_defconfig=
 | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f0d335e0cb7372c7085bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-58-g1=
752911c6d10/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4=
_xplained.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-58-g1=
752911c6d10/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4=
_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f0d335e0cb7372c7085b=
b19
      failing since 27 days (last pass: gpio-v5.8-1-1-gf6d984418ffd, first =
fail: v5.8-rc1) =20
