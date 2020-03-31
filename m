Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5E70199E68
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2020 20:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727575AbgCaSxk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Mar 2020 14:53:40 -0400
Received: from mail-pj1-f42.google.com ([209.85.216.42]:55226 "EHLO
        mail-pj1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726295AbgCaSxj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Mar 2020 14:53:39 -0400
Received: by mail-pj1-f42.google.com with SMTP id np9so1464250pjb.4
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2020 11:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=BwgTgkPeVRq7iqp0RjMj75CP9cgaukvLQqmok2rtt2w=;
        b=ZfBHDHbDHVipmqrsyQZtQHXxZfRTvNbdZ8LGfeo6lxWVDIe2GLpHroA3YZz0sHEeus
         0iuQP4ykT6+01NfJcNLf94i84XMarMV18KdF9JcMdwGtUsrojkQV3soxdJxkkIMu9Xwx
         +NfHeTaVscy1vNvkjrlL7ntuH3PW0kX8ecOoPaHTTNhnJDyJdZ8WsBnEnRfCwD6s2+Wc
         AsuaUmxkaGz5PVIisZmjFSL/RGkpupdsY1OJbH6QjHkoQVA/cxbR5Ce7rUu+eNdtbJKJ
         /oBaGHSjFRqNc6T57nQWC3/s0jU0AzqmKfTyLyNMu0hYhHFGaFA3pN9MlNOBpQgkiMJK
         +XMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=BwgTgkPeVRq7iqp0RjMj75CP9cgaukvLQqmok2rtt2w=;
        b=KgV/ZtXXNcYgZ7zWlat0RT3xld1ZmR25n31oauz085gIcHwRg5XmB0chnAs+fwPR00
         by9UpEtr9TLoFVzYT0YBVlQlvqcEChWIsJqaWusqOzMOeLVaxkFdegtNdTcrGZ3Y1D5+
         DHS+Dww/LWLRSLKjuoFuUJpK9hK7QPvyi3w+r0ePjM9e3z2OvBacMzQnwjYjFEsxw11Q
         ZKfevP+/Tf5WSWsvFP9/0GnIX6RcdKm9oLB4Dc4Nw87umWHdkSGCt4H2hIImCPcdu0W5
         4YnoFXxAUItSh3Byx2eX2y+shk++kYe4CbXPiggFeZN4J6Ffb6fDkm7nSZczDfqIcqVa
         7bHw==
X-Gm-Message-State: ANhLgQ0sJxC7bfjiLfHcl8xahkf5TdVcB4iT42qi+guRxLrRMmmn76H3
        Y1svJ7VnsqMFbiRV67uIj0cT7f3YrGg=
X-Google-Smtp-Source: ADFU+vsjaBMpdhZlXNbkkcY2R/ARvUnnHBeyNHdaELv1HcVqktvgHd80vgOp31WpXpP6PnwcEtR6Eg==
X-Received: by 2002:a17:902:aa49:: with SMTP id c9mr19629602plr.145.1585680818303;
        Tue, 31 Mar 2020 11:53:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ev21sm2530656pjb.24.2020.03.31.11.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 11:53:37 -0700 (PDT)
Message-ID: <5e8391b1.1c69fb81.d7480.9c67@mx.google.com>
Date:   Tue, 31 Mar 2020 11:53:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc7-58-g89ad556b7f96
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel build: 6 builds: 0 failed,
 6 passed (v5.6-rc7-58-g89ad556b7f96)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed (v5.6-rc7-58-g89ad556b7f96)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.6-rc7-58-g89ad556b7f96/

Tree: linusw
Branch: devel
Git Describe: v5.6-rc7-58-g89ad556b7f96
Git Commit: 89ad556b7f96af54ae6762f561f0a09269265741
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
