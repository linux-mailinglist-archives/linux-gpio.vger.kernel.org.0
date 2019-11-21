Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C61CC104B0F
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 08:12:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbfKUHL7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 02:11:59 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44112 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726230AbfKUHL6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 02:11:58 -0500
Received: by mail-lf1-f68.google.com with SMTP id v201so663218lfa.11
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2019 23:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=C8kRodRL8XSmhyVZocIedEzxOc9YWRiTUdGRplCklx8=;
        b=br53oIpbhWMQuSOBZ85hloBwEXKLJa6ayX8pjCUt5ja0k5GVVkZPsX4Sg0buNDkSnl
         cYYKZaQ6Kg9yIs8i5OS8bzspp4023qzP8y3BtUdKZKZkdK1paYt2ZeHc6taGagwEWZP2
         Kh5FC+xlQNXxwZf1bRlzQqoS7Rhs+j/iqLAU5kQMQ+Ta46YaNv4EMzkmIIEeB1TbgVJn
         Os6J01kqT+WreZVH53NTfc2EV6PtgaCcCpPDo4Tmxaz2Ys0YDdVNL3dbrqI/GVODO9NR
         ULZPQLtfRv22prhV0EdyQBeWJ9kVlQ9EG2XVL/0eUe/SF01OFoZhQZ1zOYFLyFmZKGF5
         0xaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=C8kRodRL8XSmhyVZocIedEzxOc9YWRiTUdGRplCklx8=;
        b=GCRJpyutEDLd5GNaSb+8M1ewILUoqepVOxdfavucFdL9upG8E3kaIBm6EnlzxDS8mA
         a/B2Wc+nf1AOnPqgQli5U5RSkmmwh8oYaNCZD6MU5+uBvWovS0PR86DyGxvZ0LNdRKcK
         nkuGDWZJcMNYFDYx9iukHW4hHuE7IPKwHa5ryoi6Sc3PTdtLp5+N5ry9r0THuBOzDMKB
         XVzi5z1nxfDsNriK1fhvFhhosDNnofCdjsM0h6jX/UWGYj99TM8QGrugX+84Pnrhh1N/
         qTojqBD0Y+aONax043Pz4eKOl5CiXhNjUQNCectVk16+4F3pBLkkrEq7BfVJz8WcpYJM
         cdkQ==
X-Gm-Message-State: APjAAAWirkckuNn/bcy8KQnMOfeZAlAkX3SMan8z4wQSnsn0l4LlcDj2
        HNmwYztqW0W9vf9iKiLoOPykhw6QUYZiLxLTrVD5SQ==
X-Google-Smtp-Source: APXvYqyNFkF/zk17TtnoDXV2+D0NUTf4ixhVv9c3tjT5yI5EgRyIj8a9Gf/3mBaaFZML6AdzHBAZfMhU2TypEvDE2Yw=
X-Received: by 2002:ac2:4a8f:: with SMTP id l15mr6156904lfp.5.1574320314719;
 Wed, 20 Nov 2019 23:11:54 -0800 (PST)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Nov 2019 08:11:43 +0100
Message-ID: <CACRpkdbfVvxAUEeGApGx7jhagkOrNY7_G=ch4kzUE5YCD_N3ZA@mail.gmail.com>
Subject: [GIT PULL] GPIO fixes for v5.4
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Laura Abbott <labbott@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

a last set of small fixes for GPIO, this cycle was quite busy.

Details in the signed tag, please pull it in!

Yours,
Linus Walleij

The following changes since commit 31f4f5b495a62c9a8b15b1c3581acd5efeb9af8c:

  Linux 5.4-rc7 (2019-11-10 16:17:15 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.4-5

for you to fetch changes up to cbdaa5e7bd90db9980ff6187baea9d49fc4de960:

  Merge tag 'gpio-v5.4-rc8-fixes-for-linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into fixes
(2019-11-13 22:58:01 +0100)

----------------------------------------------------------------
GPIO fixes for v5.4:

- Fix debounce delays on the MAX77620 GPIO expander
- Use the correct unit for debounce times on the BD70528 GPIO expander
- Get proper deps for parallel builds of the GPIO tools
- Add a specific ACPI quirk for the Terra Pad 1061

----------------------------------------------------------------
Hans de Goede (1):
      gpiolib: acpi: Add Terra Pad 1061 to the run_edge_events_on_boot_blacklist

Laura Abbott (1):
      tools: gpio: Correctly add make dependencies for gpio_utils

Linus Walleij (1):
      Merge tag 'gpio-v5.4-rc8-fixes-for-linus' of
git://git.kernel.org/.../brgl/linux into fixes

Thierry Reding (2):
      gpio: max77620: Fixup debounce delays
      gpio: bd70528: Use correct unit for debounce times

 drivers/gpio/gpio-bd70528.c  |  6 +++---
 drivers/gpio/gpio-max77620.c |  6 +++---
 drivers/gpio/gpiolib-acpi.c  | 17 +++++++++++++++++
 tools/gpio/Build             |  1 +
 tools/gpio/Makefile          | 10 +++++++---
 5 files changed, 31 insertions(+), 9 deletions(-)
