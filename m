Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8802CF0157
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 16:26:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389677AbfKEP0r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 10:26:47 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38017 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727889AbfKEP0r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 10:26:47 -0500
Received: by mail-wr1-f65.google.com with SMTP id j15so1217294wrw.5
        for <linux-gpio@vger.kernel.org>; Tue, 05 Nov 2019 07:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=QIDhewAKCAqqyiKLVuHfiDoGK9A1HKljKiMAL6Esfso=;
        b=LPU5DRDIIfALxxZVlYugXSgiHqVUE52yrs1hg0LPPNrUA1s61pwijDBYBeFrFxWH72
         M7IybCRc/oxbTDcp4HLrSH77/uOV3O5ZPyZUn21UhBskqoZ7nlu28ZP55qdNckG8jeSd
         GJGJs9fx+cVjDUWn5o6d7remj9vdLHEaa7HNHoFwOwIJOlH7wg7ITDZk1J2+ttTitnCt
         fCl0QAeBTTavhrKmpN8nYFquDvH9e0IymCfaIiv+8OO0ivqm84rl5vhG2xFbk3Z547Cw
         H9XDCxvK9G/mwA9KpaoWIoMmrCZB5BaiT8WctdVbyycstYTL4d0Aw2cSWYmULAswxRfF
         taVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=QIDhewAKCAqqyiKLVuHfiDoGK9A1HKljKiMAL6Esfso=;
        b=nU2EHr4FZY4sWm5WPXY30t5h0MO80KkdXphqVxKnD4mKDc+8S7j/5TEP9LG8DStvKB
         HyZGsL3ZVW+dGqIc8c59h36I3mQN4/s/Yq3QEHbU23amNLiqEDVC7te7AEy+QOnIQ4pO
         D5EWE60kbohYBk7GzNp4AXCbAYVurkyY8oLkkfm9yKXSVkTtrEJlkkRZTr3uhiOTVyNr
         fG1e17+oogONpIMkpSMJSnnzsVrXaNCGEXO4UgdkDqucJvJD+upnygSh03zkDZjsNGa6
         XcSw7bgwGEnvNqbSa3/nJLu/Te2OoaA4dAB/taBtcoRdn4ZKpFTk8J3QeeQ30AtvLiSy
         anAA==
X-Gm-Message-State: APjAAAXmUkhRN++ieP8hAHe11hXWei8rLh9oV3XNf+W5Sb8Bx9KTgdNf
        l4d7IiKzi001WC6hcJIukKrU4E2dM2ahKA==
X-Google-Smtp-Source: APXvYqyyFBoRDdr8VcwQF3rqbiYcUVnqX1pm+Z9xF7htDVhhDdxuR+u/Mtk6XJ3PBPZpVCdJDcv5Cw==
X-Received: by 2002:a5d:5227:: with SMTP id i7mr27881400wra.39.1572967604976;
        Tue, 05 Nov 2019 07:26:44 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id l14sm22721843wrr.37.2019.11.05.07.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 07:26:44 -0800 (PST)
Message-ID: <5dc194b4.1c69fb81.b01b4.3136@mx.google.com>
Date:   Tue, 05 Nov 2019 07:26:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.4-rc6-33-g504369cd6d2c
Subject: linusw/devel build: 6 builds: 0 failed, 6 passed,
 3 warnings (v5.4-rc6-33-g504369cd6d2c)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed, 3 warnings (v5.4-rc6-33-g=
504369cd6d2c)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.4-rc6-33-g504369cd6d2c/

Tree: linusw
Branch: devel
Git Describe: v5.4-rc6-33-g504369cd6d2c
Git Commit: 504369cd6d2ce34c1225063071ac7e0a5a4d5e30
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 6 unique architectures

Warnings Detected:

arc:
    nsim_hs_defconfig (gcc-8): 2 warnings

arm64:

arm:
    multi_v7_defconfig (gcc-8): 1 warning

mips:

riscv:

x86_64:


Warnings summary:

    2    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    1    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

Section mismatches summary:

    1    WARNING: vmlinux.o(.data+0xbe438): Section mismatch in reference f=
rom the variable bcm_iproc_gpio_driver to the (unknown reference) .init.rod=
ata:(unknown)
    1    WARNING: vmlinux.o(.data+0x829f0): Section mismatch in reference f=
rom the variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_ipr=
oc_gpio_of_match

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

Section mismatches:
    WARNING: vmlinux.o(.data+0x829f0): Section mismatch in reference from t=
he variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_iproc_gp=
io_of_match

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

Section mismatches:
    WARNING: vmlinux.o(.data+0xbe438): Section mismatch in reference from t=
he variable bcm_iproc_gpio_driver to the (unknown reference) .init.rodata:(=
unknown)

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
