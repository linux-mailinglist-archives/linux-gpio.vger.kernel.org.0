Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9E5F196318
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2020 03:27:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgC1C1c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 22:27:32 -0400
Received: from mail-pl1-f176.google.com ([209.85.214.176]:45121 "EHLO
        mail-pl1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbgC1C1c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 22:27:32 -0400
Received: by mail-pl1-f176.google.com with SMTP id b9so4176264pls.12
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2020 19:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=jkIJ8J/5BiY3chXR8E3vs7TVs7QHtI1PnBcKTWPLMSw=;
        b=a6XC0Btm1oXiDUYpgBolHIH3SRTTu86Pv4gUE07QMfcfFb2XmvQPCcET/GtpXgTHsp
         zKkzFgRL+UR3KpGLGm+QyoFrVi9zgUBkPOtoNei2QM9TdPKI78WqNEN+unxS44Poptwx
         oPV3SdirFRBn5SfPvbX3QPfm4YDf4o0PSTephS0d7r4GptN3SZeM5MkAog6zaTfcv6+4
         pIi6b3qoJNGW12tmHm5hEu3F8VEjwvzfTxC+KzK8NjoY5eD6drJ/TyYnGfExHP0s9KMU
         IJqcmkz17UK4fYB6O2G9KJi/WzIoj0ZFDLU/3Ib2acW1KtcWcrLyH/ZiE4ol+pGCVyD3
         F+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=jkIJ8J/5BiY3chXR8E3vs7TVs7QHtI1PnBcKTWPLMSw=;
        b=AszacfnZrY6eDlO7g7ebYMsCGKnKzZ0z2TBNk3LMTh4dssuRLHG5DQYFRIr7i2jGGl
         h3dObIimshpMNno7HvPVryq9zZPOn+Q3ZxUs9SZiCf4YHvoV8iuWdvW6kNzFDgvy2+SA
         Regvs53MxeKN8IzZjDdMPWTtNIMyzHljQtMOzqqf8Ly+nX3yZQS/4zVGbf80nWtGK+cz
         RIMfir/RaHTpfi9bV3GRRmEAARq620j13J+ggv4Rw51txOFU3lb60e081srd9wVO+Vwb
         n2kVxRmbD3WQhqE7RZumFTmVTB4SPjLpkvI+23GB4Ni5icjHXH7aUl2lUpas0K3+Hm6I
         7zFA==
X-Gm-Message-State: ANhLgQ1rBTEK4k4QhIabQR1QR3WjvbQR9uz/y07p3F0/CBHO5QBPd+Uk
        Y2gltJowwHjEshCyxo27Q/cIfH0Jxag=
X-Google-Smtp-Source: ADFU+vvZHOdq1mLjQG8bl8b6o+U3KbTTpDMb8ak3SFBge52CccoJXRSx7Yqu8xQEHzmX2SW2l/+eIg==
X-Received: by 2002:a17:90b:909:: with SMTP id bo9mr2655139pjb.125.1585362451057;
        Fri, 27 Mar 2020 19:27:31 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o14sm5070991pfh.147.2020.03.27.19.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 19:27:30 -0700 (PDT)
Message-ID: <5e7eb612.1c69fb81.d0a2e.56f5@mx.google.com>
Date:   Fri, 27 Mar 2020 19:27:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc7-57-g5f4bf171ca03
X-Kernelci-Report-Type: build
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
Subject: linusw/devel build: 6 builds: 0 failed,
 6 passed (v5.6-rc7-57-g5f4bf171ca03)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed (v5.6-rc7-57-g5f4bf171ca03)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.6-rc7-57-g5f4bf171ca03/

Tree: linusw
Branch: devel
Git Describe: v5.6-rc7-57-g5f4bf171ca03
Git Commit: 5f4bf171ca03b79f0ed7a17216fd854e50955617
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 6 unique architectures

---
For more info write to <info@kernelci.org>
