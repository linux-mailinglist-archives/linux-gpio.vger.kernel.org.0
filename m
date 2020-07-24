Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB40022D178
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jul 2020 23:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726782AbgGXVrR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Jul 2020 17:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726730AbgGXVrQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Jul 2020 17:47:16 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A107C0619D3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2020 14:47:16 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id t6so5320281plo.3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2020 14:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=nhn+x/WWfXj4nPX/S5dOm6y6suPQSzqnv7UN/i8N/Bo=;
        b=nZLX+VBNVXZ8FkpGRlMyXtdPaHzLxAufijZcRIdEV4lqxNgSnHznOWbp6drWwjFBIz
         wVb/MVOjKbyquz3obEk8C5AgMUppElqvLExeH7y5siaoxhRdc0Df78fTaeD9pSrqXxe4
         bzzZNsXU/no1Osnrx16ZNhjdJ1DZcGrdLmChHjxshmTKbqvk6l8XzL2l1bRto7L3IkYg
         B/PPtmX+/+5r9tmI47BxM6lXMM/ZsGvWKM/LSZi79JS5IvRbTbRpcaSLSMgVcrjI6/T8
         y79zMqd9Ih+htNX81Bioq32Gyb44Jd6IOGPCxxy42tKsgJcro1kEPiQtNVuGpLY3MZXb
         2E6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=nhn+x/WWfXj4nPX/S5dOm6y6suPQSzqnv7UN/i8N/Bo=;
        b=RBPvIDAQoT4zy2GKjeaT0pi3oVA57rp/TiOHI8tQfYCogu5iA5vL0UjelSvLg74nOs
         Ki6i/Hf0EIZeeSOPws/QZHpEafUqXTCqYNZ8ioiCIgSnE33k3egjrVYDIcjFwiv25RWs
         m2H7gjB4VOsckanTI70jZhX453TeEdB8PxM7MOf1hge9gEIQNXkWR7TGdvWEbL3I8naN
         +HvsBj35Tc4mpGWCC7UyXxjV+a7k8x2KeIWpr+E9JJ9ky+NF/hFBgwb2ZbPNum3EzzMc
         rJz9V0OjUl3W1L0XUdikxZQlRXl5jHoC30OuZ6N3kJ8dRf/A/zosGkOdv7b+Rv273JDB
         BRLQ==
X-Gm-Message-State: AOAM530qAhxTkh7Qc1d1aS189M84WqEGwDwBvtttTUFxvV/Xk77cUaF2
        fzF0kwdkZjppSAOl/A3FJ6dEO/jCKCI=
X-Google-Smtp-Source: ABdhPJwU2resj+Xc8mzHmkGPuE92mdMw74sCyw7KgT061M3N8MY7JHOB/RhQRSgPLNv3SuQhA5LEqg==
X-Received: by 2002:a17:902:7c8b:: with SMTP id y11mr9516034pll.142.1595627235752;
        Fri, 24 Jul 2020 14:47:15 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v22sm7393457pfe.48.2020.07.24.14.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 14:47:14 -0700 (PDT)
Message-ID: <5f1b56e2.1c69fb81.220c6.cb9c@mx.google.com>
Date:   Fri, 24 Jul 2020 14:47:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc5-96-ge80c35d808ef
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next build: 7 builds: 0 failed, 7 passed,
 8 warnings (v5.8-rc5-96-ge80c35d808ef)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 7 builds: 0 failed, 7 passed, 8 warnings (v5.8-rc5-9=
6-ge80c35d808ef)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.8-rc5-96-ge80c35d808ef/

Tree: linusw
Branch: for-next
Git Describe: v5.8-rc5-96-ge80c35d808ef
Git Commit: e80c35d808efc91427c50b8f4d8ecde8cee5050d
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
