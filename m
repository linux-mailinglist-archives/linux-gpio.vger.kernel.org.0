Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80790255E76
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Aug 2020 18:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbgH1QBs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Aug 2020 12:01:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728493AbgH1QBl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Aug 2020 12:01:41 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85523C061264
        for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2020 08:54:31 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id j11so677305plk.9
        for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2020 08:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ba1mT5RcSd9oYcdqjGcLJJCNmVxqYF6Q/282pRxPx4Y=;
        b=DHQYjFXySKjkiVgmKXfZiMqV73XX2uVFHKXhvhX/zCykhnX9Z9+49B5UV+uBvkPLXQ
         htTaECP4WZ6dQezXY39lVfaD4Wcwe9nL9CO9ZazHYqu40q3sUGA3gnNH0eUupEA3u46o
         AgkvgTuCnInXoFuV8Mnw/Mxw4rRvo7jPC05lGUJJlcL0GBPbc0GiPtmR90vYfvm1IW0X
         2HyhfQPp4NfjPAHTbhhwrATbfsqERNBNAIx5d5nZ1JUiNBY3067sWam0a2oVL36zCJ4o
         g21QkLXQxbNcnTVuUlPE2VXlg75Jy4TJs1xw7QbCWZWAerDS9MDuAGLSmhuh6Frld/RN
         vSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ba1mT5RcSd9oYcdqjGcLJJCNmVxqYF6Q/282pRxPx4Y=;
        b=c2jfLsffudXXBXxmMeAWK0NiSMOTBPepw19tcWzIjqzmLrj6a7o7krdSB3f+Bgx8RA
         AwLi6UlULIfpHKge0lWUQST5zNEZtSJhKMLXeO8xsPSg5yAiL/Rsx+8x88JZ9A3VXcrC
         RPF9mQPuz+vBFhhzcNx/QQrHfoDr6azkTa28RzV5nmRWFS5WDTcSyPhoPrwkMq7R/EsZ
         4BMgRRi41BMfkqUdeI2WY82JJffx+1EMFUliq4uAU6pLr6dwe1joJPeAjpiGEcZhvAzc
         N5uF0sByY3ZBj/r30u5dJ0ZemJSx+DzGWVpqvUzHVKdMhwOePNAlMGS4QTVWrQISP3cu
         t2Vw==
X-Gm-Message-State: AOAM531oF75zon8QTEJNWf0yhezkuH8KuA0ZvDlGyjM/1MNhW9urKEZf
        Hh15w8u5t2mEaBBxnEVBKe8FBFiOS3rJOw==
X-Google-Smtp-Source: ABdhPJyYAWkhr5hQdd6Ey9vsBlHOx17ZciZH3FNLAlzXO50E8EE38L0UcEB88DIlk6VHMwi/g8ABzQ==
X-Received: by 2002:a17:90a:1741:: with SMTP id 1mr1951405pjm.173.1598630070171;
        Fri, 28 Aug 2020 08:54:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s6sm1609024pju.51.2020.08.28.08.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 08:54:29 -0700 (PDT)
Message-ID: <5f4928b5.1c69fb81.5e755.2e5c@mx.google.com>
Date:   Fri, 28 Aug 2020 08:54:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.9-rc2
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
Subject: linusw/fixes build: 6 builds: 0 failed, 6 passed,
 8 warnings (v5.9-rc2)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes build: 6 builds: 0 failed, 6 passed, 8 warnings (v5.9-rc2)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.9-rc2/

Tree: linusw
Branch: fixes
Git Describe: v5.9-rc2
Git Commit: d012a7190fc1fd72ed48911e77ca97ba4521bccd
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 6 unique architectures

Warnings Detected:

arc:

arm64:
    defconfig (gcc-8): 8 warnings

i386:

mips:

riscv:

x86_64:


Warnings summary:

    3    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.=
dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-range=
s" property but its #size-cells (1) differs from / (2)
    3    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.=
dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-range=
s" property but its #address-cells (1) differs from / (2)
    1    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: War=
ning (dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but =
its #size-cells (1) differs from / (2)
    1    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: War=
ning (dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but =
its #address-cells (1) differs from / (2)

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
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 section mi=
smatches

Warnings:
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
size-cells (1) differs from / (2)

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
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---
For more info write to <info@kernelci.org>
