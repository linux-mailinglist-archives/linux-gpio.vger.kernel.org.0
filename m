Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BF70D6CF3
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2019 03:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbfJOBhE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Oct 2019 21:37:04 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54353 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbfJOBhE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Oct 2019 21:37:04 -0400
Received: by mail-wm1-f65.google.com with SMTP id p7so18971496wmp.4
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2019 18:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8wPL/qvuGZsfgUQOxeFiOqIYZXuY0gb/yVLJrVqOHgM=;
        b=mccQa3FW5TG30wJO7VzrpRS6rNdETgHTP4NgXVcJocGURwkdzJ/NPd/niaGDIqulCn
         t6hn0Cy27E6uslGd/jdxSQf4LdS95haqrIoPTgk2vwU4NmfQdJVuRyRhzlVTAgwEnmI4
         9ila01a2yzy3rjx9GjMyYEgJfZSub7D/Nuk/hlL4EiBve+ojtM538Nf+x4yCBdeBbL14
         2/WvODamiQiICOdOd7RTI3bmk7rdKvsZ6fEG+YHqkNbuX0kjVGm2DYWkrpRbeUzwFvj7
         bh2/EjVQqwGJ8T/1ICqPEQAYTj6RNgoH8DbyKKUwx6vHBcutjKwlp+Ym4imujh3qehkT
         utGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8wPL/qvuGZsfgUQOxeFiOqIYZXuY0gb/yVLJrVqOHgM=;
        b=qR32jUY9KuI+BFrhStB4GEgeJTATeK9yc3qENh9Z2vpq1TyaA8KxDkb7zaoHucTGps
         KQfYI5nISHY6NlmvclJd686AWzBqVbwIo2CeeDOpHsLHpa3YPAlzfTscixRlzd3FfL1i
         soQkr/5dx1NiPHhHCF9pbFrxrleEQi94vLmEl0HRIYblPxzRI3Ft8pDK8SRVtVmHmeKq
         bjb19AmR+4o7fQWVp0afM5n2XWSjhAMRVzY4j1S5VN3DJ5W1fzhZLMevxVOqUEwBfrMv
         JR/IebdFc//WYBtdnyVG8jmjpIWN/NmbbU/ekZmzVIro4DdyAVwR2VCC/H0vdj3S9MM/
         JGTQ==
X-Gm-Message-State: APjAAAU70ou5FnWT9wZDoBS8fY8TXwn2DEH5z/bGxCw8wN0Nru2OlCk1
        Uhxpc798YzPAzaldHd8WcT/LF9IPOQingQ==
X-Google-Smtp-Source: APXvYqxqZzgRrlseFGaV/7kSYdUwBlXHGloZcPrUja+d28HEPwZUb3DMUIPQlE9ZsVbWkFVBJtfv5w==
X-Received: by 2002:a05:600c:1150:: with SMTP id z16mr8664249wmz.79.1571103421394;
        Mon, 14 Oct 2019 18:37:01 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id q19sm40377683wra.89.2019.10.14.18.37.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2019 18:37:00 -0700 (PDT)
Message-ID: <5da522bc.1c69fb81.eb6a8.9f89@mx.google.com>
Date:   Mon, 14 Oct 2019 18:37:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.4-rc3-6-g75e99bf5ed8f
Subject: linusw/fixes build: 6 builds: 0 failed, 6 passed,
 5 warnings (v5.4-rc3-6-g75e99bf5ed8f)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes build: 6 builds: 0 failed, 6 passed, 5 warnings (v5.4-rc3-6-g7=
5e99bf5ed8f)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.4-rc3-6-g75e99bf5ed8f/

Tree: linusw
Branch: fixes
Git Describe: v5.4-rc3-6-g75e99bf5ed8f
Git Commit: 75e99bf5ed8fa74bc80d693d8e0a24eeaa38202b
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 6 unique architectures

Warnings Detected:

arc:
    nsim_hs_defconfig (gcc-8): 2 warnings

arm64:

arm:
    multi_v7_defconfig (gcc-8): 3 warnings

mips:

riscv:

x86_64:


Warnings summary:

    2    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@9/linux/build/_modules_/lib/modules/5.4.0-rc3/kernel/drivers/usb/storage/u=
as.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@9/linux/build/_modules_/lib/modules/5.4.0-rc3/kernel/drivers/usb/storage/u=
as.ko needs unknown symbol usb_stor_adjust_quirks
    1    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@9/li=
nux/build/_modules_/lib/modules/5.4.0-rc3/kernel/drivers/usb/storage/uas.ko=
 needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@9/li=
nux/build/_modules_/lib/modules/5.4.0-rc3/kernel/drivers/usb/storage/uas.ko=
 needs unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---
For more info write to <info@kernelci.org>
