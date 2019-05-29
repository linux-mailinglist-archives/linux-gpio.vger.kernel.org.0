Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5727C2D581
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2019 08:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbfE2G3n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 May 2019 02:29:43 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33983 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbfE2G3n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 May 2019 02:29:43 -0400
Received: by mail-lf1-f65.google.com with SMTP id v18so1036670lfi.1
        for <linux-gpio@vger.kernel.org>; Tue, 28 May 2019 23:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dNDl5zrfXJUOpfS4zJAMLSwolVcbmwtrabYRYt62kwQ=;
        b=lNzIY0XIHn8WLqnhPF9gwlNGY8t7qBr7LC6Dg5I5aH/4phsRRINzJGGYNjQQo+jKZf
         PHRa7+bBJuC8xIHOCoCKBnRX2GxIqV7kWaKNSCe/W0npHkpZ5RuBzSZ0V606EKQfvWhG
         Z4aOfWHiafEkFOraRRsP5J8OQIyhBYnyXKYnWMfrQOaABYOVqdqXEsYSb+98N6ZGF5OQ
         FLxq1DE8kfyD2+eXJblNbdoLma+Jeyx65xk0beEObKr6mVfXUbzS1NOaY0Yng1BlIB/Q
         OMNMTN9E9b01c2RSA+moypG5zLe/rAOAFVMxKfg45x6jVJci0IgkBurpmpUEYHPlRzCp
         ibhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dNDl5zrfXJUOpfS4zJAMLSwolVcbmwtrabYRYt62kwQ=;
        b=Cfqm9jVV7RqPMAu5eH7eg+bWdZlDTer03Oz38pShCvwXnrJw2fSMAdrpgxukW7CgAc
         5IS3ILe6W9JyWAs/86mtgja+NY/bR7qA0oow/XnR9fDWiOqMCr1HNAOJEKJnc20HXrZ/
         mOqZH5NwDIowgl0KXq870WNhIVZxkZ2pUnp48wTbCUO9Gtk0Lrn1ozta16ZxsxI8cGVX
         UW5XNkyr1AziauFYZnSfA4OnQOVY640vVipBq11ZXU8nEEmvACuLnFz7GrU09ZU90TRO
         838F6t7R3TcxlUNx1G+gtQ9K6MnxqL7WnMV9SucC3in1Ay+LlVJfP3qt2QfLMqcOpfOZ
         wbJw==
X-Gm-Message-State: APjAAAUI31KLqWdAZGZyKl/gr7KMZcRT1DI4lPdmvY43Zsj0GvoNBKaf
        D86jIw7AZom2BS6aUMUPEFi8h/gpQffPU7LH/t99wA==
X-Google-Smtp-Source: APXvYqxVBxWIEg1Mjc1CcBd45SSGMfaP+hh09hu4X3eBVztURASZYBXYFAj17o+XRZZbYiHGn/bR0l/Ztu/UocLqAxs=
X-Received: by 2002:a19:ae09:: with SMTP id f9mr1621776lfc.60.1559111382004;
 Tue, 28 May 2019 23:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <CACRpkdasSjtspciHijdc4mQyNvQVSgYMgsZKaSn+ZSvsev6t0g@mail.gmail.com>
 <CAHk-=wjmFvymPQ7uL8xEedcVOD9WShp91PS_CyVSeN4aE3Z_fw@mail.gmail.com>
In-Reply-To: <CAHk-=wjmFvymPQ7uL8xEedcVOD9WShp91PS_CyVSeN4aE3Z_fw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 29 May 2019 08:29:27 +0200
Message-ID: <CACRpkdbYRzTNp7x7ysHBv9SohUFEC-8zbRQLfj0uQPOF+BJBGA@mail.gmail.com>
Subject: Re: [GIT PULL] GPIO fixes for v5.2
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 28, 2019 at 7:00 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Tue, May 28, 2019 at 1:36 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > a single GPIO fix for v5.2.
>
> Hmm. This didn't get a pr-tracker-bot response because apparently you
> only sent it to the gpio list and it's not tracked by the pull bot..
> Maybe gpio should be added to the lore-tracked lists? Or you need to
> just keep cc'ing lkml too, like you did for pincontrol..

My mistake, I usually CC the LKML and I should, it's a nice place.

Stashing up all the kernel subsystem lists on lore is however a
decent idea anyways, I have to purge old messages from my
gmail all the time so it is nice to have it around forever. I dropped
a mail to helpdesk@kernel.org.

Thanks,
Linus Walleij
