Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA6BB1273E0
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2019 04:29:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbfLTD3b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 22:29:31 -0500
Received: from mail-wr1-f48.google.com ([209.85.221.48]:40133 "EHLO
        mail-wr1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726986AbfLTD3b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 22:29:31 -0500
Received: by mail-wr1-f48.google.com with SMTP id c14so7983341wrn.7
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2019 19:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=brFsvjILp3+FcL0fJP9PTLlh3TRPgtrx4xCfSbr7NOA=;
        b=l4OPX1SCY0aX/HMgBTRG/ISEv49FWeDF9USChiq/QVyjCimNssNhXoe4QCLvkxIpVx
         gQNOxbU7vwBnjfaYWO3jZD+kEndVX1ump5aOVjGC4GqsA75Gy8pdwqKIHbHHK4CA5Xve
         5104H1wc6F7VPCr9giduZaGHOTg5KpCmdqZONQJ36WdaSFalHrXTnZvAACmDGQ5PRLkL
         XUImMXbBEKF/KGI6/6WjtRwWIAo9N3CRKc/K50h8/Zs4Z+phml5DHqIL0/Vdt68webng
         CgEiiQsdTSK74xjXYl2Z3dxN/FSjZaK7Hs8it5zLQuGdJHcQkQ8gSsdy+oH3x6eJCF45
         48bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=brFsvjILp3+FcL0fJP9PTLlh3TRPgtrx4xCfSbr7NOA=;
        b=pRkr0nWpnYAEHzgnsO/aapBH5Gvpil4bUEvhz9rJaYfsqbgUJAvp+YU84tF7syV5nL
         HKlXWJHHDo0EWXvFeHCLGzejFjOBDnTbeKxuJnofoL9Hu4OFx16aZ8izhE8Pmnz84pop
         ZhLZflfb1cXMF0qP2okhEKTh2q4+f3zXiR5Tg0gdzfhG968gpPuwWgK0J9JpMcHVzBS/
         BADHXRFAONhEXzmN3gysV500Qk1osWCycMH84lo0RkJZRiRGXztEVw9eiV6VUyi5GIJl
         /E21JUmwyXnCvgX3cX85m2NtSOZMZxp5XbNQTSFopYsuR8fD+QVt3KS8C+HaapRelgh8
         zlaw==
X-Gm-Message-State: APjAAAVO1896VzTtexPw0f4jbhaCV7QaI6/jtVub88QmjVgSPOl1IqXp
        345rdbnSBX4H01Yo+bD0QsSY8vRt+KdEWQ==
X-Google-Smtp-Source: APXvYqzPGttPxjajfNz5tcNmxyZNEwsq1OXTVaJih5vMWKsNDVXmYzjRosZxv8ksyJy+zSyMAeJ5Ww==
X-Received: by 2002:a5d:480f:: with SMTP id l15mr12696221wrq.305.1576812569198;
        Thu, 19 Dec 2019 19:29:29 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id q3sm7878472wmc.47.2019.12.19.19.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 19:29:28 -0800 (PST)
Message-ID: <5dfc4018.1c69fb81.5bc67.80c9@mx.google.com>
Date:   Thu, 19 Dec 2019 19:29:28 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.5-rc1-8-g6cc1d4568120
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel build: 5 builds: 0 failed,
 5 passed (v5.5-rc1-8-g6cc1d4568120)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 5 builds: 0 failed, 5 passed (v5.5-rc1-8-g6cc1d4568120)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.5-rc1-8-g6cc1d4568120/

Tree: linusw
Branch: devel
Git Describe: v5.5-rc1-8-g6cc1d4568120
Git Commit: 6cc1d4568120bc8013b52873d9a40bdc6ae7802a
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
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

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
