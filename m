Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A393A108D27
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2019 12:46:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727282AbfKYLqn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Nov 2019 06:46:43 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54168 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727237AbfKYLqn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Nov 2019 06:46:43 -0500
Received: by mail-wm1-f66.google.com with SMTP id u18so15119192wmc.3
        for <linux-gpio@vger.kernel.org>; Mon, 25 Nov 2019 03:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=SofJxK1Ug+c3r8cZONPRRxBArCGzN6PkhiCRwrgpvKE=;
        b=Z9i5A328I+iNnqQQU3wvRJxjyD7VtQwlRXjSMMjFWtcDftMH2cJkPh9/2oxBx/Ajep
         pThiizmSHc2B8FHoGkNORAPw3vzCWbqxm0fGeIogU4/E0SJezl1QAJPS0CwBK8KWHjDG
         IaGpm703K3HiHO8YdYAO5U8FCBaEd9JGAOpOoYhGUkXceBQa0u5bdiyZXlVBPlxTuyJw
         vnn//Ippseagqvo3jS+nRVkpY/Gc3npRs+56htjaHq5XHLyswLZG82ACMQfts/3hF6li
         ejCkgWkljR26j6kdoPTgFI0y+/BiWR2AVU9Vhtcgigc1tO0yRfPcLlktEGTCktWlCQWy
         J3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=SofJxK1Ug+c3r8cZONPRRxBArCGzN6PkhiCRwrgpvKE=;
        b=PS+lhXUfe6CfZXkRxBY/QkKtWju7pknJ/9p9kNgiTmGnvvbGSFwP8HhKk0tyOHZ1Dy
         JdAHO27C5tfAsUGhg5HlzA7j1eBOxZqIezWtouKtPAhwxorWsCN+5dxcAwtXT442YlvY
         9Ug10wbYZWmYEk9b0obJi96c+96hJzmISy/ia8zreFRXFIJS6xsYlSGoPMpdPlDueHXH
         xQa3lgE7KbZ8fxHzjX1lXEylv+PYwyU382UaG81Ym0M3vxeHwEi3dWTvrLhgnRYHl5X7
         eRQT2UqPQwRfDZQiaMm1glsB4TUPb14lKW85wBu7ADeUoShuRwJ64u5ti2TiaxJZL6te
         aLDA==
X-Gm-Message-State: APjAAAUTIh0lQUv0foptPadyyEWgYFKDcaJfPNnFpC8iZyMUyyfn+EqS
        1vGUvfqujREdFSXCpu+BINRjnbQbHqKqlQ==
X-Google-Smtp-Source: APXvYqwmCqacrAB0G0oCT2zgnhBp4HAsfGr9q9NEolo+ZE2/xTKJ8yf0RWVdH51UuQ5CJV4vfpkBSg==
X-Received: by 2002:a7b:c207:: with SMTP id x7mr23652781wmi.40.1574682401656;
        Mon, 25 Nov 2019 03:46:41 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id e16sm10166982wrj.80.2019.11.25.03.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 03:46:41 -0800 (PST)
Message-ID: <5ddbbf21.1c69fb81.b8e13.3722@mx.google.com>
Date:   Mon, 25 Nov 2019 03:46:41 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.4
X-Kernelci-Tree: linusw
X-Kernelci-Branch: fixes
X-Kernelci-Report-Type: build
Subject: linusw/fixes build: 6 builds: 0 failed, 6 passed, 3 warnings (v5.4)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes build: 6 builds: 0 failed, 6 passed, 3 warnings (v5.4)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.4/

Tree: linusw
Branch: fixes
Git Describe: v5.4
Git Commit: 219d54332a09e8d8741c1e1982f5eae56099de85
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
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
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
