Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF880158D0C
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2020 11:58:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727566AbgBKK6I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Feb 2020 05:58:08 -0500
Received: from mail-wr1-f48.google.com ([209.85.221.48]:35674 "EHLO
        mail-wr1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727558AbgBKK6I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Feb 2020 05:58:08 -0500
Received: by mail-wr1-f48.google.com with SMTP id w12so11760528wrt.2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2020 02:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=PMdJR+X/WnM8i33PwFzjg0vsAK0SaIezoG10Gn6r7es=;
        b=LfQEbc3yYhqCe45QkjEmuV10lrqFxHGH+NkXWVaX5r9pNlLltmjjeFh2l9YAkiQy4Z
         76HqDNxUxB95qMuDkyPYOQUAqxhzwdlAspgcpsmtLjUh+2++X6AVupUOtFsMnQcr/fNt
         ctT6v1fmC3L4FurOnxltAfjC/rt5pPiat4d5DXe3Om+O6u5Y3HL3463/kfPT2PUSOKGO
         kuxp6w0Jjm2X9VY6viU3qJDX8vJ3CT9Cx5dfW+LXv6v5zctf1l+htHrbUpYkjJdXfI18
         W40ZMNzFwOR6tdEyPmHd+L7O3LOHBFWssenl4gcMaVrv7YeC6dSjm2c3DSyjQi8gP1Ee
         Nkeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=PMdJR+X/WnM8i33PwFzjg0vsAK0SaIezoG10Gn6r7es=;
        b=EohNKf7YgfmEKrT5vI8/rcM1M/SK5NxseFPCIItYwQOI28imMqC+mqwOTkm3gx0or2
         GRJ3yeJNlu+8RPqzPV2q09diqmQmaJYLiwLr5WN4ciJ5GRo64/J5DoNEXJb698xu9zSk
         ss+kTz6pSTsvprv6xoGiKyU7O1Mr3ijDp2DjLqGFC0wkVjYoUKiHfR3C1MzK8kkKAqWl
         ny+r4XTGTH7jL7xJ00coTb2Iq9N4CuONpp1MTnijO5i2w7BN+3ChOqGJkDq7SJAAxmT9
         +sIC1ALVc+nqlvPi8/Uj8lPhoFRXscqFyS1ooYBfVnIdf8MsM8U+zn/ApeKqrQL+2fMt
         +KQA==
X-Gm-Message-State: APjAAAXCywE6FzE2Z4zAk4FtiQ6Vsq/wRbuYcPGY7hwwS+6E+f7rYU0S
        gOuXASWv999vpzHvLSkjflSzoLJgzo+xcQ==
X-Google-Smtp-Source: APXvYqyKn+6YRzb7aeb65NSdfVtlBekQVEqm74Hf+nU+lbYn+E+laO9keKR5+VYXU88Wu0qFBjckxA==
X-Received: by 2002:adf:ffc5:: with SMTP id x5mr8227254wrs.92.1581418686632;
        Tue, 11 Feb 2020 02:58:06 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id i16sm3465846wmb.36.2020.02.11.02.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 02:58:06 -0800 (PST)
Message-ID: <5e4288be.1c69fb81.35c6e.f053@mx.google.com>
Date:   Tue, 11 Feb 2020 02:58:06 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.6-rc1-1-g046e14afb356
Subject: linusw/devel build: 4 builds: 0 failed,
 4 passed (v5.6-rc1-1-g046e14afb356)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 4 builds: 0 failed, 4 passed (v5.6-rc1-1-g046e14afb356)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.6-rc1-1-g046e14afb356/

Tree: linusw
Branch: devel
Git Describe: v5.6-rc1-1-g046e14afb356
Git Commit: 046e14afb3561523efd0047c35c20793ae5f8848
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 4 unique architectures

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
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---
For more info write to <info@kernelci.org>
