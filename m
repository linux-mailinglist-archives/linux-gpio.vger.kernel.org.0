Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E72D19C67F
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2020 17:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388689AbgDBPxf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Apr 2020 11:53:35 -0400
Received: from mail-pf1-f175.google.com ([209.85.210.175]:44300 "EHLO
        mail-pf1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388677AbgDBPxf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Apr 2020 11:53:35 -0400
Received: by mail-pf1-f175.google.com with SMTP id b72so1924214pfb.11
        for <linux-gpio@vger.kernel.org>; Thu, 02 Apr 2020 08:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9OPxlKPNNnTpPVP42hfsGLM2DmznWzK9Sd9q7dRd5Ds=;
        b=sRl9b6aITw+nC+0njN3ZMhawWqb5QFnRgAsgXSrfSOIrhW0Fk3mIgXXcN16HAOFl22
         HrJjFpf+1rQBYprT9qSJ4LKgrQKF0LuEpC6jZfgjtG+Nzy77MzjWarBFAo4sInkoyk2E
         v9noirtPxWn+9jB8qt+PrpF/6+6fGFOxZ6P/Z7ecpqdUku022kKtymU8+LNs8IuaMCHB
         bWYpM2Vw2HfDVk56cI2F7jvc89V6Ru52qQLxXHjo9Z4cSfEItOlYnDwDlSYzOdBZcuqu
         JiGK1xQr9eMTrkgyvAzVljxCn/FDJoHwLZ7aMTSRyBLj3FHK8ExjnrFvsSnUcvXOCK4e
         aQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9OPxlKPNNnTpPVP42hfsGLM2DmznWzK9Sd9q7dRd5Ds=;
        b=NE694F+jnptqsh6U9454RicyhzKeSuO2Ktw3WRAXhO00XQELia735PTosWlZTqe4fv
         tWr/KltFtwe8cPrVZi1Et3CxmOwWRhFP15M/BwoS88ER59gpwq1NLRq1M4vrZqX5ZCS8
         +zWFNoMTIbKu1GACRh2cw9SAxuuu4XwLrAW5kDzlxpe3cwMskvw5Y8b3DUqXzC5SVrwm
         xtTE6TN9Z8x3dmA8IrSyO/EXYmwTWt5degfoJcWZKOVoqOfonHA2IaQMX+iTneAVfik1
         WJQDlIWGF1KU+C+6sOiYPeQZVe2Y05zolAql5t55R7qDBxm1Q3oYAxUUwtN1amK5Y7D+
         c7sA==
X-Gm-Message-State: AGi0PuYPEQ+HmUkM1H+rIpZwXiNbYDO8PRXHzBFfKxy1I4OYNA3ptnNq
        JUreb4eGhxKd1FYsvts6XheLliUGCvs=
X-Google-Smtp-Source: APiQypKggkIi2gFtcokNZAiZOJVRpGAFb3Uwy/9rRW7em6EupjSBEuvB1t3eW1B8zAGnWPFxOmqh3Q==
X-Received: by 2002:a62:2b06:: with SMTP id r6mr3638780pfr.249.1585842813756;
        Thu, 02 Apr 2020 08:53:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f129sm4007010pfb.190.2020.04.02.08.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 08:53:33 -0700 (PDT)
Message-ID: <5e860a7d.1c69fb81.ed78.243e@mx.google.com>
Date:   Thu, 02 Apr 2020 08:53:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc7-64-g4ed7d7dd4890
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next build: 6 builds: 0 failed,
 6 passed (v5.6-rc7-64-g4ed7d7dd4890)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed (v5.6-rc7-64-g4ed7d7dd4=
890)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.6-rc7-64-g4ed7d7dd4890/

Tree: linusw
Branch: for-next
Git Describe: v5.6-rc7-64-g4ed7d7dd4890
Git Commit: 4ed7d7dd4890bb8120a3e77c16191a695fdfcc5a
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
