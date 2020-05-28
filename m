Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E39681E68AE
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2020 19:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405570AbgE1Rbc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 May 2020 13:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405041AbgE1Rbb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 May 2020 13:31:31 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04606C08C5C6
        for <linux-gpio@vger.kernel.org>; Thu, 28 May 2020 10:31:30 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id z15so2306828pjb.0
        for <linux-gpio@vger.kernel.org>; Thu, 28 May 2020 10:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ReyeOCJfQdyc89R5NjwbwWG9vvAV8BWcQuQUT60C0DA=;
        b=HFDosQ+VSeTV61nXaBgMxyJB9oCUxF3y6SpS/FZq3fanL81keYR7UgODp7Lj70xBbm
         zRkKKoVJrC9nw3gVdT0fP6oN1E3aLnIsKwBJndCUVmDoPenL/xQ1RXhLizzUmjK/oMeQ
         6p2vSv5O+QxO0mnxY/FKmT0Au3E6ytPsR9P37hdgJi4lIxtZMSccWIDV2C9Xi3jDgtTd
         MiaPEkFv7TwR9tnlw2gfMMRltfrOJzfJEvw1YoYyiDTowi6Y0hJjKUVGhl8/n6LaL+rs
         dJrF1U6w5JJoouK1z3auOGcF6P3p9V5+F7sch2RPVZMHB3aUIYlEqXdcP5OxgufJUylc
         PDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ReyeOCJfQdyc89R5NjwbwWG9vvAV8BWcQuQUT60C0DA=;
        b=BlZRaE8LMTbVKCjwpZgheO52Sxs4mebOUXcbAA5pZ/pWXQo7EqjSvx3vpcYv0VNNjs
         eYBXO8Xpg0BOIWUUI06Rp53vYoTKUO2lBySjG59mOVAX4rG29Dq18yub/yIFGOcMRUQP
         wOlza3a5q5vwiWZqypF4YsFTEhV5BfLYOGQqS4/kVGjylyzOYw905xywvVPgzuJroj5Y
         ri9fd7kte/+dnHU/ZcmXiTx7VEebVJIhq29Otdmi3n1St6qUu+LLmEWWah6NgxuyXeHg
         tJ1ZieVIdvVPssfnF2u+vFRECqTF2xhLNwf2ugWpAwzB68nCZqk6p88OVTI+NkAl4aHF
         mnQQ==
X-Gm-Message-State: AOAM531Mjqba0NY5smJMXv5vfSIBSeoEJ45gwe+9wuRaKw62LWmuYAwr
        6kqwCfhxSbFCwyoEpRCRfZJZYpsDkLY=
X-Google-Smtp-Source: ABdhPJzbf9UuoiFDKNSjImyKg+1bzSOsARvtkosLijgK8mL4AwRKHE3sXQ9sC4i8J+a3woAYNocGQA==
X-Received: by 2002:a17:90a:b001:: with SMTP id x1mr4775446pjq.1.1590687089251;
        Thu, 28 May 2020 10:31:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i10sm4916779pgq.36.2020.05.28.10.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 10:31:28 -0700 (PDT)
Message-ID: <5ecff570.1c69fb81.8d4c6.fe43@mx.google.com>
Date:   Thu, 28 May 2020 10:31:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.7-rc1-75-gf8af9113b1cf
Subject: linusw/devel boot: 55 boots: 2 failed,
 53 passed (v5.7-rc1-75-gf8af9113b1cf)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

******************************************
* WARNING: Boot tests are now deprecated *
******************************************

As kernelci.org is expanding its functional testing capabilities, the conce=
pt
of boot testing is now deprecated.  Boot results are scheduled to be droppe=
d on
*5th June 2020*.  The full schedule for boot tests deprecation is available=
 on
this GitHub issue: https://github.com/kernelci/kernelci-backend/issues/238

The new equivalent is the *baseline* test suite which also runs sanity chec=
ks
using dmesg and bootrr: https://github.com/kernelci/bootrr

See the *baseline results for this kernel revision* on this page:
https://kernelci.org/test/job/linusw/branch/devel/kernel/v5.7-rc1-75-gf8af9=
113b1cf/plan/baseline/

---------------------------------------------------------------------------=
----

linusw/devel boot: 55 boots: 2 failed, 53 passed (v5.7-rc1-75-gf8af9113b1cf)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.7-rc1-75-gf8af9113b1cf/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.7-rc1-75-gf8af9113b1cf/

Tree: linusw
Branch: devel
Git Describe: v5.7-rc1-75-gf8af9113b1cf
Git Commit: f8af9113b1cf71cd21b0a027d38b06c15989c789
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 48 unique boards, 14 SoC families, 3 builds out of 5

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 104 days (last pass: gpio-v5.5-4=
-45-gd18fddff061d - first fail: v5.6-rc1-12-gb2929a9cb2fb)

arm64:

    defconfig:
        gcc-8:
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: v5.7-rc1-71-g6f8cd24641=
15)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            meson-g12b-a311d-khadas-vim3: 1 failed lab

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

---
For more info write to <info@kernelci.org>
