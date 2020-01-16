Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA9E313D98D
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2020 13:06:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbgAPMEd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jan 2020 07:04:33 -0500
Received: from mail-wr1-f44.google.com ([209.85.221.44]:37064 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgAPMEc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jan 2020 07:04:32 -0500
Received: by mail-wr1-f44.google.com with SMTP id w15so18921055wru.4
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jan 2020 04:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=NAohKNsy0mhvM6IrNcCuIT8LeY/K7t6aSkxFn/NzFno=;
        b=kL8YjadLfc9lz89eFllL/r9jWyj1KdKqY4eO6Ef5vHg9NPPEwNnCA5cCVwO+f1iQcn
         XW7WaYfwodR7B0NYHp0cvV2ODa9L78/SGGdaDn9S5mj/+e61fl7lbl5FSUA7DeIuX4BA
         pjZ2rfrolSVvJKm+KLVMZCZzjAzHNudKeSlZ8WWnvZGtiB5FtxozZ0UlVOSt3+45qB4d
         h6u2zb4XUuZeD5b2dJQpJ4n4ULvU3kItoVITCdZdIMVRvJhgrxDfw+VC5s6cKWGUnpZa
         kQmfd+rooXAxFpf4pkmRlE7lAsG9/6RKRWOOSQEbCHdNG4238vkPxYtxY3rWPzRkZsS7
         NaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=NAohKNsy0mhvM6IrNcCuIT8LeY/K7t6aSkxFn/NzFno=;
        b=NXt5Qc8WWVkcMXXXi2V/3n0f9KSVyHGlhMBWqb/OsJFld7AINHe+C6s9ZyeM4DDeKw
         ew0+MTwxkmHSrrsNI7V1UqTUjmW7SI9oULUwe4QlEHDS+WHf9dQCa44/Kg/KZfXJ+/T3
         ml6CBtr+dddOq4j82havfmbIgvuQBpryRBV4dylVWrOc7HiCANwtevgHD5BvWDNLFZqZ
         Nti+mX50smlMT35bcGZPYWq0dWChhdGXTD9WCx425E41fM7EgGjOOKlhdJX3VuwefJQM
         p2vVarKOYRpaZakqfwZlvLKNN0v4V0U4WEoZ6xiINmpjdsUiu7aWEYEgQmXhvFpuabbD
         plqw==
X-Gm-Message-State: APjAAAWVCPrAQk34CHSejbvFgRotU+DnmHf552TJzdo4PsyXAcR9iz/G
        Jj5CfZ+S4QIMYDFzw5gxDlxVw5yRdDbIcA==
X-Google-Smtp-Source: APXvYqzokH8BletaWtF9vstv8YaJAy4lH1lYFDJ0+wHWx/LgDwO4Hdq0RlcEygoK02JpW1lKmXuWrg==
X-Received: by 2002:a5d:4b45:: with SMTP id w5mr3095736wrs.224.1579176270927;
        Thu, 16 Jan 2020 04:04:30 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id d8sm28294606wrx.71.2020.01.16.04.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 04:04:30 -0800 (PST)
Message-ID: <5e20514e.1c69fb81.3f1f7.56aa@mx.google.com>
Date:   Thu, 16 Jan 2020 04:04:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.5-rc6-5-g9c6722d85e92
Subject: linusw/fixes build: 5 builds: 0 failed,
 5 passed (v5.5-rc6-5-g9c6722d85e92)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes build: 5 builds: 0 failed, 5 passed (v5.5-rc6-5-g9c6722d85e92)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.5-rc6-5-g9c6722d85e92/

Tree: linusw
Branch: fixes
Git Describe: v5.5-rc6-5-g9c6722d85e92
Git Commit: 9c6722d85e92233082da2b3623685bba54d6093e
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
