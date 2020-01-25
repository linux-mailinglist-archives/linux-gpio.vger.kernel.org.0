Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82E921494FB
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jan 2020 11:56:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbgAYK4K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jan 2020 05:56:10 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39759 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbgAYK4K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jan 2020 05:56:10 -0500
Received: by mail-lj1-f193.google.com with SMTP id o11so5471441ljc.6
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jan 2020 02:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=SqbTjTM9cGAQLtR9udXUrVET7VibCzWALJm9pHODcU4=;
        b=itKnjINOtfV/SlWBtsrVX+t0CqGRyh2YEz8ddbmAeOh/WSTFwY4y6Rtzx8uNBD097v
         86kOFQLXBudCkEtN05tIk7kFdgJ2pvqebsWfbeHomXyATmRlhh2AuzQLcpidz1JtuHLD
         tmllQ7xolnvwL7Ml7MJDDJ3oFx+7jEANC2j8y7P7crUUI2/td4wXQWwqP1uUM3V2Da5W
         dQBj7SN73HMJLFhg74RzYTUDhZORPcg4XGO+nClmZriHILPzjsaIOm1TW2dEOJHQM3G5
         2hgmqQFShEqr3IGg4SslsvEpDTaFOKEWRxkO4lb01ocLQMLI/aChBuEqWAfROx/NDxxH
         p6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=SqbTjTM9cGAQLtR9udXUrVET7VibCzWALJm9pHODcU4=;
        b=dUJ//GgJ4kGl9i9auiZ3Y6osqhbZkoZiCoc7z1JvLbnE8fdPQL351vvzhyQVvRU13o
         fCZwfQ6tuG4mksvGNRHnU10AbY/AL+vrMCyFBt82uV7RZL9u4mvkdY+8qpkUHKT+dyMF
         tBODr+AaR/d1XnlRHJUOO0VzfYKhsYkMcIw+Op3V/hnQSGXl8h19OWOrlOkXv49rN1y+
         d2auaGnLP2jzQtCJDBKngLWuhOC2fACMufgHdioUmEsvmxKRh+WHzGegU3K+B31hRyk2
         8LURORgdBAqVbBZDiP6Q2MaxHUkI4TPuQZw4GM6HY0Vk/Pa3w9xFUhHl1E5nxna4k707
         VSVQ==
X-Gm-Message-State: APjAAAUv2OVgOK1NsLqvQher6jU9YJUpGPK9oZDz4WWN7mnrMLxlebmb
        d5IYHlnJJAmhy8tEHaDEJ2B8sBk18Q2++oDNBmiyIA==
X-Google-Smtp-Source: APXvYqzcNibH5Fa8yhxwhQS5HqJwewF7GHTIcPvOKjg0p+55AdnHXaIqsA1B5JSLx+ifwZsMDZMMI6VZOQ81qugFysM=
X-Received: by 2002:a2e:2a84:: with SMTP id q126mr4706282ljq.258.1579949768067;
 Sat, 25 Jan 2020 02:56:08 -0800 (PST)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 25 Jan 2020 11:55:57 +0100
Message-ID: <CACRpkdZ746gURHOeNf3Wj3_7BVHtxjd9Hz2n7QTmqxEroZ0N7A@mail.gmail.com>
Subject: [GIT PULL] pin control fix for v5.5
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Boyan Ding <boyan.j.ding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here is a hopefully last pin control fix for the v5.5
series fixing up interrupts on the Sunrisepoint.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit b3a987b0264d3ddbb24293ebff10eddfc472f653:

  Linux 5.5-rc6 (2020-01-12 16:55:08 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.5-5

for you to fetch changes up to 319d5cce728cd70897a1306591a252258fc1428d:

  Merge tag 'intel-pinctrl-v5.5-3' of
git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel into fixes
(2020-01-17 09:07:26 +0100)

----------------------------------------------------------------
A single fix for the Intel Sunrisepoint pin controller
that makes the interrupts work properly on it.

----------------------------------------------------------------
Boyan Ding (1):
      pinctrl: sunrisepoint: Add missing Interrupt Status register offset

Linus Walleij (1):
      Merge tag 'intel-pinctrl-v5.5-3' of
git://git.kernel.org/.../pinctrl/intel into fixes

 drivers/pinctrl/intel/pinctrl-sunrisepoint.c | 1 +
 1 file changed, 1 insertion(+)
