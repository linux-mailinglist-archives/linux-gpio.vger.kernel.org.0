Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57BAFE2757
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2019 02:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392822AbfJXAYg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Oct 2019 20:24:36 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41239 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392153AbfJXAYg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Oct 2019 20:24:36 -0400
Received: by mail-wr1-f65.google.com with SMTP id p4so23965028wrm.8
        for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2019 17:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Ep0ySInQEZmIC0e8w0ranwBVwwdkzK/aUPZVCBsTEgk=;
        b=AGwSn3nbDilpUFIl70XzbTXP3c9wEpRmNaqH+JFTsFDgwGtci8jJAr3zG1voGrfYEB
         OnkKJytmXl9YdBAXzgEfPA8wdxMwdqee9CaxhNs0hL8f0z4jcWw/osoYVOaIoLwsuAm5
         H4npvnRHqrBAKTgT8RVFinFiiXAM579vJY6zBJvVRz8WyJy5YqsKBDEBxxn7tHGH7ALd
         bz841uosbx90cPH3fvup/NcOaX7i0x/F39XABmrORpvOUvbrBDIUiNNpRK0SPDZ3Bg1r
         gAmoL+tCtDkkEp7Pslf5PUBV1MoqQmuXZh8VDOHKutqFuP0woNHW20XC3GZ+Ll3VB93o
         +D6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Ep0ySInQEZmIC0e8w0ranwBVwwdkzK/aUPZVCBsTEgk=;
        b=pOdORyjEUlsuhF85szBPYy5Xrll0oR9TcFosRxwuMYL6yjHgTLqzofFP/vA5b+tB7z
         Q3lTx0rp/mMKuH47r41MhxznVtI+CNSbwbAFkU3kcqRyMjKyXa9soMsIY6qIsdJ25LLk
         eJ22+5zgRxERvfCqguMQJ4d2vemnPDMDUb23i/22ZE58xOI/np8lX7v+BGZv7obQAW9S
         NvNpJ2MDotRGUu+/Rqa2pX1PZj3XoQTfjRKQD77R7NpxK1tJlg0Pczh9MtEhTpnTKsZI
         QRuUCh2CzOU+yfCQVY6z3kNyZjrw1fT/kvYfhiDKSU0s0SF1kteWiNc/SnjmI6369Mj9
         hnEA==
X-Gm-Message-State: APjAAAUbIe+LfPoPJNgvsDjuCl503EfierSZqdIMIiUDML+WR+I05Q8S
        GwDAH50wIVB3ZxK4Jnf7k7nrFro6DJRgng==
X-Google-Smtp-Source: APXvYqwapssgCF3WwqfW5XqhXG/XcEtD8n1A9y/Qs2J6Mnzo+w8RnQvKlXzHYOiA8MKm+ctCxh+LTQ==
X-Received: by 2002:a05:6000:1252:: with SMTP id j18mr1120395wrx.23.1571876672320;
        Wed, 23 Oct 2019 17:24:32 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id u1sm34194461wru.90.2019.10.23.17.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2019 17:24:31 -0700 (PDT)
Message-ID: <5db0ef3f.1c69fb81.f3321.d580@mx.google.com>
Date:   Wed, 23 Oct 2019 17:24:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc1-25-gfe12e94375da
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel boot: 34 boots: 0 failed,
 32 passed with 2 untried/unknown (v5.4-rc1-25-gfe12e94375da)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 34 boots: 0 failed, 32 passed with 2 untried/unknown (v5=
.4-rc1-25-gfe12e94375da)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.4-rc1-25-gfe12e94375da/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.4-rc1-25-gfe12e94375da/

Tree: linusw
Branch: devel
Git Describe: v5.4-rc1-25-gfe12e94375da
Git Commit: fe12e94375da34d62f7d5556161ce7629212ff80
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 32 unique boards, 12 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: v5.4-rc1-12-g698b8eeaed=
72)

---
For more info write to <info@kernelci.org>
