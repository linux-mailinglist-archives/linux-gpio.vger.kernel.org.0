Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DEABC8E52
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2019 18:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbfJBQ0f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Oct 2019 12:26:35 -0400
Received: from mail-wr1-f48.google.com ([209.85.221.48]:46394 "EHLO
        mail-wr1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbfJBQ0f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Oct 2019 12:26:35 -0400
Received: by mail-wr1-f48.google.com with SMTP id o18so20354492wrv.13
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2019 09:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=7Od9M32TPlq3YOf+cfoNbivw/mGmwWWmAwWUgLmyyrE=;
        b=MaLVgjx8WSSXEJ4pMcZs3ZaPTcCinr8MknW6/31LBRb2Edq5UWHQE+yVRiOqqR8x5L
         U7MiCk0dxDkT9cZqEjlVWJtRBEFqUfLsa1v2mwIybD9lAlT1mkBFLQ3Qf27xE8JS77Wt
         kx3FrsplMpWR7ktQJ+XbG/8uW13/pS9cR8DsHOVoTWVbpV8NTwylyBH6r7UcEZgA55XY
         fguNvjFmPfkcDZ2vwaYx39UyNrylm2T/P6YeYr6oFkEf02ULPuILP0ejDDxdyFrZSlNS
         rkYGT0EEmw9rVdWu+QWOo9dsC+0dLNl9HcOPiM4oSUiJskN7vQO7tZ6W/ynskNVxH2ja
         xx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=7Od9M32TPlq3YOf+cfoNbivw/mGmwWWmAwWUgLmyyrE=;
        b=n3WXHAhS2XSqd5drnin1YRRhMCoEAJWy3ingHBBwjJvW2UMmabBGH9IuYxqpMCGnIV
         iQVJ+knBl5HcceWy7ZN400nsa/XGV5thmmzLzuLjUaX9K9IV7aRxu3nBiXdpkHK/VVX/
         3GNE//fN0tqvlyejNq2c2jOlMsaRqZUDIcvoj1ry5gcINOuKUEZXR1YandYUYa1TsZYI
         OCatu7j+TACCFdbyHlo3cPc3zj/w3543dJD6F8H3Sr1OQ7/x9vbQeWjThapojA7bYXVc
         dHhG7bUYH3AX9QzlCQZ27ajUR0cmdjLDNXAmGquxECkGeIwZnGgp8Tlc6XQO/JsgcNp4
         63fg==
X-Gm-Message-State: APjAAAWQVxAPKoVp7ntxxCS8uVzpRxaXUR+jerr22ZLLXuqiwUeIUiV8
        4gKx7Z8Y0e2sIbBqVDyk52bV/fn8Da9l5g==
X-Google-Smtp-Source: APXvYqxxxYxKRxL93bKGWAYOHULyBhlptSufOYi93pG1bc79Kte65Sx4mKoTopX7oXOWWaUZMcFFzQ==
X-Received: by 2002:a5d:618a:: with SMTP id j10mr3313086wru.168.1570033592346;
        Wed, 02 Oct 2019 09:26:32 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id n8sm11242495wma.7.2019.10.02.09.26.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Oct 2019 09:26:31 -0700 (PDT)
Message-ID: <5d94cfb7.1c69fb81.d054c.9c18@mx.google.com>
Date:   Wed, 02 Oct 2019 09:26:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc1-4-gb8cd253a06dc
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
Subject: linusw/fixes boot: 54 boots: 0 failed,
 53 passed with 1 untried/unknown (v5.4-rc1-4-gb8cd253a06dc)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes boot: 54 boots: 0 failed, 53 passed with 1 untried/unknown (v5=
.4-rc1-4-gb8cd253a06dc)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/v5.4-rc1-4-gb8cd253a06dc/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.4-rc1-4-gb8cd253a06dc/

Tree: linusw
Branch: fixes
Git Describe: v5.4-rc1-4-gb8cd253a06dc
Git Commit: b8cd253a06dc1d06dfed5c0ed1ec886e1706d3fe
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 44 unique boards, 12 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          am335x-boneblack:
              lab-drue: new failure (last pass: v5.3-rc6)

---
For more info write to <info@kernelci.org>
