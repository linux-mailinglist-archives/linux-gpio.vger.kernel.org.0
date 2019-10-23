Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDAFBE2229
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2019 19:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731924AbfJWRzf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Oct 2019 13:55:35 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51796 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731858AbfJWRze (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Oct 2019 13:55:34 -0400
Received: by mail-wm1-f68.google.com with SMTP id q70so15078055wme.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2019 10:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=OfekQkSzmcIzmsJazFeJJ9sr7xq10+/u4fCGkXZFEVU=;
        b=PCIEc7jicI7am8m7gUdd8iMfNWuXleQZmXy37l30iPuusx/jpEoMkm6FiuJN6+Z18o
         crpaSs7OEurN0UgIr42RXpQYEGajSMdKoCt568PYjYMIdeq2ypsD6UYBJbWU3CauTKWy
         zRgA8FWeqFyCovywPRALIGotM459j5w3Z3Y1lcg3RnCON8d9JbflfUA6xzxuBsptIeOG
         wkFuu43/MmSh3bjMREE57suiZH9pQQs0aTa+Me0rMTnraorAyT1gxUNj5lv6x/wkrfks
         pkmbdY1tfFDwl7srul7oHIVo3Kg4HVSIFXM53T9t4W9AY0ixWQSyLP9piJStocK36IGD
         CgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=OfekQkSzmcIzmsJazFeJJ9sr7xq10+/u4fCGkXZFEVU=;
        b=OETXguDEVH/2bI7Ey66mbAOzOI8TdFYu3S8RON5q4eE+CYeBbQ2BF/7kJ4LSg5sGRQ
         4K4NOAxsyUsqgztlhQvXyfQNWDBdpFUzVI5LtgCPYUNn9eAnrolliSbtkvGH8xaANusi
         Kga5xJC3vCUcgATvVfYu4roEiIle2/XIc6vgNI9CCN7uggyWbdv9geu8hlgryk0pQ+dE
         wC1p9jVprggw+pKhO19VJN962B6Gp7+I/VPnQst2ufye9tdVTbk2T+VoozSIfDtWIbVk
         H3tusFue+C7JjDQeKlDstwmNYdKqGkaDvX0YSOxooip1ou0zK/yqweUuLnbzF7uWmZrJ
         pwkg==
X-Gm-Message-State: APjAAAWHXdGW7NnFI1Zvm17PXrOoj3LwJIwxwFjSjOBUZYeIKFMjitXG
        W++bFdjHfufdcp4NMev42iaExPPTWuYZdw==
X-Google-Smtp-Source: APXvYqykjrwadVpuU16L/qoGGoQaEnphEaNsvw3FCjQ2LxJ9YyPc/YFwuguWGpxmzaSaW3B3EdwwHA==
X-Received: by 2002:a1c:5415:: with SMTP id i21mr1100025wmb.120.1571853331570;
        Wed, 23 Oct 2019 10:55:31 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id g11sm21401631wmh.45.2019.10.23.10.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2019 10:55:30 -0700 (PDT)
Message-ID: <5db09412.1c69fb81.62b46.ea3a@mx.google.com>
Date:   Wed, 23 Oct 2019 10:55:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.4-rc4-2-g459f7cb9a3b9
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
Subject: linusw/fixes build: 6 builds: 0 failed, 6 passed,
 5 warnings (v5.4-rc4-2-g459f7cb9a3b9)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes build: 6 builds: 0 failed, 6 passed, 5 warnings (v5.4-rc4-2-g4=
59f7cb9a3b9)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.4-rc4-2-g459f7cb9a3b9/

Tree: linusw
Branch: fixes
Git Describe: v5.4-rc4-2-g459f7cb9a3b9
Git Commit: 459f7cb9a3b90b1574acc001ad1f6bf5bb748ac7
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 6 unique architectures

Warnings Detected:

arc:
    nsim_hs_defconfig (gcc-8): 2 warnings

arm64:

arm:
    multi_v7_defconfig (gcc-8): 3 warnings

mips:

riscv:

x86_64:


Warnings summary:

    2    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4/kernel/drivers/usb/storage/uas.ko needs =
unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4/kernel/drivers/usb/storage/uas.ko needs =
unknown symbol usb_stor_adjust_quirks
    1    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4/kernel/drivers/usb/storage/uas.ko needs unkno=
wn symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4/kernel/drivers/usb/storage/uas.ko needs unkno=
wn symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---
For more info write to <info@kernelci.org>
