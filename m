Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C096E1204AB
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 13:06:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727316AbfLPMDP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 07:03:15 -0500
Received: from mail-wr1-f46.google.com ([209.85.221.46]:46502 "EHLO
        mail-wr1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727241AbfLPMDP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 07:03:15 -0500
Received: by mail-wr1-f46.google.com with SMTP id z7so6871422wrl.13
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2019 04:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=b1kGm+M5dvK2s6C19e3OZZ8XuYbY85tyaCJoXgauCmU=;
        b=Jn1croKdHOCcDu0rX/ldvFoN44NexI6sO5NoyyGFC/ROXHjQMmtQGAUzJo1xJtPF38
         g8G0Jzh8aEWh7tqFX1ElNVJd4P10HU/0/fly1XYpapeWjbe91wG4loDkOFA469cNbmOE
         k/SWuelZbs2tkIkCcI+w1VK3uGUQlQCpQimiHV3W356nHTOfpHY8RzAkzVjXQ7oHSsum
         UDDn+gUeh8jEHXxv6wLdpEmxmwADfyeLGMAjGJk8BxUjfwzHGq+6xTfTUV4HxnvTxnQZ
         1eEMCdQty2uyhesbVJjyQm20l1WNAAndS47PAUD/U8HI39R5Knd8vUOMNwnFhL1yVHrc
         bxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=b1kGm+M5dvK2s6C19e3OZZ8XuYbY85tyaCJoXgauCmU=;
        b=KiLiEt8cAiOvYt3JffSVguP/WGjYgNXC584Wflg7dqFH5xuvtEW+8vwAGyMo75CqNL
         DuwvLtGpBfOAieMRIdbmfcDnDwGNvgzpJ6fM0kb65CsNzn21c40Hh4MAEk6pHQXij3Vb
         INT9/vgBjRrt5IL5fGzqGvAEohBTIANqQoD0A6Boe/zwnUg0kZC8itduqNGGFKJpdXnb
         bb9lyAv/bTZdLD6wpbprBPt81tQxcKbXVnb4TLkN6O2lOfPyWZDkcVJ6qR/9SKz4gpgg
         fK6/lmXUBeEywhwa+G5sIRrKED96T2EjSYd2gsfGBlq/GQgGCZfU6TXlJ57JjODfuH4G
         zOgQ==
X-Gm-Message-State: APjAAAVnxrQVKNAsG7xU0NJ9M61KunsbBLSSj65TqF/OkHNRU1AkfS/d
        RaazgfIx5j53mvQJfepU6oWI6Uvw5WQ=
X-Google-Smtp-Source: APXvYqzOMfc11Z5g7mdHCsdl37FhZzjBNf8spm/6pL19qB3jyMBRp2t4R7oT27ThVUQ8wDa9pzig8w==
X-Received: by 2002:adf:e6c6:: with SMTP id y6mr30082840wrm.284.1576497792490;
        Mon, 16 Dec 2019 04:03:12 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id a9sm11505976wmm.15.2019.12.16.04.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 04:03:11 -0800 (PST)
Message-ID: <5df7727f.1c69fb81.dab3f.b5bd@mx.google.com>
Date:   Mon, 16 Dec 2019 04:03:11 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.5-rc1-10-g3ae42ab1a87b
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel build: 5 builds: 0 failed,
 5 passed (v5.5-rc1-10-g3ae42ab1a87b)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 5 builds: 0 failed, 5 passed (v5.5-rc1-10-g3ae42ab1a87b)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.5-rc1-10-g3ae42ab1a87b/

Tree: linusw
Branch: devel
Git Describe: v5.5-rc1-10-g3ae42ab1a87b
Git Commit: 3ae42ab1a87b8966d53dc0f508c28b18112a18b2
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
