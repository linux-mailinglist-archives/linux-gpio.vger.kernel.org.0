Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E73CA719B
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2019 19:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728864AbfICRXG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Sep 2019 13:23:06 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]:44939 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbfICRXG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Sep 2019 13:23:06 -0400
Received: by mail-wr1-f50.google.com with SMTP id 30so7397033wrk.11
        for <linux-gpio@vger.kernel.org>; Tue, 03 Sep 2019 10:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=o1A5g0Kld5mb0TaPVPhIDqPRMOQZ4r+ij0YxxefcqXQ=;
        b=LH4EcuuG+pZy9B1cFzlAtORGPtAXBydwvWGbAkHRjCCbe7WDs2VlHUFq0Xct1o+iD+
         eSWW+7oa9g15G3QFl9Ho3y7xDm8h5xGEGxCHYj6l/LIs6lW43XJ1GV6uqT4E+7xSJWom
         xCYdVQHZYErnDanrhRqGxwM5avQBzeVY54nkS+IyhBWKfPNoQVU7T0mDv6yKBa7BNlST
         eGVpsuoELsrNWTHpXJfZEaT4eqX6bKBGCc/6zNdMl2tBeUCLooF3RvkD9Vjv5ij9ImaK
         zfySFFJQVKYrFls0y222wPn1npTYZpWkYylwXMV2+bzUS8cRxIFqoIZAsVqsnGvwkE7A
         ylYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=o1A5g0Kld5mb0TaPVPhIDqPRMOQZ4r+ij0YxxefcqXQ=;
        b=qJ8MNgnopMsbBVdic0+GhbJWkkh4dGKtWqZuBiZXGZeYjwK124ZM/Xyai8mE4G9Ct0
         5nxjJtPyUMHbYeKLW/B566T+5D2QEFVHZeQfUK8fQ20N73OqBPph+FVbN6X/gTqzOJ8z
         l050QXn5M9xTGIIygQVsJQDYKmbtxnvNbT6MBaGFesIg/dkEZfIGd7remR0een4bFQEC
         QvA/K+Nm75NHFIg+fN4LyMSrrb1l8LeCfVFmCmGPlRcte5s/TZ0SN7NljvLQ5r89ULpm
         NAixmDcz43P0qcIir/AV7E73wOkLvRwBKb0gLA255QWuzpipx7Ie3d6mAhOrHqHMvYWC
         t5dQ==
X-Gm-Message-State: APjAAAVeUDholRGKR4LIABM7bS+Js8aB7Jrp0sg1C5YB7WqWYIsmlaHk
        zonU4plsLxwb71d1+EYEgrD2ZL+J/Ljt8w==
X-Google-Smtp-Source: APXvYqyp10fKyS7mogWuT7xfV1TcanxTZe6i+mxB2g0lkKKKTrwGVpq88YW6zM3ELNwXKPYvveQlKQ==
X-Received: by 2002:adf:fad0:: with SMTP id a16mr1504548wrs.195.1567531384524;
        Tue, 03 Sep 2019 10:23:04 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id t14sm19208075wrs.58.2019.09.03.10.23.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2019 10:23:03 -0700 (PDT)
Message-ID: <5d6ea177.1c69fb81.390b4.496d@mx.google.com>
Date:   Tue, 03 Sep 2019 10:23:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc1-58-g8a6abcd04e4c
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: devel
Subject: linusw/devel boot: 53 boots: 1 failed,
 52 passed (v5.3-rc1-58-g8a6abcd04e4c)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 53 boots: 1 failed, 52 passed (v5.3-rc1-58-g8a6abcd04e4c)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.3-rc1-58-g8a6abcd04e4c/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.3-rc1-58-g8a6abcd04e4c/

Tree: linusw
Branch: devel
Git Describe: v5.3-rc1-58-g8a6abcd04e4c
Git Commit: 8a6abcd04e4cdf6088f11212570c3e5ec36ee5c3
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 42 unique boards, 15 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-mhart: failing since 35 days (last pass: v5.2-10808-g9637=
d517347e - first fail: v5.3-rc1-5-ga299726da44f)

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab

---
For more info write to <info@kernelci.org>
