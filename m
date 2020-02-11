Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BAF5158E87
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2020 13:31:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728352AbgBKMbg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Feb 2020 07:31:36 -0500
Received: from mail-wr1-f43.google.com ([209.85.221.43]:36160 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728341AbgBKMbg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Feb 2020 07:31:36 -0500
Received: by mail-wr1-f43.google.com with SMTP id z3so12177187wru.3
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2020 04:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=BGh75gij0YSq317IMTvibKY/hgc3EhP/91wNaQpFPys=;
        b=JLbXsq8L/fVJ+TJfLIce8mektqJOfQxruc4wod4079L/x/W3VUqXszIEuadxQuN587
         JXbd0jgdB3W8tuS9u3RUHc33XRBD22kegQ7fJvu+wEjMSMtC5Da9z/1IiOobqHNDZ+Dd
         ixY9ivivM3nf28qy1eorIPxkfRRFw8SrCUP/ePXKYrFO4/XWgMY/Q01yW8S5otmFQ8zO
         Dg08pneVQXvjnIQN5iIEAOo4h8UH+ldq1duL537adsA86sFYYE/NLMTRvLVRNlM9SNwz
         psAGEMtH+9yqIz7YpHcJpLssnvTQM4vwkX3A9m3ULUlwOZ4f/Y32LQi0JEMR0wAvB76a
         e/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=BGh75gij0YSq317IMTvibKY/hgc3EhP/91wNaQpFPys=;
        b=BbpxxDN5URK7n5btCFtcv0dxc6rSsu9zfPb3KkAKFuMIByrL0bEQJEYfLVnzU87L0u
         x9+rH6aII8DOTS0K/mHzY18eeu6a3ioFEXF+ZduvR8R5nGIxd43eg+QTx6lg80GWVPfh
         PlF23+FFCgyXUNirsfLrsDbj+t50kHDis2Cpc/t8ctPsb7tsSYVVumJIzH8iG9gkJekJ
         vJaGsUi7uq6YIKCJa2FmNRfavAUwYw/CP7kw1FSW7xDyxFlb+Qm64sSp0slUoDeWY78G
         M5ookALXSbGQIH4PVqN2C8Ss1dxJDqhRYjQq5h2WvHlkM0CcqPfDa6UkZ75fCbO3U+ll
         dP2w==
X-Gm-Message-State: APjAAAVRXIHIVWRKfrl0xfhV3b7ocrO8vcU0e21UB81xO1Xcf3FBETw9
        b8f9LTRya9Sg9MSvusWeo24RHB4gMdoM6g==
X-Google-Smtp-Source: APXvYqzSjn/7Plkj61prIBx/ZTUSmOD9j8RF6Po9McWiy7aKGU0mzne1zJoWCzXWhe5jAkjAUoOwJg==
X-Received: by 2002:a5d:62d0:: with SMTP id o16mr8344691wrv.197.1581424294168;
        Tue, 11 Feb 2020 04:31:34 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id y6sm4953758wrl.17.2020.02.11.04.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 04:31:33 -0800 (PST)
Message-ID: <5e429ea5.1c69fb81.cfa14.823f@mx.google.com>
Date:   Tue, 11 Feb 2020 04:31:33 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.6-rc1-12-g612e35e76ec8
Subject: linusw/for-next boot: 53 boots: 2 failed,
 51 passed (v5.6-rc1-12-g612e35e76ec8)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 53 boots: 2 failed, 51 passed (v5.6-rc1-12-g612e35e76=
ec8)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.6-rc1-12-g612e35e76ec8/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.6-rc1-12-g612e35e76ec8/

Tree: linusw
Branch: for-next
Git Describe: v5.6-rc1-12-g612e35e76ec8
Git Commit: 612e35e76ec85927bbafb00d594c58ea37e3e120
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 50 unique boards, 15 SoC families, 3 builds out of 5

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: new failure (last pass: gpio-v5.5-4-45-gd18fdd=
ff061d)

arm64:

    defconfig:
        gcc-8:
          bcm2837-rpi-3-b:
              lab-baylibre: new failure (last pass: gpio-v5.5-4-52-g0282c72=
d30d3)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            bcm2837-rpi-3-b: 1 failed lab

---
For more info write to <info@kernelci.org>
