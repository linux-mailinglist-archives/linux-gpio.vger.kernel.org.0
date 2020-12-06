Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 185A22D062B
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Dec 2020 18:03:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726981AbgLFRCi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Dec 2020 12:02:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726955AbgLFRCi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Dec 2020 12:02:38 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E9A4C0613D0
        for <linux-gpio@vger.kernel.org>; Sun,  6 Dec 2020 09:01:52 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id f9so6802995pfc.11
        for <linux-gpio@vger.kernel.org>; Sun, 06 Dec 2020 09:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=H9aYnB/+06yjRVeUYc3W8iuxxF92jSLS2R0UkJ46Gdk=;
        b=kwp0XqjQ+qI9sELRuLqqDSnXSQuw9PZP8CDnjlGcqiOGoJ4J6vyGHdi9ss0+XPi/7y
         +CT1ApXOrIBGPGNT4+y6ecSZ9522A5HDROdoI2QYQVG8lglMiCa7SLYzKaUVqguDbnwn
         pr45ZqJWleT2tm0q5OTxIujWWFoouQIamB8kUYzzNZdYoRKfHq9LEv5L0t3PgtNgsQbw
         4PbtPs/QR46hjFyTL44OVUA4QTGoZKbjwzWPiR98A3dhZY9QNTZGmDnoBgpeXsuRkILG
         rmkcnQFZ2AbCmSHTq5c0QnSDjnncVa8kwiyEJ8PSaRvhrxx+NvwG8p11bU9vIE7yMpXN
         ZGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=H9aYnB/+06yjRVeUYc3W8iuxxF92jSLS2R0UkJ46Gdk=;
        b=lWtbbwJaUEiLVyORJP78Uo8CD3uHc0keH0CN/EHGXyKt2Di+R2Jfzr6RDPF5yRf2KZ
         5lOQgDlDSnD0zDbfabeNehym7QH6dANB8Vd8ExXyS8RVXvavXkzLsdU5RPvLcCTv9aN2
         zO84CdseXasahzwk0Oq/3rEeQ07vkRzvsT/CvtMj4dgyI7UMbOI0TUjMqTEJCd4qmccD
         83Uqe50CFY2iDOEHCUq2Qswr30gpzicIL+DGLkA1g3I5khkOmA2rkYSIAOr8SKY8i+Nb
         gGhi6AKQld/C5dwp3yA9gEsxURj31qpioTEHA8UTmIChvmQ+bJzF1rFEPb8Ejuzq2wbx
         TQJA==
X-Gm-Message-State: AOAM5331JSuAcNRgeXnnlltKD/+G9/D8e+59vVEw1cf/maoVt/tutdmy
        /knfbJDTOomAcH7lG6Y5Y9eH0oyJWoh3dg==
X-Google-Smtp-Source: ABdhPJwlK/dcoIsTnNIh7yq1A6fL88upY92+TRpLuMtNekV+5rORdckrTv5apyXFE7UFY7Dau5WB1Q==
X-Received: by 2002:a62:e903:0:b029:19a:8fae:5c07 with SMTP id j3-20020a62e9030000b029019a8fae5c07mr12538926pfh.17.1607274111468;
        Sun, 06 Dec 2020 09:01:51 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c199sm296955pfb.108.2020.12.06.09.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Dec 2020 09:01:50 -0800 (PST)
Message-ID: <5fcd0e7e.1c69fb81.c938a.0ae0@mx.google.com>
Date:   Sun, 06 Dec 2020 09:01:50 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.10-rc6-55-g0f8d9ac8978b
X-Kernelci-Report-Type: build
Subject: linusw/for-next build: 7 builds: 0 failed, 7 passed,
 3 warnings (v5.10-rc6-55-g0f8d9ac8978b)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 7 builds: 0 failed, 7 passed, 3 warnings (v5.10-rc6-=
55-g0f8d9ac8978b)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.10-rc6-55-g0f8d9ac8978b/

Tree: linusw
Branch: for-next
Git Describe: v5.10-rc6-55-g0f8d9ac8978b
Git Commit: 0f8d9ac8978bc4b12ef523c4fc1732226c7ddbdf
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
