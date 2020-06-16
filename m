Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE0BC1FB002
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 14:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728596AbgFPMQv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 08:16:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbgFPMQv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 08:16:51 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA590C08C5C2
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 05:16:50 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id n2so8299665pld.13
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 05:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6k5s5oGcUxrwDw2wCN81XwAtrt5JkoLHhurxpJarLvI=;
        b=K9QGP3qJ8k+LAlNaxPva/6E6ZE66rSbBxtk56RMeRY0QUarxw4jnfCOKDSVYqlpWkH
         XnPw/9x76HmfY/RHaCCf5w203yXF4iUEi5/5lLxC4FExQCLsHqWqyJtKQkr+WQUrHhYb
         1Ch2o2OV7kp0xrFgvmZjnW7wQLAQqOgBJcWt5KH9PEI/YZSNrIbvD+tZFrguRaBW/Jnl
         OtGFb7SF5Ev3PDAGVo/IKOK77O2PSZbZHs4M6vd2PtsyDww+mhG09B0gry6WScotGM/b
         XNvDqgEahqA5zxo/SWOpeMA4YF8wbTFgqZNcPN/Pz94TTyvZHhELaIHIvwrH931U353L
         a4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6k5s5oGcUxrwDw2wCN81XwAtrt5JkoLHhurxpJarLvI=;
        b=KMujA5xxpTRjYdTr9CHhXQsDBTmDgUGZKmVX3bFzs0Z5mBD/MVrpg8cvUc1L+HBqD+
         bgClyj0SCtYe0ars4aqKV/4dQQf47MRpCw4pqaZyWy4VH2zQQyAnS+I7D52lCgdXNYKu
         o/nI9eyMdAkcN/e0DeH8aRm1eTGnmZATOh6PzH0d21+WvsXcXY0+OLe9+L0HDE7tLGp/
         p1In1LnJteIhW3LxvcR3Rbyk/OatPm7+n5qa5pu9BRp9eWtDB0lfl604rtVHWODS24dV
         czvhwE/3KEIV8h191ttUHLzWdPJsFv2Ds7VBEx4eFf+kHEyYXFAejaoFQQqRmjgwDQUG
         bd0w==
X-Gm-Message-State: AOAM530LXAw8nd2ydp6fN2NBwzySo651m7E99SMTkpC6POXrSdOGopkO
        sY6rlwYG9njPsWRfDv9zZsBMKfoTxRY=
X-Google-Smtp-Source: ABdhPJwDFT/rSrjgPoXj1dE2+wR0gnIob/vB3qjuT/KCapd+agMga6Hb2VPdDAQ4ehcRSNI/2ytybw==
X-Received: by 2002:a17:90b:2308:: with SMTP id mt8mr2462620pjb.211.1592309810067;
        Tue, 16 Jun 2020 05:16:50 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i63sm2590813pje.34.2020.06.16.05.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 05:16:49 -0700 (PDT)
Message-ID: <5ee8b831.1c69fb81.f50c6.7207@mx.google.com>
Date:   Tue, 16 Jun 2020 05:16:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.8-rc1-2-g861254d82649
Subject: linusw/for-next build: 5 builds: 0 failed, 5 passed,
 9 warnings (v5.8-rc1-2-g861254d82649)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 5 builds: 0 failed, 5 passed, 9 warnings (v5.8-rc1-2=
-g861254d82649)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.8-rc1-2-g861254d82649/

Tree: linusw
Branch: for-next
Git Describe: v5.8-rc1-2-g861254d82649
Git Commit: 861254d826499944cb4d9b5a15f5a794a6b99a69
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 5 unique architectures

Warnings Detected:

arc:

arm64:
    defconfig (gcc-8): 8 warnings

mips:

riscv:
    defconfig (gcc-8): 1 warning

x86_64:


Warnings summary:

    3    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Wa=
rning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but=
 its #size-cells (1) differs from / (2)
    3    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Wa=
rning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but=
 its #address-cells (1) differs from / (2)
    1    drivers/net/ethernet/intel/e1000e/netdev.c:137:13: warning: =E2=80=
=98e1000e_check_me=E2=80=99 defined but not used [-Wunused-function]
    1    arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: Warning (dma_range=
s_format): /soc:dma-ranges: empty "dma-ranges" property but its #size-cells=
 (1) differs from / (2)
    1    arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: Warning (dma_range=
s_format): /soc:dma-ranges: empty "dma-ranges" property but its #address-ce=
lls (1) differs from / (2)

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
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    drivers/net/ethernet/intel/e1000e/netdev.c:137:13: warning: =E2=80=98e1=
000e_check_me=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 section mi=
smatches

Warnings:
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#address-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#size-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#address-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#size-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#address-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#size-cells (1) differs from / (2)
    arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: Warning (dma_ranges_for=
mat): /soc:dma-ranges: empty "dma-ranges" property but its #address-cells (=
1) differs from / (2)
    arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: Warning (dma_ranges_for=
mat): /soc:dma-ranges: empty "dma-ranges" property but its #size-cells (1) =
differs from / (2)

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---
For more info write to <info@kernelci.org>
