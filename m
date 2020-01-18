Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3F01141775
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Jan 2020 13:27:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbgARM1a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 18 Jan 2020 07:27:30 -0500
Received: from mail-wm1-f49.google.com ([209.85.128.49]:32873 "EHLO
        mail-wm1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbgARM1a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 18 Jan 2020 07:27:30 -0500
Received: by mail-wm1-f49.google.com with SMTP id d139so11329352wmd.0
        for <linux-gpio@vger.kernel.org>; Sat, 18 Jan 2020 04:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=r1U+cZtttBdamaYOyTv9rNOZWfLt30q2FDYbnmbtHqA=;
        b=hXhK+UeivKou6GFhUg+qpgYmEJbqyyCf4SSpEL4PCdNI0f9wa9vWO4e9+A1r88MVCj
         4ZqjIlhzAhCOMl0M4V1GihuTZV2RQlBRY7Xt1ZYnQoJapXP2ZcG0NheOJ3DCwiaE7/FE
         1DnM0zZRSAiOdyFw5RKWIsKU9uWGA+h/CVawxjRN3nVSAZVFIiNdFuutdI2WKOA3/LWX
         229+taTH0Qeku121uTSyXY5ijdLi/3uaAjyZt4yRuLOsjyiKzi3bMvJ/+0YzopdNvEL5
         lyfP9EEN/pEk90kYjrVl23/VvOI1oBoUNJQWkMHT+xdth2gi8RI97GDOKl4G2XJvtcTj
         c4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=r1U+cZtttBdamaYOyTv9rNOZWfLt30q2FDYbnmbtHqA=;
        b=TMQl8SGReokuFxykbZy9N1qQ3Y7+XsKuQCLxCL914ky2veDSbHi7gpj62tqnw0k+JU
         /wktJ3g50VWU//AiheCndrX51ucVMrI6OferAoz7voNYPFsgWkXSokMHzk9/+svl32om
         hXSG7ahyWbEFnOU5ZJIdxfk4VqH8aEu4vU/+NcXEqCYiCzXpBKW10fmr8MS7AMbztLE7
         nfCr8QTlCYtA48sRRJ6W5yK8M4zTNBPbk4w5p6gmeEg74TZD/M+7IhMqfn6xJb5492zX
         HHzyVeCEveAoCaHk+ip8dMb6Gi6XtUCvwyWhViqb4yoqxfRBLoNNp8IlT/VD3+r4Cd99
         xmiw==
X-Gm-Message-State: APjAAAVvxCNUrJsGniQdIvYYg+ohNihE3ovO5hbwCHWIj+plSkG9LsoE
        s4m6S4NHy7a7Ec6YmDc+ygL02w6Nd9+oDw==
X-Google-Smtp-Source: APXvYqxPGswYamaSF12VZNJ/E4dZS+3vC9lgNF/nlyPWejU7qWni8vKFLFTgcEXy9Hr/1gIyaxbaEQ==
X-Received: by 2002:a1c:720a:: with SMTP id n10mr9495512wmc.74.1579350448542;
        Sat, 18 Jan 2020 04:27:28 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id r6sm39528012wrq.92.2020.01.18.04.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2020 04:27:28 -0800 (PST)
Message-ID: <5e22f9b0.1c69fb81.70277.0504@mx.google.com>
Date:   Sat, 18 Jan 2020 04:27:28 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: gpio-v5.5-4-45-gd18fddff061d
Subject: linusw/devel boot: 58 boots: 0 failed,
 58 passed (gpio-v5.5-4-45-gd18fddff061d)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 58 boots: 0 failed, 58 passed (gpio-v5.5-4-45-gd18fddff0=
61d)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/gpio-v5.5-4-45-gd18fddff061d/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/g=
pio-v5.5-4-45-gd18fddff061d/

Tree: linusw
Branch: devel
Git Describe: gpio-v5.5-4-45-gd18fddff061d
Git Commit: d18fddff061d2796525e6d4a958cb3d30aed8efd
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 50 unique boards, 15 SoC families, 3 builds out of 5

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: v5.5-rc6-44-g158a4056fd=
63)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: v5.5-rc6-44-g158a4056fd=
63)

---
For more info write to <info@kernelci.org>
