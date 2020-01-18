Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78DCB14176D
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Jan 2020 13:09:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727144AbgARMJY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 18 Jan 2020 07:09:24 -0500
Received: from mail-wr1-f51.google.com ([209.85.221.51]:41665 "EHLO
        mail-wr1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727118AbgARMJY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 18 Jan 2020 07:09:24 -0500
Received: by mail-wr1-f51.google.com with SMTP id c9so25102424wrw.8
        for <linux-gpio@vger.kernel.org>; Sat, 18 Jan 2020 04:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ChQDxj+qO45UCl2KPCj56ezgcfEk9gz8SRBOdzJRzg4=;
        b=WVv1UonYhe89Ljza1CM9vc/I2apfY2F/eNO4IjA31MjCW5MdOGPFvrgTamO9+CKwKQ
         igpg7cnLTNu5jIOq0ongIZeoyNEWFg30BWKU5frJA+QxdhshEoqnXpXPK7NDBucnC/+X
         BRezBqs0saJED1pk4aRvWXCOcL44d8hWoIj0Fhtd+aNmxpao2HiLF1sKP3dFv8K5Z596
         7KBISmSKoxwu7PtgjBidNQP179HmrP79aplZbgmVF96VLlc57JUphFgU/G5xicnR3WlK
         HSnhpML7I6D3GK62a4ciDwAD6dMMD0hjuzv8px7pFpUy++jZ8S8yb7sOZjRRlOvX9N/c
         /gBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ChQDxj+qO45UCl2KPCj56ezgcfEk9gz8SRBOdzJRzg4=;
        b=b36zhktkrGeTRX2emrcjAsrZfEYntxS84IB+bH4znYQtyECexpq24iYfKTO58zd54Y
         u3owABZQavEzU0/Hjj/egVP5384tVuFt58bC1/LoqbMhRHspiLmn3YjfgmENO7/fTGZr
         awJtfJ5q/ahgnAtW0DAAZdRsoJkLvMOJdla6LBoyZ/77XC5S4EjOc8tdk/fHHMmzbHCV
         us82bmgUMpn1qRbhJBqU78Kh/vyZqqb207DfYYIE4hNzLyze3uLplQEMqsvSW8qMbVOD
         HsKFpkiZ4dbIiK475KvmKA6T7zRt5qCOfRQnGqxA4L7BuRuYfvrenBlS39efGiLO/qCV
         5QgA==
X-Gm-Message-State: APjAAAWnBpqYRLhaSE4YijjSQZE6nDwnI04pks4vD5nDWz35wNHQAsZk
        YgREPdaC+uEUGbC7kcMNBqGs5mGr4ZfWZw==
X-Google-Smtp-Source: APXvYqzZZSJKPLoC9lZHxh1zVN+uxB1UoNHmtBmnruKTsJ8PPalwrTVQyFf1scDUkzzxxjoWY4925g==
X-Received: by 2002:adf:f3cc:: with SMTP id g12mr7972402wrp.236.1579349361970;
        Sat, 18 Jan 2020 04:09:21 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id n16sm39024007wro.88.2020.01.18.04.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2020 04:09:21 -0800 (PST)
Message-ID: <5e22f571.1c69fb81.e161c.e55f@mx.google.com>
Date:   Sat, 18 Jan 2020 04:09:21 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: gpio-v5.5-4
Subject: linusw/fixes boot: 59 boots: 0 failed, 59 passed (gpio-v5.5-4)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes boot: 59 boots: 0 failed, 59 passed (gpio-v5.5-4)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/gpio-v5.5-4/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/g=
pio-v5.5-4/

Tree: linusw
Branch: fixes
Git Describe: gpio-v5.5-4
Git Commit: a564ac35d60564dd5b509e32afdc04e7aafee40e
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 51 unique boards, 15 SoC families, 3 builds out of 5

---
For more info write to <info@kernelci.org>
