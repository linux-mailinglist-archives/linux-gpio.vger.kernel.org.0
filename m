Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0DEE2CB1A4
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Dec 2020 01:43:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgLBAmf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 19:42:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726166AbgLBAmf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2020 19:42:35 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42C82C0613CF
        for <linux-gpio@vger.kernel.org>; Tue,  1 Dec 2020 16:41:55 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id t18so139331plo.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Dec 2020 16:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ur12Caax0W/fx3usOgzM8nspo2X3Dnw9QZ1Lq9ZpvHs=;
        b=wte9Donut5HDB5pJ1WwOFynSLOIZy7Wpz7/ItJ30QLK7cuJEzJ/kISrctLXqEawEMt
         5Hco9kJnm23pDTtDm/DdFQoQk0FwqsERGClMNowni6lan+pdNxiRVSw7mNoEjljjM4AL
         XZ/bRAncFw4nR3aq9zKHZPEbu3ql+llSL7dzEmEFeO1tChFJpC7/83W3B1didwXL0mT9
         zq77oys/vI/eLtb2uMe4JdhODblG9C1EuepbcPHQNyx5OaJgOlzyAnKKk7gnxFl4pBCk
         I3HclIzJspXAdHn/UBy9892UGKgfwgPZlkoLgXWR7bjvNQi2Jy+CyiQH3L2o17sp2rEg
         SsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ur12Caax0W/fx3usOgzM8nspo2X3Dnw9QZ1Lq9ZpvHs=;
        b=G8arY5hmxs+2RnYe8pr5kPAyOcvZ8LIY0MJP084fh22+DLVQaO/npdEBDWPf7twlQ8
         DOpnuLo3mi6bIQthEbM92dNP88sWPxf5PghN7aY/Cj3Xm62QpTLdy052x2ixqBFvDmJS
         5Rk4fwaonxPuGJg3mGKK4pqb/mqN372Sl5wL2vDcrJEV0OGaLD7UtfZfFGdc0Yqoxkww
         CVH3akBnhNxV3Wdt5KEA8vL7r+RbwPQYjObVohu6E8WEvy1CggoB88spZnm2zFmQSzxJ
         jem8HQE9GRMGB9ZQuOIETTnhN0ZQGmFQLENgOd3hVIMoctaeRSv/tQsdhWt3iuEHw/Hz
         wuJw==
X-Gm-Message-State: AOAM5331iQohlx3a2DIvkXIB7wnsxz6JFsTFl4QwIsJHl/0kf9u+hxx2
        SWNFvd9vN3BPaHG1yMSVzCYa1fQTpB83/g==
X-Google-Smtp-Source: ABdhPJxPS0d4nBtXJi913VBlPshqTSpOBXTNrqIc4guyOxk27Sl17ct+Oyz+YPKq226Jl8QJpgSWGA==
X-Received: by 2002:a17:90a:c505:: with SMTP id k5mr343943pjt.53.1606869713745;
        Tue, 01 Dec 2020 16:41:53 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o2sm84594pgq.63.2020.12.01.16.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 16:41:53 -0800 (PST)
Message-ID: <5fc6e2d1.1c69fb81.bbe9c.0668@mx.google.com>
Date:   Tue, 01 Dec 2020 16:41:53 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.10-rc4-34-g0f2c7af45d7e
X-Kernelci-Report-Type: test
Subject: linusw/for-next baseline: 108 runs,
 2 regressions (v5.10-rc4-34-g0f2c7af45d7e)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 108 runs, 2 regressions (v5.10-rc4-34-g0f2c7af45d=
7e)

Regressions Summary
-------------------

platform        | arch  | lab          | compiler | defconfig | regressions
----------------+-------+--------------+----------+-----------+------------
bcm2837-rpi-3-b | arm64 | lab-baylibre | gcc-8    | defconfig | 1          =

imx8mp-evk      | arm64 | lab-nxp      | gcc-8    | defconfig | 1          =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/v5.=
10-rc4-34-g0f2c7af45d7e/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: v5.10-rc4-34-g0f2c7af45d7e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      0f2c7af45d7eef8455d7ad39c5326229bf19a2ed =



Test Regressions
---------------- =



platform        | arch  | lab          | compiler | defconfig | regressions
----------------+-------+--------------+----------+-----------+------------
bcm2837-rpi-3-b | arm64 | lab-baylibre | gcc-8    | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb4f11db4976c44f2d8d90f

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.10-rc4-34-g=
0f2c7af45d7e/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.10-rc4-34-g=
0f2c7af45d7e/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5fb4f11db4976c44=
f2d8d912
        new failure (last pass: v5.10-rc4-34-gfec3b9548c97)
        1 lines

    2020-12-01 23:52:28.191000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-12-01 23:52:28.191000+00:00  (user:khilman) is already connected
    2020-12-01 23:52:44.745000+00:00  =00
    2020-12-01 23:52:44.745000+00:00  =

    2020-12-01 23:52:44.745000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-12-01 23:52:44.745000+00:00  =

    2020-12-01 23:52:44.746000+00:00  DRAM:  948 MiB
    2020-12-01 23:52:44.762000+00:00  RPI 3 Model B (0xa02082)
    2020-12-01 23:52:44.848000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-12-01 23:52:44.880000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (379 line(s) more)  =

 =



platform        | arch  | lab          | compiler | defconfig | regressions
----------------+-------+--------------+----------+-----------+------------
imx8mp-evk      | arm64 | lab-nxp      | gcc-8    | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb4f15e21d78a8d39d8d909

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.10-rc4-34-g=
0f2c7af45d7e/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.10-rc4-34-g=
0f2c7af45d7e/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb4f15e21d78a8d39d8d=
90a
        new failure (last pass: v5.10-rc4-36-g6c33287665e0) =

 =20
