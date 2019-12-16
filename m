Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A66E612062A
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 13:47:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727641AbfLPMrb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 07:47:31 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39266 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727605AbfLPMrb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 07:47:31 -0500
Received: by mail-wm1-f65.google.com with SMTP id b72so4519177wme.4
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2019 04:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=FrpERIvZJcRHgCfHOuSE8lURa3YIk7XJ1DhNc+zCnFY=;
        b=eGEsanV5Iz4X7KVRdZj4+EgbeSc1rz4b6jupcEiYsTynFgcU08FeBc3dBMPkKbx49M
         fYadTSoVaqO/Yv1/K9T6muL8UWxy5eE/d4Rd/JWe722NwFDGRPeKEYQkwAjr/vHvTE6N
         yd+lDG995ONUhmbSWrMuoRi2qtSSoB26vG18KhnEGPdMoMyxZcOxMi9ho5nzFwQx39HA
         diHUlQvnAIq35TNbC8+NT13zB+h8oS8Ogxx/ANAZFU6FaAFEQJII2ww0QrBS7XXiwMyg
         J925L7RRqHt0DtXD8s+AUJcCAfTd58kQAfLB0/AJGd+k75MF2CEaaiwKHz+QaTJIY3sF
         gQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=FrpERIvZJcRHgCfHOuSE8lURa3YIk7XJ1DhNc+zCnFY=;
        b=YQKkbIzWmsabRrxw5YU/jQ6OsjlVX4hKh9TzoFS7erdbbfMoOr1LHso3kjufue0L3a
         kRnQmajKIFI+wu04q4m+7QO9v0MMd0qavDPTG7b3J2Yb1CB/t7Wo9PrKlF5Ir5hUtiGj
         J04PWLoGM8NndmCXt9aiHzxKRkM/b2PJXaFsCdJISN1VEQs0zDw+GmFgYPi+2+A2xjFL
         i+QCYQsNPKavCAKWR1NQ9A21x+ifQMaf8rf5Baw0J5nVjihObnNnu7uIVgWbEhTQnOh1
         GZg3bydnBeeJRdG5AJbmP+OBpyZsv9/pnMzRqLekO4cIe3TXm0BdUZuUYDg0GFWSPIqt
         3XFw==
X-Gm-Message-State: APjAAAXh1VQJT5ePHKSWiKlt3BPY8YYBGZE3JTvvenDiGBAgB2IqBjfD
        M43eLwFf/vcY0n7sAsL0Ro3dtfyjtFo=
X-Google-Smtp-Source: APXvYqxMaTvzJhoVg4G0ucsUqTS85h6zLgOyKtIxekY+aCYV9qb20nvZ1K/lcrIkQUiQv2ZdmK28Zg==
X-Received: by 2002:a1c:7205:: with SMTP id n5mr31227092wmc.9.1576500449411;
        Mon, 16 Dec 2019 04:47:29 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id o1sm22036795wrn.84.2019.12.16.04.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 04:47:28 -0800 (PST)
Message-ID: <5df77ce0.1c69fb81.19108.0d13@mx.google.com>
Date:   Mon, 16 Dec 2019 04:47:28 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.5-rc1-10-g3ae42ab1a87b
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel boot: 37 boots: 0 failed,
 36 passed with 1 conflict (v5.5-rc1-10-g3ae42ab1a87b)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 37 boots: 0 failed, 36 passed with 1 conflict (v5.5-rc1-=
10-g3ae42ab1a87b)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.5-rc1-10-g3ae42ab1a87b/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.5-rc1-10-g3ae42ab1a87b/

Tree: linusw
Branch: devel
Git Describe: v5.5-rc1-10-g3ae42ab1a87b
Git Commit: 3ae42ab1a87b8966d53dc0f508c28b18112a18b2
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 35 unique boards, 14 SoC families, 3 builds out of 5

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig:
        imx6q-sabrelite:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
