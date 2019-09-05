Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 671FDA9F71
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2019 12:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731012AbfIEKS1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Sep 2019 06:18:27 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43772 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732708AbfIEKS1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Sep 2019 06:18:27 -0400
Received: by mail-wr1-f66.google.com with SMTP id y8so2046043wrn.10
        for <linux-gpio@vger.kernel.org>; Thu, 05 Sep 2019 03:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Vkus2YB9Gq4Rdedu25N4tcGW59OKmoy2Ah1JDfv9mlo=;
        b=oueS6yjCQ+VmyOsonJNKwyTxvd6TWB1kky4Qf7LJ3cpBoaEogbOCqaj8DsATvqC2F/
         rI+uSVzZ9gxARtASMx0R+CX4KxKX1cdk11eAlL0xKq4lI+aUD293kef+aySG0SZZTls1
         R/zr7JN4zoHZ1WvLtjHZnuum5MHcYuRAVOkXeJ1/p0xZOCMCwNldI1wi83AhUUukbEcB
         1Kh7KW1ietlqklEbTw+CX5EGZ2pfHUBZL67VtFetiaXFsXpMvw9vFAvqv0lYFpsruzAH
         wDPgc0UldaTLSEvHXalK9CCzlR03tsbFjDhFbaO1A/te1EsgLpUbDoq7HswsWqEZJy8G
         w6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Vkus2YB9Gq4Rdedu25N4tcGW59OKmoy2Ah1JDfv9mlo=;
        b=SevtVSdP3P26s739UqbnqkKYEffmK3HfSUXjkGiQ3vTZVmYEkBWXuFvPB8Nw4nQL3Y
         6VOm1EA5dpYuk82h5wZSM0sjDnm66Z8Hb6rhQk8gyumbqCK6f1Q+h4NqQsUa5bxYOPIn
         xJwVnfeQsLZYyZ5yCdj9bKYdQDcVwftcfIB7uwppx7uluZvnJ8Nzz2pALRIsx3m4jMVN
         B0GR3YVjfEek/cgkyNDqRTPQaNxq2eNQe+v+xXTCBGlomFJpWOyntSPJPG07wkcOMCyG
         5OPRjLGUpjx1tbo/MfIXfL4/0ChgeBQdtDNljbHvTthp1kSek7pjsdQ0jXEFYz+jokRl
         vcaQ==
X-Gm-Message-State: APjAAAWFY4Vv7H4JCKUHzZXJv+0rdeaMOmOrCUQr8iRVzPN0uVOrkKVW
        4lU+8tARz13TVYiDhK35uzugTEw+Cjzbdw==
X-Google-Smtp-Source: APXvYqw8GMZmCB4rFs83AzPHEo4DtD49TxP+fpDhPgAMUu5fA+MwvCDf3clw39zA9rOcgQ9LKnikqQ==
X-Received: by 2002:a5d:504d:: with SMTP id h13mr1931341wrt.342.1567678704774;
        Thu, 05 Sep 2019 03:18:24 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id n8sm3305452wma.7.2019.09.05.03.18.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Sep 2019 03:18:23 -0700 (PDT)
Message-ID: <5d70e0ef.1c69fb81.86288.f74a@mx.google.com>
Date:   Thu, 05 Sep 2019 03:18:23 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc7-67-g0481c073211c
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Branch: for-next
Subject: linusw/for-next build: 6 builds: 3 failed, 3 passed, 3 errors,
 4 warnings (v5.3-rc7-67-g0481c073211c)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 3 failed, 3 passed, 3 errors, 4 warnings (=
v5.3-rc7-67-g0481c073211c)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.3-rc7-67-g0481c073211c/

Tree: linusw
Branch: for-next
Git Describe: v5.3-rc7-67-g0481c073211c
Git Commit: 0481c073211c5fa98f97d3c798f2d104008ce286
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
