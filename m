Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3FAD19A9A0
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2020 12:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732147AbgDAKf4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Apr 2020 06:35:56 -0400
Received: from mail-pj1-f43.google.com ([209.85.216.43]:55059 "EHLO
        mail-pj1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732146AbgDAKf4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Apr 2020 06:35:56 -0400
Received: by mail-pj1-f43.google.com with SMTP id np9so2526425pjb.4
        for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2020 03:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=oQa/fwS7PPfiZdQvzQGyxRgOBgzynpOSOHFNC7YD+Vw=;
        b=fG5Ghi1istzpHkh0kGOB6AP0NKjbsyTVUknvF2Za1szP6dB+GRmXayyVMrpg9cBuOV
         w5FD3vC2OaBf8yZCYURP/A8+gFRuiraCb3WpahUOKq2NHaPOUY6y1Wd3M22mLdD74J78
         BLou9BGvMDzwivBsY1itMmNve99VcQmSMWeH+va6YPzX+7zyGNSjkLW4BPJA11+RSUf2
         UkYzvC+R9RNIILrnvcdtKc/A8/tEsszdJP7JSTB8+GD7Cfur5AhvCwmC7lRyUeq+/gmn
         PUOP3Hs5w+xzmVL2vOc/ThTiR7lw8iBBbcdHDlXxEdvT5rod1Ta+8Nd5Ycb5eMSJhqbK
         btNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=oQa/fwS7PPfiZdQvzQGyxRgOBgzynpOSOHFNC7YD+Vw=;
        b=Ga/AMK1SZf4h4+rf/hhNCuFiRd8+d/xCYSf3xDjXahLKt0Fh3emY+/RhbY2w68u+Zk
         0Ok6Oi9e3MfIkyhPfC2DLmyMPM6zB3KbwT0yaPWqZ5QqtlposyPXRXObqQPIg0GXzAwQ
         ziwZ5rJjIRxRvI7a0wHDxxNMApSiCVK+hq1xABMpfh5/FeykjDI/vAci0KJRVSxWcn7U
         R6AJMRL8I2SFZj1B5VkdCHepL9dxXh5epgBRHlAlAhKJBlrUKSA701k3G2F4gBTEQrTx
         cL5FgRr8R54BDNLcSgg9zdiJ5kmiDSFQXRrQM5kYMuwFSn4JdCKkZ3bAhNdWRiQsRqvR
         KgvA==
X-Gm-Message-State: AGi0PubIDzgpc+pVhmvccE1zsX0N33pFhu7XmNZLzsJ1MBwE3szigh0U
        BypNVizL/x4/TOgpuM3gbCeBe10uN0c=
X-Google-Smtp-Source: APiQypKlCPF73dbz3mgKOPL76ZiXie2dFXCvp5AUKi/H8sdFUOH0J8lvbh/DMr8Ah2A+pfLo19Zisg==
X-Received: by 2002:a17:90a:1b4f:: with SMTP id q73mr3658771pjq.188.1585737354886;
        Wed, 01 Apr 2020 03:35:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t1sm1166408pgh.88.2020.04.01.03.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 03:35:54 -0700 (PDT)
Message-ID: <5e846e8a.1c69fb81.7cea3.5375@mx.google.com>
Date:   Wed, 01 Apr 2020 03:35:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc7-61-g33dd88826319
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel build: 6 builds: 0 failed,
 6 passed (v5.6-rc7-61-g33dd88826319)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed (v5.6-rc7-61-g33dd88826319)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.6-rc7-61-g33dd88826319/

Tree: linusw
Branch: devel
Git Describe: v5.6-rc7-61-g33dd88826319
Git Commit: 33dd888263199676946f1c789e821d39a9a79d98
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
