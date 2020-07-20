Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A15A3226FCC
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jul 2020 22:40:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbgGTUkH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jul 2020 16:40:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgGTUkG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jul 2020 16:40:06 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E66DC061794
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2020 13:40:06 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id gc15so424023pjb.0
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2020 13:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=UaCUa7zUd4XeCoCW0dJ2KtpouxAljIExG/y3ws8O+OQ=;
        b=gjrziowYpXo/iVYNjWPNFbf0hGSDxPG7szTff8lxT6WKuYe/kfYEHZ2V2LXVlZ4qbk
         b9Lor/simacT5vc3d+0wiL9NwY+33JJm+TZYjYFGET+nPkj/Fz1DzIgJ+dJpx/mAw7Kk
         W6IcGFqrHOWBTyl/RvMevjOOjhnRQf1oOP/SoR1H0MJp/j98CMLYW0sLCKKIDytG6SSQ
         GG6pOVVhSQbQ11baWj32UQtePtgAEGcKFOVFJXFcQw9VQUE5ONWeL2+ywaBNhCuLpJd8
         UbRj7LMQudG+lFde403GsVv038Cd3QsuJrYSMbOPn+wgsYIlZ7ooMnQ7NBncAewnFL3l
         Q9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=UaCUa7zUd4XeCoCW0dJ2KtpouxAljIExG/y3ws8O+OQ=;
        b=jVpsOaBxsWjx6IFRNpIVPDtuJqXJKa1OR8r/bWkgNvu3sbKtX9JNsMBmSfGPKls6Vl
         pHGFYjqDJ51WNrl653d82eYqOuWMn7oISMXrzOE2KD1maG+jgnedSAh81/ym6DvXdwj/
         UA196ZrQbrFk/OrqjiYwRe5Dvc4JsY5/GQpA/2JcPgfCJjNRpy0M9nB7xFBb7G+4hw7E
         Sj5TTyh2HonMws8KIX/DjBhgvN1ut6cPD+EfNEqSqe3mm7KO1JkfFwc66SE0EqGdc0KG
         LKxyNOV/8l8CvqksYWOwYCj/6rHX2ov2aEzhNaSNAZevK1vGFZ3LMiuz8i686a5N3sq2
         Keng==
X-Gm-Message-State: AOAM530eNOj9r8gt7s0+BUynS6EAf5HqwlJpehwdrWeX516w/fIpJq5C
        QOIEVt1NijNsLotdnEbyrgkbO0SnBfM=
X-Google-Smtp-Source: ABdhPJy1bW4nmuMx4d9fCmWUy7GVEm22Q0ESf301Th+TqUUU/VI6C43yb9zd/icVTARSPlRBeSI5Zw==
X-Received: by 2002:a17:90b:1045:: with SMTP id gq5mr1201113pjb.30.1595277605642;
        Mon, 20 Jul 2020 13:40:05 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f131sm15561729pgc.14.2020.07.20.13.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 13:40:05 -0700 (PDT)
Message-ID: <5f160125.1c69fb81.b0721.3281@mx.google.com>
Date:   Mon, 20 Jul 2020 13:40:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc5-76-gac7642b67d10
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next build: 5 builds: 0 failed, 5 passed,
 8 warnings (v5.8-rc5-76-gac7642b67d10)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 5 builds: 0 failed, 5 passed, 8 warnings (v5.8-rc5-7=
6-gac7642b67d10)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.8-rc5-76-gac7642b67d10/

Tree: linusw
Branch: for-next
Git Describe: v5.8-rc5-76-gac7642b67d10
Git Commit: ac7642b67d10ac32951cbc1e5b3e0d2129ecf899
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 5 unique architectures

Warnings Detected:

arc:

arm64:
    defconfig (gcc-8): 8 warnings

arm:

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
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---
For more info write to <info@kernelci.org>
