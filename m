Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43B3819570A
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 13:25:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbgC0MZ4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 08:25:56 -0400
Received: from mail-pl1-f175.google.com ([209.85.214.175]:42129 "EHLO
        mail-pl1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbgC0MZ4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 08:25:56 -0400
Received: by mail-pl1-f175.google.com with SMTP id e1so3385160plt.9
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2020 05:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=vxEu/Va6O0IiYUmx8M7PGHl2xFYx0jN5Sl6NJLSny0c=;
        b=pHQaVdBa9qc8GpDtxG1mGz3gJ5ZtYmtz3IIqwYmMBEEnRzZHJvsilQ27Z3F95bWl+u
         yknzZq7MwDCBLGWIoGQxyi8fXns6AuNLZdddolW0UFLxDoJddGeuEQmgW7q/7IA3yJfF
         Z+nV7FN+jGK5bUSgHeAXO3dh5PZVLVnCK6QSFgvpex2hZ5GR3JvywoJATVW4acCgekuv
         GKK8Pg4oBdXSmx/71y/1uCuofDZ5AYWkLRYR7isrAbrkb4Nsi5zkBIzkYu6agyZ/FR4y
         okX6gPks4BUKxgzujcLzzTi20OVC6pEl5IDXy2Ojyv7fYD3YCbhG+YJcJPyTo3hTktp1
         sX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=vxEu/Va6O0IiYUmx8M7PGHl2xFYx0jN5Sl6NJLSny0c=;
        b=iDAX5+7zZxe01PfiYoeHwwb4tAxosPXFp/gqQm5gWrJBDyF5JDpSOWaoOtLHO9pP2t
         2yjcH16PGNgrbl5r953bc1kgyh04HinPMpM1godQwfMLMXFM+1wMchSEhjyZVhTkTr/G
         wfJTc4G+N5k7zWN+Urtm4xEU5KlQj1nwTU71j9xA6kQUjiWLtWHt/1Qgv9kgdvmWfiYI
         oYSZXhqNbLW4tVEcSRc8Bk/ld2Y2whRSVB7T5UD7guWNfALn5T/Mp4PJhuiqG3GywRqq
         p+CLUkAaDNTg9aOjRNi4KjGAC77k/GjXtBR4EGXU7QwB+Uk3Jy/5WJKLebufsBMRZ/7C
         6eSg==
X-Gm-Message-State: ANhLgQ23a1YLZYPhqwOt2PayZTrgdGvvfgf/J38u1nv8j1SG7qhSDw5b
        B2SSjis4WO902aZcA03D6sZYrkvAN2Y=
X-Google-Smtp-Source: ADFU+vsG7fQLNfOoJ8Fi97wJrbwgzYr/zKt9yUkKwRnhyH4KvYgb85GzPpbDK8TU9iwPgudg4VWVvA==
X-Received: by 2002:a17:90a:c790:: with SMTP id gn16mr5763218pjb.146.1585311954720;
        Fri, 27 Mar 2020 05:25:54 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y28sm4054877pfp.128.2020.03.27.05.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 05:25:53 -0700 (PDT)
Message-ID: <5e7df0d1.1c69fb81.57d0.0d02@mx.google.com>
Date:   Fri, 27 Mar 2020 05:25:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc1-51-gffa91e7ca142
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
Subject: linusw/for-next boot: 43 boots: 0 failed,
 43 passed (v5.6-rc1-51-gffa91e7ca142)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 43 boots: 0 failed, 43 passed (v5.6-rc1-51-gffa91e7ca=
142)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.6-rc1-51-gffa91e7ca142/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.6-rc1-51-gffa91e7ca142/

Tree: linusw
Branch: for-next
Git Describe: v5.6-rc1-51-gffa91e7ca142
Git Commit: ffa91e7ca1426a89eec1b3101286d82785760767
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 43 unique boards, 12 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
