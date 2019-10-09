Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC77D0901
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 10:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725962AbfJIIC5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 04:02:57 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45212 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728054AbfJIIC5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Oct 2019 04:02:57 -0400
Received: by mail-lj1-f195.google.com with SMTP id q64so1452642ljb.12
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2019 01:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qIcuMqyribGNxdL5/KfaR/0W6xo7KhmFZDC62GSR9uw=;
        b=rwJgS7yXEf0+np6sEo73SubMwqxNdp4RcAX+jWJULZ3fSRrC1cOhANBPgDq/MHmTqc
         JFh13IiBSmC44y2+YQGvoQo1N9WvINr38BqrID75SDFU4ztKk4Cr6igNdJS4kJzI5+49
         pxW7/hEyoeoZF8AShMROjgLKBRoOpICQPs9jrfNOYkESk1LtzP17RhO8jHt8ZVd4xEuo
         CN60C2uE3+ThAkaX6W99cbN5hve3MQsxbrAf+8O43IfZNSz/tvXBanSJOxIGHnirbV4q
         8xSs0S8jpBpllANxVKbndvxTaBYdkIW0/xyno71RKh1Fo+8y10HchWjvn3s477Q/XYAE
         lXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qIcuMqyribGNxdL5/KfaR/0W6xo7KhmFZDC62GSR9uw=;
        b=qBTahJgpOsJpesaH06Y4xWXTqh/hClQw1gH+RU9Qu6+pEpWpFm3afv203CpF6uKNkg
         AEAL7EtlUavmcckvvl9U1D6ShQ7SsRtNelOWG004pMrcu9YadLliUPTjGsKXgm/KFXlu
         GPmQeHibfrnSFq55BASYWnBqxcM2F96wrAMK0ehaSN5yIOmOcb/2kyYVr7GY0t5IZlD9
         O+r7hfxdVNY2VA9UWO6W4xLGugQH3MbSOmw9YhT5Ycy2xViqplfrmYVUE3xSEztfw4L6
         ukJIG5fWp7hquZRVfc/6duY+dH1FMQ8Xq58cTGt9MDP2jJzcwQkkGVSjbwiF8/2Kfx5W
         ueJA==
X-Gm-Message-State: APjAAAVI4DNvuf44pXsnzjxSt5RJsVMteawiNZNL+K4X6V5ser58vhBO
        V+6cAF4TlmwILQCHMgkDvqQ6tZZGUhejHhTjUvuagw==
X-Google-Smtp-Source: APXvYqzkxO27nVgr+ezF6wWyRFhgeKlah+nA5MKVsuIlBHud+OOcCa69nMnvbinUrxjWWXwcTj43OmtOXQIUqoB6N90=
X-Received: by 2002:a2e:a415:: with SMTP id p21mr1418505ljn.59.1570608175035;
 Wed, 09 Oct 2019 01:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20191001155154.99710-1-alpawi@amazon.com>
In-Reply-To: <20191001155154.99710-1-alpawi@amazon.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Oct 2019 10:02:43 +0200
Message-ID: <CACRpkdah=ofrdEeYUbp6ea+2S+EuN_XhUCXpCbDgm7p5R-Z6_g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: armada-37xx: swap polarity on LED group
To:     Patrick Williams <alpawi@amazon.com>
Cc:     Patrick Williams <patrick@stwcx.xyz>,
        stable <stable@vger.kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 1, 2019 at 5:52 PM Patrick Williams <alpawi@amazon.com> wrote:

> The configuration registers for the LED group have inverted
> polarity, which puts the GPIO into open-drain state when used in
> GPIO mode.  Switch to '0' for GPIO and '1' for LED modes.
>
> Fixes: 87466ccd9401 ("pinctrl: armada-37xx: Add pin controller support for Armada 37xx")
> Signed-off-by: Patrick Williams <alpawi@amazon.com>
> Cc: <stable@vger.kernel.org>

Patch applied for fixes.

Linus Walleij
