Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 769DA44AC43
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 12:06:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbhKILIz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 06:08:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234386AbhKILIy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 06:08:54 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2285C061764
        for <linux-gpio@vger.kernel.org>; Tue,  9 Nov 2021 03:06:08 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id t19so2732632oij.1
        for <linux-gpio@vger.kernel.org>; Tue, 09 Nov 2021 03:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mYqUiKJPxE8WcvdjGFDszJTtEouwO1eby2WwIJp4IpU=;
        b=aZwUfBGi5QPPO9Krq4MF/SAmMwQlcG+By1Hwxp93gL8wfKzs9TM6wQ1+VVOHlRSeLl
         8lY9XjEfRvM5Y4keR655VoOYIinQPJgey3R8dK5JXZQN04i/eHB9LM3Y5aQiPRpMZ5ob
         4ZjpPGCj9bTbGZuS3pHzUoBPY+WHqnmcKRDCllvdvII9B2za9ZVQGa7CWYc69YedOvqy
         bpv8HIgd8eRXYht53MbpQbr62IckLtMtrzL5uA+fi+Yr2ExR2VlprViLWuiwOM7Xy1tb
         F8/VFWuL/XrnLmYRf8nhpLvpHlsUCiz7ZBW17HDZI+EIfn19RffiGtccdceOjVJIXWg/
         SJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mYqUiKJPxE8WcvdjGFDszJTtEouwO1eby2WwIJp4IpU=;
        b=N94VS+3p6Ppq49I+bV39rk0Ys0/DrGfVrMH8tONe6w3E2QXlVh5T7FXc/woobOBzsd
         H8CvzjTlAsAo02kUCveUI2Ud3gH7hUkJoY/aBZLRirn6b3y6mgXi+QDN3/FeK4sBAlEW
         tP49l/fEIw9yrx1w+Jop8IiQJx/SUau539362KSxD2RTp6XIQ6eDR7q5hH6nu6Vn3pae
         CtYYIegKm/ne9gv6skHVmOiLz5eW1uTdif2UqTbSFFcJeuq52ITYkKx7IdEQ0wlqQWhp
         1XUeMQC4LITbi9YIjlVoL+NsS2NTn+7tZkZm72Yj/nHf4OcnzP+2khErfhHdEN9Sntym
         u6dA==
X-Gm-Message-State: AOAM5300avyncbjERC7e+o6vPxXMOZrZNHjChfOAmJ12121pd5rsxItN
        Mkx3StwMH1uamYjW4aSX5Si/eqiEvOBln9GHmCv8gw==
X-Google-Smtp-Source: ABdhPJxCCzJzQiaOBONbxhK22EH9U8/ZolQMw/Sehsg9Xx1+ewHusPYT6Wm+mD3RXt7HtDr024NxEw1YSjw9wIAIms8=
X-Received: by 2002:aca:120f:: with SMTP id 15mr4676175ois.132.1636455968114;
 Tue, 09 Nov 2021 03:06:08 -0800 (PST)
MIME-Version: 1.0
References: <20211101150640.46553-1-sven@svenpeter.dev>
In-Reply-To: <20211101150640.46553-1-sven@svenpeter.dev>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 12:05:56 +0100
Message-ID: <CACRpkdZJVRn9zAC8t=_X=29+kWw2QPKBHd9wiX9C3ms+gte40w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: apple: Always return valid type in apple_gpio_irq_type
To:     Sven Peter <sven@svenpeter.dev>
Cc:     Hector Martin <marcan@marcan.st>, Joey Gouly <joey.gouly@arm.com>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Marc Zyngier <maz@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 1, 2021 at 4:07 PM Sven Peter <sven@svenpeter.dev> wrote:

> apple_gpio_irq_type can possibly return -EINVAL which triggers the
> following compile error with gcc 9 because the type no longer fits
> into the mask.

Patch applied for fixes, thanks for fixing this!

Yours,
Linus Walleij
