Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD7C7287FEC
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Oct 2020 03:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbgJIBRQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Oct 2020 21:17:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725979AbgJIBRQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Oct 2020 21:17:16 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8942C0613D2
        for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2020 18:17:14 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id o25so5836030pgm.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Oct 2020 18:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ZXMQa9//fkqBLM844M+K53oic7WfBDS7KLnDESJFPUQ=;
        b=rwoqw4vBd9kyVDFk+gtcwRl1xxiXfJlCXehvYsYyaRNrwD93Nmn02pD1oRuRfXzM9V
         jASkYM1wPnD1IasIIs/yraTm0fUC1E7t7ts6CKJHilJuzR6I2zls590mGos9miY8aA7s
         578rSFLfSUYFmPdSRoG2WMwvQ8bQn8JK1qDwb6ymTWMQbgy5WDl9JfT3f+w/ERa8S/Ne
         kFUsQ22uj3HSHtYlEApFaZ4nW92TQdrko10kTVHBV13QmZy8+SsnMATZU8S1SlM5emtv
         MwbZ3+h2l+J7ayixwCn1YefFWBakftvZFOF7up9uncxW7qmR6X4DoQ3SB72WnZ2WYtfb
         jdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ZXMQa9//fkqBLM844M+K53oic7WfBDS7KLnDESJFPUQ=;
        b=Ton5OXshx7wVPx6ltjvEDfCWyi6V31wiAWGBbKduUvnzVVQUjSdqQExemPGTONQvyW
         5Ldb8DrE9IBhjKzmwe3fGF0zwyLN4+lPMu659f3TkbOPBUdx1QrxmIbpZcxM/JnIkMwS
         CQsfvkRUX0DPayZnKA6nRVXHuv1USmqm5xrlri0ACY6uKSrj+Mos9fHqKJio1nACBwMa
         4WKphB8QWpxeAJJhXAfkNWQUW7w8UiWwUjkWxFtSgzEf+xLx2gV9r4WGsTZlurXE43I0
         s1cF8/6wFH0OfC00WX3pf9kY7xg2uDLARpiD8/o4DtBmbx2YuRxAWPAHo37grTHgC7C5
         P7Sg==
X-Gm-Message-State: AOAM532+42VWF7VAg3hNmqZa7BbqAVIcLiRVz1xQYviWGDD0oQnFhP/w
        AFS2cZAEuhr9xZbcLDBIeIQLHaeMl+3/ug==
X-Google-Smtp-Source: ABdhPJwOh7girkhBpu6BlKW0pnF7HZO/+X0HtRk6BN2kUJ5FdB5IoFTCHi+edeX8jWFlsarzFDxscQ==
X-Received: by 2002:a63:a55d:: with SMTP id r29mr1364659pgu.368.1602206233724;
        Thu, 08 Oct 2020 18:17:13 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o1sm8559798pgi.41.2020.10.08.18.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 18:17:13 -0700 (PDT)
Message-ID: <5f7fba19.1c69fb81.5eefa.007d@mx.google.com>
Date:   Thu, 08 Oct 2020 18:17:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-rc8-79-g3d6e8262d3c0
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
Subject: linusw/for-next baseline: 54 runs,
 1 regressions (v5.9-rc8-79-g3d6e8262d3c0)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 54 runs, 1 regressions (v5.9-rc8-79-g3d6e8262d3c0)

Regressions Summary
-------------------

platform        | arch  | lab          | compiler | defconfig | results
----------------+-------+--------------+----------+-----------+--------
bcm2837-rpi-3-b | arm64 | lab-baylibre | gcc-8    | defconfig | 3/4    =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/v5.=
9-rc8-79-g3d6e8262d3c0/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: v5.9-rc8-79-g3d6e8262d3c0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      3d6e8262d3c09479c65e59939df6ca3c0ad7f750 =



Test Regressions
---------------- =



platform        | arch  | lab          | compiler | defconfig | results
----------------+-------+--------------+----------+-----------+--------
bcm2837-rpi-3-b | arm64 | lab-baylibre | gcc-8    | defconfig | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f7f9efd21456de9e74ff422

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.9-rc8-79-g3=
d6e8262d3c0/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.9-rc8-79-g3=
d6e8262d3c0/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f7f9efd21456de9=
e74ff426
      new failure (last pass: v5.9-rc8-78-g24160a8f7f13)
      2 lines

    2020-10-08 23:19:16.907000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-08 23:19:16.907000  (user:khilman) is already connected
    2020-10-08 23:19:32.644000  =00
    2020-10-08 23:19:32.644000  =

    2020-10-08 23:19:32.645000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-08 23:19:32.645000  =

    2020-10-08 23:19:32.645000  DRAM:  948 MiB
    2020-10-08 23:19:32.660000  RPI 3 Model B (0xa02082)
    2020-10-08 23:19:32.747000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-08 23:19:32.779000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (384 line(s) more)
      =20
