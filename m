Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6240412DA82
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Dec 2019 18:16:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbfLaRQt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Dec 2019 12:16:49 -0500
Received: from mail-wm1-f43.google.com ([209.85.128.43]:36838 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbfLaRQt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Dec 2019 12:16:49 -0500
Received: by mail-wm1-f43.google.com with SMTP id p17so2303000wma.1
        for <linux-gpio@vger.kernel.org>; Tue, 31 Dec 2019 09:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=mXJ0HAirSXfoweWRLpyWwbE0Jz1CvrZ/f2w6Wer4lZU=;
        b=HMt3l3P4SlWZapBI5u4vs/vTQgox7g1Av1xt9B7/s4KWMd7sh44LVx8gZRQSsk/Nye
         hReJdqIYNknLHMvZwggZvecD3gcN0pgtSKBWc3d7W6e/rakeh9Qy6WJdnIc6VWMIAvgB
         34QEtRGIjNr2mnFJJF7u+zvgZjhIEw8Qjv4VuB6QGJZXRXbQz7qJqj9stskTLkEnqIxR
         vQt2EnQFTyJ0BFfzeBRhSHdm2+HBnppL3MNna16zn7NN/wxXCMLZqUKHF/QobNCsruT3
         LGhCim2jyR68bQHIMr2ft77vaez6R3BEGx+AcYlvYBDle6NxsQ9TAVAtvDAE96KZxDVz
         JMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=mXJ0HAirSXfoweWRLpyWwbE0Jz1CvrZ/f2w6Wer4lZU=;
        b=buNtRgfzrhECxs8dI511yMBSeZcbrVLZnJANpkBrQabuM/OaRs3ayfpLiJBVyTnT+o
         DdWWP6XX0lxp6yM2GUf+/jUmw+0VTM4N4Jtq/zDYkUKW5pA1z24itxlWYU4tVvDZxZhF
         LIhQvuE2UdoJk7brr0eCl0huMLxk0hvPLu4iTcM6ZLxnCvbSIPTyDNYvKGQ4SW/LVC6U
         TdQcuvxDMItzY5IMTRZB3B+u6K2bE3SB2qjrVTrA4aAKnrZfmH4AsiMsu7GIIZ+u5otK
         IxQVh8kTOw+HFPjY9K4PZZno7VHdpQg4TurmcmjwMhLGaUd0FC9/VBidEMJRld+/EIWF
         2OCQ==
X-Gm-Message-State: APjAAAVo3Ew887YFhSCoUN7CkOH+V5dFq9fqYfo0iagazg98PcQYyl1C
        919qlgMkAdzWkQfN48x8rINa1M+u/NY8Vg==
X-Google-Smtp-Source: APXvYqznpM9YlYSZ2mk0B7tfiZKgzY071+vHoTy0E4AuFgRPjTazvF4+7SRKqBlSU9LUVJ4P6DJHcQ==
X-Received: by 2002:a7b:c389:: with SMTP id s9mr5254566wmj.7.1577812605957;
        Tue, 31 Dec 2019 09:16:45 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id m7sm2992631wma.39.2019.12.31.09.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2019 09:16:45 -0800 (PST)
Message-ID: <5e0b827d.1c69fb81.44677.db09@mx.google.com>
Date:   Tue, 31 Dec 2019 09:16:45 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.5-rc4
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: fixes
Subject: linusw/fixes boot: 56 boots: 2 failed, 54 passed (v5.5-rc4)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes boot: 56 boots: 2 failed, 54 passed (v5.5-rc4)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/v5.5-rc4/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.5-rc4/

Tree: linusw
Branch: fixes
Git Describe: v5.5-rc4
Git Commit: fd6988496e79a6a4bdb514a4655d2920209eb85d
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 48 unique boards, 14 SoC families, 3 builds out of 5

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          rk3288-rock2-square:
              lab-collabora: new failure (last pass: gpio-v5.5-1-2-gd196292=
990fc)

arm64:

    defconfig:
        gcc-8:
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: v5.5-rc1-10-g279b1fed09=
ea)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxm-q200: 1 failed lab

arm:
    multi_v7_defconfig:
        gcc-8:
            rk3288-rock2-square: 1 failed lab

---
For more info write to <info@kernelci.org>
