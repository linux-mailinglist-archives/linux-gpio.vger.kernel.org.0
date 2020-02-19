Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 332A31639A9
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2020 02:52:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbgBSBwn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 20:52:43 -0500
Received: from mail-pl1-f169.google.com ([209.85.214.169]:35503 "EHLO
        mail-pl1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbgBSBwn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 20:52:43 -0500
Received: by mail-pl1-f169.google.com with SMTP id g6so8873989plt.2
        for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2020 17:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=4uPjJJCRp+SB0pozAFRGdWFgxk0Vn/KKHhu8gk6Ht+w=;
        b=QTGIrnUKl4RtvCoMmKrEk1eGka4IU1pMphGcUjHz7NXhCbUAYygGpfmBzW0JC8C6FO
         RxPyEp0vbA4NOhaeF89m3JXjcGbQwG1HZFn7JCBvPUBc7yL2g5xM3dByIYF8y6U0rzr0
         qRB2R3kWVTvpe8MW77KQvF30iG714pqd2EcVMK6oSESrmq5lqxd+WLonuNXFXgsnBlFX
         rlp8ByyDX6TeiRS9RmZ3noRTMCimEBIDh2dCDY6viwJV24WG6Ut5p1VPW007XnGHrvp/
         N2QD2B/wjWKAHhS4L6AJ4u7saKtPXlJ9HdyFpq2hMBnYO0LAk3oHfekSXlpaI/9//0VE
         yL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=4uPjJJCRp+SB0pozAFRGdWFgxk0Vn/KKHhu8gk6Ht+w=;
        b=j4YTGYkDl1FXiJIOOOuzRjFAY2jPt1r5SK3H1SBji43H5oKMo5TnAGj06I5OnjSAYs
         BkplCA12vM5JHE9OylAvUVkpVEff99W0UJCtMyN+P6qGpdYJBHflKrOv6070lxPiJVeR
         qTiwX61idFzyukn/5XhGstMPoWO4rRMbaVL1PTjPM/o2C95/xBCRTtZRwUV5AM1ih5NL
         ZLzWy48eIC/vhgYcKlpxPUgXFg7gVlrjF2wIgXT2s6bqrrkd/EwJ8KSeQSK7DIPmMY02
         zQn+HgzAVnBUo9wQtFT/opqSXppSqymXP0awtJqPnDMTaYjvpxUVA2oNYtG3SsKOvoKi
         GLfQ==
X-Gm-Message-State: APjAAAWxQmfMCRlX/1jz64EUPPsv4Bi8hFeYe4y0dJEI4cMgx280y6XD
        /N8F7RX6c9d+Zc7/RXyE1dHwwir64VJAQw==
X-Google-Smtp-Source: APXvYqy10TnjEVOJu+W+sTmT7LCRGejTdSSZWZefXp7bVS4hUnC2y3/BZXxx0jq08RXpKxg+YNxK+Q==
X-Received: by 2002:a17:902:b944:: with SMTP id h4mr23069734pls.92.1582077162064;
        Tue, 18 Feb 2020 17:52:42 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 70sm229998pgd.28.2020.02.18.17.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 17:52:41 -0800 (PST)
Message-ID: <5e4c94e9.1c69fb81.f30a4.14e2@mx.google.com>
Date:   Tue, 18 Feb 2020 17:52:41 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: gpio-v5.6-2-13-g53803ecac78b
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next build: 5 builds: 0 failed,
 5 passed (gpio-v5.6-2-13-g53803ecac78b)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 5 builds: 0 failed, 5 passed (gpio-v5.6-2-13-g53803e=
cac78b)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/gpio-v5.6-2-13-g53803ecac78b/

Tree: linusw
Branch: for-next
Git Describe: gpio-v5.6-2-13-g53803ecac78b
Git Commit: 53803ecac78bbabfdd65f5cb789e46660fa63900
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
