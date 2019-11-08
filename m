Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A039F439F
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2019 10:41:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730224AbfKHJlB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Nov 2019 04:41:01 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40229 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730945AbfKHJlB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Nov 2019 04:41:01 -0500
Received: by mail-lj1-f195.google.com with SMTP id q2so5486649ljg.7
        for <linux-gpio@vger.kernel.org>; Fri, 08 Nov 2019 01:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2zqIy4ApAQULTvACWcJQGtZM4g+VTM3ApQJZknziE+I=;
        b=o6//3qQjs2XbV8fThk8UCefcdkesd3AmQR7rJ8rMwsHKi6oKj+Bw6bLafrNZ/wjTYW
         kjuWctTGryuFJ8FOLZSIoH0E+5AE0I12JeuHDZeL4MyKGTiuyDjeSyANsa+3g+UjeGa7
         TDwhk/ppmHWY+2czywQkTeCRX6aGkqY8EG0CViJPjm4Ji/LSBdkJjsfYRXCZVEJQD5Te
         PdMW0CC49uF5X1vJCj1HRedwDTZEevQ32q7PHfqmuCXTW4QSrJoydnmfdBuS4ZFhf5VE
         3ShfAi0qZjZ0adBw2cbWrEmShZ2OjDlJnK2D2+OtDvhl5Ausju71W1JmSFaalPiTGY1L
         4vlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2zqIy4ApAQULTvACWcJQGtZM4g+VTM3ApQJZknziE+I=;
        b=rGGW6kn2jSRU4YQ6HHXtOViUwVRqvRDtham0aaS72mxynJt2ShQwARN1uc70EKD238
         4kfv6rkTCjtXzf4scFkgyE53HaYLJ73V6qk7epRrnxRs0aqIIpZkA6QHQbwnyhzYFWAG
         PR2yiQ90qTGXiMZkSgW1VtpQqQ/0yGi5PTr6cCjaeFxf3IuRdidMVi/s8tLgIbzLuo81
         tKy+p3l2apQz1f4IAi74+5anOXtXt9vsbyqSJqzfngUZb/TYDggKLExOJ6wU4j3SOyPx
         CMLhUejjSQ+Tygl/89X4DiVuH0E/GkXhh6y3QbOLfz6iqZcVTtj78PRo0NJtFtAWmAPQ
         wv9w==
X-Gm-Message-State: APjAAAVcOr5Y9YH430+JsPB5vV/NJSmF4HBEcGA6+WifL35fLnBEp6gt
        btn33VDWXeWmkw9PMdXhXTE/uvXW6epef3aHc3qpcg==
X-Google-Smtp-Source: APXvYqzuTmfGKfpR74XSrK8V+hihH48vRo2AEVGYdN8z4DVmO//cgwwye+m9+SaG4J9/VHQmlXP9ZPZmejs6iDCoCaI=
X-Received: by 2002:a2e:5c46:: with SMTP id q67mr5842160ljb.42.1573206059073;
 Fri, 08 Nov 2019 01:40:59 -0800 (PST)
MIME-Version: 1.0
References: <20191105203557.78562-1-andriy.shevchenko@linux.intel.com> <20191106173055.GQ32742@smile.fi.intel.com>
In-Reply-To: <20191106173055.GQ32742@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 8 Nov 2019 10:40:47 +0100
Message-ID: <CACRpkdaAxY-8A7gindeA8fsQ9rEdnwp8k90CyULxNs4J5VBSBw@mail.gmail.com>
Subject: Re: [RESEND][PATCH v2 0/7] gpiolib: fix GPIO <-> pin mapping registration
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 6, 2019 at 6:30 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Linus, I think it would be good if we have first 3 (okay, I noticed you have
> pushed first one to your devel branch) patches to go to v5.4. It will reduce
> dependency burden in v5.5.

At this point in the kernel release cycle I can really only apply
patches for serious regressions. That's the policy I need to keep
to.

It also causes a problem if I put dependencies on Torvald's
tree this late in the kernel cycle, because I need to get the
changes back into my tree in order to base new stuff on them.
I can't really do that until he releases an -rc that I can merge
back.

At this point I'd maybe have to merge back v5.4 and that doesn't
feel good at all.

So far I applied patches 1 & 2 for v5.5.

Yours,
Linus Walleij
