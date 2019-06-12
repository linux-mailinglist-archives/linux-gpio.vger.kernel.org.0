Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD3041D39
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 09:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbfFLHK0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 03:10:26 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45025 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726286AbfFLHK0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 03:10:26 -0400
Received: by mail-lj1-f194.google.com with SMTP id k18so14100616ljc.11
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2019 00:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qDfqw9BoikhPY0Dh3SwCqBjJ8PAOLKi854XNqLlMVzk=;
        b=yZXhYOCTOo7pIE/Y6X1tztbts791vhqKWYR9ND6YurUQHkPpLW0lfVsBIo/XypbEnJ
         PS2MiMZWypqPhQOItzAZUtxqHZLXCMwwT3RmMqaQ4Ujfa7971kep0Py1s3AUrRMm7hBA
         x4dXsg+lsTj25JteAUKoPkjL+O4V7sBmqTFA1e89ZWfCs6AR5p25o4wfjdhLGT9yEs3r
         22YZt2zh107nLueurni6ZAuHPhGS+kexlKmmjfRqiZLpMu01BLEZVvI6dr6guYGaoMh5
         CqVxay7fjTn4xgX0HvpF2eapSf2Kl6xnOiH403W2RJTmFp38UQJ6p+44uTdlOGAYLMk5
         gj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qDfqw9BoikhPY0Dh3SwCqBjJ8PAOLKi854XNqLlMVzk=;
        b=smkVJP0tPuhb8xoRCmhTKoaF6hopIH63gB2U4EzHrRu9cBa1z/ojyriAWHX37AhieI
         tCFsHlkDU6ZjZjW1v6fmhIZT7Ch/8YCvmufSuERBUYDqn3/2KZ2njVnlAHoq9TR76rqm
         x1GqvWwJEqHKQZdHZWDkZwe3hvtjbQU5y24CUjJGYGQKUjrbxlAY2YPabUASiKLuPZq6
         1keUWV47aGg0jY5GgWdp7YNmmXztfUZwb7QGk4UAEfOfUdvYCIH/6ugKfrfgcRbuwLkp
         nFJ/4v7M4GjNDEwfJXQAsHnvG4bOyqSPQmpPg5QslUima4/rDN1BetIR/8DnF2YxjbA3
         HS6A==
X-Gm-Message-State: APjAAAXLBClm+Og1h2u+JHubI4JMqHa7r+tjuDcQP7tphHFeLbFlKxQC
        Ldfhh5EhUGOck0zjjslwSL3T51ESXBvZWWEgxHhSyb7Etcw=
X-Google-Smtp-Source: APXvYqwNAOR28KWVsRSGhKRPpy6Cz1HQFUNpqvVydgFwWVjRazfmyZ2wGtlHtx3v5KLBIGZMOLibsHpRrNRfkw+PwWg=
X-Received: by 2002:a2e:480a:: with SMTP id v10mr5288468lja.94.1560323424436;
 Wed, 12 Jun 2019 00:10:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190609145537.7953-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190609145537.7953-1-yamada.masahiro@socionext.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 09:10:12 +0200
Message-ID: <CACRpkdZ1B2b3DLdFrtYLfZgJH2QWBYmnX-mBHtO3C=EPc=UC_w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: remove unneeded initializer for
 list_for_each_entry() iterator
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jun 9, 2019 at 4:55 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> The iterator is initialized in list_for_each_entry().
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
