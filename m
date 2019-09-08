Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6942FACB6E
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Sep 2019 10:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbfIHIAk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 8 Sep 2019 04:00:40 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33927 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726108AbfIHIAk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 8 Sep 2019 04:00:40 -0400
Received: by mail-lj1-f193.google.com with SMTP id h2so3221854ljk.1
        for <linux-gpio@vger.kernel.org>; Sun, 08 Sep 2019 01:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=wbSNJrCAMMQJMsBoL29fGN+8+5asXhPwIIrH+qFROu0=;
        b=B2wFFBVZS2tQgIEY42dR7+c/26RYg5hKQMiSxHnvNKlrT6w3VfP/D65XHDWF3tU4PT
         o+O/04SVby78Gqwmhit7Hlzjc4iuPS96ybm3db4WncHo9d+beRsfBVBn8/JwV48aRasa
         H0OaF765vXtU/lHYIh660Uc8tpckvZdA3/PfFlcT8pm5caheaiGAnc7ifkplWaTC7v41
         1GbHhdLJXOltgKZfkd2rj1KcDLarIlyv2kGYQMZEaMUOrwzscGnq9J2MNc0Y/n5GdU3F
         5EZIZ1K3tM1W7S+TbY2+EPUiV5NJqlI7TE5/YXH+OoHvnHm+Ui99lVN1mybTVa4PGFsI
         3yDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=wbSNJrCAMMQJMsBoL29fGN+8+5asXhPwIIrH+qFROu0=;
        b=tDPG/mVcHg4pKLB3ZJaNgf5P2+Zzq4DpmY+tz6LpNvrgqoCZDMYuaAbeUIL/0C7xsq
         ip4qvz1KsyVUjjOT2Bx/eklzCJYGZ9C/FfZ0dNl+zhh7NEvEBTvMA/eEhtGUjkiw2DJ3
         X2lDuB5ZhLoQr1eWN4qzK2dtCZUlme+PR4dOqxX9w4rRmVuUrWxJZ4UG3XuuyjlYsgyp
         l0QDEHapp1XcUVD+5hr/sqR7L1lNPCoXSkB5LI8mSfdVO76PGz9lmfjxeXqyqi/hUbgv
         LdPRMgQk4HK0z9zSflTsCbf2t8I4OdMAaBu6qtlFS4iQ9S/MduWeO3DvvYqIF9u5uVW/
         oVSg==
X-Gm-Message-State: APjAAAUburt5SH8jgJko7VM0UXeFVm+tXjighmB0F8uwfFo0JKm0zlp2
        phg1inslN8/HNWn4aUgNE5QvFx+9M/yD+1xMsMJL0g==
X-Google-Smtp-Source: APXvYqw6wtbItyTMNxmQSL+6YPhMyTlVsY65bMRTcpjMt+/ghv8xzVMdU/PSxMDbEwBprdXJ3iVlsITqi2bH0hvmdzc=
X-Received: by 2002:a2e:884d:: with SMTP id z13mr11211958ljj.62.1567929638593;
 Sun, 08 Sep 2019 01:00:38 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 8 Sep 2019 09:00:26 +0100
Message-ID: <CACRpkdYEPBOFnKvNiH0kSOZWTujMaMNhQQgRTGSZUosbbqAdkQ@mail.gmail.com>
Subject: [GIT PULL] GPIO fixes for v5.3
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

some (hopefully last) small GPIO fix for the v5.3 series.
Just affecting PCA953x expanders. Details in the tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit a55aa89aab90fae7c815b0551b07be37db359d76:

  Linux 5.3-rc6 (2019-08-25 12:01:23 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.3-5

for you to fetch changes up to 89f2c0425cb51e38d6b39795c08d55421bec680c:

  Merge tag 'gpio-v5.3-rc7-fixes-for-linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into fixes
(2019-08-30 15:28:04 +0200)

----------------------------------------------------------------
GPIO fixes for the v5.3 series:
all related to the PCA953x driver when handling chips with
more than 8 ports, now that works again.

----------------------------------------------------------------
David Jander (2):
      gpio: pca953x: correct type of reg_direction
      gpio: pca953x: use pca953x_read_regs instead of regmap_bulk_read

Linus Walleij (1):
      Merge tag 'gpio-v5.3-rc7-fixes-for-linus' of
git://git.kernel.org/.../brgl/linux into fixes

 drivers/gpio/gpio-pca953x.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)
