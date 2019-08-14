Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C29B8D1BC
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2019 13:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbfHNLIk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Aug 2019 07:08:40 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]:45352 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbfHNLIk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Aug 2019 07:08:40 -0400
Received: by mail-wr1-f47.google.com with SMTP id q12so20410311wrj.12
        for <linux-gpio@vger.kernel.org>; Wed, 14 Aug 2019 04:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=tvwDqV5+4E0hPf1lrzepTg/H/4QVClR11NtcukbfU7Q=;
        b=tKaexcz2UBH6a/e7gtg2GMRBfjrnlUAeWNPYyG2//5XPwLzOGsg8ZnVXhh9lmYzDMM
         ZKRiSd3gQEhAORZNMKIMN6vMs5sOXeJmZNAUkL3lx24kJFqm+WHGOjMdnlKQtncAeTcO
         uhPH1uvwHNnA9/ZePWvI4Mc+J65888cJVviNtokSsXjge7OWb58CxLNmsblRKB5Bq442
         JItgRv5EVC4a+xplBH7CKFifjjWoLJ8HcUOeIoklBKtfdhSL2IumEMMAP1IKukbHC2or
         EjJnjMFaZRG/MY/I9yg9G1E+ZeCAbWa/ahvuR0EOq8HeMFIQvdgcCGlA2HDHz9/f68fR
         LtJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=tvwDqV5+4E0hPf1lrzepTg/H/4QVClR11NtcukbfU7Q=;
        b=J7yGcPWqtUdO7wgVAs59OqqRxBvjCaBBEKGRrg4bya3agSP8bjwGMIitGzQ35P04Vh
         f66OimX1ewukLHPgFv3oVzQX3c8KmhHMHpiaSS9uayCmF8dSJclkchmaHNl2V/8+Gssa
         RHi2gW39Cosgtm69KJEFV8+u6tPf6rCwV6LAse00pLqTxm2iJcES4t9liNbKbNCR5jbW
         q3Lbi2jB42Xf5NB4vUECIW61t5j3U/9Qk/DMSZBrmVirUd5QNozhEyNhVEUkgfPv33Hr
         pVFDqQMu7CYFO871ZGx6/fJUqGWiWOTNWqaFv3w+JR//9w7vi9l/1CrW5GF1mKUO5jkG
         uKaA==
X-Gm-Message-State: APjAAAUTAQcsnm5vC6OzsbhqGVPWKMIeDFxTnYaq66OGR1SjFcx2yQ3K
        S5DmILoLuMuiMuNaBoEToAfMLNA/JIhkOQ==
X-Google-Smtp-Source: APXvYqwBUJME9KruOfkOc0VwBLSijBs8fUscyUN2e6mGixGit07mieM2VaN7Fv9nuve10mA1U1MLeg==
X-Received: by 2002:a5d:5543:: with SMTP id g3mr6575758wrw.166.1565780918092;
        Wed, 14 Aug 2019 04:08:38 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f70sm5903792wme.22.2019.08.14.04.08.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Aug 2019 04:08:37 -0700 (PDT)
Message-ID: <5d53ebb5.1c69fb81.f3799.0092@mx.google.com>
Date:   Wed, 14 Aug 2019 04:08:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc1-25-g470219c619e9
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: devel
Subject: linusw/devel boot: 58 boots: 3 failed,
 55 passed (v5.3-rc1-25-g470219c619e9)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 58 boots: 3 failed, 55 passed (v5.3-rc1-25-g470219c619e9)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.3-rc1-25-g470219c619e9/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.3-rc1-25-g470219c619e9/

Tree: linusw
Branch: devel
Git Describe: v5.3-rc1-25-g470219c619e9
Git Commit: 470219c619e9f76e41497b9a90f2ec61dbedf3f2
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 40 unique boards, 14 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-mhart: failing since 15 days (last pass: v5.2-10808-g9637=
d517347e - first fail: v5.3-rc1-5-ga299726da44f)
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: v5.3-rc1-18-g40b0bcd3e0=
e2)
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: v5.3-rc1-18-g40b0bcd3e0=
e2)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

---
For more info write to <info@kernelci.org>
