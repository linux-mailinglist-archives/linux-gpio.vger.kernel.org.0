Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A79481AF983
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2020 13:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725959AbgDSLCo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 19 Apr 2020 07:02:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725845AbgDSLCo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 19 Apr 2020 07:02:44 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47440C061A0C
        for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2020 04:02:44 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id t40so3151066pjb.3
        for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2020 04:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6/hGeEBsll1AWoAN3S22qegDLqpkRnDfv/OrTuwHX9w=;
        b=W3kpTeLqbDuyBCOYk9XGGJlT7+9CLoM8vQUGuvOI48U++Z5M5ArpLEFaixQ1SbF0fN
         cgYwZgU5pKZd9pFoCUeBK/04YTceQumOSu4YAWdj86HtaRybVndHtxIKXXWlZgOZ5Sql
         kIKIqRUpwFA4ZisdiuAlfSikTM80ukR6EPLfEOrGrlTHYRLdDWV7N1HnfD3nDiHmkNde
         9FlE3JrgVswRE/YyZEPZbBc9UNM0F0Ll5qRcY8O0SoTdxFrawqc20ny7J+pZ+NYF/tbm
         sdHcpcJ4NeLHHX5dKX+t1CsbcFEZnkTDYol75qwSjKZPwoHrsdWMe5QPhCkosppoiTq3
         +2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6/hGeEBsll1AWoAN3S22qegDLqpkRnDfv/OrTuwHX9w=;
        b=rAxiz2hqsvlr7nsjo0OyCqm8T6l+Pd1/8aCzjutC/qJgCxx+02RIgyT4jEKSC6fWra
         76Zszt9Xx9YN7DOkZLktav/P0dtdkqapkHfG4nS8JU9cXfdUTCdR+JUwLWeGlbZ4nHKi
         zH8gyiQxj298gyqBTvW59EUaJWtyZtQtt0W7PXbDbLo2iuNhKq/Gu/5zTaYUS95W/TY1
         Aj8A+AzEeGGeWNHOHB75ggbAhP29ii/thr9JgZ15pL/lc5Kb2edt7OueQTeTz1rHtws7
         mJo2Su9+L4MAY6I2FTxXz1zU4in/OUUM6uQYaJwJwE8PdOJ4mdw1EapP+ZWIatgXYWHA
         bUXQ==
X-Gm-Message-State: AGi0PuZzVnxo9+ANfHh/UX9yYyeN3fxmDwLwcEtqC35rP0jS1oJZlP4T
        IgLwSdep3oTNnsLu0R4tV0gRyPTSfUU=
X-Google-Smtp-Source: APiQypISLEHksSqHLPIvlHiRcDy0usjavYJBZiIAiWjOYltzo72awaRZI/pM39JAspjNwVLkF08bvw==
X-Received: by 2002:a17:90a:2fc8:: with SMTP id n8mr14508272pjm.159.1587294163294;
        Sun, 19 Apr 2020 04:02:43 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o187sm24195280pfb.12.2020.04.19.04.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 04:02:42 -0700 (PDT)
Message-ID: <5e9c2fd2.1c69fb81.11a27.5b6d@mx.google.com>
Date:   Sun, 19 Apr 2020 04:02:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.7-rc1-20-g9f676e5313c1
Subject: linusw/for-next boot: 44 boots: 1 failed,
 43 passed (v5.7-rc1-20-g9f676e5313c1)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 44 boots: 1 failed, 43 passed (v5.7-rc1-20-g9f676e531=
3c1)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.7-rc1-20-g9f676e5313c1/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.7-rc1-20-g9f676e5313c1/

Tree: linusw
Branch: for-next
Git Describe: v5.7-rc1-20-g9f676e5313c1
Git Commit: 9f676e5313c1fb7070997bd652a4ed68c6fb9a8c
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 42 unique boards, 11 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 67 days (last pass: gpio-v5.5-4-=
45-gd18fddff061d - first fail: v5.6-rc1-12-g612e35e76ec8)

arm64:

    defconfig:
        gcc-8:
          meson-sm1-khadas-vim3l:
              lab-baylibre: new failure (last pass: v5.7-rc1-23-gbbcb9d87df=
a9)

Boot Failure Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

---
For more info write to <info@kernelci.org>
