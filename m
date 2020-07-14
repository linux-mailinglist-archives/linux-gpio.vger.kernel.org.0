Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15A5521E8B9
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2020 08:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725788AbgGNG7J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jul 2020 02:59:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725778AbgGNG7J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2020 02:59:09 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8407C061755
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 23:59:08 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id q17so6629600pls.9
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 23:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=jg2gd/S50iUHh0HuOUuNTxmh/Nlz+QnDxRziBHkErdY=;
        b=LAR4Y5tO/n01rVmTzDEGCApoQ9uAQKGInhJbpK5jCJJ3W6d2fyivgqvgaRqFEunvsu
         2fnyrQPsMZBKjAlG6tkJ4rXjR8/nafBUG5T+AZkrQuVMFZwjJ+dVsgvqlMvLm/9gtEC8
         Rn3gkzIy4W73QMIHBkOPMZSRo62Vj8bwYL0/rS8qih3J0C2jAmsoCh8sK5jJmY6n/gXV
         cJs8Vpjx8V9JCd4GeqeLmGnoZGrSvtzlwUnO6OyiOXMdzRMXXTf8OyK4kokOB0/fb27I
         HO1dToA8hVbxLdmuQl8CcwdFNtZw8UlwcVCmHOG1gwT0tMHmc9eluL1IBB2gJrVzCr/p
         byWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=jg2gd/S50iUHh0HuOUuNTxmh/Nlz+QnDxRziBHkErdY=;
        b=HK9CMTnYNvR2gx+rhWStk6X48qdptXYVDCOvXpbLsyJqUfzemKARShqJHmDQPbHSix
         efwY5m/M7ffZ6/AoQ7eCnDGWia4oVgJQAEqfSY+hCqvl/tilqG1MCEUZNgeV1VRYX0Il
         Qi3/P6OGo1RW6Lgi2/TLdlT95t9mc0bD7qdZrR03sg1OcL8Pr67ZwQQvbV0I7OPeLxlH
         SS6PwxZcpTEa0UwRabk0TJCF78160pqt9rfetzSoYZXzqa6c5G2PZcvJ6orFrZ1cTx0l
         X0TX/2OE5hwtDjVKuaJftuWVIVmw6GEL67ZxyC07xSdwpRCSdbvwfWg2Q+Se/wJnUAgU
         vLUQ==
X-Gm-Message-State: AOAM530ur9od7QxOEG1CdQ8MNZKkJUCMe0Rc1sr9qnN0xF4G0oc5wiX7
        UDUVG2VLoW4zyiUXYfl1Us4CweW8EuU=
X-Google-Smtp-Source: ABdhPJyZMdnbmx9dNZli+nYFrLgn3uAE6bO9M4/wso85PyCQGcjmYDTJCha+YkZUDMQGtuVT71wzfA==
X-Received: by 2002:a17:90a:32cb:: with SMTP id l69mr2789973pjb.205.1594709948107;
        Mon, 13 Jul 2020 23:59:08 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g3sm15962642pfq.19.2020.07.13.23.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 23:59:07 -0700 (PDT)
Message-ID: <5f0d57bb.1c69fb81.9725f.8354@mx.google.com>
Date:   Mon, 13 Jul 2020 23:59:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: gpio-v5.8-2-58-g1752911c6d10
X-Kernelci-Report-Type: test
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next baseline: 85 runs,
 2 regressions (gpio-v5.8-2-58-g1752911c6d10)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 85 runs, 2 regressions (gpio-v5.8-2-58-g1752911c6=
d10)

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


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/gpi=
o-v5.8-2-58-g1752911c6d10/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: gpio-v5.8-2-58-g1752911c6d10
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      1752911c6d10675154f1c8c8ba54331604cdbca7 =



Test Regressions
---------------- =



platform              | arch  | lab          | compiler | defconfig        =
  | results
----------------------+-------+--------------+----------+------------------=
--+--------
at91-sama5d4_xplained | arm   | lab-baylibre | gcc-8    | multi_v7_defconfi=
g | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f0d4cffeadfee45c885bb3a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-58=
-g1752911c6d10/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama=
5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-58=
-g1752911c6d10/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama=
5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f0d4cffeadfee45c885b=
b3b
      failing since 23 days (last pass: gpio-v5.7-3-2-gcdf59728a3cd, first =
fail: v5.8-rc1-11-g42ba326cdeff) =



platform              | arch  | lab          | compiler | defconfig        =
  | results
----------------------+-------+--------------+----------+------------------=
--+--------
hifive-unleashed-a00  | riscv | lab-baylibre | gcc-8    | defconfig        =
  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f0d49c474acfc265085bb3b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-58=
-g1752911c6d10/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed=
-a00.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-58=
-g1752911c6d10/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed=
-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f0d49c474acfc265085b=
b3c
      failing since 27 days (last pass: v5.7-rc7-82-g74910e15ab25, first fa=
il: v5.8-rc1-2-g861254d82649) =20
