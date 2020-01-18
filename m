Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F263914174C
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Jan 2020 12:42:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727117AbgARLmX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 18 Jan 2020 06:42:23 -0500
Received: from mail-wr1-f49.google.com ([209.85.221.49]:38121 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727116AbgARLmX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 18 Jan 2020 06:42:23 -0500
Received: by mail-wr1-f49.google.com with SMTP id y17so25080658wrh.5
        for <linux-gpio@vger.kernel.org>; Sat, 18 Jan 2020 03:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=pjmqv5KQOogsaC3f48erMwgzl6YH8TkvgmdUrIG1/6k=;
        b=o1PEz7KLlpJBxukcvaof9KlR4a0EPdKrELsyvKScFSFziOEtzmHLP/dbz9Oi3ocvi9
         hUWtPeDkIeOqAb8TMqKAyL7UVSQuBiiUD2ncMs4SFnIFlIxCCy9uWREAO0ok7oPBb42c
         ZxEoI7sFZfy6sFnVKpQJTconXY5bLowA2tu5tsrDTmH51WwdQNwmw7lr4gYE7paVkiOA
         lWt3TowdvTwsFcZk0onVi7hlVRAC4+s5PrsPvz5Gb3haskuBgAA4Gs7m/xRhbWFj2edO
         4VmsOQ9lfBNlJPLBRRQ40B0/QPZkccEyp3TCqejm4qLTvQ00imFPnmQHd1Uo3tdbwedN
         BMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=pjmqv5KQOogsaC3f48erMwgzl6YH8TkvgmdUrIG1/6k=;
        b=K4FDhgJJFgajO2BC044xVKg0n0pKcA03466VB/A2aVkfnfKo74tjTj4b7JLMNQdeD9
         4qJvbnQTZ/aPCI4RlVZXeop2mdH6wI/rJNbXk2IPLDYIXHrpe3QPXLq4Hgvqbn6LGix4
         y/84X+kSZCdognN3WW8/hjsB9nxIvHK1D9MezbHUce4UX2CGv1bqkHvVGrkiCVkV5CMe
         a6pNUvyVN7cKf0a4R69xlbBaxvxWNgo8ul9Wu5VQSghPKOXeLI2gAnUj5jOAu0FJ7uJ6
         b3yqGpS+z52OBff5lqZr9A47NRDcYAHqIuBEOPKLFDPh++dU2dzuoFulAhd/XzKWvl9k
         5XKw==
X-Gm-Message-State: APjAAAVFqtLATDKNDKgoUEBSkkJaEAp/KYoolPU3AVG0VKkN9P2j9l0u
        1dNZvIJrqO+Q7wKKRGlrmfXT9w0MgyPArQ==
X-Google-Smtp-Source: APXvYqycDWCwid4IbrD96Bm0eEVppJIxrPblL3AA+/9pXp5VB55qxT0gGHIyBwBEsZ0NrtHCnwzDRA==
X-Received: by 2002:adf:f7c4:: with SMTP id a4mr7795806wrq.332.1579347741009;
        Sat, 18 Jan 2020 03:42:21 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id g18sm13322698wmh.48.2020.01.18.03.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2020 03:42:20 -0800 (PST)
Message-ID: <5e22ef1c.1c69fb81.e6e0f.3d76@mx.google.com>
Date:   Sat, 18 Jan 2020 03:42:20 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: gpio-v5.5-4-45-gd18fddff061d
Subject: linusw/devel build: 5 builds: 0 failed,
 5 passed (gpio-v5.5-4-45-gd18fddff061d)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 5 builds: 0 failed, 5 passed (gpio-v5.5-4-45-gd18fddff0=
61d)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/g=
pio-v5.5-4-45-gd18fddff061d/

Tree: linusw
Branch: devel
Git Describe: gpio-v5.5-4-45-gd18fddff061d
Git Commit: d18fddff061d2796525e6d4a958cb3d30aed8efd
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
