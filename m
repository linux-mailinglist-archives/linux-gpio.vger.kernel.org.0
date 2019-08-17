Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09C0590BB9
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Aug 2019 02:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbfHQARO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Aug 2019 20:17:14 -0400
Received: from mail-wr1-f45.google.com ([209.85.221.45]:42065 "EHLO
        mail-wr1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfHQARO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Aug 2019 20:17:14 -0400
Received: by mail-wr1-f45.google.com with SMTP id b16so3052025wrq.9
        for <linux-gpio@vger.kernel.org>; Fri, 16 Aug 2019 17:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ytiNvTASrufZorBG/KzjVaj8XTjhhUCcvpajJnlkt1o=;
        b=IFX4+QgvrIpyAI9Uu0H4LFkGkQjG0dJQkmvNjkpmpC2yWZJMLU5z9x5LzAt9e14Y0G
         kt0el5BB8rJ5Lfs1aTeROC/QSi2dmy36vyW99Knp+G55YSXDuIYczqW+/IaOYLjkwXLW
         KGZepHSWhOkc9Wt+FKlg99Bc2TbA6wfE2FGrXuqyPuXwylLzjZT5GItkDTN/29wyRgmh
         4qs6doMgAhYMVbhxS6ivoy4mwwih+N3WaKETd6+wgUrK7mmY11ve60x18RsQSAXGzRum
         xaFNS/YIKFoEvUR7ePHNtwds2+soSD7hn2dP9KThIAfwTu0M+GbDz2lb/0TkMpukK8L8
         Aw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ytiNvTASrufZorBG/KzjVaj8XTjhhUCcvpajJnlkt1o=;
        b=F1ylDcWWJkIJQlRlN0JvNK5xUiEnauOORHmdpgDAAOSGDRzoTwBZOkOMLVkGSDuytv
         krc0Fo8Vkq8QFBeak3PDfw4qk9/onOF5WnGkcSrSXhe03omXF8fPqaLxOgTvPLS2Jhy5
         EjXdtIwQJ6S3BHxLXdX6yJiVYXOBMZzBBuxppfrEMjhQdvU02kzOgZwBzJvJQsq44zN1
         TiLlNC43uvPm/v8vxM6K0FxZdzNvkYshfjSHfyXiS4Hd/WlZz7HU2csqSHyiYUFmF0/E
         sWoIkIvCUcDdY9qvOanFXdAJqMVGPVZ5TSseg07Eb9tvjIgfSQLZ8N/INNWe8trWuXL+
         j08Q==
X-Gm-Message-State: APjAAAXC5CKxrQdQP6owowh8JEMOzxiXIFD3tej61G4Ws8tzmyvAEFfB
        E2+c2A++bJ+jYdU3dyiUy37wONSEHIc=
X-Google-Smtp-Source: APXvYqwHyuholDeeicTU++QaSsU+cOPF4ry4XBZD2s3cvecq0dFC06L9dmA4TI88D7dSYEiwMCWtxw==
X-Received: by 2002:a5d:4d4c:: with SMTP id a12mr13777216wru.343.1566001031940;
        Fri, 16 Aug 2019 17:17:11 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f6sm13608633wrh.30.2019.08.16.17.17.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Aug 2019 17:17:10 -0700 (PDT)
Message-ID: <5d574786.1c69fb81.ce5b9.434f@mx.google.com>
Date:   Fri, 16 Aug 2019 17:17:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc4-35-g984078b26420
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: for-next
Subject: linusw/for-next boot: 55 boots: 2 failed,
 53 passed (v5.3-rc4-35-g984078b26420)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 55 boots: 2 failed, 53 passed (v5.3-rc4-35-g984078b26=
420)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.3-rc4-35-g984078b26420/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.3-rc4-35-g984078b26420/

Tree: linusw
Branch: for-next
Git Describe: v5.3-rc4-35-g984078b26420
Git Commit: 984078b264207fc748c1b1d3aede99b0271b3b55
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 39 unique boards, 15 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxbb-nanopi-k2:
              lab-baylibre: new failure (last pass: v5.3-rc4-33-g02c05fd177=
5c)
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: v5.2-rc6-74-g08fc54c5c8=
ec)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxbb-nanopi-k2: 1 failed lab
            meson-gxbb-p200: 1 failed lab

---
For more info write to <info@kernelci.org>
