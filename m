Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94A2715CA4A
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2020 19:24:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727754AbgBMSYf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Feb 2020 13:24:35 -0500
Received: from mail-wm1-f53.google.com ([209.85.128.53]:34359 "EHLO
        mail-wm1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727433AbgBMSYf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Feb 2020 13:24:35 -0500
Received: by mail-wm1-f53.google.com with SMTP id s144so318223wme.1
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2020 10:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=3UDPtQO8Uvj0bWy1hD58t5k6YMD337R0MAMudNLNJ2w=;
        b=E/qNuzyT27nHJuYOdDz6jna3c1KtE4tJleIEWkQ1sJF8cz1rc+5S2J8iNOGRLpAT79
         sVYjh1OsD8wYQq75luVpY3v926f/7C2pV0k3KMxfB8iBlk8JUlZHgC+2LZ4zjAQBqdnI
         FhS2gO6h519P9NXcZ+WxxpOylplvxn3RkOCwQ8UFpyL2eS/2yn+t22gnHhPnGhjLWJ7h
         nflNh3L8jrGZ4N7ShMrG0Xqkrji4gdIadsgI0/0P3UkxOi/lsFcfXm/OmzNCQ9isPJ5w
         UVf6533TOghNQQq3uL5iHBpNpv7kUEPnRhZwtYWsO/OTpweuwEumz9DnmyDuHflk4tws
         HUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=3UDPtQO8Uvj0bWy1hD58t5k6YMD337R0MAMudNLNJ2w=;
        b=rxz9RXnc0X1kXV6IkIelCGOf0IyzMy+o/NidU8v7Ml4/8o1Ng3cVO5ofX+sEv3M3Nr
         h+LWobrxT9euf2nc/hR0gIGYfRKyZU/70htVY0svY6zdTmuJwIX5ZO9+tQnzhmxt1LFU
         OkeAeBtrnGyIqIe9oF8LX6pdcKRg0MzqVgTuKRmNAHDFUKz7M8Wbwa3OOEsCUEyMO5sb
         H4SGQZ1z/hg3Q+M6jfmKydI+oDz5QMsFXaBTfU3BT6g0aF57hKIxBXxtDfvZMeZ1F/a5
         yysPMpxw6dwEWfjozHwb/lH0QflXkgxFlWdgT+br8/GAkLUZ9Qy8jbW8SY9q+ehA9PtT
         AUyQ==
X-Gm-Message-State: APjAAAWHzUWYH/52aMS85W1w4/Zb1dGzIu26RAn/TlxwElpFg1CYVfur
        HkDtekrdATwS5puS/cg0S/9V6Fsmy45iDQ==
X-Google-Smtp-Source: APXvYqwNB4JsyC8TvjNPwsgNccsfD1Cfi7ucZsZqO7r9X/8QTgUhalIMAHHCRF/YHzTN3E9KFWvgIg==
X-Received: by 2002:a1c:490b:: with SMTP id w11mr6708176wma.96.1581618273024;
        Thu, 13 Feb 2020 10:24:33 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id w11sm3906122wrt.35.2020.02.13.10.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 10:24:32 -0800 (PST)
Message-ID: <5e459460.1c69fb81.13b58.1677@mx.google.com>
Date:   Thu, 13 Feb 2020 10:24:32 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: gpio-v5.6-2-13-g53803ecac78b
Subject: linusw/for-next boot: 54 boots: 2 failed,
 52 passed (gpio-v5.6-2-13-g53803ecac78b)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 54 boots: 2 failed, 52 passed (gpio-v5.6-2-13-g53803e=
cac78b)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/gpio-v5.6-2-13-g53803ecac78b/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/gpio-v5.6-2-13-g53803ecac78b/

Tree: linusw
Branch: for-next
Git Describe: gpio-v5.6-2-13-g53803ecac78b
Git Commit: 53803ecac78bbabfdd65f5cb789e46660fa63900
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 51 unique boards, 14 SoC families, 3 builds out of 5

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 2 days (last pass: gpio-v5.5-4-4=
5-gd18fddff061d - first fail: v5.6-rc1-12-g612e35e76ec8)

arm64:

    defconfig:
        gcc-8:
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: v5.6-rc1-12-g612e35e76e=
c8)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            sun50i-a64-pine64-plus: 1 failed lab

---
For more info write to <info@kernelci.org>
