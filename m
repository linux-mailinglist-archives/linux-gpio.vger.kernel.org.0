Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 684752CCCF
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2019 19:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbfE1RAO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 May 2019 13:00:14 -0400
Received: from mail-lf1-f48.google.com ([209.85.167.48]:32787 "EHLO
        mail-lf1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbfE1RAO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 May 2019 13:00:14 -0400
Received: by mail-lf1-f48.google.com with SMTP id y17so7304061lfe.0
        for <linux-gpio@vger.kernel.org>; Tue, 28 May 2019 10:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DXkborpUGbDPifiNlUpy6rUL12XQjkzygNPgMFHDMC0=;
        b=f3Sq1c3UTWpxQ3ZFPFbMV8q1BD7qvmp4z1RHs4ts5oTYwNxiTD8VYgaIjm8lZuaBYR
         yFW6xFQwQH5dK1o2TAbYLXa0U03wtX/DTxtVLuBNAq65SjiGy8KBUNaqebW0tX/PtErO
         Y/rq2GyvU7tHadmkNg0IZ/7n5J4DxgrtKLUhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DXkborpUGbDPifiNlUpy6rUL12XQjkzygNPgMFHDMC0=;
        b=piq1Klm0IwBOI7Ht2TGXfUCRsOvlErnmbyuB9GUJ4nlhcLJmhSWx0I1fzvr0/tiG2U
         9Ij6jy84YljjQ5o5xEVNR1ItCecCU4S9xK3IEAhBEXnf7j0lTtkb01srjMTKOeyT27hQ
         q9bHNlxJYO1cOplY6ubUf66OFlHEqwubQidDHvmQDB3Buhl0KvIPlF1LUkgHEjqIZ60x
         QOVG6hIcdZwIkX4WU3G7wFVPCpLBQOEAblj9klogUvldxaVGySexBI7xcvT8fYTzXVn5
         v9QTpj8F8zIZAIw62041baIBT9V9+MyLPeknTmdIrr+VUEAAUFYGdkbZcqgPO4Ra+KY1
         VWbQ==
X-Gm-Message-State: APjAAAXWIOyNW+yYEz1klHHHdQRgTMAjlAnjFf7cKxDsqvMKKjBOwizn
        E42Vm66AL86OwiB6XdtWjvxNrK7F++w=
X-Google-Smtp-Source: APXvYqw8PVSko3mhMzHXFAyAP9Q9ZhuvByQxEvGN0cLDMg9XjsGb9VbM/obs/+7qH8vv/YUDe/XWGg==
X-Received: by 2002:ac2:5e82:: with SMTP id b2mr8490183lfq.3.1559062812321;
        Tue, 28 May 2019 10:00:12 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id m25sm3017428ljj.92.2019.05.28.10.00.11
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 10:00:11 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id 14so18431357ljj.5
        for <linux-gpio@vger.kernel.org>; Tue, 28 May 2019 10:00:11 -0700 (PDT)
X-Received: by 2002:a2e:6109:: with SMTP id v9mr13036951ljb.205.1559062811229;
 Tue, 28 May 2019 10:00:11 -0700 (PDT)
MIME-Version: 1.0
References: <CACRpkdasSjtspciHijdc4mQyNvQVSgYMgsZKaSn+ZSvsev6t0g@mail.gmail.com>
In-Reply-To: <CACRpkdasSjtspciHijdc4mQyNvQVSgYMgsZKaSn+ZSvsev6t0g@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 28 May 2019 09:59:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjmFvymPQ7uL8xEedcVOD9WShp91PS_CyVSeN4aE3Z_fw@mail.gmail.com>
Message-ID: <CAHk-=wjmFvymPQ7uL8xEedcVOD9WShp91PS_CyVSeN4aE3Z_fw@mail.gmail.com>
Subject: Re: [GIT PULL] GPIO fixes for v5.2
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 28, 2019 at 1:36 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> a single GPIO fix for v5.2.

Hmm. This didn't get a pr-tracker-bot response because apparently you
only sent it to the gpio list and it's not tracked by the pull bot..
Maybe gpio should be added to the lore-tracked lists? Or you need to
just keep cc'ing lkml too, like you did for pincontrol..

                 Linus
