Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11E8AB138A
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 19:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387592AbfILR2k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Sep 2019 13:28:40 -0400
Received: from mail-wm1-f43.google.com ([209.85.128.43]:51510 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387586AbfILR2k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Sep 2019 13:28:40 -0400
Received: by mail-wm1-f43.google.com with SMTP id 7so921153wme.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Sep 2019 10:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=LYtMXN3yF5ICrVK6QleYka57GXiWtzFP8xZkuyz8yLY=;
        b=0o0cl7rV+xqGciQJZ6qX0f60jsXbAhvuT2DE4wJoZBy3IaA95UsCFMQLBVN9CVuoLG
         ESIF/qdZiO6iilNCmQbLk8ALU+SYrch3R0w+XzuahtRy/a74+6XIrg4g3qIliHd1O0iy
         PhoMrosFVoFVmDANtt07TmqmrjQ84x/VQbLHU8x57KVxGxpE98lZ6FdKUi8oYlWtHrZq
         JtDreXA4wG4quqWFF10vApRjd2wzOyZMBaZxdOwnYgg+hkfpImlQ/9vvk3niCAiuUsyS
         eZZzH4IjUPZfysrwrPvhoS781Krp4D1B2xITkZcjrrGMjyqMoLW5j1/kE2zL4FRePRnb
         H+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=LYtMXN3yF5ICrVK6QleYka57GXiWtzFP8xZkuyz8yLY=;
        b=I3QfQMAC/9FDEjOeH5QzvuB/cr97mvjPIl/JC8FTevGY7V7qLD+QJuZBnhrkAowgIP
         KjUOinwvuaV3NzIvocnc2LYKE2ni57nbkTRz772KvQh4z9VB+8l9tyJ7RzGF/3vsTbJQ
         eKTztj+Wx9/vbL5rBf2Y+v+HrHC4PpwJeeofZi6lEhCtpKTQRwT+MXmEXCL/4xI6nkY2
         Z3UxY1mWE4dYpj+2Cu8gUl+akO6e7mZkcVOtfae31ajJqEZJ2rQ+QZw3V9ZfGijAMjtF
         dBfCK9CzAjK96TKb82wwFQ21y3bX5ciyyfBQILDCaVF62b2fgiozMT3IPT2S49GRF+Tg
         SUvw==
X-Gm-Message-State: APjAAAVYNlwuOtprGW3cf/kk7F9/dsq6xm7H1hDVHLOQF7Jsh5CtJhso
        XSpzCUen5RHiF0sy3fmh89b+Q0Q4x9RZWA==
X-Google-Smtp-Source: APXvYqyFtP/8eoke9fvLzck9eKmRwM+5Wrm3x0RtBmWk5rHqYWG+Fx638C88n5zHuudL/pLoc93cuw==
X-Received: by 2002:a05:600c:307:: with SMTP id q7mr966474wmd.6.1568309317693;
        Thu, 12 Sep 2019 10:28:37 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id i14sm3790060wra.78.2019.09.12.10.28.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Sep 2019 10:28:37 -0700 (PDT)
Message-ID: <5d7a8045.1c69fb81.f36c0.347f@mx.google.com>
Date:   Thu, 12 Sep 2019 10:28:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc7-85-g11c43bb022b3
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: devel
Subject: linusw/devel boot: 48 boots: 0 failed,
 48 passed (v5.3-rc7-85-g11c43bb022b3)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 48 boots: 0 failed, 48 passed (v5.3-rc7-85-g11c43bb022b3)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.3-rc7-85-g11c43bb022b3/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.3-rc7-85-g11c43bb022b3/

Tree: linusw
Branch: devel
Git Describe: v5.3-rc7-85-g11c43bb022b3
Git Commit: 11c43bb022b373d2fdb84950ebf1911362f3f010
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 42 unique boards, 15 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
