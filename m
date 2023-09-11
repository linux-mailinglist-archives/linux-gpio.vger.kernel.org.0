Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 786A679B8E3
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 02:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239710AbjIKUzW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Sep 2023 16:55:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236243AbjIKKDU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Sep 2023 06:03:20 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24243E68
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 03:03:16 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-563f8e8a53dso2932052a12.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 03:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1694426595; x=1695031395; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N15r8bCunG5RSI8zq5FpyXIAsY3tRUVIZWtRIeFyoJw=;
        b=Pm+PPPUvu9p7l//RUaeszXIIDvMnF18ub5ZhoLpUZwc4NNshtDRAVXnhRz5DklDT+W
         NypeUH+9fB1lvGvb0w59skRX9H5m0R3mxkxUuVCJQG6K/JMiQe+S675PjhMuI/OTM1O/
         d4sBUkn2FJE14v97vZctT7sYKLYGfylnLdQm0C6/PsmAHGHtFezU2t61Qp0JbZ8fHCbh
         nxqmFkPqd33LvOECACdlhwdxCRZbhpha5Bhs/kn1rkh6SkCZLYv3b73HoajVEReLx0uU
         opboVOCJRz+Iu/MaWsy6XZ1zY9xfVQwnOV1ZXKipxUZB7Wr6it4f7i8E77vJHIe5hmwP
         MU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694426595; x=1695031395;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N15r8bCunG5RSI8zq5FpyXIAsY3tRUVIZWtRIeFyoJw=;
        b=wKodMFKo/Gv7WjUEZud8uXJbM12Dodw2jlfaTi+qTunSuWwqDtgmAykxF1FOh0sL8e
         Jq92cKez8NJA3y885f4tWREh73xUogxBgrD1pMxtX2yXhR1oCDIiDKPaQvcDRyRkO3Gi
         5bVMZHlfR7QfGIJJ6z8mmxSvA3newGE0XqNxBvAb9p7334+zRk+Z/EmIh+Vxg8B1UTyo
         Xqkq+towaaUAaujrvSMAfXuiF42+4CMYrfOC0tTuuB6ZPvCY5LoJKmzAU5staRlokWTd
         8lhgR57BXl8lSKpNSZ0mfk5VojwDVKlbuY5FSoaVrFSxeMtUYQGCmWmQIBPji/45YEIU
         mDZA==
X-Gm-Message-State: AOJu0YxkORCuT6fpLAvqQ/nF+UDb9Pc9KRt15A1MZlvUcYfZZhvBUjYF
        rT8TtIDGfkvZvMYFd7T4anQYeYqKkPqGBlsgCJ4=
X-Google-Smtp-Source: AGHT+IFRaVU0aTCmAyhxQL0DtLatolJCWkhtBedYqgYzB+0FxufTha5XsPF1zON99/MsUULbtB/iWw==
X-Received: by 2002:a17:90a:f494:b0:263:9e9b:5586 with SMTP id bx20-20020a17090af49400b002639e9b5586mr6973577pjb.44.1694426595071;
        Mon, 11 Sep 2023 03:03:15 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id l2-20020a17090a72c200b0025bd4db25f0sm5223805pjk.53.2023.09.11.03.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 03:03:14 -0700 (PDT)
Message-ID: <64fee5e2.170a0220.ed172.ad66@mx.google.com>
Date:   Mon, 11 Sep 2023 03:03:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.6-rc1
Subject: linusw/devel build: 8 builds: 0 failed, 8 passed,
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

linusw/devel build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.6-rc1)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
6.6-rc1/

Tree: linusw
Branch: devel
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
