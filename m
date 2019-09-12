Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8C32B066B
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 03:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727655AbfILBYd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 21:24:33 -0400
Received: from mail-wm1-f48.google.com ([209.85.128.48]:33156 "EHLO
        mail-wm1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727576AbfILBYc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 21:24:32 -0400
Received: by mail-wm1-f48.google.com with SMTP id r17so482484wme.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Sep 2019 18:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=YzHrq9WXJCT0H3k4Z1iIfkM6sXI/QzTVQnB1qj6TOzw=;
        b=YIZnOFpcLc6lR/Y4CS9gYKWcyqBI7YhMLU8+gA62gOaPjIkvK1agak+w89EmC609gL
         JxgDSWX/Nr18U8QNRYailrvPeBRk8vydSYdBW6jtsMQeHlA8oAJFA/A0Il1QOY+E+WE/
         gkgVn3nWy8rPdmnNmYtYZygec43lwBSzR3FMaI2EZQnUsFFELOljz5I+ch7vhwkZ+nel
         PA9hNP2RsxKXmg9tID6PLAjAC2fyn9VtMt9K7zIoFp7N1KY4jcrxE3ELII3RDHd+QuLD
         0+AZhwd8FTVXPddV+2OFn8bvVhIweKcPoWQ/hGG1c/HXzVKSAJXA560O/XC7Dgtaycqv
         kmDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=YzHrq9WXJCT0H3k4Z1iIfkM6sXI/QzTVQnB1qj6TOzw=;
        b=ndUA5creTXXS92DdwpPQZHmUl3hJBWMOvU2RGy/U5Eb1XZ2LUPSOjpz03xlDXn3iwZ
         +ORwpBLaBcr1Fvmu0zjHyBtXBNQj+y9N5+/RQutnz9hEDlZ09898MPRYe0ZXSqEo6D+Q
         Yo4tOMJTRdDmUmKewCeZmZREj4x2Ophp9i47w8D1GcKxRCZdAMxPZKY8577Zji0magtP
         gpSnwChBXfx09tjtJSzVrDTiNwNZ86n3PjkpwvbNRgxoIZF8ogF/mZy515a40qtgJLe9
         5ybAIbPovUKC7OWJmVymutcYvstJjN7qN0f7vSrxsSHCmc3BmmSPdDPjal7FZ4vS+fxf
         pe/Q==
X-Gm-Message-State: APjAAAVi41MviZqjybGcLj+tLsouSZN3rD7a6qacX+Hh1+3yEQpPF33n
        dySgEqLRimXBLuPb1Y+y8N3MXpR4pq5sEA==
X-Google-Smtp-Source: APXvYqxdtlmwbNrMHokn95HkxAmkdcUAp5c64iPOxeYruW4U1O9xUYWXR+n7TcEKmXIQOkiAb3fQug==
X-Received: by 2002:a7b:cb9a:: with SMTP id m26mr6292357wmi.57.1568251470576;
        Wed, 11 Sep 2019 18:24:30 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id i14sm758941wra.78.2019.09.11.18.24.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Sep 2019 18:24:30 -0700 (PDT)
Message-ID: <5d799e4e.1c69fb81.f36c0.3a6a@mx.google.com>
Date:   Wed, 11 Sep 2019 18:24:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc8-90-ga6ef71d0ac87
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: for-next
Subject: linusw/for-next boot: 59 boots: 1 failed,
 56 passed with 2 conflicts (v5.3-rc8-90-ga6ef71d0ac87)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 59 boots: 1 failed, 56 passed with 2 conflicts (v5.3-=
rc8-90-ga6ef71d0ac87)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.3-rc8-90-ga6ef71d0ac87/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.3-rc8-90-ga6ef71d0ac87/

Tree: linusw
Branch: for-next
Git Describe: v5.3-rc8-90-ga6ef71d0ac87
Git Commit: a6ef71d0ac87c479579ad92eb9963972dac18b7a
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 43 unique boards, 15 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: v5.3-rc8-84-g686cfd3d95=
9f)

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s905x-khadas-vim: 1 failed lab

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig:
        tegra124-jetson-tk1:
            lab-baylibre: FAIL (gcc-8)
            lab-mhart: PASS (gcc-8)
            lab-collabora: PASS (gcc-8)
        qemu_arm-virt-gicv3:
            lab-baylibre: PASS (gcc-8)
            lab-mhart: PASS (gcc-8)
            lab-drue: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
