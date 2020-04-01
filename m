Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91F4819A2EE
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2020 02:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731488AbgDAAb4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Mar 2020 20:31:56 -0400
Received: from mail-pj1-f41.google.com ([209.85.216.41]:40681 "EHLO
        mail-pj1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731470AbgDAAbz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Mar 2020 20:31:55 -0400
Received: by mail-pj1-f41.google.com with SMTP id kx8so1858410pjb.5
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2020 17:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=WzRU8kK/ZMFUvHtq0adZc3/BcATF/6ThtHUsNJrv8xY=;
        b=hvL/b4o91wMJby8R5uUlJ3cGap/uCuqR3225ndWUwF5+tH/rLx4ADg8vnGYLZbzJG6
         MUNC3cnVcLbZ0rV0Jwspxy9nwL9Q6JEee4E4gUA8DzE0ZirFDUAakWMkmSlJ01o41K3+
         AxZWeo7FkcNq21yJU1zedcG8V0Y3lX5d5y3Qy2nX0l0iA5RBCRR3Gd9NshCaDcioLeMT
         lHHHpCcxNvARteevasvD3rgsOOXnHrbI0hfUahnSgem6wH8ZiKPZb//ft5IcJYDr8Udt
         wlqUZg028hTXPVzrw/VcERjuaA0yu/T+pGdUldTRQwF/0sYdYVbPmruf9JQHCrhMdghR
         Cw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=WzRU8kK/ZMFUvHtq0adZc3/BcATF/6ThtHUsNJrv8xY=;
        b=FhHv99XUNTSR8S8dVDQVf0IeRCM6HxjDOsIDz8jTcfTfEMozI3PbO8cHsg1HigmhLF
         6KVzzC+J7itrfj7WzbXtYZqBuhCcfFdDshnyC7bvdIW2GmAgGnh+yddp2DjFYEsuQBPi
         QkteM6H10FDNJYLgjNrCJkgOrcnezGgUQQ80BAZI7O5rlN95r8MvNyQmV+BaAB/LWKsa
         azwLyt5Y6r9+QV1QQ3SelandeQdCCXiyHOwLRH+QV9lhyG/YNynvdRVLV5UJzKskUhxU
         Yw2X67UirVrtKcpfd/LckAwxOEwtY92BC14oN7YKFFUeicWXUTexPmsHQFDO03CHmBAZ
         OUMg==
X-Gm-Message-State: AGi0Pub/H5Na8kk8v9ntli6KD/YAv9YmDOrG/K8mi42Uhnh1KMCnU1Qn
        wC/yfB3oKOh5d10mXZgPI1A24tHBJRo=
X-Google-Smtp-Source: APiQypLnWYxmZW93Sa22REwdFYJnYQZDHUjMTUCoX3dnxeIv3jQ3284+QqPW7Df/wyN6ersvFFwJ8Q==
X-Received: by 2002:a17:90a:d344:: with SMTP id i4mr1685487pjx.161.1585701112653;
        Tue, 31 Mar 2020 17:31:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k24sm235467pfi.196.2020.03.31.17.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 17:31:51 -0700 (PDT)
Message-ID: <5e83e0f7.1c69fb81.f691c.14e5@mx.google.com>
Date:   Tue, 31 Mar 2020 17:31:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc7-60-ge45ee71ae101
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel build: 6 builds: 0 failed,
 6 passed (v5.6-rc7-60-ge45ee71ae101)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed (v5.6-rc7-60-ge45ee71ae101)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.6-rc7-60-ge45ee71ae101/

Tree: linusw
Branch: devel
Git Describe: v5.6-rc7-60-ge45ee71ae101
Git Commit: e45ee71ae101bd271c3cd951cf66341dc8f504a0
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
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

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
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---
For more info write to <info@kernelci.org>
