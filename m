Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A04D71EDABB
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2020 03:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgFDBsw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jun 2020 21:48:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbgFDBsw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jun 2020 21:48:52 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4602AC03E96D
        for <linux-gpio@vger.kernel.org>; Wed,  3 Jun 2020 18:48:52 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id w20so2801624pga.6
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jun 2020 18:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=5tFZYJZLMd0R3LxxEYv+RdHaD5pIiQBOLfJ2EINS32U=;
        b=CYiO8YJIMZcQU2DG4nTVIxjQTr/kjyEBIqdI7HXr8E0e11nf0EQ5XQ0yMgjZTN+05C
         vAE7Rt9HqCvao05ObTG/Ulhk6mvRfAkUPgZ4pWsRIFp5R+BTdHGWhWygpK2l7BNxvzeg
         HxHTzJmAqGbqMrnh1AZlNZp8HuocTbWiP/xX0tYF+hVYHkeYQ5ZAOdXYeqTB1p3349D3
         uepYLCzMhBt3prHHdQMqIeC/Ug9dbKxC+l7RTrON4Bi9nEIya79M1xCiHIdo3ASKuGpM
         HsOFJ0GIS+scN3hWqBByOYzDh6iBB/mpiwA+R5mJWZzv//pID56d6g++a7EGpsNnXhAo
         qs1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=5tFZYJZLMd0R3LxxEYv+RdHaD5pIiQBOLfJ2EINS32U=;
        b=pThle42sQtZqk0rXxiNkbWZoVb6AwCtXgMIUhia9yxC/sktfcfGCI23MScF2vB2DAx
         Bain65f+zLVVqWQ9FCsXtLcjal8OYz6DNYL8jdrS1Q6XUzA0oa/By8DSk+IzGMUUUUL8
         WjnK+a/m5Fv5sAAz9iwUhSHJ8jJTPww0kMcnmicZNkWyrsCrB6MsAtGd4YX0rlEfcR8L
         n7WbatY0Q3IY4iP7Q0V2T6Yh6z85I1G0a5qmumTITkK+46PV6ZyXc6eCeMtAnZuFkFbZ
         Gk/zqRbHd40myo8J5pKkeCqUNmlAzEZFj8DBoDwkab25LVqJql7itcff/554RwBxLrvk
         WzSg==
X-Gm-Message-State: AOAM530GM7M6BEGSFCIQ+DqVbzvg4dMDhYMf18K+SDXxQNFKzxhaxaku
        SIFxLQRYUhDWk7vNhlbZ1Bh/kWYlnP8=
X-Google-Smtp-Source: ABdhPJwTEvnR5PZzCXUli1s7crhygZqvgKXzkBG34VdfRUadIIDPs0NV8j5vujI9w6eUrXequPsrnw==
X-Received: by 2002:a65:52c3:: with SMTP id z3mr2152573pgp.146.1591235330819;
        Wed, 03 Jun 2020 18:48:50 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n3sm2494760pgq.30.2020.06.03.18.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 18:48:50 -0700 (PDT)
Message-ID: <5ed85302.1c69fb81.494a1.7462@mx.google.com>
Date:   Wed, 03 Jun 2020 18:48:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.7-rc7-82-g74910e15ab25
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
Subject: linusw/devel boot: 47 boots: 0 failed,
 46 passed with 1 untried/unknown (v5.7-rc7-82-g74910e15ab25)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

******************************************
* WARNING: Boot tests are now deprecated *
******************************************

As kernelci.org is expanding its functional testing capabilities, the conce=
pt
of boot testing is now deprecated.  Boot results are scheduled to be droppe=
d on
*5th June 2020*.  The full schedule for boot tests deprecation is available=
 on
this GitHub issue: https://github.com/kernelci/kernelci-backend/issues/238

The new equivalent is the *baseline* test suite which also runs sanity chec=
ks
using dmesg and bootrr: https://github.com/kernelci/bootrr

See the *baseline results for this kernel revision* on this page:
https://kernelci.org/test/job/linusw/branch/devel/kernel/v5.7-rc7-82-g74910=
e15ab25/plan/baseline/

---------------------------------------------------------------------------=
----

linusw/devel boot: 47 boots: 0 failed, 46 passed with 1 untried/unknown (v5=
.7-rc7-82-g74910e15ab25)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.7-rc7-82-g74910e15ab25/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.7-rc7-82-g74910e15ab25/

Tree: linusw
Branch: devel
Git Describe: v5.7-rc7-82-g74910e15ab25
Git Commit: 74910e15ab25f95f162bc4d4a634d029186543ce
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 47 unique boards, 13 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: v5.7-rc7-78-ga8173820f4=
41)

---
For more info write to <info@kernelci.org>
