Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFA53191BB2
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2020 22:08:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbgCXVGs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Mar 2020 17:06:48 -0400
Received: from mail-pl1-f174.google.com ([209.85.214.174]:36977 "EHLO
        mail-pl1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbgCXVGr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Mar 2020 17:06:47 -0400
Received: by mail-pl1-f174.google.com with SMTP id x1so3904836plm.4
        for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2020 14:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=o/z0o79DvKPcN5WbJLUKMWCeZFYARtCTJxNBmVzTM+0=;
        b=vX0Qt4sQPCH7pS+V0VUik/pjtJEzubZkcbDc4/zaE93tVRcFYIh26bJv+SC/42nItS
         CtkNORGQbfh1rpfOLt0+3f2XMPjWO7FrO1McGd64GUrxxvPULhPz31I396X/jKHrNOad
         +83nmZ+qTQEHYdxTfmKHTwD+jUTr14UV/sWWI1I76T//rLfusuYYPIGnWm3qYl/I5FDX
         9t9+nplErs+GceaIRgXBX2cLu9nZAVp+bsIHbhZ/QwTxtjpFGxuRaNwlvRpo5ZdgA8sV
         Csgioe5QGyAkTOrx9OKg9gTWZD04u7TQcrS8eCZUuR4vInj8rFo3MJqJOt18CyyCCPnT
         PNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=o/z0o79DvKPcN5WbJLUKMWCeZFYARtCTJxNBmVzTM+0=;
        b=HdHpg+7uuDgB+HfKuK+0mHwKytPPNCeEzDd2kQ1cpOxltaAn8kXBoSjzJb9jeXHHhZ
         Zzg5o8Q17HhNJem7VnpSwnOGB2bhXOZx1/f2ct6ZWluCXUw8Jooj5fhPztfFfKyoVEp9
         BOx83vSmwZhliXMKgv8D7W2O3WI0SFTslNyyNed5kjf86ZmnMHHmRFYl/LbghSYj6/Ym
         Pzl5pnOXHVSzRFBq6qREVKSPT0qYB+KEJtfpdtJj+1V/zXReMWZv87W6auJOh3cmPKZy
         XqG/kwovgNKTV5wEZFNt5Qyo+UKG/Owq1qguia7QnfsEuEFmeWETCwqQqsPLx9W/a23f
         c8fw==
X-Gm-Message-State: ANhLgQ3n3jTFgpPLoglgiVLwz6KUCznDU/jd7A5OdylzYSIhDvpiGln3
        aU2GmEuw6jySEpuZNlQEboAbJdIYrPY=
X-Google-Smtp-Source: ADFU+vtjIzr47CFGApPQAH9K8xAREGbPeTX/fbV71el3+LeQ1ncjy9E2z3/5+TGI4Jshd84xzUmTFQ==
X-Received: by 2002:a17:902:b115:: with SMTP id q21mr27250042plr.337.1585084006022;
        Tue, 24 Mar 2020 14:06:46 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u5sm16802206pfb.153.2020.03.24.14.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 14:06:45 -0700 (PDT)
Message-ID: <5e7a7665.1c69fb81.22314.075e@mx.google.com>
Date:   Tue, 24 Mar 2020 14:06:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.6-rc3-5-g0c625ccfe6f7
X-Kernelci-Report-Type: build
Subject: linusw/fixes build: 6 builds: 0 failed,
 6 passed (v5.6-rc3-5-g0c625ccfe6f7)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes build: 6 builds: 0 failed, 6 passed (v5.6-rc3-5-g0c625ccfe6f7)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.6-rc3-5-g0c625ccfe6f7/

Tree: linusw
Branch: fixes
Git Describe: v5.6-rc3-5-g0c625ccfe6f7
Git Commit: 0c625ccfe6f754d0896b8881f5c85bcb81699f1f
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
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
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
