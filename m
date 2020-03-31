Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E57AB199E46
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2020 20:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgCaSnq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Mar 2020 14:43:46 -0400
Received: from mail-pg1-f176.google.com ([209.85.215.176]:38434 "EHLO
        mail-pg1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbgCaSnp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Mar 2020 14:43:45 -0400
Received: by mail-pg1-f176.google.com with SMTP id x7so10739048pgh.5
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2020 11:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=fgjV7okOyC28O8PpKTOMdviMOV2fclTKMy+aQdBSAok=;
        b=hO2qAX/DGtrJx43jX59F+HiTzk8SD1PfGTFusiCIzL+69Myqh5XOljyyl1JaYcPtUQ
         yaLF8RqitdTW8L3gh8ZuwWwk4JshnT7Gd/TYe5xZcuq/LXGNm2QtA6SYJj1YpoI7NlVg
         1NoUVfrbtVIlH3ihGF9+bDVmEc4GtZYzDll5UimLEqdNomVTVXasqUhCHU4PjvBaE43D
         pDts6ejhzJGskDR1vA7gJ9ULEaUzqr+DfFg06nq8c33krYqEOquqW07h9mjlqqmfUNO1
         qMQLwbo3R0aUaR7KXufWticcDiuYWXNq7UBBsLWd41CpFWqSeXakvKy+Vc0aGcJvWtOn
         6Y3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=fgjV7okOyC28O8PpKTOMdviMOV2fclTKMy+aQdBSAok=;
        b=an0KgndRNAwwQDokBXDTus+SmGVWUeADswT05n6pyEuS+50znefxVJd9Q6PiYvPstZ
         Egd5B6ZfIomlGDiPkaFLnwEc648q4Zo4LsL3uA6BbwATEGbk5BsiEkGspRAOa81hGIY6
         Csd+5hoR14F2Fqgrqewiq/mYCeBchkWFJa8nIe1qNhTfq40G42SMaZ/JZauc7ExWomTs
         EZ1d0Rc2zkO9FPDkCjV0Qvc8caS3OI9uI6cNJNILY1/J2F3iP6d7pQfsTih31WnwR016
         Hnn1G+oubt+wZdksHBl0GnkobZThiC9gRVPT6r0Ih5GgybrduFlGhfPIlshC0TUHc9cI
         LhbQ==
X-Gm-Message-State: ANhLgQ3zR4leVD/jk9L7GTXh7w+dCGqcbyASwptoOSdyloKMIvHrkOcM
        M+Lv1fDLUpyBOhv/TvfiwPx5SaMtzzk=
X-Google-Smtp-Source: ADFU+vtnYUukQmtDw/vDcj/w0vnktcCc8ZQBRGB7AZseaCqBHhoohXJOaijG715quKWWN8kg8JMGlg==
X-Received: by 2002:aa7:8b44:: with SMTP id i4mr20414188pfd.179.1585680222344;
        Tue, 31 Mar 2020 11:43:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z6sm2505618pjt.42.2020.03.31.11.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 11:43:41 -0700 (PDT)
Message-ID: <5e838f5d.1c69fb81.dd873.a191@mx.google.com>
Date:   Tue, 31 Mar 2020 11:43:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc7-58-g89ad556b7f96
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next build: 6 builds: 0 failed,
 6 passed (v5.6-rc7-58-g89ad556b7f96)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed (v5.6-rc7-58-g89ad556b7=
f96)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.6-rc7-58-g89ad556b7f96/

Tree: linusw
Branch: for-next
Git Describe: v5.6-rc7-58-g89ad556b7f96
Git Commit: 89ad556b7f96af54ae6762f561f0a09269265741
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
