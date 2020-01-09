Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFA6D135224
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2020 05:23:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727417AbgAIEXA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jan 2020 23:23:00 -0500
Received: from mail-wr1-f42.google.com ([209.85.221.42]:35954 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726913AbgAIEXA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jan 2020 23:23:00 -0500
Received: by mail-wr1-f42.google.com with SMTP id z3so5857076wru.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jan 2020 20:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=V8ogbUZo74of1kfuO8AhpWIPYMdGub7NOwVUaPKbIs0=;
        b=ktxOOqAcrYEIQdLZ4amNQDWvvFRw9A3GaPDFcRW3q5c7PDGh+0Wqvt/xeOHLXhqVJG
         zgywzDZg/grmAl13wbbS+eiTq5+S+ntdCjOTj1OEHmFYucNBlSFmzfQGdJy8rZDcIRfJ
         HlXk95dUdEw/De0rdOADu2Al4ooqkhG3LGLOVqFe4sgfd+229527OVnneQR3DqijXagR
         FexZwrTt4LAY9K/T8MsoHUBldigd1Mx78hMaH2YBo3eOVXNw+z9b7C2agn+s/Xuu7LSp
         nL1w6EWvnz+A1B1qPCOfzc6cxjC3ajUEjqfX4NOaWuMo4HYUyN7zACyWSbV0+gsjso/p
         T7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=V8ogbUZo74of1kfuO8AhpWIPYMdGub7NOwVUaPKbIs0=;
        b=Skwf/gR+SNk4t8sr2S3pSU/boQ9gDCqhnmYKDReMDjmokzhaCjomFBYMLqvF5G9tTn
         8M1ssDVdcwlXEuZVy0OeswYkKIryu0ZVYOgKzPb3UfH91MTxd37b78OKdIht3Nuymjz/
         jpobo4eeGN4pIa0mu3zWdGty/chL1T5VEI/wwExyNev0pGrRVp6ap1pWQeY++mt0ALU0
         DHvkEqoCVSsH7JIHJ1lYphYvWXkx5sWwa8W8C02bZoIy2TU48fAvGVmvpp+STVJsktqz
         kFj7MfL2Xp/sZ+XPlqCXGlk4b83ws99+LLqhRuYpIwcywvDkMrN/aFfQ4aWW8syhZxNs
         fUMw==
X-Gm-Message-State: APjAAAW2sMmwmL/k9nEoxfO2PhQQdJTjy+uBwIQBqSKqnYcGEGHKyn9d
        hxaidExlsOWYL/fhRDLZV4Z0/CBWXWnrnw==
X-Google-Smtp-Source: APXvYqzorPADTVTxwwEQ0dV9GLOj7TEN620Dqn9y3sKxGADlu4ScsgChOnGbOWV+pFfSa81bX0qUWg==
X-Received: by 2002:adf:cd0a:: with SMTP id w10mr8106981wrm.107.1578543777922;
        Wed, 08 Jan 2020 20:22:57 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id c5sm1510045wmb.9.2020.01.08.20.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 20:22:57 -0800 (PST)
Message-ID: <5e16aaa1.1c69fb81.bcb0d.77a6@mx.google.com>
Date:   Wed, 08 Jan 2020 20:22:57 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.5-rc4-35-g0dc4997ef739
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Branch: for-next
Subject: linusw/for-next build: 5 builds: 0 failed, 5 passed,
 1 warning (v5.5-rc4-35-g0dc4997ef739)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 5 builds: 0 failed, 5 passed, 1 warning (v5.5-rc4-35=
-g0dc4997ef739)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.5-rc4-35-g0dc4997ef739/

Tree: linusw
Branch: for-next
Git Describe: v5.5-rc4-35-g0dc4997ef739
Git Commit: 0dc4997ef7396b1dc78ee36b5e4b6939c2ae0026
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 5 unique architectures

Warnings Detected:

arm64:

arm:

mips:

riscv:

x86_64:
    x86_64_defconfig (gcc-8): 1 warning


Warnings summary:

    1    include/linux/of_mdio.h:58:13: warning: =E2=80=98of_mdiobus_child_=
is_phy=E2=80=99 defined but not used [-Wunused-function]

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
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    include/linux/of_mdio.h:58:13: warning: =E2=80=98of_mdiobus_child_is_ph=
y=E2=80=99 defined but not used [-Wunused-function]

---
For more info write to <info@kernelci.org>
