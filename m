Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED432163A50
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2020 03:37:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727187AbgBSChJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 21:37:09 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44012 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726964AbgBSChJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 21:37:09 -0500
Received: by mail-pg1-f195.google.com with SMTP id u12so11577799pgb.10
        for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2020 18:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=bVZplLa5BSUPw/U9KX3whffbX3vZaqcAy+Is6KEPLR8=;
        b=wVgnQvBeg9eQsYbTTABg85o2gNpGuQ9CzDYg7me02SIfa809DZQt5cs3RZGY8nHsSm
         SBsqbWgu/7R4SMsuHUEYTwIMbUjvWqIgQvn1fWPh9hZqNAmxar6KA8pH/U1Vfq3s06kl
         47eGwzaE7r45Kb55j6VvAKIl4JtD6/oKZBpQuKrCw5lTJFBTibrE/+7O5TxNwv+cXdgT
         0JQg6rb4ShBClb+9J1ZoYIIkIMTtCbKfZgFl0qfgzMH9an2AEUv+tTzy39HT4e4ryUS7
         3O2n9ROwsZcylKgaPgOlkddVEnlh1F3/5vwDHHznzOjna7hWlaTt2s0BKIrTKA7IlOLc
         qqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=bVZplLa5BSUPw/U9KX3whffbX3vZaqcAy+Is6KEPLR8=;
        b=Jm4YtwPvlzAe648WwkfupoFl2IzkeEm30QEESZd+FrRm/sau9PaQP+hhNTqWRrug6Y
         n0Zq7UykYNRsm7yoMTi62OfrOPbr1NK8EDdW2W6/Cwmwh5o/1oNhoZpQca7N1UyrqaQm
         y6wJ0X63VN23suiiHPN44oS6unX7pHRil9FIq6Pw7RBT3pw6PxLTHmjxmIrGXjytoOGc
         HZftb+SVmLE+Ye/mAzsSD161H8973GuMPR1tT3e27Tl/GHFUs7+vIfUIwXfs6CddzAoz
         HKGGYqIqflou4v5qovUIECMU0lbTA9stCf9LucSu8EdPG38HmyDO4wzyFxeRQy3v8m/5
         HOSw==
X-Gm-Message-State: APjAAAVqxZRLdodgRK0G+l69N4PJyXqc6IfnA5hMC+O7KweUWLL24J/3
        K22JOtJGBUrdMm4qdIAPwGncPIfz/SsWnA==
X-Google-Smtp-Source: APXvYqxQDHTAdNeEn4HBRFaZ7imLcejvnxRnQylgWipoe8kH0ncNeWdRvC13NDO0kee9EdU2sbgSYA==
X-Received: by 2002:a62:7c96:: with SMTP id x144mr25403272pfc.7.1582079828252;
        Tue, 18 Feb 2020 18:37:08 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f3sm353713pfg.115.2020.02.18.18.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 18:37:07 -0800 (PST)
Message-ID: <5e4c9f53.1c69fb81.767fc.1ffd@mx.google.com>
Date:   Tue, 18 Feb 2020 18:37:07 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: gpio-v5.6-2-13-g53803ecac78b
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next boot: 60 boots: 1 failed,
 59 passed (gpio-v5.6-2-13-g53803ecac78b)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 60 boots: 1 failed, 59 passed (gpio-v5.6-2-13-g53803e=
cac78b)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/gpio-v5.6-2-13-g53803ecac78b/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/gpio-v5.6-2-13-g53803ecac78b/

Tree: linusw
Branch: for-next
Git Describe: gpio-v5.6-2-13-g53803ecac78b
Git Commit: 53803ecac78bbabfdd65f5cb789e46660fa63900
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 52 unique boards, 15 SoC families, 3 builds out of 5

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 2 days (last pass: gpio-v5.5-4-4=
5-gd18fddff061d - first fail: v5.6-rc1-12-g612e35e76ec8)

arm64:

    defconfig:
        gcc-8:
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: v5.6-rc1-12-g612e35e76e=
c8)

Boot Failure Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

---
For more info write to <info@kernelci.org>
