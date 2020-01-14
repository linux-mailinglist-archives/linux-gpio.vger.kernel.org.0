Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDBC0139F98
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2020 03:45:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729074AbgANCpd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jan 2020 21:45:33 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42193 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728802AbgANCpc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jan 2020 21:45:32 -0500
Received: by mail-wr1-f68.google.com with SMTP id q6so10601140wro.9
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jan 2020 18:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Lahyd23BtnU9tUHt8bOBwkYz012b5IkiYZ3NPKLZKic=;
        b=MM2vCJtoCDkGZI/ZpdImcjuHrmOngeWEkkTrfsPDS/kqke3BZV9SMTFzP3o85c+QmZ
         88BdRMua17WJS5Vp+wtvpBEKm7BQF2fdvGZh8eq/LHbtBiFNct1aKY+spSCt58nNIK4F
         Fz+2zWKW9q+xP3zZA6WCGRyfFevqZGqTdExqR7VogQkmmYhrjNK7rzQvNsvnvDNNje7G
         fjlIhxLiti7aS/HL8zUvEgU0HAN2PrtrR1zuytxYyJ+c++0+aaqP4P1QeBcBb1w2OS/e
         qrS6AXNvOOQ4vwtbLWa1QPUd7Sv04OaNUSOMt1v98MOzpSPfL713Bc1ADrQmQ1ThnF+q
         P/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Lahyd23BtnU9tUHt8bOBwkYz012b5IkiYZ3NPKLZKic=;
        b=AT/xWfVoOuh20VvjPmV3QVxH9wUq18myQ4u7uIawzhbShS+rYQ9vBXBiRWyLTCJoZp
         eKuTPGl1nQp/h/b4F850OogXTs50/xVv1OEcfEE3ZWfKUcjOVMUn0210biHf+El92QH1
         jQ4i/5BimGX37DLqPZXMpIGa/DQ2ahHyr4se7Qw3OgfYX/WaCagXMtCnYJHLx0RKbacZ
         ERxewvR6SIHghmVLxBXGG+zNG5RH0GikQ7NaAV8wtZysliFpL4Mar7lYm5yVDLD6/u3s
         xzlcSrDaybYFbEEyxzGDgPLh4WllY8OByBMot3FsQtdc9hJPnK6y6GaJOgv0DZD7CPEr
         alXQ==
X-Gm-Message-State: APjAAAUqngVQDitiVbUgr59A0Mq+HVoxzXJDfnCvW6Q/bIlMXWsPJaaJ
        rmBlIQfJAwbbXmFmi15v3fA0nzZ6N5p9Qw==
X-Google-Smtp-Source: APXvYqzoAGSYJu7lAZpkv29GsAJrDqoc5KtnBHmIYl+1rJVKoORnWxbk7Elpbf92Dyp1OKVrVX8cYw==
X-Received: by 2002:adf:ee92:: with SMTP id b18mr22967358wro.281.1578969930464;
        Mon, 13 Jan 2020 18:45:30 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id x14sm16315440wmj.42.2020.01.13.18.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 18:45:29 -0800 (PST)
Message-ID: <5e1d2b49.1c69fb81.d3464.436e@mx.google.com>
Date:   Mon, 13 Jan 2020 18:45:29 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: gpio-v5.5-3-31-g4e4ade156406
Subject: linusw/for-next boot: 53 boots: 3 failed,
 49 passed with 1 untried/unknown (gpio-v5.5-3-31-g4e4ade156406)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 53 boots: 3 failed, 49 passed with 1 untried/unknown =
(gpio-v5.5-3-31-g4e4ade156406)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/gpio-v5.5-3-31-g4e4ade156406/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/gpio-v5.5-3-31-g4e4ade156406/

Tree: linusw
Branch: for-next
Git Describe: gpio-v5.5-3-31-g4e4ade156406
Git Commit: 4e4ade15640646ddff45d1235d6c08086b98c645
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 46 unique boards, 14 SoC families, 3 builds out of 5

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          rk3288-rock2-square:
              lab-collabora: failing since 13 days (last pass: v5.5-rc1-20-=
g06c4fc5eda6b - first fail: v5.5-rc4-9-g331d7ae3fa15)
          sun4i-a10-olinuxino-lime:
              lab-baylibre: new failure (last pass: v5.5-rc4-35-g0dc4997ef7=
39)

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: v5.5-rc4-35-g0dc4997ef7=
39)
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: v5.5-rc4-35-g0dc4997ef7=
39)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s805x-p241: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab

arm:
    multi_v7_defconfig:
        gcc-8:
            rk3288-rock2-square: 1 failed lab

---
For more info write to <info@kernelci.org>
