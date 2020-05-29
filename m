Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 869381E72EF
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2020 04:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406765AbgE2C4x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 May 2020 22:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405441AbgE2C4w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 May 2020 22:56:52 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29579C08C5C6
        for <linux-gpio@vger.kernel.org>; Thu, 28 May 2020 19:56:52 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id t11so643536pgg.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 May 2020 19:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=JqxW0UwFmdLpdIrnfFqBGF+iAXaX6NHnR/XP9oE4Iww=;
        b=q5nnx7k2t8Tnp2MZ264dDtgCzl41Ttyxfnawwt0eQnaoOqyv/mz7mcCAVLoXE+w39j
         9q7esrmatOl46yNWPoApJ0K1v+4tFeWqG9FhoeNjGp6FdnfS1sEWg96xUcULlLll7rZm
         +tYd31gdH3EtAFBmZoxaZSWXw8/LXCfEms6l68LQPyjyX52qflWOFNnh+3cWJZDN6Ctl
         kRNAtQB3w75Hy1bNyeUVNduxBU6+yd8zk5823KBAS5Vg3ZIl+dgcCd6tw+pd4D4ftRNO
         cb6fDBYkhDxpt1bOM1W9e7xMyA1JCr/C677GV/TXi567F9N+ds0+sJA5uN5Hr8ANsXWu
         ffVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=JqxW0UwFmdLpdIrnfFqBGF+iAXaX6NHnR/XP9oE4Iww=;
        b=MIHIpuWuYAzaV+eW83IORi/dIfmEKP5AvXqam44zmBvB8+SIFhR+KfxWM2f5nAtSLk
         hgxI8pUvCqRiaBGizFAgXgi5k/rSOZzXpzjvYsbOISmrNh/nwqk4arB5FUkV9H46ong4
         EgeoazhYTJfu1PkeSM/qY8ITe6UcoygGaZJMhdeuJ58Z0aFHxnfU8lrQUpD1B36SDMWe
         +CD6kETBtbk12a2rjitEtn8fc8sjmKdE2defSoJ9B5e9J51nnB46csy0GuX1OpAK3/C3
         q+B7vT2CCNjCC77pHUP90M34tEo9dgY39RoshQ7eOel94s7vMmcnpPhww3wD1fWxbeDY
         lLrQ==
X-Gm-Message-State: AOAM530E4tG+YrphqK0kTjFvHfdVgJ5kFVNBgyZpi8RcIZJ0zPA2+a2/
        VnLOLv7UbtL++4/m48dD6iEjCUl0U9o=
X-Google-Smtp-Source: ABdhPJwzvYwBck2bPWxkKgxYSHqVn66u8h/Xj0jb5ecvRz7YIJfTWgI2scJWr4+9/nEQ2H3EaYbEGw==
X-Received: by 2002:a62:e707:: with SMTP id s7mr6110029pfh.208.1590721011355;
        Thu, 28 May 2020 19:56:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x22sm3079287pfr.188.2020.05.28.19.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 19:56:50 -0700 (PDT)
Message-ID: <5ed079f2.1c69fb81.cfaa8.1dcc@mx.google.com>
Date:   Thu, 28 May 2020 19:56:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.7-rc7-78-ga8173820f441
Subject: linusw/devel boot: 52 boots: 1 failed,
 50 passed with 1 untried/unknown (v5.7-rc7-78-ga8173820f441)
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
https://kernelci.org/test/job/linusw/branch/devel/kernel/v5.7-rc7-78-ga8173=
820f441/plan/baseline/

---------------------------------------------------------------------------=
----

linusw/devel boot: 52 boots: 1 failed, 50 passed with 1 untried/unknown (v5=
.7-rc7-78-ga8173820f441)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.7-rc7-78-ga8173820f441/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.7-rc7-78-ga8173820f441/

Tree: linusw
Branch: devel
Git Describe: v5.7-rc7-78-ga8173820f441
Git Commit: a8173820f441ab3e2a45c4bb66b70da9a57a349e
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 45 unique boards, 15 SoC families, 3 builds out of 5

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 105 days (last pass: gpio-v5.5-4=
-45-gd18fddff061d - first fail: v5.6-rc1-12-gb2929a9cb2fb)

Boot Failure Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

---
For more info write to <info@kernelci.org>
