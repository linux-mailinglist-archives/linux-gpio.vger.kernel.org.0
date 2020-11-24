Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2462F2C1B08
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 02:43:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbgKXBms (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Nov 2020 20:42:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726186AbgKXBms (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Nov 2020 20:42:48 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A6E9C0613CF
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2020 17:42:48 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id w187so2328754pfd.5
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2020 17:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8DHSYYMXHkPM44j2VeHAwYwgTSi0ZghhkApS9/1s55A=;
        b=wKi9YQO0dIsunfmSvlvWAK1q16nodJgLJMNaYfv1DwRg8HUudwyyec0+PAwUq9aEu2
         FODSTb2KAMA/0NJbI85D1aSmkkkMNSpdcIXDaoyeQzY96omZ0R4zxZv07OAzeiJO5JXg
         v4i4ltgn1cTO+JPuZ7u3mLDfXloAsSMm+IMRjpti3t6IiVfkkqiRZi3jmN1J3sMsdE3l
         8IHGANM8sQfpNzJVKLLJ4FJNjqgjx9m3WFsZaiiIllVTDQTOY3WRWtOWrtCXxubo/ga4
         I8UmAn0RLb1H4s/92yfXZv6IUbBrK05ZIjVuz0zI78nmjsNFB9DRZIw7rTEaRKzVEb9t
         HpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8DHSYYMXHkPM44j2VeHAwYwgTSi0ZghhkApS9/1s55A=;
        b=FzU68KGd5edwcQIsjpGoYS0RMOgV/bDyz/vPxG66sBXTDP93qjmJnB5B/eVUs31L0G
         ImvN42WFD8tznGKC69VSoWMTKS0RWhPPFp2Y0ghf7bS9xUiaPCMKNfIhIVlmBTCRsbF+
         L4RKLiCHCQJLpjmOw6uizz5yIT+OAxk4vNOVupDjyk3o2fVjmD0FZdJ7IjJgJbrxEjpf
         Kv4igccuSXdo6Rvq7UnaSPMx+77SJkTOZ3Di4XzekVMNXwT6TWM4007gEwzV8508fs5N
         RwBYLODXh5BxvoN4WOvKFV9g3b+FIlUWTtoeU6JpMsg2YJ4RdaJqRqE2I5dECTg/IcEO
         Pijw==
X-Gm-Message-State: AOAM530OimTNr3eRH/M3OJawMEZeyq7gSX3HlhTefKfGUXlnzO/IM7QL
        RJ6WqV6R+tajUZWY+UXMWOKwWLDOM0C8uA==
X-Google-Smtp-Source: ABdhPJzhkf2HX8GekF+zVMYveozQOhBgy9ZikY/v60ihXQ/7cr7myZY+YzZL5ez75sWb10Hz9DxMWA==
X-Received: by 2002:a65:4187:: with SMTP id a7mr1834493pgq.16.1606182167103;
        Mon, 23 Nov 2020 17:42:47 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 67sm3725425pfz.96.2020.11.23.17.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 17:42:46 -0800 (PST)
Message-ID: <5fbc6516.1c69fb81.507f2.a79e@mx.google.com>
Date:   Mon, 23 Nov 2020 17:42:46 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.10-rc4-36-g6c33287665e0
X-Kernelci-Report-Type: build
Subject: linusw/devel build: 5 builds: 0 failed,
 5 passed (v5.10-rc4-36-g6c33287665e0)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 5 builds: 0 failed, 5 passed (v5.10-rc4-36-g6c33287665e=
0)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.10-rc4-36-g6c33287665e0/

Tree: linusw
Branch: devel
Git Describe: v5.10-rc4-36-g6c33287665e0
Git Commit: 6c33287665e093cdf885e700487380b65e402d33
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
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---
For more info write to <info@kernelci.org>
