Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3003E128B2
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2019 09:26:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbfECH0G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 May 2019 03:26:06 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39889 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726297AbfECH0G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 May 2019 03:26:06 -0400
Received: by mail-lf1-f67.google.com with SMTP id d12so3714205lfk.6
        for <linux-gpio@vger.kernel.org>; Fri, 03 May 2019 00:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GWyOvulffdPmoJy4VjcbFGVFmuQLekuQ0m822Q/1tE4=;
        b=Ub+XbMidIqZRHqeZgWpg+Ffe7mLXnvgT0QSWGRsWeBoObFeGRI3WSrFbibCHTUP0/L
         4iv6isUQxHYvJJOwxVpCS8VxqBDgool17jmHpUqq8X1Yx3dfmTksbcuVwhAio6mQu28Y
         ZlsCv1LRr2f4b8MO7HPPSB5Wz9P6yCwVKA9gyM3cMWFQLVGWqN+qs8XvhoDJXutxLYiW
         aNbEscbNJhSU9nXiajuj57KvXfV7ZH1H5wK1dEsgnXpjFvMfBQ/Id5EmwS1KXk0cOgdp
         74nsVZGNMW/dsRFWCV3dTIIBCt4mdh16OsDQVjEWhBcoF+XeZCvVeNvCXkXucDdzxFoo
         0A8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GWyOvulffdPmoJy4VjcbFGVFmuQLekuQ0m822Q/1tE4=;
        b=Rps/cVjwoKuTqzJ2EWLnx/Cgg8bdRATQMyb6xoLAFDzRmkJQm+iRiir1LJpqdDbJz+
         ZAYxgT5129Pb7djIhyoWmCg4ZtsnJEOUCLy7rwnunCvgb6jhOO1/E8vv2TMFehWzu4wj
         HpCC3jhGPCR7ArWpQq9dqvJI4WKSmOwm3flGiz8oHdPwRcSyvfbuz0PFHPXdMaEadmsJ
         cnsZ9w5NQ4irtJ394l60OH3cz5Wrxi21VPxoeqLs0ZWaQnobMLP3IExD7UmSLJI3Nd2y
         QQc6DudkiDqdi77HFHY8WDgGOm0SNlLfhZVIaSbLC+wYx8Xh1lt307OMK3hXF03YZ/7z
         O72Q==
X-Gm-Message-State: APjAAAWNu0TN9h/GkG45O7JphBb1b1lEIOwPpGtsdWRjBrb5HVXI8loQ
        SJIoZ0008svFjVFVUJCqb4oxX3rjhifO+G4AwIK/Vg==
X-Google-Smtp-Source: APXvYqxD72lqogVdVFkqHMHcyIBu3Z9QH3+lIYInAnACqEb8WSPId60oRH+a04KV7UilhcL5P52IOc+wl4Ok7bQ7ZyA=
X-Received: by 2002:a19:97c8:: with SMTP id z191mr4120992lfd.167.1556868364355;
 Fri, 03 May 2019 00:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190425095542.726-1-geert+renesas@glider.be>
In-Reply-To: <20190425095542.726-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 3 May 2019 08:25:52 +0100
Message-ID: <CACRpkdYkv=oMWvmcxFXkcjVEnZkL=n-KadMonX+6x=EQ2iUONA@mail.gmail.com>
Subject: Re: [PATCH 0/4] pinctrl: sh-pfc: Run-time debug code fixes and enhancements
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 25, 2019 at 10:55 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> This patch series contains several fixes and enhancements for the
> debug code to validate pinctrl tables at run-time.
>
> I intend to queue this in sh-pfc-for-v5.3.

I don't mind to take this in for v5.2, but it's your pick.
If you send me a pull request pronto I will pull it in.

Yours,
Linus Walleij
