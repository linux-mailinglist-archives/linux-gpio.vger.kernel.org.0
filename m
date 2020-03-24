Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF99F191C48
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2020 22:53:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727664AbgCXVvx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Mar 2020 17:51:53 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33012 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727613AbgCXVvx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Mar 2020 17:51:53 -0400
Received: by mail-pf1-f194.google.com with SMTP id j1so7311514pfe.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2020 14:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=5NUG4BVA1vlnA+bV/B2jOQb/bFmChuTPD2WtlSmqECU=;
        b=qSvjSaJwPx/EFuZJNuTpiaJoYNBxSzOGQOryG22oaO+dQYEhsnizZ9fUHBaV47E0ci
         3TD5+VChu+WaGaPVD6iq6ZB3CYQsiYZFP9ecZCTL82OJytZlOjD9WcU24qmMpfdqIvZe
         Fdh9Ek0mvO4r+ZYmVe+ZTOcapSVGOGDg6NZUTU8g4O3kfU0g7w7/+rGhII5OXIoYY1xd
         uT4VOfFX62oC8EYT6EfSiQ1ltYQJx6Sj4gii9+8+vSR+iVBj8aV5IbW4Sl6At2Vcho5v
         cdatvd96rEDDlrJwQaAYxXMVLjhVH+tcNv2qlJesb4NXsg0k/fngg2zJj3lvjKAinPj6
         Wf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=5NUG4BVA1vlnA+bV/B2jOQb/bFmChuTPD2WtlSmqECU=;
        b=uIABzMEFcwVMHQG/yD6PoQpNkq7SQn/1XgwbjU5NoKHxt0XWqhYIl/SeaPzsHXMAro
         7acEZ+nCrFHjRXC911fknXBst5GNOjyNdH//KsxtHRiJXQ5OQ7AqNXXHTMEDV01VjyKR
         8Vp1faCKY94mM3gkXTr3kHMd/kuSKLf5UVBugRJrUBrR4dDQNiSx2BP5MNsK+p7tDyDA
         tazj/dCSse2dkrWbvzZeFQHdIO/hFOPR+zMyalfs9u4p04TJDIKjr7HXKVNgA6/MfXsg
         9G1vmQ8ovGSm50mhnCiZbID5Dt7I8+yTbL8TI160kcMglLiHfjhbF2CFXNBc01Ai553L
         Isqg==
X-Gm-Message-State: ANhLgQ2dHNwV1aqrMlNYOeMgHPwwkoLniOZ/Ef3mtJpPkyHxSLmplAgJ
        rxc62H3fDKdaIVd64IDWMObY0wdiMUQ=
X-Google-Smtp-Source: ADFU+vu34xK6nZGb+f5u827w8iWFQTgL0jesIqbFbBKd/x3+a351Fw9cXcJnbtREIZME5c2TvkRB2g==
X-Received: by 2002:a62:7d4e:: with SMTP id y75mr31276589pfc.32.1585086711873;
        Tue, 24 Mar 2020 14:51:51 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y193sm15683605pgd.87.2020.03.24.14.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 14:51:51 -0700 (PDT)
Message-ID: <5e7a80f7.1c69fb81.1cbd8.d2af@mx.google.com>
Date:   Tue, 24 Mar 2020 14:51:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.6-rc3-38-gb3e741a0f776
X-Kernelci-Report-Type: boot
Subject: linusw/for-next boot: 61 boots: 1 failed,
 60 passed (v5.6-rc3-38-gb3e741a0f776)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 61 boots: 1 failed, 60 passed (v5.6-rc3-38-gb3e741a0f=
776)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.6-rc3-38-gb3e741a0f776/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.6-rc3-38-gb3e741a0f776/

Tree: linusw
Branch: for-next
Git Describe: v5.6-rc3-38-gb3e741a0f776
Git Commit: b3e741a0f776152b36395ba97f94d5bd2d71c09c
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 53 unique boards, 14 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 42 days (last pass: gpio-v5.5-4-=
45-gd18fddff061d - first fail: v5.6-rc1-12-g612e35e76ec8)

Boot Failure Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

---
For more info write to <info@kernelci.org>
