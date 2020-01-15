Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F3A513CD00
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2020 20:22:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728921AbgAOTWX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jan 2020 14:22:23 -0500
Received: from mail-wm1-f54.google.com ([209.85.128.54]:33090 "EHLO
        mail-wm1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbgAOTWX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jan 2020 14:22:23 -0500
Received: by mail-wm1-f54.google.com with SMTP id d139so5477238wmd.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2020 11:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=5hy56lKKlJdCdHUtZ19zHyeLAXZEmC0mjr+2u36vatc=;
        b=KN1mac/FPYFtAzw65xu4/RyI5yix7aGFoviD7d1y+h6uwDJS5BTiYNDxFVxr0Ubqjw
         MchWCX09hoXhA09yB4QISz+LITFNCUKyxS4c3HLEU4NNxKgsJ50TJk7rK78YAfqm/lKf
         7Yhw5f4h6HSziYzK4VMZqRgHnQdBkPuCnISz7wvr/S0tzK6irYXPjHZADhQViUWamewV
         8FH2XRzAqQ7FbmgvXS/+uvt0cHJ35qVUPecSnI9/O72H55jSLVDcT7SBX/mHC8EY9tBM
         ZUqrBhhflkMXRIG1NmwaZyB7nLTqUWpl1m+ubRr0uSlpMoE0RZ1p/fXFvi2HIATGbyhs
         7fpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=5hy56lKKlJdCdHUtZ19zHyeLAXZEmC0mjr+2u36vatc=;
        b=ud5acRalm0oAEsKoi60TnrxTmNyy29R8bHiwRLfwzELaVLNBfWtp6I3ZRjmn5rVy3D
         lLj5tKz1tFCzJ3BZqrDt5OEGa5Je/lb7UIOHYeSS8iZMlKHDDVzlX46YPD0uDP/ukrpB
         iS5adctirMQYSR8Ysf0vSQ+i+uFh4DRAit8kuZEPCjYJ9vcgyRsmL0u/77RU9ibmHqXP
         lJ2a8FipPSVs0KzuklJlvHh2mZSniicnppZbS9z8vz8tlFtd1JjZZ8VOcDbn+6QSgZfY
         B1Yneme6wcseXjEx8VPUnbXtbPwAQh6mfSs566cCkOQoZYca4aRIefHi5+6kWA2idbzq
         IV0Q==
X-Gm-Message-State: APjAAAXk5bLyfcwJb7q2aaSBhSlX9GrNL+OYlOEk+6mwGEiESVXpJEh8
        xV60AZIz4A17U43o+yhLg33hefAr07I17g==
X-Google-Smtp-Source: APXvYqxZHRoiYTRo7Zf5zVlZP/5v+Doix84qZ2Np4xUTA2jiNqXw1PTRIMhtcn/5PUm2QNZpDJJ7yw==
X-Received: by 2002:a1c:1fc5:: with SMTP id f188mr1646593wmf.55.1579116141580;
        Wed, 15 Jan 2020 11:22:21 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id i8sm26727869wro.47.2020.01.15.11.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 11:22:21 -0800 (PST)
Message-ID: <5e1f666d.1c69fb81.ab168.0a74@mx.google.com>
Date:   Wed, 15 Jan 2020 11:22:21 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.5-rc6-43-g18c24c678282
Subject: linusw/for-next boot: 57 boots: 1 failed,
 56 passed (v5.5-rc6-43-g18c24c678282)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 57 boots: 1 failed, 56 passed (v5.5-rc6-43-g18c24c678=
282)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.5-rc6-43-g18c24c678282/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.5-rc6-43-g18c24c678282/

Tree: linusw
Branch: for-next
Git Describe: v5.5-rc6-43-g18c24c678282
Git Commit: 18c24c678282428a60ff4ebfec5a6b81c43de2f8
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 49 unique boards, 13 SoC families, 3 builds out of 5

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          r8a7795-salvator-x:
              lab-baylibre: new failure (last pass: gpio-v5.5-3-31-g4e4ade1=
56406)

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            r8a7795-salvator-x: 1 failed lab

---
For more info write to <info@kernelci.org>
