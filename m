Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB42B0BEA
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 11:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730683AbfILJu7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Sep 2019 05:50:59 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43032 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730618AbfILJu7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Sep 2019 05:50:59 -0400
Received: by mail-lj1-f195.google.com with SMTP id d5so22968326lja.10
        for <linux-gpio@vger.kernel.org>; Thu, 12 Sep 2019 02:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AdRYvJPvrvcMWGM+o4yy0OFD2vjnmvyON9CrpokCAF4=;
        b=HURvKWzzNwOqIen9JLlFUszay1jwdNZrVw+OUaJH02nSfnCz7CvVqGly7LHz9KIuZ7
         bKsfyElQz42Rb9UJ+K9Eln4wIYBxpxF6UB8Oyvfcuk4UOylGJp8BgzBCztTU5XGTjIXA
         /EazIGzMT/Ufyzj/GQwAnE8XYzlDVQsi7M7e/LFyegdzNzZpe2cExDQwbzE/Ut0Pazoi
         N9xccxUwAy/4SLZMOsbGpm9v1vLWTQdDkVNT0FWxy5TNEtyeu29v9s3s27fYgKJEoleo
         lvtUF12sc5KZlHTwTcO2NVnE+6d6mlppSg83klp1qrOk6NwfyRu3qf3dsLG9dyPTV1tB
         qe7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AdRYvJPvrvcMWGM+o4yy0OFD2vjnmvyON9CrpokCAF4=;
        b=mqGvpm+jOnwYeb8yBF/ALo2Bp56GPXzri2IJn+KnQevcQSS7C//kKlrXk/fSCuCDVf
         Xk45P80/T6zMbP+wF8d8ArJ9d1S4c2HXEDso4lZf9l0z0ACuFoWdMqDc8GlLa4Mb7Ecy
         C+a6Mo88mq8c5Gm0ccTIxjjFAILWQHpPorhQuZwYCa2JTZIR30X55NTz7EunVjZiHwRh
         qoAe6aEEY4W56KYVq1uBQkO6J4C8vEFDpfilUSFfDRMpxzeU6kiz15fJU4F2XviMzYI5
         xIIsNyjsOehO0N04tlbjnMB2BqSeLJNWrAb30fEkb5FHVthac9ppJW8WgcBrXI5mW26w
         fbpw==
X-Gm-Message-State: APjAAAX4GVYVcZ26Gc9XUW8mttG1quRCiKI5vLymjKb4CL0e+OngRDrI
        jWo54mRjaEN+YH7f2FtDosNXd6l8zVuG/Uwjn4UQQg==
X-Google-Smtp-Source: APXvYqwzwrb438IO36oEfPSf+7fcsnQVQMy0lMdYLWC5HSg6an/q4RM9Kwj8Y1/EdXgPTXqwidtFWBMIcHQToquQEKo=
X-Received: by 2002:a2e:a408:: with SMTP id p8mr25758282ljn.54.1568281857654;
 Thu, 12 Sep 2019 02:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190911075215.78047-1-dmitry.torokhov@gmail.com> <20190911075215.78047-4-dmitry.torokhov@gmail.com>
In-Reply-To: <20190911075215.78047-4-dmitry.torokhov@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Sep 2019 10:50:46 +0100
Message-ID: <CACRpkdZ61S=xCA8TQ7m-qN8NaXKjTyWBFqxvZC=qF6b7_nuNzA@mail.gmail.com>
Subject: Re: [PATCH 03/11] gpiolib: introduce fwnode_gpiod_get_index()
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 11, 2019 at 8:52 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> This introduces fwnode_gpiod_get_index() that iterates through common gpio
> suffixes when trying to locate a GPIO within a given firmware node.
>
> We also switch devm_fwnode_gpiod_get_index() to call
> fwnode_gpiod_get_index() instead of iterating through GPIO suffixes on
> its own.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

So I'd like to merge this as well for v5.4 because I see where
you're going with this and it's nice to have these APIs in place
for that.

Please rebase this and the other one and resend!

Yours,
Linus Walleij
