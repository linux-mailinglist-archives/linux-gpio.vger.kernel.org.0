Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94D5B199F02
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2020 21:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730095AbgCaT20 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Mar 2020 15:28:26 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:36086 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730149AbgCaT20 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Mar 2020 15:28:26 -0400
Received: by mail-pj1-f65.google.com with SMTP id nu11so1528879pjb.1
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2020 12:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=0oV1X/0mnsSlQlo6EDhAzNKZeYw/rGBghFZMk2IXk44=;
        b=VKQNO1ycsxcaXuqJ65gURlAlYPvY+2ghtOPdGWWiagrp7hG0Fmg604bL1i+wKvzKWV
         4deFCtaf4DKqJZebKPYRkFufA/CwkJS1O73qTM8I7SQQOfzDupkwcp7MXIs2r5IGkiwJ
         GfcLKtP5gM3Qxxh6pSHGFfQh+F5O1ajFePmWxvQHI+Iu4UEEJ9qtThbD/2j6/56efpYt
         YGksNsyM++FKtv+gAx7Rh7vmIq5KDvkUNvPCGbD6OcMktIZCagSbYoEv3wgfgZnT0k18
         mhHQBpptbAhnj8sX7J9oD6tNKnTUAmIG1h4La7A3R+sf6mWiDJeWBhNQp1+3IJvgsDaY
         uEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=0oV1X/0mnsSlQlo6EDhAzNKZeYw/rGBghFZMk2IXk44=;
        b=eUlucG4/Qhlo+7rNjpLRVVrijFlA++APb1RPVKSaLuNVPrbuDfG4j1qm5k2lQ7uUH+
         lOeP0vE2+wPgpR4DxsYCXXGntrKRM/fZd+io2398FpTZ3CiH90JKq3zjK0QPRCdN+FpV
         L0ET7w0erCNJiHYcxEZDvrDYERVIemz+t7aQyvgsVDOoRB/aTJ6GP7xQ4IqFBEBY1iVF
         F4itKcYazyiQhTz5n5pF33Ik9xCdKwkQ18Y/bRr8kyqalG2OaIfLdsIxpUtFqclisu8m
         wacpsLHS5zuMREQez8TzT2r8X5rt222ogOj5nJ1pj8EBpuV8gqK7NzuSAZwtQfekwWQo
         td5A==
X-Gm-Message-State: AGi0PuZ/iknanFkplXWb1Ug5kiTlrXf8TVyc2etnZtGIwyGISRycZ/vQ
        rLqUC74p98ewR8RopmN78aBKqO3yyBw=
X-Google-Smtp-Source: APiQypKTZHD8qpzC/zU5DkiD2qjUsGlM8YN1mJB4s7HabcT0ADUqQnkMHT+gpkoIjN7Q8VBp+CM/ww==
X-Received: by 2002:a17:90a:cb14:: with SMTP id z20mr484180pjt.170.1585682904816;
        Tue, 31 Mar 2020 12:28:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y19sm10532729pfe.9.2020.03.31.12.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 12:28:23 -0700 (PDT)
Message-ID: <5e8399d7.1c69fb81.5d885.e847@mx.google.com>
Date:   Tue, 31 Mar 2020 12:28:23 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc7-58-g89ad556b7f96
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next boot: 55 boots: 1 failed,
 53 passed with 1 untried/unknown (v5.6-rc7-58-g89ad556b7f96)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 55 boots: 1 failed, 53 passed with 1 untried/unknown =
(v5.6-rc7-58-g89ad556b7f96)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.6-rc7-58-g89ad556b7f96/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.6-rc7-58-g89ad556b7f96/

Tree: linusw
Branch: for-next
Git Describe: v5.6-rc7-58-g89ad556b7f96
Git Commit: 89ad556b7f96af54ae6762f561f0a09269265741
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 52 unique boards, 14 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 47 days (last pass: gpio-v5.5-4-=
45-gd18fddff061d - first fail: v5.6-rc1-12-gb2929a9cb2fb)

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: v5.6-rc7-57-g5f4bf171ca=
03)

Boot Failure Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

---
For more info write to <info@kernelci.org>
