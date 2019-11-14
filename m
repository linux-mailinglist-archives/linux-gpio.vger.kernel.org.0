Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B08FFBD65
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2019 02:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbfKNBTG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 20:19:06 -0500
Received: from mail-wm1-f45.google.com ([209.85.128.45]:32900 "EHLO
        mail-wm1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbfKNBTG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 20:19:06 -0500
Received: by mail-wm1-f45.google.com with SMTP id a17so6240538wmb.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2019 17:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=GCsblXGohlygyzxOTwA0JSte0a7YGR1jTNb3Z64rtwg=;
        b=O4BWZbYcNxStEXe19nHisVq9F0Whu4vf98OSw+IGazBeBi6Xy5uer9hPHVKfDHhi0G
         j4uWJAYy5jQ+O1CDo6LKmTgfZxEQIjQ9wfBuRxxeBJZGu+0d5gU2ceOm8EEVPUam0wv9
         GhJom+l1BQs5r90V9ZOHAeThi4nwcb39GjYFOD/ybmfQh9aG/XRsapszfBK23FSc/8g3
         k+234Mi+F9EmtcFDVKH1NTFd/H19i2gemcQZDgeKXJR1fSwBA5SzCtsMBNltDh2ty+0S
         gavrJpWsYljg9pt70NGsky1/ZrkaOOSsvBa2kCsbhvJJHBKLXOgy7HsDLKyknEThFgKJ
         130w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=GCsblXGohlygyzxOTwA0JSte0a7YGR1jTNb3Z64rtwg=;
        b=EvuYhvkdAOP2wNQnvxqxIoP9IgDGtyIy3nKB5zCUQ3ziIFeP0VysqDowziUyupd7dl
         lwcggMxo+3vBXkJWufVPhIRlMjawugEgUFirKQVIPBzRV7U5sj9GDB+c83g/nq5k9mV0
         flettMunsSCHlCYNcbUuqSzRHppvAgX58CilkISKUhsVPQpQMtcPR6zHFCiQs3r0UbTW
         mETSza19V7DqodUioEvtFAZk8Kvxxg8WeOigMPQm/qA1IfJLCvX/6AOg9jtfCN6Eondm
         KaHLYBhTZ14Y+klPMTYVH7AS/PPqWKjmGaWwrzDztIh1yPYEli2m1MHwksu9smKlVgki
         Z9wQ==
X-Gm-Message-State: APjAAAUpRTBcLfFH92z6YokAR4ayNlxTVtcDDs9zAmu18phR8UAkNN92
        c3amvDFT6YoUQyOnizw1CgvNmVwS7xh/PQ==
X-Google-Smtp-Source: APXvYqz4wBjh2OtdLsiEU70YVZbHJzpPop7ji1Hq3KGdxAXSpCxXhefcWrHdfEh8K53nL32Tmh676A==
X-Received: by 2002:a1c:dd06:: with SMTP id u6mr5595621wmg.109.1573694344480;
        Wed, 13 Nov 2019 17:19:04 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id d13sm4657964wrq.51.2019.11.13.17.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 17:19:03 -0800 (PST)
Message-ID: <5dccab87.1c69fb81.40427.6cd2@mx.google.com>
Date:   Wed, 13 Nov 2019 17:19:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc6-123-gb27f300f8cbd
Subject: linusw/devel boot: 48 boots: 0 failed,
 47 passed with 1 untried/unknown (v5.4-rc6-123-gb27f300f8cbd)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 48 boots: 0 failed, 47 passed with 1 untried/unknown (v5=
.4-rc6-123-gb27f300f8cbd)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.4-rc6-123-gb27f300f8cbd/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.4-rc6-123-gb27f300f8cbd/

Tree: linusw
Branch: devel
Git Describe: v5.4-rc6-123-gb27f300f8cbd
Git Commit: b27f300f8cbd11b9298820910df9a7258af2f726
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 39 unique boards, 13 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: v5.4-rc6-39-g61b7805a9b=
25)

---
For more info write to <info@kernelci.org>
