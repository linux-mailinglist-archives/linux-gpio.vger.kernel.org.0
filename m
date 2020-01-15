Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 689C813CCB9
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2020 20:00:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729021AbgAOTAx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jan 2020 14:00:53 -0500
Received: from mail-wr1-f45.google.com ([209.85.221.45]:36189 "EHLO
        mail-wr1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728992AbgAOTAw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jan 2020 14:00:52 -0500
Received: by mail-wr1-f45.google.com with SMTP id z3so16833103wru.3
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2020 11:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=SHayAZ+uH9yy6Heqlp2OuaFHA9u3FOSwtSHdvgeMfsw=;
        b=cow5gJ2JhiqXV1vTdvuhlemz58fZPkhuSm/zYdgYyHQC8QgEe+YpGoogwE8iaGHUoH
         F2TmCgvvlbDrKBMP3vEQDjVT3k2K2UT5uWUcw+USgZ/52FhRpP2NuSz60grZ6oN44uL8
         kW2QKtNfpOvd4xA2cW1PN9dX/mzHJVzBRvpDHFHNrSke+SyascA9UvTVagUuQlHxTvIv
         yne0/zXKO/8Y3EKatLT5xptRxwgnruEeRXmu/qpfbKWNeES5U+UCVEZvS7JRrMzuwO//
         OVNb6TInIgbJ8snAJjgfvsPZIm7uRtyyZbRZg765QswWFAc73njZerj+/bTJBepQ5Gf0
         gCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=SHayAZ+uH9yy6Heqlp2OuaFHA9u3FOSwtSHdvgeMfsw=;
        b=RWljB45libLrPUQg33m5qapakmTQMcxFO5cLVkKyz+HjUzSYbL7KJZ1DwHQyFiHZg5
         A5OUDeSBtG15qCwD+0fPTL0gjoPMQz4nLzoUA1mAPfi2X/ow1xzxPq+2fgm5Fcehi+ef
         8N2ZJFUI11GbrCtpE0Kl8VE/Ak9eintGu+GbqNo03gkB1z+iCN9hL3p9/3wuTxlupwiS
         01jjQpJQJueVjJZjQG+5VQws9NEVRG1VuqJ27oLZyE9J9AIpwuo8ACDGmbQJYYrej5Et
         GxEbfzVWzwlh4jlGAdVU82Kp2a+9TKftKtnQNZPAGbMffb5aZVF004GsdSanFg4VoFTE
         PkjA==
X-Gm-Message-State: APjAAAWSnbAk1iVK4m+aTqkzbWOqQjilY4VZ7EzhXhW41NCrgzQCtwi2
        yjLTvO7UwDZr/5nOhPoLGrfw373g+X1WVQ==
X-Google-Smtp-Source: APXvYqwgJagUszap9+GtQSjN3hXgJ6LnzUgASHWKpGtstdW0KibS/sThs5XasUgcPZ8GikkI9EZ+tA==
X-Received: by 2002:a5d:608e:: with SMTP id w14mr33725442wrt.256.1579114850199;
        Wed, 15 Jan 2020 11:00:50 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id g2sm25932259wrw.76.2020.01.15.11.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 11:00:49 -0800 (PST)
Message-ID: <5e1f6161.1c69fb81.6926e.c4e8@mx.google.com>
Date:   Wed, 15 Jan 2020 11:00:49 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.5-rc6-4-g7a9f4460f74d
Subject: linusw/fixes build: 5 builds: 0 failed,
 5 passed (v5.5-rc6-4-g7a9f4460f74d)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes build: 5 builds: 0 failed, 5 passed (v5.5-rc6-4-g7a9f4460f74d)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.5-rc6-4-g7a9f4460f74d/

Tree: linusw
Branch: fixes
Git Describe: v5.5-rc6-4-g7a9f4460f74d
Git Commit: 7a9f4460f74d705014aaab1900be688d20c75909
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
