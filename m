Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D86C518CA99
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2020 10:45:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbgCTJpk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Mar 2020 05:45:40 -0400
Received: from mail-pf1-f181.google.com ([209.85.210.181]:34559 "EHLO
        mail-pf1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbgCTJpj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Mar 2020 05:45:39 -0400
Received: by mail-pf1-f181.google.com with SMTP id 23so2970862pfj.1
        for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2020 02:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=JlZIxmi6RISFX7gyqNNsqeC4ZQIgs5XoTekZ7u1Ewwo=;
        b=lcxBrsuhQ/OFk4FrzGPADTZ6q8AVsqKoK+n8DsKP+8a18devTsJWvESl8GvbqB6Gpj
         Nv12oAYfoEDxoCLe5TmN0OPGO7h034xSLETBUcd6kbBzauSarcJHYacexoJsw9B0Dr4Y
         5QaS+nq/Hf+3zrLgIsZ5msHMHm5baHamzNrl7/Q+CBmaRDb1HPGKFgF7uQiht2p7xFBH
         +sonOoTI6de9aBBrxKJntpWis6iewx6WgG/Q0CBmXALHChMWoxpmteUPpp+REKzzC05l
         JgkcZhEi3V+t1dhFKrbxh43IBLMfCizKr5t27BQyl5NfA1XmCXgLnYRRgFMdPY17zkkJ
         Rweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=JlZIxmi6RISFX7gyqNNsqeC4ZQIgs5XoTekZ7u1Ewwo=;
        b=iNqeOz5FoanUDRSmDQFr4cUh9sHz0+bdBBmQBBExCyV24PKCV4vpsAmJ+m9qTJW/qF
         naQmdwpvZJjRerNSxdHM2weCHchVcR7tRwSOd0z3bImDrHJX+hyBbcSgZrvXXGVz9LCs
         Dt0P7jDpOy2KvP9+pUW4fK/CBpSvu1UY0ph0uE92nCHozzDRcvNaDuYocstZfanpiyKP
         5K2mSDM4OyxCpLwQIgmJKgIqOEv1H9ig1QsXBut4S6aouHIS+xtNG5wOutGMa8rKv5ye
         959Ha+t6NXivXSi1WaHBhHMB7dSmEqb6oO+GGR9bsTALDIiNsdZ2bWnZNMxZ9teD4Dn1
         i7tA==
X-Gm-Message-State: ANhLgQ3IsMED2Vp4k0mUW1oC2LGS30kMNj0gZNWUY+xVGCJnBeXj0hEJ
        FF7r6H/nqfJQnFrSbXUKqFSDWEuSx1U=
X-Google-Smtp-Source: ADFU+vsU4feocPfG4HFpeKGSBm/XWpJArxfJuqB2ozEbJhAC7J/3GpXPD0uiNN+ODt+t2MGAio9u2w==
X-Received: by 2002:a63:1e4f:: with SMTP id p15mr7938908pgm.28.1584697537137;
        Fri, 20 Mar 2020 02:45:37 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k14sm6268881pje.3.2020.03.20.02.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2020 02:45:36 -0700 (PDT)
Message-ID: <5e7490c0.1c69fb81.a0a9d.64d3@mx.google.com>
Date:   Fri, 20 Mar 2020 02:45:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.6-rc3-5-g1b26f3ba6117
X-Kernelci-Report-Type: build
Subject: linusw/fixes build: 6 builds: 0 failed,
 6 passed (v5.6-rc3-5-g1b26f3ba6117)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes build: 6 builds: 0 failed, 6 passed (v5.6-rc3-5-g1b26f3ba6117)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.6-rc3-5-g1b26f3ba6117/

Tree: linusw
Branch: fixes
Git Describe: v5.6-rc3-5-g1b26f3ba6117
Git Commit: 1b26f3ba611774c897d29228e4ba28919e0fbfd0
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
