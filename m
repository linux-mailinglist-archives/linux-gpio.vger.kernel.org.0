Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C46718CAEB
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2020 10:55:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727039AbgCTJzu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Mar 2020 05:55:50 -0400
Received: from mail-pf1-f172.google.com ([209.85.210.172]:40646 "EHLO
        mail-pf1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726806AbgCTJzu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Mar 2020 05:55:50 -0400
Received: by mail-pf1-f172.google.com with SMTP id l184so2960210pfl.7
        for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2020 02:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=nspIYN9HIn6J8QDHjJHI3bM9ZwABJbpzOdoMw+L+OXU=;
        b=vN3nyMuZKxpx0xraz4ZNVolf0UNW9gb4c7F7FVMqyAsalNB092e2ofaZet5EZfCv1c
         JdMReYm7folELX/ZZDgtZ9AwMYmC41WTOkNZt6BnEdyEtgsU+C3o69HyQZM1JzAoN44M
         YtXidG+u2DDcTpOieyIqGz5ekGyByV+sPj2XEeOQKl9PTPWaLpypYyx8XyKZwg67Cwre
         I+BcBLINlkAHTCi3iekW2Y45qs2Y+JrX0VsKkdMfpr5PlQdWclIPi11h8EQQp3o/GCTV
         0x8rciF44c7+2vWMrCFabAlptPbRIciqD9MhIAFgcVHN/X0cb86nuX5mV4FJHQY2gKt7
         D2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=nspIYN9HIn6J8QDHjJHI3bM9ZwABJbpzOdoMw+L+OXU=;
        b=AaQ+dWLYYZTrY0lXOg6qrOUlxqGOyKNaMgw1yVjB1G6C2aD4kw8rr+NfG02nl9xwCk
         TS/R9hW6a61uNvEBishRFg/E3X7Que2u1cLlkY9IUSrzy4oGnxfyzvD/Cb6iwhxl0Pg5
         ZJHhGSu1ql+wum1m1jl7jqykyPykIPwZqFcFmCGhYc/hYZR5kltS0m9PUbTyfIGUdDhW
         pQLLfhQQ5Xc4nU1yR37oZTvojdVLTrt0ajyZdNEapRhW2s0iIeJOlQN8P5Bl5I5jxyL/
         cWHUei7Tg7psyE/TAkWW+IrOG0b5c9pKsKgT/rSuJJbzUh4DFjIONGdInKEtKKQAzOom
         o69A==
X-Gm-Message-State: ANhLgQ0YQBufOe9TGQMmYBvSf6g28oT0yqNP7xvXAWHsad5Jpbb6SOcA
        QPfdyVA7jLEQxqE1+mYf1PHt5H/JCt0=
X-Google-Smtp-Source: ADFU+vsaew938EGJSKLPryYgtsc0At9Br8E1L2fzt/9JYL4LAt1pvTfIsblihIEBfHRLN5ET1NFp5g==
X-Received: by 2002:a62:1c48:: with SMTP id c69mr8708756pfc.283.1584698148322;
        Fri, 20 Mar 2020 02:55:48 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p8sm4872122pff.26.2020.03.20.02.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2020 02:55:47 -0700 (PDT)
Message-ID: <5e749323.1c69fb81.a4149.1ebe@mx.google.com>
Date:   Fri, 20 Mar 2020 02:55:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.6-rc1-31-g347ae6e29145
X-Kernelci-Report-Type: build
Subject: linusw/devel build: 6 builds: 0 failed,
 6 passed (v5.6-rc1-31-g347ae6e29145)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed (v5.6-rc1-31-g347ae6e29145)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.6-rc1-31-g347ae6e29145/

Tree: linusw
Branch: devel
Git Describe: v5.6-rc1-31-g347ae6e29145
Git Commit: 347ae6e29145077469838f3bb66939ec8ee8956a
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 6 unique architectures

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
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
