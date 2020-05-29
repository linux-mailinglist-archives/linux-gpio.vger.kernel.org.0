Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FE701E739C
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2020 05:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407258AbgE2D1S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 May 2020 23:27:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407090AbgE2D1R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 May 2020 23:27:17 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F11AEC08C5C6
        for <linux-gpio@vger.kernel.org>; Thu, 28 May 2020 20:27:16 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id m7so482554plt.5
        for <linux-gpio@vger.kernel.org>; Thu, 28 May 2020 20:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=zSlqdqR77qpxu59NUDfju7/8QcXkaZJmLWUEfdEspNU=;
        b=wNjlVmt4MJrH61A6HoqNId8jlbbkWeGISVaJyj4XZgeOkLeblQN8vGnYtOL8LE+Iok
         dpI8k1swHZtNHi3hVPZphhSuVpx6BG9tv/rHHdcSb1v+OvN1o+985dLG8BKaiz1HHbnR
         97V+CmshfouYB4OjctkoMPEwc2TAvYEQMXEyPr9LbRcRW8Bnb98zJ+yggo5DdwVdkBKX
         DE/ZyEGId/JUMzqvFgsLEyJbKfTbrXCqP0ObUdOsNTlf6rJlREbNsGkmhZ68tD91cKiD
         6cSDGu2KBO6AbcHCc02YDf7wiNe96yeWB4Znxd17kTUbAFsi8/nv00O10uu46RZY2ijq
         J3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=zSlqdqR77qpxu59NUDfju7/8QcXkaZJmLWUEfdEspNU=;
        b=OzeYKcTdhoeHtZqaJk6pehrKEmJ22ulqG0Wxcg/QtukZRjzAGJ6nfq1zevWTJGLPuu
         oK9+n8daeeuPWwv/jn8/nkB26V0NtU1HEkltxCQGKuztJax34+KH4iqU+wIWljTuad8C
         cd1UQSsFMbSYAPfRRNL9bUv97yaSUgNGg14d1WJdZTJ66Y2eFyPWLsFv5wvT92P5UOgs
         cYQ2oPJkPha/Mf695MPyExXKwPO1QjUvO1EuxvoJH2bVOKWKOnSEWKsnEmajb5aUIyMG
         H1dYbA0SFzjD0iDYFWLvK6NS+X+pDT2401vfHYT9k12myFPx8SdMLIMDHzQbR/6FR6/i
         ++8g==
X-Gm-Message-State: AOAM533HlIygS4bNQoZAzkrg1B25CzfaJPQYDZgBxzTcXrWBjAk5kNt0
        SKIsL6ah2PFiJky5v+M0VHYrOxmQZF4=
X-Google-Smtp-Source: ABdhPJzUCRUXNMvRElc3CxdM0Y+DhSdjAC9tmUvaEvvoJp4qRqRQTbyd20j9JQyWi8HoH6Hu7/YjrA==
X-Received: by 2002:a17:902:c686:: with SMTP id r6mr7066452plx.147.1590722835951;
        Thu, 28 May 2020 20:27:15 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g18sm5917059pfq.146.2020.05.28.20.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 20:27:15 -0700 (PDT)
Message-ID: <5ed08113.1c69fb81.25c4f.38dd@mx.google.com>
Date:   Thu, 28 May 2020 20:27:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.7-rc7-88-gc193ca5188d4
Subject: linusw/for-next build: 5 builds: 0 failed, 5 passed,
 24 warnings (v5.7-rc7-88-gc193ca5188d4)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 5 builds: 0 failed, 5 passed, 24 warnings (v5.7-rc7-=
88-gc193ca5188d4)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.7-rc7-88-gc193ca5188d4/

Tree: linusw
Branch: for-next
Git Describe: v5.7-rc7-88-gc193ca5188d4
Git Commit: c193ca5188d4691abb51b3026502f4074b727de7
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 5 unique architectures

Warnings Detected:

arc:

arm64:
    defconfig (gcc-8): 24 warnings

arm:

riscv:

x86_64:


Warnings summary:

    16   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1068.4-52: Warning (=
dma_ranges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" p=
roperty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, chil=
d #address-cells =3D=3D 2, #size-cells =3D=3D 1)
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
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 24 warnings, 0 section m=
ismatches

Warnings:
    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1068.4-52: Warning (dma_r=
anges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" proper=
ty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, child #ad=
dress-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1068.4-52: Warning (dma_r=
anges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" proper=
ty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, child #ad=
dress-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1068.4-52: Warning (dma_r=
anges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" proper=
ty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, child #ad=
dress-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1068.4-52: Warning (dma_r=
anges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" proper=
ty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, child #ad=
dress-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1068.4-52: Warning (dma_r=
anges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" proper=
ty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, child #ad=
dress-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1068.4-52: Warning (dma_r=
anges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" proper=
ty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, child #ad=
dress-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1068.4-52: Warning (dma_r=
anges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" proper=
ty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, child #ad=
dress-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1068.4-52: Warning (dma_r=
anges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" proper=
ty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, child #ad=
dress-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1068.4-52: Warning (dma_r=
anges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" proper=
ty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, child #ad=
dress-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1068.4-52: Warning (dma_r=
anges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" proper=
ty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, child #ad=
dress-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1068.4-52: Warning (dma_r=
anges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" proper=
ty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, child #ad=
dress-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1068.4-52: Warning (dma_r=
anges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" proper=
ty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, child #ad=
dress-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1068.4-52: Warning (dma_r=
anges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" proper=
ty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, child #ad=
dress-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1068.4-52: Warning (dma_r=
anges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" proper=
ty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, child #ad=
dress-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1068.4-52: Warning (dma_r=
anges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" proper=
ty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, child #ad=
dress-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1068.4-52: Warning (dma_r=
anges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" proper=
ty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, child #ad=
dress-cells =3D=3D 2, #size-cells =3D=3D 1)
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
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---
For more info write to <info@kernelci.org>
