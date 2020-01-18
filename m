Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD1C7141734
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Jan 2020 12:24:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbgARLYB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 18 Jan 2020 06:24:01 -0500
Received: from mail-wr1-f42.google.com ([209.85.221.42]:33747 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727068AbgARLYB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 18 Jan 2020 06:24:01 -0500
Received: by mail-wr1-f42.google.com with SMTP id b6so25070639wrq.0
        for <linux-gpio@vger.kernel.org>; Sat, 18 Jan 2020 03:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=0dmcZ+3lPZmBbzbYCtzXnSAwmohJBXcw26dzEUB0Pts=;
        b=z/OcWgJwuYAeO7okCYUzJTmd7YH+7bJJgAZbqwhjjcjaoXC0f8cZOQ3rRG2WEkQtbq
         oyM8Eg4ayqRKg9JJOKlWpGJazqbHsjASyQEwkp/jbabsDx1qUWnjpxlGdim4oXBL8vef
         bV44fMUo/XxOS+6gdKL35jTkTxOjINswekKoAICsaktywXKAyJ2q93i9AnKl+Bm08HcN
         8pq3jq2rXxiaFkxIIb+I9te822qHzyodUuwhb+PETjjxklSFCRWQka+gTlSBO9UhFPHi
         r08fSEP3ANWd5G5oaB6gXfjwJ+WLSSrVlCSFP4t1eRCx/jlJmoYT2UJ8Vv+60IvIAXzl
         KAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=0dmcZ+3lPZmBbzbYCtzXnSAwmohJBXcw26dzEUB0Pts=;
        b=LM7LBs/+kkB1UTceEWmLMS7614rKZ6DHQZFs99eJqQ8xZaRjM9w92l1GcDYqUjiBXf
         1Zd4uLOBV8Xm0AKPRa9flDDMxG5exJLT2bGymU5qNhfF09Tm/67UCDEOzy0SEx5Ii6jO
         upEKpoLUMc8QExBdh8rsYTJgL7i5e/xC3ovKOuXeuG8PSK3fLErZ5D/wkoQRpAAOi5WW
         3pc0n73P2bWr3XtVjkmtvgDmUqMuXkbhStqongNyJvtOvgPqWhvAIt+CQKB3ABMZN6K6
         ukHrPk2MPL2lA6/ZU6LaMYnSjyqM5fWNk0Akh4l+tjFUnuzaDOqEIzz5FtUxzyBBPhz0
         WDKw==
X-Gm-Message-State: APjAAAVGEmmwOBnccS1YBRGU0EBF8AvcdrWPn/29TLZV6XXC1H0RVDz2
        DIpGyYkLOTTrIRYXHNDxl7L9gHWoqDA51A==
X-Google-Smtp-Source: APXvYqy5q9N9ywlheZ3l7qj088kLv+rEXMV3kna9eYMMnVzzetD9Wr62+HPv9oCusSwb7WSO9ZF4IQ==
X-Received: by 2002:adf:f382:: with SMTP id m2mr8009230wro.163.1579346638400;
        Sat, 18 Jan 2020 03:23:58 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id t5sm37373330wrr.35.2020.01.18.03.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2020 03:23:57 -0800 (PST)
Message-ID: <5e22eacd.1c69fb81.faac6.7d48@mx.google.com>
Date:   Sat, 18 Jan 2020 03:23:57 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: gpio-v5.5-4-45-gd18fddff061d
Subject: linusw/for-next build: 5 builds: 0 failed,
 5 passed (gpio-v5.5-4-45-gd18fddff061d)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 5 builds: 0 failed, 5 passed (gpio-v5.5-4-45-gd18fdd=
ff061d)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/gpio-v5.5-4-45-gd18fddff061d/

Tree: linusw
Branch: for-next
Git Describe: gpio-v5.5-4-45-gd18fddff061d
Git Commit: d18fddff061d2796525e6d4a958cb3d30aed8efd
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
