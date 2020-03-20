Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 338E118CAE4
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2020 10:54:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbgCTJy2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Mar 2020 05:54:28 -0400
Received: from mail-pj1-f42.google.com ([209.85.216.42]:51873 "EHLO
        mail-pj1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726527AbgCTJy2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Mar 2020 05:54:28 -0400
Received: by mail-pj1-f42.google.com with SMTP id hg10so2244193pjb.1
        for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2020 02:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=R0R/zPKoiCU8fncMWmDpe2DgrqxsjqI7yxm6sJYEUT0=;
        b=Xzle2UNCEtiQf2jlGGQEoiGYl9y9Mq5yADaRrYLt3EGwN9gUIf71FnJvAJvcE1uURd
         Yw0y2iWXjQ3kT18TLAvWRyLJgvZdIppnHFD8G2llvB9gigiKEK39+3pXAaS3X4wdVH9y
         b738Dk6CKSbA5qQCWApV7izI+9boVemj6omt3n04R+1X+nrYUdbnlTRqg6OrN5Qn6XdX
         pfvT7sF0D9zUOcrIxji87/ObMRyTLH3KRtVyTzrU2snkuD+uL3t1EFESH/R8fBqHB8+W
         P6fy5k/TPVuW5P7ZJHQt6KYzBZqR9ATiU+160F+/Ldm3lovytSA45PupyGMjWNQsu5X7
         ZpRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=R0R/zPKoiCU8fncMWmDpe2DgrqxsjqI7yxm6sJYEUT0=;
        b=pB1a4PUrJkVb6NhDBlDHJyN7GRTiiWCetVPmux79sXVjDYGqPtGLexTf2aoBJI+HFR
         rLnHKJfvu9HyEfbSGOc/NKkJ2OyceYybXSRps/PJO9KdMOgoQfxA7DZeADCymuPoN3WK
         J50YpkEPNBBlZw0UU6XMa2/v6IbjNGQ3pBeKGQsvG6gGR1vK4SXcr4yrnYpg7mn9d1Lu
         njt9VmxuzfeV5Xj+lCs1PrGKs72p2h0fGiCW9G40mTJYoaLO/XxYddLCmaK0+RfNXHdU
         6RJpfSOprRB0IkruwwDVmPJnRINntkWQuNtGxKxUxTnyGeczEOCISQHN/slU8kRaxjXp
         famw==
X-Gm-Message-State: ANhLgQ1/EnQow1razndx+nfCXC3wY3mchkdiprhVQIcBFoUhW9wa5UBe
        2S+TmFwR4iUlIR+u9KuxqhpIPxfkNz8=
X-Google-Smtp-Source: ADFU+vuCsBqRElqdL9IriyQTYK+pHyjNJj4cAQpLQD8u9zemgu4q4ijRSxyF4ZqKVYUyFjZyQdcM/A==
X-Received: by 2002:a17:902:8a8f:: with SMTP id p15mr7649629plo.45.1584698065465;
        Fri, 20 Mar 2020 02:54:25 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l59sm1425237pjb.2.2020.03.20.02.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2020 02:54:24 -0700 (PDT)
Message-ID: <5e7492d0.1c69fb81.40b22.45ff@mx.google.com>
Date:   Fri, 20 Mar 2020 02:54:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.6-rc3-37-gef0c1aed2459
X-Kernelci-Report-Type: build
Subject: linusw/for-next build: 6 builds: 0 failed,
 6 passed (v5.6-rc3-37-gef0c1aed2459)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed (v5.6-rc3-37-gef0c1aed2=
459)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.6-rc3-37-gef0c1aed2459/

Tree: linusw
Branch: for-next
Git Describe: v5.6-rc3-37-gef0c1aed2459
Git Commit: ef0c1aed2459f59f2aec13bcc97c68e0646ab0a2
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
