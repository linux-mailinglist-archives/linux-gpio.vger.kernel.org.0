Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC4A2EA94F
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jan 2021 12:01:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729070AbhAELA2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jan 2021 06:00:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728507AbhAELA0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2021 06:00:26 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E34CC061574
        for <linux-gpio@vger.kernel.org>; Tue,  5 Jan 2021 02:59:46 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id be12so16182986plb.4
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jan 2021 02:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Xj7xyEEL5xQhOJzGkQubdAYAQK9621uveFYMmmOP4gg=;
        b=nqHGnV0fFiRq8WK9e/DLwclbzKVPg9A7k/8XmvVL3RYT++CvWsdelFwsp6fh01rAiG
         8HMb4aX5o1Pk6ZBEbsG3yWR7r3GqwRnM6uwD0Eq+ienuyjXhaQcOafcgmC8g76AMWGDk
         k1xXwUj+XZHGiuyTD2n2XL1yzb9XS5ow8lY/LdRtjdwU7+oMP9mYhmcIjZxp+XLVmeao
         CD9fKdhm/rk+wsz8S354piLtVh+ZemJqTDFmdXhrQPiJtKUC0V2aeij9lkyUKGB/Mg0T
         v/iw9LW+k4iyE/jhc8p23/lOfREx+kRcDbiAl6Tt6dQUr+cy063CG0hSwVh3P4f9EHOk
         Jv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Xj7xyEEL5xQhOJzGkQubdAYAQK9621uveFYMmmOP4gg=;
        b=Xa49T2m20PdEaY4qUBGvPmo8ZYHWFJI9rYoczlzkyvbkWVeVzY2Swr7mFtq0P6HZY5
         ly9/V0bIJsPJaJE238BvlFapwc22QrjOpgjN4SluyGWLZbYuMFSD/dHoy16kbap84M9R
         WVtDIy6Lb/kaslSmqpHl0m+SAERFnCxLAsR6KNly7jnAyaX/3gALbk5UOsP/UchhBv1z
         9O8Jr20NysV2GZjOLWyTJxj06BeVKhnkaO21NOgFVk/3LrJZqsQNfwc3tmpXdy8kh4wm
         v8zpReWyQFHSGHjvu9L+jyh9ipNvFmPvCa4cibqQYYyFa0ZwZDc8Ajb0Sv6Hx8Zyzkfm
         uURg==
X-Gm-Message-State: AOAM5331EJSrUURXBSsq+odU0qyHLq+uFNE3q237UZwldn7mfI64K8jE
        cwgm896PGx1vJIdPRU1ofD762vneFABJoQ==
X-Google-Smtp-Source: ABdhPJwaNpXQMHMCI4XYZa5krGP3pyCMgOFAkAE8IanjYC2fV6zeyukZfPv8OZapW1HedRDou75pUQ==
X-Received: by 2002:a17:902:d916:b029:da:3e9e:cd7c with SMTP id c22-20020a170902d916b02900da3e9ecd7cmr76862348plz.27.1609844385484;
        Tue, 05 Jan 2021 02:59:45 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u25sm58833901pfn.170.2021.01.05.02.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 02:59:44 -0800 (PST)
Message-ID: <5ff446a0.1c69fb81.80d20.7912@mx.google.com>
Date:   Tue, 05 Jan 2021 02:59:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.11-rc1
X-Kernelci-Report-Type: test
Subject: linusw/fixes baseline: 112 runs, 1 regressions (v5.11-rc1)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes baseline: 112 runs, 1 regressions (v5.11-rc1)

Regressions Summary
-------------------

platform   | arch | lab     | compiler | defconfig          | regressions
-----------+------+---------+----------+--------------------+------------
imx6sx-sdb | arm  | lab-nxp | gcc-8    | multi_v7_defconfig | 1          =


  Details:  https://kernelci.org/test/job/linusw/branch/fixes/kernel/v5.11-=
rc1/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   fixes
  Describe: v5.11-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      5c8fe583cce542aa0b84adc939ce85293de36e5e =



Test Regressions
---------------- =



platform   | arch | lab     | compiler | defconfig          | regressions
-----------+------+---------+----------+--------------------+------------
imx6sx-sdb | arm  | lab-nxp | gcc-8    | multi_v7_defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff43ce41d0603493cc94ceb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.11-rc1/arm/mul=
ti_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.11-rc1/arm/mul=
ti_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff43ce41d0603493cc94=
cec
        new failure (last pass: v5.10-rc6-7-g263ade7166a2e) =

 =20
