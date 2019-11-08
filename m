Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7BE6F4E43
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2019 15:39:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbfKHOjS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Nov 2019 09:39:18 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40634 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbfKHOjS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Nov 2019 09:39:18 -0500
Received: by mail-wm1-f65.google.com with SMTP id f3so6456695wmc.5
        for <linux-gpio@vger.kernel.org>; Fri, 08 Nov 2019 06:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Sts/ciw8qcmEXytLknvIwDzunxYauek0OKi0Y9hW1tA=;
        b=Dd6dYrlPw87TC4EwSNUQsKW0oOsje3QJHZW0DE0Gl/U5e6H4WNDWWNnmukq5DIwngA
         ts5XFSWyHxxING2C1JFH4IxR1ywH+WMZ+zID0B/XCOFTwKT2AVLZvzXjvGZoXfafsyoN
         MS8Ow8tIlfNUnNCgNKTZU0qsVouKUkksHoZOnrjqdQ1/tdgBOo2AfihFCABhg0nn/nDr
         ZRHLrVOscHlYjUwTnp2aaG2cF2Lf00QqUP57p71Q+XfQQVdSuFMVqQyzoFQr7pYLMrFz
         3CAf2raiXLLisAx+fkpK1C1rBJE5S+j5VxOpu0Lxq3UgXScNeAZc5R02jCa/ItMKLT4Y
         ncvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Sts/ciw8qcmEXytLknvIwDzunxYauek0OKi0Y9hW1tA=;
        b=UDfG1JdisiTKG3CwhkOcbyE7kN9VBc7l1gNr8otGSTT4goc5OhmwOvUibz9Yn/MvFH
         LACChUZijx7JfmMbf6mANYxgvOF8ugSIkz/3thbvKks2OEnN9mzHVmzGrU59nwMNWi1P
         /5klJVntc2DKmPGEYtTPmg4HqHvn0GMZmzpV2k5VGUKrN3Jslky9PblMVelSseSuVcfj
         mxoNjh/dAdcNR1wvyQxxZaGiCMSSGt6sL+XaoRWp9qxYnjaRlEVLZjG29KsXvgpzgQzH
         9I9aab/edArLDr2208EyxSycJtZKSXgMFTocx6VoTk2j7OJH4Ik0nGL5W9+pK3jovhAv
         VAfQ==
X-Gm-Message-State: APjAAAX98kDemekoPXzicv1+fLYGYvl0lWiaUeoYtjorJrtCsRZYCZTG
        BZxQvd2sQT/DfMwWNqF6EFOw/Kgg6ZOF0w==
X-Google-Smtp-Source: APXvYqyzmL91SG+yM9QmZ4oHoByL7HXnVDtawTmqedfCVHUTd5H6t2l47eImbgZ/5K3RjxiJRy54Fg==
X-Received: by 2002:a05:600c:2253:: with SMTP id a19mr8575135wmm.97.1573223956248;
        Fri, 08 Nov 2019 06:39:16 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id b17sm6152772wrr.37.2019.11.08.06.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 06:39:15 -0800 (PST)
Message-ID: <5dc57e13.1c69fb81.d574f.0c17@mx.google.com>
Date:   Fri, 08 Nov 2019 06:39:15 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.4-rc6-44-g6b240aeb121e
Subject: linusw/for-next build: 6 builds: 0 failed, 6 passed,
 3 warnings (v5.4-rc6-44-g6b240aeb121e)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed, 3 warnings (v5.4-rc6-4=
4-g6b240aeb121e)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.4-rc6-44-g6b240aeb121e/

Tree: linusw
Branch: for-next
Git Describe: v5.4-rc6-44-g6b240aeb121e
Git Commit: 6b240aeb121ec14a528a58413baa9a74f8749604
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 6 unique architectures

Warnings Detected:

arc:
    nsim_hs_defconfig (gcc-8): 2 warnings

arm64:

arm:
    multi_v7_defconfig (gcc-8): 1 warning

mips:

riscv:

x86_64:


Warnings summary:

    2    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    1    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---
For more info write to <info@kernelci.org>
