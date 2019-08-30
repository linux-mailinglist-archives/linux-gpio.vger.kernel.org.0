Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44C01A3D4B
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2019 19:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727304AbfH3R4q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Aug 2019 13:56:46 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]:40064 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727904AbfH3R4p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Aug 2019 13:56:45 -0400
Received: by mail-wr1-f50.google.com with SMTP id c3so7822369wrd.7
        for <linux-gpio@vger.kernel.org>; Fri, 30 Aug 2019 10:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=vc+TNPJgxTLLcBMu72DqJADPv5Gwmm2j73ah42gmZIk=;
        b=Hi/vqCdYehzdO/lylk/zZ4IHgDRFsyh3I2ML/zaQas7NYnpdEJ5VpN1kcY3ijaBkoa
         dnjON5NLHhY/hDNz5pDSKsBTXnrfITswTyY4JoaWUy451iF4P8k2+nyAiEq27vXeQzg6
         d0fNhx5Pk0q73QukQ8UmKkNkeDIiVHhSian5u7dSazv4kooVqAMQfuCjFHr5ZqS2S6kC
         SpChuJw+8xei0PcvgDgr2JXNkgHDL8NGXjA5AL/WxjZ69a1uj8lCcw4PSx4p+3eIWIzQ
         EO+onrzXqWXK/CJ15XPKb28HK1w7hTVhBfR0RNzxp7K21d7UcdIciEu2+UNGoG4fQvM+
         QS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=vc+TNPJgxTLLcBMu72DqJADPv5Gwmm2j73ah42gmZIk=;
        b=K7dtuy/DNLoelL9ZNY4OSRSD6n+noINN7s3I9Abud+574boFXjYe1bnD6r2klsEiGl
         sNpsok0QBFCvZh2pC3a7JtyiiGqGEHnNYrgaZZC0RacnEoAIGQaljO+9W4DAJabEDidb
         chpvTIIawc8m7V3hl8HRODpt/v5oXpDsksXvLL3OZiQVJoeE8hshiOGLebFUn4VxzLGd
         FSlUhr/PNH8rPvivoSg2UsenOu1wxX/uqpTL/NL1XCVpsW6zuXUjy7+SU0ZJF8ihb/Q9
         Oon5sX/rJLnFqRUePlykvoozKXr3BDte/zO8uj0WWjjtDwb8X4BJoTTYNh7ztLt2Z12A
         9nLA==
X-Gm-Message-State: APjAAAXEVWS23SJ/jJvIoQIOwPpVlPwQx5tPyUyFrylnh9R8ut5tmhZt
        DGq0dKaDPKWCL8AlvIVKz/t/Wg9Jb6gKtQ==
X-Google-Smtp-Source: APXvYqzkfCWL3a3XUGl/tybiBBNNrroJm1sOSuHZ2Y7ibzTp73CBbOpZJ5xoYn3h5zTDh2eevxCOFw==
X-Received: by 2002:adf:ef49:: with SMTP id c9mr3935516wrp.122.1567187803295;
        Fri, 30 Aug 2019 10:56:43 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id d16sm8287725wrj.47.2019.08.30.10.56.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Aug 2019 10:56:42 -0700 (PDT)
Message-ID: <5d69635a.1c69fb81.8439d.8167@mx.google.com>
Date:   Fri, 30 Aug 2019 10:56:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc1-47-gf6a7053ddcf1
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: devel
Subject: linusw/devel boot: 53 boots: 2 failed,
 51 passed (v5.3-rc1-47-gf6a7053ddcf1)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 53 boots: 2 failed, 51 passed (v5.3-rc1-47-gf6a7053ddcf1)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.3-rc1-47-gf6a7053ddcf1/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.3-rc1-47-gf6a7053ddcf1/

Tree: linusw
Branch: devel
Git Describe: v5.3-rc1-47-gf6a7053ddcf1
Git Commit: f6a7053ddcf1c05c443715d627507f0ab9a0b491
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 41 unique boards, 15 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-mhart: failing since 31 days (last pass: v5.2-10808-g9637=
d517347e - first fail: v5.3-rc1-5-ga299726da44f)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

---
For more info write to <info@kernelci.org>
