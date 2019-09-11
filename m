Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE88AF42B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 04:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbfIKCMZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Sep 2019 22:12:25 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]:34466 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbfIKCMZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Sep 2019 22:12:25 -0400
Received: by mail-wr1-f47.google.com with SMTP id a11so12882745wrx.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Sep 2019 19:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=/3Bqlv25kN8c5HQH4jysHcIpc1XGuXo6ymXiUb91Kk0=;
        b=btw84t35hA7+ATUNQYRvq5UyYny7ttoQFO/nas1WemvwzH/7hakRlQXhbUO52QpC2p
         cwF02xGpcLMHvQtokHas1SLtLNl1+m5v7reTUVri+Nt0nCGt92+Z7Q+nXI8IsWp1j5vX
         au0JP2ewg7ZgP4tsJziEMjhDFeKa4N1Hsxy7uRwBkkRJ/ASY7fmLpRvz0OIzVkGpMD9a
         a/hhQzzBWi8Fgj13BRAgYXFMrm2Mdkn43L2acqihGjLuFiilAhu2NVJTJz2ewtIirRO+
         A/C9lB8RwttvYseutFYV+NvUyxs47o4tGQLedvfxXCapVHPhyl5OiuBtWCR+Kq63Mtbw
         3XXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=/3Bqlv25kN8c5HQH4jysHcIpc1XGuXo6ymXiUb91Kk0=;
        b=i/m5tTs+/kBHYHRXeSRmIqLWAzpqrXPsKZVI8V6u2vujRKNTX/gXil3jIVFjzrV5z7
         0AeE/KeyKXHU6XQTz7CvQ45nrA50L2zvjGrnupYdBvdlahPdMg1YYApqKqRuOYo0Tw+F
         oYrZkm4EdT7zUhay4Cpc+4rtTHVZjoY8zHG1/CwTVadg3tYFSMvluC/XElqD+HPVjWCO
         Ab4cPxOE7kOeWF6BzOPm+E3crb0JgiHq0mSmSxowGHLLjXnWbSpb2yObbGeSDs+alIvp
         WNBk+OvFC+aKCFqQ32l7Epb17EGARbetIFne3dlNEyVsfIA4+7ZyobsSwlEgga6tKhV6
         PQcQ==
X-Gm-Message-State: APjAAAWUxxMUFZp1yCk+dn9saaaHmB2kpfhQBQ5QhBcFdeTaYaDoSpQF
        5J/XMafl9VUsIEkKGsXaNhkap/V3CAIo0Q==
X-Google-Smtp-Source: APXvYqzLmWDdzQmxzBaBO5u0CowKoKgsDzq3xSXMr1g9BrIsVt5DV2YOOAFIDB1uFYYSLyuS8pmHzg==
X-Received: by 2002:adf:dbce:: with SMTP id e14mr30325033wrj.56.1568167942724;
        Tue, 10 Sep 2019 19:12:22 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id i73sm1068589wmg.33.2019.09.10.19.12.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Sep 2019 19:12:22 -0700 (PDT)
Message-ID: <5d785806.1c69fb81.4c397.55f7@mx.google.com>
Date:   Tue, 10 Sep 2019 19:12:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc8-5-g1dea33e84d33
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: fixes
Subject: linusw/fixes boot: 48 boots: 0 failed,
 48 passed (v5.3-rc8-5-g1dea33e84d33)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes boot: 48 boots: 0 failed, 48 passed (v5.3-rc8-5-g1dea33e84d33)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/v5.3-rc8-5-g1dea33e84d33/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.3-rc8-5-g1dea33e84d33/

Tree: linusw
Branch: fixes
Git Describe: v5.3-rc8-5-g1dea33e84d33
Git Commit: 1dea33e84d33a5220aeda4ca9e918de0fd77c078
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 42 unique boards, 14 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
