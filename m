Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69FFC1748C3
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Feb 2020 19:48:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727447AbgB2Ssa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Feb 2020 13:48:30 -0500
Received: from mail-pj1-f46.google.com ([209.85.216.46]:52479 "EHLO
        mail-pj1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727177AbgB2Ssa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Feb 2020 13:48:30 -0500
Received: by mail-pj1-f46.google.com with SMTP id ep11so2666337pjb.2
        for <linux-gpio@vger.kernel.org>; Sat, 29 Feb 2020 10:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=c99cBnuhLgxOFO9502AoDhCK9psLTwSj1YIrv6+6kTU=;
        b=s/2HrsaGXLXvc8ZqMbdnyUENONFIDtS24G0r/xAgr2uVXt4v7sK/4SVw5fZebCJvhF
         xqwoVbfX9CFoKbH5qZuAaGMbwX6PhcqKDhceHwQN3+CWO8iwaduFUYsY/Z93FgYtvByo
         7xd+Jx6ZS6PUTSpMvfQ793tWPRDhIGYbjE4Lag+7jizjFEF/R8+iFHWjAn4pJthyx3C2
         238mtqblozWfKXkLYi3kYYmnT0CFg3uwr3CwP1Bw0eNxDYPE7VlXtyjWXD+g0JXFrtRO
         HtGuhBBvxz9dkDMM2nVhPl7uXwaniYaaLxA3aBDPRBSPb7La2cc+aW+T/lIu4terNvGv
         5lnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=c99cBnuhLgxOFO9502AoDhCK9psLTwSj1YIrv6+6kTU=;
        b=FXpiEZNTTX/mFMNgljLSjTBDBvJj4HprM9W9Kj8O5QtvFyhKyBXhqtNCGB081JRQS4
         uHAKf+/Aj/S3YstGuR880bstAOJyOx6rNSiO5vhTc8pxElGquxq7mEBQJbYJpRqfknbH
         HIHE22C4rGqcUk4LVcPr388FOQklEkHVW+mmU5Lcu7XKzQWBtNDb6K7y6xkEyuDcgC7A
         bm521fL3BleaW7+Dunffbfd7iSMxqoJayQDYTB6dkxG6Ku9LTWaXUhpr2KkBWD89mLtX
         tNU2740nocbqzkpVEiiEF5uPH04jupKbQAh/vVUi8zpC7RX/4nTCACfsKe81ynn2TEtj
         tXmQ==
X-Gm-Message-State: APjAAAV1HpwWoaOvjLWtGAhQmOaXLW/X7jINKjNLtKXF2iaDzbIYNMUT
        XrAqOM37ITBIWxOUxoEG6JsLzTL0Igw=
X-Google-Smtp-Source: APXvYqx5ZTYLFzErVNdS/OzXs1Rlbpy3YEvt1eexnTg/lI5ntgzY4K8B+HGEMFAV5oeI/wOor4mzaQ==
X-Received: by 2002:a17:902:fe8a:: with SMTP id x10mr9672649plm.139.1583002109476;
        Sat, 29 Feb 2020 10:48:29 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 13sm15352852pfi.78.2020.02.29.10.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Feb 2020 10:48:28 -0800 (PST)
Message-ID: <5e5ab1fc.1c69fb81.bcc2e.8004@mx.google.com>
Date:   Sat, 29 Feb 2020 10:48:28 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: fixes
X-Kernelci-Kernel: v5.6-rc3
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: linusw
Subject: linusw/fixes boot: 30 boots: 0 failed, 30 passed (v5.6-rc3)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes boot: 30 boots: 0 failed, 30 passed (v5.6-rc3)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/v5.6-rc3/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.6-rc3/

Tree: linusw
Branch: fixes
Git Describe: v5.6-rc3
Git Commit: f8788d86ab28f61f7b46eb6be375f8a726783636
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 27 unique boards, 8 SoC families, 2 builds out of 6

---
For more info write to <info@kernelci.org>
