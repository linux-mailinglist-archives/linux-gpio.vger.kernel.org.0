Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4CB311F007
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Dec 2019 03:42:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbfLNCmD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Dec 2019 21:42:03 -0500
Received: from mail-wm1-f53.google.com ([209.85.128.53]:36453 "EHLO
        mail-wm1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbfLNCmC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Dec 2019 21:42:02 -0500
Received: by mail-wm1-f53.google.com with SMTP id p17so760299wma.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Dec 2019 18:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=GjKCVAO6z+SQQEv1erIvdTltrAD4syEt4btIddrcC8E=;
        b=jThmjJ27e1Ht/aknUwN0fPVtYlhNC+4mierWpAyjE873ZM/tMCC6r6r7Ara5OuGbVf
         FUzNogceHdu0nVGbNVfhTF3AKQQkCx9xGQNd0LutKk0eHt9dsgnwDfy3cGtyWvMT4g/4
         PqC3OZrQolWmXDYe6nJ67onbsA3ayjLWXj3tT738JlKo7Ccty4ToheLOOSA3xzUmcT79
         csya76i6rqXYRl35/3PEp0UBLN7a92D1h1B5Wkv8xo4/YZfrMDlUQ8zgWrgY/bWoRUZQ
         TIsj6rYS/wgcpvMnE1l54hEaeWb7pQ5Db5eDUS4iL1mNftw01qvHoN89U0SpkqVhiFRM
         beDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=GjKCVAO6z+SQQEv1erIvdTltrAD4syEt4btIddrcC8E=;
        b=BgbBhqDw/FCwj7v3upKqduUeHMx/qsAAvMAAVciq6qeH6k+C2XFmsreIoCaVTbCeRd
         nYRdwDm0Gm3zgTGXep5vJ+ZpkccvN0Xp/J2heRItWARdmkO32qSXVs0h9esLZgD8xWD+
         0FrnEn4y52LlNbVt7O5qisJOjSLULHpLy/qh72V/wk0GzUf7OUx7h0puq46F5+2Md2yH
         r5yqPXERghF7ccW//f3wdWqSKtxurHUAs6bXyS6sryb2gP8PkMWHbDSnes/MyNUV9gxL
         0UR/EBxMDMFffwRbGsFBnm9YYdIf+X8d5yb+zrH5belanOLNaW+s/MNwmiMNEucdcB8+
         eLJg==
X-Gm-Message-State: APjAAAVR6gb8Qq9/oS4nB9Dd7H8+3dNxWHdDgu1JPGLxhZLdexkxtg4Z
        XGypI30Lyyuyjl0qV+pSkbwwpxUx7OGXaw==
X-Google-Smtp-Source: APXvYqxb+JvvE/hifQwN0QsN+c3mi2/+OadigwbaghyfVGgfm8pVY9E9MatcqXpOaTTsb88ay4YK9Q==
X-Received: by 2002:a1c:4e10:: with SMTP id g16mr16511705wmh.94.1576291320210;
        Fri, 13 Dec 2019 18:42:00 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id c17sm11839135wrr.87.2019.12.13.18.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 18:41:59 -0800 (PST)
Message-ID: <5df44bf7.1c69fb81.2e3a0.da84@mx.google.com>
Date:   Fri, 13 Dec 2019 18:41:59 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.5-rc1-10-g279b1fed09ea
X-Kernelci-Tree: linusw
X-Kernelci-Branch: fixes
Subject: linusw/fixes build: 5 builds: 0 failed,
 5 passed (v5.5-rc1-10-g279b1fed09ea)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes build: 5 builds: 0 failed, 5 passed (v5.5-rc1-10-g279b1fed09ea)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.5-rc1-10-g279b1fed09ea/

Tree: linusw
Branch: fixes
Git Describe: v5.5-rc1-10-g279b1fed09ea
Git Commit: 279b1fed09eaa921379c6f1e3347e4161ef5f76a
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
