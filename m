Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D9CA82AB3
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2019 07:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731540AbfHFFKd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Aug 2019 01:10:33 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43525 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725798AbfHFFKd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Aug 2019 01:10:33 -0400
Received: by mail-wr1-f68.google.com with SMTP id p13so11907398wru.10
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 22:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=44eGCp49XjUDx99oQdif3+tz1vRdRrYLGVPalsa9A6k=;
        b=GEGNJeMC/DPS/liFtApseAb8HUITHZAdQQAKDFRNRUiOeC+2zrtubcbfX81RuBJv/j
         fCvc/VRMcvURtyyDB38uyJ9y+WJNZto2I4HtGD41WeZq8Y4iJ3kOFPcYpRqJG+Xc1Xtg
         6DJ+A5/kW1DhJL1GEbdTFTJyxnnwIVqhO5seW9WRcsZepPvNtRIL1JTw+hf4do6+cLOt
         zC7vXKe11PHnGqc7TxCAMkYGQ0y5T7xugA6AdA1XFSBDQLA8640s8W2HgxRJJcCcSopt
         j6nR8ntToe/XQydOLzFZ8SpyH20aKSQ2FjEIgepxevsayIixSfpvzUOUEzNhtbzjMaq5
         f1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=44eGCp49XjUDx99oQdif3+tz1vRdRrYLGVPalsa9A6k=;
        b=hmBMv3v0LRexxhHiNJzc8ISalt9dJziqPWHTjx3etpTZ9VSkA9PCxh9MZN5aLGCwPM
         ybXRsjU8vEwN/0O/26azU/4+1DyEaRsFPpvAA9Qr5JpOUVQG2xllDNVGX9kC1zEH3O86
         0t/yO0jZF/Z68wYCceni4WWDl5TOePpp3JDi7Zz1bpk50gqqabzKhEpjLUBxTcpBo5W0
         8q+HD317ZD0VKANgoIEK+QTNuagtjTr0x/uT5gS6CWACYur+iNtt105892zOwfABB5tg
         ql60k/wbpTqVmd+BwYGaAB8Pq5a1B8gsb4MaCbq4b54xu/murhX10UOmTXfQwPvLlzpU
         TEew==
X-Gm-Message-State: APjAAAV8kG6GJSLqJjB6OzovYUDnQ9NFtY2ar1y2ApEVzB2E5idlWGOo
        ysvaAUYhG6c4VhKqF8zt4J6ZIc5dUyFQXw==
X-Google-Smtp-Source: APXvYqz5yDLS4b1CM5hxOvtme8x3zwoiul1eksizxYucDrSwkdaeVY+hnErX8U8XDxNSj/0g5GbRBA==
X-Received: by 2002:adf:e84a:: with SMTP id d10mr1877782wrn.316.1565068231096;
        Mon, 05 Aug 2019 22:10:31 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id u186sm165060083wmu.26.2019.08.05.22.10.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 22:10:30 -0700 (PDT)
Message-ID: <5d490bc6.1c69fb81.d5363.c123@mx.google.com>
Date:   Mon, 05 Aug 2019 22:10:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: gpio-v5.3-3-18-g52d4cb72f265
X-Kernelci-Branch: for-next
X-Kernelci-Report-Type: boot
Subject: linusw/for-next boot: 41 boots: 1 failed,
 39 passed with 1 untried/unknown (gpio-v5.3-3-18-g52d4cb72f265)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 41 boots: 1 failed, 39 passed with 1 untried/unknown =
(gpio-v5.3-3-18-g52d4cb72f265)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/gpio-v5.3-3-18-g52d4cb72f265/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/gpio-v5.3-3-18-g52d4cb72f265/

Tree: linusw
Branch: for-next
Git Describe: gpio-v5.3-3-18-g52d4cb72f265
Git Commit: 52d4cb72f26530572a9a1377ba8427d0203b76e6
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 30 unique boards, 13 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: v5.3-rc1-13-gfb9152b494=
a9)

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-mhart: failing since 7 days (last pass: v5.2-10813-g88785=
b7fa74a - first fail: v5.3-rc1-10-gd2a561ae1961)

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab

---
For more info write to <info@kernelci.org>
