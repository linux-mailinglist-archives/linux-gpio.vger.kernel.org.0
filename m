Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 327B2196046
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 22:14:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727444AbgC0VON (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 17:14:13 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46422 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727423AbgC0VON (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 17:14:13 -0400
Received: by mail-lf1-f66.google.com with SMTP id q5so9020927lfb.13
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2020 14:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XaIaaULbP3McQWHg8W+/o/1CYRBruKdNlh+486HcGCM=;
        b=qX+gRLGFRJd3ElguqkNQqQ1OshtdqoG0XuATUd/h5tKBo00u2f17T9Fniq6VztFhqv
         saK8XXwTdBDTw9Cai55RTVxGBbsQ1YaMMD9pR6C+3d7CQxZVvXty2cMgo7goryl4exdy
         gCWeipbiUZ22ewiuX1E80s2NFUlT7pLNwPPCqaD4QTD4q+PVBOUkJ99HRl440D6LiGfm
         MbX1iGfpZc4Xownq6lyJp6r7CNz7TxynKrN5ZMzW2BzMcDVIfKFPHpNX/lzeNO+SCP9N
         OIPVSonZ873YmQ+LfN+slXRRpdBgCd6YKyChvDWPgHWNFugDmv1vf8PSrtyLLtrgYPCc
         UnWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XaIaaULbP3McQWHg8W+/o/1CYRBruKdNlh+486HcGCM=;
        b=flDqZ7uLPQvw0AM2/HWy7Iszi7Jf24Y7YGnaPdPvSK+ySM2fbGAebiAMFvOeb24BWD
         2DPVFku0BjzfXlJRnLSxMElfXhYTu7ndsc+6cQWeBNMHUEbYv85uhqfI9rZBLAQnxV9l
         6avnXzLcfxce2+6nlzyf1gs4KAq4g+4qvYBiCYsfwvmAnpPq32RAJyPbKk8QIl7HsQaE
         0jQoUO5bYmySTzXq9a2xcxosbgBqEwU3NjlJuCREQw3RWtGG5fnzRYKgccgzzUbDAhla
         J/+w6oXSrQPVyi+ItmMvys+LzNF0qD+tLXkfJWMB0FINQPRMIWImIGjEg9eDJGghFOU7
         K5bw==
X-Gm-Message-State: AGi0PuZMyp20hDmJKJaSpmHuwN9HIAWqwwmcmYXLc4Jzz2SEgKF2vhLX
        nARN4rPyOkLrkF69u5N8sdzza7EZJ+CkL3bgZRbHhw==
X-Google-Smtp-Source: APiQypInNZ8StO0YG491G0Qh82LO28Kdxjyb+vEZxtIJy87j+WsFkKeAnw2pshXxgw6Ns3g/B8D5t4FRjpOdDRr5uuU=
X-Received: by 2002:a05:6512:6c4:: with SMTP id u4mr757685lff.89.1585343650678;
 Fri, 27 Mar 2020 14:14:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200325103956.109284-1-hdegoede@redhat.com>
In-Reply-To: <20200325103956.109284-1-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 22:13:59 +0100
Message-ID: <CACRpkdavyR7FRGMZFHZUvRhm9PL-X4SQQszN4HQn-+qpAhJnHw@mail.gmail.com>
Subject: Re: [PATCH 0/1 resend] gpiolib: acpi: Add missing __init(const)
 markers to initcall-s
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 25, 2020 at 11:40 AM Hans de Goede <hdegoede@redhat.com> wrote:

> I know it has not been that long ago since I send this out, but still
> I have the feeling this one seems to have fallen through the cracks?
>
> It has already been Acked by Mika, so if you can queue it up in
> linux-gpio/for-next that would be great.

It requires the fixes I just sent to Torvalds to be applied first.
I simply need that stuff to be upstream before I can apply this.
That is why it is deferred.

Sometimes it happens that random fixes are dependent on
critical fixes, then the critical fixes need to land upstream before
the random fix can be applied, this is one of those cases.

Yours,
Linus Walleij
