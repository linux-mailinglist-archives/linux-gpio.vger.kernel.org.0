Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2500A158DB8
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2020 12:46:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727975AbgBKLqw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Feb 2020 06:46:52 -0500
Received: from mail-wm1-f44.google.com ([209.85.128.44]:37062 "EHLO
        mail-wm1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727669AbgBKLqw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Feb 2020 06:46:52 -0500
Received: by mail-wm1-f44.google.com with SMTP id a6so3163398wme.2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2020 03:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=UUnQ8KANUeIQhM+pnUVNV8IDixkN5Qn/OPEbsjqPAeA=;
        b=V3BAVuf1jL7PBQ13QSLB/HUuPoIENx58dcghLGAgYl/rk7m3YqNgdZ2Tar0A2gKeKc
         0HAwVu55mA2IIoSUgHnlvwrTNjoJmYlrfAxLySnJAmyu419f+8zSmYkbBIM6QdG8yRie
         C4oGis3Bh9l+O6KR1AOFkeMniVb7ifSpRlp1Ktyqpi8AVlEdR7QopZNm350OwmK8LpcZ
         SxMHXO3au8syCfi5f7aHXyq35ZJ3WMl706I021RCI+vx5enbR2L69Mysor/9LTlkH8hC
         FGG67tGJUoEFoXuNM313d0aPUegKG4ewY7AyNVXeExKUzjCeY/g63YVSmE1fcM9TVxQP
         jf4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=UUnQ8KANUeIQhM+pnUVNV8IDixkN5Qn/OPEbsjqPAeA=;
        b=YOBv5kItXBmBuaShqx483gmM0wif7nt9xwpqmrwUv6JfCqoJTJlDNsA1q3AitvkGfG
         vaHp/oLn+Jnh6pTOkTuaZgtJ3o1/uEuy4EaLF0TfqlyZS5PSrOKJzWZZ4aEKv+JSsISR
         sjX1yoOpLAW6NFeSjRVC0yidHP4+Y3kaFHk7xjL74IqvseAg8MsxmN9xQfw3mB5hQkJb
         s+PPDu9uin/fUSjgeTvjqQgINF0NbFG+28hpKJQ8oTp8jKm+mKYUu8fNRtm3u9xRTLEy
         FmjiUVDCQT9c12MLG0NJheoB+QNh0axHT0Ws7TCT+Yp/NUM3BFBMXgO6yq6TN3Ypzvyc
         pzRw==
X-Gm-Message-State: APjAAAXdUVzbGqfC3SHuDAsKwK4mR1BjXtamQGiZzlBylH0mrzsefMzz
        RHtyssnCrp1P5w72w1PzDJXRc9+dP5XTjg==
X-Google-Smtp-Source: APXvYqzQ8k5xJ3zdwwE5P6lXJNU9v8dVuObSnipOofYIZ6CySuIz10zUz06fndoRyfuv/vYqCVjsLQ==
X-Received: by 2002:a1c:7419:: with SMTP id p25mr5046849wmc.129.1581421608350;
        Tue, 11 Feb 2020 03:46:48 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f207sm3679111wme.9.2020.02.11.03.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 03:46:47 -0800 (PST)
Message-ID: <5e429427.1c69fb81.3de48.080a@mx.google.com>
Date:   Tue, 11 Feb 2020 03:46:47 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.6-rc1-12-g612e35e76ec8
Subject: linusw/for-next build: 5 builds: 0 failed,
 5 passed (v5.6-rc1-12-g612e35e76ec8)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 5 builds: 0 failed, 5 passed (v5.6-rc1-12-g612e35e76=
ec8)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.6-rc1-12-g612e35e76ec8/

Tree: linusw
Branch: for-next
Git Describe: v5.6-rc1-12-g612e35e76ec8
Git Commit: 612e35e76ec85927bbafb00d594c58ea37e3e120
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
