Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF01140D91F
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Sep 2021 13:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238436AbhIPL5H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Sep 2021 07:57:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:47992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238426AbhIPL5H (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Sep 2021 07:57:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EA4586058D;
        Thu, 16 Sep 2021 11:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631793346;
        bh=kPTz/K6eCTgsYGMPOgUTj2yYkAi9RA2RSa4pD9oPQVg=;
        h=Date:From:To:Cc:Subject:From;
        b=ahd4EpZ6AGHQTTzFfjdhKhr8voP8Ky5bSjwpqdGczn3KLNr3W71BAe+706PYe0LHX
         ckMUlXFC7JdTBDHad3jM8bRJbG7R8Kr1/4hr6m8bFeu2AqluB9Xsp2cdUvgA+ydhih
         VdFou05aHx3iopHFnjUlgjapIwQKXEZKvP6YaftL/rm9d7wzq4EMUYRGUr8gSn1K8N
         fEIdd6VnXyTb0JoV7gDyT4tMbkPVZ1smBMKfofWa697tzk3of5t/vfjPYckg6MxKQ2
         006tWp3e2xbVXORPa55KdQoUzst3TruUBIc/uiVlqSON+oIRvu62er+yseJAhxa+Zk
         T8d4hJATY12Jg==
Date:   Thu, 16 Sep 2021 13:55:43 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Gregory Clement <gregory.clement@bootlin.com>,
        Rob Herring <robh@kernel.org>,
        Patrick Williams <alpawi@amazon.com>
Subject: A37xx PWM pinctrl definitions still (maybe?) not correct
Message-ID: <20210916135543.0193a30a@thinkpad>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

the commit baf8d6899b1e [1] I sent in July, correcting PWM pinctrl
definitions for A37xx, is not correct (maybe?).

Before my commit, the code defined groups
  pwmN      with funcs   pwm gpio
  lenN_od   with funcs   led gpio

The first group is meant to switch the controller of the pin between
GPIO subsystem and PWM subsystem.
The second group sets what should happen if the output value set is 1:
whether it should be high (func gpio), or tri-stated (func led).

This means that previously it was possible to switch these
settings separately (although I don't know what would happen if both
groups were defined in DT with "gpio" function. Would only the first
setting get applied? Since both groups define the same pin number...)

Anyway, since both groups are controlling the same pin, in my above
mentioned commit I declared it semantically incorrect, and that it
should be only in one group. Thus I removed group ledN_od, and changed
group pwmN to have these functions:
  pwm   - pin controlled by pwm, 0 low, 1 high
  led   - pin STILL controlled by pwm, 0 low, 1 tristate
  gpio  - pin controlled by gpio, 0 low, 1 high

Basically what I am trying to say here is that when user selects the
"led" function, the pin is controlled by PWM. There is no way for the
user to set "tristate on 1" setting but keep the pin controllable via
GPIO subsystem.

What do you think of this? I still think there should be only one group
controlling one pin. But maybe someone will need to control the LED
with "tristate on 1" via GPIO. Should this be a separate, fourth
function, something like "gpio_led"?

Marek

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=baf8d6899b1e8906dc076ef26cc633e96a8bb0c3
