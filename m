Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F01C0132AB1
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 17:04:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728173AbgAGQEH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 11:04:07 -0500
Received: from mail-wm1-f52.google.com ([209.85.128.52]:36940 "EHLO
        mail-wm1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727974AbgAGQEH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 11:04:07 -0500
Received: by mail-wm1-f52.google.com with SMTP id f129so56351wmf.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 08:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=NakVZPGJlWhxii3UPm2H0oZg+mCztzm4qyXLYerDbeI=;
        b=j3czuYCU0JV9vBnaXOnXn4d5WEWhBVGvvuPZL1O+54o40RH4V3/oUfz7LnEq5Vu66C
         7fac3FUCfcfRh82zZMcBMj9UXO/v4Ft496R9Dg+78a97iwysMgpVEupqAsElGrrQ9Eph
         lLbs8kTsOUAZpEKDAxAfwydFE9eTmrP9FpXmY1O9y2WRMVFSDyD7lFXxPs3fxrZZokF6
         GUbmo1F1U7G0UKaVfKkzeRRa4zfislJ1+TDU6vpptDVF450F6JPmY9CYu9H5ibZln9qC
         A/3gCD11UCfU92xmorlTPZ/a1F6EOWJe14oPFuXo+MVXjJJGIgd2B+8rJBfwBF/Scmy8
         ONaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=NakVZPGJlWhxii3UPm2H0oZg+mCztzm4qyXLYerDbeI=;
        b=DhG1lgGFx0Xppx06TQxxFdykreNha3HBierufpcmU3IWtxrbZ254t+guSMDwQSiwgL
         Naog87z7en0KbtdEkQ3HtGOFDAM4E55gf0b9x1WD/Txqb+1QME3VRU1NHCFrirF8u5+e
         eJhcrwhDZefPF1DEdSGWAdeGnsZBw/Xz112ypnupIVcNyAG2EitOwhSK3iA3pSs3fW2g
         VIWEB88uCbReFznacPoWjsvE3nGRA+OxETzRrq2SQrhLUBazptEmvtS04qaF3lxmwPgW
         Vh3pUMBQNebV/Un3HN4tUxvs2hcV1aGT4X0uRo4YV+RdWLeoOWTIkz4Ut9JMi2+paB+c
         asNQ==
X-Gm-Message-State: APjAAAUEYXHEGv1wFRbMYrKI5PTB3dXJK13OMY7wgabxd2Kh7yd0xMfk
        BHS3J31g2R2mEVZ1548JeQIP+nnjR09p1w==
X-Google-Smtp-Source: APXvYqzlfKvCDemwFqflzSViDHxjQ2BNhPRVs+Io+1lkqsZCjvlYMh3ID0tcLnKVgANP4OUa7ilD4Q==
X-Received: by 2002:a1c:7d92:: with SMTP id y140mr38066808wmc.145.1578413045137;
        Tue, 07 Jan 2020 08:04:05 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id c2sm329703wrp.46.2020.01.07.08.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 08:04:03 -0800 (PST)
Message-ID: <5e14abf3.1c69fb81.7cbeb.1a10@mx.google.com>
Date:   Tue, 07 Jan 2020 08:04:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.5-rc1-28-g2cb81261a967
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Branch: devel
Subject: linusw/devel build: 5 builds: 0 failed,
 5 passed (v5.5-rc1-28-g2cb81261a967)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 5 builds: 0 failed, 5 passed (v5.5-rc1-28-g2cb81261a967)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.5-rc1-28-g2cb81261a967/

Tree: linusw
Branch: devel
Git Describe: v5.5-rc1-28-g2cb81261a967
Git Commit: 2cb81261a967ee93825efc9af591d346eca51112
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
