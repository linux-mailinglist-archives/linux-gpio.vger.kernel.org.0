Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58CE610C957
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2019 14:19:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbfK1NTH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Nov 2019 08:19:07 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45804 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726726AbfK1NTG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Nov 2019 08:19:06 -0500
Received: by mail-lf1-f65.google.com with SMTP id 203so20014938lfa.12
        for <linux-gpio@vger.kernel.org>; Thu, 28 Nov 2019 05:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=a6UykuI2ITtmBK53f/J/gVoOVqoOXR1NtFRyFCtxoEc=;
        b=mb3MIbxtl/blBcrQRjuFDoZUW5guLzIK8vDrdeEmPfM0TgQscB8bx+QXwUdKHptcrW
         LUsKmQKHDKE/Gj2KYgIUHJYVsMguz+FL1i/16M16CXRYvG141LShZ3uAoWeBgCXpl3XD
         YpBcYs5oSbYWRIsJYNBAQyboCcuMHBt7vVZThWALc0HOCu0VMMi+Zp6oszCHhCpLTplF
         q7THgvqpOIjaAkrR9M/RC/7ugTyiDZ/SbTNmTgBASeXsqsK4Ws0vo1ddvCQY2qhpg86J
         EGL9iR/UFL7h36bARljzkRPjvl+4T3Vn6ZtdDIzxTEx2YlZ/HlWX55i+LjJ3S5OYe4Dd
         00CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=a6UykuI2ITtmBK53f/J/gVoOVqoOXR1NtFRyFCtxoEc=;
        b=Zf0iI/05W79tFQcY1QoPLaasI36RBx53eB1/WwONkY5lWuqMaLtH8GA1DwDuOSzLDH
         0aeGG+sR6DoZ1OQg0eusryScVyUUJ4wwQqOS0ST5jj+2COnTuBEz9+NNtlRpDxib3AZb
         9zAqq8Uw6hTA3kpCPKKNaXxcAAiY9p/JHhJoSqoBfPn+gvMfgVrvf3rkR6IWDLIrEOca
         VPu98Ej9veG9EvVK0yCGxrDan8odBQ6Ir8M2Qnu7+rvTVEClH1dLzLYkBsQSQwftwETf
         FuGNR+L+ILp/IBYHHkowJQQJo6hWftSfarGqAiMCxwq2rjtwuGCr1x9tPnjc6M5TABmY
         MEQg==
X-Gm-Message-State: APjAAAVKe30KIj/ezxSUPGNOL5Op+GrD8OiOCB9BWnqhpbKZL+Yb2ths
        Qn99ps7Lc3DF3ZUy8QI7+GdNMyImNi1MLWkBeTUSzQ==
X-Google-Smtp-Source: APXvYqwYXHWQE8HF3VzPJ7gwhW7vLjPmEWwu9T2UbexqzTjOPa39f/ftjXJJSpBmdc1RK+4dxxgWXAT/gWFx58pcByE=
X-Received: by 2002:ac2:410a:: with SMTP id b10mr5039588lfi.135.1574947142730;
 Thu, 28 Nov 2019 05:19:02 -0800 (PST)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 28 Nov 2019 14:18:51 +0100
Message-ID: <CACRpkdb_5xjLBSPaGrDadHUj=4Npz13YELJw+Ov+JyigGPBZjg@mail.gmail.com>
Subject: [GIT PULL] Oneliner fix for the pinctrl pull request
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Rahul Tanwar <rahul.tanwar@linux.intel.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

as requested yesterday, a oneliner fix adding the license to
the new Intel pin controller.

This time just based on the top of your tree from yesterday.

Please pull it in.

Sorry for the mess.

Yours,
Linus Walleij

The following changes since commit a6ed68d6468bd5a3da78a103344ded1435fed57a:

  Merge tag 'drm-next-2019-11-27' of
git://anongit.freedesktop.org/drm/drm (2019-11-27 17:45:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.5-2

for you to fetch changes up to 6d29032c2cef31633db5dfd946fbcf9190dddef0:

  pinctrl: Fix warning by adding missing MODULE_LICENSE (2019-11-28
09:12:43 +0100)

----------------------------------------------------------------
Fixes a MODULE_LICENSE() problem in the Equilibrium pin
controller.

----------------------------------------------------------------
Rahul Tanwar (1):
      pinctrl: Fix warning by adding missing MODULE_LICENSE

 drivers/pinctrl/pinctrl-equilibrium.c | 1 +
 1 file changed, 1 insertion(+)
