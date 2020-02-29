Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7DC217488C
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Feb 2020 19:03:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727461AbgB2SDs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Feb 2020 13:03:48 -0500
Received: from mail-pj1-f41.google.com ([209.85.216.41]:39370 "EHLO
        mail-pj1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727209AbgB2SDs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Feb 2020 13:03:48 -0500
Received: by mail-pj1-f41.google.com with SMTP id e9so2641788pjr.4
        for <linux-gpio@vger.kernel.org>; Sat, 29 Feb 2020 10:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2r1QtGwVNmSw5Nf/YjqPoSgR725tiZFaQ5NSUWn6TIE=;
        b=h0ddFfdlRprDP97rPGwC3M1ESmhVnQnAW1cbWVr3MLdtVQo6BEqrMr6nDQVJKfOIid
         J2gqkWO/dbHSWJwbsaTUp4pOVueGxp5fiaxG6E8eAmHXOlC7kysF1Rzd7HVd92+NQ3sc
         wAh1axUkWCuKqrUBjDsLka14pQsR1MvZ2X7IjzlBXFDi4hF8y8u3eyUsKim28YGzO5Hh
         qZMI7I2jSy7kDWopGEAtf1MnLjQtU0zMLhZrfsKPuhuG19YdXjpPwCxt2kjzBzj7ppBr
         2eVJngNfes1yqjcM1HIpMWrqwjU8xykt6ZhSMWyrL1PxyIBdVZ1BUZ385Ikh589kxSS6
         qPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2r1QtGwVNmSw5Nf/YjqPoSgR725tiZFaQ5NSUWn6TIE=;
        b=LLjAl4MQ572cgE6Fioc9/T1D0jjhyajF6r+EIqPbInPmnNdKmIKf36iAxGhUOZCeYQ
         rv/8vwEI0R9vRy3ak9CWN3iI1gy36wyqV0++MH6YrCEsUSQRhYJYONHATHF5AGL3W657
         9IZW6TfchuEGea1Mx8KNWpt4i5hy+RNmT/mB6OqX0bbVV9DU9RAtgC9XJXC3htMdR+ac
         K+EYvcow5vz1E9ngTc4yvxcYqTj3nNgJ+h1CIvh1M78IbeUBxPIL7k3MRJk3BeLzRKWu
         66KB4zD54Lt8X1RGFosNe35xpU/hz0wwh4/CX1hSoWvptDWhXrZJzNdvtGoj0bY0+0J/
         /o+Q==
X-Gm-Message-State: APjAAAX4h7atESp5+6BZxYYJJC/7HjNgTjya/dHims69RuisjJge2Dgu
        0EGHBtx2hKBLzY0iAkyvkwW/POttPbI=
X-Google-Smtp-Source: APXvYqzp9LF1vlqVa2eS+MMuYJhmu4kPgokWzZ6pGfc70HmCHj6cjNcNv9IwiqQxobEfveXFbfMZzw==
X-Received: by 2002:a17:90a:198e:: with SMTP id 14mr11410993pji.44.1582999426893;
        Sat, 29 Feb 2020 10:03:46 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h13sm6622863pjc.9.2020.02.29.10.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Feb 2020 10:03:46 -0800 (PST)
Message-ID: <5e5aa782.1c69fb81.a6f31.f579@mx.google.com>
Date:   Sat, 29 Feb 2020 10:03:46 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: fixes
X-Kernelci-Kernel: v5.6-rc3
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
Subject: linusw/fixes build: 6 builds: 0 failed, 6 passed (v5.6-rc3)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes build: 6 builds: 0 failed, 6 passed (v5.6-rc3)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.6-rc3/

Tree: linusw
Branch: fixes
Git Describe: v5.6-rc3
Git Commit: f8788d86ab28f61f7b46eb6be375f8a726783636
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
