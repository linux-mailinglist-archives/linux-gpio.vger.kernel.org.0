Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8BCC701AC0
	for <lists+linux-gpio@lfdr.de>; Sun, 14 May 2023 01:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbjEMXCf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 May 2023 19:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjEMXCe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 13 May 2023 19:02:34 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F10311703
        for <linux-gpio@vger.kernel.org>; Sat, 13 May 2023 16:02:30 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1aae5c2423dso109553695ad.3
        for <linux-gpio@vger.kernel.org>; Sat, 13 May 2023 16:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1684018950; x=1686610950;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dsW7RsWrlyy5FXHePmWZFahhfn0HyQXKGunTc36vu8I=;
        b=Phgf7kDwnLFX+Jp4dLwZkQ7euuPPutLZg+GYVO7WETEuCPexj1eYG+WSJbnrFTzxCe
         eOCnNl/FwyJoLjwOnpGafwYe2xsY3Fj39DnevvoNbu6RKsd38ASoo2XAF9Ybc2cCbb1E
         hJNUremcPRCN9WaHBFjphdHKVs+VQjHs1+hO3ijyzoPnO2q8Eja7HJhh5633mXz9cdgE
         45YylmfBcNuSqF7dnnIz9EwBuHq5zbDzB9sAQ9GsUT+2iJh1EkRRVcjtBIFZcRSroaA9
         Mer9jNGtzzwpJCI0nbD+mF7TsmPjOYGrI9Q59Sjj8cLec5At8Ojgi71ZDiEtJ5E13tCb
         Gsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684018950; x=1686610950;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dsW7RsWrlyy5FXHePmWZFahhfn0HyQXKGunTc36vu8I=;
        b=i0OKflShRCgJf2rhldQq5FF4hiH4sX4JGJ3rkwIFFaUbWe1mUJ40bhN/tHaLJi1Klx
         H/MDBTIZ+UICQzKwU84MukEmHYWr4qkB7KlfqKXTL+k461Q/0RS5Yvjni1NSLRCKUmEQ
         0nJEEHd/+78OLwJzdzEr2rcxbDl2nRXUuk7jiJDpnJMcVbD8aJpxLZn1DTMrxx5FUZvm
         P6+6XsySXqzbwRDnwpHQTMr3tOT97FjnfUkDB3N8CWQL9Wh5BkM27XvsQ0Ff/m2+Qano
         I7fRfeCo2Q8EdiB4Sd6kdjsh6LkwJ1KgwR3tty9RgupohKYCkcXUX56vsOHz2P07Zd/K
         2E9g==
X-Gm-Message-State: AC+VfDxi/oSQLMF41MatYoqP+xSe25z9HtuhtuAxKJVcmrlFktZbuNDh
        inzO99HpYXTaH6b+vChkKeij9iuqKQP/x7b5B6M=
X-Google-Smtp-Source: ACHHUZ69KkJQN1QStkpRTAhsT2dfNmQijWiJ1FvsQ1MbY7T8qJarHdAijrCsYxkBhlGSbCsMLHLdng==
X-Received: by 2002:a17:902:b593:b0:1ad:ea13:1918 with SMTP id a19-20020a170902b59300b001adea131918mr5722232pls.69.1684018949951;
        Sat, 13 May 2023 16:02:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c9-20020a170902d48900b001ac38343438sm10377443plg.176.2023.05.13.16.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 16:02:29 -0700 (PDT)
Message-ID: <64601705.170a0220.561a3.4d33@mx.google.com>
Date:   Sat, 13 May 2023 16:02:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v6.2-rc1
X-Kernelci-Report-Type: build
Subject: linusw/devel build: 8 builds: 0 failed, 8 passed,
 5 warnings (v6.2-rc1)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 8 builds: 0 failed, 8 passed, 5 warnings (v6.2-rc1)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
6.2-rc1/

Tree: linusw
Branch: devel
Git Describe: v6.2-rc1
Git Commit: 1b929c02afd37871d5afb9d498426f83432e71c2
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 8 unique architectures

Warnings Detected:

arc:

arm64:

arm:

i386:

mips:
    32r2el_defconfig (gcc-10): 1 warning

riscv:

sparc:
    sparc64_defconfig (gcc-10): 4 warnings

x86_64:


Warnings summary:

    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    2    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    1    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
sparc64_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---
For more info write to <info@kernelci.org>
