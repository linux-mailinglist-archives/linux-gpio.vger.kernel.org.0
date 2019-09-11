Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4D5AF423
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 04:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbfIKCH7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Sep 2019 22:07:59 -0400
Received: from mail-wm1-f46.google.com ([209.85.128.46]:55609 "EHLO
        mail-wm1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726560AbfIKCH7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Sep 2019 22:07:59 -0400
Received: by mail-wm1-f46.google.com with SMTP id g207so1526752wmg.5
        for <linux-gpio@vger.kernel.org>; Tue, 10 Sep 2019 19:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9RzEi8nrPr8cs0VfOy2GMyp1DNYCzlHCBeFvNVYI8Uk=;
        b=1Pg+AGQibCZh4d5wjs6ZoWsmi/M4K6vyJ+GzDyt3VH7ENR3DE/NfN34FroiMEFAjM/
         GK93CrlcJvto99XARg3tQSmTTbLjeFcovOLpTN8QXe+vHhaP1pv8C2YqGs5PDdHhc41E
         Nzy+f6uj7KgCcAY8ywrSXtdMNvbnJBMy372Xgc3T36imPxfOQ2YfP5DALoVVqx5sFlVf
         sSoJgZo1ZNYLR+hdT2u6UV00paKwN16PKFBU9lAmf1mSokApukpr/6ixthfdqTp6gQbI
         dsbSxLvEz4/IbPI/cfVP7UJvE2n71tXNliHgtcg9kUdXteyvasSDw2jKKWsuCLTl0wNV
         P8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9RzEi8nrPr8cs0VfOy2GMyp1DNYCzlHCBeFvNVYI8Uk=;
        b=Ft1gRwTJJY1yzMk8pCHWN7lxUjFO5u6SYDr67qub+rvrxIqtpNQ8OXqOFz2D2scm8A
         BUlzN4T5LDKFbPT9mMJIui96D6Bha9oBGEgMtj3SDoGoP5ypKos90SJsKJNo65UgSN6P
         X70GF6iUescMVLY5Gkmjc/8/u27rWt5foW3/gbK5xdnDACxSOmuJ6VP15l+aIJYrahTA
         ir3dZWXXJnedaMdA+l1fbwihoF3JxBhwxaX+aDDzs51Bb8FeVuInUxdHtusgXcTZa0xu
         TZNMYy/bFz3h3bV4ehUbfqSYRmVSaeXkxEg3OhnKt9v0jl8FzAlK//nLv+Ma4p2wzf2V
         9PlA==
X-Gm-Message-State: APjAAAURsZaO17vJAls92acszGzAQry9QviESWnPCKXUAFobabvmhGGo
        7SAkcHNLj4XEsdA8xkW99RkJKIE7ydug+A==
X-Google-Smtp-Source: APXvYqwUjHEoqqeulgdkxg3V9LffoYhRggO92uXSDZbLWwNdsRvLQ7rU6z4neSPAFx0G+7d4KaWLnQ==
X-Received: by 2002:a7b:c08d:: with SMTP id r13mr1739660wmh.39.1568167677219;
        Tue, 10 Sep 2019 19:07:57 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f197sm1077317wme.22.2019.09.10.19.07.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Sep 2019 19:07:56 -0700 (PDT)
Message-ID: <5d7856fc.1c69fb81.7125b.55d0@mx.google.com>
Date:   Tue, 10 Sep 2019 19:07:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc7-72-g5fbe5b5883f8
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: devel
Subject: linusw/devel boot: 54 boots: 0 failed,
 54 passed (v5.3-rc7-72-g5fbe5b5883f8)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 54 boots: 0 failed, 54 passed (v5.3-rc7-72-g5fbe5b5883f8)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.3-rc7-72-g5fbe5b5883f8/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.3-rc7-72-g5fbe5b5883f8/

Tree: linusw
Branch: devel
Git Describe: v5.3-rc7-72-g5fbe5b5883f8
Git Commit: 5fbe5b5883f847363ff1b7280e8b1d2980526b8e
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 43 unique boards, 15 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
