Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA77285E08
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Oct 2020 13:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbgJGLWY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Oct 2020 07:22:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbgJGLWY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Oct 2020 07:22:24 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1675FC061755
        for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2020 04:22:24 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id j33so1180443pgj.5
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2020 04:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=unKTixtfb6Fcw6MadOOuOAZH7O818QGMIYT2MaWoe6I=;
        b=EC1VLpdlzV4UrG/bigKHcl3kz8fSumseltf8bUr7MmcQ5zidUTFjdoruss13Sp4QdB
         rb4ct8HgAxOpteDJHhoo8ItP+Q9caplPp6uWWRFOwAGTFRwDxguSvcZjOWLCKjC66CPF
         BBRv+uVFczbDRvJxjDpbirYn+ElqSUsdcW+OCF1bGu2qDd1uinbyA4OB6+OVHlhMb9Lf
         hL7r93MeS49N90wkcZSG/INujFtCuz3eTBmZfrDZ5c0jWSP2HUElXft579LXEJBOxTuN
         +dBRBJRkXJRld/MkLDbUzpUnhf3zFjnh2yAyqrHZBv8E/lcpOrYwsE3EJpqwPus9NvWw
         hyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=unKTixtfb6Fcw6MadOOuOAZH7O818QGMIYT2MaWoe6I=;
        b=cCTJ0lySXAwRN6fcqFrFKrKrWicm135yZFObZdl6y4dQJx2D0jVnoR2J+OdvMLhuBV
         Btd/kNmNs/gKkvv2avez92CErYRnFemYg33U3FkAWWLEWedeVoumlQCLPrWxQIQ3zyTg
         zyTgbztYAquqROPoxn91slYv2C4wlU/Y34zX0VZRiMVCZfIzhP9y9sFi0jnpSaF11QuZ
         tfIik5Sp6/4fzgkj9CYoXADbK2b+Hq2+OKSoQupo8+50z9CVn4G9VKBaifY4mjHvsAaI
         RA5cRHjOy4VmP6Dt3LudaZsXp0uRXqMsvcmp6JkxUJSHQRa5rOVaLmaNeQAw/huekpWc
         5DHQ==
X-Gm-Message-State: AOAM530LTa7LjxDiisCXo1J9dgVCzVZcM0xUFUDPFnaX0jVbKD+uIlrn
        3A1jlLTVsCdik0Cn0Xg5T97eIJ9bRyaoiA==
X-Google-Smtp-Source: ABdhPJym94/1QSHV1t0Nzmigw0KhJY/bS4BYQeszeee29mAEIp/c22mWi+/Jw/RrFCCZS1iiQ5Z7xA==
X-Received: by 2002:a63:5a0a:: with SMTP id o10mr2498637pgb.77.1602069742811;
        Wed, 07 Oct 2020 04:22:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y5sm3121811pge.62.2020.10.07.04.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 04:22:22 -0700 (PDT)
Message-ID: <5f7da4ee.1c69fb81.d6c4d.5c61@mx.google.com>
Date:   Wed, 07 Oct 2020 04:22:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.9-rc8-1-g47e538d86d57
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
Subject: linusw/fixes build: 6 builds: 0 failed, 6 passed,
 3 warnings (v5.9-rc8-1-g47e538d86d57)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes build: 6 builds: 0 failed, 6 passed, 3 warnings (v5.9-rc8-1-g4=
7e538d86d57)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.9-rc8-1-g47e538d86d57/

Tree: linusw
Branch: fixes
Git Describe: v5.9-rc8-1-g47e538d86d57
Git Commit: 47e538d86d5776ac8152146c3ed3d22326243190
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 6 unique architectures

Warnings Detected:

arc:

arm:
    multi_v7_defconfig (gcc-8): 3 warnings

i386:

mips:

riscv:

x86_64:


Warnings summary:

    1    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Fa=
iled prerequisite 'spi_bus_bridge'
    1    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (=
spi_bus_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for =
SPI bus
    1    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (=
spi_bus_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells f=
or SPI bus

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
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SP=
I bus
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI b=
us
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---
For more info write to <info@kernelci.org>
