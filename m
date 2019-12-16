Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58BF7120538
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 13:16:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727513AbfLPMNs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 07:13:48 -0500
Received: from mail-wm1-f54.google.com ([209.85.128.54]:40397 "EHLO
        mail-wm1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727427AbfLPMNs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 07:13:48 -0500
Received: by mail-wm1-f54.google.com with SMTP id t14so6419553wmi.5
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2019 04:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=pXv8OxQ1bocrEkQ8ZXaVl4TgemIXM7Ni1oLyAsKVhGs=;
        b=efbL63aOgKASXMjxb1GOUeBe7nDW1Q2kIYB4X/G63+vliUrtXhCS7rxsjBoU4l3uOS
         Hmk/MWnhBvHlCamVPmR1bpacNTF9TPXNFbKhxhTShm3BUzk1n2PupDJDuV0Bav6bZp4U
         QG3ei9ojySb5T32u7J41MQYHGZq0GMmQfwX6ZdVTX0TjdfjWceR55m+lyVuQivQw51r8
         rWZfLRJ2B+ennZ+uwsCP6yKivGE8i96+ewb/yJuj/z7Tu+HHS6G3JYPiYu6cBsZdrWj4
         ldxoWglG2fznL9RWMC9rhrkLsiBClB59M/6mZ6q7xTtJfn9NN2LsjxdKcFoExsgPaENh
         kxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=pXv8OxQ1bocrEkQ8ZXaVl4TgemIXM7Ni1oLyAsKVhGs=;
        b=j8ikVUpmecmQVFNayU6FKCD0cJKZe4GWSJXHTyKTL70hmnuf3Y0bc9QkGO7eodAyXB
         zVpYjwtZiFLuB+yjBNHm469DarP0sYTQsCT7+/4Jzl5mTCD6ol0hqEYY72NU6xvO1LO9
         sPWCM3ovZJlOGs+5chD60JbClCd7u1EvM4zkJznat4+uSLb6Wq+tsAjPluj/8siZzlv2
         upgKLktvpXCcY3S78y3ESJNycy8T3+IqsgD2Ka8rLPYCR5oU6TScKbe1FUA9Xf/6q/43
         yPDJSWnBkx1VdgtT0pfboqtVrlU7n11gUaVhq8uP08X+xzhCkkBlRzvb+kFX9K1I8e4o
         ZlDw==
X-Gm-Message-State: APjAAAVY8RNT2s9nrCTpSU8rdHrGcsLi2Q5HLhMbXOMEzqe9XfY0rjGE
        EuZdHMF3C5XZDYeYkddxXsQyO5z2aKw=
X-Google-Smtp-Source: APXvYqxFANGefuSbV8XfP+Yiw3z0F8/fHHpAlOgvyBZnGSd/hACr1OQNPHSO703gQp01pMeu9OLGTw==
X-Received: by 2002:a1c:7d93:: with SMTP id y141mr31002627wmc.111.1576498426068;
        Mon, 16 Dec 2019 04:13:46 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id c2sm21612637wrp.46.2019.12.16.04.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 04:13:45 -0800 (PST)
Message-ID: <5df774f9.1c69fb81.498f6.f72e@mx.google.com>
Date:   Mon, 16 Dec 2019 04:13:45 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.5-rc1-11-g286e7beaa4cc
X-Kernelci-Tree: linusw
X-Kernelci-Branch: fixes
Subject: linusw/fixes build: 5 builds: 0 failed,
 5 passed (v5.5-rc1-11-g286e7beaa4cc)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes build: 5 builds: 0 failed, 5 passed (v5.5-rc1-11-g286e7beaa4cc)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.5-rc1-11-g286e7beaa4cc/

Tree: linusw
Branch: fixes
Git Describe: v5.5-rc1-11-g286e7beaa4cc
Git Commit: 286e7beaa4cc7734894ee214569de4669ed9891e
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
