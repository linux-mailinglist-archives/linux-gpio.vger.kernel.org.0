Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6486012DA5A
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Dec 2019 17:32:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbfLaQcB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Dec 2019 11:32:01 -0500
Received: from mail-wm1-f46.google.com ([209.85.128.46]:51837 "EHLO
        mail-wm1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbfLaQcB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Dec 2019 11:32:01 -0500
Received: by mail-wm1-f46.google.com with SMTP id d73so2201234wmd.1
        for <linux-gpio@vger.kernel.org>; Tue, 31 Dec 2019 08:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=1oqQs1hQRY6bMa26iWvxFMOYHCoSORFw3rmCMTg30gY=;
        b=ipaxJaQQHYqTyKIMQgpbHdVuG2S4ZSUgDkUPk4uyOFinZBD84dAN3JFHq/RLCuocnp
         dBGmTs67iDIGz/PAUub1cyVPKoTEXDXXqiFU12jnownX8DSkWmzY07jiiRQVsWcA4MXT
         ZxCM21TUvYLPwop/skBScyaOftmqoy+Wtrn39g6GnJZtA+YagpdlIqqLUVGBS6EzjUbi
         0SoDpVigrgRBTEJu869DcPwU0rq5wlbrZ4HaLgiu2FmjwKtY0FSqCi9rsK0QUKBDXiFB
         h2fKbVrOKNws2q1EJQsreowMqG/o+ES26aWpMhby0nlHMim9+p66BqNUzxU793IlQsGS
         HW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=1oqQs1hQRY6bMa26iWvxFMOYHCoSORFw3rmCMTg30gY=;
        b=T4kxmivroIiBH8QUIPGXRLD38RCz4vyYAXxpQGEqjtLq0RTy7fcsZEiMs4T1awu8zx
         YlpW6ohfn8qQX44gV5tA1rKXSGwmehXLRClDZ8xISKXkGWspaZpnUkWvDvKQGkdIJ3H6
         cD+Zd6fEeuCrkhAZ6sGyEzBp47JS8WHTwBzh2kWnfwcoZbkXfRpm4xcBohMyc0hsqNT+
         W8HfKLskNVfbjlygyXQzFfG8MZoI0Qd/QLc8+GXWiJhH4z4b22d18H5qN49vTm9yj+85
         VeJxgVdGezdPz6kEv/V2xY2OQyGjXsCAgQT7uxay7RjnkvPB4iTPPZ0zip+5BMZpEhr8
         N/zg==
X-Gm-Message-State: APjAAAXiDHBS8UXjn3sZQBjcj6R34nGJmIb5a1E9DJzZzN2JPAMqDtcy
        dvmhQ5TiWhEI6VViaaaPJ6SBcvv4YSOlgA==
X-Google-Smtp-Source: APXvYqz2tgRqYWiWhDL7oBwBhrkiwh6hzn/WXkI3AKTAwOOlrn+C8O7rli5pFMRownbwnyB/VDepoA==
X-Received: by 2002:a05:600c:21c6:: with SMTP id x6mr4861865wmj.177.1577809919187;
        Tue, 31 Dec 2019 08:31:59 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f127sm2967814wma.4.2019.12.31.08.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2019 08:31:58 -0800 (PST)
Message-ID: <5e0b77fe.1c69fb81.8ae8.d6f4@mx.google.com>
Date:   Tue, 31 Dec 2019 08:31:58 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.5-rc4
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Branch: fixes
Subject: linusw/fixes build: 5 builds: 0 failed, 5 passed, 1 warning (v5.5-rc4)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes build: 5 builds: 0 failed, 5 passed, 1 warning (v5.5-rc4)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.5-rc4/

Tree: linusw
Branch: fixes
Git Describe: v5.5-rc4
Git Commit: fd6988496e79a6a4bdb514a4655d2920209eb85d
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
