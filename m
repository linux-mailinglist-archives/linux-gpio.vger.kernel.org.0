Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA1679B016
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 01:48:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239389AbjIKUyw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Sep 2023 16:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236251AbjIKKEU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Sep 2023 06:04:20 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49710E68
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 03:04:16 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1bc0d39b52cso29378975ad.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 03:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1694426655; x=1695031455; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G3qwr0R6vu0Sv+hGJJsy7nNmrkJ957bGK+GM2ibVgnM=;
        b=Po/zz9mevalh6diqT3+F7I/z6pch6SoXiWGslydU8GX2IJyEo6dFQO9EJbCBw0+xra
         p+BmLXKk2PpXnyX3ojqtzx8+xa51gEbEimVCv54/n0Cq8MQI5jLg4iZtWjIANnZOxdIS
         g9XcGf7bke6IbvC9uAjn2uBTi7XRGITFfXRGsIQswXjKX5Zejm9ogkw3LRcPjp/miA0r
         Wo+aEhVm3YZ88i9If2zsbN2yb9bQclMgM48cKH7nFobN7h7sgsV8gy320IINjebuK9Ih
         jSFxGbRZ3st4IQDgG5VNwNvuEPKrbcNuqEVilNRz5hJZefhQ1kvdKC9XAzsSavUt+xVg
         1gcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694426655; x=1695031455;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G3qwr0R6vu0Sv+hGJJsy7nNmrkJ957bGK+GM2ibVgnM=;
        b=i4XY6ezZLR40TEjEjA12f4ZQEYoOK0TqWJ06rARs1xZIqFe4GPf8EfsjSQPQpZcZHh
         8yf+1nK9F5FWHzWvVUrm86K+7AM2rPR+BzK4yUqXFr8+Gj/weR37pMgWm8vEC1wCjq8F
         RtfzSXx19gqZ5jmIDxOfAEk5qAmXVEqXxzO8Hna8N+Zint5kukgnSkCUqG9PNRMZwGfr
         ugNHnX0+Y4oxfQeF2EK8b+FtDRFDSWZizDnM5ZYFJTpT/IhSmt+rqx+2DLrUJJcTnQlL
         LQ7SLL0quY0INQBsZJ86AGE78adQnItT2cc6nlIMvh1ouzxtg5VLwIdLDfTSUN+p9iFQ
         e9ow==
X-Gm-Message-State: AOJu0YxYl+6El8CyZKbs5wEYMfwI9OKdkkEcQ8ODShSpvfgO8UIEZ1qK
        wEiSt32HL9wYHLiF8GqLbh3nR76q1JO0BRjgLIA=
X-Google-Smtp-Source: AGHT+IEb+pPeey2ZRVNSLoSPbdI2wsUGZrHxhCH2s1GdRT+41zwwU0ybZWwjBgUPG5jz82NHu3dpOQ==
X-Received: by 2002:a17:903:18e:b0:1b5:1467:c4e8 with SMTP id z14-20020a170903018e00b001b51467c4e8mr10670788plg.15.1694426655278;
        Mon, 11 Sep 2023 03:04:15 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id x12-20020a1709028ecc00b001ae0152d280sm5991015plo.193.2023.09.11.03.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 03:04:14 -0700 (PDT)
Message-ID: <64fee61e.170a0220.2142e.dfb1@mx.google.com>
Date:   Mon, 11 Sep 2023 03:04:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.6-rc1
Subject: linusw/for-next build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-rc1)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

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

    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    2    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
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
