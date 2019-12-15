Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20FAA11F9A3
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Dec 2019 18:24:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbfLORXo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 15 Dec 2019 12:23:44 -0500
Received: from mail-wr1-f50.google.com ([209.85.221.50]:45198 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbfLORXo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 15 Dec 2019 12:23:44 -0500
Received: by mail-wr1-f50.google.com with SMTP id j42so203018wrj.12
        for <linux-gpio@vger.kernel.org>; Sun, 15 Dec 2019 09:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6SqT/AYzkwuNzESZSpWuR+jEBd1oGfFwX6NMZfB/Nno=;
        b=GWQWscFpOSV7ixCbj4LkYp1MOiTZrhKjQTkUgD2Yz3wPDkyfhkaaA+yXganfciCyLt
         wodkgx2G1neJ4mVnk2Nfh1wvM9XULWrvdmPwFmnaORn/2/EWdYTV0dbtqALIr5x+GiYX
         nKbJtBDXEE14HScbbUt5Jiyx8GmQvdvnu2IJLUy7+OdAQGPQxOi3MExkdLKztgfoOFAC
         YK8jxeaTfu2zEuNGrUnvOBDAKPLHT0TmVQ7rvUe/luwBj3HvVIFcgUVdaU8oPgIlcPYz
         R8Ng9frrofKYWAqcPOI5a8w1GjdU5r1OILLvBI+n/IuU5+K++WtHuTE+Neq0G1e6753p
         La7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6SqT/AYzkwuNzESZSpWuR+jEBd1oGfFwX6NMZfB/Nno=;
        b=VM+93mI7njQthwfg0SrmXNYmvb38zPLtbCwhZpbbIhetRX9ZOXmAVKpnPZY3Zjmm7E
         svYHQISG+NlI144b4vLPRckKMjwiHP7bZxd1UAbBSRoTnpI6IjRtpNDMD6VPqN84B8cz
         egsxCKcuWW4XGKCa3iZyB4hW5hIOZpIJwG0Jc2ex3DRLRzCaeDK7hDN5ZbXk9eXKhiv5
         uMbyIYegkDS71urOvm+s152gxvjpL79K58rXsxAJRaGihk6eR7z6ljmyV4VjVrXl98vu
         YDBFp63Aw51IceyGTGYOQ/RdnCYWOlZ3ufYHbNpDcwykI7Y1rojQG4Wiv+sLu52l+n5B
         vm7Q==
X-Gm-Message-State: APjAAAWg7wDkBjqPpgUA8HeXuGfkLtYutW7FCNH8V7DdAUd1jfzhZ3z9
        sdky+eA9MTftsBiCSBc2yiyaCajG6FI=
X-Google-Smtp-Source: APXvYqwOSgpBVTNWHJvJsLnAs17s6Fl5LsFgDeDq4RvCMHWVI0mMFqpN/yfkclyVu93S20RfiviCFA==
X-Received: by 2002:a5d:4cc9:: with SMTP id c9mr24908245wrt.70.1576430622013;
        Sun, 15 Dec 2019 09:23:42 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id g7sm18541660wrq.21.2019.12.15.09.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2019 09:23:41 -0800 (PST)
Message-ID: <5df66c1d.1c69fb81.ec96d.01ea@mx.google.com>
Date:   Sun, 15 Dec 2019 09:23:41 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.5-rc1-18-g65115d1733b4
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next build: 5 builds: 0 failed,
 5 passed (v5.5-rc1-18-g65115d1733b4)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 5 builds: 0 failed, 5 passed (v5.5-rc1-18-g65115d173=
3b4)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.5-rc1-18-g65115d1733b4/

Tree: linusw
Branch: for-next
Git Describe: v5.5-rc1-18-g65115d1733b4
Git Commit: 65115d1733b469fc7026115b319541b8887b12b5
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
