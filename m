Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 720D3136BE6
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2020 12:26:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727709AbgAJL0o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jan 2020 06:26:44 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:46052 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727696AbgAJL0o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jan 2020 06:26:44 -0500
Received: by mail-qk1-f193.google.com with SMTP id x1so1428147qkl.12
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jan 2020 03:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hUroiuU3Fp/xQGIWCTChUVUm4YHTnlSYbmeov1Mp7wU=;
        b=ec9/C3/xxUH5dasOB3ivG/xAk5dmSSCQsxGZf/SSmo4h8munTVjv/vgqrHX5JiiFlc
         Hcjkr5xbDF1S9RRZZJB2ia/E4Fihoy5XuvAejiBoZM3lF5Yu2X62Chywsm4kXCbeaY/e
         kYS6PO3sykma+bRDAPXrBTlYWH/Sa9EzPMFB6osBM9hJn9B+rUDDkSGRC1h8xZSzB0ky
         kUoAYKWkmv4SkeY26hVNpgGdYz9wZBr4+hIl1+iJNqScPEZ54nq3wM1fOkjnbB1+fy2O
         zReKmc8CqM6funBVHMcECA1bDki21/mp9sObNqwyxDSRhZOrseA0FFgMGJs/fLv8HcvB
         CFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hUroiuU3Fp/xQGIWCTChUVUm4YHTnlSYbmeov1Mp7wU=;
        b=pNpJcGIohmJrZdyGHozhaiqot1wf3YjMEvzAto+ttiRyu6zc1n1wvTiUAEbfR7mc5K
         cNWmik+lXhQJmivD93GH46pvqYhgcrOyuDecrdr6Q3XRnAHH9muAbEup6q4RExkJutlU
         l0iF7t97zeI/POvIbDuS225fFUnX+MBY8IHucIG1TBXAM9lzsAbAtc0Ex1hZc25AXz4r
         fGxXhBt3Y0QSE1FvwcECf0F6BChJ0eH8Iwl7wN+qeWDhTc58E16SbVfpK0mmjHfT40eI
         DXJDVUHMYWxEWuOO+XJ4h9wMSrRzBJGN8PAtbkd75YCHFcn6eVbWiVirY7w91MYIPQYG
         dtWA==
X-Gm-Message-State: APjAAAWhDfQKYCFnTliGOyLHZLZCf9wq3MRzk/sZn/XlemTvDzoZaoLJ
        IDvf8KBbKlauf6aVOXNAQ/1rkVFKvrSQG+Jo/0Dfjg==
X-Google-Smtp-Source: APXvYqw5UxC86K015mhQJmke4TUdcIbMdsHE/9kZw6fi4x3O4x4/LVc8Y1PwdK9+KSVdAS8pIOJifZdke9kmjei2l9k=
X-Received: by 2002:a05:620a:12cf:: with SMTP id e15mr2692700qkl.120.1578655603387;
 Fri, 10 Jan 2020 03:26:43 -0800 (PST)
MIME-Version: 1.0
References: <20200108001712.47500-1-linus.walleij@linaro.org>
In-Reply-To: <20200108001712.47500-1-linus.walleij@linaro.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 10 Jan 2020 12:26:32 +0100
Message-ID: <CAMpxmJVwGUQyJa2XvCanzxyZ_VK+EcU_aU69eDYbxJNCDb3NOA@mail.gmail.com>
Subject: Re: [PATCH] gpio: Add use guidance documentation
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 8 sty 2020 o 01:19 Linus Walleij <linus.walleij@linaro.org> napis=
a=C5=82(a):
>
> The text in this new document is a response to recurring questions
> about the GPIO in-kernel API vs the userspace ABI. When do you use
> one or the other? It can be a bit intuitive, but I tried to sum it
> all up.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>


Looks good to me.

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
