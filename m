Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F009A2242FD
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 20:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbgGQSQa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 14:16:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbgGQSQa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2020 14:16:30 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFA10C0619D2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 11:16:29 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id t15so6790727pjq.5
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 11:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=t9tnXftIXiEv6I1DzHwkwdyHwR6/Of/QZHWPKBe3OHQ=;
        b=zHk/Wd5Nrx/DCv4r1vnUAfAUU4JDQI3isPcdfsLjqo6MY6bLcJjKnX8Fr1cj69knc0
         TRBx/7OVV87Sgipkdu3h824Ot3IXs2oE7S6aR+3jrDP4toP6VxTZWvZlM/uji1YIKLnd
         W7wfAAGEVbpxnzS/PwMXcypmKFApPX7xScSxtl7iZOHG3bi0fjbYUvFdvzbmKKo3Jada
         vY9VkrbIqIHKP2p7lLvx0dFtwD7PG9WhCFzTyiclugQdmzUy6eKqmlvGU4I0SY19I1O5
         V2nYp8wsBEIiwk8BRgxfMgMpHkPTg1ExTmA1EX6Z4VH2otRyQebbsZTOUdybrJzLFGWY
         Zefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=t9tnXftIXiEv6I1DzHwkwdyHwR6/Of/QZHWPKBe3OHQ=;
        b=JvLxc3yDiO/sbvbLZnNfq7YdKhIzceoyIg1b5C3KD+BoUy0+9prFRGjGxaPcib0WyW
         P0+F001PipJLAHgb33b4EpL72trZika33AVeDWQIpeq4cZ5Ozzm91uz/kVz31ARkK9Zr
         siMiGlHw7wbq+dSmb34YYXdWw2DxILuLf4YNWfeuoZeGUCIkXN7Xebr0YsJqE1+3V5cS
         oZX8iNsy0M1rp+pldvjqSOIO4cxGi8oSUO8eLVI23tKQYaqpq7XsfYsNtUJjr17/BbzP
         t0ny9fof4MG3d464gbq8RaFJFW13qwvUX3RSNsdbkYLNCOO565TD4jjdsifYRazs/UJu
         A2WA==
X-Gm-Message-State: AOAM531xwsjk5dc2YbDKSzd8Y96/PmBsoO4Lcn3/zq4eQL1KBZKnfKna
        sxqo5+W1Ect1Zs5aBOB6UyZKH1EV99U=
X-Google-Smtp-Source: ABdhPJzxzspo77nX8cyI8SdA9ONy8Lqnx7gShrRYXvIW7Cc3S0xkEeQW8w+u+sqKwk4Gq1RnXS2Q3w==
X-Received: by 2002:a17:90a:f007:: with SMTP id bt7mr11192575pjb.214.1595009788728;
        Fri, 17 Jul 2020 11:16:28 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f15sm8298413pfk.58.2020.07.17.11.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 11:16:27 -0700 (PDT)
Message-ID: <5f11eafb.1c69fb81.5ef26.a7f5@mx.google.com>
Date:   Fri, 17 Jul 2020 11:16:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc5-69-g70d7cd6c82a9
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next build: 7 builds: 0 failed, 7 passed,
 8 warnings (v5.8-rc5-69-g70d7cd6c82a9)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 7 builds: 0 failed, 7 passed, 8 warnings (v5.8-rc5-6=
9-g70d7cd6c82a9)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.8-rc5-69-g70d7cd6c82a9/

Tree: linusw
Branch: for-next
Git Describe: v5.8-rc5-69-g70d7cd6c82a9
Git Commit: 70d7cd6c82a906bfc45e5043fed5456d46a92662
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
