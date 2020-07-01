Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC982101BD
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2020 04:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbgGACIx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 22:08:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgGACIx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 22:08:53 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A47DC061755
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 19:08:53 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id d194so7522981pga.13
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 19:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=rGwAshJclu1yeIu7qIys58NEsEkvhknQCeY7gDgqNhc=;
        b=LPDxsSz3BRkCV8YP4xo7CyaW2BUeR7cJs1z1pty6SFSPBNHKl9kmJ05acMQTygVJrD
         onj8kHr8jiWHrJRI8JT+KrURng+corq5La23mUEzMJMgRoxFW2CrgV5vev/asPDomRYn
         0NnDAcyJpiNRALUOu37zODLJhD1So4Q16M6nVUNE14ZOtIhIlmlc62xQQfupb9cXV3Fd
         tIPd9kJbPxqfJTWw33kzTRNey4wdkqwPZpokZ8PeurqG4VZuZJbz52AYt6n0+8MyY+Su
         bNeyfGUBNIwSvC1hDM/8Rn7Bk9sCtCYmEly3jXR7F7Qt8Wf6XxWvME8hD8n0jqnKTkuS
         rxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=rGwAshJclu1yeIu7qIys58NEsEkvhknQCeY7gDgqNhc=;
        b=gkSnerAUoqOZTy8dmdIUVGx26apeELEjlcXmYZtf3poS33buLznU0azcfHZObOFU2B
         DYo6egYqEyk+9A36Jbfu4flPE8qLFvHNtWsWac+ZL0YMJSSVQgYb1ECfiCXMKR/O3M93
         ec/WcRzBHLutPfNeIt5DSCYyLV4kKN17+MFzWDHMHm7Cq4+76fgU9tOBA/3QdIJZTJfK
         nYC75nVES94OfaoKlV2L/Vu+vJ0c2K4yIFjQ007HmuckMTIbVYHNYSSQ/tH1ue9KTwLe
         fz3nkyJ59xhMb3r8otRDM1QvPhX7QSgAD0gpYINVvjZvYCt2iAREW0QV72ozsZMn/ZE9
         V5gA==
X-Gm-Message-State: AOAM5330N/qES9ijymMzTFidiHExm4/yaXfDK45/IAahcfHbTrinUVbt
        Z6bqek/TasoK6VEVu1t+uHhtypSz100=
X-Google-Smtp-Source: ABdhPJwkpkjXYsGWt8Ppo2D0nCmfB3GMW92vA2om+qwFiOPe0JISHOQrrqcIUG9ERv1wJ1kWwfKmig==
X-Received: by 2002:a62:1d52:: with SMTP id d79mr21425444pfd.106.1593569332310;
        Tue, 30 Jun 2020 19:08:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id hg13sm3322047pjb.21.2020.06.30.19.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 19:08:51 -0700 (PDT)
Message-ID: <5efbf033.1c69fb81.db5b5.9a6e@mx.google.com>
Date:   Tue, 30 Jun 2020 19:08:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc1-26-gb239e4454e59
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel build: 5 builds: 0 failed, 5 passed,
 9 warnings (v5.8-rc1-26-gb239e4454e59)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 5 builds: 0 failed, 5 passed, 9 warnings (v5.8-rc1-26-g=
b239e4454e59)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.8-rc1-26-gb239e4454e59/

Tree: linusw
Branch: devel
Git Describe: v5.8-rc1-26-gb239e4454e59
Git Commit: b239e4454e59bc85d466eb5630da46f6a876df77
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 5 unique architectures

Warnings Detected:

arc:

arm64:
    defconfig (gcc-8): 8 warnings

i386:

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
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---
For more info write to <info@kernelci.org>
