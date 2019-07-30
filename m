Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD6A479F55
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 05:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732541AbfG3DBI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jul 2019 23:01:08 -0400
Received: from mail-wr1-f53.google.com ([209.85.221.53]:42307 "EHLO
        mail-wr1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732535AbfG3DBI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jul 2019 23:01:08 -0400
Received: by mail-wr1-f53.google.com with SMTP id x1so14088905wrr.9
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jul 2019 20:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+wTqiWXBdvDTPKV90U39mv5R/WUqLVcVKEJgnm6mRhU=;
        b=yh3g08nZhuNZFBPKroYNuGT47IovmYHp3yLPe9F0z47IYom+MBFN47ryoClf+Geeie
         kNZXeuyaSi+6DbcBsWEQ5WmHikwX+9AK0v/1mfp9SqKhX3GSe4y4aue54i9TkSb6TphD
         ZVy/L8WOZM2V+rb2E3xszKm9uMFl9CaSHVozwGdjCqqk9z+iBCrw8MiW0vSryAPwiOpU
         4ANtDlqhiSyWVopsVi8hBSkWJDxZs+1wyjkdXTsyuwYD9KV7QK9otF3n/tcQIMkdg16e
         89J4pTuDOe68zZ24STuWLwpvbsuNuC/wNx6OW0eX+9QNxWieBZWy6BsngB4UkG/WfyfS
         spzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+wTqiWXBdvDTPKV90U39mv5R/WUqLVcVKEJgnm6mRhU=;
        b=YLwzGeTLhd9jVhhfyzwizhN5WQ80EIHSEzP7YA3HkvjZFinkKnfff86OQGg49BG7Q3
         3C0Bk+ndS+lBPowcWu78xKmZzUE75J2q4qg5qv6ELZ9PKVm+Dr6WI5ggXrYCpyflPFRO
         xvWdhHtrGB2aC2mSRTqylvA6Zr5H9cpW8Fjo0p6qA2b0+KLORTvGpUh68UirSBoYLzRw
         RT/wWaWv/fRUWyZ616F3Ob3UsLMZgBUNRyGUj1GidChe7DfnB3mtus/oU6vXKVOKSSfS
         R56Fc2i8/tNqmTF3UQHUyZxhMSbZWlq9JZEEh9jzkOfDP2YV0l1WsLTMuTJCgkiBavpB
         DyQQ==
X-Gm-Message-State: APjAAAUfMVdodIZNGZZ9/F4JU9usqKNqPfRaJr0ax3IHrJYBE2IIiQFR
        ctMdemgOH0eqeMOFe8aYDzr15yGfYCg=
X-Google-Smtp-Source: APXvYqzapVbOPOqEMi0xcTDF5j/uiM9IQvegRA1P//tJxe1Hzby+HALKp3AB+4QPgjQR9Rot+0M8Tg==
X-Received: by 2002:a5d:53c1:: with SMTP id a1mr21608799wrw.185.1564455666884;
        Mon, 29 Jul 2019 20:01:06 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id u186sm112659393wmu.26.2019.07.29.20.01.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 20:01:05 -0700 (PDT)
Message-ID: <5d3fb2f1.1c69fb81.d5363.d4e8@mx.google.com>
Date:   Mon, 29 Jul 2019 20:01:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.3-rc1-4-gd95da993383c
X-Kernelci-Branch: fixes
X-Kernelci-Report-Type: boot
Subject: linusw/fixes boot: 37 boots: 2 failed,
 35 passed (v5.3-rc1-4-gd95da993383c)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes boot: 37 boots: 2 failed, 35 passed (v5.3-rc1-4-gd95da993383c)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/v5.3-rc1-4-gd95da993383c/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.3-rc1-4-gd95da993383c/

Tree: linusw
Branch: fixes
Git Describe: v5.3-rc1-4-gd95da993383c
Git Commit: d95da993383c78f7efd25957ba3af23af4b1c613
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 27 unique boards, 13 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-mhart: new failure (last pass: v5.2-10813-g88785b7fa74a)
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: v5.2-rc6-1-gfbbf145a0e0=
a)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

---
For more info write to <info@kernelci.org>
