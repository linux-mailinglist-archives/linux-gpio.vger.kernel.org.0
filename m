Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 432B0191BB5
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2020 22:08:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727682AbgCXVHO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Mar 2020 17:07:14 -0400
Received: from mail-pg1-f173.google.com ([209.85.215.173]:38278 "EHLO
        mail-pg1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbgCXVHN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Mar 2020 17:07:13 -0400
Received: by mail-pg1-f173.google.com with SMTP id x7so59504pgh.5
        for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2020 14:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=N8rs6cTEo4yX2287iuKj+g3RJw/znrYQWpZchgYswt0=;
        b=YxzIK72+y3CperSmTjGIWtVysdvAnVwCF2bIxqmPMx+h3UlM4Crmjrw+Z2GgzoSrjs
         WDVHkPVmIk76IVeDBVawlC7aWoaenWbHDYrf4hQIZV9B87L4vZoSvef/cibhEuBr/66g
         pB80LNS0/dALS8g835Q85bd7T5ROhmoWMd+py3jPE6snvNf5Dpt2HeboMMZXGIlFao0U
         FkKxiKd55YF9HjPgvzQbzczyOQ+FNf/EpShFeffMAphuMyvHmDtc0S4PxDP+dqWK+1LU
         5ZWTANQzVPdA9ri2HrHRXdouD82aQxv+jy7XgEWUnK/XubFuegOPWAAYZP7MxvJ97erT
         ZDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=N8rs6cTEo4yX2287iuKj+g3RJw/znrYQWpZchgYswt0=;
        b=MMeLeFxEGDmUB+fVA8I2TIFg/3Q7vGNymMOEXAXyor9N0P0sexaTGDmFC4uuDAcx2a
         tgb/8OQYTZRZPS+ldlnt5ucIOInevjZ9mhXOv0AAHOITzQxIy/ep20lJDpdVSftU8Rc4
         x9CF+cyTOcHUvvRAiN1R4rWNd8AhfxQ99U+TQFm4JqdzrogFOlJD5+qfWxz16/3N4Nfd
         uvyhcQ0E8suvGu6n8XmrgWoLq7VmZkrbuOLaj1s0/VZ2t3gEIowzLcvXo1d5dJnHqGQP
         imAKfL1evwh8d3dX/8KBRIN10mYx4EjXZKVkQSC3SKT5powDhM0CXz7mRF1xURvY5gov
         hHfg==
X-Gm-Message-State: ANhLgQ0x2O41BdslzAG7IqH6mbDPyWPjArnA43htJ02sMNroVHtALwZ4
        P3KhedlKTAMzAGkC1pYY38oEdhx4GJs=
X-Google-Smtp-Source: ADFU+vsPwkWGeUvdQZGp3gE28SIZq3NGMllh3oZ/yB7GKILj9KDAmosY7kgEv2qeTk1Ly+2EJi/sVw==
X-Received: by 2002:a63:b557:: with SMTP id u23mr7758288pgo.160.1585084031067;
        Tue, 24 Mar 2020 14:07:11 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r64sm3132725pjb.15.2020.03.24.14.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 14:07:10 -0700 (PDT)
Message-ID: <5e7a767e.1c69fb81.fa801.e70e@mx.google.com>
Date:   Tue, 24 Mar 2020 14:07:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.6-rc3-38-gb3e741a0f776
X-Kernelci-Report-Type: build
Subject: linusw/for-next build: 6 builds: 0 failed,
 6 passed (v5.6-rc3-38-gb3e741a0f776)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed (v5.6-rc3-38-gb3e741a0f=
776)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.6-rc3-38-gb3e741a0f776/

Tree: linusw
Branch: for-next
Git Describe: v5.6-rc3-38-gb3e741a0f776
Git Commit: b3e741a0f776152b36395ba97f94d5bd2d71c09c
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
