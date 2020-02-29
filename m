Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 186431748C4
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Feb 2020 19:50:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727209AbgB2Suc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Feb 2020 13:50:32 -0500
Received: from mail-pl1-f175.google.com ([209.85.214.175]:39593 "EHLO
        mail-pl1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727177AbgB2Suc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Feb 2020 13:50:32 -0500
Received: by mail-pl1-f175.google.com with SMTP id g6so2558575plp.6
        for <linux-gpio@vger.kernel.org>; Sat, 29 Feb 2020 10:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=G+5g8RqPCvSasYC5z75z3noM/LyQAVU5APcVHe+/s2U=;
        b=IDCbZkUDdGIXYuvoRSxzVkug9PcIUoyegS+MXr2q5YjtHkthzs1I7Y07Dj+CooIMGn
         8zrHUy06hXRZG0ijsX05EhjOXWQ5j1v2j2kgEv8D5Q1yDNtza1Sjqcj78hbsS5EZMs2b
         oGqjKgVplLEn4pd+yNj2D6SErywnEJ9MnHFCwDrwF5zATGtd4JJKd1Axm9ZNdYCKqXPl
         V9byj9o1Y9YScccA8FX6oJmxefdyruantnk+gKwKoZfU/aQDwuYFug9WhV1stNQ0erhs
         sQXPBx+hkPuWCjk6VIVjps+NdorJyyjeJO/l+YRp6GqIfdF8zJgCveezlISabBLxe9KC
         WYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=G+5g8RqPCvSasYC5z75z3noM/LyQAVU5APcVHe+/s2U=;
        b=jeUnrvvrtFj9gQKv0sky2u76rztgpiMaQbPn4BgfVdzFaqcN86rEsK0GyfjI5SYgQP
         BWEwKrSQk+l24iAXuLB9GAsmcagUb7LLEXAJX98NetBUQgOq4JcsGSZZkUEeEfS6hofk
         bElClMakPAqYuONSQiUqrja8q4a4s1fXPtAn7VcSAhU6dQ0DMUU55fgsId9kNHsG6+ru
         wFBnAKtyRW88hV2QlMSnzJQlNuJKj0OLK0zg5PD3YwlYC0Z1W0i83vlCIfkEdDPkK9BO
         /jBaqHuJeLMMrA9iC82Hr3VOARFyW/uRJEdjQ1MGwkGQb/okH5A8ph+Tqvn17iQICcpJ
         0kDw==
X-Gm-Message-State: APjAAAWz6pT9ZYHms0APyYpOg5cDnVh5ckmG7u/GiDtAUAQCDdWBP/mV
        zd47VJ8nPGLls2SoeJE+36b3iGqsbUc=
X-Google-Smtp-Source: APXvYqxBKhptnSjTQdy3VXmNaQyCHjv548k5kwgXVxClLkl8sE//0lEVw+O8qrvt9P5EYP8X7wGh6Q==
X-Received: by 2002:a17:90a:5d88:: with SMTP id t8mr11168632pji.120.1583002231169;
        Sat, 29 Feb 2020 10:50:31 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c19sm16775557pfc.144.2020.02.29.10.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Feb 2020 10:50:30 -0800 (PST)
Message-ID: <5e5ab276.1c69fb81.4743c.a99c@mx.google.com>
Date:   Sat, 29 Feb 2020 10:50:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Kernel: v5.6-rc1-20-g869233f81337
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: linusw
Subject: linusw/devel boot: 30 boots: 0 failed,
 30 passed (v5.6-rc1-20-g869233f81337)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 30 boots: 0 failed, 30 passed (v5.6-rc1-20-g869233f81337)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.6-rc1-20-g869233f81337/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.6-rc1-20-g869233f81337/

Tree: linusw
Branch: devel
Git Describe: v5.6-rc1-20-g869233f81337
Git Commit: 869233f81337bfb33c79f1e7539147d52c0ba383
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 27 unique boards, 8 SoC families, 2 builds out of 6

---
For more info write to <info@kernelci.org>
