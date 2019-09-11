Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4EE1AFCEA
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 14:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727740AbfIKMjd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 08:39:33 -0400
Received: from mail-wr1-f49.google.com ([209.85.221.49]:35799 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726954AbfIKMjc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 08:39:32 -0400
Received: by mail-wr1-f49.google.com with SMTP id g7so24440898wrx.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Sep 2019 05:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=j86q6ZLiAcPXzXf2WMQp4nCW32BCBiipDZA/t3Ut6bg=;
        b=P2EFHM6rCvuZ3kYJX5dnZweAeGjbA5SFcKBapVSnSVFLaeITfbckn6ZWwFfpM3EVHu
         OaDKWgz6BodL/h0ibAUubNFX6vK6SXmzvbEo6WNg5HyZj7lezSB5PxZyzUFBfGFVF+UB
         dtwtFteblM7zxPT5p51DLfRpjvFRju9w8r2fOlLtoOuw1pU+dU+0EDDKlZK88HiR3fPt
         dBppWik4GHrOL26OE0PUYcZMvisLGBvY/w+F4QI3qffx4d6f/r7Iog7NjmMkpphPdBeU
         c4AaGEr2eeHO1wTfQ8XkFEMb9Yw8RhZPEY4dlqGF69gQBD5h/zx90JPPGgRmGN4MB+mg
         RT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=j86q6ZLiAcPXzXf2WMQp4nCW32BCBiipDZA/t3Ut6bg=;
        b=dobAW4EIa8sQtSYx9wo3R4Ar5ew9nP14MtBWBnaOEHyiwGs4wbrEy5oAOacYhp3AEs
         xsWKl9MC2dFWPF5xvbKTSCsCFhLP2aO9ih9GydNhE+TTgLVhMvIKywuzdFKiD94E1fKF
         B3dyVfp/9WGsATQ1eMzKR45Gpq8zKAWMBN6BCiTXbbkRzWK++sZDcOF5K+wnEdHiyJK5
         mg5y94XDCVHmEQ1FNMsLtSzWYEkGmjXrp1wFk5zPfOQbvhCTt2+mUh3kYrcHk8tkJy0/
         OYabLmGYVA+gy1YvDdSkTje2hXnJix/y89EPS3LlHeeOSlVs7i3l1gPj09dld3ZW/sKD
         11DQ==
X-Gm-Message-State: APjAAAUi6CAhDMsfewN6Bo+JKPlTrTX5kz8fp6wMGhralznTlTT6Bf/q
        hpiUCE3l1J0oXSRjywHCgDg2FTYFD4oVCQ==
X-Google-Smtp-Source: APXvYqx8gjYdSh9UQMGIsC1zNxe7XYDHs43V/nY6lkuQMC93UCtLzze20jKCfoJFRYQULtCN4SmGWg==
X-Received: by 2002:a5d:678a:: with SMTP id v10mr30210737wru.145.1568205569532;
        Wed, 11 Sep 2019 05:39:29 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id q66sm4002283wme.39.2019.09.11.05.39.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Sep 2019 05:39:28 -0700 (PDT)
Message-ID: <5d78eb00.1c69fb81.f8cea.3bf1@mx.google.com>
Date:   Wed, 11 Sep 2019 05:39:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc8-6-g61f7f7c8f978
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: fixes
Subject: linusw/fixes boot: 49 boots: 0 failed,
 49 passed (v5.3-rc8-6-g61f7f7c8f978)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes boot: 49 boots: 0 failed, 49 passed (v5.3-rc8-6-g61f7f7c8f978)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/v5.3-rc8-6-g61f7f7c8f978/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.3-rc8-6-g61f7f7c8f978/

Tree: linusw
Branch: fixes
Git Describe: v5.3-rc8-6-g61f7f7c8f978
Git Commit: 61f7f7c8f978b1c0d80e43c83b7d110ca0496eb4
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 43 unique boards, 15 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
