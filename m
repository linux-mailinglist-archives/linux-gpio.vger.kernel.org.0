Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C56A27FED8
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Oct 2020 14:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732008AbgJAMRT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Oct 2020 08:17:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731846AbgJAMRS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Oct 2020 08:17:18 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85F38C0613D0
        for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2020 05:17:18 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id z13so6336915iom.8
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2020 05:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=yp243D/EURq6WivlL9rgvK/d4JRG/kWVF8nhUycFXq4=;
        b=cjSMcKSH6rmZnqpWf4VGKuT6CQd4WxoYuTYwCKMEm+qwmc+Yo3GetnyGQ6M/BF7W/G
         BeL9WNiWvoprnIuJL4aLjSoerrf6WWgJekpPcQk98jEHiNNTHWGOf9ixW7gzLWZzfyUH
         TeWb08HzCha20x6YFgIpDCv6/FLMY3LWrZ6HUwFptSK+VjLzRbpmt6MbT22WLS/Avi4s
         RSjXNuP2yONmnshOXs5zcg7nRIMFGqKuGHKA1kQydztcGR8VrTraZTcZ0V9sM97BcNVY
         /FNBFEDPjY6MlY13BLHwz5e6RqoSG6eWeNvee63N0W3RvfGC4cHVLPToa9fA+R1afYWv
         ttvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=yp243D/EURq6WivlL9rgvK/d4JRG/kWVF8nhUycFXq4=;
        b=sXKPScBMA5UT3yM912/kkjtK1cJ26x52uwUMqQ4hLMI0xFB2ldZ0Wc8wuIxbNPAkQQ
         WbF7tMSzl22Wdhk2CuN+Jle9sbU/tMiSn2+zn3fO50cJws5wX994Z5Caz0q3LtzKbGe9
         cep6bi13cVmEb/ygXWjcKx+MwuxJdf12dtajkAlU+lnU6Ql6sbHc2V1I+jpFUY92H1T8
         8y80ufhHwrBnoTekdnrJ9O2tu/V+R/3jYy8sBKZYK6wrhIOlXmWcO4XMw4xgrqvs99d6
         eoksvyCtatEC8/xCKffH89QskJeeL2Bamc4DrtfANwmdnjchyzLk5Ely/ZfcoqUNXsh6
         8HWQ==
X-Gm-Message-State: AOAM533tyJgoo0AttIEry/z32/kmPCfHbZOrPZLCgmMc6Dl2/vCqAZKq
        DSRyQ3qmAuY9bZf6CmKR0NcJ2X1fx89Td2HcGiETUTByL8gUwA==
X-Google-Smtp-Source: ABdhPJzAUV/8Bd1dsdH3gppq8UItaRhr9Ct53LZw87iH8Znc5YSYWduU2bgUEYn4qR2qSPeCATth9yAmIRUzvBKhMfQ=
X-Received: by 2002:a5d:8352:: with SMTP id q18mr5243169ior.31.1601554637391;
 Thu, 01 Oct 2020 05:17:17 -0700 (PDT)
MIME-Version: 1.0
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 1 Oct 2020 14:17:06 +0200
Message-ID: <CAMRc=MdCj8ZohsKiJjqynXPeg81q8_WZvb5VxoPGUDusFUY7Kw@mail.gmail.com>
Subject: [ANNOUNCE] libgpiod v1.6 released
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Drew Fustini <drew@pdp7.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I'm announcing the release of libgpiod v1.6. This is the last release
in the v1.x series. New, improved version of the GPIO uAPI is now in
linux-next queued for v5.10. It introduces many new features which we
won't be able to support with the current library API (and we also
have several reworks defined in TODO that'll also require breaking
compatibility) so my plans going forward are as follows:

1. Switch the major version of libgpiod API to 2 and start working on
the new API (preferably starting out by simply porting the current
library to v2 uAPI).
2. Indefinitely support v1.6.x branch with bug fixes.
3. Consider v1.4.x as an LTS supported for as long as yocto uses v5.4
kernel as their LTS (this is because v1.4 is the last version to not
require v5.5 kernel headers to build).
4. (maybe) Create a compatibility layer between v1.x and v2.x once
v2.0 is out that will ease the switch to the new release.

There are no big new features in this release, mostly improvements and
bug-fixes. The details are in NEWS.

Grab tarballs from:
    https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/

Grab source from:
    git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git
