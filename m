Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 083FAD3789
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2019 04:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727515AbfJKCa1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Oct 2019 22:30:27 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50203 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbfJKCa1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Oct 2019 22:30:27 -0400
Received: by mail-wm1-f65.google.com with SMTP id 5so8799106wmg.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2019 19:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=l3yNYrJidiJcsY2Tekd2PsLn6wBqVAo7E1ON7fFqI9A=;
        b=RJVmA09mOiCYt09GCiOCFe/swePvF/wYw89BVKDu9N+B0ROWMJCgB973x9BzxyxBR7
         mgwMtJs4nms2tUDc8edY1D4cv9tdhazyeTdr5mOzhF/+z3d3tACFv3eQSsyk9P8mshsv
         YQ9uOGyPqPMTxBo/VIIxBPlhLepsUC14CKAtNp/yD+W/A6IaCdWl4k3gvroVAWoNXa6n
         OJaQ41tL283kXWGTztLPyqATGcJ8lcyrLvyHrp9l8gNWop+0+Z+VZQP3HCBDtWE4GMUY
         ONYqlV7NCXsGJ9mnOuPFow4oKf0oC3kiOZhls4jDg1z8SC1LSYbzVsXEm2UqT2W4z+6a
         n3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=l3yNYrJidiJcsY2Tekd2PsLn6wBqVAo7E1ON7fFqI9A=;
        b=fUepiKU6+SWihrDgmIJiX4KuncHiWw6jOZ1gL1+/s+1PR/+AiHR171hM8iD86oDg8W
         m+5Exk2JbXDE7xdsCulZBthWE6C9xZWPUhayUOAWbbOhX1+wpJ4aFem/mBvtHOE/eTJ5
         1oFW3dJBpa6gp46dkC3eaHKN7N1RgmT7uZbr2aaL7rKOSa1vnoCaDMz5P/U4tihR/kbd
         gWyUtAS65fU97s/ZVDRQEIB4ls+TKlmu2258teSTCWjd7o1rkdN8+Oi9Xke6IlYQ4Kml
         aQHLkPIVewbkZ3si3lInwgEfRrtT9QWC+msHm8OMjkctg2ePhg0bIoV3xbAGalFlsN10
         eCZg==
X-Gm-Message-State: APjAAAUJf2Lxu6ZeUBYbXndsoY3K0UZ74GAlUzfZstOKeVfBceEf3mye
        lqRIgaW96ZmarLZ6zOda8HYSLTSCrwoZRw==
X-Google-Smtp-Source: APXvYqwaYHVp/FwTpKWrytzRxYlnx+M2inFjSt2kAxdxATxqh6UZ28qY0yIBkyrgzbd/pXO2X0tU5g==
X-Received: by 2002:a1c:f31a:: with SMTP id q26mr1165579wmq.68.1570761024726;
        Thu, 10 Oct 2019 19:30:24 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id n1sm10768816wrg.67.2019.10.10.19.30.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Oct 2019 19:30:24 -0700 (PDT)
Message-ID: <5d9fe940.1c69fb81.68255.51a5@mx.google.com>
Date:   Thu, 10 Oct 2019 19:30:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: gpio-v5.4-2-7-gb70471b8a438
X-Kernelci-Tree: linusw
X-Kernelci-Branch: fixes
Subject: linusw/fixes boot: 50 boots: 0 failed,
 50 passed (gpio-v5.4-2-7-gb70471b8a438)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes boot: 50 boots: 0 failed, 50 passed (gpio-v5.4-2-7-gb70471b8a4=
38)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/gpio-v5.4-2-7-gb70471b8a438/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/g=
pio-v5.4-2-7-gb70471b8a438/

Tree: linusw
Branch: fixes
Git Describe: gpio-v5.4-2-7-gb70471b8a438
Git Commit: b70471b8a4382ced9424d39ff57db88c9e616707
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 45 unique boards, 14 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
