Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBF1C21BD17
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2020 20:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727091AbgGJSgW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jul 2020 14:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727082AbgGJSgV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jul 2020 14:36:21 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCE15C08C5DC
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2020 11:36:21 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id p1so2599108pls.4
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2020 11:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=zyAEYIveaj9KT4e1d0T60mLG/q+ajqi5EF6uYFV8/hk=;
        b=y8ZtgvsEP7lMnTFiHxmH83dCgY/vSgC5HVjELWcvR1uVNuXQqHfHyF7tcC8UCVMoIG
         eNBMDgib2rfykIdXp6JwqLsTehTUXetSu8blFayyC1x+U+bVNe+O5ixYbZBqEzww1VXu
         28WwS4KZqni6bepe0QxyeCmn0SNNE13b1K97qurZtYoyVVlM/od9UxgShiSL+6TDCQoR
         fQjHvuOHU56kr9K01v8X83y4/S54EJWx2wtRbR3MV2wa2R6WaIFgNdXk0izgJBWf1WUG
         3Sv4taOarX6l8zX4KG9DGO/06dgoCpaLYUfquPVUYPV7B6TK+elRH8FmkrqzNBkaWvAf
         +2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=zyAEYIveaj9KT4e1d0T60mLG/q+ajqi5EF6uYFV8/hk=;
        b=XwY5dT5mR8uqgMA+pL6tbNmcoa/bYtbXxkXjd45DAuqIaNpiTLYa+fWYdB0FTgHc+Z
         0bEOqS6y+iBP9vPzG1UbBXsX3jOreujuybkp9Edj0f4kLCBO8JBMZfpas9313eF0LmZJ
         oMM2v/+5l6ohAejPO6rRz/6JQPYJ3wwILMcolKpmALF/nIFyU+fUbVVk7X42TADmD/PI
         W57KVfC2rrK1w3WP8yP4GjRFlxI5KL6Gtha5eNcudWU3q6R03WWRqVTcQSzaHDbeRVKz
         o7ly6TEBDvRPSmWE28pOgYRaEQowQcZaf/QtwQeWXvkrvGNkCZjsWV21XcpL5VyLpL9g
         bHEw==
X-Gm-Message-State: AOAM531oHZtmZ1YqrAwcytYLMjnxb4aqvNkeLk8EzVxBwLDVyd/CGb1m
        YC29fNVe38Iwv/noYomY/aXWDu5Gb9I=
X-Google-Smtp-Source: ABdhPJzlsaDEUzr5H3GFoEGFXd8tt9jyRmnhUmMgvqTb9rdRLmJx6TzYGb6d4E3Wvd5s5QDclAsYVQ==
X-Received: by 2002:a17:90a:8082:: with SMTP id c2mr6924778pjn.204.1594406180911;
        Fri, 10 Jul 2020 11:36:20 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q24sm6929794pfg.95.2020.07.10.11.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 11:36:20 -0700 (PDT)
Message-ID: <5f08b524.1c69fb81.985cd.0bde@mx.google.com>
Date:   Fri, 10 Jul 2020 11:36:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: gpio-v5.8-2-40-g4672a4a9fbfe
X-Kernelci-Report-Type: test
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next baseline: 87 runs,
 5 regressions (gpio-v5.8-2-40-g4672a4a9fbfe)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 87 runs, 5 regressions (gpio-v5.8-2-40-g4672a4a9f=
bfe)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efconfig | 0/1    =

hifive-unleashed-a00         | riscv | lab-baylibre | gcc-8    | defconfig =
         | 0/1    =

imx6q-var-dt6customboard     | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efconfig | 3/5    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig =
         | 4/5    =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/gpi=
o-v5.8-2-40-g4672a4a9fbfe/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: gpio-v5.8-2-40-g4672a4a9fbfe
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      4672a4a9fbfe316e1153682b0790af6446255a50 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efconfig | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f08acc24e586db5ef85bb28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-40=
-g4672a4a9fbfe/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama=
5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-40=
-g4672a4a9fbfe/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama=
5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f08acc24e586db5ef85b=
b29
      failing since 19 days (last pass: gpio-v5.7-3-2-gcdf59728a3cd, first =
fail: v5.8-rc1-11-g42ba326cdeff) =



platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
hifive-unleashed-a00         | riscv | lab-baylibre | gcc-8    | defconfig =
         | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f08a981c09eac4c7185bb1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-40=
-g4672a4a9fbfe/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed=
-a00.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-40=
-g4672a4a9fbfe/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed=
-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f08a981c09eac4c7185b=
b1c
      failing since 24 days (last pass: v5.7-rc7-82-g74910e15ab25, first fa=
il: v5.8-rc1-2-g861254d82649) =



platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
imx6q-var-dt6customboard     | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efconfig | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f08ac6cf73901c62785bb46

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-40=
-g4672a4a9fbfe/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var=
-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-40=
-g4672a4a9fbfe/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var=
-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f08ac6cf73901c=
62785bb4a
      new failure (last pass: v5.8-rc1-35-g65884065616f)
      4 lines* baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f08=
ac6cf73901c62785bb4b
      new failure (last pass: v5.8-rc1-35-g65884065616f)
      57 lines =



platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig =
         | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f08ac51f73901c62785bb22

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-40=
-g4672a4a9fbfe/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-=
libretech-ac.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/gpio-v5.8-2-40=
-g4672a4a9fbfe/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-=
libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f08ac51f73901c=
62785bb27
      new failure (last pass: v5.8-rc1-35-g65884065616f)
      2 lines =20
