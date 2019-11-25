Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A94C108E1B
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2019 13:41:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727487AbfKYMlI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Nov 2019 07:41:08 -0500
Received: from mail-wm1-f51.google.com ([209.85.128.51]:55507 "EHLO
        mail-wm1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725916AbfKYMlH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Nov 2019 07:41:07 -0500
Received: by mail-wm1-f51.google.com with SMTP id b11so15258347wmb.5
        for <linux-gpio@vger.kernel.org>; Mon, 25 Nov 2019 04:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=EQC/jK53tDNjZ255r51fL8Qp3aEKLgdd0PaQKUXAUM4=;
        b=NHgnW5QHk+STUqoU6PErNgQv+z503ookW+svbdtciKN5mqibgy3weUOFcWChYF/V+U
         VekXIVTSy79BBt2wl4kkF3NaGQHHlr5trvLoEDGN+gB+5WECYEVDaLAUagQYUOORhKN8
         hOXGH//EoAoYjv4h1pjaajV1PqaZ+nVSAz5k2Iixeqgkncmcdt1697vga4JkXIWQiGXC
         yiTWVs8hpQpYXwwpSQMvu/7fhG6bh8aycJDn5mqADM10AzFcRt5l0Q6rvyCesM8vIQUB
         o13r3XRWTZPwfdO6eeKGzryDiMWMbcaYm5djtBy2U4ztwW3wj8XO8eDaU+auS8ptBA3k
         Mekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=EQC/jK53tDNjZ255r51fL8Qp3aEKLgdd0PaQKUXAUM4=;
        b=bdzlHJsEiexCJTYZNxhQYcZhK+Q9yuaiVyCfs7vQc4grIjMRx5IjFWUcb7KhOPGtHm
         xjBgtkqc4J2rYE46UBNyfZKUbQtBpM5yBiXWWajpGPb1KcMX3yJhu/9O8tlUrrtTda+9
         i2aFgMjHPfuhOUO/PrzOjWRJkRceXRvr0ZtlH5xaMVfuPLxDi1cxhdhOI8sxA4fthX+D
         CMqCegLhPLX9/Xgc+bHzobdbdvFpLjKXXzmEoMX10IR073yTsrll9BV7r6STeZhT7Ejh
         nKPp4BdCY0LWU+zzRmhZcUaTLsWl7VJjyASGPhI04T9H7ccnJAS8Zw/clAFVPA+yAdGi
         ud3g==
X-Gm-Message-State: APjAAAXS6V6ETBLxURfhFMv8IAVmrMCGiAiM2NrkeZYQROiFrj0kgJzQ
        bkspOftJGbkhKCw6y5S0QiPMi09R6qpomw==
X-Google-Smtp-Source: APXvYqwQ+x7htACJJWOh6btPe2xb0AilVsvwFF7MC3ptl8kZ0y0cdkGDtjyJ+/5hzNttMMGz+fv2ZQ==
X-Received: by 2002:a05:600c:295:: with SMTP id 21mr27843716wmk.43.1574685666048;
        Mon, 25 Nov 2019 04:41:06 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id y8sm7998080wmi.9.2019.11.25.04.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 04:41:05 -0800 (PST)
Message-ID: <5ddbcbe1.1c69fb81.720f.8008@mx.google.com>
Date:   Mon, 25 Nov 2019 04:41:05 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.4-rc6-133-g41c4616bb81f
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
X-Kernelci-Report-Type: boot
Subject: linusw/for-next boot: 52 boots: 0 failed,
 51 passed with 1 untried/unknown (v5.4-rc6-133-g41c4616bb81f)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 52 boots: 0 failed, 51 passed with 1 untried/unknown =
(v5.4-rc6-133-g41c4616bb81f)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.4-rc6-133-g41c4616bb81f/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.4-rc6-133-g41c4616bb81f/

Tree: linusw
Branch: for-next
Git Describe: v5.4-rc6-133-g41c4616bb81f
Git Commit: 41c4616bb81ff9b2efd981453f2c5d8f57d0c0b8
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 42 unique boards, 14 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s905d-p230:
              lab-baylibre: failing since 3 days (last pass: v5.4-rc7-124-g=
d0d9531e38a6 - first fail: gpio-v5.4-5-120-gac72719b626f)

---
For more info write to <info@kernelci.org>
