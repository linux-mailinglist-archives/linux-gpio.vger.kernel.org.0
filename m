Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 691CD6A8B0
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2019 14:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728190AbfGPM0h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jul 2019 08:26:37 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50862 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728121AbfGPM0h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jul 2019 08:26:37 -0400
Received: by mail-wm1-f67.google.com with SMTP id v15so18483939wml.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jul 2019 05:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=MT6D0mQ9O4ksCVHjDuRfIFki/ZNPXl7WHuPsJhQY0ag=;
        b=lnC47HwNDUm/PPYDa/tIEpw9sUhAuvhgDXpecPK5U4sW+v0iyeJOIrgWo9vmHQ0Swh
         v6wJwwWYyLg8uLbws2UJ38mbQBBUkKpvA44WGBN3/NRD6ewSH3yg9i2sjq9/zpJNdsM6
         TAzKpbEk1E9Bk6If59GEScOCxQ3ri09pVLJLDiIYmAhXD+tQon55h12JV4VAS4oRWl1d
         7hGDi3NOatSXmGK+36isl3NC8+cM8GGuRxVX9dahpCNMNQGRWy8/SLwk7GpcQpkl0e26
         hQ+JzZvlXolHDy0zPcqz7T39mvEEhknA71sCySoFE9B/bIZOdX/+1CaQHiKrXzXaKKt8
         BSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=MT6D0mQ9O4ksCVHjDuRfIFki/ZNPXl7WHuPsJhQY0ag=;
        b=d6OthvncCa+PftzPU5fphRBvIEJzD4w/5nAHsS7UiZroindGA55yaLga5+4HQIfF5L
         Q1lrQo/lWWv0rhQPRKu/oXj9mO9YuU+4Lqqn9atvtjFpox2nAqL3ouXd/oCCq5Dpigcw
         RGPZuKO6djtXTLn0KVZvhsaF9GPmMVNd4guOTdTukBkFfQth9osyR73Fzwf+nVydEWQn
         QpRZW6ArTSccAbxO0cnyVFCFAIhUdyRghTybdvGWUK+wNojDBmINX8upzltoth/xRJB5
         jROAAeahJgcPV8lXZ5MUC5iefTD/y0cPEZRaWTf3Wh1ODSWIgtBmcdSSzafQn1UUnR8M
         mB/A==
X-Gm-Message-State: APjAAAXLLzO93JGsjLuWnKfk8RYCUEqKJwyWo45+DUBnRpTpMqEa9IrC
        fcyCqq3dbgMjCvsyD/aLLe/Zcj+hw7c=
X-Google-Smtp-Source: APXvYqzr3t6EAOAGkMBc+qRFjXPrgAzjxEtVKLrzvTFyjNxjLW27EnDXUcSnEpQEprYYE9T0nPQMNA==
X-Received: by 2002:a7b:cc0c:: with SMTP id f12mr30078174wmh.100.1563279995321;
        Tue, 16 Jul 2019 05:26:35 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id v23sm17645966wmj.32.2019.07.16.05.26.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 05:26:34 -0700 (PDT)
Message-ID: <5d2dc27a.1c69fb81.ab46b.257f@mx.google.com>
Date:   Tue, 16 Jul 2019 05:26:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.2-10813-g88785b7fa74a
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next build: 6 builds: 0 failed, 6 passed,
 3 warnings (v5.2-10813-g88785b7fa74a)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed, 3 warnings (v5.2-10813=
-g88785b7fa74a)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.2-10813-g88785b7fa74a/

Tree: linusw
Branch: for-next
Git Describe: v5.2-10813-g88785b7fa74a
Git Commit: 88785b7fa74ae2dc52f879140b976984b5374c79
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
