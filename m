Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 115982CFFD7
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Dec 2020 00:59:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725784AbgLEX6o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Dec 2020 18:58:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725270AbgLEX6n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Dec 2020 18:58:43 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1338C0613CF
        for <linux-gpio@vger.kernel.org>; Sat,  5 Dec 2020 15:58:03 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id t8so6449245pfg.8
        for <linux-gpio@vger.kernel.org>; Sat, 05 Dec 2020 15:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=DS3buvbeNHHkICjZc02P4cofC8kIeZEHV+7G8sXQW+c=;
        b=kScKLf7/2tPB6j/lNwBkdIPgplhze2OyyTSVIQjGtqkqpLa6jUkzn8iqxot8iZ+nVU
         bOeitJ5oSSiadBzpvatylrScRchIOMO6kCPNLV1P2qQ0GWjvsuyFSHccC2g7GmNjYeuQ
         x1HvD8oVLqkc77XWxEPz5K/iMv0D99DlJ0+pOtr9jSTvDGFJvArGVMKiz71FIcAQZzNI
         FM4ga3KXgupzR9GMvp00dabjDJXDvnBgIcKnvuo3pat2YXZhiH04FhlnItPzS7a5fTlH
         +PdoOAunQff5n7TxgeVhlCGFUuTMmtngxDID4WzmBXc14dp7Gu3A24be6ylpBxATEyy4
         LX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=DS3buvbeNHHkICjZc02P4cofC8kIeZEHV+7G8sXQW+c=;
        b=CEbjDsNsFn85oTHxDngWrvIp1CwZcQopBBNhRjxYCT92ASScTm+TLW/2cdVeQI56ro
         yh48+vW1M5joE8fOh2XvMDeVedvLQgebOnmnmGAfumhT2PiW4tyGz0jE6Pe9+yVfhPoR
         3d/HTXH7cWPW/U+/HtyWtTREfJ9NXPBKEZC8mZOSQf/F1WlXCpL7FqqfTBfnSr2vKoBh
         TX8UlkwlplIMKKzRkNr1a0xcnANhWcICLZ4D+6TmF6KPYWaSvgO6vR0FmE7WQXmYcABV
         IXqM3JAFVqqLLievi1VrAUqF13C9ZZw+fQdkaNlVeSSkNTv2I0fpbSXqAME5NYyEiWrd
         2i3g==
X-Gm-Message-State: AOAM531gzh2AxZNuD4PfG3z3qfY5vsWlFqr6WPtuEuvlLdArNzlK/rPB
        iCfoUZsLQxTa+BvaYsGyEHobcVt6mxKgBw==
X-Google-Smtp-Source: ABdhPJwpbn3eRMSRr7KIyrk7fWu28bcf9WNabq82yZZFcohNwhyh9dO3NAfQEEOkH2KLZ1bl3k2krQ==
X-Received: by 2002:a65:6118:: with SMTP id z24mr13242404pgu.191.1607212682655;
        Sat, 05 Dec 2020 15:58:02 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id fh17sm2942785pjb.15.2020.12.05.15.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Dec 2020 15:58:01 -0800 (PST)
Message-ID: <5fcc1e89.1c69fb81.1d006.5c1c@mx.google.com>
Date:   Sat, 05 Dec 2020 15:58:01 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.10-rc6-6-g77c12bf38394
X-Kernelci-Report-Type: build
Subject: linusw/fixes build: 7 builds: 0 failed, 7 passed,
 3 warnings (v5.10-rc6-6-g77c12bf38394)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes build: 7 builds: 0 failed, 7 passed, 3 warnings (v5.10-rc6-6-g=
77c12bf38394)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.10-rc6-6-g77c12bf38394/

Tree: linusw
Branch: fixes
Git Describe: v5.10-rc6-6-g77c12bf38394
Git Commit: 77c12bf3839479c3963433043e2051d738f3ab63
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 7 unique architectures

Warnings Detected:

arc:

arm64:

arm:
    multi_v7_defconfig (gcc-8): 3 warnings

i386:

mips:

riscv:

x86_64:


Warnings summary:

    1    arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge)=
: /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI bus
    1    arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge)=
: /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SPI bus
    1    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Fa=
iled prerequisite 'spi_bus_bridge'

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
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge): /so=
c/apb@d4000000/spi@d4037000: incorrect #address-cells for SPI bus
    arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge): /so=
c/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI bus
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---
For more info write to <info@kernelci.org>
