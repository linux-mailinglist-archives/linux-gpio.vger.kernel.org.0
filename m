Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E10A714C500
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2020 04:31:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgA2DbC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jan 2020 22:31:02 -0500
Received: from mail-wr1-f54.google.com ([209.85.221.54]:44598 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgA2DbB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jan 2020 22:31:01 -0500
Received: by mail-wr1-f54.google.com with SMTP id q10so18488193wrm.11
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jan 2020 19:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=sMU43rU0KvDLOhWucOuBfBlCwcBY59bbqX8jP+EhsN0=;
        b=L4sNnIBmM/EDtsfYdPIi9PqNN/UNXLSr079vQRfLBTqQpnak+CwrbS0ir8F7sQkZ8i
         duNmRh/2maYph4XCj4el+IP9lLIAKemGIOxZYY0V75gm3FYIwGiPxTu4mK9uNr2+c+8d
         QAG1Z5Q00IXRnQa0vVdlnAjOD5AbJ4RM4lhTWojs3t2n9z7Qg34A+mJ3D7NWAT+DUr9a
         BbP52+dz+Fpm8c584K9k9BP5Uq6CSoOIrviLqMQX+8Sosiwp1tbqQaihujuukJfQDJ9y
         +gMbqb0gBZadWLRWPAwCrta9jWOI3tpdmHmKyGVUuc2kV03iEJDP0dVrCp3vWsSTUBMX
         Nwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=sMU43rU0KvDLOhWucOuBfBlCwcBY59bbqX8jP+EhsN0=;
        b=IXPjieFW9SRfXddaIiBTeN6RLsSYAQ4eim1izeMcWcDxSuSVqxmwbU/s2Tz8GrNxIq
         NLeJVzKRwRwJkn6FQ0Cq4r9SQ+COmkvdR8TUxXwHAv/IXYiixW/UBbZzBaRvJ72Ih0Wk
         jbZ+RbKwNlA/z35W/KmIl3NFNg9J0yHWz5DaZY43I/ee/5bLJhAVcajd2dmwlZXZ0FrS
         /x9GS7/IwhZFJYZ4h3porsDbYXQEqRBzgbLGXGNRRuozifdFbBD4zY1XOZ0NVvT2a90b
         dFAvwLbHwF/Tf3u9WuCNjhhLMvN5VoaWAL/oIe+jG+CFuJPijJ874klqe2WTPEDCM8P1
         qiuw==
X-Gm-Message-State: APjAAAUWTyZiWXGyxAU5yhh9+lqgTb3szOODUKJF55KQqpn/4IPGqg1u
        gBYdV5LA27zOTDbbqUcrJ9jsO9/GZ2rlwQ==
X-Google-Smtp-Source: APXvYqz3sHTBAm3d3wlZMisHOHHW0+p1iIPGOy49D50j4iOSJIcKvM1lQwvYZVpAy44N4o6iAT7+2w==
X-Received: by 2002:adf:f692:: with SMTP id v18mr1757421wrp.246.1580268659208;
        Tue, 28 Jan 2020 19:30:59 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id s139sm613383wme.35.2020.01.28.19.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2020 19:30:58 -0800 (PST)
Message-ID: <5e30fc72.1c69fb81.f2543.1e64@mx.google.com>
Date:   Tue, 28 Jan 2020 19:30:58 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
X-Kernelci-Kernel: gpio-v5.5-4-52-g0282c72d30d3
X-Kernelci-Report-Type: build
Subject: linusw/for-next build: 5 builds: 0 failed,
 5 passed (gpio-v5.5-4-52-g0282c72d30d3)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 5 builds: 0 failed, 5 passed (gpio-v5.5-4-52-g0282c7=
2d30d3)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/gpio-v5.5-4-52-g0282c72d30d3/

Tree: linusw
Branch: for-next
Git Describe: gpio-v5.5-4-52-g0282c72d30d3
Git Commit: 0282c72d30d32913d641dc81f3f38607ace98802
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
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
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
