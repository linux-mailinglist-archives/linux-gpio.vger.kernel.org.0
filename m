Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75A5A14176C
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Jan 2020 13:09:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729030AbgARMJA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 18 Jan 2020 07:09:00 -0500
Received: from mail-wr1-f49.google.com ([209.85.221.49]:39117 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727118AbgARMJA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 18 Jan 2020 07:09:00 -0500
Received: by mail-wr1-f49.google.com with SMTP id y11so25101830wrt.6
        for <linux-gpio@vger.kernel.org>; Sat, 18 Jan 2020 04:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=nmlHR8RNK2xFw0h5rg11i2wyqmWptJsCeij48SkHgLc=;
        b=opw88X94JhQjOF0srMptAZI62oRKRxp0P+xWpJvY/RYaPr2+DEcp3wH9YgXf1wbzFF
         wxEnPBAydjOP2kjb9w+R9urzywKVwxG7VuzlqClIJD+T/KlFP9brcjC+bSj0gqt7yg//
         0KgVE3csBXl7qXRYUM067xpbMiDjKO8UD5aGSspe0mg0Cbww+vX81FSnaUdz1q0EdCq+
         12qe+5+z93MXOW6fw2xH7xymwlTu2ErgrZWD9erjmPZ0yzmH9W4PjBdfx3QGZn243C7g
         5gZDMea6FECUL8VM44vL23ZqlKoaaZXT6OLY5YUJmbKc0ICE3NHoYsVLmYvFuVKH9u5f
         G6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=nmlHR8RNK2xFw0h5rg11i2wyqmWptJsCeij48SkHgLc=;
        b=RQKR3Jdu+03dKMHUmddPuzp9Bzl8wAGE7iR/MNMnHrEw1vyxm4eE7GgCe2kqGKeOqi
         Zf6chkKH3XDE4uI+KQ18S9sahx2DjIasixuIswO4DA3mvTcdBEY2F1YdGjb511X9tlos
         DoOQIM/TtvqdqUA+C3Cl6cWNvHRBsg9m2/GPXq9laPpfAOXFYbneOn7YdpqRZy6/5JLw
         Ujo9q2jNj5DwV6DeXRv6uL2DHcZAKRrFFv+vRcAbBfN9pcF3xSjigiKrIYpxDyr44tFh
         vD0vSmcJQe5v1fI7eJpssMN7yMlYgcgAAVmTkA++W672HHxh0lM4qhL9Tzn7B2BegE8n
         T6Gw==
X-Gm-Message-State: APjAAAXGPLbCYMAsfNjpSL/J1612yvUf/ObB7WAHkXQRM0UK+z8Hvh+h
        sliXFpS565k2MkrpL+YbdxSumoW4N49I6Q==
X-Google-Smtp-Source: APXvYqx944xZ5RZ0J7xbFPZqGeXErMcu19W0WMH/6CMwAn4dP8otfi5yHDALoFEW2D+xc6qexYJEug==
X-Received: by 2002:a5d:4204:: with SMTP id n4mr8109105wrq.123.1579349338574;
        Sat, 18 Jan 2020 04:08:58 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id p17sm53506wmk.30.2020.01.18.04.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2020 04:08:58 -0800 (PST)
Message-ID: <5e22f55a.1c69fb81.c911c.035e@mx.google.com>
Date:   Sat, 18 Jan 2020 04:08:58 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: gpio-v5.5-4-45-gd18fddff061d
Subject: linusw/for-next boot: 58 boots: 2 failed,
 56 passed (gpio-v5.5-4-45-gd18fddff061d)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 58 boots: 2 failed, 56 passed (gpio-v5.5-4-45-gd18fdd=
ff061d)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/gpio-v5.5-4-45-gd18fddff061d/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/gpio-v5.5-4-45-gd18fddff061d/

Tree: linusw
Branch: for-next
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

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s805x-p241: 1 failed lab
            meson-gxm-q200: 1 failed lab

---
For more info write to <info@kernelci.org>
