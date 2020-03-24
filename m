Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C698E191BDD
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2020 22:20:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727023AbgCXVU6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Mar 2020 17:20:58 -0400
Received: from mail-pf1-f172.google.com ([209.85.210.172]:46121 "EHLO
        mail-pf1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbgCXVU6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Mar 2020 17:20:58 -0400
Received: by mail-pf1-f172.google.com with SMTP id q3so5427724pff.13
        for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2020 14:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=fpipqrUsv6qxgPK2OUyj1AuneK63BPI/WAsD6+oOOmg=;
        b=dYWY1VvDf1+NmEQevAE7/Yfxmu0js9LknhHTzRCtkNtn91Oqn1fUzqqDo46bABYBj5
         nIf1XcltfA3ed8q8o18NH2gydc0foHX0StfZ+sWxHimNjlTsHQOjWc3Uel+EuPz2lGP5
         jXTZ8YrOFnhvNoUKE2g6mJ8ho21IgfWceaUDaqsU68jo2ud+T7BeUXakEP0qxaJFCyX1
         sDLM17+HfbANby02p6KiLc26r/szgeQKC99/Olebh5RcgMbFrx4Asg0rZ8cdgzipE2S7
         nB8g1eVR+CUo0KnPRzY3ltjOMMpsodN6YIEXEbDTAMPhvQFJgBB7My107JzAS/mxNQx0
         HGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=fpipqrUsv6qxgPK2OUyj1AuneK63BPI/WAsD6+oOOmg=;
        b=moywPbIvAxUFdzjK/eBFnAp7u3T77vdr+mv2IpqeHqCxSb1y/ru1ADhJBfmpKn8nCZ
         d0mfWCNLSyI5+EMQlmSayXEyKamgVxXCodlshuWE8RUSzTAoDvsSLgiJBMBsGJMR+HTy
         iUl+aQpTiATAKOibkZQWMddmDdymSuQMCvEHzEUZPimHRRSGM4sY4DddzWNRjglSdHjn
         /pex0tpCgc8bSCLr4A6KeEYupGaf26AO1X7V1Xmo6QTcp/TLG+ksh2QBSqdt7nbuyKAS
         k22ocV+1eTxMCbWH+IIbEJlKlVjOFguUepWBA8H0yPUVnwtb5EAkLH3mW3xZcEqFPDRD
         Yd2w==
X-Gm-Message-State: ANhLgQ37BrLH/xjR1BVATJGsCemaueWrLDziMA/Z7ejt/mYCT0AzPOgv
        0DGyh5nonsBvbxzQykSG4g680CYnrEg=
X-Google-Smtp-Source: ADFU+vsQkJ9I6Epy97IUJmyv4zsUvi/P+2VhH0sNqdCviRorsUNqsNDoDkIDFsiuDGja/O8Su+Lfeg==
X-Received: by 2002:a65:4249:: with SMTP id d9mr8539521pgq.198.1585084857226;
        Tue, 24 Mar 2020 14:20:57 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x189sm16903163pfb.1.2020.03.24.14.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 14:20:56 -0700 (PDT)
Message-ID: <5e7a79b8.1c69fb81.7c261.01b8@mx.google.com>
Date:   Tue, 24 Mar 2020 14:20:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.6-rc1-32-ga28e1c0505a0
X-Kernelci-Report-Type: build
Subject: linusw/devel build: 6 builds: 0 failed,
 6 passed (v5.6-rc1-32-ga28e1c0505a0)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed (v5.6-rc1-32-ga28e1c0505a0)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.6-rc1-32-ga28e1c0505a0/

Tree: linusw
Branch: devel
Git Describe: v5.6-rc1-32-ga28e1c0505a0
Git Commit: a28e1c0505a09c3a2d81fed1c8453ac2d8d02b3a
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 6 unique architectures

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
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---
For more info write to <info@kernelci.org>
