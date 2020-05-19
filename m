Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 099C71D972E
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2020 15:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728821AbgESNJl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 May 2020 09:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728818AbgESNJl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 May 2020 09:09:41 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC19EC08C5C0
        for <linux-gpio@vger.kernel.org>; Tue, 19 May 2020 06:09:39 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id j21so6366097pgb.7
        for <linux-gpio@vger.kernel.org>; Tue, 19 May 2020 06:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=l8Rkl0mneQHUoj1YuCY0F16z2UA8Qf72ZIYuviDCb60=;
        b=VvT/vm9zR4CZnFyv3vUt7nX3SyOtGJfXFT/A0n+10mw/M3KqugBYfIAVWyfQurDFU+
         bLxM0FgTdeIqpr0ZJ4/TcxgPiAlNoMTv7+4fgIbBbny4liUWgc7TC6xn1aS3kYP3Mckn
         eMsdSOj+++ky+R4e9eqHypEqZvdXS9srVAOZlgoCDk9cfqpwvWPJEsg/CYgLxbpUUZSu
         ZI0bn2NhHsY2OIUCaVcJKwFov6+z0MFEX4pqoquhVqFVRXKNT/GtiRvaC2B+1CD2de8v
         JexgrhQhY3nubZV4Pitr7IdLCd4+C74smdT30M16fhFqB05uv/O8MSuuGruKdpBkzqYf
         z3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=l8Rkl0mneQHUoj1YuCY0F16z2UA8Qf72ZIYuviDCb60=;
        b=MAqebVsyERNeccfsB4rp/IaNpMl1QmqVreJJbLnl6W0yiCRc2HlUyILfBARazDtfzp
         AHBCnMySTO9XrNjNzg9kGSxjCm+jaZVPoH+Ch4jRrSlCYbn8luh7CgJTl1XAyP23hoxR
         NU4O77Nnpi9tcm+l6LCQ4oAVWrFiaE+ad6TsX7CAi7EKlJKfCFr9HJ1MT6hD3Wbe3ODH
         /frWV/gFe2eYeCO1fCpoZ49VEv31fLCBzeDw23CPI6BF2Ri2Pt19CdkEKm3ayIQL2aMY
         6rFaAtWeFXDv217M+87oybcggDA0vBQA6xm1+VjEVckHUFEEosoaBm3UgSUyPoY9+Ez9
         iMaw==
X-Gm-Message-State: AOAM533GCs6sTVkWfOmMBGrgtBeGi+mzguD+GlfpU5icNQ/pJvs/F8fT
        h87IaJ1ByC6UYvmkxjDLEUynKX6STy8=
X-Google-Smtp-Source: ABdhPJwQDkPZlwXjJuWF7QX1UaBTIdjTPh7zuF7El4Z3/tmPo3dPP0GEHDMpuS3daZPvYWgv4cK98w==
X-Received: by 2002:a63:e010:: with SMTP id e16mr18671033pgh.283.1589893778807;
        Tue, 19 May 2020 06:09:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a2sm11311062pfi.208.2020.05.19.06.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 06:09:37 -0700 (PDT)
Message-ID: <5ec3da91.1c69fb81.bb271.3cd1@mx.google.com>
Date:   Tue, 19 May 2020 06:09:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.7-rc6-69-ga3bc02eb6fe3
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: for-next
Subject: linusw/for-next boot: 40 boots: 1 failed,
 39 passed (v5.7-rc6-69-ga3bc02eb6fe3)
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
https://kernelci.org/test/job/linusw/branch/for-next/kernel/v5.7-rc6-69-ga3=
bc02eb6fe3/plan/baseline/

---------------------------------------------------------------------------=
----

linusw/for-next boot: 40 boots: 1 failed, 39 passed (v5.7-rc6-69-ga3bc02eb6=
fe3)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.7-rc6-69-ga3bc02eb6fe3/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.7-rc6-69-ga3bc02eb6fe3/

Tree: linusw
Branch: for-next
Git Describe: v5.7-rc6-69-ga3bc02eb6fe3
Git Commit: a3bc02eb6fe3a86e4157815b86f243fb6bb6e2d0
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 40 unique boards, 12 SoC families, 2 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: gpio-v5.7-2-52-gccec57d=
2a1fb)

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

---
For more info write to <info@kernelci.org>
