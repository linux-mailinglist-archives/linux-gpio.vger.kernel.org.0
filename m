Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB7B2D3D21
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 09:11:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728434AbgLIIKm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 03:10:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728038AbgLIIKm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 03:10:42 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14A79C0613D6
        for <linux-gpio@vger.kernel.org>; Wed,  9 Dec 2020 00:10:02 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id q8so1162007ljc.12
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2020 00:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TJyQ4njFEsGlpYLXx1+rDdcfftV/h0rnAwVv5TjqOtk=;
        b=I2iW9ppMApda8TqPgwhDY/UipXvWO6V+0Eq1ZT7wdKmxIFdKvuItfW9EvU468j7/Tt
         6HqENPZjjH3Kd0KYFcLJj7hK/+LiuRVgm/pdzigKmhtMQNkGPjD7uEVNxoHGIIh7hLkO
         Sz3x70Xxqf7KFv6jlYHHiSGnlUDVrjogpCig+qSa57FFdDYGGjXSSbwH6m/iNBgDRJgR
         Qn65jgrHWtvFwHcnBSeFP8jtfn0ZU+mM5zfTRUWrly/gEtmfLd6XFb4n1H+IYEJZYg6K
         0mbxEg4ihf3ehmjlk0Sr2EfkcOmEN+BsnT4ZXPW3LH7kpSyTL5N1tth6f/3506N2dYsK
         Bw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TJyQ4njFEsGlpYLXx1+rDdcfftV/h0rnAwVv5TjqOtk=;
        b=kQUPmcyJi7gNt04SIcYI4Feo0frObAvt5vuGp9YxUpQXkaRoOLqTcTkdXpyWhtR4v/
         fP0iWczD++Rl3hurPj7Ll4F4jAnF96bam7udZF6UFFwHzhTNZyn0dVf6oDA12yOlIXe+
         CrR9keIAYx5dsgXS7br0y+F900xMfoswJKYtBKhW0IH1iXA4ON3FnyB5eyU69iVRBjBh
         D/MTs5lwqDsytTFyK52RgryEXIf1NlJdoUNn2xgS3Hdg/OsQbrxsYkWfT3sQnJGOb8U9
         vG0HRjXZgQOD4A1+3IPDHBzJXsrGEDu89DF2duzkRRFMxnA0393PxZF5RjyeqJstsKxK
         D/NA==
X-Gm-Message-State: AOAM533PXstOp2Ib3xtW7pCAfKbflqLpyloJ5qlybw6ZOErNUz4z3Xxj
        F+35fpHyHhE5ANdgTDEUX/XtgR2oVnX2y4YHM0sM9Q==
X-Google-Smtp-Source: ABdhPJyT+n+sqQoz9CSnMjBqGUUjlRDAMj4DEDby9Cqxw0F+O+sPgytyZOfNbV268idT+l4EPfGb+YvLHp0Sen8CJiY=
X-Received: by 2002:a2e:884f:: with SMTP id z15mr617045ljj.200.1607501400609;
 Wed, 09 Dec 2020 00:10:00 -0800 (PST)
MIME-Version: 1.0
References: <20201208182403.40435-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20201208182403.40435-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Dec 2020 09:09:49 +0100
Message-ID: <CACRpkdY6gEi6pzuuFCdO_Lj1r23=HKCWF+N+QR-E7kWS8bBkjg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: intel: Actually disable Tx and Rx buffers on
 GPIO request
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 8, 2020 at 7:24 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Fixes: af7e3eeb84e2 ("pinctrl: intel: Disable input and output buffer when switching to GPIO")
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=210497

b4 strips this BugLink still! (I added it back manually.)

I'll try to report it.

Yours,
Linus Walleij
