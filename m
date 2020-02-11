Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C031158DBD
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2020 12:49:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727762AbgBKLtZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Feb 2020 06:49:25 -0500
Received: from mail-wr1-f41.google.com ([209.85.221.41]:45044 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727686AbgBKLtZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Feb 2020 06:49:25 -0500
Received: by mail-wr1-f41.google.com with SMTP id m16so11945475wrx.11
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2020 03:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=x7+pKn5tOIhhYf4pBszA4XOTGDpqhZiS6xrLtT6uzUo=;
        b=mirNHIBXHH4pzOpE19xOaAmPDnwiY6QpwQLmm/VgUk9KYFCFcI9KAWXAw0ghZVsmkN
         Scox+BPk8OOQ9siStfeU+YTlnTT0KUNQBNPv0UzOd9/wQlYq+hSJH7ma9zOcfcThOWFL
         YfA/bsxSkkAHVa5wSvMHAAZ54ftRDc8EtMNcyAADAEmxKJHu0B5KOWK2v6fjXzZRMJ8J
         1pZHub/GSWQLi9UvJAAv8y/GUVlB/hJ2PntbbX6nbK8HplvlCOYmPNIg1XPlxk0AOYmL
         cm6J9HWOUj3ibL/tBsACDaIpEiQScUMsSnfmTFYBSD8D0+9im3TXGsOFjfgE+RnrQoWY
         fDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=x7+pKn5tOIhhYf4pBszA4XOTGDpqhZiS6xrLtT6uzUo=;
        b=d0Lbd6dFlF73HAXTQiccaI4n8wLBXoSai2FH5pya0i3khJSh8/87sx8P2n0dIUaYEx
         DbdtIkQS2/nomgz3ZC4T+1Fy1E1URjWnQaQinU/vxraEFH62e1Op1KSxIIzu3kibDlY3
         88blB0ExfY8Z3zgu3fXF9eb/eB0+d5rFpT4S3gDFV/hLHdhUbwiIJFGvq69zhvzlYa3s
         /NOai1Rao0oKR/NA/IEnyuEgNP9Hc71KWf/l8ynLUi050JJk+5BPKqDB6Wknhw4Wlkmn
         jvn5yJDNZINN0SnsfdZxaC4o9BqxF7QYNQ0mAK9cbaSnaB6/xbsY0PUADJ2vXa/Yg3Rg
         jnGg==
X-Gm-Message-State: APjAAAVI1Zd4YgD38XWSHSkcOsUJiYDOAu5m8qiwPKIaf8QEEhclZTrb
        rooruB6em2l23ibCX+8Jx83j/6QCU7bkDw==
X-Google-Smtp-Source: APXvYqzVvehO6JiTcSKxad5bFd+fhFWQFdmoPpQVjFl78bjtlyjSzSOPIi6/vqAWouXswhzWjfXWyQ==
X-Received: by 2002:a5d:6284:: with SMTP id k4mr8401633wru.398.1581421762781;
        Tue, 11 Feb 2020 03:49:22 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id w13sm4912381wru.38.2020.02.11.03.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 03:49:22 -0800 (PST)
Message-ID: <5e4294c2.1c69fb81.e43fe.7a76@mx.google.com>
Date:   Tue, 11 Feb 2020 03:49:22 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.6-rc1-10-ga924eae75106
Subject: linusw/fixes build: 5 builds: 0 failed,
 5 passed (v5.6-rc1-10-ga924eae75106)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes build: 5 builds: 0 failed, 5 passed (v5.6-rc1-10-ga924eae75106)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.6-rc1-10-ga924eae75106/

Tree: linusw
Branch: fixes
Git Describe: v5.6-rc1-10-ga924eae75106
Git Commit: a924eae75106258c0797706a0578c5af499c9ff5
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
