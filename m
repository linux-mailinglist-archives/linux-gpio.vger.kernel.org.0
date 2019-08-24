Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C60159B93D
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2019 02:01:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbfHXAB0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Aug 2019 20:01:26 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37221 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbfHXABZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Aug 2019 20:01:25 -0400
Received: by mail-wm1-f65.google.com with SMTP id d16so10582984wme.2
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2019 17:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=HeiSmcWKI/yFAebw4JuLlMoSWj9hzaMyR/25vkyY2/k=;
        b=jNKdOhYbI/xuJNpftfabH0gvMHdsv/ia4Sb88SfUH2lyjZKHE5G91g/ZDr5cI6OOEw
         liORx4ScSp4HiZhgMnFxvpC1oOpNevP/wM6XDiqHGlA3PFCwDm9IesGr1gh7K6LPKci1
         dgtT30hZl49nw4M9ZazveSDbod2NK5/rW2cpSnS+EP7b6q7wqfufO/dRL1pZ0cul9Ov4
         B5lWvJm4nzjtbLBRbe/5AM5zkCJW3GVUo1z3fTu6C0q9jcYdpGLJ7nR8bmHf4rc8xLoE
         gmhQI6PkzI08URRIIiEJgy781bekapkbUsxtKOOUozGM4IdnURUCPjl6YkAeFIxG1nL4
         DkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=HeiSmcWKI/yFAebw4JuLlMoSWj9hzaMyR/25vkyY2/k=;
        b=M3nccw7ZoeOfjc5+pWhXdm6ejbfHok0AeaVs8XLXYmuWiDwOik6+ZrSTOQVqI0ZoGt
         rt5RemlyUT9x10Ocq9U/dX2F6HnUvV81offPwJn4ja7QW+cqj2dNm49CMc59uBrvjKiI
         fH5f6fn1gIrFXLLsxaB45iMG35TFA8aI1BAd1a3sU5pTASVWqsxrTA0e8LA8e4V2yXDr
         XH3laRYFw69z2kM95huZTRrRNaPIk8giZYb+JlUq4cU/sTWMM46syqfzTB6DWe2ZIBxX
         jTlfdlvC+VdrmgTIuW7JMH36v1pJSsoNWVSrpe4Q9aumX98/4ucpGAL65TxJe1MKs3HB
         Y4bA==
X-Gm-Message-State: APjAAAXkljCrL03lxDh7gGBveOeVvsozZw55eK4r7VBl31Nuul/TtXpo
        hSzpPVFa+GuDhGTg5go2a2D55FCwrJX8bg==
X-Google-Smtp-Source: APXvYqx6cFAvgpu2nMgYcURfzgqxo7cBgxqw0dIEeizj+nBnSiv+XQSouwbI1kFn8aShuhMAcYxpfw==
X-Received: by 2002:a1c:1a56:: with SMTP id a83mr7773757wma.44.1566604883836;
        Fri, 23 Aug 2019 17:01:23 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id c9sm3001338wrv.40.2019.08.23.17.01.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Aug 2019 17:01:22 -0700 (PDT)
Message-ID: <5d607e52.1c69fb81.f10df.cda8@mx.google.com>
Date:   Fri, 23 Aug 2019 17:01:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc1-47-g9ed7ccefcb30
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: devel
Subject: linusw/devel boot: 53 boots: 1 failed,
 52 passed (v5.3-rc1-47-g9ed7ccefcb30)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 53 boots: 1 failed, 52 passed (v5.3-rc1-47-g9ed7ccefcb30)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.3-rc1-47-g9ed7ccefcb30/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.3-rc1-47-g9ed7ccefcb30/

Tree: linusw
Branch: devel
Git Describe: v5.3-rc1-47-g9ed7ccefcb30
Git Commit: 9ed7ccefcb306fb61e27b4b74aca1ed29656c572
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 35 unique boards, 15 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-mhart: failing since 24 days (last pass: v5.2-10808-g9637=
d517347e - first fail: v5.3-rc1-5-ga299726da44f)

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab

---
For more info write to <info@kernelci.org>
