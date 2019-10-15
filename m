Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CDF6D6CF9
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2019 03:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbfJOBoy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Oct 2019 21:44:54 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39968 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbfJOBoy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Oct 2019 21:44:54 -0400
Received: by mail-wr1-f65.google.com with SMTP id h4so21763220wrv.7
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2019 18:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=wf3Eqjr8afOQwR6LCGmYPgSwMvpPMvsU2xgIyGwioog=;
        b=DJSVKyhydIBkC5eBJM0N5BejcDivkB+zXolCEPjvL2ZcsPmQxYyFpxd6hq0L07DHVE
         CkXfZhb4NCyF7WiCxElVU3gojFyctW+U1x1ScXRGl8fyoq5Jcsl02MYaHJKDYzx5zmta
         ItIzWRlv0x7yAzx7nU6KLEiSgcqEPD42RbgQb6i5pCfZHJASsNwVp/Avoc/VwxtRCRM/
         +CDqvX0enDZGjVWvUQfLJ3dapvcBjAlnKwroYFuSkS83AKQa6EP+fHfpoZQ/XFKk9y0s
         QVxUDBqK/YpRH3LzAM0g51XPT+okJYFqpSpzesi9xtXXPSIvRIJncvYP+kQIQgvJ/3jF
         iIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=wf3Eqjr8afOQwR6LCGmYPgSwMvpPMvsU2xgIyGwioog=;
        b=iSq9hh3aejboh+O3b8jt1KCTpY8dnv/2HWfWxfCUKRAS75nTVXhUkTPBEDcaTJojmV
         bbOAcRw5XYvIUYAW8+RKiyL/FOE3vWSwEWxo9ku2qIecvbQwcPpXoyqGwEwfOgPr1oNx
         3Viz8ELB02qnRyF46A6TqbySQ40kr5Jt2nD8lTTygyZpSeCX/2QXkoVOi/JCux9XPDDT
         4BAsV32W3zBXGkrPzdlJb+gGO016huMDfXqoGiTm604mYYCWbTSDfQwuw8vi9D+iLUsc
         X2lXqQMuzuyf8an1VfmkXRtzAEKWxBtYR7XZ6wmC4Rc8jl8zNmE4Z+5WD3pctS4QnK1i
         6cvw==
X-Gm-Message-State: APjAAAUbHvePz88MIr7GGOtnYeEj6rbG6XE2DWG08ocLr3gQ5QUz4svF
        jzq3odmeOp2/vgZ5mZrdyWbLkF/uhGmudw==
X-Google-Smtp-Source: APXvYqx4u0UDYbCnE7BHfa6ChSDOJPdaM+DQqY9IpADg9ezUBnE+stGXig1EFBUVQXDXHyNG+7d4TA==
X-Received: by 2002:adf:dc42:: with SMTP id m2mr13836110wrj.314.1571103892002;
        Mon, 14 Oct 2019 18:44:52 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id a3sm37666884wmc.3.2019.10.14.18.44.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2019 18:44:51 -0700 (PDT)
Message-ID: <5da52493.1c69fb81.bb183.cc86@mx.google.com>
Date:   Mon, 14 Oct 2019 18:44:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.4-rc3-18-g818633792f6c
Subject: linusw/for-next build: 6 builds: 0 failed, 6 passed,
 5 warnings (v5.4-rc3-18-g818633792f6c)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed, 5 warnings (v5.4-rc3-1=
8-g818633792f6c)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.4-rc3-18-g818633792f6c/

Tree: linusw
Branch: for-next
Git Describe: v5.4-rc3-18-g818633792f6c
Git Commit: 818633792f6c582190de8cb05ca21cdd12d04f55
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
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3/kernel/drivers/usb/storage/uas.ko need=
s unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3/kernel/drivers/usb/storage/uas.ko need=
s unknown symbol usb_stor_adjust_quirks
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
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc3/kernel/drivers/usb/storage/uas.ko needs unk=
nown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc3/kernel/drivers/usb/storage/uas.ko needs unk=
nown symbol usb_stor_adjust_quirks

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
