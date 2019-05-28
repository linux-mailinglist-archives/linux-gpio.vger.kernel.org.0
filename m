Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1150B2C174
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2019 10:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbfE1IgD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 May 2019 04:36:03 -0400
Received: from mail-lf1-f54.google.com ([209.85.167.54]:39494 "EHLO
        mail-lf1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbfE1IgD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 May 2019 04:36:03 -0400
Received: by mail-lf1-f54.google.com with SMTP id f1so13869402lfl.6
        for <linux-gpio@vger.kernel.org>; Tue, 28 May 2019 01:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=yGBH/lxqvHqFsz6lRGVsYKarIndIu7K0cDIDuNE2kEY=;
        b=t8uXHE6Eo71XN5/0LfAnQJtdKF1DZJ01TSP2KuemN6aimlNbT+poh/sKFvxx+3276L
         80YxslLoq+o3FUz74jqdIMmxWifsmK/YeEMy6Sbjg9IkVsKaznht0/F98iHNIX4hX9vv
         sI5RLy7rwzQGqMUJOzmqqUn7ZM4s3PddrgMuFrvoho9zBe09ezHdZ2ETNQylB+poX0b7
         s4b3YSR4b3myJ/Bv+gfWa34/JVQ37ZnES6bSxmAX/l4JNzyLNTh7LUQOzsVax5+de8bF
         XX+GNG6ljzUkqg5cJyBe0LoLaCOU5cCGnVlRhvwE2UPmga0kPSavydiZU4iQtfb/90En
         oAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=yGBH/lxqvHqFsz6lRGVsYKarIndIu7K0cDIDuNE2kEY=;
        b=SDdbumh09MSXAvmYMYp5s2KEAmlfio+V5hiJdKYcdGbSnCQ+Z2atOjhTVnwGRIVK0F
         mcRY4Vlz+uimXoBcvmTtPzfG1NNDJO4dOxQdvnuJ/TsYmPSKdmdulmTgPS2t2haueWJW
         QG8MPUPYwgJU+ceq6rWnX6pcc3Pd/UwTmySuBF+toG4Xxp7w++PFQz6/FHwJv4xQs4St
         69uHdk6HGtj7O6yFi/m/hNp9+b/fVsANfx2iRcWzDc67mq1hfhbLaYtLZwtEZ8vWeP69
         cn5uWyyZzmKs/CCmRRw9FgzLjbEayae0Gmh4wjyGNbU6tLA91HOkqMJYC+DZ58iKmZri
         w9Fw==
X-Gm-Message-State: APjAAAXM/+3VcdGQhoQAEo1tDALVp4v9LHGcIjg5CYCuecghRsSFdloK
        wnioegANGc1Z/yU36MaNVNWRFQ14cwP5/0Bf4tHWKHZ1yUI=
X-Google-Smtp-Source: APXvYqwiAT32MaadcvHafzg2n8U5QdAoTfh/4/HDPVnWQYXPe5SkMEfiCg717aQu4St/JWwcMyxsQXFmcemRcKlMfP8=
X-Received: by 2002:ac2:48ad:: with SMTP id u13mr32586025lfg.60.1559032561919;
 Tue, 28 May 2019 01:36:01 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 May 2019 10:35:50 +0200
Message-ID: <CACRpkdasSjtspciHijdc4mQyNvQVSgYMgsZKaSn+ZSvsev6t0g@mail.gmail.com>
Subject: [GIT PULL] GPIO fixes for v5.2
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

a single GPIO fix for v5.2.

Just a build fix on a fringe driver so not much to say.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.2-2

for you to fetch changes up to e9646f0f5bb62b7d43f0968f39d536cfe7123b53:

  gpio: fix gpio-adp5588 build errors (2019-05-24 11:16:05 +0200)

----------------------------------------------------------------
GPIO fixes for v5.2:
- Fix a build error in gpio-adp5588

----------------------------------------------------------------
Randy Dunlap (1):
      gpio: fix gpio-adp5588 build errors

 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)
