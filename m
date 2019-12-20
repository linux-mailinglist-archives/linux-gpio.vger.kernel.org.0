Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E00661273A3
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2019 03:49:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbfLTCtr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 21:49:47 -0500
Received: from mail-wm1-f50.google.com ([209.85.128.50]:55528 "EHLO
        mail-wm1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727006AbfLTCtr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 21:49:47 -0500
Received: by mail-wm1-f50.google.com with SMTP id q9so7433319wmj.5
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2019 18:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=sAd1xoGXJNT86GanjyzYXDNJTuJ1zgICiu4tFUWDIYc=;
        b=ExS6UmAq5uvmPU/OlRhTortPBP0h7VLdm6+r/e8ilcs+YAh2PAmZjTOjj6j1FGTGgV
         /jk6hFK3J8zQ1bObyhoEBV0Vz8JQsrFObH9BcIupsjZnoDF/SXwcLwJp0GvzC+iwK3C6
         uencGFbKBe8QIMuZHPmtyWcvH6V+wWIl0k2XxZIBe6u4dVISGXpmOXfZkEE4vvTwrDsP
         /3BM0I1NfUROWoh6pxvdz58kIGMpTXRXspnfbJCtLQ5j0An71GvEDyUapWAAiYI6oDbV
         xWXU59cu3p0/42Pf7NAaWYYzAPsBIsFVhPKXee/QTqCbMx8r+LEcQA1Jd2xX7O8aQ5N0
         /Esw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=sAd1xoGXJNT86GanjyzYXDNJTuJ1zgICiu4tFUWDIYc=;
        b=ULsXbU3RG+zFQnhE/OChUAHVtSBocyGuTxuNJC7PiAwwozuNmBXknHYNk+7coEhRz5
         nw+ZA9g+zwqZgsEbx38Rr9i8w+d1iyweXbcNJpqz0KP0Ped/Sq6/E7r4x6Sa9+AVQmEW
         TSBoFp/7MTQv2IhEsFHtFdug3+GMqwOlHj54wHNwwOydu9keZznF0ds9VHOPapOJyDD+
         aBljVYOH5vUL0yXFIMg+OXd1Bg6n/ZY7C7Prw4xELF2nl3yfz0PwiWGCG6EVWvfCEaJF
         Ba6eXu7wpQ1c4XUl6vSzLQ43NJ82UuTgle6a4q39Vm425r/bWur5mZ+d4aZwvQMxD4cc
         BBIA==
X-Gm-Message-State: APjAAAV+ZNro8GI8cF+xabL6VT3g1pyYE7uUIJ/4ti+wlSOrfsmBKXMq
        SVpn+Y/vRv5SsgC2CGP4XAcpDOUp/AKo9w==
X-Google-Smtp-Source: APXvYqwhxOxRN5wX1rO6OYuLYkk3jjIMBWAQ6Kb42xNC2Tj9fNjjQ/39M+5bjNaXWq0x4hsArEJRKg==
X-Received: by 2002:a1c:9814:: with SMTP id a20mr13063386wme.94.1576810185191;
        Thu, 19 Dec 2019 18:49:45 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id m3sm8033104wrs.53.2019.12.19.18.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 18:49:44 -0800 (PST)
Message-ID: <5dfc36c8.1c69fb81.ae2a.896c@mx.google.com>
Date:   Thu, 19 Dec 2019 18:49:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.5-rc1-20-g06c4fc5eda6b
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next build: 5 builds: 0 failed,
 5 passed (v5.5-rc1-20-g06c4fc5eda6b)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 5 builds: 0 failed, 5 passed (v5.5-rc1-20-g06c4fc5ed=
a6b)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.5-rc1-20-g06c4fc5eda6b/

Tree: linusw
Branch: for-next
Git Describe: v5.5-rc1-20-g06c4fc5eda6b
Git Commit: 06c4fc5eda6bce50e3995e436db6aa7fb5bc56eb
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
