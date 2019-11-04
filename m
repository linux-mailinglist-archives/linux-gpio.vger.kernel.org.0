Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 059CCEDBA9
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 10:29:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727267AbfKDJ3O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 04:29:14 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51324 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727236AbfKDJ3O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 04:29:14 -0500
Received: by mail-wm1-f67.google.com with SMTP id q70so15776543wme.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 01:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=zaCAiSDiVW8sIR0CGts0bkNyNBxoZmfgbK6NSMR2Pmc=;
        b=FUtM1hN30elk+X4GQAiRifiFHXPZdQelY+DTAFkdSfNhtdMYnU6q7Ur6z0EHjv6NoD
         RaCMG/vJvhuK3zs6DoXGmr3zMD/XGZJpjiTk5b6PYhqTABmhqEIzZU5CAEEUp7eylOaB
         dwNMvPrJJzvo/VY0AbAe69uG7SdAm3mBPA37UzG705LjyfMDYA/L/fxfiirRiUXNIHXX
         XRKl0JHc6L5mFtc6CO36PPhKNiVsaCNI8xXxKIvHpEqXhzkb22Uo2QNsQreebMCAzKcp
         LPJcY14LmrTX6wzY0DZ9lGNYiS4cdrfAQC1W5ByLIdESP0YBrXdfkhAmQA3XbBj7gu98
         ohPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=zaCAiSDiVW8sIR0CGts0bkNyNBxoZmfgbK6NSMR2Pmc=;
        b=fdijOaZKh1d5zCq02fkIcA38hlqMGD/6Pqu9JXX1y1y1aKGjjg+AZpQxbqB9tiMbW+
         AivweJrVuj5tSJ8DaUmoWAGf4QBeuDZVnOMqJPbj1vTWCYgZcU46bRn/Q5QKV3HHixkR
         SXRZ5pzLza1/8o3sGZcKbNgkD+uLuuXR34Jjr01wehxI8nSpn/VfjmFInhCqhMc8ynkd
         qeVOjDijb6EH8XL5ONdPrxT4YVdNMvxF/3mA64vFZSE3Ge847WT64i+Jr6nvB//PfZOv
         YZeXj6y9IvfbU8SEOuz8UKgVbx2sV12FnNsiIihktKE+u5UnLrhbQHD4GWBbcaXM/btk
         v8pQ==
X-Gm-Message-State: APjAAAWVarsZz1BezWNHJYme2lFg+18k6tdm+b/GP85wtz5WTbCLktcw
        HwLy9/zZDTFpimCH9XvfR94MSnXkgJhyVw==
X-Google-Smtp-Source: APXvYqwiqQGLcBHIXM59MycRXsg1/DxMIFBsO/BU1IVGl6lrKFTdl3N0Z4p9QCJPiSVPqv3H1Wqk3A==
X-Received: by 2002:a1c:96d5:: with SMTP id y204mr21291401wmd.63.1572859752215;
        Mon, 04 Nov 2019 01:29:12 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f18sm14460155wmh.43.2019.11.04.01.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 01:29:11 -0800 (PST)
Message-ID: <5dbfef67.1c69fb81.30bf0.1117@mx.google.com>
Date:   Mon, 04 Nov 2019 01:29:11 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.4-rc4-5-g1173c3c28abf
Subject: linusw/fixes build: 6 builds: 0 failed, 6 passed,
 5 warnings (v5.4-rc4-5-g1173c3c28abf)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes build: 6 builds: 0 failed, 6 passed, 5 warnings (v5.4-rc4-5-g1=
173c3c28abf)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.4-rc4-5-g1173c3c28abf/

Tree: linusw
Branch: fixes
Git Describe: v5.4-rc4-5-g1173c3c28abf
Git Commit: 1173c3c28abfc3d7b7665db502280ba9322320e6
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
