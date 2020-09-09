Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4655262457
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 03:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbgIIBA1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Sep 2020 21:00:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726699AbgIIBA0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2020 21:00:26 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D33FEC061573
        for <linux-gpio@vger.kernel.org>; Tue,  8 Sep 2020 18:00:24 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id v23so1324360ljd.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2020 18:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ezmZBSuI+bRQ/zcARSXicX0Ln9sRxH92cgRioRRO4vs=;
        b=Q3ChRA168Qz5A7HkybBNmt0EmR6+lAwsEIB8bzBXdEfdnCXLpJt/rplGm7Bdxpns5u
         IY/guhSBiqgJz/2wYQpaDqSEMJcqp/ueJQkgbffZItLAmTsHTljqjZWjcnRLebQUA1ql
         c7WUSuUO3i5DqMFQZ/qrt4bgts/ogg+OsYCK5yxJbCWyj4H81yOa4f17Ma6dNUHxbXvp
         5srEGDl48rQWVNRVeaBeW5R99wmlJnowAfbRK5UHoD/YSMPyTJKhYxK+CqiRHmBnJDX8
         qQtUye8mvlUeRQWF3xG2M1XkRkNndrC57oA5w4NRunJPESfX9XnnjCg/XG29RhPTbRuk
         9seQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ezmZBSuI+bRQ/zcARSXicX0Ln9sRxH92cgRioRRO4vs=;
        b=bccJPoMZDQ1Igz4wKLAY5mt5wdmKZC5m8511pEf8BuRxdMW7NZbYujdWN2XjT84jmo
         6LeDXsYrlz+s7eqmSs46OxyJtZsYVkPVwgwCu70kIJ1SJoRuOKSbR9Cm/GC4tLcugN7M
         UJOR3izkdBAWLOl2zIW3NQIqgk5A0dVGZ9H+bPwNncw6OKNd9KAm2mRiltf2mFCOb6sV
         Elk8tWyMK4+UUSf0e6wjrWvwainz8sK8YSYzfRZg1MeysrchQoAnTQNiJgiL71x8xrAG
         zo57I3lYJzEjTXaFSzqKAHm8T33c5LiwHDbY6/tPYVp66xpbHpMqwlYSx04WR+KnSk3/
         38vA==
X-Gm-Message-State: AOAM532Piyu68PfYBQrpF3wSqD6oil1Ra4a5ymh22989FIgVJBOd/+4t
        4l+yHXA0z5p4w89Lq9ldnZPYBQiNdE7+uuVv7ao=
X-Google-Smtp-Source: ABdhPJy/zkowOiLWhYdtZzwwtvAJaQSs3rJHrQBafs2cqBllGStZk3t/rY+he9NtN3lkrx+l6W68zC3aSodiVdvj8Us=
X-Received: by 2002:a2e:1444:: with SMTP id 4mr511750lju.218.1599613223172;
 Tue, 08 Sep 2020 18:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200824130327.21113-1-festevam@gmail.com> <ef3101cd-6cf1-d571-7ac6-6208373c0155@ti.com>
In-Reply-To: <ef3101cd-6cf1-d571-7ac6-6208373c0155@ti.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 8 Sep 2020 22:00:11 -0300
Message-ID: <CAOMZO5BhjpScwUo0t6Dj=P2eH+HXHspbipv=1PJmiWJe44w9BA@mail.gmail.com>
Subject: Re: [PATCH] gpio: omap: Pass __maybe_unused to the suspend()/resume() hooks
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kevin Hilman <khilman@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 26, 2020 at 8:23 AM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> Duplicates
> https://www.spinics.net/lists/arm-kernel/msg830596.html

It would be good if someone could apply it. The warning is still in
today's linux-next.
