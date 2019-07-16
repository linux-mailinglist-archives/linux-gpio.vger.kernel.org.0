Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAB486A897
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2019 14:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbfGPMWf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jul 2019 08:22:35 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]:42421 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726997AbfGPMWf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jul 2019 08:22:35 -0400
Received: by mail-wr1-f47.google.com with SMTP id x1so5715194wrr.9
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jul 2019 05:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=nDztS4F0OBoxryGDm574L19AT2NrqIOk3zoHqZe83Go=;
        b=qeFASR5nz5NbfOGPSq2wmT+mJ0OE9kews4dYBDDlqRYNNjRt9smlpBdDcJRcMZsh+P
         Ds2CRkLVT2YZC3k+9w6FZIgACYSY2n22aY4jwu5BjUzwGmNtF9Zf9ZTlgAOY8L2guEcy
         gr4hPyrhqfTnlOhAmE+1xGawMKBCK/MQZFT2OXNIKDpGj60/GubnrVGxdFL9iOwosda9
         XWQ7Nj01SM5RdVb50crLO1YgfNwUJpcqGxcZ2tMkRxmSHcnpvJiHhdKDelDPqHv7MsZT
         WPIYFMv6x/nDk45nQqvDu4TeXZkdOe3R4z1clkshwa+2Sw8yRYJPl3YVk5oMl1Y3KUCN
         2BDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=nDztS4F0OBoxryGDm574L19AT2NrqIOk3zoHqZe83Go=;
        b=DcEyV7oZvHZRSpevNEV9ACki/KKI/Y/MaQRe17TnU6YiARSDwuOrHHnCGq2WxkhpFG
         37sYo082cT0Uirv3PO3utprOAgg+rwzSeRNcTV35z2kIsw8MquURAe3F48qy6fjeAs4A
         A2ZorGuOE5s0D9bdPQfuEh02r5sTrDtAMwYy2KJ8fJXreEsWGHZBOZkzHyW+MGvm7hR4
         a1ryv9ExKzAJbYr9OnsA1Ftu/ZtdLw317tiQ4+3Yvzu+3o2Z9fVEUYfRiCrnbWh4ThCQ
         ci3uaA2O4kDFkdBpjgdRDcEsJRdeJxaWyNuKVYxuwlIMtBiEPXYyjT5felesRgK0+F9O
         niRg==
X-Gm-Message-State: APjAAAUPsljxKQzvG8sVZZlkH3YN/1Op+6/ER6nNRZnjhxUTJENPx48o
        Z6OZ99D4qBuVvCiYW2RfS1gJ/QJTtWU=
X-Google-Smtp-Source: APXvYqz+IDKRHXzVqMOTmRzNAnKf1WxvcOJ79YtOytgB+Bpv4d0gxMJv0NtX8pmZRz6yreQ7FDGf6g==
X-Received: by 2002:adf:fa42:: with SMTP id y2mr16045916wrr.170.1563279753142;
        Tue, 16 Jul 2019 05:22:33 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id p12sm16638809wrt.13.2019.07.16.05.22.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 05:22:32 -0700 (PDT)
Message-ID: <5d2dc188.1c69fb81.3c153.b718@mx.google.com>
Date:   Tue, 16 Jul 2019 05:22:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.2-10809-g1507704f1e98
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel build: 6 builds: 0 failed, 6 passed,
 3 warnings (v5.2-10809-g1507704f1e98)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed, 3 warnings (v5.2-10809-g1=
507704f1e98)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.2-10809-g1507704f1e98/

Tree: linusw
Branch: devel
Git Describe: v5.2-10809-g1507704f1e98
Git Commit: 1507704f1e980da91f3888ba35e4c6d34e2f9e16
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 6 unique architectures

Warnings Detected:

arc:

arm64:

arm:

mips:
    32r2el_defconfig (gcc-8): 3 warnings

riscv:

x86_64:


Warnings summary:

    3    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---
For more info write to <info@kernelci.org>
