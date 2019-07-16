Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1AC6A896
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2019 14:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728004AbfGPMWE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jul 2019 08:22:04 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45448 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727849AbfGPMWE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jul 2019 08:22:04 -0400
Received: by mail-wr1-f67.google.com with SMTP id f9so20687048wre.12
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jul 2019 05:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ZRSdW2cN+R1Be9ZRigjSZx1nMKmXOEdCWiPfgAM1x+s=;
        b=O10QgmDofGJhLKZAMnk2zD9Ok4MHQ1Xx40I7vP+xPInZm8NLwZqCgkGCMVgs7X7WGi
         vTB9dGistaMkQSkjNv3Hng97DxZ4ucS4ZbGDQj9sWGiro2+mHI4pLddeaI+4ma8IRMtN
         xBYH4ADQgXORwRxXOA66p8aNeRag9tvmYTClG5PIbuJQS9Hjt8q+lockL54qzYZgFIsj
         iRxu2gTYJXA1MHXHQTOdJb4n71kvovoKf3VyIGIZvX+iNMG/aC0fwamB6Crl28kSN7XI
         0KYHNF/gdUA0Awm3bmjkBwKEvxFy1DhKhug66a90eH/QM+CjinjzyWafo6rK5Yxkrx0B
         0+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ZRSdW2cN+R1Be9ZRigjSZx1nMKmXOEdCWiPfgAM1x+s=;
        b=O2CTyYpmSIqioZK4mjtRuY/zvteBsnr23f7IdWptzcY0i9GAvkV5904omjfU//Pewh
         Lfq81LSppSLnl0R4aCyTWFSZdWbZlYVxrUHWzoQhH81bG1xnY3z5JnJfeIxmTwk+2AdF
         GrvwIfBE1yEBDfF6tPIPhG/NzvWuspty4gJNrWLzyMchXff8fTc6hRD5+EegertRfTCQ
         +QwbMGUxjGV9h07DwXRV8EZDvuQpCHoy5dDp9BepnzyhFtLkbOPDtIAYqKxoC/tdvc1S
         KnmGt9M2pQ2vo8ZQrbiV+a8f+cv9PSfk15T6rdIoO/aabZQaIz8QxFKAna9p95AoiFN8
         ru8g==
X-Gm-Message-State: APjAAAXMOnvHeLn9thIBYBXyhHUSEEuJPClImi/ii/SKtaQojYRoFxx8
        wERHSUTEUS9yCiqIv+UGemhR4IW8OBM=
X-Google-Smtp-Source: APXvYqzTohz6BRqk0KGdLX4PrSaRhz7G4bfmwIo1cUgveqsUXCEthwx5A43vduGg2B256Wt4QCahYA==
X-Received: by 2002:a5d:69c4:: with SMTP id s4mr5107250wrw.163.1563279721849;
        Tue, 16 Jul 2019 05:22:01 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id g8sm18295665wmf.17.2019.07.16.05.22.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 05:22:01 -0700 (PDT)
Message-ID: <5d2dc169.1c69fb81.5c064.7b02@mx.google.com>
Date:   Tue, 16 Jul 2019 05:22:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.2-10813-g88785b7fa74a
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
X-Kernelci-Branch: fixes
Subject: linusw/fixes build: 6 builds: 0 failed, 6 passed,
 3 warnings (v5.2-10813-g88785b7fa74a)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes build: 6 builds: 0 failed, 6 passed, 3 warnings (v5.2-10813-g8=
8785b7fa74a)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.2-10813-g88785b7fa74a/

Tree: linusw
Branch: fixes
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
