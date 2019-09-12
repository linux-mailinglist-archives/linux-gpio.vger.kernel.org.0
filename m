Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1051B1338
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 19:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727209AbfILRHl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Sep 2019 13:07:41 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]:40388 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbfILRHk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Sep 2019 13:07:40 -0400
Received: by mail-wr1-f52.google.com with SMTP id l3so6532404wru.7
        for <linux-gpio@vger.kernel.org>; Thu, 12 Sep 2019 10:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=pDjcr+O8ZiqDBT7lR2qAz53tpKmvf0V58tEjEjw0izY=;
        b=1UU6dM0Xn36KSMw0rtCLFhjgmRUlwj8YzNqF7ktXtL6xGpLqqxJmhUZxR4YDCeXcdf
         fwFCmSMnphw99pBGii90zw3F6TJM5im0VjBH0OymIu5wSXQM+KAZ9013RYRta3h9Ptz0
         WPPmOOggjWjTVLlj0hyQcALqcmbOZELgacvKbwohCidaFkV+HIfEQF7ybHFlwK1c77bu
         DTxeUKIbpGebD7IRbymnM7bMCw6i7eX9Tqj4bT6zwLg4kgFY8LA7rLhT1QrVphMU9TEN
         NIqJg3fV6iYa+A1y7nvECQ+mfYJXlLmWcQogAIiKDszYqlW6OeLIy8hgcMJbD8utJTue
         NKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=pDjcr+O8ZiqDBT7lR2qAz53tpKmvf0V58tEjEjw0izY=;
        b=lqLw/U8zER6uETQJ81vzk/0UBw7f3CSAdVIuqoefUHxlYDbs2uyOW8OqgU2d9beI5G
         zOxzhNStZnXWrGqS9LM2uzZCta+3O9b9rXO/HeLh70z3P+zrZgEw9TXc+gxQBf99c67G
         GRzNvksVkGEjB7qYscij1b3a2gbhCmKoMCB1zUJDTfRwoC3hrVuYfBKe92v6PKn8BUcR
         nBNjRwKTkQXAZ7GirzdYs4nX4ulw8jdGrciAspQ1CNxMVtLodXhvI7ubY18wNP6ME8/N
         IN3Wd5X0TbcFRTvgeMVwyLqfH7I40TTB4uzgwOB2YE0hkTd6x1u51ikr8ZcNjWaAUbhE
         3SPA==
X-Gm-Message-State: APjAAAUTy5R13enWtiavLe+dFNbPZ9H0Uiv0mRG0iE0B7xDBNhgkYS3h
        N7gOYSEW4TaXvaZiAqQGTXUeNU1Q7PwS4w==
X-Google-Smtp-Source: APXvYqxSR0ZowPfkAPzQ29c2UgnHSFyc5xvf66pZWOIXh3tPRSHe+nnMOJsUeQIoTSDAsSV7nMtQtw==
X-Received: by 2002:adf:e350:: with SMTP id n16mr2097653wrj.99.1568308058535;
        Thu, 12 Sep 2019 10:07:38 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id o19sm33053574wro.50.2019.09.12.10.07.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Sep 2019 10:07:37 -0700 (PDT)
Message-ID: <5d7a7b59.1c69fb81.a17ce.1a61@mx.google.com>
Date:   Thu, 12 Sep 2019 10:07:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: gpio-v5.3-6-86-g367677d49839
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: for-next
Subject: linusw/for-next boot: 48 boots: 1 failed,
 47 passed (gpio-v5.3-6-86-g367677d49839)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 48 boots: 1 failed, 47 passed (gpio-v5.3-6-86-g367677=
d49839)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/gpio-v5.3-6-86-g367677d49839/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/gpio-v5.3-6-86-g367677d49839/

Tree: linusw
Branch: for-next
Git Describe: gpio-v5.3-6-86-g367677d49839
Git Commit: 367677d498390067a7b2769862185787077da412
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 42 unique boards, 15 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: v5.3-rc8-90-ga6ef71d0ac=
87)

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

---
For more info write to <info@kernelci.org>
