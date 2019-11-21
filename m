Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A3F11053B4
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 14:58:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbfKUN61 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 08:58:27 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37040 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbfKUN61 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 08:58:27 -0500
Received: by mail-lf1-f68.google.com with SMTP id b20so2730616lfp.4
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 05:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9ipsO8G+PlO2JeZmN1j9JQktTUe14f3S/xNO/BSaKHA=;
        b=FFn/lNT3eNa9HLPCugXk2CFK8XSrCw2Q+7P4ZQej4LCB7rKJUXdWNjtwR3lg46vbJ9
         ekjkUl/89011Wv7dsQaZXtsLvAiBvBRJsku1OwDqJ/ajiQSFfXCVQ2YtBMNXiWstc8z7
         6Zv84fCJKIOKfjZwEJL4gA7EaqU4mSisIm/wG/I+9xi9AO5KiRil6jnKcOvcNIsLZPVf
         SkXW3YAlSSedRW2zcPMR4m42YiOhCW7jUfsSuuJ12qg/DeIRD4bWB3iW0jHdlOe2C8e+
         PhTvdMjvJRd4gQAYT331DcJXD4aH+rr+mi1f4LaMBvM/IgJkt4C200DAheGPGDQyGVD7
         hCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9ipsO8G+PlO2JeZmN1j9JQktTUe14f3S/xNO/BSaKHA=;
        b=FBwOfPwn0yTmkhOKXJxJI6jZy6gKelo2hN5n8Q5aQGiMCvdsnzhLRIttPFFA/jgObJ
         /5c2SyD1VA0t6/g2NCBCuYZqywDHsZI944F6rDOjtsbBEcqCPwca+XX+j9YRnYf+7i7P
         6w1u6Q2UqMHS1uEgRxQkap1DTfqQwEyALdLgyF4rPyh3HEL/2bQGfSQJkmU1DIYlqa/F
         /Yf1ljy6Lf46cr7gYYNedXAU5O0PvkDofAO+C1mIPbDRWlf3zggrvXcV+hvsYE0umtll
         s/YvAFod8XUqlby5S4hD6hQNdN4DMD23FjXa/sA4pWs4EDIO2hrQDGuWzfyq7mVuBXEd
         87XQ==
X-Gm-Message-State: APjAAAV9wfTxovLMR3v+VgdxvuIopbwjkvqYogR6/JSlBK/iq3qTu8WM
        UY9TDri2AueORg6QTtj8dB6S5CJMZ9618T6IOFqeTQ==
X-Google-Smtp-Source: APXvYqyzFNUbbK4bWroWSfdZK68o4Prh66O+riboAPwxuhp9udva1x9wr9B1DfDo0YpMKvqWbnYFd95PRanCE2vJO4o=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr7456154lfi.93.1574344703644;
 Thu, 21 Nov 2019 05:58:23 -0800 (PST)
MIME-Version: 1.0
References: <20191118135258.37574-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20191118135258.37574-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Nov 2019 14:58:12 +0100
Message-ID: <CACRpkdZ7XyMH8n6BnZQgkSt+fFW+MzHjiRkRpE01BW82r0DJuw@mail.gmail.com>
Subject: Re: [PATCH v1] MAINTAINERS: Replace my email by one @kernel.org
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 18, 2019 at 2:53 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> For the repositories we keep on git.kernel.org replace my email
> to be on the same domain for sake of consistency.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
