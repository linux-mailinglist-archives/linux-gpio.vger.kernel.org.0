Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22B3895C83
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2019 12:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729712AbfHTKpx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Aug 2019 06:45:53 -0400
Received: from mail-wr1-f49.google.com ([209.85.221.49]:36982 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729710AbfHTKpx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Aug 2019 06:45:53 -0400
Received: by mail-wr1-f49.google.com with SMTP id z11so11869183wrt.4
        for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2019 03:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=KkIarKsCP4FFqAflKoKIg67IOpS0fPSFwH4PBOHKlps=;
        b=NTpdp5Jyf51E+nStTBajcij53m6xxEIoZO9OYxk3dg1oI2haqRUjaW6kexlFoTWPpe
         F4Q3rA70YDMtvV0LcZ1Wyf+7e8xfl5oE9bwbgScPEJiAavH2QI1wN2L5v6nBbfdH3uai
         SBBAM/3VKiHH0+MVzxR4p0rI6K//8aXvYRr+sZCn4kSke6Eq/FU04aodnZLS2szkUlDT
         JdLqWjFw2kKon2l/DrTVmHhKwsPHfW7t1c7VdNgN15HYp15m+Nfoev7IpjrYwZeEaKrD
         xZNJL9aMnrxdJ17dJRrtrYCwE9yY1busWiuEn+MfeE9N99GqfeJF5JJADcHoAhrz+Rv2
         bYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=KkIarKsCP4FFqAflKoKIg67IOpS0fPSFwH4PBOHKlps=;
        b=qxxV2u0/mtXXSoiKhETMoOlPf3XoBxiqcIKrB/4nDmlC37M2SevQTAKmS+hgPjebVP
         PVnUG5L/Bwxa6PC8P+n2KbbknadcRubzJ094dGNNGlMKHUTz5OZ+HlmwBzPwZ+XSa+wf
         IDDvfvz/Yk4LAlQb0p0fdWshfFy5Jy44TAfQB6FaigNJI9IwuNibtYae7smv1Hpql7Kk
         BYu0l/TtZW7WelOITieizlWHHPKIn8URt15kVGNh+N6MiiFQIh/RbD8rGEO/qIY4LJ7+
         jH2AqjA+rhtbW/bhsso33SyVkszXTw4pwr3Snxw17ZDmkIIO78xSu3ww0LoOBXnLBmI4
         07qA==
X-Gm-Message-State: APjAAAXpS/l92VWWjZic7J5b2qtp+yZOIMhLYnmcO4wksHPnKWMKDla2
        acCGaL9396rfKyrqmbvwog3zTGv7R41HiA==
X-Google-Smtp-Source: APXvYqxgkyG9GwRcaUrRsbJ+kUQ5nC/GJrcbjCB5JUHQ6AXBeldvlLYtWg6eNiYvnEO9IX4s/O3hAw==
X-Received: by 2002:adf:f54a:: with SMTP id j10mr26703222wrp.220.1566297951268;
        Tue, 20 Aug 2019 03:45:51 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id r23sm12992637wmc.38.2019.08.20.03.45.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 03:45:50 -0700 (PDT)
Message-ID: <5d5bcf5e.1c69fb81.f1705.c8dd@mx.google.com>
Date:   Tue, 20 Aug 2019 03:45:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc4-4-g607ff4deb08f
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: fixes
Subject: linusw/fixes boot: 50 boots: 1 failed,
 49 passed (v5.3-rc4-4-g607ff4deb08f)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes boot: 50 boots: 1 failed, 49 passed (v5.3-rc4-4-g607ff4deb08f)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/v5.3-rc4-4-g607ff4deb08f/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.3-rc4-4-g607ff4deb08f/

Tree: linusw
Branch: fixes
Git Describe: v5.3-rc4-4-g607ff4deb08f
Git Commit: 607ff4deb08f986753f0b40e2d7840b61e11a46d
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 35 unique boards, 15 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: v5.3-rc4-3-gdf451f83e1f=
c)

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

---
For more info write to <info@kernelci.org>
