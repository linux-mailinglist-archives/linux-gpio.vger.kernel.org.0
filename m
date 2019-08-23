Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A58BF9B71F
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2019 21:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436734AbfHWTfd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Aug 2019 15:35:33 -0400
Received: from mail-wm1-f53.google.com ([209.85.128.53]:55051 "EHLO
        mail-wm1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436725AbfHWTfc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Aug 2019 15:35:32 -0400
Received: by mail-wm1-f53.google.com with SMTP id p74so9853221wme.4
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2019 12:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=C89a2ZEfnx02gZo8AWc3JcKjxGcWA1IMR9fzh6KnN2c=;
        b=Az0chlx4eLmxvsUZbLzL1rPtbh1u5GuigipLbgd/zdVOySD5g8n3E7gmj8i861//FM
         QpRfUK0vS0k86xpECAd3t75ejJ5Fak84BAaeAqxXaipYvz/aGW9vfceSKP7rBDAbFfw/
         1eg3whP9J04mwsVSjsnSlGIpN9SMk9ySRtKNADSuhKLeztgPycGwQTSTMGhZ9xZ6+qbZ
         0oGONjzpqnPIslpHF8cz1vfJVin0pZkp2NKN9VhD/4j9tWcxsov/2Y9vbcPPqXD7GYKj
         acXzZ/y8Au/5S9GmJdeIQGaDI9fp8V90iDAuz5b6LNPEQYXm1pTA+eqXIxQmqQY2Hx6J
         liHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=C89a2ZEfnx02gZo8AWc3JcKjxGcWA1IMR9fzh6KnN2c=;
        b=SjrWB5WF3MggwwKZUcGvf0O5rHldZod4zC6DpsOioLekS7gc+JJtxrzzJzuMn/fNVZ
         JBOYwx/me712smzpQrnzOV1HO4HRQdTu/FWa0rrqW+FNmCl32LwsG1Wy0aLnNj2qQQSM
         o4Penw+eLVjlH4YaxKLSHUJ+sBHCShWIS0JZSpOKsbYUlB/VhAvbQlXL6EitKXiIrdfT
         B6gZIhqn40+XeZtQzImxdVHjC3XqH3+dRav08pbMslbV2kimfHNiy2c7zDHECTNDkt0u
         hDGMuJ4bNXdeNue3Rfz7QIGCY2Svf7444stbmlo7pQaAPYJkx+4g266fFf8nZ81VW1rJ
         blfA==
X-Gm-Message-State: APjAAAWi9ag6JsIuBa3Hf3A7W6UfttJySh94Ne/NZof59ZTZyfqFYxk7
        mF1WVpqDniWxCJW4QS6rbv4Ylt9f17VweA==
X-Google-Smtp-Source: APXvYqzHjyAMcmx0KJ/JAAep2niozMEDfNq6Teblsg6zJIJQpSbxEh7HQRpYlaIRrIobmAxbrncC+w==
X-Received: by 2002:a7b:cc86:: with SMTP id p6mr7121878wma.106.1566588930530;
        Fri, 23 Aug 2019 12:35:30 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id e9sm2696885wrt.69.2019.08.23.12.35.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Aug 2019 12:35:30 -0700 (PDT)
Message-ID: <5d604002.1c69fb81.c7f4e.b4d6@mx.google.com>
Date:   Fri, 23 Aug 2019 12:35:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc4-4-g48057ed1840f
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: fixes
Subject: linusw/fixes boot: 55 boots: 1 failed,
 53 passed with 1 untried/unknown (v5.3-rc4-4-g48057ed1840f)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes boot: 55 boots: 1 failed, 53 passed with 1 untried/unknown (v5=
.3-rc4-4-g48057ed1840f)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/v5.3-rc4-4-g48057ed1840f/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.3-rc4-4-g48057ed1840f/

Tree: linusw
Branch: fixes
Git Describe: v5.3-rc4-4-g48057ed1840f
Git Commit: 48057ed1840fde9239b1e000bea1a0a1f07c5e99
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 37 unique boards, 15 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: v5.3-rc4-4-g607ff4deb08=
f)

Boot Failure Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            sun7i-a20-cubieboard2: 1 failed lab

---
For more info write to <info@kernelci.org>
