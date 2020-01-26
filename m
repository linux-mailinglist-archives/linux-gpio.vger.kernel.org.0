Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32787149A54
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Jan 2020 12:07:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728899AbgAZLHW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 Jan 2020 06:07:22 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37580 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgAZLHW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 26 Jan 2020 06:07:22 -0500
Received: by mail-lj1-f194.google.com with SMTP id v17so7609473ljg.4
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jan 2020 03:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+5nfNBKfWkNOcP6md7ZK2trCRPYOr4VjVNhC2FWPzJ0=;
        b=hUJ5/gnd1EAMYsPHQlO1tHGQTW1Mccc3pzn9DBOy34JkFUv4GpnHBYTb1+aauhJNTo
         80yYm0wy37dGbn6WliRNxLvkKax+X6L48zGL7GsP+Gr/oYEZrKf+J5zzB1Q1ibTXNRhX
         xaQho68MGFkdho69D+gZIlN706NvNNALeTLSFJgFs8dG5iywWFqiYXVKgadsGouRBNBb
         4y7AheuoHR9RgGE8R7VnwJtReiJtG9XVZRj5+MPWBzN+GXp5pmxX0OnwOW6IxUh/Tmyp
         kEnfEQPALQ9SfimvaVT74X9qMskH1VxbbQz8iJlTYwvEkYc40RBOb+PJ8fnjkO6k7+N9
         he7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+5nfNBKfWkNOcP6md7ZK2trCRPYOr4VjVNhC2FWPzJ0=;
        b=p7to7ZksKR0D2Rpg/pMvAhG/Lz4POpmtJIxiDEyECETbBj+R1tb0Bq++47e/Bi6ZSB
         /AikH+rL2k5PfHmmReEhTE+0m09CswRgokkzH6QV1aZYlH4XCTeg+cvkfMHRw2y8dqvA
         NcMawAF4S2RdaLTl63ff2qtg99Pxr+NURsSNL63fB7oFddfYxvGmy8N0K/a+lvY8NeD6
         RWnrUH1U2KnsVmAPNGdpInfIy3REDd4Otg9dL9nNBK1JxDKB8qzEsClZPympf0hXzDLO
         LVpBay5BkHOdhAy/NqPnD/+MYVbGBJa1wDIzIUpmSu2eymCdCBEZz3K+pfepmAMejf5J
         9c1Q==
X-Gm-Message-State: APjAAAUTqVFXPRKHBkJtpuu83f2u+BuAVj2bagPO/ILq3luyWJ2IJuEM
        niimjPvsdmRHo5PMQJTjmGNvSEgS2nTHCmlVn8IwLq13THc=
X-Google-Smtp-Source: APXvYqzFkewPV/TsxNFZADkhzgmwXEl2Fv1dNeFsNA3XgHAFCOm+26du8cH0KA5bdXWCibM2ianT0SlWy0wGKBz6gIo=
X-Received: by 2002:a05:651c:1bb:: with SMTP id c27mr7348782ljn.277.1580036840213;
 Sun, 26 Jan 2020 03:07:20 -0800 (PST)
MIME-Version: 1.0
References: <20200125133212.4105-1-brgl@bgdev.pl>
In-Reply-To: <20200125133212.4105-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 26 Jan 2020 12:07:09 +0100
Message-ID: <CACRpkdYBun5sqFFfCppgY8w_R6a6mQrmwBKSY2_PGF4=zNv8QQ@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.6 part 2
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jan 25, 2020 at 2:32 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> I was about to send you this patch together with the new uAPI patches
> but it turned out they were not ready yet. I'm not sure anymore if I'll
> try to push them for v5.6 - I need to take another look. In the meantime
> I send out a v6 of the series.

Pulled in, thanks!
Yours,
Linus Walleij
