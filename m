Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30C161E8335
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2020 18:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbgE2QJC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 May 2020 12:09:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgE2QJB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 May 2020 12:09:01 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF3DDC03E969
        for <linux-gpio@vger.kernel.org>; Fri, 29 May 2020 09:09:00 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id d10so3397pgn.4
        for <linux-gpio@vger.kernel.org>; Fri, 29 May 2020 09:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=mMnzWd0kctx4gAdS2zqbaV22gBXXIDqT8KewsaxiXmQ=;
        b=qtf3qHYsfYdB0JDmr3GPeAScntlWrMHkPjO+YRk2fPuIbPHM99kCbzkgy80afxlyGN
         jfMYcbiRCxLzv48ter2peCg2jMVFE/6NUbcJ9jSxBrENuaiFrOH/xcrYgfgFrYjIA5Mb
         Z51TIGU2vu/ngc8rr2oaPpZOjcPhZFzSwep6D7EqJ3Nxkd0+ii1NxYgQ3d/uLnRChGwy
         NuCjZQ5pjWpuiDDZkN/8BIg3cma1uzXLoYXsAw+RvvVwZ2dreuZKcUrCjobW39fTg3Ut
         JX8R2wSc68nRyiiFBOlF1tt5beiJ3N74LKZf91EIQ30mKAvnkEM2zPlHqApT8AuIdl3z
         AFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=mMnzWd0kctx4gAdS2zqbaV22gBXXIDqT8KewsaxiXmQ=;
        b=kn0vyJgi+x2gLHzUDooe4lsb+FOgoU29p97mtQ3JLRQYG85ZV0DU34dx2PynFCT6Wq
         U7iboXaNb1ksofax0JtAjczZzfEaZ4EiyqvfpbC8hvFiIekHRZ3d1/yYiTgZfuVFzvSu
         1iVi2UiiZFsx1HU8KG+UO9y4ZxKk2vXAbF12vzsqgAJZCnVv7ctO3ZVNolNKDfTYrvn+
         9FpcqJXMMRu/Zc34wtpOA5C2tYnv+9WUzVA5O+ZLV993y71eVkQ5vKPrGsudoDpwFqMn
         ShBjSDxBJL1/z/RXAXDqbVJmLD3Y6CHXj6JEflOPZNGI6RsSttvDP/D3Vn4lm8ZIq3fT
         1tQw==
X-Gm-Message-State: AOAM533xzh+1q6029Gfp95Z73a5GjdOyJ9HiDDkw/UVToDo75xbnTyN3
        qnGYvxust/Sre2S6xbvZr2EVy6J0ZdM=
X-Google-Smtp-Source: ABdhPJwZXUkrMSQ/mgHOOJtpQM9ChAp5wRIuAAz9UBJUwq26NW38cXOrWGp2lq22fPkq1FXVlVLmrA==
X-Received: by 2002:aa7:984b:: with SMTP id n11mr1668502pfq.74.1590768539772;
        Fri, 29 May 2020 09:08:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b20sm7748205pfb.193.2020.05.29.09.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 09:08:59 -0700 (PDT)
Message-ID: <5ed1339b.1c69fb81.9fafa.cc7f@mx.google.com>
Date:   Fri, 29 May 2020 09:08:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.7-rc7-88-g5e9fc19f525b
Subject: linusw/for-next boot: 46 boots: 0 failed,
 46 passed (v5.7-rc7-88-g5e9fc19f525b)
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
https://kernelci.org/test/job/linusw/branch/for-next/kernel/v5.7-rc7-88-g5e=
9fc19f525b/plan/baseline/

---------------------------------------------------------------------------=
----

linusw/for-next boot: 46 boots: 0 failed, 46 passed (v5.7-rc7-88-g5e9fc19f5=
25b)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.7-rc7-88-g5e9fc19f525b/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.7-rc7-88-g5e9fc19f525b/

Tree: linusw
Branch: for-next
Git Describe: v5.7-rc7-88-g5e9fc19f525b
Git Commit: 5e9fc19f525b67967cc10d3ca8e85214fc3c26bd
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 46 unique boards, 13 SoC families, 2 builds out of 5

---
For more info write to <info@kernelci.org>
