Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAB9321C456
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2020 15:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgGKNCv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Jul 2020 09:02:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbgGKNCv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Jul 2020 09:02:51 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 234A3C08C5DD
        for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2020 06:02:51 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id j19so3757582pgm.11
        for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2020 06:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=VT5ynyaSJyhq1gPYtLVFjTqiTH20lPWb64YqjNEhTOM=;
        b=njoVGcR2glIduLtFOnhiIGQ9JaIj7bOuYOv/E0RwT/BVLfKB12cl+H+M6MX6cXZmHB
         W5XX93Q7bS4LVloy9cDCVCnZ3VuQlEyZSet9zerJKBCkKmLM1tM1S3vcgHakVqdVCjd9
         +chy3Jr4+Rl18g3b5rjOZIZPtB57ur4E80hUbX6FCGdAuqKxHUf/5nOHpkxKYcl9ObfH
         84fx7UvDUBTBzacHzxcaSTxSBqW+/uvrnXlRdaQ0IiQ0nQUuArGc7iP+A/Ji0VeeB5NM
         QclRy53JNsYwMBp5T3ssiBPW8FAdKXef1giwTDaQxZuJ4z/G6hMbKESSGZMkTud+X5sH
         7vpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=VT5ynyaSJyhq1gPYtLVFjTqiTH20lPWb64YqjNEhTOM=;
        b=BSkkvTfH41OqdJUEWuACdabRuNB4jwftEA5eTrcA9TStPQekYHq/1m5plRBchhvBzC
         GtI2nTVG+K4ZTqoX1Dhdq3FG9SUm0nnR/EmndfKUDb7kvE9lBjgnOCNU9LuwOZRh3r/V
         5f1rg9INLdLWR6vbC3Ts5TW1DmRtkAG/7YipPIw/CtXnqrxbGfbxbf7VzFHacqSwf0BL
         bzrvcpWENMNLPfWL8VlPUh1ISdn/WuPep1oK5qcRpMTN8cROLBPyNWuZ8/0E5yMPGVz7
         0o4UQeV0ZbAOMGLW8AoicCr03f5aepRYiw2G3Cp5kazFRfJktlaIa4uDOEwx2U2LTPvv
         ctfA==
X-Gm-Message-State: AOAM533zK99jQ4sEn9YW9OCoT2QTPfH36DIoYGI/ny2vpmMR2JuQ6Ewz
        x9ELcxNdqlrmKZIKQERjNX0sDv+kX5A=
X-Google-Smtp-Source: ABdhPJy/3LNd7J1P8k/fWdZgNu8P5QztvSOADVi/r7yVHMRcB7h4++wotC4RtwcuclgsTaJuqNZ6PQ==
X-Received: by 2002:a63:531e:: with SMTP id h30mr60080959pgb.165.1594472569944;
        Sat, 11 Jul 2020 06:02:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e6sm8810716pfh.176.2020.07.11.06.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2020 06:02:49 -0700 (PDT)
Message-ID: <5f09b879.1c69fb81.62dc9.56e6@mx.google.com>
Date:   Sat, 11 Jul 2020 06:02:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc1-39-ga6175e894d88
X-Kernelci-Report-Type: test
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel baseline: 87 runs,
 2 regressions (v5.8-rc1-39-ga6175e894d88)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 87 runs, 2 regressions (v5.8-rc1-39-ga6175e894d88)

Regressions Summary
-------------------

platform              | arch  | lab          | compiler | defconfig        =
  | results
----------------------+-------+--------------+----------+------------------=
--+--------
at91-sama5d4_xplained | arm   | lab-baylibre | gcc-8    | multi_v7_defconfi=
g | 0/1    =

hifive-unleashed-a00  | riscv | lab-baylibre | gcc-8    | defconfig        =
  | 0/1    =


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/v5.8-r=
c1-39-ga6175e894d88/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: v5.8-rc1-39-ga6175e894d88
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      a6175e894d88025f0aa0a2cbccdf4fe74c113b65 =



Test Regressions
---------------- =



platform              | arch  | lab          | compiler | defconfig        =
  | results
----------------------+-------+--------------+----------+------------------=
--+--------
at91-sama5d4_xplained | arm   | lab-baylibre | gcc-8    | multi_v7_defconfi=
g | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f09af1750d74977b685bb27

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.8-rc1-39-ga617=
5e894d88/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xp=
lained.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.8-rc1-39-ga617=
5e894d88/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xp=
lained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f09af1750d74977b685b=
b28
      failing since 24 days (last pass: gpio-v5.8-1-1-gf6d984418ffd, first =
fail: v5.8-rc1) =



platform              | arch  | lab          | compiler | defconfig        =
  | results
----------------------+-------+--------------+----------+------------------=
--+--------
hifive-unleashed-a00  | riscv | lab-baylibre | gcc-8    | defconfig        =
  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f09aada1f1aa742e485bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.8-rc1-39-ga617=
5e894d88/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.t=
xt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.8-rc1-39-ga617=
5e894d88/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f09aada1f1aa742e485b=
b19
      failing since 24 days (last pass: gpio-v5.8-1-1-gf6d984418ffd, first =
fail: v5.8-rc1) =20
