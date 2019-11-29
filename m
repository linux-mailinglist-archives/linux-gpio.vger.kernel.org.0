Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D718010D8AD
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2019 17:50:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbfK2QuN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Nov 2019 11:50:13 -0500
Received: from mail-wm1-f42.google.com ([209.85.128.42]:52470 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726909AbfK2QuM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2019 11:50:12 -0500
Received: by mail-wm1-f42.google.com with SMTP id l1so14855470wme.2
        for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2019 08:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=XVo5YHyLlzm1Skhh2TyjxmqUmLYCKNaKUsGSDVu0GJc=;
        b=RsYk7ut7wi7WNc4tmmrcKBshFgfd5vIYHa29zEWnbxQBJcBQf62xV0ae0pVxu+kymv
         dMKiJnUrGgE3IVlZ2f6Tbd2YMg90oGcmQwP8CU0CsKOFOZ8LIIx62jk65RUBM2n/DCnG
         AZ5OCpbkkPOIV1j5T5uIEtP0Eeej/nu+wj2MyKinbEmTm1D/YaxT6NFd7H2aevbw9eyY
         +FeSAo4apyzkL6rBT9Bf/MNhKqMSsMhrIr8+Pg4B97TmS/K6vpjvSg+AW+eAUK+zrhzA
         FGzh2hK1bIzLGFojImdyUVQQw2zsTIFn485A281WMl71R0uGbarT1VZGifR9tq8/AulC
         /yGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=XVo5YHyLlzm1Skhh2TyjxmqUmLYCKNaKUsGSDVu0GJc=;
        b=qtKsqiZkOOigEz/sDVOp7NDKrm2VhNO0nRGK/DJvF0j0bzFxbg4cVbLD4q6KsLZpGo
         qU2xiQSooXR397iGfkBrZ4hwMRlT12Vi9YvIJw2X12p3cHIgd+Ef2F1EteT2+hwroB4k
         VWfHIjOaaoVehTYF4JkaMz/fcVWnppdK/jo7EEo8FfJ8MBjrwRLvBAWjkFteirJew0b5
         naf/CVQugZzrdfLPr576js0WeWRYju6Hx6G+vBcf5UCcOfF5qZJOEilrGf+B8JeclVBP
         iX3gveItYunZk3hqyxUm3CWoY6EeqGyYYu89oOPJjPbtcc1Lk136VXWOh3T1n+qEdwN2
         viiQ==
X-Gm-Message-State: APjAAAW0EWC+cQvNux0MiFt2OIYF6RDjn7/GzhASMoIjaR66xeIWxO9g
        w9kHKR8NKaL77pp53xzfGLayuGJ7JCQQuA==
X-Google-Smtp-Source: APXvYqzgWe1UHmiN54mua1LZfZP7eyks6oY09//BhMmVvHns0PVL5mNnY7aRIK6wfZ4T6y3j2D7kaA==
X-Received: by 2002:a05:600c:1108:: with SMTP id b8mr28738wma.17.1575046210436;
        Fri, 29 Nov 2019 08:50:10 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id c15sm28645969wrx.78.2019.11.29.08.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 08:50:09 -0800 (PST)
Message-ID: <5de14c41.1c69fb81.963e6.5566@mx.google.com>
Date:   Fri, 29 Nov 2019 08:50:09 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: gpio-v5.5-1-2-gd196292990fc
X-Kernelci-Report-Type: boot
Subject: linusw/fixes boot: 60 boots: 0 failed,
 59 passed with 1 conflict (gpio-v5.5-1-2-gd196292990fc)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes boot: 60 boots: 0 failed, 59 passed with 1 conflict (gpio-v5.5=
-1-2-gd196292990fc)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/gpio-v5.5-1-2-gd196292990fc/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/g=
pio-v5.5-1-2-gd196292990fc/

Tree: linusw
Branch: fixes
Git Describe: gpio-v5.5-1-2-gd196292990fc
Git Commit: d196292990fce11fd7bb7585a782b3f4b34429e1
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 50 unique boards, 15 SoC families, 3 builds out of 6

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm64:
    defconfig:
        sun50i-h6-pine-h64:
            lab-collabora: PASS (gcc-8)
            lab-baylibre: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
