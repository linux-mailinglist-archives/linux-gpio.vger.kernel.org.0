Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92E5316B111
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2020 21:43:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727168AbgBXUnS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Feb 2020 15:43:18 -0500
Received: from mail-pf1-f171.google.com ([209.85.210.171]:43587 "EHLO
        mail-pf1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726722AbgBXUnS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Feb 2020 15:43:18 -0500
Received: by mail-pf1-f171.google.com with SMTP id s1so5942509pfh.10
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2020 12:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Q3ZeSw+1HFQOBdU1gSyduVig4nAWaAmOg1Bn9pArjLc=;
        b=UDcjMQ0qAp+gScSHRmjSp2Dxepdp5lDxXhWdcOBnNqcUwCGIecRWO1WeKTR3SvztrA
         x0w8nSFRNt3l1NMG3uJuENZkiha7CVIJSxBt26AMeohkbcznIBVayfumfByPdr3THWDq
         TzqzmFD/aBdn7dnbRWIPf+o9ntUCZmDyHdDYxmUXavvMIbUM6aO9iEC0HeFFEeOOfkC2
         Ljl94zQ1ZsIlTY3LAlXyw57C4LTMqdbYxdLe7nsnYRSfq7yTIW+gMsrFrQlPloTHTdvD
         nGzh1+JFhoOmmHkamFthtKrp/5WfDb+HIcM2ZohDJe8KbJ2xbw/uMm23qZIrBYrTxYUA
         VetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Q3ZeSw+1HFQOBdU1gSyduVig4nAWaAmOg1Bn9pArjLc=;
        b=ZG/zvJC0CMvAhoqYZpLbrTLEZC8xXgoyXA5NcGBNDbeSEl8SPleXjhAbSMc7H0y3NF
         WJT0z9NflcMj8xBQbZYAyJFg4fHoQwL70YheKmTKbYtPI1OD7J3UU6aBfFztONrmaf1S
         UW4YD9d8+q+PVo9lziihbSb7FfZrGES+0QgP0W35VB0yOKeqNTY3xoYHv2MJJcCxcTuN
         fBm6diSobbPAp2gqRrfylGpc3LDogXy3lwSJdi3y00RUeGlkmALOf3VGkbQ4r3DQARCD
         uoYM6ANBHYgyuwWLwSPnKvKwwmRew+aIJ+HuRuTj5cPvp+R9FCbZJRuzBAuTyq3OH7TG
         pX8Q==
X-Gm-Message-State: APjAAAVDKFrn43ShSuHeKrbqkW4ntrV6YD6fT50SSdng/bD3ayPKvDgQ
        Myin6DpUkEPC9oyzj60cUQPpOqyuxaI=
X-Google-Smtp-Source: APXvYqxslSr/3Qw+8xb0rxEayZV/aJ7eU4TSoQwnMTa4eSgxMDG6UaAUA6uhs59k88wOgV2HWVk+1w==
X-Received: by 2002:a63:583:: with SMTP id 125mr53496843pgf.100.1582576997552;
        Mon, 24 Feb 2020 12:43:17 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w25sm13749424pfi.106.2020.02.24.12.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 12:43:16 -0800 (PST)
Message-ID: <5e543564.1c69fb81.c39d1.5513@mx.google.com>
Date:   Mon, 24 Feb 2020 12:43:16 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: gpio-v5.6-2-20-gee82ebf16ccb
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next boot: 39 boots: 0 failed,
 39 passed (gpio-v5.6-2-20-gee82ebf16ccb)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 39 boots: 0 failed, 39 passed (gpio-v5.6-2-20-gee82eb=
f16ccb)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/gpio-v5.6-2-20-gee82ebf16ccb/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/gpio-v5.6-2-20-gee82ebf16ccb/

Tree: linusw
Branch: for-next
Git Describe: gpio-v5.6-2-20-gee82ebf16ccb
Git Commit: ee82ebf16ccb97780b02aba6f58cd9b397723a5b
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 39 unique boards, 12 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
