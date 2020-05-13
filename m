Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB7B31D1499
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2020 15:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728341AbgEMNYO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 May 2020 09:24:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbgEMNYL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 May 2020 09:24:11 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80805C061A0C
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2020 06:24:11 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id hi11so11090141pjb.3
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2020 06:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=kYhDphPNjWmsgkIdFvwpVr65pzoHFNh4qRqoEt6ZxLw=;
        b=KMRcRz0GISPNfMs34htmcbK6+CYRTu7f4BEkrv/tY0+Hc3YWs1rRv3y7FyT1Aax5Gh
         acax26EHTYy0xT7zSqaHmytw5mXIHISjXOcGBXOM0+cgDtLSwLrBl8VmmfqrYwBRVmtJ
         tcPPuy8l/CpMYJIF0ugtYir039ke04a1pny4z+8dw2uTfnONA1aUyc59xUI5HQBSnNai
         4envE9Hkw7Eb0q87mKIqGYq6NJVpum9IlPWez7Jcux3tIA9xDQRbMYq5y2fyVaEdoZRA
         97xnRv4OxApEF6Bz3pY8oS9EMq1ogFMgFL1YcS7xitslf/D1tYJ6+ZRQR0bwYfsFywno
         24cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=kYhDphPNjWmsgkIdFvwpVr65pzoHFNh4qRqoEt6ZxLw=;
        b=eE7Z7rr5R6+Qqy8VNgTgdi0iJAT3UsnLnUJzH+aoJgTfJ3SyxhbnkrplL8Iu3kyLeW
         IMZ//wJ2LRFrAGIowNr+ZFNM8E8MWB5p8vYhLudiwK8qGpMuh8xh2baAg8g7dnelaJ4K
         p1LjH7cdfjBnd96V78beX2k2GmlouBCmh0xtzEBcHKpp+2VMB7JtEUJfdFxfa6SnFc08
         tCIX54sQzZdYvOp6H2TeRYbSnBrSgowPMlfqOk+aUn8LGH7tpV/eq0/4KbGNX2E8mwm1
         SyyStqhwiwg8WQkSqNL09fJBIvdDrW8lOkqzpvNZu8gy7ASQaxvD1t9xcaxKSsyJrfQi
         3LAA==
X-Gm-Message-State: AGi0Puay0GFQTz6XuGLGba/v9Dzt9Hwntj8ev6v3A/Pejg5GHauhfLGi
        okBbx/afIvlNS9ZCbMGtXxBiSmGPYX4=
X-Google-Smtp-Source: APiQypLyvf+E/CK8zxglWQnN4XohZWMqhW5h5jLuVjvdj9qzOakcMkqHWpYIReqHG75hiU/hVnd8Gw==
X-Received: by 2002:a17:90a:ba84:: with SMTP id t4mr31627088pjr.81.1589376250519;
        Wed, 13 May 2020 06:24:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n23sm15385022pjq.18.2020.05.13.06.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 06:24:09 -0700 (PDT)
Message-ID: <5ebbf4f9.1c69fb81.2fe5e.7a9c@mx.google.com>
Date:   Wed, 13 May 2020 06:24:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: gpio-v5.7-2-52-gccec57d2a1fb
X-Kernelci-Report-Type: build
Subject: linusw/for-next build: 6 builds: 0 failed, 6 passed,
 44 warnings (gpio-v5.7-2-52-gccec57d2a1fb)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed, 44 warnings (gpio-v5.7=
-2-52-gccec57d2a1fb)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/gpio-v5.7-2-52-gccec57d2a1fb/

Tree: linusw
Branch: for-next
Git Describe: gpio-v5.7-2-52-gccec57d2a1fb
Git Commit: ccec57d2a1fbc5b2c2e75647fab08a2b8a662c68
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 6 unique architectures

Warnings Detected:

arc:

arm64:
    defconfig (gcc-8): 29 warnings

arm:
    multi_v7_defconfig (gcc-8): 15 warnings

mips:

riscv:

x86_64:


Warnings summary:

    16   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1086.4-52: Warning (=
dma_ranges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" p=
roperty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, chil=
d #address-cells =3D=3D 2, #size-cells =3D=3D 1)
    14   arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_fo=
rmat): /soc/firmware:dma-ranges: empty "dma-ranges" property but its #addre=
ss-cells (2) differs from /soc (1)
    5    scripts/dtc/include-prefixes/arm/bcm2835-rpi.dtsi:18.4-15: Warning=
 (dma_ranges_format): /soc/firmware:dma-ranges: empty "dma-ranges" property=
 but its #address-cells (2) differs from /soc (1)
    3    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Wa=
rning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but=
 its #size-cells (1) differs from / (2)
    3    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Wa=
rning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but=
 its #address-cells (1) differs from / (2)
    1    kernel/futex.c:1676:17: warning: =E2=80=98oldval=E2=80=99 may be u=
sed uninitialized in this function [-Wmaybe-uninitialized]
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
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 29 warnings, 0 section m=
ismatches

Warnings:
    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1086.4-52: Warning (dma_r=
anges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" proper=
ty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, child #ad=
dress-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1086.4-52: Warning (dma_r=
anges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" proper=
ty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, child #ad=
dress-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1086.4-52: Warning (dma_r=
anges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" proper=
ty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, child #ad=
dress-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1086.4-52: Warning (dma_r=
anges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" proper=
ty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, child #ad=
dress-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1086.4-52: Warning (dma_r=
anges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" proper=
ty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, child #ad=
dress-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1086.4-52: Warning (dma_r=
anges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" proper=
ty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, child #ad=
dress-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1086.4-52: Warning (dma_r=
anges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" proper=
ty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, child #ad=
dress-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1086.4-52: Warning (dma_r=
anges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" proper=
ty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, child #ad=
dress-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1086.4-52: Warning (dma_r=
anges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" proper=
ty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, child #ad=
dress-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1086.4-52: Warning (dma_r=
anges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" proper=
ty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, child #ad=
dress-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1086.4-52: Warning (dma_r=
anges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" proper=
ty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, child #ad=
dress-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1086.4-52: Warning (dma_r=
anges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" proper=
ty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, child #ad=
dress-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1086.4-52: Warning (dma_r=
anges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" proper=
ty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, child #ad=
dress-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1086.4-52: Warning (dma_r=
anges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" proper=
ty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, child #ad=
dress-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1086.4-52: Warning (dma_r=
anges_format): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" proper=
ty has invalid length (12 bytes) (parent #address-cells =3D=3D 1, child #ad=
dress-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi:1086.4-52: Warning (dma_r=
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
    scripts/dtc/include-prefixes/arm/bcm2835-rpi.dtsi:18.4-15: Warning (dma=
_ranges_format): /soc/firmware:dma-ranges: empty "dma-ranges" property but =
its #address-cells (2) differs from /soc (1)
    scripts/dtc/include-prefixes/arm/bcm2835-rpi.dtsi:18.4-15: Warning (dma=
_ranges_format): /soc/firmware:dma-ranges: empty "dma-ranges" property but =
its #address-cells (2) differs from /soc (1)
    scripts/dtc/include-prefixes/arm/bcm2835-rpi.dtsi:18.4-15: Warning (dma=
_ranges_format): /soc/firmware:dma-ranges: empty "dma-ranges" property but =
its #address-cells (2) differs from /soc (1)
    scripts/dtc/include-prefixes/arm/bcm2835-rpi.dtsi:18.4-15: Warning (dma=
_ranges_format): /soc/firmware:dma-ranges: empty "dma-ranges" property but =
its #address-cells (2) differs from /soc (1)
    scripts/dtc/include-prefixes/arm/bcm2835-rpi.dtsi:18.4-15: Warning (dma=
_ranges_format): /soc/firmware:dma-ranges: empty "dma-ranges" property but =
its #address-cells (2) differs from /soc (1)
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
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 15 warnings, 0 se=
ction mismatches

Warnings:
    kernel/futex.c:1676:17: warning: =E2=80=98oldval=E2=80=99 may be used u=
ninitialized in this function [-Wmaybe-uninitialized]
    arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format)=
: /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-ce=
lls (2) differs from /soc (1)
    arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format)=
: /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-ce=
lls (2) differs from /soc (1)
    arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format)=
: /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-ce=
lls (2) differs from /soc (1)
    arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format)=
: /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-ce=
lls (2) differs from /soc (1)
    arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format)=
: /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-ce=
lls (2) differs from /soc (1)
    arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format)=
: /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-ce=
lls (2) differs from /soc (1)
    arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format)=
: /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-ce=
lls (2) differs from /soc (1)
    arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format)=
: /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-ce=
lls (2) differs from /soc (1)
    arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format)=
: /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-ce=
lls (2) differs from /soc (1)
    arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format)=
: /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-ce=
lls (2) differs from /soc (1)
    arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format)=
: /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-ce=
lls (2) differs from /soc (1)
    arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format)=
: /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-ce=
lls (2) differs from /soc (1)
    arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format)=
: /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-ce=
lls (2) differs from /soc (1)
    arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format)=
: /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-ce=
lls (2) differs from /soc (1)

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---
For more info write to <info@kernelci.org>
