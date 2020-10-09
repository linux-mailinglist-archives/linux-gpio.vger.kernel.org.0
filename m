Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E4A4287F83
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Oct 2020 02:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726432AbgJIAcc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Oct 2020 20:32:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725852AbgJIAcc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Oct 2020 20:32:32 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C882FC0613D2
        for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2020 17:32:30 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id h2so3589538pll.11
        for <linux-gpio@vger.kernel.org>; Thu, 08 Oct 2020 17:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ntWQCXlKM7kfLIJw5cpcjiK64EG1+WcAoVhQB+kYaNI=;
        b=iC+IjjlIPTG4pOMQa9ueCID2niL9mDhpB63qNpxnPyl0aXJaNFadR8YjivII0iluqL
         YdRVjUaU2PEpHfFW16lhU5d15SSmQJ1/eGY2ihGBZwRb4ig7ezOe28cwyHy0UupHKY0o
         ZEUlDm5vq8Lhk+Kozeo4vxrcls0QNC80TJJy+TmF0Iuzd7EcIyd3yfEOAC97zKCq3ppp
         cYzG874u6MbXsl/rFS5u3oLSyviOofwCyvnhedpHzQUhpNGIc6X86UUUq2DXlCKYlSoy
         sJFVXUVl8MRsfGy1sxhSr/qDvsEiko4Mki81asM8ZaRXIRMsHMsSakhQhKRtNq8dYMzA
         84kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ntWQCXlKM7kfLIJw5cpcjiK64EG1+WcAoVhQB+kYaNI=;
        b=REa2hM6qbpJJq2SXhc2YAx/zEHYSm0YqGp0w/lkJEJKetq7Jt1ApAUDE1fPqEXUmu1
         TnyVTsRj4jUE9h89tXS6ofeG2hSCHNm1geQWVA5YJ7M9bCwCYkB902Jhgs+myt4+wgIy
         IshrMowLT4QPJPh2mlqx39Z0s6t0iyJefy4xRVgmX2mSVp+1DgfLicJ6hlCHT7aiNccy
         m1/rrmCSuN0WWMXnJ/QGj6UY71NggZd4c0moJTkADoMwb/ge4VMT9NPmDWQ2K6dVkl/O
         xJtecIqjuqWeMqgXkv+nP5MX7mbuZLgiuU9ZwIURGPtwr5mpfv7nyZlBHugbXXkmwjOV
         DxRw==
X-Gm-Message-State: AOAM5307rYHYnHwWal76VHLPTl9RUjeTroYAPuKp8DA+95pCkujxcKSw
        Am8Ru9hRZNcHZE/11u65gbn35TsD15gYJw==
X-Google-Smtp-Source: ABdhPJxCQQX+nU7m1WfQaYMeqEj89dL0KidOj6p0FKOs+vTpRMxvuhxCBzQWpJ5zapbDUewwa2IpBg==
X-Received: by 2002:a17:902:6545:b029:d3:d370:2882 with SMTP id d5-20020a1709026545b02900d3d3702882mr10150499pln.44.1602203549877;
        Thu, 08 Oct 2020 17:32:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z10sm8861755pff.218.2020.10.08.17.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 17:32:29 -0700 (PDT)
Message-ID: <5f7faf9d.1c69fb81.3d6e0.0725@mx.google.com>
Date:   Thu, 08 Oct 2020 17:32:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.9-rc8-79-g3d6e8262d3c0
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
Subject: linusw/for-next build: 6 builds: 0 failed, 6 passed,
 8 warnings (v5.9-rc8-79-g3d6e8262d3c0)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed, 8 warnings (v5.9-rc8-7=
9-g3d6e8262d3c0)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.9-rc8-79-g3d6e8262d3c0/

Tree: linusw
Branch: for-next
Git Describe: v5.9-rc8-79-g3d6e8262d3c0
Git Commit: 3d6e8262d3c09479c65e59939df6ca3c0ad7f750
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
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---
For more info write to <info@kernelci.org>
