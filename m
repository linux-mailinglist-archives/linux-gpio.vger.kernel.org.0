Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C01CC1DDABF
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2020 01:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730716AbgEUXHg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 May 2020 19:07:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730711AbgEUXHg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 May 2020 19:07:36 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D3ADC061A0E
        for <linux-gpio@vger.kernel.org>; Thu, 21 May 2020 16:07:36 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 23so4240036pfy.8
        for <linux-gpio@vger.kernel.org>; Thu, 21 May 2020 16:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=IckrymgMxFswcU7cpR2/nCJ1ELWlO+qr7YT9wUJqHlU=;
        b=w59lrxAMhCsaoNxeZaJ/k55fMdm3cL0dQIr4i8yaomHj6J4Q3X041TPxbrUjPed/Ms
         0NdeyiUotVIe037Yp8R6B9anxnNVl/2frCgtd47EgYc0QnndOvyUSurKLixm+93YvtCp
         r/t3FM9kgIbrUJ+hzC5h7UUtniAbnRBDUAkmajzurpJppeGZ+0aKeD/bmgeqB2qIUHjJ
         3pzHx7BNnQqKuhdF5JU6LzzfZdaypmb3NTqpIlc2ve0j98WG+XjaB2DmCLmHnrqowydg
         8b9GKWa2qiwCZHx0kabgandnkqWOfdcbhAujPPx9XUygLuIJcUCSVHwAN7ZIYyGWJ/hA
         +pBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=IckrymgMxFswcU7cpR2/nCJ1ELWlO+qr7YT9wUJqHlU=;
        b=MPmkHCOhB5COmtiGNead4Heu9y6g5npGG3WSgPSXIem/K56MTJaMERadF6HIUABRnc
         z68Yv9jkPkehtdLd0IawTj2QqGLvI5RGkmnoyM1q+2fLuISL2RyHXYaFKe7nlazYJSr1
         Eq5LfuSZ3wIUS3zgd4oYemhIheThpFtIFK3StwAFULoAk74u53NSCDBTAEL4Cn+uaVde
         4mXcdsscGGtGJT8nqP6yZUw3IEKz4c2v6EcTZvHBLh/MyEj7CUM5tope835TFF4IRRUL
         chndARugGzA5wjzZ+iHPKPjGPaoQcBdaORjTuP/XSLbMW9u+9Oj+FUrgrxGYMBOErlf0
         5LiA==
X-Gm-Message-State: AOAM530wmPGrW7adjJBMC0Ug7vUaEqThs503IWWE4WeqCaiqWXwb6pVf
        NZXQZnV62mmX2NJiAm6f/BMNLRhLWbg=
X-Google-Smtp-Source: ABdhPJzlG8g5bkQajWz3MqpdSM6fuzjqb4gLNPXTacPhaAj2qMU12GGDvnSAyloUhC//c3hVmGAM0w==
X-Received: by 2002:a63:d148:: with SMTP id c8mr10752242pgj.51.1590102455605;
        Thu, 21 May 2020 16:07:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k4sm4742961pgg.88.2020.05.21.16.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 16:07:34 -0700 (PDT)
Message-ID: <5ec709b6.1c69fb81.9a1f5.8205@mx.google.com>
Date:   Thu, 21 May 2020 16:07:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.7-rc1-64-ga0d50aa9350a
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: devel
Subject: linusw/devel boot: 47 boots: 2 failed,
 45 passed (v5.7-rc1-64-ga0d50aa9350a)
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
https://kernelci.org/test/job/linusw/branch/devel/kernel/v5.7-rc1-64-ga0d50=
aa9350a/plan/baseline/

---------------------------------------------------------------------------=
----

linusw/devel boot: 47 boots: 2 failed, 45 passed (v5.7-rc1-64-ga0d50aa9350a)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.7-rc1-64-ga0d50aa9350a/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.7-rc1-64-ga0d50aa9350a/

Tree: linusw
Branch: devel
Git Describe: v5.7-rc1-64-ga0d50aa9350a
Git Commit: a0d50aa9350a02d8fe6adb95c6daa738318d6140
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 44 unique boards, 14 SoC families, 2 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 98 days (last pass: gpio-v5.5-4-=
45-gd18fddff061d - first fail: v5.6-rc1-12-gb2929a9cb2fb)

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: v5.6-rc7-64-g4ed7d7dd48=
90)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab

---
For more info write to <info@kernelci.org>
