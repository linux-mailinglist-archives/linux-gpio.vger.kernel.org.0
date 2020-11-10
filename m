Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAB082AE02F
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 20:52:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbgKJTw6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 14:52:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726467AbgKJTw5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 14:52:57 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCF84C0613D1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 11:52:57 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id i13so6382926pgm.9
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 11:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Vzqn2ZVN3adRHEHHJYD3e4e4rlDshqb77xmMIKuQCqU=;
        b=zYXjIGPP0zA8w+B5d4HoeagIpc+sDf6ZqHGkTtDuxd0r8g+zuW9Caf9UxtkHKHiMwm
         tZjf43jYf9WvrbbgPKnihCJXoTLn4tbd7mkNvphPlimh1PAetzCg+hhdUHzR/+OVMT/w
         D64mWBCq6fKvHhd7RyyOv6SprNDlqrCBBV/magmgPFEiDge3unuSA1+q73fJ/uyd9xSF
         vxiE2pO0Y8iAqYMotF7V39tb5mw8oN1rSZ8JqNnQF6MxGKGWFPODe/90xegGTP4idX15
         8uQ731arkHVvSjip6apXV+UTExqUxEKipic3rD/CaaYAktzpseA1Gc8IKsZZDHrxrMgd
         UUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Vzqn2ZVN3adRHEHHJYD3e4e4rlDshqb77xmMIKuQCqU=;
        b=Uwn/N4O594faDM7YPXWO8Co3zI1FAwXxhX8Zuz4SUjKF7vVgLEvD26m96iulFGUKtJ
         hAOMl1Us4P9/D8ZA9xEOIyyX3QW6MCvlSpXxjUyrRaj2xtkLVQcVkFHiOWKpEOU5q2UQ
         QYUJR3BqYXmyeUaAnJaGh86HsNT3A29EIw6Cln6OhvO+qolu/A79STvy1MfDJN78qLJu
         y0WDvHmXPzLRKU7b3K/nA8p/y3Vk6Q/mi0K2oXh/4vl+tNGYAvOoZjiUgogUeG/Mp0Ae
         C0/RX0WuYSIeQAaaee1fZz3WwtPzJDEVlVDS73X9+R1/3W3lokzMcuy2eRwSONtZEnno
         XXjA==
X-Gm-Message-State: AOAM530Pihx3fV+dz/oa1nYuY6NPg1W3m6SDYSZ3N5LkHfeBuow6IOj7
        WcLH90HUI88wfOauvCO2d1PtLEmyCvGdMw==
X-Google-Smtp-Source: ABdhPJxBmQNX8mSZYijZX9khG7PDNSbRHH+n+sqjBkkQ6QaXbmTVhpELFCfzH7duOdCLYqWPOG1vnw==
X-Received: by 2002:a62:34c7:0:b029:15d:e9de:f618 with SMTP id b190-20020a6234c70000b029015de9def618mr19493692pfa.58.1605037977137;
        Tue, 10 Nov 2020 11:52:57 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e22sm15366837pfd.153.2020.11.10.11.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 11:52:56 -0800 (PST)
Message-ID: <5faaef98.1c69fb81.5d8d7.21ab@mx.google.com>
Date:   Tue, 10 Nov 2020 11:52:56 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
X-Kernelci-Branch: fixes
X-Kernelci-Kernel: v5.10-rc1-13-g45fe0b539bc9
Subject: linusw/fixes build: 5 builds: 0 failed,
 5 passed (v5.10-rc1-13-g45fe0b539bc9)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes build: 5 builds: 0 failed, 5 passed (v5.10-rc1-13-g45fe0b539bc=
9)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.10-rc1-13-g45fe0b539bc9/

Tree: linusw
Branch: fixes
Git Describe: v5.10-rc1-13-g45fe0b539bc9
Git Commit: 45fe0b539bc9cf6a6832d0d60cb6eab1e5f56bd9
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
