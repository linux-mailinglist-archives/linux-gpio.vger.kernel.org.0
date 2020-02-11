Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D7E9158DA3
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2020 12:42:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728404AbgBKLmy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Feb 2020 06:42:54 -0500
Received: from mail-wr1-f54.google.com ([209.85.221.54]:37526 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727770AbgBKLmy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Feb 2020 06:42:54 -0500
Received: by mail-wr1-f54.google.com with SMTP id w15so11970671wru.4
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2020 03:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=exSn8WNvgHPesIF/yc0M7WmUAFrVtryJkS+KCveJ7zo=;
        b=f6rgL7EV8ILFaW+segWJ62iKAtZSz755VORm4qNMs1LoKFoU7eTegOmMf/sutGczZ0
         Gv3fUwL7bte2N9kdaFH+AagFV0ZLq1lXfNebJZepU0XZQdPnNEdfSzpfn95tB+a8Def8
         CsVCJxKWqKBBfyMk5jQrtlttOIOsRHA9HLguXO2sdO4XjjBD/zEgTPMhj572awQQ2ISv
         nWcCOihJsdB+CbopDkD5wUDLoFPU1Zg96x5m9fFRlWo6yyk/CgJnYtb1E2ycwDfQtg8k
         v6/9sziiMLV5xzj31aYaC9GjYCvvE7RdZGz/biwN79SX8vGbTPbQ6eoez0GYoce2r+Pp
         GaEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=exSn8WNvgHPesIF/yc0M7WmUAFrVtryJkS+KCveJ7zo=;
        b=T+1S6PQPOtGtqFZ/LzCeBeM7FeKoJFNBkKQbieysivt5xNa5ZLxWpx2TX4OIFk8Zuk
         qo0ZdyrsB6zvVEq7ODlaOJccQqN6AW01JJwWeeU7cojTHiit0lh0v8ab40MFHNH6QrQZ
         AAvsydwLaKbYILx/QFpNdDPW4GxF6VTZweGSjGpfEA5+hI+rYlKHwThpy/XmeO35zV9p
         2LjjDz0hzPhvzMfuzP6hqbLkJUYZ7slYyshbMijDXWKmB7IKsaAOFw+Yo1PCfqFAO8Ub
         bIPcugmLF/imgjuYjE3IrQSGx7SY93v1IC4JUhSO9rhQHrwvcuQTNoIyS5knVZTLYtJf
         oL4g==
X-Gm-Message-State: APjAAAWr/uH9PTYMDf+5WuqHSh2ISHLdrxvJMsc80No6fDoqgSRRdAwb
        fJcAwoXEZ3tJ8KsETXgxqSmZlnYq+6hYCw==
X-Google-Smtp-Source: APXvYqwBOJUQaOomde9A5b6THnS9/ZVRr5o2M7/U7zjFbBLIkHxKt32Ppa6G1DWAHr4MpXiuPQI8Wg==
X-Received: by 2002:adf:b7c2:: with SMTP id t2mr8187355wre.269.1581421371895;
        Tue, 11 Feb 2020 03:42:51 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 133sm3624784wmd.5.2020.02.11.03.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 03:42:51 -0800 (PST)
Message-ID: <5e42933b.1c69fb81.3690e.0029@mx.google.com>
Date:   Tue, 11 Feb 2020 03:42:51 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.6-rc1-1-g046e14afb356
Subject: linusw/devel boot: 19 boots: 0 failed,
 19 passed (v5.6-rc1-1-g046e14afb356)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 19 boots: 0 failed, 19 passed (v5.6-rc1-1-g046e14afb356)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.6-rc1-1-g046e14afb356/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.6-rc1-1-g046e14afb356/

Tree: linusw
Branch: devel
Git Describe: v5.6-rc1-1-g046e14afb356
Git Commit: 046e14afb3561523efd0047c35c20793ae5f8848
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 19 unique boards, 9 SoC families, 3 builds out of 4

---
For more info write to <info@kernelci.org>
