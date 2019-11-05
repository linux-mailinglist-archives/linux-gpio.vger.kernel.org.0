Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC498F0090
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 16:00:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731055AbfKEPAR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 10:00:17 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34748 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730833AbfKEPAR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 10:00:17 -0500
Received: by mail-lj1-f196.google.com with SMTP id 139so22248265ljf.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Nov 2019 07:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=A0J47mNfB1CiTTqNvlw8OxSTbzzjakprFmeLRLsA40w=;
        b=czjbF4bJIIpFdymzD0VYzoU8AvD2Naal63ivkUKSbvvLHhAX+NeBKxzo5cWnvP/leH
         RFJDMJuhX1zKthhaX8prQFTqFCvGtg/1dGGbdlj2jNtfJW8a1+Ku26xHltYt5ZkoUuTw
         JwnZIPr/h51tqKwvNsodT1lTezIP6vShjugsoz4qSE33VssZ2qdHzfQliR1t28vOOaYZ
         W3uoaSdPHACmYDfHzxF99LacPWGQkza713OiEA8IoRUZUvBbaqvzx53VK3Y0qHeVa6lm
         Lm31UNSb3MtccHlbVl1y+zdI8iDPsGL3c6/NFRgW7KG7ePRQQCOtuBghu3e9znZVvtfB
         yisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=A0J47mNfB1CiTTqNvlw8OxSTbzzjakprFmeLRLsA40w=;
        b=iy+55AmeIGma7Jq7Uzd0LH+/YIKFVHqx+xBHKloJjCsXuI806L6AUotdCoE9gXui6F
         4tp6oQL68fsMZg1c/BShUMtMuKSU6/jvdyJZiDsTKpqPfIwxViF/0l9LuWBcjYJwM13N
         TRZ441xO2oIgGh2ZVppl+13SqoL8ja/I0lR7YoEL92MTkmt/ww5BBt78p1n3OCqcm009
         knHDIH43d5OPgm/zdZt7cYlpJbOfuU6Dq+Ck5Zko4kFSCufuUOQ+uglz31SGEhQcEF41
         g673UdTZsFfNw+Fj6DcedxQ1KtdRvxsHA4fhEgH8g3BUMWA4ir2DU3UTs1y3hGjU0u/G
         4n9Q==
X-Gm-Message-State: APjAAAVRX1LnRDxLmg9FWraZ8VWI5TuG1tzku3QT0bC/nIQZLNhZrG/V
        Muy56KwUyWsZAwIuxukJFXrT/GbM7zXxEaRLadzaHVh5GNL9yg==
X-Google-Smtp-Source: APXvYqx2hH3qqZvjxmbSbjmVEkQ3AniK+8AaU1txtZBR2GshkriQsIRZP0d8VSk4GI/32mLIvEISfSEYMnFQfciwvNg=
X-Received: by 2002:a2e:161b:: with SMTP id w27mr23621673ljd.183.1572966015403;
 Tue, 05 Nov 2019 07:00:15 -0800 (PST)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 Nov 2019 16:00:04 +0100
Message-ID: <CACRpkdZrum7MrNCMS9jaLb0OEMEjHu+xZaL9AbsqyLEz+m97YA@mail.gmail.com>
Subject: [GIT PULL] GPIO fixes for v5.4
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

more GPIO fixes! We found a late regression in the Intel
Merrifield driver. Oh well. We fixed it up.

More details in the signed tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 7d194c2100ad2a6dded545887d02754948ca5241:

  Linux 5.4-rc4 (2019-10-20 15:56:22 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.4-4

for you to fetch changes up to 1173c3c28abfc3d7b7665db502280ba9322320e6:

  Revert "gpio: merrifield: Pass irqchip when adding gpiochip"
(2019-11-03 23:41:11 +0100)

----------------------------------------------------------------
GPIO fixes for the v5.4 series:

- Fix a build error in the tools used for kselftest.
- A series of reverts to bring the Intel Merrifield back to
  working. We will likely unrevert the reverts for v5.5
  but we can't have v5.4 broken.

----------------------------------------------------------------
Linus Walleij (4):
      Merge tag 'gpio-v5.4-rc5-fixes-for-linus' of
git://git.kernel.org/.../brgl/linux into fixes
      Revert "gpio: merrifield: Move hardware initialization to callback"
      Revert "gpio: merrifield: Restore use of irq_base"
      Revert "gpio: merrifield: Pass irqchip when adding gpiochip"

Shuah Khan (1):
      tools: gpio: Use !building_out_of_srctree to determine srctree

 drivers/gpio/gpio-merrifield.c | 33 +++++++++++++--------------------
 tools/gpio/Makefile            |  6 +++++-
 2 files changed, 18 insertions(+), 21 deletions(-)
