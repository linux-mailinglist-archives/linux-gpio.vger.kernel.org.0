Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1267C2D4500
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 16:03:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727983AbgLIPC7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 10:02:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbgLIPC7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 10:02:59 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40792C0613CF
        for <linux-gpio@vger.kernel.org>; Wed,  9 Dec 2020 07:02:19 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id g18so1369366pgk.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2020 07:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=FkY4yGCdZ00vq7R7IdP52ZuIiD7Gt1YidSBA0pQiOe0=;
        b=RIOSsGI6pnx9lG89DVk4EOexxgxQVRnrd+fpzuUvxInrAuGlP56xLYsGYONsE+T7rc
         CpvLoGkmjaWyOZf9ETnv5eFd2xNI4jPdi+ByLGSJzuL2N+HCmxnDN0V/cpbkOjB1nlnP
         nl+UT/flM9CmFPT3gQciCvAyvuK0vp0bmtIK6oMaMgIbjkprPi6ZPhRZelQQOiAURFp2
         X7fLYYF+1LRTVeDbo/Akxm91+zFM5Nkx2jTdZmBy6VBnD6K2jcQbw9Ce3kE88jdN/oty
         32b7r5k+ykIxnhoja4BkcPnUJvMnKef4T+JjYWx8P6wxCbVrHakGXjrs9bC2UTWilvgz
         E/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=FkY4yGCdZ00vq7R7IdP52ZuIiD7Gt1YidSBA0pQiOe0=;
        b=VbYDcPYsXbBTwz1MTH9ploICJSLBi+uUTmyxo6J3tfr8af81xiJsNIG4RZm40yxSX2
         GDe4tiUEV7pXhCmHfjxR9LJGYx/3Fva2LS8xwkMo/4aq37xne7ST/oBFqBPyQDz8sDI9
         VSxEZTS6To0i2FNCGKP5BzFN3pZo1ceWfimhEGRniwR9yX3to7Bwta7N8knBJmHOiHss
         KcYvFZJT4qtHwFLQtSRMqL+AATdj8KOV/PeXW4UnsAWpVryweMq1RjPKKT8xC8V7LLxK
         prrRIrHcW9uZqr+/xucUqM4nhA9MRgWpQC93PNlV6A33TL3AeQxpaHP+ZcETCbYPX6cV
         Y3Xg==
X-Gm-Message-State: AOAM530udC87YNR6eRoql51Im39wJjy19vFSEJ98nmBzAZv6/yhjTNkN
        AK9UEg5H/ryPmjBJYwh5pjRsKNTDeOsqFg==
X-Google-Smtp-Source: ABdhPJzQ+KS3N3xJYDxmVPAoAQOyvAzvQiy/pzmCtKJ9mkhvMNUgG+QowKNNlD1NFZBvtPtS/4JbGw==
X-Received: by 2002:a63:db41:: with SMTP id x1mr2355856pgi.446.1607526137835;
        Wed, 09 Dec 2020 07:02:17 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w11sm3018637pfi.162.2020.12.09.07.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 07:02:17 -0800 (PST)
Message-ID: <5fd0e6f9.1c69fb81.ba463.57a0@mx.google.com>
Date:   Wed, 09 Dec 2020 07:02:17 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.10-rc6-7-g263ade7166a2e
X-Kernelci-Report-Type: build
Subject: linusw/fixes build: 7 builds: 0 failed, 7 passed,
 3 warnings (v5.10-rc6-7-g263ade7166a2e)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes build: 7 builds: 0 failed, 7 passed, 3 warnings (v5.10-rc6-7-g=
263ade7166a2e)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.10-rc6-7-g263ade7166a2e/

Tree: linusw
Branch: fixes
Git Describe: v5.10-rc6-7-g263ade7166a2e
Git Commit: 263ade7166a2e589c5b605272690c155c0637dcb
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
