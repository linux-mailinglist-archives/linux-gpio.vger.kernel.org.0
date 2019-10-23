Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C587BE1913
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2019 13:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404623AbfJWLa5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Oct 2019 07:30:57 -0400
Received: from mail-ua1-f46.google.com ([209.85.222.46]:46358 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404629AbfJWLa4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Oct 2019 07:30:56 -0400
Received: by mail-ua1-f46.google.com with SMTP id m21so5889860ual.13
        for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2019 04:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pDTx5M6tss3Is5Hp4mr/ygrdLIYmfNg+Kk00vVJKrlQ=;
        b=O6pFPhuuDss+eHSXRlaFx4X9AtpMs5fJdcFLpLPoQijr06Nv09ttyBoNyRXQdkW7w/
         vs8FhZ52uTDpyQ/lSlvkLAsk4AVy/ZnWmvwM8wuRX6B1zYgz2cz3NrcHIshQNhv00SzV
         e1cvhMgNQkICNU4wstHRm5a+hT81+FFOVA+if7IVOFUTZ6Ikvw0/Jf8EnH/FiS5oRKte
         F67oGQtyqB5y+2IewJIm9ExUHgMhLkb5PnZmpf+LoKmWqtTiNnJUUS/niBYAcVsAVaY2
         D1AQF1hvL3C7Kf2uDsMr0i+WtFs2bAhPWh2gE8LbkYrkHrCKGfNX3gKw9uV6e144Us4l
         ulSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pDTx5M6tss3Is5Hp4mr/ygrdLIYmfNg+Kk00vVJKrlQ=;
        b=fsRyLDA9ojrtFaqNL+yLqaBqP9jP/T7OSb4nh9LLb6mfsY29zuSdWaZd4nIAwrSYtN
         mWHiT9R7Okc+oYR8ZjiD2AYyrTDzYwsrlZvC37j4HfAMI+weU0y28aKrkl+CCuW6KO+I
         a0SXrO4H5w6uK+LieBtHgC9abYfSr/6p0d/fMYEbEE6XkVuUlvxq4JDmQfvVokz4rid7
         VXFrd0+TkbQ72K0ydA8O85R5YB2I3U0bRatG+fQ7WK9sMx6wZY3yYdAP4ZwKZZVvhhK9
         dHIcPSEV9tFof9DrANbTqzMgochjg+aKxCvwZdkVDgLfZxC8fppx+M5DDKFbzL7Dw/NS
         2sOg==
X-Gm-Message-State: APjAAAVP6m7LoJuzncvW9WqoRfiWJXh4PI/P8e/Fuy6+O29IFIHtv9Cf
        kdw0XO1WioIbKm59eZSKuoJesHCsDcEKALvTJLZfZA==
X-Google-Smtp-Source: APXvYqzRa1p6QQkOHsnaNNvmVmL59i/uQcaik69vIkcZjI6uKWyVKkdOCKZ+FIhq7AJKciL02FBiZ8gxQj8tEpYrglY=
X-Received: by 2002:ab0:7043:: with SMTP id v3mr4975286ual.84.1571830254007;
 Wed, 23 Oct 2019 04:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191022125807.14998-1-brgl@bgdev.pl>
In-Reply-To: <20191022125807.14998-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 23 Oct 2019 13:30:42 +0200
Message-ID: <CACRpkdb55Whf-Qiz3hw+EGHwqZ8o4VJ=DcvQXWURRKaf1wk38A@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v5.4-rc5
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 22, 2019 at 2:58 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> please pull the following fix for build failure with GPIO selftests.
(...)
>   tools: gpio: Use !building_out_of_srctree to determine srctree (2019-10-22 14:42:42 +0200)

Pulled in for fixes, thanks a lot!

Yours,
Linus Walleij
