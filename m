Return-Path: <linux-gpio+bounces-7462-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B71C0909610
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Jun 2024 07:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D876FB2276E
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Jun 2024 05:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627B58825;
	Sat, 15 Jun 2024 05:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="dWT48f1Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3BB2905
	for <linux-gpio@vger.kernel.org>; Sat, 15 Jun 2024 05:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718427636; cv=none; b=Hsa1CvhwGZzVhJI9CFYni/YBhLvF9f8QtuNTgljZYRKDig2uwBjMRuEm2BX8vLN4ch3a/49xmvyhFJFyAQTSSWAb4+fArTlip3ZU/aVVhlaiyb6YgGUGLXt5KUjd4iPP4jyPzITo+Ww/P57fD6/AfI5U+IpUc+gZpdvIACaCwyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718427636; c=relaxed/simple;
	bh=ZjzuROQMGnkHQ2OraQ/OLXrcyw28kQJdvf1g3J5cmbY=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=SNlU6T9YirDkZg+7W+EooJxuSz0mlEuB25YRsbw4ZocGEsLUQdoC1IMrc675BQnuga/85PPQjNxQ1Rdflsbx4vSM/fGzSfu2WHtY4idxRQroszUFp4xh+n9nMXZyS8yRSC+U4tPXbS/74dB4RyZhwm0FCWQyeDPvcI15be82kdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=dWT48f1Q; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-70255d5ddc7so2480064b3a.3
        for <linux-gpio@vger.kernel.org>; Fri, 14 Jun 2024 22:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718427633; x=1719032433; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VihCzb12EOPYhz9VX4kHIyRMLG20kWY0FHVaVWrd9ho=;
        b=dWT48f1Q+2q9LrAnc7zRRBqFrbfT4XhIp0hMeNeCoLy4g/WHxv0UasJX4DLfzK29Gm
         xAMZB5hhy/vB80N3A66cGL7YsgRZNe/zrQbxiyBPtt4amvYfwSl4xYwx+sEq8Sb+kH8V
         QFL0TXuX4xEQVDgz+fvISGtTxeOtAsS5bktjfoySPhVkdtC8YIgDRjknNyJ4YIPKYtOd
         /MrSi/gGPKPLXISKcsf6ZY+c9MKNt6ANr600LDOQj2yUwbdbkdcwT0VLrWJiSPy9MEL5
         yAMn/aBx/8lnbkNatzJ85ZXslzzOhNwRXFBGsJdN1IQKP1GlSzsTyf7SR7WIAVV/ar+0
         ZIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718427633; x=1719032433;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VihCzb12EOPYhz9VX4kHIyRMLG20kWY0FHVaVWrd9ho=;
        b=INEn7lpQWRQb28XfYVX4Q2PX4k3ywtBaXWgxfAu/Rk12Qj5B8KItNfHBXUI2Vksi6d
         31q3tTFcINj4CEKOZVqycnXHeZS1EWlOS5agxI7AQ8z0mL0SB1AlxMBmXTsKp8B4AbQE
         6GAwnesn21dRdOlyCH6FHsZVlx83d9oNDLIg16LR3xOoI6qpvXgB2io/++wCn+jr09zZ
         /TXGTID9oQ32hPNeealLpaTunhf22lJ8F8l86M008Sa1FJaD5s06hEaWI/99Dvs+Hzke
         SlMfyeaC6NpzoU9tdu+OURtmoxGeuyNrpq16VzUrxj/F7P00FYpukWz0P7fFIEIvPshb
         dtZg==
X-Gm-Message-State: AOJu0YxzMNb4Vhb21gjeNZAQGFzwERLtVTk+2CcWA/hQUnpVvkH76jHi
	2y/gEnVy3abwRU7ltMb8g1oVw35ofsh2VvmQuhA8n85uc/vTbKNjIDzu+aZzwCEUCly8CFW+I7X
	w
X-Google-Smtp-Source: AGHT+IGUhOt4lBHjyDK4BzFpNfIEdx9gDd38bLl3xL3vtjlFAaibbpNAi8S0WbDJfYAb1gQngKkRpQ==
X-Received: by 2002:a05:6a00:1817:b0:705:cade:1f50 with SMTP id d2e1a72fcca58-705d721898amr5826153b3a.34.1718427633175;
        Fri, 14 Jun 2024 22:00:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb8d9acsm3902326b3a.197.2024.06.14.22.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 22:00:32 -0700 (PDT)
Message-ID: <666d1ff0.050a0220.e0ffa.c618@mx.google.com>
Date: Fri, 14 Jun 2024 22:00:32 -0700 (PDT)
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
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
Subject: linusw/for-next build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-rc1)
To: linux-gpio@vger.kernel.org, fellows@kernelci.org
From: "kernelci.org bot" <bot@kernelci.org>

linusw/for-next build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.6-rc1)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v6.6-rc1/

Tree: linusw
Branch: for-next
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

