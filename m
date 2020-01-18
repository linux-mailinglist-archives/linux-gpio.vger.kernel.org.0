Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB6F8141735
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Jan 2020 12:24:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727048AbgARLYh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 18 Jan 2020 06:24:37 -0500
Received: from mail-wr1-f42.google.com ([209.85.221.42]:38235 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727033AbgARLYh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 18 Jan 2020 06:24:37 -0500
Received: by mail-wr1-f42.google.com with SMTP id y17so25054059wrh.5
        for <linux-gpio@vger.kernel.org>; Sat, 18 Jan 2020 03:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=XpOFbMmJlY6ujBiwyLHBi66QWgnCaYvYxIgqOVkgCDg=;
        b=GhAYu8ZtYWHWEg+pROUON91rRXLAfmbUNjlpd1e7qCfEdBS0T9/2SSlI+9c5Ce+Txk
         zyI2eLyXUSVsq2hi9UL/CHFXe34Ztn121Q9f46yRogi6hyAI+yKRN6ZBa7ysAKJJXgFl
         +Bu9772Py/vSJZxTiHB5zzajvnqUpEEq+EEyYPqVGNpWicGUpqADwXYrwz8WP5Iirtx7
         OeC+ND5V2l+FzHoHQE7cOVS7zWjt9DH195Z+sxCQcl0ATcDqa0Ug2N5mMOq0DoJtEog+
         B5vvQK/06lA+VxiWicmJWpNpnWGuajFw1V04CVBn9VBmPb9HypHdB4+T1pJo1EpCJZ1N
         b0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=XpOFbMmJlY6ujBiwyLHBi66QWgnCaYvYxIgqOVkgCDg=;
        b=gk1uL+8UNOWEWuoWVAMgjsdCobZDM3velwMfNr4zlXzGJ3YUQ4WdUmqtKL/RzNG1LR
         DKUQnF8a97cnPBJ6LMYd13Vmop6/4wDL1JrScUizrsuooScZpK8g4UNtRb3pZYRxBZA+
         ++C0AebP29Z5tMk52tAqHhqGOP6ej6czgfaxHsVbUh1dnqK5diMZ8c1b8Be3e/V2Q/qx
         7+RxYeGJOefhV0Mgbipl1u32RQ0XR6f/TW2cWb4YH/ZWo+V1Afzwudc1yNT0pwFicsST
         mG94oRWC21bsUZaT+yaB/5RcLciKqhYr/KErobjgLF4obZwkxHv8WqjljFhjfQZVcrTG
         Hs5w==
X-Gm-Message-State: APjAAAWQ7jwPOxNU2ZbZDEuBoC762ALVdZB5/gCbBjHOh+tI2Y5O4ekG
        wlewChrG/zcFZpAn+RhdcqIpZ6BNEYts0Q==
X-Google-Smtp-Source: APXvYqz8bNDtNF8vbbh9vXNY59IAW7hZSXNNEujWCUjRyYLkXXI2Hi9zapDU9bu9ldOFymc/L1wsxw==
X-Received: by 2002:adf:fe86:: with SMTP id l6mr8229351wrr.252.1579346675856;
        Sat, 18 Jan 2020 03:24:35 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id k13sm38093967wrx.59.2020.01.18.03.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2020 03:24:35 -0800 (PST)
Message-ID: <5e22eaf3.1c69fb81.4be0.aba8@mx.google.com>
Date:   Sat, 18 Jan 2020 03:24:35 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: gpio-v5.5-4
Subject: linusw/fixes build: 5 builds: 0 failed, 5 passed (gpio-v5.5-4)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes build: 5 builds: 0 failed, 5 passed (gpio-v5.5-4)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/g=
pio-v5.5-4/

Tree: linusw
Branch: fixes
Git Describe: gpio-v5.5-4
Git Commit: a564ac35d60564dd5b509e32afdc04e7aafee40e
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
