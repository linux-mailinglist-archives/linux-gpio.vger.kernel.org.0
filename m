Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 413186BF92
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jul 2019 18:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbfGQQXf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jul 2019 12:23:35 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54734 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbfGQQXf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Jul 2019 12:23:35 -0400
Received: by mail-wm1-f66.google.com with SMTP id p74so22767637wme.4
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jul 2019 09:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=QMI9/tfdPwQ1e3SX2bPDN5UupuevmOeYzDBdhUT0hj8=;
        b=VbrPxDWmmbobwELZJEoFo0I/XNJRHknuuslLUjBTXMnjb9spEb4anjVf1LKBNIYsu+
         HeFs005wYwil2zLatYx4y7siw7K+kETi/Zzkhzd6BlQ3H92cxsgkm8yJHoQ0z2KPLo8i
         Xr+jCmU4xGZISArd253gJ0o3Z4ncE4wNJTapN9kqojHYCV0IJEFcTm70t7M18ohDN8vd
         74UqZ5Eh5RCGqK+HJAF0GpdKZunfdpxqtseBYTf8CVcdJ6W0K8ko+L5b2mMdI7Oqg001
         o471cN6HjCWWVlBsPzpY/rS3l+Rf6WpqRcifP5QJ4nkoFEUhsbEWYNOX7bI3/kcKHED5
         STHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=QMI9/tfdPwQ1e3SX2bPDN5UupuevmOeYzDBdhUT0hj8=;
        b=GyqlRjKprc5kAvTjrx12tx0H74cvADYadI3F6odtNzZMdVfa5KT3QWK1KcMvzueWMi
         5f1l0Lrhcm8MK2LwZrl6H7NJXXmRI+N4wINCJPQeGwIkIGw42xg2w+bChyECeSe19Bos
         iWDp79YU4HrY7N8JGt9nIFE5kqiAXhUYMS9Ibn4qN+iM3dQfADhXumnxq6ZHA59D25d8
         1geUCKeaamAiUzHBXT4AjmXPR+RRgVFxrWB2fbrhuV5YwcY16aDxq/QIuIGIpHCVNNpb
         Ia7mgkFK2Y0hKtmEV1OI6BEQCVvD1Hqkpbx5ij2e1Tv+vziRr8wn/0uNYiqrxsXKQa7P
         unWA==
X-Gm-Message-State: APjAAAVUx64HZ8AcXzaV8khJ7ALqqdpaetp5+3rrcCDxlkB1RXnWHQC1
        Yu2ihR/9iT6Khh9rEKO5GUkxeFUbYeQ=
X-Google-Smtp-Source: APXvYqzSNknGfBAHW3WYcpNLyuSsFLtyirLKivfXN3HHpShJsdKW1w6AHbDA0Ejh/8VQ24zgYgpBKg==
X-Received: by 2002:a1c:7310:: with SMTP id d16mr36403658wmb.107.1563380613036;
        Wed, 17 Jul 2019 09:23:33 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id a2sm25080026wmj.9.2019.07.17.09.23.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Jul 2019 09:23:31 -0700 (PDT)
Message-ID: <5d2f4b83.1c69fb81.4eff3.f7e5@mx.google.com>
Date:   Wed, 17 Jul 2019 09:23:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.2-10808-g9637d517347e
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel build: 6 builds: 0 failed, 6 passed,
 3 warnings (v5.2-10808-g9637d517347e)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed, 3 warnings (v5.2-10808-g9=
637d517347e)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.2-10808-g9637d517347e/

Tree: linusw
Branch: devel
Git Describe: v5.2-10808-g9637d517347e
Git Commit: 9637d517347e80ee2fe1c5d8ce45ba1b88d8b5cd
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 6 unique architectures

Warnings Detected:

arc:

arm64:

arm:

mips:
    32r2el_defconfig (gcc-8): 3 warnings

riscv:

x86_64:


Warnings summary:

    3    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
nsim_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---
For more info write to <info@kernelci.org>
