Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9F08A9F70
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2019 12:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732887AbfIEKS1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Sep 2019 06:18:27 -0400
Received: from mail-wr1-f48.google.com ([209.85.221.48]:41653 "EHLO
        mail-wr1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731012AbfIEKS0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Sep 2019 06:18:26 -0400
Received: by mail-wr1-f48.google.com with SMTP id h7so1054100wrw.8
        for <linux-gpio@vger.kernel.org>; Thu, 05 Sep 2019 03:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=zvGW3cZzDFGR2yjUaz65XyVzWZ6iLhj+wpWm+JU/QDk=;
        b=Azri0YMWrKyS+i0LQXqqT57++DUc4w2P4qyPdui+fuPgS9TuoWQknq1g87qFlpzxse
         M+DJ4McFRRS0Xbqf+Y8ERJFuUJLyq+qw6T6tnJ9mOM2HKLHUUcje2S7EPKMs435TcBIO
         ekUFY6fpD/yEFbf2bn89kaUpnCgSvy6I6Hs9xATQakdwsjDf3a9eEdiEPXsghbrWclMT
         6nMEOnjEH/zixmmErvOeAy3vRQstESUoyha/UjNbSwhm/6IXGOVMUcQCfHjRzEMI1AsC
         DMgbrljF1s0LE4reAkD6+r23qT9jXOBTcfohNCZF54zrbdIYi+zuMuTJNa/YxEzp9z7Q
         s9NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=zvGW3cZzDFGR2yjUaz65XyVzWZ6iLhj+wpWm+JU/QDk=;
        b=PRRoIuPN8dWA/ZTESHjO/GZZqlxRxeOxZV0yn6DcZQQD1NyGyBe1P9ezhvA8iFcyxE
         hkq2rhbXKBHALOReG3WWuOXBW37emrJDl1lZA6UwmMc4xMKliM3PtSibfgapzi8Au8ff
         r3CmWYeBHdoccfsm0Ldcl0E87BCmAoatx2ahZAGehEcYQ8XiSxeQhoicSzp2yIeelYA1
         LatrKHoQu/Cv4HX1L8gk7UPWq4vscFG+ei+4eU2BcV8zODW6LWhWrrYkqf/R+MAbUh/x
         cXCGTsXVOWRs7sWbFZ3fiHljCP5ZbK6gu7Aay6QAg+2vaBBJkebzEJdQ0MtWfgE5oEh1
         F3mA==
X-Gm-Message-State: APjAAAWr0QXPzi3ylYnYJftHU/JnTpNnKaU797T6BofI8iJOduc5dm/w
        rbWQNidCR/0JLwlE0Dk3seZdHD49u8yFQQ==
X-Google-Smtp-Source: APXvYqxS46z66N1GAzJaAcCRLvykIm+AuLL9qPbxgbUrzIVkrLgu1z3Ms4G8uKJcxxusOeQ09TLwXQ==
X-Received: by 2002:a5d:4041:: with SMTP id w1mr1933525wrp.313.1567678704410;
        Thu, 05 Sep 2019 03:18:24 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f6sm3996480wrh.30.2019.09.05.03.18.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Sep 2019 03:18:23 -0700 (PDT)
Message-ID: <5d70e0ef.1c69fb81.6e7e1.19e2@mx.google.com>
Date:   Thu, 05 Sep 2019 03:18:23 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc7-63-g151a41014bff
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Branch: devel
Subject: linusw/devel build: 6 builds: 3 failed, 3 passed, 3 errors,
 4 warnings (v5.3-rc7-63-g151a41014bff)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 3 failed, 3 passed, 3 errors, 4 warnings (v5.=
3-rc7-63-g151a41014bff)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.3-rc7-63-g151a41014bff/

Tree: linusw
Branch: devel
Git Describe: v5.3-rc7-63-g151a41014bff
Git Commit: 151a41014bff92f353263cadc051435dc9c3258e
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 6 unique architectures

Build Failures Detected:

arm64:
    defconfig: (gcc-8) FAIL

arm:
    multi_v7_defconfig: (gcc-8) FAIL

mips:
    32r2el_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    nsim_hs_defconfig (gcc-8): 2 warnings

arm64:
    defconfig (gcc-8): 1 error

arm:
    multi_v7_defconfig (gcc-8): 1 error, 1 warning

mips:
    32r2el_defconfig (gcc-8): 1 error, 1 warning

riscv:

x86_64:

Errors summary:

    3    drivers/gpio/gpiolib.c:1402:2: error: 'status' undeclared (first u=
se in this function); did you mean 'kstatfs'?

Warnings summary:

    3    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    1    drivers/dma/imx-dma.c:542:6: warning: this statement may fall thro=
ugh [-Wimplicit-fallthrough=3D]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sectio=
n mismatches

Errors:
    drivers/gpio/gpiolib.c:1402:2: error: 'status' undeclared (first use in=
 this function); did you mean 'kstatfs'?

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mis=
matches

Errors:
    drivers/gpio/gpiolib.c:1402:2: error: 'status' undeclared (first use in=
 this function); did you mean 'kstatfs'?

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 secti=
on mismatches

Errors:
    drivers/gpio/gpiolib.c:1402:2: error: 'status' undeclared (first use in=
 this function); did you mean 'kstatfs'?

Warnings:
    drivers/dma/imx-dma.c:542:6: warning: this statement may fall through [=
-Wimplicit-fallthrough=3D]

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
