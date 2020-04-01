Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC5BD19A2EB
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2020 02:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731531AbgDAAby (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Mar 2020 20:31:54 -0400
Received: from mail-pg1-f177.google.com ([209.85.215.177]:34560 "EHLO
        mail-pg1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731523AbgDAAbx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Mar 2020 20:31:53 -0400
Received: by mail-pg1-f177.google.com with SMTP id l14so4073471pgb.1
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2020 17:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=N+ZAIPpMttAlLQqC1VERVdSES3bYtZWnLqIJBqJiWRs=;
        b=XNIRO/8L56w62QGoa4FIEnMStmt5AUZs46Ma+vj/TUMiMmqV2PXecGbX0kW1DJy2tb
         XUGVJF3/PSeaoWcMyYLVWxGoDI+kimiGFiP0kCFAg6N76ezbcoq6TzP5Naca0WLDn4YQ
         h2NbCCsgS6oqUWJeLXxPS1MwKSnNTXk8fdCO2m7wF5nIpzKMtPBJ/HVHvEK+U3nowXOd
         WQY47MFb5z7m6USrf2EZOqJBDWQoNli/8FKwvp/VAQDq0TGwGhNsPvEi71GPrlTe0F37
         Usfu6n2pTVpkB+COGlTrofBn5vX4u8uplvw6Lokn0ULYrRB/ETuk3pls9mZdqoq245Nt
         qeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=N+ZAIPpMttAlLQqC1VERVdSES3bYtZWnLqIJBqJiWRs=;
        b=j13fHQ12DlXLcCz9O9gTvluazoXcGKC5xhaFdiOYYjU33De4Tb2/P2dmJqfxodazkE
         13j33dPk6MGCr31dTttYxiQ5DpXRbe1evDf1EDuIwrZlm59DVnWHYzGYsZPQJP+US8jj
         ydAHz9GzKEMSKIYQQ1RI+dvyCShNTcl/S5LCqfB2ZwjALLBGD70Gbw4VAp/W4Z5aA/5v
         AKzWiX7bqUxkUAWUcXW+GYBH6CYR1mFitQKdvnEXuRHi49uyp/cg5vvKA8vaxquG1UAG
         FEKuh8RAk7PrQN92lXII7SVn45w2l2dmGuPMBKfgUExRpbJ9iJJNm5c+phADL/Ewkz95
         WTfg==
X-Gm-Message-State: ANhLgQ3VgM18JXxUl2khnmRoTulTKOupCggIBpg+DajFXAGKNAGpdEyS
        pcsq3x8ur1K1f3uGprbjnAd+xbIL1nw=
X-Google-Smtp-Source: ADFU+vtSP1qJePDS2U0677Q6DHjQvgsaJs/QWl+aUN+NLhbSemClSIA9IonN/Dgmx+0NHgE1f18yeg==
X-Received: by 2002:a63:da4d:: with SMTP id l13mr20572290pgj.216.1585701112313;
        Tue, 31 Mar 2020 17:31:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b70sm258860pfb.6.2020.03.31.17.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 17:31:51 -0700 (PDT)
Message-ID: <5e83e0f7.1c69fb81.7eb8.179f@mx.google.com>
Date:   Tue, 31 Mar 2020 17:31:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc7-60-ge45ee71ae101
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next build: 6 builds: 0 failed,
 6 passed (v5.6-rc7-60-ge45ee71ae101)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed (v5.6-rc7-60-ge45ee71ae=
101)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.6-rc7-60-ge45ee71ae101/

Tree: linusw
Branch: for-next
Git Describe: v5.6-rc7-60-ge45ee71ae101
Git Commit: e45ee71ae101bd271c3cd951cf66341dc8f504a0
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
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
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
