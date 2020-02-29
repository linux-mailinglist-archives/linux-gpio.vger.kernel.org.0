Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D66E9174892
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Feb 2020 19:05:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727451AbgB2SFw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Feb 2020 13:05:52 -0500
Received: from mail-pl1-f176.google.com ([209.85.214.176]:39941 "EHLO
        mail-pl1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727209AbgB2SFw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Feb 2020 13:05:52 -0500
Received: by mail-pl1-f176.google.com with SMTP id y1so2527678plp.7
        for <linux-gpio@vger.kernel.org>; Sat, 29 Feb 2020 10:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=fAJ+RTLOjzdI6N9IuZbcOO4N3nMGisL5GMv5GfxfgZE=;
        b=cDOR10I6zBWd1t2uXl3Ya2i1NKzU7etQxYClWPST0VZlZr86SfXNndaeqvs7ToroWp
         f+HntnK4YBVz+hLsmgBPLKqobnrjoI7Iz7W7TSsy4nXIBc83NE1PEdOqTxBZSaU3O4dP
         f96hzzSD/oh/NGdK4Vvp5mMRsZZM6njPLIpzypxcdT1OWVLTiyG559IomCBqtw7Nven+
         0U6Vzs6WFiH+mCMwK0tCvGQAL79jwuPM6dsU2PthMLS7GR9l9cvmgbcCaQKV+uVDSSK5
         hTQ9TEHRsixKSR7zh0opHqujmYORku7OxQq4In/XSjQ5RyRB2/xC5uq7ywGx9QrrcBQQ
         Vw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=fAJ+RTLOjzdI6N9IuZbcOO4N3nMGisL5GMv5GfxfgZE=;
        b=mpI6Wt3OCFVGB9doJEkq43C0ePOXAQ8248q7YpT5r9NsGzacHDz73k35812hVIX/z6
         tSsxUrA2Kdgfa7nHHCtHqycRGQw0GfjHnHcn+AO0MlWRDYcnaKoMOo2tzH/WGsQ8Yxqa
         PmiJcu3rU5NbHgV83rtLxU4fnNkNPZjIUkW6J+enP61hI7cTmEFZ3rcSVCOvOLvc2usZ
         Iyt/G9yyGp3zp2ovSDdf4xH8boas2yiHM/MV5Xegxzx34p1erJaV4CF/dDwZ2xOn0ncJ
         CKC5B/9P54GJKGZVSuFsNyf2eE6jcb+PEd48kfMQRrNAAQuDIMTwGruDtZHFHQR1Tzin
         p+sw==
X-Gm-Message-State: APjAAAWs9nzbTBzu4vQ0hjLUrapMw6UD0QI4M6jZM9QVZIvWylsrq1RB
        7OsvllGm++jFe3uZKnnlp5x3Mnt2YS0=
X-Google-Smtp-Source: APXvYqx7IpOMujr17x1KtT57v9FFgTgIV4Ol6S99BY4Wya649o5ybXqEzbAmKoX3xqVGBz2A2rRtpg==
X-Received: by 2002:a17:902:d906:: with SMTP id c6mr9781349plz.93.1582999549156;
        Sat, 29 Feb 2020 10:05:49 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p21sm15276331pfn.103.2020.02.29.10.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Feb 2020 10:05:48 -0800 (PST)
Message-ID: <5e5aa7fc.1c69fb81.3fd32.80c8@mx.google.com>
Date:   Sat, 29 Feb 2020 10:05:48 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Kernel: v5.6-rc1-20-g869233f81337
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
Subject: linusw/devel build: 6 builds: 0 failed,
 6 passed (v5.6-rc1-20-g869233f81337)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed (v5.6-rc1-20-g869233f81337)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.6-rc1-20-g869233f81337/

Tree: linusw
Branch: devel
Git Describe: v5.6-rc1-20-g869233f81337
Git Commit: 869233f81337bfb33c79f1e7539147d52c0ba383
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
