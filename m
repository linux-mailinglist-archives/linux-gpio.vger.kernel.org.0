Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E7EE177BD9
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2020 17:27:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730367AbgCCQ04 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Mar 2020 11:26:56 -0500
Received: from mail-pj1-f54.google.com ([209.85.216.54]:55452 "EHLO
        mail-pj1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729438AbgCCQ04 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Mar 2020 11:26:56 -0500
Received: by mail-pj1-f54.google.com with SMTP id a18so1555123pjs.5
        for <linux-gpio@vger.kernel.org>; Tue, 03 Mar 2020 08:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=gYkmgwZF8PJrPxm/1R9YtBY51Dn5A+SjuxYSiuRjllA=;
        b=rnmEuuG65YTQi8PXC40C7POiZH8VqUBg4jBdmN43MzTvNzbAbHLw8aCF8ypY7+yXpA
         N0TzIVccK9gjYfQxBBaGTN31uYpP8mx1L8N+jKsYFx8d+F7iyiEzXCUluODi+fmmfySC
         BfbyEkByvH3JGqP9AkQ2q0E1dcsYTm+iLL29UEkawVy7Jb+0eaNMjKHMfUtqG6IzMPW/
         pRe+8y1ub7BqFtfKiRFzbEGCyi6bMv3HdvyPp89OsZbQyavoM3gHGeogim1E4XP+h3tb
         dmT+fRI+5vRtOrUg6w2CWDC6M7Koh5OyD7M0pqwdHRZ/Bhh4WvttQRtbLG7wbOvLnJZ1
         4ZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=gYkmgwZF8PJrPxm/1R9YtBY51Dn5A+SjuxYSiuRjllA=;
        b=UevxH4S3xgJc3k7bFPGsajIyY1agiwHE2DesFTgWBDniYjEV2Zoa2v4GGnf5/hDir0
         WZ9CSGuXIskYyk+e72Tr5TN6aqT3FS/gRgaz7oV6LKVQKlnhbPvw/wRTTF7ELtaZYnhg
         TixRdMgJvLbzURonZMs5dQvF0UhqbjScgPypx5oPGnGUb30yky/nKV6RKsgD+kJdRJ0u
         0rZ60qEpRAAHLyysDPqxis0wZwm/iv3WR6C/sx/J3dzS/VssbyOabaHx84CQ/4GQbYgs
         /TC8Rfj5rJbMUxJWaaMQYXaWrJHNrdHUTOqOOiM58s6YIRVAO+Qc3QCYZ0bZ+83CDWel
         dEZw==
X-Gm-Message-State: ANhLgQ3hq5QcSRvDxtQ+szp7JCqzYrwjqEOEzdprRULPViawVybtEESb
        VGDsWtkR9F1skwcXz6WGmIhcsL4K7wY=
X-Google-Smtp-Source: ADFU+vt4iK66HXUQ8puCcreOMEd729iuzZI2EiB4ifOP7UKrCJGx5Th3sSShxNq284HgCXXI+gEE/Q==
X-Received: by 2002:a17:902:76cc:: with SMTP id j12mr4049638plt.129.1583252813469;
        Tue, 03 Mar 2020 08:26:53 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i2sm3002563pjs.21.2020.03.03.08.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 08:26:52 -0800 (PST)
Message-ID: <5e5e854c.1c69fb81.55cce.74fd@mx.google.com>
Date:   Tue, 03 Mar 2020 08:26:52 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Kernel: v5.6-rc3-27-g9cd0c5e02ee4
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: linusw
Subject: linusw/for-next boot: 32 boots: 1 failed,
 31 passed (v5.6-rc3-27-g9cd0c5e02ee4)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 32 boots: 1 failed, 31 passed (v5.6-rc3-27-g9cd0c5e02=
ee4)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.6-rc3-27-g9cd0c5e02ee4/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.6-rc3-27-g9cd0c5e02ee4/

Tree: linusw
Branch: for-next
Git Describe: v5.6-rc3-27-g9cd0c5e02ee4
Git Commit: 9cd0c5e02ee4fcf8d0905def9b096b4222e179c2
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 29 unique boards, 8 SoC families, 2 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: v5.6-rc3-21-g27a2a9a4fa=
1f)

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxm-q200: 1 failed lab

---
For more info write to <info@kernelci.org>
