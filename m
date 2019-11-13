Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF878FBB5F
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 23:08:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbfKMWIR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 17:08:17 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40977 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbfKMWIR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 17:08:17 -0500
Received: by mail-lj1-f193.google.com with SMTP id d22so4344588lji.8
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2019 14:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dHfag9uJv/TYaItpMIVcEE99FJGP5gU8YagFEMRguHo=;
        b=tfwhHm7ryihIXBq1nz07y3pFRgkaMqvzUrJ96OCp1fBOyrIkZr/7ZLYmjDeZG03aWM
         Tsjq4iZsO46hQTdbqQWkXVHuG2E7tGWAX7fdM328O6R5xCGnVK2AwppTNJrWvM7/eLQT
         8ROPhq0ddGuCRRmPvVdCKeb05OPmDn8eptdv7RAw0gUtnpRq7v7yMxX/7vKwxY2/l/JW
         4dPbLoINt21ANbgAz0dZSRnAmshfL/YL69LOmk4oRA6Q1yk9+xXthgsKEWeJSCdIDtlh
         Yu5sLoFf0gQ9Nva+kjUeXf882qRwIAQsFUOtKSscbg44nizAQqJv13LPa0vzYy04HzYC
         Pr5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dHfag9uJv/TYaItpMIVcEE99FJGP5gU8YagFEMRguHo=;
        b=ZCLIhw7LztYOKy17gjYmlb8X726GwK2WKYYQqlLhdM8v+5iyyovwC2v2YAOD/u52Aj
         wxikClnq0aANrLib48sdeS55Ty+6HKW2HTBUSsT8ZO5EHDm/FdFG1sjuaQXeNMq8UwZR
         TNy8+Q/Vycy/R+H1J8h/6zllzqH8hBnj3eMEdY/tgIECiKHaX84S7LFSNAybULFoNXkT
         sSgVrXDv4RQT9x/u2fpi4l5V9chRZ4KLyEPvTVAmLBSRtDxa5uV0HX+rbHu/3Axz1blG
         7mOxfDCsha8oF8JEiJWZ1I4XX2ZAt3b4zPXSrWFyTByQk8JPlbDnVh9WcOCD8s9tMwjb
         TeWg==
X-Gm-Message-State: APjAAAUVxRcOGKLL/8lHNJx/pXmutEuGoHtKCG33jPib7nps0Ev11Rn6
        UWDKr95CVlhhfOnfmBefAMS7srZGrJQChv7WWoa0hg==
X-Google-Smtp-Source: APXvYqxR4BBWrQ23UMju73EpOAQ/mHqvkz3ckbI5YrShb3DERU3bkSGvpyvgweNKSGHg6ygLr/3x07L1QnrBulWdPJM=
X-Received: by 2002:a2e:9784:: with SMTP id y4mr4213595lji.77.1573682895024;
 Wed, 13 Nov 2019 14:08:15 -0800 (PST)
MIME-Version: 1.0
References: <20191113131629.3861-1-brgl@bgdev.pl>
In-Reply-To: <20191113131629.3861-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 13 Nov 2019 23:08:03 +0100
Message-ID: <CACRpkdad3viHWn+mwxuLT5SBggRvQB61hE3V2rjHgx6pgF6Q7Q@mail.gmail.com>
Subject: Re: [TRIVIAL PATCH] gpiolib: fix coding style in gpiod_hog()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Jiri Kosina <trivial@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 13, 2019 at 2:16 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> There should be spaces between logical operators and their operands.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Patch applied.

Yours,
Linus Walleij
