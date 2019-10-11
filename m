Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88D2BD37A8
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2019 05:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfJKDAH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Oct 2019 23:00:07 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52482 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbfJKDAG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Oct 2019 23:00:06 -0400
Received: by mail-wm1-f68.google.com with SMTP id r19so8825326wmh.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2019 20:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=q9DhWY7Jt8RYuXMh18nD3zC0iggchqDOgLZlBE7xmuM=;
        b=mIwVu7vDuZlICplHXZuZ+LWuv0cXpvv4Ta2TUNF9dri7/iuVFEulzvz32I8hoqJct2
         yD8kfJRFFLOxEF6xvOqAVD0iOTBZmQ4i7bmYxedxs/oSHp1qStq+3wUX8QtyHBrR6g5X
         SscOTcHEI9a8es7c1334DtMCacupX7PTD5OxqMBmVH5wymFn97Q3EEXS0Fud2CPPb9Ad
         nsBXaWewpw+NzLo7bGQBbRRkxvkjYoUoru/CTVmFfjOhzj39BtX7yDfjlQeUwmz6noKN
         4wIPcS3Xw8fEaWif9N/LgJj2ztdDRxOliX00QbYagh9R0AuXqTQz+DY9skkiQsV0BEAy
         Z8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=q9DhWY7Jt8RYuXMh18nD3zC0iggchqDOgLZlBE7xmuM=;
        b=J3hOhLcJaEBafTtoxEqQcUh9NJ07vi/cjJec1MkO92ZzRfuDCtagur+tZbdWjZvqK9
         kHdoOf2ywDSd89ZwzCVVne6Uxw7Lw5ErBSWOyc/8ubI4nD7OZchqdTUTugDdYv7tT/40
         X83Ywq2mYQRt9NFo9B8VeP5WEpk6WJDamvbL+pl3PoYrMHxSfQ6nNtmVF/nXXDyDR/WQ
         osJlYxEriTmR19VAP8V9jb8PWCKnQ20sBGB5DtLoQolynRZikcF7oYJcieNyaI9M0NEw
         LPBMGOPyOH7/urX9E4xlXe1ByKZDvoJixDIsS1GSYpUtXMmO1vmmG13prdJIpDJffWnH
         fDbA==
X-Gm-Message-State: APjAAAXsTvZ/O50ZF1RJap3WLWvkC568P96l21tW3aue252xAIlG0mfI
        0N/FtiwjCqxsA4uO3nK6aIqTad/RVqkeKg==
X-Google-Smtp-Source: APXvYqyvUxnaKqOCbvUvUwz1SAPYC1r2mvz0CmXWAa2/qE+e49tCN2gzXx43PqNKosrK+g+/xqe/qw==
X-Received: by 2002:a1c:2e50:: with SMTP id u77mr1266472wmu.64.1570762804713;
        Thu, 10 Oct 2019 20:00:04 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id q19sm16385701wra.89.2019.10.10.20.00.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Oct 2019 20:00:03 -0700 (PDT)
Message-ID: <5d9ff033.1c69fb81.eb6a8.c1e0@mx.google.com>
Date:   Thu, 10 Oct 2019 20:00:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc1-11-g95873fba06ae
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel boot: 41 boots: 0 failed,
 41 passed (v5.4-rc1-11-g95873fba06ae)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 41 boots: 0 failed, 41 passed (v5.4-rc1-11-g95873fba06ae)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.4-rc1-11-g95873fba06ae/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.4-rc1-11-g95873fba06ae/

Tree: linusw
Branch: devel
Git Describe: v5.4-rc1-11-g95873fba06ae
Git Commit: 95873fba06ae39e4042647dec9c1138c0109ce7b
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 37 unique boards, 12 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
