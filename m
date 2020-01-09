Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B4AE135267
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2020 06:07:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbgAIFHX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jan 2020 00:07:23 -0500
Received: from mail-wm1-f43.google.com ([209.85.128.43]:35172 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbgAIFHX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jan 2020 00:07:23 -0500
Received: by mail-wm1-f43.google.com with SMTP id p17so1348620wmb.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jan 2020 21:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+RQCZrDE5PSAVUWz4QBysICUPxFXf90WTyWIeaCcnIk=;
        b=MUioHwMkmOPt8ElSrEcg4Oi9tjaDifT/Xb8lsWxYIRstt6ET/Uq7D7RWevjwmRsNhh
         HF1hTdUoYx/mWHusnrQnXUVu6ZnJyw98F5H8JhRIXM2y+zObotsdL+3AutBhyjCmuter
         clhU+laO6BHIVMeXqpuyLevAI4Pvd4D+PfuAyuPYGyqIzOa+4lhRNyrfoIaHRK9eNt4U
         p0OJiMyzDVj01RVHX0yzqVfJZeHH072RNh1U23YQ/biVj46dp7ZqM2w4uYVtf/B/pWmk
         W37v0pQSrhZxULw4gXIKEpgOq/cMbl3F+DdYOJg1KMMPxBG21gE5at0bvgP6Z1VWJsmV
         m1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+RQCZrDE5PSAVUWz4QBysICUPxFXf90WTyWIeaCcnIk=;
        b=BDo6SBSPqhFS8ox6Z6iANb50mWmNnNSS9YAJvXTaVpbqzKWMJKSMnLPmSUZTRDTv4V
         5Qk/J6fiGKnLarQa3REwEl6PGRIrARp2rNKeYQ3uNuT0M8V5Jknf3rwu1wT/ycMod6OQ
         k3rj083Jp7SgmO2WEY8QHD3YoLI0zAJXwXCYCVNJjQBCjLk4BKq2K1zYsVas90M18Av2
         U7tw+XyT0aldBxi6QG4/CP7Y9QHQ68U0P0wir7NHHmVf/89vmr9Z/9qOyhRDK4G28YxA
         wdd7ikQCBMyD8FF4s2rO9BHEdudbhcenGwAGVWCuTPuw1xJ8NOY7dy0iU3/9hl5c9har
         Dzgw==
X-Gm-Message-State: APjAAAWcWKSuoI+k1eIvlOtICYq4hnkgpa/UZC4DvOAbSXUdMMiozu9i
        o5EGloq1zC8cOZT1DjS1X34UioIRz6AnpA==
X-Google-Smtp-Source: APXvYqw/0NqVuEHn2FnDN952XbqrYKJju74Dnlx7TWmnlOCaS6PYj+EUnoda1JgzaD4iJRUKSv5e+g==
X-Received: by 2002:a05:600c:108a:: with SMTP id e10mr2263309wmd.38.1578546441313;
        Wed, 08 Jan 2020 21:07:21 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id z6sm6665824wrw.36.2020.01.08.21.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 21:07:20 -0800 (PST)
Message-ID: <5e16b508.1c69fb81.eccca.0453@mx.google.com>
Date:   Wed, 08 Jan 2020 21:07:20 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.5-rc4-35-g0dc4997ef739
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: for-next
Subject: linusw/for-next boot: 51 boots: 0 failed,
 51 passed (v5.5-rc4-35-g0dc4997ef739)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 51 boots: 0 failed, 51 passed (v5.5-rc4-35-g0dc4997ef=
739)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.5-rc4-35-g0dc4997ef739/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.5-rc4-35-g0dc4997ef739/

Tree: linusw
Branch: for-next
Git Describe: v5.5-rc4-35-g0dc4997ef739
Git Commit: 0dc4997ef7396b1dc78ee36b5e4b6939c2ae0026
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 44 unique boards, 12 SoC families, 3 builds out of 5

---
For more info write to <info@kernelci.org>
