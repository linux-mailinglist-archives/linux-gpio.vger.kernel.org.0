Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91102E224F
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2019 20:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388089AbfJWSIo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Oct 2019 14:08:44 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43548 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731908AbfJWSIo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Oct 2019 14:08:44 -0400
Received: by mail-wr1-f68.google.com with SMTP id c2so17882660wrr.10
        for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2019 11:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=GIyAek1OF3UPfkANMbYg5IgTeqUD3EBBeDjxdJK6jR8=;
        b=x6RB+tVwSriwMNQG0+irXAa67mvIhTMMkaQcR/WXZ2H82pydWWT+AigtnT+akOPkT/
         OiAEeyTrFCnrBaTIfTlnLirBa/2kfYC9a0KFsr/ZMEDvJBohiUPnb3NNeA4YqkIIflwZ
         0iOXdRuZkDISIh+0WJ2eZlOiJV6AI4rsVWXxOVDTYLJ/D8i611hsWHvCWRtplOYir85l
         5UIqS+4EtNkA9h1AU+IxDIoQEjIds+L0J96JibTQNBOestcPy0iDpdmozyU9NjqueKae
         AYUqidEh+xlAgsF/CfjU8R77+V5CPi4JooicgflVN4IgTulb/2oRTBfw5z0e8SGTze8j
         Uqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=GIyAek1OF3UPfkANMbYg5IgTeqUD3EBBeDjxdJK6jR8=;
        b=IcWq+Orzy3mLxfcRAisciygNDYdUcZeNNhd03Ymqjw+H3azPOSBI/zSOPrIKqp/vP7
         tgMJzwfERlUnNPDNWZ1QcrfFZKQFHvUa9GbamuzsoKRXFWwLLjSS+Ip/ATUkMwTmj0cV
         36WpaKCZuChhJFj+psKPfYe/ZfdmXOwjhWTMsRyDnanbHKsIhpnUlheHPWNFJPf6A5ss
         Sb3ZMg3ak07XWSce3fj1xW8gQ1XDABHJlr3AFbYg9OLm5UZpJlOjMYZuOQ0f1fpSoq+y
         LSzhQAu+TuHVrH8rwwDXYFTozpoXzZ4oIWuIS261kui+3/SRykze0mDUYvuRuS8GE3pn
         OJ2A==
X-Gm-Message-State: APjAAAUyL2GT6ll0+gmUAqS1Z6ahJh2pMtJfuHNYe/RcWI/VcwIRhoQr
        d5v+MxiwDIQo7U5BYLzAnPPMCHuXuTPkqA==
X-Google-Smtp-Source: APXvYqyuahG9coD7BWqRF2DV5tMxGyOQkVedj1vwO3/6tzB52IrC8LplSh8v7ScRrn1J9FgGceFXYA==
X-Received: by 2002:a5d:4b42:: with SMTP id w2mr42600wrs.360.1571854122076;
        Wed, 23 Oct 2019 11:08:42 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id a2sm9468603wrv.39.2019.10.23.11.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2019 11:08:41 -0700 (PDT)
Message-ID: <5db09729.1c69fb81.f7fae.25ad@mx.google.com>
Date:   Wed, 23 Oct 2019 11:08:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.4-rc4-28-gacba5fc211ee
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
Subject: linusw/for-next build: 6 builds: 0 failed, 6 passed,
 5 warnings (v5.4-rc4-28-gacba5fc211ee)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed, 5 warnings (v5.4-rc4-2=
8-gacba5fc211ee)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.4-rc4-28-gacba5fc211ee/

Tree: linusw
Branch: for-next
Git Describe: v5.4-rc4-28-gacba5fc211ee
Git Commit: acba5fc211ee5159bcbcec67a0ce264078286625
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
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@9/linux/build/_modules_/lib/modules/5.4.0-rc4/kernel/drivers/usb/storage/u=
as.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@9/linux/build/_modules_/lib/modules/5.4.0-rc4/kernel/drivers/usb/storage/u=
as.ko needs unknown symbol usb_stor_adjust_quirks
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
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@9/li=
nux/build/_modules_/lib/modules/5.4.0-rc4/kernel/drivers/usb/storage/uas.ko=
 needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@9/li=
nux/build/_modules_/lib/modules/5.4.0-rc4/kernel/drivers/usb/storage/uas.ko=
 needs unknown symbol usb_stor_adjust_quirks

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
