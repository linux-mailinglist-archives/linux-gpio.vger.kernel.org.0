Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E79612DA5B
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Dec 2019 17:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbfLaQck (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Dec 2019 11:32:40 -0500
Received: from mail-wr1-f49.google.com ([209.85.221.49]:37554 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbfLaQck (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Dec 2019 11:32:40 -0500
Received: by mail-wr1-f49.google.com with SMTP id w15so22933545wru.4
        for <linux-gpio@vger.kernel.org>; Tue, 31 Dec 2019 08:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=bh0y/+DKwoP/lVhukCo8abqVutrdJ3VeSTpgGdhA3ig=;
        b=m/AhFhpJgHU5CKcl8TUs70MBLq8O9RxvnGN1BgsgqB413gweDrmHPwY2dyj0x04u2Z
         nH89eZfhEUXeumUVZ1cFYKdoqq11Pv8vqqMBv71yxtMgH+pODXppTATr+lPQpjCLeJN/
         HmC9VAG2utro3PH4uNLBeyh+6Xywu9YVzo/A2E8AuZtr4iScxakki9Q8uFohQYrQadRi
         pvDnP4EXZIWsk1ubB+5nqtwUnmRZwF+yFBpc9gXkbl/B+yWLr/niKN2paBbXzVHZ3cJq
         UQJs99Kb7X1pCSAKsxJrAhBmmJMCE+RL8MJzojYqf7LTMJUs1Q8BmZjHwQx7UYItqtu0
         QhnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=bh0y/+DKwoP/lVhukCo8abqVutrdJ3VeSTpgGdhA3ig=;
        b=TwMOBJcASi9XwXoMcJ2Q8clO8oUOaniALja5xPhy39WmZFa8YHcfR4ENJJ2sYXbkkO
         Z1Ge8u2Co2B1QIIqRXgI934Kq8qjF1rht/oG3yWbpDdZCJCPH5wAQj9wGhvIjNXUzKxM
         9X8hrT6id/6KnUIFVl4bWGxzIGb3g64lld9oxN3PrSu61bwzKiELQnBUU09uB2Y2LeMe
         nnL1EG4qKaecQImsc3Tdj7AoQnCuFIn+2N7aupxn8n2oD1pNMTwCSbRKMsCU0XUHtVF4
         633436y0eFza08h4g3pRKO6s6xkI70qgDR/4ibiIqHPvyQiZrUkSSV1XtF7XbfjEn6+V
         RqeA==
X-Gm-Message-State: APjAAAXh/3q2qZFMCyz8hhv/RzfHih9m0Ih4jhpoWValIWLjjbdY4v8J
        Gj8TyqKUBD2i6v0xonoc8oGGDNjVPircHA==
X-Google-Smtp-Source: APXvYqyPt8XIPpMbcQSpM1lobSwIsFN7Cyr9BcXFAxf+xQrLnQH1dee4/y5DfodV9kI8Q66lGzxoIQ==
X-Received: by 2002:adf:f3d0:: with SMTP id g16mr75864580wrp.2.1577809958292;
        Tue, 31 Dec 2019 08:32:38 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id z123sm3034984wme.18.2019.12.31.08.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2019 08:32:37 -0800 (PST)
Message-ID: <5e0b7825.1c69fb81.706d8.dc6b@mx.google.com>
Date:   Tue, 31 Dec 2019 08:32:37 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.5-rc4-9-g331d7ae3fa15
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Branch: for-next
Subject: linusw/for-next build: 5 builds: 0 failed, 5 passed,
 1 warning (v5.5-rc4-9-g331d7ae3fa15)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 5 builds: 0 failed, 5 passed, 1 warning (v5.5-rc4-9-=
g331d7ae3fa15)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.5-rc4-9-g331d7ae3fa15/

Tree: linusw
Branch: for-next
Git Describe: v5.5-rc4-9-g331d7ae3fa15
Git Commit: 331d7ae3fa15f36a25fa83590d4bfcfc0e37a73c
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 5 unique architectures

Warnings Detected:

arm64:

arm:

mips:

riscv:

x86_64:
    x86_64_defconfig (gcc-8): 1 warning


Warnings summary:

    1    include/linux/of_mdio.h:58:13: warning: =E2=80=98of_mdiobus_child_=
is_phy=E2=80=99 defined but not used [-Wunused-function]

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
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    include/linux/of_mdio.h:58:13: warning: =E2=80=98of_mdiobus_child_is_ph=
y=E2=80=99 defined but not used [-Wunused-function]

---
For more info write to <info@kernelci.org>
