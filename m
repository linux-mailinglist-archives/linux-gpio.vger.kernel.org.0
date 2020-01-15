Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 661EC13CD5F
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2020 20:45:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbgAOTpi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jan 2020 14:45:38 -0500
Received: from mail-wm1-f48.google.com ([209.85.128.48]:53714 "EHLO
        mail-wm1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbgAOTpi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jan 2020 14:45:38 -0500
Received: by mail-wm1-f48.google.com with SMTP id m24so1259190wmc.3
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2020 11:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=hRmqR3GW0D1pIwgXGZN472K/ivWWF/MQFjT2WZ4jtYA=;
        b=fLFxxnJigWioSA4J0PGP6CpttCUPJGnQ0/GF6OcG/2+YUUwSBvCm4xT8YFe0/VHQHF
         DdUoLeUb8mMHp6srERAPCYe8BWBhhLaMeD23037/hyYB+P8p9p8fUd6RIIVPJZyEiwbI
         9QdNb2WAf3/u7yf1v8Y8NvBp137DlrJzkeLs6FNfLGym8OXhVfoG7ADgS4XMAB/hI+Xo
         rc7Ca08RMAXAJBkuS3dmbxw2GrHG0GzWSQEshlNAG1JVbMcIbONnvCSV01DTFhy4AzlI
         2+BkqKpPAt9jiicYS3v1I0eMgb2ieTTz4PQf3BdfleFnUJOD1ApnIqGosvJRfyV0+F9m
         vrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=hRmqR3GW0D1pIwgXGZN472K/ivWWF/MQFjT2WZ4jtYA=;
        b=PeAKZ3zfjhT3faTo8h+YvoHY2vkXnLGFgyGdwUMwDwSj/PE2ghSQbwTBVJwOid4SUZ
         u9nIz3gtI3iGxmTwkciVH5l7hpDnfIotM5CsBgZ6cqlZ1oRvc6Src7zIUgyzmRujjVJD
         0vpCJfaoT6IX74vBNwAONdNHg2wd3YAoGgNIoDNr3/gI6gA+zu4KNFj/X8mNbrv9uqnE
         Azy63nww45LdhGZ13z2yZs/Db6u8DggEBTXJAArAiPyWuQPD2I94k6fiS3HHRe3KvM+B
         eyvB6tvNciBcBrV6t1MvvmBNzZ+Pr2enMKf2FFtu3zHnL6TXI4S5lw1krS7f3wHXvWnE
         8VyA==
X-Gm-Message-State: APjAAAXcr1EB+PRjdZ//DeHVqMRaThji2LHku969iJYUFePl78RuV77B
        83E9tOKtZKkxozHuy8ekh02WOB0zy6EWYQ==
X-Google-Smtp-Source: APXvYqxWcLC1XJyaiuGDJutIWmhZBCfjXopMoGAm9U89ulUk/A8bjfW77feOBwSZmz5bc9DkaHXeEw==
X-Received: by 2002:a1c:6485:: with SMTP id y127mr1720610wmb.11.1579117536487;
        Wed, 15 Jan 2020 11:45:36 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id i10sm26420838wru.16.2020.01.15.11.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 11:45:35 -0800 (PST)
Message-ID: <5e1f6bdf.1c69fb81.48768.ef7f@mx.google.com>
Date:   Wed, 15 Jan 2020 11:45:35 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.5-rc6-4-g7a9f4460f74d
Subject: linusw/fixes boot: 54 boots: 0 failed,
 52 passed with 2 untried/unknown (v5.5-rc6-4-g7a9f4460f74d)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes boot: 54 boots: 0 failed, 52 passed with 2 untried/unknown (v5=
.5-rc6-4-g7a9f4460f74d)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/v5.5-rc6-4-g7a9f4460f74d/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.5-rc6-4-g7a9f4460f74d/

Tree: linusw
Branch: fixes
Git Describe: v5.5-rc6-4-g7a9f4460f74d
Git Commit: 7a9f4460f74d705014aaab1900be688d20c75909
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 46 unique boards, 13 SoC families, 3 builds out of 5

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          r8a7795-salvator-x:
              lab-baylibre: new failure (last pass: v5.5-rc4-6-gaa23ca3d98f=
7)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: v5.5-rc4-6-gaa23ca3d98f=
7)

---
For more info write to <info@kernelci.org>
