Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 170B1AFD23
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 14:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727307AbfIKMxJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 08:53:09 -0400
Received: from mail-wm1-f48.google.com ([209.85.128.48]:39923 "EHLO
        mail-wm1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727826AbfIKMxJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 08:53:09 -0400
Received: by mail-wm1-f48.google.com with SMTP id q12so3421720wmj.4
        for <linux-gpio@vger.kernel.org>; Wed, 11 Sep 2019 05:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Z1woqy4+dEbH+Uty8XbSmpPKl/DeJF2dHgldWe59E18=;
        b=akiKnMsB8Dk/W5U7RfhuAKykaSOFsnRdN4Mh6r3rp2vpPWPUW0q+F8E8wYwH+vGLjP
         /uhauUc9rNKEp1/uvZf5SuRctw9g5iRz9j8Y0lw0sjuNKZMDz5um6sq/R/93rL9pSHYd
         cn+37BYPnEUwE0m/BqjH+8r++udLVN/NDQWitjAwIusop2g1qsX69lKs6SNLYnKv+dY+
         gi0EXtN951p/pVqBcTSRrbmlOofZwVGlk2m4T5xyNgvn5P1cME2ryhuVmwACEtpx7w+k
         4VTy4NSN3YwhIlcGCZJtT9eCZ0yPzQyYbMxi8wkPTHuO0JU2mh7nQ8cudYTXfNq9Y+6N
         Ytcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Z1woqy4+dEbH+Uty8XbSmpPKl/DeJF2dHgldWe59E18=;
        b=ZOUgyIBJ4Choe5faQfqoTdfcdCjIO2WeSoNKZuBu2P6JK41737T8iGfCrHt2x6gHAK
         CY8PlLEA+aOtZceauo47saI8JgMB2wLAdgg973xHYVNLnt96GNYgwDMxds7irRVmLeNh
         KkvkqRkdqF9vFRHTLtGXjmIl2FP5jfb1slFpNzEf9L27OEZ5xOXPps7Lrl3mmQ8DlsAJ
         4WdW/x5Pt2D6px0vil0ZDe7XyrMUykz0uO3bRjRr5LBoL+CBu0CJetfBrU2hVu0tggIL
         wpA0YeyQ17AqljDxkV5oZVvKYhTqsBmeL9FOVtxVRfzBzx5bGdeuNdXT/JnsAHCI0OfG
         T76g==
X-Gm-Message-State: APjAAAUy9KYlTkcAx77buE6CYYjv6uKmFgVzG1yzxWgy+Mu8KgsKwtOL
        PL5kQqBDcwBpG99rCMp4Xb7XL2aPu3JGdw==
X-Google-Smtp-Source: APXvYqyGSiGdSAmsXXKnq8RVKBnS1kB6S5lGdw6Kig/uvh2AfRjkamh+pAqft6X0+E4hq6p5rB/LNQ==
X-Received: by 2002:a1c:d10b:: with SMTP id i11mr3912257wmg.8.1568206386936;
        Wed, 11 Sep 2019 05:53:06 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id r18sm23973412wrx.36.2019.09.11.05.53.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Sep 2019 05:53:06 -0700 (PDT)
Message-ID: <5d78ee32.1c69fb81.5577c.2369@mx.google.com>
Date:   Wed, 11 Sep 2019 05:53:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc7-77-gab4a85534c3e
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: devel
Subject: linusw/devel boot: 49 boots: 0 failed,
 49 passed (v5.3-rc7-77-gab4a85534c3e)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 49 boots: 0 failed, 49 passed (v5.3-rc7-77-gab4a85534c3e)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.3-rc7-77-gab4a85534c3e/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.3-rc7-77-gab4a85534c3e/

Tree: linusw
Branch: devel
Git Describe: v5.3-rc7-77-gab4a85534c3e
Git Commit: ab4a85534c3ee67e9f54d3d5dda6e36072fbed89
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 43 unique boards, 15 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
