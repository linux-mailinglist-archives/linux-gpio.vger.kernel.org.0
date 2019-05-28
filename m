Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D12CF2C190
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2019 10:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbfE1IoG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 May 2019 04:44:06 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42179 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726418AbfE1IoG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 May 2019 04:44:06 -0400
Received: by mail-lj1-f194.google.com with SMTP id 188so16849372ljf.9
        for <linux-gpio@vger.kernel.org>; Tue, 28 May 2019 01:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=KJsIAmZlgomiviR9u23s6r8ukXmCLjxqlexRKIvP9zk=;
        b=MjCXqN6oEwKDIq1BrGwjFirFzeLs8hVkB+6w8ltYbqHKQT+Rc1/f+U1tm8iBOG+Pag
         8ClofD1nqewVrgyi408KSQGOjnEIKDj6tdBnWyecSH6O0nvKIYq8iB7B13ID+sa5Zqh3
         IqD+fwOL3qLWrT5HB5pqVNBekmT8yFNIuby9KNeJrcY3IlM8weCvYsC7xaFd7PZM/Dlq
         nDabg+HaMWpLrysgXIwDZTAo9DxP3RZ3CBI/r2NH+cdXbYxDiAHasj1k5iNU6U7NrSsD
         UMIXsoTKONKbDw1hDJkFsukWMIUJgLE+wgF7/BNq9q5Nl5W2xdJ7uJvxU7wTIiqE5M3J
         z2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=KJsIAmZlgomiviR9u23s6r8ukXmCLjxqlexRKIvP9zk=;
        b=XH/lOoH4K6wulb4GY+8KV30jWyAyi8Bga8AJI16xUSkGL3Ouh4Xi0limwVhfeHhF9N
         DSOwunGBWhj3oOCk8OMnoQj/zQHcXhbRrAf0xNBNKBQpX0rWfdf1w1DVhhV/KDthCguV
         kS2DTii3vORG8u60JwrwIG36koevlORaMFngyYX25nuqOQBNl2iLtT46VtVwbKjrD9xI
         lFNHMaNLiHTvbX4vyWtrBMJVu43gfMXs+ylOniGiPwVwIdXxkN1lxUdH2yGrbRq1hNn+
         EeFnCHvA2yRklvS0bHorty+S1vHv+ev8YeUMWW6tnrbOGaKR7DlCZeryHCpfvbLbFG9d
         yzZg==
X-Gm-Message-State: APjAAAWh4YALKhtU+Zob1Eaw2632qw15YYTtHpT1lu2Qi6u38vlMZ/B/
        H/TLo/jJ/8QkDtlM1xCQscD6gUr63hwmGD9UJeAkoA==
X-Google-Smtp-Source: APXvYqwUbOW+3HzlVH2QENJChAHBleV0jq85hTu4fDbpYu+weBQDdWZLTTiQbK+48yPJHAcpsfe9rg7ZLGP+Svxdj+g=
X-Received: by 2002:a2e:4c7:: with SMTP id a68mr45332096ljf.165.1559033044316;
 Tue, 28 May 2019 01:44:04 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 May 2019 10:43:53 +0200
Message-ID: <CACRpkdYFqcu=gz57H-+h5C3g_rvD-+XoRTw_A86PKDVA3=rfJg@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v5.2
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Amelie Delaunay <amelie.delaunay@st.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here are a bunch of pin control fixes for v5.2.

The outstanding commits are the Intel fixes that arrived
during the merge window and I got relayed by pull request
from Andy. Apart from that a minor Kconfig noise.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.2-2

for you to fetch changes up to b1fa7d8592c730d1b44536b5cacadeb318d369fd:

  Merge tag 'intel-pinctrl-v5.2-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel into fixes
(2019-05-27 11:07:31 +0200)

----------------------------------------------------------------
Pin control fixes for v5.2:
- Interrupt clearing fix for the Intel pin controllers affecting
  touchpads on some laptops.
- Compile Kconfig fix for the STMFX expander pin controller.

----------------------------------------------------------------
Amelie Delaunay (1):
      pinctrl: stmfx: Fix compile issue when CONFIG_OF_GPIO is not defined

Andy Shevchenko (1):
      pinctrl: intel: Use GENMASK() consistently

Kai-Heng Feng (1):
      pinctrl: intel: Clear interrupt status in mask/unmask callback

Linus Walleij (1):
      Merge tag 'intel-pinctrl-v5.2-2' of
git://git.kernel.org/.../pinctrl/intel into fixes

 drivers/pinctrl/Kconfig               |  2 +-
 drivers/pinctrl/intel/pinctrl-intel.c | 45 ++++++++---------------------------
 2 files changed, 11 insertions(+), 36 deletions(-)
