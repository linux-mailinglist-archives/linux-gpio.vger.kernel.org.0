Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34461108EA1
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2019 14:15:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725924AbfKYNPY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Nov 2019 08:15:24 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46968 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbfKYNPY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Nov 2019 08:15:24 -0500
Received: by mail-wr1-f68.google.com with SMTP id z7so14538873wrl.13
        for <linux-gpio@vger.kernel.org>; Mon, 25 Nov 2019 05:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=xeZm1eknceG6Jdb/YRtxMIheabIk42xGvsxmrREDqjA=;
        b=0xityXZoxAm2Y71A7bhGld3WKF/s4P0Onj4kPQR2A/p902yDJUbpxmowcca9gT5zoV
         e30wQ14a41d3q1z0Xape2mMjyNgaj5a75nuHjq0CAqQvQT4/ZFdEzxN/TfJzQ6dUeoBq
         x7KNVI/7kqqlFMUzK/bNSD/EUOFKpPIi9z610wKv5d5n1OsjjHDdaSrvHrMgb+GSf63B
         BzXTwg6eCFfBYgViH5kyD6jBy/j6mnuHREzj9PGKcNEpgNw6BwuCGnuzXoUVFiTw5xbl
         hasxMZDyM2wo4bOGp1XPaf7vzsE98tOOgDVt1AfkARI3IUT8i3VnWL4f1I9Mq73nEIVB
         7/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=xeZm1eknceG6Jdb/YRtxMIheabIk42xGvsxmrREDqjA=;
        b=q/nwLVCZfCtoqJ4Dkh6QZKe2SnotIB+V7mIVbtbsJFcTxwq9q08aAD+ixmaZ6QPuc6
         AZ0LUDmYiEQlQ+mic9UKyQB1CudOQkSzp4tip9X5ww9rRH7q2VwEaLlbe0KZL3aGtGDp
         n3p2/uXZgMZg6JpKhuJFOBhxFbcHg4YJOE1kslTh8KsgPiwWcCfqsKz/m29z/RNYC9dc
         yDmfGh2gGSmajikKrzhP8i4IidarSmM8/anikHYCjWGesoPfvN24b/mtpssNtt0P3xE6
         TmEp1M43G81mvZ7KzKb7Xa4FtmXtt8CVzdHVfSTq9R7MvcyU0SynZQW6q/SGO7cXUTze
         z5ZQ==
X-Gm-Message-State: APjAAAXvxN1UPqK4/MmYE6QIOQW9r+BZNUMX23lJn3VMNOHylnn05joA
        v2B4+IA+fWPbxtXj/M5V0kJnVRb/9j3cRg==
X-Google-Smtp-Source: APXvYqwwiH0XZ9mOihbBa71ET4zH1C7agE54Jh+rzOzyhEefmZxaZ9n9ecwFQSIWlb0smbYDGJAOng==
X-Received: by 2002:a5d:6a8c:: with SMTP id s12mr31034391wru.353.1574687721816;
        Mon, 25 Nov 2019 05:15:21 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 65sm11111314wrs.9.2019.11.25.05.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 05:15:21 -0800 (PST)
Message-ID: <5ddbd3e9.1c69fb81.17851.9196@mx.google.com>
Date:   Mon, 25 Nov 2019 05:15:21 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.4-rc6-133-g41c4616bb81f
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
X-Kernelci-Report-Type: build
Subject: linusw/devel build: 6 builds: 0 failed, 6 passed,
 3 warnings (v5.4-rc6-133-g41c4616bb81f)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed, 3 warnings (v5.4-rc6-133-=
g41c4616bb81f)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.4-rc6-133-g41c4616bb81f/

Tree: linusw
Branch: devel
Git Describe: v5.4-rc6-133-g41c4616bb81f
Git Commit: 41c4616bb81ff9b2efd981453f2c5d8f57d0c0b8
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
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
