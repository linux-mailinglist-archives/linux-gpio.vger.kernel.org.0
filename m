Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAA1EAC4C7
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Sep 2019 07:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388663AbfIGFfp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 7 Sep 2019 01:35:45 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47]:55659 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbfIGFfo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 7 Sep 2019 01:35:44 -0400
Received: by mail-wm1-f47.google.com with SMTP id g207so8440790wmg.5
        for <linux-gpio@vger.kernel.org>; Fri, 06 Sep 2019 22:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=NCP5L2QMRDLrDZwuv3f9dzPdC31cq4Egw09oaKf8hC0=;
        b=osXmdLCt/covXhcOdLUqjEuOf7IKxyAMw2W2B1FyggZkOSesR3dyMhz9NTP98W1LgT
         iQH03iHM13r5t3vNJgXh/chYWiObv/AVHVgLX/j3egtJDFZb3CuTy7BycZOAfMZHczxs
         KwCT97QSns7JTrZ0YNPosFST+eAIZQugVBurcbXneAK7VFZ+WzUa1ZaxTfemAjI6sZ0/
         tIVYfX4ES0ww/24ItEfQdOgrUGc4kQ/cagvfJjxap+ckUGgHiSvI4vQe/Itrk+xrlK8b
         iBIalzjUkVgadqiqW5+S2Gor1lZ7iPNoYLgJ17dISQQgGrf8uVWWRrk9XJ+HSvbWAibL
         i3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=NCP5L2QMRDLrDZwuv3f9dzPdC31cq4Egw09oaKf8hC0=;
        b=TFa1Ien5+nGR2yGgPd/SFzU8MhCoD8LTMdCwjk9goBYkuDsWOUjBcGLsBIHVsbuiql
         aM8dK1YAhVtOqdHHVB+f+BhHvfFLrAHV1H4h7YiJAPE2UKgj5NBgcaSzVXRbZZ/4fL0G
         Uz2NBJaxEKzHLGVlAjGLbWi/IRM6gnoeNUcFI25u0gCnnbgdDnGS1YIcWbu3F4kl0jMp
         IwP3EXU5GG+OcNSstoSxqhuf0FneozawovhopS9cX16bSOVa1jZ2ZOpshp6nObW40XPR
         Xe+A09Gin9TtxMD5yjzJ9QNoTx7TFijgVnu8EdrBKnegzdcA/vWOg7Vmo0sfuZhaigan
         aqgg==
X-Gm-Message-State: APjAAAVwlUZWgoRybnRQf74OuiCB++gGicDp+59DGez3X0VZWF6rA8Nq
        NQurzHsL9kcKQ+Fvcsyo+P+RZqGNlXwbtQ==
X-Google-Smtp-Source: APXvYqxDiBL4MgObRpJ3oclFZxYfBsL2J0SpdtahD7FIHl5kBv/ztD2tpmB35AGMenIV0LtKPZuELA==
X-Received: by 2002:a1c:a984:: with SMTP id s126mr10550627wme.26.1567834542827;
        Fri, 06 Sep 2019 22:35:42 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f66sm10496289wmg.2.2019.09.06.22.35.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Sep 2019 22:35:42 -0700 (PDT)
Message-ID: <5d7341ae.1c69fb81.48a8c.1eb7@mx.google.com>
Date:   Fri, 06 Sep 2019 22:35:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc7-64-gfbdf8d4bef49
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: devel
Subject: linusw/devel boot: 51 boots: 1 failed,
 49 passed with 1 untried/unknown (v5.3-rc7-64-gfbdf8d4bef49)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 51 boots: 1 failed, 49 passed with 1 untried/unknown (v5=
.3-rc7-64-gfbdf8d4bef49)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.3-rc7-64-gfbdf8d4bef49/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.3-rc7-64-gfbdf8d4bef49/

Tree: linusw
Branch: devel
Git Describe: v5.3-rc7-64-gfbdf8d4bef49
Git Commit: fbdf8d4bef4917713e7ec2fc006041a2b449605a
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 43 unique boards, 14 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          sun7i-a20-cubietruck:
              lab-baylibre: new failure (last pass: v5.3-rc1-47-gf6a7053ddc=
f1)

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: v5.3-rc1-58-g8a6abcd04e=
4c)

Boot Failure Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            sun7i-a20-cubietruck: 1 failed lab

---
For more info write to <info@kernelci.org>
