Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0B2315C976
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2020 18:34:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728297AbgBMRel (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Feb 2020 12:34:41 -0500
Received: from mail-wr1-f51.google.com ([209.85.221.51]:39612 "EHLO
        mail-wr1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727991AbgBMRel (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Feb 2020 12:34:41 -0500
Received: by mail-wr1-f51.google.com with SMTP id y11so7716619wrt.6
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2020 09:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=yPtPX/1UPX711YyU3v7hK2233QYDzVeXJ9wtO0ZwhKY=;
        b=v99OUaxhkwXH9EH4iMAAfu7pZGbUoP7p0X9XkAYyOJ/4aXs1b3ptmzzZwJ7lfXgGxC
         kjjP9HaisxERiNBHkxhA7ohP0KrV4Q6BB/yr865B66AB73gibHKl/HD3+Evz1lPEsvtR
         pmTVtam6QKLzQyxLrLVNT90nV8AUgeXaknPe3FWb/HpBaFhcWC999PU7YrWYA1ELNoMU
         g5e5Bd+f7yZXcb1FOySA7MzsFVZ+nDwwl470EBfHfAOrpd4N/O3NrO3OuJRjTQCPNgkg
         7B3x4WvCta04fIOl/JHlB8f6u5V7arKNosHaSU8LzhTsFkZD4hk4F0LUW/sUN7HCHKpY
         R4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=yPtPX/1UPX711YyU3v7hK2233QYDzVeXJ9wtO0ZwhKY=;
        b=JNZ9Yl5Ii4ycDPnsG+jt4LKFdKQ0T9oLGm1rv59TVuVzQhHxMOXTvKk8VWUwFvtHAD
         Y71yHc7Jjz8exGAVJo5fUWe/3aAB0WMX5Tu5gRhK2BD1rZ2iTPx2rVEVqR1MA09/Mu6W
         7MD9UE1Tfv+dOouKPkP06e0YjGjdKCJm8NUEbeYQh/77xhGcsAPY/6QaStPpYHEjJUtv
         PQGrZthPvCqUcnM8R/VYtXGFKyGHUEGvQ2qoBMzhoH7MWcNX8USgU6H1XAt1hUW0ad89
         9kTIoleODIq84gyGrUUvmIWT1NJ3GUFq2uhta5dR9rgGyUC8wQjyGP0yIujT6bZ6elkI
         8TCA==
X-Gm-Message-State: APjAAAUy9qUr9RIyGsQVKl7Vsm+YdfXSk6B5bcKKHtFw2voQ91ThaBcg
        H55MDQEWPeooGSHjj6tSmYNPrmfQAo5nfg==
X-Google-Smtp-Source: APXvYqzCJSBfi9jQZ88Fr3Hqd1Kd+Ol/g03jWth0ZGBbCwo/FZITTaJCDTYW5/TWJDnXX5xztDk/zA==
X-Received: by 2002:adf:f401:: with SMTP id g1mr22281809wro.129.1581615278573;
        Thu, 13 Feb 2020 09:34:38 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id q14sm3683428wrj.81.2020.02.13.09.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 09:34:37 -0800 (PST)
Message-ID: <5e4588ad.1c69fb81.26a64.099d@mx.google.com>
Date:   Thu, 13 Feb 2020 09:34:37 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.6-rc1-12-gb2929a9cb2fb
Subject: linusw/devel build: 5 builds: 0 failed,
 5 passed (v5.6-rc1-12-gb2929a9cb2fb)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 5 builds: 0 failed, 5 passed (v5.6-rc1-12-gb2929a9cb2fb)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.6-rc1-12-gb2929a9cb2fb/

Tree: linusw
Branch: devel
Git Describe: v5.6-rc1-12-gb2929a9cb2fb
Git Commit: b2929a9cb2fbfedf30c66033a865c8135a7c2184
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
