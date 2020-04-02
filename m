Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BAFF19C670
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2020 17:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389542AbgDBPwK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Apr 2020 11:52:10 -0400
Received: from mail-pl1-f181.google.com ([209.85.214.181]:36104 "EHLO
        mail-pl1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389567AbgDBPwJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Apr 2020 11:52:09 -0400
Received: by mail-pl1-f181.google.com with SMTP id g2so1493383plo.3
        for <linux-gpio@vger.kernel.org>; Thu, 02 Apr 2020 08:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=opnXLd6D5a3fqZycTi0yiMOLNvDz8Dsrjq2o9euUNEo=;
        b=Boa+p1fbwVizTkfVEurWXWHfCIEgplP3L5Cco/MZ6W0hnjXSffpN7/wrpyQJSGMA3M
         JIUWxnOwBsjlf1S7SSWAIm0ITmajwcx1A/Hope3xwwRywVnwT6s7fdKh1tnnqYS3W4CV
         y23TSUkDZhUAxEiBtEc7nsZuoD1yrFPnsMlEb3FhbPq3i4mZR4tX7zDwd+TgSZcUBsVO
         OISyhqVtPh71AdIPVRZIye+RXN4MCLvr/19GChpW62PqpP1tUlyiyv4TcikgityTBGfT
         UOXp8SvDbnX9XiqCKvWHNDy1Uk0yrw+FOdyc27eX3ZwymYLprTPOd4bT9g+7TWxmGOK5
         oj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=opnXLd6D5a3fqZycTi0yiMOLNvDz8Dsrjq2o9euUNEo=;
        b=XqyCNL4x5ZKADKOPhdo+Yy3PMO6N3o3eq1IVQMc/GXB2FMSiblEUO0vKvurBrUAYr0
         URWDemgOzMZiXtmF+OK+gCPaqzbg8+LITfxKylHZ/lIsrdo84IUbQGxISLnScbqVJ4qU
         VXp7kj6rW5IY52S6cxXLT5xpmHQpQLL5fXL1E5Vz91JYYSQSoZvbcJ8rsdCitTsXUcNN
         kXrcI9UXW6UIBXwmT7jLU9dhwEaNfhuuouVTA8X2YBXGekQb6FBqsuvOO19h1AY8gIQ4
         678UVmh9eT7P66gJQdhIUmpsoqV50OwPuO2GJbF0MgVzZaGLIeiiQQiLaXKxKUuLY5O7
         Cdjw==
X-Gm-Message-State: AGi0PuZgEAWzOs+7lqkRabFoW5u0hd3DRvUR094cimAQ3q7e6EmSrpLX
        FvWt/JPPwq+YkTDGyTKVt0Ed7Qzx0b0=
X-Google-Smtp-Source: APiQypIZfIWvb0+P9/VFeKSSGY/a2+4UNWHAFyK81RPLWcaWVtD2MhLtUZxRuAlCfHbjXYTX5C5jzA==
X-Received: by 2002:a17:90a:b395:: with SMTP id e21mr4634651pjr.33.1585842727867;
        Thu, 02 Apr 2020 08:52:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id fa16sm3989715pjb.39.2020.04.02.08.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 08:52:07 -0700 (PDT)
Message-ID: <5e860a27.1c69fb81.faf4e.1ccd@mx.google.com>
Date:   Thu, 02 Apr 2020 08:52:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc7-64-g4ed7d7dd4890
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel build: 6 builds: 0 failed,
 6 passed (v5.6-rc7-64-g4ed7d7dd4890)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed (v5.6-rc7-64-g4ed7d7dd4890)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.6-rc7-64-g4ed7d7dd4890/

Tree: linusw
Branch: devel
Git Describe: v5.6-rc7-64-g4ed7d7dd4890
Git Commit: 4ed7d7dd4890bb8120a3e77c16191a695fdfcc5a
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
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
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
