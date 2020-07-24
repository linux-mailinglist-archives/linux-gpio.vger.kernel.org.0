Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB3C222BB4B
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jul 2020 03:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726405AbgGXBRn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jul 2020 21:17:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbgGXBRn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jul 2020 21:17:43 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67196C0619D3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2020 18:17:42 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id d4so4274919pgk.4
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2020 18:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=jBxz46LoRfuAYIZeKrJhTjYBDwvM7anEgDi8SLhAdEo=;
        b=T4kqeqJfmuABm47/cTv0R6J1alQmS2TadkDfql9X8E/26hI4Q92ZaumgaiGvEv5vRu
         vpzfaDK50zLgxG3oHKJbf0fBphMDyQsa9zjMpLwjRHGUT+lQAgqAi+bC5uhPU155dhdp
         6jwSrmf08MuMmRSM77GPUKgQ2GfZlWibx0a74DB/7ndBDDMQyxwarQN48rYarneVEd2P
         KQtA6m+HLVsIlCPz9IpMvkdwERSE/SlmRH/v7uQNvhzhqSEI70Nm2RrjwIQ68sQPMUP5
         Crgo3UB8IqhiC/gNGsTve+8Nl5VGIq3tpdwjZkCABhbIDzRyhLUu+eiSBBad6ScYWNhT
         54tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=jBxz46LoRfuAYIZeKrJhTjYBDwvM7anEgDi8SLhAdEo=;
        b=dBL2gvyABbCm1xQBhA9WyiXUCDRmzmOMtluZhWEzGQbxJhOpwENGp8BjfcCfwb71Nn
         BBaKdF7XywFxZlHQcHvqXSdx0uY8JEzgGQhzOOt6rMDRnsyf53XAe5dyVOXZKRAgoUep
         PLxN1wb3elPybE61e3AkH9LBMF19r33LWL62BnAu/3bYcduaSb7hRKwH0Uy//jmN8cR3
         21Bk6Gaw1Sr6fxqkLKrTsrNAcmUWSJ+zy5wUbE7ggqwrGZ0/s56k22GjzV5Q9g6u0zAU
         0qPK8qqrzd62zUTTm80ktj8AKLaEgMj2lasL5cKSM79SUtPcuti/NQwMfeZOT26w2+qM
         jZyQ==
X-Gm-Message-State: AOAM533FNANz7HeuaN6u4Ra7E/H5JzOn6GdQNuB5iIyWrswu5qzkc8XQ
        10wi+ec1Z8PJUFzoQaFeuHLAvrE4N/o=
X-Google-Smtp-Source: ABdhPJwgDxOQvQRtf37R9iRFocWgcGhpJuiX8jb1NITVP4xMcJfVfCrzVqlx0T5hOdLl2F032r13Yg==
X-Received: by 2002:a63:e114:: with SMTP id z20mr5743064pgh.300.1595553461590;
        Thu, 23 Jul 2020 18:17:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s14sm4193382pjl.14.2020.07.23.18.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 18:17:40 -0700 (PDT)
Message-ID: <5f1a36b4.1c69fb81.f392a.b9dd@mx.google.com>
Date:   Thu, 23 Jul 2020 18:17:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc5-76-g60e149cc2965
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next build: 7 builds: 0 failed, 7 passed,
 8 warnings (v5.8-rc5-76-g60e149cc2965)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 7 builds: 0 failed, 7 passed, 8 warnings (v5.8-rc5-7=
6-g60e149cc2965)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.8-rc5-76-g60e149cc2965/

Tree: linusw
Branch: for-next
Git Describe: v5.8-rc5-76-g60e149cc2965
Git Commit: 60e149cc2965b77a0d1c74c04bfd1e156b8fb083
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 7 unique architectures

Warnings Detected:

arc:

arm64:
    defconfig (gcc-8): 8 warnings

arm:

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
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---
For more info write to <info@kernelci.org>
