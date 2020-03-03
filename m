Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B28B177AB7
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2020 16:42:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728714AbgCCPly (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Mar 2020 10:41:54 -0500
Received: from mail-pg1-f170.google.com ([209.85.215.170]:40190 "EHLO
        mail-pg1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727725AbgCCPly (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Mar 2020 10:41:54 -0500
Received: by mail-pg1-f170.google.com with SMTP id t24so1702052pgj.7
        for <linux-gpio@vger.kernel.org>; Tue, 03 Mar 2020 07:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=CeKPvy/FgQ3+Kl2uo0A0SwVwZEWfDzjXWgkoOaBZjvk=;
        b=ehTCBdZPmkJS5fZvWY3I+SE/pzGMbV6AxuFMH4X61Ruw2Mh3/ZCf+axQJjb5aGt6iI
         pjcUKFo6Yo5k+72pxJ2c+s4U3DpEqursFnnMw7f+SB98cbyvT9dRgbJ2ivyyMSkvOC5i
         CNkjpogEyuCpfOpxWUIwCokKC2wzKfwdRZuCBBRAhkHJFcFPHYLasMBjC0Mck3aKU4eK
         XIAI8wWPxgsz2EOwzsiI3pMMpoCO0eWnESfhm5+2vwCOA4DkBa+aQTNXk+f2BkUH2Rdj
         pOyJxQK/a0e0LsiXG+tV/tvxYdy417AhRERUbo5agFGf5SvwgSINt8QPDFos54wwdUqc
         UOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=CeKPvy/FgQ3+Kl2uo0A0SwVwZEWfDzjXWgkoOaBZjvk=;
        b=roQ/ZZbG6ipwueMMntaHDR4yQqXDHlUxKydtSDEtOJHqhlKH6RftNCCbIUVfgXmj1U
         Q/gSfYXJns8UO2iTwF4GE2XjJ4CGbngoBpzV6FQQf1WIj0eyaCYmKGW+jIt3RBNS6/Ql
         P1Hhv/RFVyXLjnzKBhlGyZScSwAMYyihLbJmU4kttQ3wdzT4TXvqFgYi1n/Axgs6Fl8A
         ClnpmP8HTrXXx+zHtggd2mBikFPFsun4sghz5DlvE04++1GEfmbeb6AMW+m57GbaGP8u
         GdGOetZSnrA7vjNzzSJih57Z6VYf0ZXqlwZP+Om5naCgwpi3QCpSd6XKKM5ILa3jO8Iw
         p47A==
X-Gm-Message-State: ANhLgQ2DDIuAN6k1VzZ0y5VCVVp1eww7YFdBDj/qxXAW4R0vso1p+K2p
        KtoZpuG5JThxvx5WrbqQDwh14tM948o=
X-Google-Smtp-Source: ADFU+vvKkbI9HOIqQCaHR0YpDEyNljB7igLCPUXSCsvSEooWtgMif0eTIRt6mE18b1EP9VSIodEP/w==
X-Received: by 2002:a65:4bc5:: with SMTP id p5mr4497798pgr.409.1583250113083;
        Tue, 03 Mar 2020 07:41:53 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h2sm24679073pgv.40.2020.03.03.07.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 07:41:52 -0800 (PST)
Message-ID: <5e5e7ac0.1c69fb81.a1d64.0f6f@mx.google.com>
Date:   Tue, 03 Mar 2020 07:41:52 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Kernel: v5.6-rc1-26-g5779925c23e1
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
Subject: linusw/devel build: 6 builds: 0 failed,
 6 passed (v5.6-rc1-26-g5779925c23e1)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed (v5.6-rc1-26-g5779925c23e1)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.6-rc1-26-g5779925c23e1/

Tree: linusw
Branch: devel
Git Describe: v5.6-rc1-26-g5779925c23e1
Git Commit: 5779925c23e1b9cc4cffb6dafe0b70a47beb364d
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 6 unique architectures

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
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
