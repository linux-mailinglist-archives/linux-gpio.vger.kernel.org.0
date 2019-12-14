Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 941A411F004
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Dec 2019 03:37:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbfLNChv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Dec 2019 21:37:51 -0500
Received: from mail-wm1-f42.google.com ([209.85.128.42]:33693 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbfLNChv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Dec 2019 21:37:51 -0500
Received: by mail-wm1-f42.google.com with SMTP id d139so670261wmd.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Dec 2019 18:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=wzjxUlDA2SLTmgi2oiyvZssn/AzHAMOkVWnxUjlJTWk=;
        b=sgm+HrXmSV7TwMYqo8baqZXt6SWzosRujXuEkSRi1wQJNDxhLncYq3hFRmII53QBVW
         q32U/zLnHKLGcGIx/Oih7qDQTZccjOISfdY1IYAMfJKe7eLv55BXpMKT05bfUbON2WcQ
         Wtst/Akv5lRzJ7IlrPBZd8jkTeClVPAPOiaTjAt2Y7VeJk3FurYtaOt1iD8ccoVWtztu
         qc1CrwRgIzXT0BU2HbkAK7m3o6FxNMdXzGHJQE0Lpg9qiAuJA6LcYboylbE8YXJsNSAb
         RFKbNHoMR1H1vbKLWgJM9tlOsmIKIn98lG6cawYKIqCgD/dv3YPO0bCQQBd9InEwPotc
         VMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=wzjxUlDA2SLTmgi2oiyvZssn/AzHAMOkVWnxUjlJTWk=;
        b=DDz94LZP/NLM/GYRc3AyJou+g5Pun0vjA+bnS9esRlgL2ohgVZBAj8gGZVGty662Ty
         50vBtZNxaPEnVblIimCZXGRDohdLvKEJrxYWQnDCovZE2eIyYcLXAMSuA6X+DoK3Z2ha
         /ij37SoDetbb+IyLXNcrZm9c3+48CeRzZPza0z3S+m6LTrapJXsEPZTtxxquabvD7Rtl
         j4Vfa8HeSeJVx+VkIm+sti9kCfV3DyLXW7ojR3PP0qJCrEeuVd/hY4xvYYtlQnxphwUC
         KZosJDncln0wt7lXsVUs4tfLEAkuvX2DhGmkuyAuC09p+k171FXtETIxmBzIGjGdNCdm
         E3Pg==
X-Gm-Message-State: APjAAAXAwy+PN4ADJvis4EypF0TqNOyKyxxYagrsfVBjgaHwMfjTYdOX
        t2I0x1rRfFsG57dDAEyqa6NS/5/X0qXu8g==
X-Google-Smtp-Source: APXvYqx91Slm+GXtJsXpX246rAKqXPlWQPAywPj6IoFe1xOEMXB/FuWiPFjJwICtvRXB1Svxrhp6/Q==
X-Received: by 2002:a1c:7c18:: with SMTP id x24mr16995992wmc.21.1576291068370;
        Fri, 13 Dec 2019 18:37:48 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f1sm12173437wro.85.2019.12.13.18.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 18:37:47 -0800 (PST)
Message-ID: <5df44afb.1c69fb81.f3b12.ec71@mx.google.com>
Date:   Fri, 13 Dec 2019 18:37:47 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.5-rc1-7-g894731a5c9d0
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel build: 5 builds: 0 failed,
 5 passed (v5.5-rc1-7-g894731a5c9d0)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 5 builds: 0 failed, 5 passed (v5.5-rc1-7-g894731a5c9d0)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.5-rc1-7-g894731a5c9d0/

Tree: linusw
Branch: devel
Git Describe: v5.5-rc1-7-g894731a5c9d0
Git Commit: 894731a5c9d0ea801a7ea1aba2f7c7b69fef6e85
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 5 unique architectures

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
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---
For more info write to <info@kernelci.org>
