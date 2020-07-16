Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FCA9222A51
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 19:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728515AbgGPRpQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 13:45:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728412AbgGPRpQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 13:45:16 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD6E7C061755
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 10:45:15 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id ls15so5175216pjb.1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 10:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=sNvrLm7BsBvI6ilLU6NpoBBd8xicLE8xXoXj+jmsFOs=;
        b=LHYBE8h87zjSkpl6BBMgBz8jn2wTS2jZn9YSMH0a59JAgcWg7wU+8BzQrrZTQNNzBx
         N7LWqksU/jBIEeOsikZ7/8adAzjUuona51vzrQZyRSV6Lvggv+TblZrKLf97yvYE+JaT
         Bbw6D3KEHJf/f5ANXGv81i7REZNuZTasZZ+3LvhTtctsYGiDHIpVhL5YXfvREJtbOtN/
         70lMVt+ay+L/TwsCQKHkYKQqg2XpA2qd5gRajK7fXsfR+Aleyu/evo1Cc9cZISwqPjZK
         clO+asvtAhSp8zsnJhCE/RQ4Nu9dkjiS0lvYjtvLejfVZwhYxoyF26OV9OUsFwKn5ezL
         p8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=sNvrLm7BsBvI6ilLU6NpoBBd8xicLE8xXoXj+jmsFOs=;
        b=ZdclWjwUvFLM/jpy6Z3HVA/5WF4IB6DWrhPzaYarQSUR9hUOniOy16jyoi30MHY+dD
         8m4Bs0PTDZYalAwq4aW4fCnGjo8jAiPYaLKe8O8eVZpWtC9vtL2FGthB9Xdfcwh/yJWl
         2/ta0lcDJqxL+K96keKfBt1i6DbZN8xD6ZIXQ8Z+dkNxe8Zq8+Q9/PzbeY2BpUXc/0HO
         O4inhV0tiWpxKXPBBU7GAmgP//uZPNFajcUjKAnnbGPPQTb1mtqivOQiPy2UcwwyIqYI
         3mVSixqasioW/O3yE3wMQD5wlqMjvy5uPcX66yEPHoGbSDTVQ7WusVUTMtFRsLlGcxkb
         xQyg==
X-Gm-Message-State: AOAM5331gESPax1Dmba4E02ZNB/5aorhGhdgP6bH/eTcnpxaUXTa07b8
        1Y78v0ptBlAPo5/WXD7OiRXgZQVFKFM=
X-Google-Smtp-Source: ABdhPJyZBEmSyO/a3pk1eIi/k8shuElaXyiEiidZ5fnIWwPRrnlfTDeyEa8vI8dlKJimP0G+LKsrpQ==
X-Received: by 2002:a17:902:8ec7:: with SMTP id x7mr4445318plo.111.1594921514996;
        Thu, 16 Jul 2020 10:45:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 76sm5550181pfu.139.2020.07.16.10.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 10:45:13 -0700 (PDT)
Message-ID: <5f109229.1c69fb81.6a997.fd15@mx.google.com>
Date:   Thu, 16 Jul 2020 10:45:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc5-68-geb211a587e18
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next build: 7 builds: 0 failed, 7 passed,
 8 warnings (v5.8-rc5-68-geb211a587e18)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 7 builds: 0 failed, 7 passed, 8 warnings (v5.8-rc5-6=
8-geb211a587e18)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.8-rc5-68-geb211a587e18/

Tree: linusw
Branch: for-next
Git Describe: v5.8-rc5-68-geb211a587e18
Git Commit: eb211a587e18efb2a37250573492ae58126176eb
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
