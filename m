Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0B9AD6D31
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2019 04:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbfJOCVu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Oct 2019 22:21:50 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44770 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726430AbfJOCVu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Oct 2019 22:21:50 -0400
Received: by mail-wr1-f68.google.com with SMTP id z9so21780664wrl.11
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2019 19:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=DivloUxzpJwH2bX7CrruBBZsuP8Q/SAPM0/PMck2ErQ=;
        b=T7UrDteIGJ+TS3gbPr9wHfwZZNzXWGMy9U67asvw53Vk3hKkfVpvBRYh8MEiXV5Vsu
         yuQGAhfJydy3OdOLdg++jC3125VSfhzqNYKBGzu69z3e06VAAEvIC7sMu34OTOGrZ+YD
         rfYldejygsse+Mh5G0RlQ4ybKmpqIOhoeZ1yhqEcvNCLoLbRNKWcEIzWk/vHioGqrZ8U
         8lufyfonr6C382rz/6wd6df3XoLeaJws3lyIPyPXoa44au0jVaBqRJfe38yFH1RIytNR
         m28paLYHBxiY/K3rZUDRtxdNU8GLjXtvM0Bqr/OdSY+Vfe1AILxwKgSSgeO4g1WBu3Zq
         Gmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=DivloUxzpJwH2bX7CrruBBZsuP8Q/SAPM0/PMck2ErQ=;
        b=gKmdFgInCYVgBFEhgsNL5gvw2gCFPzhoPH8teiVbsdt3j6l6a+2Caix6K6FOpkirJh
         tOsF4w9h4VULbxf/T57DnRL+Ui5yj1l4Vxkdvewl6uAK1od3vPwBOh/uPCote7JJpiVS
         t7crRcttW4MCqR63Kg0TN0qOYjRQdDsnW9ovk0yQGNJXI7K1j+BK+iebPNhBiw07To6q
         WWcOHI+AaVE8nCRcyH6dw5OrYZyePOEluWOD2y0nnCKFbDNwsXXTfmKwzNflglOsn1xG
         kWpw/zmNJ781EY+FQeqCS0CQiDypA8QMFQWsjpDhB+YOTg0Kd6jp1+6/BW5B9kBjmX//
         HPuQ==
X-Gm-Message-State: APjAAAX+5yzX4acu6QOWNm36deBkRMf6etPTt0DfPmHEMFL1KNAndUWN
        Lo9B0Acm7mKNKWn/Ps+LLLQ64JpCMsTmHQ==
X-Google-Smtp-Source: APXvYqxeP1gS2ZvlXlzLqW+AiUEE5YQr/51AeYx0QMxo8m2ycNYGYg/1H99n8vf4KSuh2E5yOkJBWQ==
X-Received: by 2002:a5d:6745:: with SMTP id l5mr24279797wrw.51.1571106106245;
        Mon, 14 Oct 2019 19:21:46 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f8sm22829606wmb.37.2019.10.14.19.21.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2019 19:21:45 -0700 (PDT)
Message-ID: <5da52d39.1c69fb81.9cc8d.a4e1@mx.google.com>
Date:   Mon, 14 Oct 2019 19:21:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc3-6-g75e99bf5ed8f
Subject: linusw/fixes boot: 33 boots: 1 failed,
 32 passed (v5.4-rc3-6-g75e99bf5ed8f)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes boot: 33 boots: 1 failed, 32 passed (v5.4-rc3-6-g75e99bf5ed8f)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/v5.4-rc3-6-g75e99bf5ed8f/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.4-rc3-6-g75e99bf5ed8f/

Tree: linusw
Branch: fixes
Git Describe: v5.4-rc3-6-g75e99bf5ed8f
Git Commit: 75e99bf5ed8fa74bc80d693d8e0a24eeaa38202b
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 33 unique boards, 11 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: gpio-v5.4-2-7-gb70471b8=
a438)

Boot Failure Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            sun8i-h2-plus-orangepi-r1: 1 failed lab

---
For more info write to <info@kernelci.org>
