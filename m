Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6C9C95C70
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2019 12:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729341AbfHTKmm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Aug 2019 06:42:42 -0400
Received: from mail-wr1-f48.google.com ([209.85.221.48]:34898 "EHLO
        mail-wr1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728842AbfHTKml (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Aug 2019 06:42:41 -0400
Received: by mail-wr1-f48.google.com with SMTP id k2so11865521wrq.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2019 03:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2aaIBIHuShDvZGmGxTfX4xJeBdorg7dkRDXcI50+EPM=;
        b=FC95CdNnWa57fhjEqhEtlP7PRwiqs793398nIjPfydPkcOhSSw+iLKZTeYUgR1ilxj
         jewL45hYAjRLDM9VsN3jXHE/DdbrIB6vSzdcTMx7v+RIawpUDugpBAnDvapcF/BZBLUI
         sMVQBKbMIbHUAp9tUA/X/fb5Fg5kYYvBU3AtII3sXujOAgydl8Z9DZcYcThyxECjZdj8
         BP6/6Sj0fBXMHcB589Gude4ELK+MGOHQUNp01QN3svXLFqiX1ffptcpgulKcrNtBTp1d
         fwXz1ouCl9l847SEUqnRYlJxishaG5BqXVJYJ2V7Nsxba0xoYccuGGJtF8ppYpNC9y8S
         uK5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2aaIBIHuShDvZGmGxTfX4xJeBdorg7dkRDXcI50+EPM=;
        b=HhygajlLUx4uvwyAFoc3cMO9ln/3neOcwxURu5oBnwrzvYWXlO/Qy+Z1l2TiQA/E09
         aHOG9eCY00/jtjPiUrx5BQv3zPHjgXgdSoD4oXOFuO/OT6j1hgARJfUiDEYi6Ytpz9Vh
         lpxnr+z7wTDgPZ3haJv/CEG9o8+EfEMK3nGBJPX4/eeZMc6QC0KfdQeSvKHwCPEVOg6X
         Yx2oyAmFqBtfJu4xi9i6in1vXC5wcCSZieOHIMMd2/92IkMSe26/4z422O5wL3qYgoxD
         EihvnTiEucV5iR0kmOT7mlhaz4wyJ/YTg9HjO43ZgtLgeiy0fOW60djvSzELUnzhV7kI
         nIHA==
X-Gm-Message-State: APjAAAXHnYqk7WVQc9gIsdIAv9aIoIxA3n0eCUbeqDd6xTAEYUd1XGv9
        +ZvQOaxdGwtNwfhQKwxS5p2H3GHPRk9Ugg==
X-Google-Smtp-Source: APXvYqzjjvdUGOT0seeQmDmU6/my0INvuF+98DjO7Y6QygbrXIhlePm/c70M1OM8m7kI2telhMXhuw==
X-Received: by 2002:adf:df8e:: with SMTP id z14mr33421034wrl.163.1566297759853;
        Tue, 20 Aug 2019 03:42:39 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id a8sm13922388wma.31.2019.08.20.03.42.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 03:42:39 -0700 (PDT)
Message-ID: <5d5bce9f.1c69fb81.d5ed7.1057@mx.google.com>
Date:   Tue, 20 Aug 2019 03:42:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc1-35-ga7e42142926f
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: devel
Subject: linusw/devel boot: 51 boots: 1 failed,
 50 passed (v5.3-rc1-35-ga7e42142926f)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 51 boots: 1 failed, 50 passed (v5.3-rc1-35-ga7e42142926f)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.3-rc1-35-ga7e42142926f/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.3-rc1-35-ga7e42142926f/

Tree: linusw
Branch: devel
Git Describe: v5.3-rc1-35-ga7e42142926f
Git Commit: a7e42142926f815c776f745d027f69a53415d99c
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 35 unique boards, 15 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-mhart: failing since 21 days (last pass: v5.2-10808-g9637=
d517347e - first fail: v5.3-rc1-5-ga299726da44f)

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab

---
For more info write to <info@kernelci.org>
