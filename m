Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F07B139F46
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2020 03:00:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729465AbgANCAp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jan 2020 21:00:45 -0500
Received: from mail-wm1-f48.google.com ([209.85.128.48]:35878 "EHLO
        mail-wm1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729459AbgANCAp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jan 2020 21:00:45 -0500
Received: by mail-wm1-f48.google.com with SMTP id p17so11926618wma.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jan 2020 18:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6IhEFegKVWXfW5muW6QTFKoLqtRw7Aqo47YId3amXMU=;
        b=wf1lEgU44GGbBr7ftjr1epAYamGalMJ1dGD1xyjA1ZL4m6nHQO8bgT+hbtipP77m+P
         UHyPBV92AzneBbIW58n97jm8IXF1u4aDkwsumdkLS25KS9QG9LjwJo40Dy6oVMgqGFYi
         thRH4RX31sk/7ghAxET5AVB5zYdjw4DITxkE9ZWJHHeSIQ1HG0Ddaf3Ultx6QJEZWnY5
         EMucU/Jx2cKrWJTZnfaS1+8D9vglQpN8D8DqcewtEjJJ3VM8xG4C5gAQISRsRqxXEYdY
         MF34khbwKRCX4IQ0KyfXCsFTXNKFe6csPMMJShvZPhZX25gYnEE5VI/CS7fPYTB/y3bs
         CyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6IhEFegKVWXfW5muW6QTFKoLqtRw7Aqo47YId3amXMU=;
        b=fKDJdn9hf8lPh1+q4M4vfHondZQfGf+MuAwUr6GbHAiPydp5urVcXpmIb6Ap7YW6AM
         PXNK9TKC+5RaUOicMJ+FLcdzKIr+4TCJ1qTVp85V0x7LnshkyPX+RjVgCM0DPD5dBSSp
         7UTbJtceI+L/HLlaRQxTxbhKmvJ1WvdyPHomkpnYynAuH3jSFb9DyeET5vtQogZCow3d
         dLiERfqvMqaLsGcLrTSx1EGzYGdQHpLTLJvGie9IVM2JMr6KPqvoUUi2SaEN8P03QUau
         A+3EIB0raWAQrPlQ14xagdf8nHe9J5BoJ2fmw5EaDWI8uo0p6ueR5ViwV77DQWESzZRu
         3m0w==
X-Gm-Message-State: APjAAAV5njMpc0AHc3uO9LdXoluu3eTN9bOzdTIkwHm32ZQlrCcLnrls
        d0IPL3K7cAznvduqTOoJu6UXv7GscvCXfg==
X-Google-Smtp-Source: APXvYqx1OCgn8IJlF8IoLLJWrAX0ln1qk5Jx8UXVGi79fiPQ8TmAYEtdPIum6IqYmQWnKKfOClw6gg==
X-Received: by 2002:a7b:c847:: with SMTP id c7mr23598134wml.3.1578967243738;
        Mon, 13 Jan 2020 18:00:43 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id v83sm16759174wmg.16.2020.01.13.18.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 18:00:43 -0800 (PST)
Message-ID: <5e1d20cb.1c69fb81.d8fff.6819@mx.google.com>
Date:   Mon, 13 Jan 2020 18:00:43 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: gpio-v5.5-3-31-g4e4ade156406
Subject: linusw/for-next build: 5 builds: 0 failed, 5 passed,
 1 warning (gpio-v5.5-3-31-g4e4ade156406)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 5 builds: 0 failed, 5 passed, 1 warning (gpio-v5.5-3=
-31-g4e4ade156406)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/gpio-v5.5-3-31-g4e4ade156406/

Tree: linusw
Branch: for-next
Git Describe: gpio-v5.5-3-31-g4e4ade156406
Git Commit: 4e4ade15640646ddff45d1235d6c08086b98c645
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
