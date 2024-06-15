Return-Path: <linux-gpio+bounces-7463-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A43B909616
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Jun 2024 07:02:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1335E1F23177
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Jun 2024 05:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDDD2E573;
	Sat, 15 Jun 2024 05:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="BTzv9+8l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC4EDF59
	for <linux-gpio@vger.kernel.org>; Sat, 15 Jun 2024 05:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718427718; cv=none; b=bV9Bk7ntT3gkFJIApCG8kmvsNS7Nez4ehDy1u+TaYm5f5jmAjV9eTUP19nvQ2rY92Q1Jk6QxfNjCIQrgw/neY4KJhgxjVxeuDm4V1s9SA/icx7YJIo29lpWRmwsGcgb9mZsgucbdmmttv11F6lAI/U8zzesBzw4W0XwJI0vBdjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718427718; c=relaxed/simple;
	bh=jD4yXhalHlOD/ERJZRNdX5z9Q4BycMOyMbMYGSp84vc=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=tzAEBKlHn+3ri9p3IqBriOgErHDZeWJV8mS+sQ3QEJiXgToksrRwct92quMCIe1Qk7CUdP3QmQfUU3pk1wERhhFj6afnj4ycEy0DD+X2lazyos5QWQyHE5J+fEi/h2kJLdHWbglIEZ3elMVPsoVeQinqKAGas/jJVwCtCLlhgkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=BTzv9+8l; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-705cffc5bcfso2253700b3a.3
        for <linux-gpio@vger.kernel.org>; Fri, 14 Jun 2024 22:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718427716; x=1719032516; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vMLFfsnmouzBDjzIbIVk+5SoO71eGyHs/5hBBSG4Agc=;
        b=BTzv9+8lVSNTAF9gZUwqVk97U9j/focITDw4COAzjAmbP3ansL4gNnF1he3V1Byz17
         VRa+hgCYbZDQmD5EbJQiZRS6i0J8Iy9a/FJlZi5MQepsW8sv5drQ49/JhwGIMz6DIyWY
         BOpbw1D/wut8q9Q6KxO11ox20lCjowpHvrLWmJWvEoESp69NCmEgiw1N4Q2SBFoOVnyc
         zgeEYMlwNNN73qQohVcjjpSEcS5q0wkzp63eRg4CudihjNWFUHzlglFJJRhpTSpARW1f
         Yl4e2n9dGBB/92gdTlV93sRNqP3kgcELIhrzuSp8YWpmgYhhieWIUmuIJLWqdqo3WiaG
         TauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718427716; x=1719032516;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vMLFfsnmouzBDjzIbIVk+5SoO71eGyHs/5hBBSG4Agc=;
        b=KPCk70O9JRi0t831AMw/3FL1MFzWpshNmwQu55Z3pntQn9b/0uLoz+Q0HMhO6NGCOI
         QxesvW21Y9qNIaGrApVpHWHzjLqAazTQuCUjlYDP5qRnkr80t50UMBAGERX7xdB8eJme
         4KgEDWaSOiVlznansOCgcZXoLi7aYn58RVHq9qmky9pmv8wCRexN1CfX4VDrP5kUJm40
         VUwpJmZo+aWIYUPcupMB1aQ207Sneosmqk2QT3xh0J+YUs54JqiUr0SmnKP155MvJS+u
         BQwSDq/5WMx4bTe109orokrbmIeFDrGWRogV1tv9M0IPQxU7SiZANgTm//U283IFYcnM
         zvOg==
X-Gm-Message-State: AOJu0Yx8wAipEJGv/tDsmfGiWRPLf2mG53MBk/ylNuOVNh8In7kJpIk2
	Q0OvYPi/jnbsG65Zy79GJJeuOViSk52x5FAY38NScbcYE7Kd9ZmQdbHEEJSRpd4UZZJWYSDDyzu
	j
X-Google-Smtp-Source: AGHT+IEofwc3fnH6h2Nrc6iJkk9T8CK0luD1ZyG+ycCtbn+zT/8E/7OaV2mSPZuDKHRI1A27QR80Eg==
X-Received: by 2002:a05:6a00:781:b0:705:bfaa:3891 with SMTP id d2e1a72fcca58-705d714f01dmr4702431b3a.17.1718427715877;
        Fri, 14 Jun 2024 22:01:55 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6fee3ba442csm2959731a12.85.2024.06.14.22.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 22:01:55 -0700 (PDT)
Message-ID: <666d2043.650a0220.946c2.8786@mx.google.com>
Date: Fri, 14 Jun 2024 22:01:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.6-rc1
X-Kernelci-Report-Type: build
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
Subject: linusw/devel build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-rc1)
To: linux-gpio@vger.kernel.org, fellows@kernelci.org
From: "kernelci.org bot" <bot@kernelci.org>

linusw/devel build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.6-rc1)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
6.6-rc1/

Tree: linusw
Branch: devel
Git Describe: v6.6-rc1
Git Commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 8 unique architectures

Warnings Detected:

arc:

arm64:

arm:

i386:

mips:

riscv:

sparc:
    sparc64_defconfig (gcc-10): 4 warnings

x86_64:


Warnings summary:

    4    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    4    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
sparc64_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---
For more info write to <info@kernelci.org>

