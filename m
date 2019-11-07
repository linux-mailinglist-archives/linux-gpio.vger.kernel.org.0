Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86727F2F1C
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2019 14:22:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388368AbfKGNWm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Nov 2019 08:22:42 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45541 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730980AbfKGNWl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Nov 2019 08:22:41 -0500
Received: by mail-wr1-f68.google.com with SMTP id h3so2947392wrx.12
        for <linux-gpio@vger.kernel.org>; Thu, 07 Nov 2019 05:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=iclmcbsTsptninog0V4pkvY6UnTGE3C3Abd14MrTVuc=;
        b=V4uhPBLRU0aBWm750ms7ivDPi2rrWouCI3dIVaSwEWpWuUqvMShkEdlf18M7nWxoGO
         qAsDki0EPiSaGl+Xp3GFov72lYb0q39k8SljtpDkqPEvKuuvDifbgXUnghnqi5DXhbBO
         rrBk9kSqbA30D6hdmOrnZU4ZYsE8EnWVJNBy8XWoeqJnkPiYbez3MZtJs6JxHg6woJ5S
         sayYRcEOMG30C9U0RIjnzlrOfQQgbJkrEV45V33a7GsB2QK75ozvP4nRFGGkKBz3MTfS
         E5rt/Y998Ds50mBXQ4joqV8zhJ1XDJYCbczPzxI1Xhd07EKx8p4tmE3PV+I97p0mlgDI
         q8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=iclmcbsTsptninog0V4pkvY6UnTGE3C3Abd14MrTVuc=;
        b=MwGca+YzmsVBoGl7ZbC42LTSrbsUvFkabiVZgkKaGJaVF5usyvOnTZKJgNIERX5C1t
         6xm48DT/H1Y2nJBlMBFGm6Nj2vgzfJOE1J+wm/Xyg5WrR+hEnmNpKV1+k3kTa2JBjqxN
         YiZY/SybrBmU97niXC0ASav4m84he352419nd4bJqTLCRxKU5xPlqMSDY9RVfMZSmKM1
         pdbE/z7f3J5nIrrhQjQqOiQ8lhmvpzW1pAAnqyZY+x5bm11oHC32ttzllMAlok1TsahR
         BM5d8pXC6mv/P3B8bDh1LagQy32xFGnHkknrxPj+a11VYaB2fjUq1uemxD+W5WIndOVk
         xw3g==
X-Gm-Message-State: APjAAAUer/Gf8qziXTr3tH5uBn3ral60j/NIY+POe6TTLdGzWX4BJTNO
        mhqwaXCbxlzZzBDYIPdKemlWq9eZxR/C8Q==
X-Google-Smtp-Source: APXvYqwHOGuhoJwpvbXCTilag6CX0LMVa9Zz404lLgiRxhftrFDPiEM41Nnqbt/CmRD1eAjmNTas6w==
X-Received: by 2002:a5d:448a:: with SMTP id j10mr3072070wrq.79.1573132958165;
        Thu, 07 Nov 2019 05:22:38 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id s12sm2352060wme.20.2019.11.07.05.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 05:22:37 -0800 (PST)
Message-ID: <5dc41a9d.1c69fb81.efbc7.c22d@mx.google.com>
Date:   Thu, 07 Nov 2019 05:22:37 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.4-rc6-40-g39f4fc38d180
Subject: linusw/for-next build: 6 builds: 0 failed, 6 passed,
 3 warnings (v5.4-rc6-40-g39f4fc38d180)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed, 3 warnings (v5.4-rc6-4=
0-g39f4fc38d180)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.4-rc6-40-g39f4fc38d180/

Tree: linusw
Branch: for-next
Git Describe: v5.4-rc6-40-g39f4fc38d180
Git Commit: 39f4fc38d18072da3326a52f3d0922836987256f
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
