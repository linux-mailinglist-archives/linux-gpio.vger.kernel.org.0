Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE39E2D454E
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 16:25:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729922AbgLIPY4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 10:24:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729919AbgLIPYx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 10:24:53 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C2F6C0611CB
        for <linux-gpio@vger.kernel.org>; Wed,  9 Dec 2020 07:23:37 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id m5so1117011pjv.5
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2020 07:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9CMLMimLJovUCP0rKQzWxvWIxJ2eSS66FfQkFxkJA0s=;
        b=eOhqEonpvZ0u3fA6mlPaJa/o3dDroOwutE9pe9dluOo4ziZklx1u+WKDyaACFlCmxG
         i2lZ6PBe9PzEcrKv9uEjEb5B9ovEOS+QjwSEc0NxpfkY/UN623lGzuyto0/6jCnCFyUO
         FbhW+ebAMZEbP49se/rrPhVU39lFNvecEerH796JejCEztGkdaoSQW3vabbwpnUOAQW3
         WLYDalbfuhKJu9F/CLLzez8p1uuuxxS1qWu+p9wNmBLksnSqEhEUa55flxIpSfRM8p5s
         XN7m/Mv8E9G/mb+Hf4Qp9UgR+qE9uhEy/fr8DATpJpdifhOJiwjqydVpmzAlUjhUilgH
         2lsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9CMLMimLJovUCP0rKQzWxvWIxJ2eSS66FfQkFxkJA0s=;
        b=Wvgfbq+/HBTHTN+LP2+tqTQkdVtuaiv2AqVD7A3LEZRu/yn0qOACQgqgMUYTMMdYhC
         9FX/HShH2FPhM0b1HnfMMxyhxps0nHP+0tPnXvoRuOA2eJyupqrqvnJmonUVIAdqgAzW
         3lPaZVS6v2kcsVZTzJErEMAbIZd4Fd45RwtyJ6ZrPteajInFOOi2PoUUmB9gyIhwvg0q
         +586Fiq3Y9r165wS2SFDAedmeHr4h5Pbez+NSLO9Af4PoWXmOztvLcPrxSirpCZr8cKD
         KqmltmyT8Lk70L/Z+B8RAYi2twb9QBU7BV6xsD94ZebW2mB5MaetO50DLWnysmipTabx
         UJzw==
X-Gm-Message-State: AOAM5317Gpy4uX86OYtJzTkd3rF2cV8iFdiBuAfuHrtDXDIwlm/eTkxf
        rTXjfUsSsImaaCqwUur3j2JDxXhMdvz2EA==
X-Google-Smtp-Source: ABdhPJyhoOTadaEdCPmD8XnaZy3dhkdkkiOXaFZWrn11aGDTlVrIydrMfauDbkE572sWN2X094uPhQ==
X-Received: by 2002:a17:90a:9f44:: with SMTP id q4mr2714074pjv.226.1607527416211;
        Wed, 09 Dec 2020 07:23:36 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id jz20sm2534746pjb.4.2020.12.09.07.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 07:23:35 -0800 (PST)
Message-ID: <5fd0ebf7.1c69fb81.e7993.48de@mx.google.com>
Date:   Wed, 09 Dec 2020 07:23:35 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.10-rc6-93-gb8fbfef1595c
X-Kernelci-Report-Type: build
Subject: linusw/for-next build: 7 builds: 0 failed, 7 passed,
 3 warnings (v5.10-rc6-93-gb8fbfef1595c)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 7 builds: 0 failed, 7 passed, 3 warnings (v5.10-rc6-=
93-gb8fbfef1595c)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.10-rc6-93-gb8fbfef1595c/

Tree: linusw
Branch: for-next
Git Describe: v5.10-rc6-93-gb8fbfef1595c
Git Commit: b8fbfef1595c2640e7e355532a3a855623ad2c60
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
