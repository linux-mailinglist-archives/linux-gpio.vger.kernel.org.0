Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76521160EFE
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2020 10:41:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728912AbgBQJl2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Feb 2020 04:41:28 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:35896 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728903AbgBQJl2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Feb 2020 04:41:28 -0500
Received: by mail-qt1-f196.google.com with SMTP id t13so11603686qto.3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2020 01:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6zaVNRSRzJun5YcaKbjZ725vsEswsqIwLfiHfQHrCmY=;
        b=UEE1O6QNXOq1HP8FELAtk7XSztXmpHLiZW8DlEmMdjpo+KUBmhU6A2WAS4fWl23Nf9
         ryjUpsBSv6VVYL7i9vfSxkap7UV4HQtW7ociYpQEOqSFu4IELfpZT/StYhuU5yvXwFpH
         RtMo9JJVKcjozrS7y5FF02C7kGGFWN8Ia4mYjvdj6ydsqYUCxYQm5jUkBvUTonZ2IJGE
         gbkANVscl8L5OE50RzK2JPWhFyFu5gKD9gR4ztA5ur8NI2Mg+F2Lx8F1sGvXDYh+HRPJ
         9XoIiA7dAjsIc8cs4gCrXZuqi7yCUHYN4E9WjAENovuGd24+Lbtowj0hncdYdXrHRV6z
         DpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6zaVNRSRzJun5YcaKbjZ725vsEswsqIwLfiHfQHrCmY=;
        b=fwfmrZmk4X1ig+e5uC4TpnEdGVcA65x7rsQ45HVFexCEGBlTMZRYfLKrKnlwjwyF74
         erjEoU0Si5hSvp7PtVG0QOcQOR1oLFVQuo0OkL7YMyLl2DTQ0zLZtuqG6R2mtqwGy8I7
         IjZ1TCKRrEV69UgVAxfc2i7SCuca6Mal/DnCP71U3xQlIlWyc86pkaHqSAyuzLGoH+v9
         Nh+LFnpslmaGMyrD2p59WPM8i+g58ySWLKurAkmo9ao6Fmg3Y7SZAdRiSXhpXtP+MCPe
         M46AdS1GCdYwyQuMQPgefTdT0BwhLCXhOKm6+rOY0yq9vXkTfQb4m8FOuF2DprYfpMsv
         zBgA==
X-Gm-Message-State: APjAAAWAd0lQFcPD6V/fbp/LPKlGDM7tuIcaewHeAJexy5VaW11po4vJ
        SLfC+WsppfK7TWZ/hrYDUlJtWgFcQZ9mhneiSLlARWaX
X-Google-Smtp-Source: APXvYqxhbQu1eqvOtW0TVt3R6Mf4Jk8tFIqu6upplvNlzg5Tkez15zWy0zDJUTvUup55bPlfh+oycw/BJQ2nQlxpypE=
X-Received: by 2002:ac8:6784:: with SMTP id b4mr11973280qtp.27.1581932484053;
 Mon, 17 Feb 2020 01:41:24 -0800 (PST)
MIME-Version: 1.0
References: <20200213170904.82324-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200213170904.82324-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 17 Feb 2020 10:41:13 +0100
Message-ID: <CAMpxmJV4Xz+_mB7FJUKNvJYj9PAEMDU6eHy9kd13XERmTBodsA@mail.gmail.com>
Subject: Re: [PATCH v1] gpiolib: Rename 'event' to 'ge' to be consistent with
 other use
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 13 lut 2020 o 18:09 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> Rename 'event' to 'ge' to be consistent with other use.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Patch applied, thanks!

Bartosz
