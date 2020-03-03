Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E251177AB8
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2020 16:42:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727440AbgCCPmJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Mar 2020 10:42:09 -0500
Received: from mail-pf1-f169.google.com ([209.85.210.169]:41961 "EHLO
        mail-pf1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728002AbgCCPmJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Mar 2020 10:42:09 -0500
Received: by mail-pf1-f169.google.com with SMTP id j9so1632892pfa.8
        for <linux-gpio@vger.kernel.org>; Tue, 03 Mar 2020 07:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=gxK/prujocO1TWbYle5ac0wmc0WtI+xAiBBk+DoLdDw=;
        b=ClsKFRzukw2HX2BowMKAkJfPwDFZSlmuIwixyUCnHavnHGBfIzWa0D8yBF8GKKwbJD
         JkJJgo/fzuGMpp8fop9HQXXZRyR7Rr8VOe6J9HZx2UKAVkwqV5urwbHcU9o1Z25GWIZJ
         cGKXSmgbTkirOWGifubPERq7X2yCrHnxtVbjK0WX+o/isKa3lbNpJ5j7m97D6ft5JZ0S
         ePu/QdYKfhskRIhyhL8gCLwp2ESrVj8vcEFQmykR91Q+Uy8+xWV+W1FxO62QyrwOWaHM
         guK0bL5UqQXTgNasrZLV5kX31GjUYBnPUqAPhBkDMaZAy0XS4zAPk5XY34AEp+UhaCVA
         7C0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=gxK/prujocO1TWbYle5ac0wmc0WtI+xAiBBk+DoLdDw=;
        b=PeF5LMyoe/bbai0YhjIS43QES4N7FNNZfgKYNjULUFmdf2/mNcIOyALHWxVFZIzxSf
         fBUZLvWZqJ/R65l7XDlC/zTOYStHrDOCRm7QX6Gony6B+Om/2VYQxuRo65JiJTEFhaFI
         jSbr+1BGtkEBu5mVVJ29kK8S+jWylLnJy1IFSgRSzDHUvD+aTUqey5UlxMK3UvU8RqHj
         Zi+QTHLUB988slRhdXVRPS41vIOHfaM9wUjLc1b0QjKpF94aYasRlJbwWhSkNN/i6elH
         wiWa+VEQMRlvQJ1EXvbPJ+Bot3KPST4iLXpTnvyyWyvILxPTsJiC9+MAu4hpA4AUukLc
         p5OA==
X-Gm-Message-State: ANhLgQ0API7K8xEZGiJowcaFyusNvPLTeoi7h4hFIE9MN95JJ+npVuaI
        122JLI4nG+QuyyHR70r3MfMCAEeoAoM=
X-Google-Smtp-Source: ADFU+vuP1HblTpx3lu3IHWw2QczI0iI1yH3B7EXyZywWy6/mddTwURyctzrT8I4G7BUHegcHS2qdfw==
X-Received: by 2002:a62:19c3:: with SMTP id 186mr4757261pfz.24.1583250127819;
        Tue, 03 Mar 2020 07:42:07 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m11sm3130744pjl.18.2020.03.03.07.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 07:42:07 -0800 (PST)
Message-ID: <5e5e7acf.1c69fb81.bb7b1.8874@mx.google.com>
Date:   Tue, 03 Mar 2020 07:42:07 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Kernel: v5.6-rc3-27-g9cd0c5e02ee4
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
Subject: linusw/for-next build: 6 builds: 0 failed,
 6 passed (v5.6-rc3-27-g9cd0c5e02ee4)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed (v5.6-rc3-27-g9cd0c5e02=
ee4)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.6-rc3-27-g9cd0c5e02ee4/

Tree: linusw
Branch: for-next
Git Describe: v5.6-rc3-27-g9cd0c5e02ee4
Git Commit: 9cd0c5e02ee4fcf8d0905def9b096b4222e179c2
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
