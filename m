Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3416C79B59C
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 02:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239495AbjIKUy6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Sep 2023 16:54:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236429AbjIKKhB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Sep 2023 06:37:01 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1CD6E5F
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 03:36:57 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c1e3a4a06fso28793505ad.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 03:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1694428617; x=1695033417; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=keT4MqaHmIVfApX/zhqzwe+zUWa4rdaB48d/io9xXzs=;
        b=Ii+Uq/FkjtaGYf5uJkOCs1FWfVmgJne5w41pPZFj4X32d7kUUOxHOo+SPDnYS4T/el
         xOVDXxlgWDvoLUwSzQJRnOKrQ0ATNQHtWdU2T3KKqsdzBZsoPB2S7XDGksuGSCDCizOp
         KGeObvmIes+KY4d2p+z5JLQUMy9i9ZZ8BMcjGuNCbJVrGt8dVgepJdcn5GjuVFpfVHS3
         PN16iLtqDihJHcRLxOEiG2RVnP3apk3LsPX/1lCOskthwhmoyCXdMURocPIcOCBDqURK
         AK/y1tYX6QcxS9xWRqvRIYmXGU/1d20y3CLqx2/jyVZXLutWpuU86FUrCbNEMyIyA8da
         8ZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694428617; x=1695033417;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=keT4MqaHmIVfApX/zhqzwe+zUWa4rdaB48d/io9xXzs=;
        b=gw6kzq72t6x1UIt6lpr6moyaaX1paHr5KYsi5cMj8H0OrK85Y33l830OgsNqw160oi
         9/91odhg+e4c7gCG7aU64mvvRLaKQRfogpM2hMaJWHpg7V3gUqoSSr/eUrHL45vkrJbr
         LvsD+UlCRzp6AlikszYB5o0au2Yd7DDtnvYgvQHMeicSKDmHUWdr/3g/OgtrpJNdcQHf
         tnuv0yNWkMy8AVk10wA8g8GwkKjy5ovdhcWeE2C5jiG6VVknc4L36txWl9khdWqXofRw
         GnNjbtCcMshAnNEYaE4O9CqgeJlzDeLpJcaOYajKE65fYxPDLXll0WHHQ1rM+dp+SbDI
         /ELA==
X-Gm-Message-State: AOJu0YwKmqK7TSDqTKcJE5vaXAinElmEjOyOZCFgqj8/m2yvOJiLwKTA
        CcDTykvB9ZRJ8u8aFgoPibv2uL7x+70RI3l+6T0=
X-Google-Smtp-Source: AGHT+IFk59CujkggETyjw7PyOlBesavfghwTMDGQSTF5NnE5Ed/LEs7RJUWfERYCbx+q6xCrw/pfpg==
X-Received: by 2002:a17:902:e811:b0:1c3:2df4:8791 with SMTP id u17-20020a170902e81100b001c32df48791mr8576591plg.27.1694428616760;
        Mon, 11 Sep 2023 03:36:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id i7-20020a1709026ac700b001c3a8b135ebsm2692920plt.282.2023.09.11.03.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 03:36:56 -0700 (PDT)
Message-ID: <64feedc8.170a0220.4cbd2.616e@mx.google.com>
Date:   Mon, 11 Sep 2023 03:36:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.6-rc1
Subject: linusw/fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-rc1)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.6-rc1)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
6.6-rc1/

Tree: linusw
Branch: fixes
Git Describe: v6.6-rc1
Git Commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 8 unique architectures

Warnings Detected:

arc:

arm64:

arm:

i386:

mips:

riscv:

sparc:
    sparc64_defconfig (gcc-10): 4 warnings

x86_64:


Warnings summary:

    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    2    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---
For more info write to <info@kernelci.org>
