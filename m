Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF99EDC19
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 11:07:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727332AbfKDKHY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 05:07:24 -0500
Received: from mail-wm1-f43.google.com ([209.85.128.43]:55999 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727138AbfKDKHY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 05:07:24 -0500
Received: by mail-wm1-f43.google.com with SMTP id m17so6653996wmi.5
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 02:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=TCybtOlw0IOeSQo4O4ylJBSiSe03Dzvxh4UdYaM1Sds=;
        b=wZOfO+rSwTc9PsxZR8Er+g9xRsgD/LYkuQbbFFfpgHm/cvwJ3QvpLz5IZTwc/e28DL
         NC5Ii7OHkJtCIFe23RFe/Jhf6W2lxYDuLxxGSJ9vADP7pOLFuouYaYnZIIZF4dOFVS78
         WF/YMTeQ7UMpt04bppuyjeHzG3xgH63VgV7Gl6OjNSMt0bD1U5yLmBCXxnksX4LSy83R
         bYoKmClihS6cuRY/ZXwp6A16LYtXB+jFfYuEQaCiZQF271jTVoVj6F2Zjg5yKWcrBcSi
         4+jsqoJKA/bZQBv2e/tby5GBRMZ7vFzSBVs+muFMZp3xnsvMvE+f2JELH4z2cYVTVVN8
         Gsvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=TCybtOlw0IOeSQo4O4ylJBSiSe03Dzvxh4UdYaM1Sds=;
        b=gKgRGCVIJmWDfiJbxgFm1ugEIWqhicYhYKfREZ3rT3dVvhuKZQVUISuH+TqaVgcjtx
         2U4UQ7WmX1mzfuuDBU7FRrBApbHqYUmv+4tOrFfNqDpHYQ5nLDzJLJyp9jcg2E/gnpi9
         HMDteC+sxMsMH51bRs2LxE0HCEJPHzOAZyds0PdsoKcEQIHfk8IndmVrjFXM43W4dSTR
         XwXl2Q/FTq2Y4ilPqR0sTysB3hutDJpu/2kG4HxaCyhY4Xepc4E9fxUYJXS7TVn9CqKU
         bU1MFSTojjk+rWZ5qyikzAauHrKHpKUxynjti8sBpicCIfRSDcohM6UCBT1SiU80FPmN
         Ajdg==
X-Gm-Message-State: APjAAAWxtX28dYWSAmoHTKlRbB7D2+A137D6A+ForOsF2pDYx6mlSUGV
        Abytx/4/GUuItgaFMr8q/lBldowFfvSrvA==
X-Google-Smtp-Source: APXvYqwuHXy9Ll5Hwg/jwGL5EMadRcU0aCVcfKiJhPJilVfA8zrLGhHqHcjwWDEh59J55E9Tfq3xEg==
X-Received: by 2002:a7b:c94f:: with SMTP id i15mr22688895wml.8.1572862041654;
        Mon, 04 Nov 2019 02:07:21 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id w19sm6485327wmk.36.2019.11.04.02.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 02:07:20 -0800 (PST)
Message-ID: <5dbff858.1c69fb81.8e01.8e07@mx.google.com>
Date:   Mon, 04 Nov 2019 02:07:20 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc4-37-g1723e834a4aa
Subject: linusw/for-next boot: 44 boots: 10 failed,
 34 passed (v5.4-rc4-37-g1723e834a4aa)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 44 boots: 10 failed, 34 passed (v5.4-rc4-37-g1723e834=
a4aa)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.4-rc4-37-g1723e834a4aa/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.4-rc4-37-g1723e834a4aa/

Tree: linusw
Branch: for-next
Git Describe: v5.4-rc4-37-g1723e834a4aa
Git Commit: 1723e834a4aafd9a73ba6eb61aed6b092acfde73
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 37 unique boards, 13 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-g12a-x96-max:
              lab-baylibre: failing since 1 day (last pass: v5.4-rc4-28-gac=
ba5fc211ee - first fail: v5.4-rc4-34-gb0983a8bbfb4)
          meson-g12b-odroid-n2:
              lab-baylibre: failing since 1 day (last pass: v5.4-rc4-28-gac=
ba5fc211ee - first fail: v5.4-rc4-34-gb0983a8bbfb4)
          meson-gxbb-p200:
              lab-baylibre: failing since 1 day (last pass: v5.4-rc4-28-gac=
ba5fc211ee - first fail: v5.4-rc4-34-gb0983a8bbfb4)
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: failing since 1 day (last pass: v5.4-rc4-28-gac=
ba5fc211ee - first fail: v5.4-rc4-34-gb0983a8bbfb4)
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: failing since 1 day (last pass: v5.4-rc4-28-gac=
ba5fc211ee - first fail: v5.4-rc4-34-gb0983a8bbfb4)
          meson-gxl-s905x-libretech-cc:
              lab-baylibre: failing since 1 day (last pass: v5.4-rc4-28-gac=
ba5fc211ee - first fail: v5.4-rc4-34-gb0983a8bbfb4)
          r8a7795-salvator-x:
              lab-baylibre: failing since 1 day (last pass: v5.4-rc4-28-gac=
ba5fc211ee - first fail: v5.4-rc4-34-gb0983a8bbfb4)
          r8a7796-m3ulcb:
              lab-baylibre: failing since 1 day (last pass: v5.4-rc4-28-gac=
ba5fc211ee - first fail: v5.4-rc4-34-gb0983a8bbfb4)
          rk3399-gru-kevin:
              lab-collabora: new failure (last pass: v5.4-rc4-28-gacba5fc21=
1ee)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            meson-g12a-x96-max: 1 failed lab
            meson-g12b-odroid-n2: 1 failed lab
            meson-gxbb-p200: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxl-s905x-libretech-cc: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 1 failed lab
            rk3399-gru-kevin: 1 failed lab

---
For more info write to <info@kernelci.org>
