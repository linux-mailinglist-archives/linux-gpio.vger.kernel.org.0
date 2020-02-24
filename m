Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9E3716B0B3
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2020 20:58:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbgBXT6g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Feb 2020 14:58:36 -0500
Received: from mail-pj1-f51.google.com ([209.85.216.51]:51647 "EHLO
        mail-pj1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbgBXT6g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Feb 2020 14:58:36 -0500
Received: by mail-pj1-f51.google.com with SMTP id fa20so214161pjb.1
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2020 11:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=e7QGpSA035HF90ERHtQdWc8ZQnmmkthbrrzv+mMRbuU=;
        b=EwH/C+rbP41W+TQCFGEXYK+5V6oKCxVf0sAWTdsX1bPp6QX1ZxwR8QILnn8ZzAv7tN
         Se2bvtAzT8lO3MuHa+bY1MjgEgTyH0EJCWSsRvcXbIZdfC408iZoSoLQVfKgEV/VTKVp
         kDNSz5nDZdIKJTiKMw1xVI4Dqwm/12o5yKgHLzt7Gb8Oy3jLEQTnoQcnbYqbZuWRmi4o
         4DLi80M3Bp4c2fDUxb4LDlRkGFcaZbi7cAsXJD/XaGc/GSn1kUFviLFEsG5dO4AwyTpS
         G9HQEQIuvS+9wEgIHc2Pb8ZmXv7xao0unqQlUDmRHBMvmh1Yq347YgnJI7HRfssPUiCK
         0LEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=e7QGpSA035HF90ERHtQdWc8ZQnmmkthbrrzv+mMRbuU=;
        b=okH0UYEyQ941mQWctHGV8si7+w2k5VIvDBsfVpHIHuT0X8t9OiiGs+5Ltv1K7nJg4B
         d6oA56XGVV4577wG0ZxBybPyV1h4/sr/g4yAzCKc4uZzjYpCrY2EC8p90I+L567k0b94
         2kbb3xrdN0XwLGBxwnfsHkTYikgrbAwSsB+FSKQObY+bSVRW/nWyIZLZoX8XgzVJA5ZG
         5R28SYaoRPKBItl5k3yE7VUDRYo87rOJizga2P54LHCRWHDPJuty5Akk60iRaV8Esk4H
         WJqCrZD1d5FLulozbHaohADsQ0Iot02s0UnfKuA3nO7CU0nt1rmODeFYdanC5k47PorU
         Rubg==
X-Gm-Message-State: APjAAAWKBrkGGdT3mXzg6Rq2anI/hB7EzpQlvp4uPj550k0IstiWZSI+
        KGTUWQdx0kV0KpQaV/BeSzidCBT3cxI=
X-Google-Smtp-Source: APXvYqxjKxnNMtpnyzChcNLBuXbVLMA7h5+yRig3Yxuli26iMNh2PyHSTcpTar4LTrZTnGfAv3T8PQ==
X-Received: by 2002:a17:902:8b88:: with SMTP id ay8mr50313794plb.202.1582574315403;
        Mon, 24 Feb 2020 11:58:35 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id bb5sm305991pjb.8.2020.02.24.11.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 11:58:34 -0800 (PST)
Message-ID: <5e542aea.1c69fb81.b138a.110e@mx.google.com>
Date:   Mon, 24 Feb 2020 11:58:34 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: gpio-v5.6-2-20-gee82ebf16ccb
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next build: 6 builds: 0 failed,
 6 passed (gpio-v5.6-2-20-gee82ebf16ccb)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed (gpio-v5.6-2-20-gee82eb=
f16ccb)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/gpio-v5.6-2-20-gee82ebf16ccb/

Tree: linusw
Branch: for-next
Git Describe: gpio-v5.6-2-20-gee82ebf16ccb
Git Commit: ee82ebf16ccb97780b02aba6f58cd9b397723a5b
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
