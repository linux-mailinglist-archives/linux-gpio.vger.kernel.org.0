Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2290A13296A
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 15:57:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727994AbgAGO5F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 09:57:05 -0500
Received: from mail-wm1-f54.google.com ([209.85.128.54]:40110 "EHLO
        mail-wm1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728171AbgAGO5F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 09:57:05 -0500
Received: by mail-wm1-f54.google.com with SMTP id t14so19721675wmi.5
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 06:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=f4qAp04JRlFjCJzNkD6Kd3Rawquh4ZovJj5O83qElgU=;
        b=U27U4I+kqGShaKLTt4BpDGcWM0iDSATiqdOQAM1VgFLo5Flglq67MEoDa5qm+aekeX
         6SJk5+GnpFCoBTuXS188KMLgvA7fx5U9oJR/FO8wBdZLM+DrJTNcvYNDXIyVh1uMHyyf
         2Kk4VfOYUV6HFR1xUsjRIB6IQyUMGnMwsYT+8RavyyKIp4eCVEQdzC2hPPTD/iJ2OZjc
         x1IauBs7We8ddt887eot67Lmz5W7/Q/va7bkwMivUDM0HtsCYt9a8lGV67LboV+3a1bV
         iZ8hbCZ3BXqdmwMaFluVoDbbbpKyLbribKVPeAX/DZnUtwVo5kIZx21WmIxNT+phPiLe
         iq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=f4qAp04JRlFjCJzNkD6Kd3Rawquh4ZovJj5O83qElgU=;
        b=BlVFQf/0lx107AbzWwzziYRty6R8TeLHtkurIjkvWV4H37BxxCQnRI0yEH+2nBH9n1
         a+vQBXaoShqtywE5HCmV5KdSauyrQ/c0/xkPQ3ncpTUhsd6eCojlr+T2GhDVqLlXzleZ
         KdmrnTHX61uoGAXv4h1AnAtAtcNMpJ0SJrJzYmVnDOceZ7HSQ3A2BqINuvqtt2NitU70
         taOdFdekpEU7kFuuUu0r3I6eIDdJjDAWjv768sttIGNEHG8J84QTj9/A7QzCFPT3towh
         11/5JrzzgOhLj/cHX+vP4ABU/yOpdOAO2bpnvKOS5nyBL39D98pv1L/rTeamJ5KhTkRG
         Gazw==
X-Gm-Message-State: APjAAAVueFtSj21ESXycIc7vb7xUg6tOud2zKz8+a9wKhG4GUPcAqy4y
        4u6SSvJUwB8VcuL+XXNIBA1RpMxcsyy8OQ==
X-Google-Smtp-Source: APXvYqyPXc7NSyVKvRVt9MPhVG1r/OLDsrW7ixrLennaY48peRA4r40eChLe0G84OA3AYXn1EyqFug==
X-Received: by 2002:a1c:628b:: with SMTP id w133mr39868423wmb.25.1578409023362;
        Tue, 07 Jan 2020 06:57:03 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 2sm94983wrq.31.2020.01.07.06.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 06:57:02 -0800 (PST)
Message-ID: <5e149c3e.1c69fb81.4ebeb.06da@mx.google.com>
Date:   Tue, 07 Jan 2020 06:57:02 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.5-rc4-6-gaa23ca3d98f7
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Branch: fixes
Subject: linusw/fixes build: 5 builds: 0 failed, 5 passed,
 1 warning (v5.5-rc4-6-gaa23ca3d98f7)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes build: 5 builds: 0 failed, 5 passed, 1 warning (v5.5-rc4-6-gaa=
23ca3d98f7)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.5-rc4-6-gaa23ca3d98f7/

Tree: linusw
Branch: fixes
Git Describe: v5.5-rc4-6-gaa23ca3d98f7
Git Commit: aa23ca3d98f756d5b1e503fb140665fb24a41a38
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
