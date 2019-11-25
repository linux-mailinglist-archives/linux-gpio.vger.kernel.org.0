Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6888B108D55
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2019 12:56:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727218AbfKYL4V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Nov 2019 06:56:21 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33505 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbfKYL4U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Nov 2019 06:56:20 -0500
Received: by mail-wm1-f68.google.com with SMTP id t26so12100468wmi.0
        for <linux-gpio@vger.kernel.org>; Mon, 25 Nov 2019 03:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+qOMe9sTUP7181N92BZiAfKQN+cPH9PP3d/sG49N4E4=;
        b=0C3dib9MyLPJrHddwjYrZ+uK1j6/b7Ezyrc4c2A0ZksPQS1jSBxEF2IF2NPInxLlQM
         OEah0EEBnS98JZ+tjShaCOPHC3ow4AR6DGR5FLxivG2R5cMU2d5N1dgczVm4Xo9CeVfu
         iavl6fdyXaeDm1kwE1NEl6s9k06+ChUI5mxdU0UdJF4LOhixHXbMlKBW+hGHG3Unu8jK
         5ujQlzIM1yFNM4nRXQ/QtNwZhspWupoTiN+TYwcAGq0H/cObsZkOiO61b8H3ncfhMd2U
         NcRAbSX+0s4AvABvVcgFpq30VktDKfkA2hJFjGbjddZJl55X1anJ1NQuWcmUYJTyIYSM
         9OmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+qOMe9sTUP7181N92BZiAfKQN+cPH9PP3d/sG49N4E4=;
        b=kDUQXQEhXBjfv3VDs98WFHUjb8HC9Z6X54yXCHHIUGpWqTKRQxi9iS5Y9sFK/B2zt0
         GodvFzyh1bW+lb6ZbwINoOgXakdchnJry9Pv1pMqrkNCXKIYhCKJdF2aKE4kGr3IUvfr
         IN8DW6zrT0yDIZ31iU2HlPr52iCyELIIQ3j1Eovk2zTuKKAJOZBB63F6wKHoL+XSXZtV
         1j70FIEeia5Z+KMkpHp72lah3JxIlEzKtJQsPUFtqC2OWiPLZ94iHXD0kzw5yEOd0Uqk
         pmW5F3P66l79rRp72Ap4QPLwCU64vcbHdf6iyBAVbcYqTimvRQp5mzNgul4bp5RUoO1r
         eJkQ==
X-Gm-Message-State: APjAAAX2PUCs/uNxDoV3GaW9vrMn/OxYca/C4ekEqjts/pitOWu5S+GW
        tXC2WcFx7120esBQnA95QRM8UneMsdDrxg==
X-Google-Smtp-Source: APXvYqwWITsh/6PLFYSm4VxRvO5VAaIe4rKYzEOq8ih5qc15AX2uJ2kFIAU6wtjn63jUWoODJs+5cw==
X-Received: by 2002:a7b:c632:: with SMTP id p18mr28447206wmk.73.1574682979050;
        Mon, 25 Nov 2019 03:56:19 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id w4sm10148480wrs.1.2019.11.25.03.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 03:56:18 -0800 (PST)
Message-ID: <5ddbc162.1c69fb81.90b33.29bb@mx.google.com>
Date:   Mon, 25 Nov 2019 03:56:18 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.4-rc6-133-g41c4616bb81f
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
X-Kernelci-Report-Type: build
Subject: linusw/for-next build: 6 builds: 0 failed, 6 passed,
 3 warnings (v5.4-rc6-133-g41c4616bb81f)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed, 3 warnings (v5.4-rc6-1=
33-g41c4616bb81f)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.4-rc6-133-g41c4616bb81f/

Tree: linusw
Branch: for-next
Git Describe: v5.4-rc6-133-g41c4616bb81f
Git Commit: 41c4616bb81ff9b2efd981453f2c5d8f57d0c0b8
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
