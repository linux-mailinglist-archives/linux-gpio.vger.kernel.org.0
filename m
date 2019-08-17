Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3259E90BC9
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Aug 2019 02:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbfHQAmx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Aug 2019 20:42:53 -0400
Received: from mail-wm1-f51.google.com ([209.85.128.51]:40004 "EHLO
        mail-wm1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfHQAmx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Aug 2019 20:42:53 -0400
Received: by mail-wm1-f51.google.com with SMTP id v19so5388803wmj.5
        for <linux-gpio@vger.kernel.org>; Fri, 16 Aug 2019 17:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=SB+7raPOWir05VhqLp5x33JSeEi1x0ci5SA5i4SPs1A=;
        b=y09Vzhi+S6KBsw0w8v/vDznL1Hmx6j8LgPjFgYQdLAYS/F9IRyaO/E2CGpU5CPsRmH
         S7fXrv6QWPJxSaV1d1y666S7etxuxZUfaN1qO3rVej1kd9EPprButJhTR7n6yD7Ovfev
         XM5zEjcV2ON3qPqC7WY9lfwTlOyi0pP7CppwCy98qImZRzFv0wH4/bueBSmBj5ZTq6Jt
         PlV5A85L6uFxaFBpnBDariPeZ0H+swBtHIk2QEWahND2DvfbqU0DULMJZxp/N/EvLqjX
         fdvVDt9JAPInvCU25Fr5HJTJiYBPRbljtGTn4gl+bYexW1XlI4dpZg2eZsw/diYhPDq1
         574A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=SB+7raPOWir05VhqLp5x33JSeEi1x0ci5SA5i4SPs1A=;
        b=FVbugy8A836OOjmJ2pfMKucoOHAf7LRx0eKgoo8+sas3RhqJRTseCZu5paUnAhdUdK
         8yk4KtiVwP7OYnICmzV5T2DpyQwedOnRYWGMn3A3b8DfeGSTFG7f2Ew88/H/9KLJclg6
         Nn9+39orH3TWqBi/3/fcVPWGKZyW6Pf0Hhwnuap0LS6WFJVkRIHxCIF6AgWYu6ppx4r8
         7R9pfQwfwcCg+VBf9fS54dC57EqVWSXuY0uD4OkIXDkA00H1Ghs94C5JGJMv7/Z78NyZ
         rgfgB1NCxFsKTUBv9Kde0WJaO/ZCVwpXSY5x8pKzpykodSnHs3T2Mo78C4sh5J//VDr2
         gdMg==
X-Gm-Message-State: APjAAAUWpfQtBAyONv03OBl9+t2uTBtdw+xx7Jzuv9CK4YmhaNqVG73/
        QfzinQ4g8MPkVi0gW9PonZ0JGn22l+w=
X-Google-Smtp-Source: APXvYqw4mHYEcCep8hXc/DtYq0gnPHg4SVuOkpgZSQS/bfxbx+Vh+bxPaiMlhO7AEgrTLZabyYjPlg==
X-Received: by 2002:a1c:b6d4:: with SMTP id g203mr9231165wmf.100.1566002571179;
        Fri, 16 Aug 2019 17:42:51 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id r23sm4776349wmc.38.2019.08.16.17.42.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Aug 2019 17:42:50 -0700 (PDT)
Message-ID: <5d574d8a.1c69fb81.f1705.71be@mx.google.com>
Date:   Fri, 16 Aug 2019 17:42:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc4-3-gdf451f83e1fc
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: fixes
Subject: linusw/fixes boot: 54 boots: 2 failed,
 52 passed (v5.3-rc4-3-gdf451f83e1fc)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes boot: 54 boots: 2 failed, 52 passed (v5.3-rc4-3-gdf451f83e1fc)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/v5.3-rc4-3-gdf451f83e1fc/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.3-rc4-3-gdf451f83e1fc/

Tree: linusw
Branch: fixes
Git Describe: v5.3-rc4-3-gdf451f83e1fc
Git Commit: df451f83e1fc0fa3764a2724b0faaaf9d07ab1b6
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 38 unique boards, 15 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          sun8i-h3-libretech-all-h3-cc:
              lab-baylibre: new failure (last pass: v5.3-rc4-2-g68e03b85474=
a)

arm64:

    defconfig:
        gcc-8:
          meson-gxbb-nanopi-k2:
              lab-baylibre: new failure (last pass: v5.3-rc4-2-g68e03b85474=
a)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxbb-nanopi-k2: 1 failed lab

arm:
    multi_v7_defconfig:
        gcc-8:
            sun8i-h3-libretech-all-h3-cc: 1 failed lab

---
For more info write to <info@kernelci.org>
