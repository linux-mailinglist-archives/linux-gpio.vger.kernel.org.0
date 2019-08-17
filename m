Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59ADA90BC6
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Aug 2019 02:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbfHQAfT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Aug 2019 20:35:19 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]:46345 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbfHQAfS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Aug 2019 20:35:18 -0400
Received: by mail-wr1-f52.google.com with SMTP id z1so3067126wru.13
        for <linux-gpio@vger.kernel.org>; Fri, 16 Aug 2019 17:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=YPcFQLECINVOFSxMExdubFwgEaXmvyWaJh+Mny0pXfM=;
        b=aMt14r/KDzcvg7FdRtrMeJc3mQjtw+jJeJlHcPTHqx3PlNk1GM1CkbtAilklygojnN
         YHPdoi0edWnOriNMihnQcDyRTOI3kg8wddcEa1Dm78bNQVfRuqJaO345+MkmFcEyH5E/
         XCtHbFu0plroOfA38Gb93OoPNAI9n9crhnBd6Y/mo1cGQVxYAHvNrCHee/goTtKQSNEY
         kezhUE10ky548z3muODmc4t7Qbp+zC880/iAnvzJdRPX+GRmNRyqbfhlIHp3Nr5ZJeeS
         Xv6jukMQ07vJqPoTuMc5jrDE5USGG9ybW1d+uIzOqXHu16KsBSjrTZYyYl2P2Pp1J8q2
         Bzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=YPcFQLECINVOFSxMExdubFwgEaXmvyWaJh+Mny0pXfM=;
        b=CBiOyGAeiysd17myuptjTg4zcZ64xl03A03HvOBMhU2C/1vhc9kHUh0qgfQeI9phRm
         +FCAM+uiWqbH/9bEFqyNa+KkAYnJzxinxYDQu9oHlRVBQ1vK7MmkS5Crdc/f0a83OghZ
         AzxNDXtDCPMLsD5yrnGmKLCWnmZN9BpQIsojnAzHWE2EFI/TE+qDNMThp1vgeSWmp1d3
         xaerK4ZuCs7CWZgYyrLFFCTch/kzp1sAOKXRw83G3g34bcj6PAagLbxnkQ0S9OuLlPQ9
         h97pRdCWV0sc1EyEkRsJ/a5nDCCxgP4+kWlVW94UBmOQJ1L3PKkGv6C44CuvndoSQfcW
         1xOg==
X-Gm-Message-State: APjAAAVPX0wrjB4d537MuyhnWWElq0cQdLJJ1bmF6CDrfP6T0xvGuixw
        MqRO7STQxiUVBOJZJnt62n8O5OKETNA=
X-Google-Smtp-Source: APXvYqz4/ik6fLAEv6oeKCxTs9n1Qt8EjyWpeUkKiELRdwR1N7np6Fai6yoBY/W3/QwbKpM0ezEsug==
X-Received: by 2002:adf:8043:: with SMTP id 61mr13575565wrk.115.1566002116612;
        Fri, 16 Aug 2019 17:35:16 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id b136sm13622290wme.18.2019.08.16.17.35.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Aug 2019 17:35:16 -0700 (PDT)
Message-ID: <5d574bc4.1c69fb81.ff580.3fc8@mx.google.com>
Date:   Fri, 16 Aug 2019 17:35:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc1-31-g379ce1ff51aa
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: devel
Subject: linusw/devel boot: 55 boots: 3 failed,
 52 passed (v5.3-rc1-31-g379ce1ff51aa)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 55 boots: 3 failed, 52 passed (v5.3-rc1-31-g379ce1ff51aa)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.3-rc1-31-g379ce1ff51aa/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.3-rc1-31-g379ce1ff51aa/

Tree: linusw
Branch: devel
Git Describe: v5.3-rc1-31-g379ce1ff51aa
Git Commit: 379ce1ff51aac14405604a45fa6c9bfc77a854e8
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 39 unique boards, 15 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-mhart: failing since 17 days (last pass: v5.2-10808-g9637=
d517347e - first fail: v5.3-rc1-5-ga299726da44f)
          meson-gxbb-nanopi-k2:
              lab-baylibre: failing since 1 day (last pass: v5.3-rc1-25-g47=
0219c619e9 - first fail: v5.3-rc1-30-ge00fae7d82ec)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            meson-gxbb-nanopi-k2: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

---
For more info write to <info@kernelci.org>
