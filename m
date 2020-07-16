Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65E8D222A1C
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 19:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728385AbgGPRly (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 13:41:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728182AbgGPRlx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 13:41:53 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5615C061755
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 10:41:53 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id u185so4029697pfu.1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 10:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Qu5qvFv4vOFd8bhnHVmC7DkkMjOZqDFiiiIQxfLU9cI=;
        b=gaXF4ujhW/tosr+YfmAz+sNMDCW59vkMD72kdmSRUAIYz9OSRN0LF5BAz9kWEG080C
         TO9Qu2W1TLNwYXr1GMW6KRVOusKacRcYJI2igPc1u4y0u0R7ek7zi6MkRRaE43Vw3u3X
         so5E9CJkT7nEyC9s5GTrob9vh8/watFSGsMh0yslv2XzqWTzWb9BYaeJ7u/rUaNO94aH
         ASjtsDjaoRU68x9MXK6QrBaVuOpxO8Ilophj4R/pCxUqZ947CQGJz82tMnq5OBTiuuTd
         5fB5LEX5rjknVIr9tGnkm5Y3T+MlBjqu3gxfm4y7C/1MUGDUl7kk+qMRrUmuUG43SKd/
         nPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Qu5qvFv4vOFd8bhnHVmC7DkkMjOZqDFiiiIQxfLU9cI=;
        b=oj3YN8Ah+OxpMuSy1pYVcgS4FAxMJPLMM1BtEsoLkMR2P2/vt4FQjxNbrnDpBfqlEY
         4tgtSAP3koRvZn+6bchZSvIjKZR69mhiEI8LjRe+iXEcKws6vBeT9JxYZmf5ROg+1RAl
         Q2vQDX9/n8YwH9wQRJIj6VKC9SzJ1Exmgy/ltCg+3enbOulFp3BDdI9cvuTt3P7fmlUs
         6VkhTUDqdRNarNhSLLq7O/5NOZl1GKHXUAvOsrKrXATxMDt4DXbM/Q9xjRF3ZtB/bTIb
         MQFDRDRH/IsHtt21qJWu3LxkzUZkXjYPOgs3omkYHZO3vU/lkubMUiqV9Q5zwh2DoF8j
         XEuw==
X-Gm-Message-State: AOAM531wzZLn8a6n9b+GOLc0b04YuV3uUJJqS5GFipDq8Kh/SX0KsxVy
        PcOSKRb0jAGDAvzjAt1mASAkCLTa7f4=
X-Google-Smtp-Source: ABdhPJz6OJeZu+Ho+e+ClZi9Elnf9f05VHRS4ybuD1MCodZD04C6qjTb8L07RRyofQTLTIwbwXZL/Q==
X-Received: by 2002:a63:ce15:: with SMTP id y21mr5265499pgf.163.1594921312927;
        Thu, 16 Jul 2020 10:41:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t29sm5456611pfq.50.2020.07.16.10.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 10:41:52 -0700 (PDT)
Message-ID: <5f109160.1c69fb81.c579a.f1fd@mx.google.com>
Date:   Thu, 16 Jul 2020 10:41:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc5
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
X-Kernelci-Branch: fixes
Subject: linusw/fixes build: 7 builds: 0 failed, 7 passed,
 8 warnings (v5.8-rc5)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes build: 7 builds: 0 failed, 7 passed, 8 warnings (v5.8-rc5)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.8-rc5/

Tree: linusw
Branch: fixes
Git Describe: v5.8-rc5
Git Commit: 11ba468877bb23f28956a35e896356252d63c983
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

    3    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Wa=
rning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but=
 its #size-cells (1) differs from / (2)
    3    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Wa=
rning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but=
 its #address-cells (1) differs from / (2)
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
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

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
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---
For more info write to <info@kernelci.org>
