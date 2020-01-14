Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E487E139F97
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2020 03:44:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729094AbgANCov (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jan 2020 21:44:51 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36660 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728802AbgANCou (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jan 2020 21:44:50 -0500
Received: by mail-wr1-f65.google.com with SMTP id z3so10654999wru.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jan 2020 18:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6vp7kU68gHGdFDAccrmO1IySAeaL9Qal3wwWUXKZNG8=;
        b=Inv+Akz1p2dkp+VGs/LZOq96JbcD4xlKd5H4TNWOLhXv8a75KdmEocLXedhCUF5cgW
         NaY1Xjox+IXKQYTt34/zr7wkF31UTAg6RkuInZOfAOsyrWoz6vf/UOD3fBCL4VSHxnYh
         oOthXQk6RAwuiqQEsZh9CDFyh+BFCj6NmeI6dLpgQ4U/6rZRUV5TwsfRN/WkgQ2kpwFo
         OZEual0kbue3xw6iFUm4fHU6rtULaBioNdMxSs4CGR3FweUwZbLPRNpqO+F2/AZ/Gcd2
         gn42b2WOh9IpPyb4kkAPIujwr9Q/LaOlsjtPd6zbBvFBuen4qFtFgKHEGFhTQocuS+ef
         fchw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6vp7kU68gHGdFDAccrmO1IySAeaL9Qal3wwWUXKZNG8=;
        b=LOA6MqOolGFbEQ7RySL1LgVdqlqczm18VE3HRzGBsTR2zBcsHRlRyXZO5/d1ATcXND
         y6uD7f1lRYRnmtrXzYPbbyD5A39cjCtMgACGOfONU4xVko1p9DX1soGzIb3vBANkxrzP
         HgF2jTgk5f7R1GdFEVb6+bsqLTRNzPJZwGyMxBo5Ags22C2PYRs2Day1C0NB0IEzV0Io
         seHIz52z+ECUBwVClhyad0oo/9yjuH1GEy00su+6y2Yb5UOzQS9Ge6H4wNP+sD7LR4pR
         2R4BUwoWkoHdWrsj3uTthSw0aofHALG60HxQPZQe62YPZlEVluS8PIh0EnUUrN7wUm57
         PpoA==
X-Gm-Message-State: APjAAAWL0qPMLXqMFrWkjwapxTLmWZ+GRJ63zGg7OMRgBBqVupIYIgvS
        DBKH5MNCT3Hm7Xa2gjnsQJrgcf1NvLESVg==
X-Google-Smtp-Source: APXvYqzfQyxsy6qQGaYkgtRnMtkipdfX++LOCNFZPyioKjLEBUmKXnOq0nrqDovVWU2HAbF/YHkP+g==
X-Received: by 2002:a5d:610a:: with SMTP id v10mr22609111wrt.267.1578969888746;
        Mon, 13 Jan 2020 18:44:48 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id z21sm16166782wml.5.2020.01.13.18.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 18:44:48 -0800 (PST)
Message-ID: <5e1d2b20.1c69fb81.31170.4c8a@mx.google.com>
Date:   Mon, 13 Jan 2020 18:44:48 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.5-rc1-30-gb0d126e1d64e
Subject: linusw/devel boot: 54 boots: 0 failed,
 53 passed with 1 conflict (v5.5-rc1-30-gb0d126e1d64e)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 54 boots: 0 failed, 53 passed with 1 conflict (v5.5-rc1-=
30-gb0d126e1d64e)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.5-rc1-30-gb0d126e1d64e/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.5-rc1-30-gb0d126e1d64e/

Tree: linusw
Branch: devel
Git Describe: v5.5-rc1-30-gb0d126e1d64e
Git Commit: b0d126e1d64e76f165dc9ce6a4b02497c48053fb
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 46 unique boards, 14 SoC families, 3 builds out of 5

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig:
        imx6q-sabrelite:
            lab-collabora: FAIL (gcc-8)
            lab-baylibre: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
