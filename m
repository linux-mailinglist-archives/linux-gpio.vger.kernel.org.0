Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43A4C193BBE
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2020 10:24:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727636AbgCZJYp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Mar 2020 05:24:45 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:39395 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgCZJYp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Mar 2020 05:24:45 -0400
Received: by mail-pl1-f196.google.com with SMTP id m1so1907654pll.6
        for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2020 02:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=muf5kEr4d7tG0hh4dAOL1afrhW/KCiLLo9G5URp/W3M=;
        b=0RG0OFhyvHeCrztx1uZWrK/wsAUWEXn3zO/k+92SdmqLtMI88Avz0+R0O57wo5F7V7
         mkJ4/UuvcPtITitybRPIDBN+eTQWaqnFwAQSkfSVuMr43c5+6G+geIcjpsfIdk+Xg8KB
         uI6ArwGDq5MmcpYefgvUjeoyHmflsdpLczXl7IHs5NLoraa9pcj+G5jTur8/1dPaLI4L
         OO8iklO/Uo5JplueL8xA3ge9KVMPfnZ1FCVQC3Dp7b8ZrN+GS2PC0PEsnHBxZDGSvh2C
         Tl7Y+D5RfmuXMPyva+xZlzzjPc7Tkx+oK/+txP1LF8suhl+oDG5yozTDq/TABcV7KFhy
         YvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=muf5kEr4d7tG0hh4dAOL1afrhW/KCiLLo9G5URp/W3M=;
        b=MmMlAybLhOxGGiIKhDxtmgdzZ8lpL5PIJhBYjomiyZ2bTQmJxy1Cjft4y0H6KrkghY
         Fuy1gtJc2axd3nec8CWzzApN2eQX0RtzVaWXtjocRSuHiiPF+N9tYSt78dXYz0dTMa2b
         0VKfQHrHojIcM/8sD1Jn42ffi0zQVFU/XDjg4wpqQGmaug+OoeknBH6r4+WbNR5tkl4j
         9kZlxXk70Mimr3WpJZ7+1NuIvCFbNuRjYtNCAlDWeECfY4WZLQ2P0+SXcVB5IdPsk5BU
         oG4RzmKj2tRSRvlLqPjoVI2ycOIsKi22tUGVriteiK4Rb5PruIXUvOgtk9oKg/PLenab
         vwwQ==
X-Gm-Message-State: ANhLgQ0+n8QXmfI5UZAgD4i0eXKhitPK1qei7zBTJ9OETrFGEXJ5PI9W
        OKjwgswyY3TdxZnIfssjQqotp9J9UF8=
X-Google-Smtp-Source: ADFU+vs3Jels9PJZsywYpl8FQSRu2XZptz7WXzy/8cgDUiz/kaRAG8zeHSxaagxOnteNkG/q5qFirA==
X-Received: by 2002:a17:90b:3645:: with SMTP id nh5mr2157742pjb.104.1585214683475;
        Thu, 26 Mar 2020 02:24:43 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m14sm1207682pje.19.2020.03.26.02.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 02:24:42 -0700 (PDT)
Message-ID: <5e7c74da.1c69fb81.fabc5.4fd4@mx.google.com>
Date:   Thu, 26 Mar 2020 02:24:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc1-47-g5eefcaed501d
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
Subject: linusw/devel boot: 57 boots: 3 failed,
 54 passed (v5.6-rc1-47-g5eefcaed501d)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 57 boots: 3 failed, 54 passed (v5.6-rc1-47-g5eefcaed501d)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.6-rc1-47-g5eefcaed501d/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.6-rc1-47-g5eefcaed501d/

Tree: linusw
Branch: devel
Git Describe: v5.6-rc1-47-g5eefcaed501d
Git Commit: 5eefcaed501dd9e3933dbff58720244bd75ed90f
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 50 unique boards, 15 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 41 days (last pass: gpio-v5.5-4-=
45-gd18fddff061d - first fail: v5.6-rc1-12-gb2929a9cb2fb)

arm64:

    defconfig:
        gcc-8:
          bcm2837-rpi-3-b:
              lab-baylibre: failing since 1 day (last pass: v5.6-rc1-31-g34=
7ae6e29145 - first fail: v5.6-rc1-32-ga28e1c0505a0)
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: v5.6-rc1-32-ga28e1c0505=
a0)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            bcm2837-rpi-3-b: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab

---
For more info write to <info@kernelci.org>
