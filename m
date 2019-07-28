Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 147E3781EA
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 00:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbfG1WCu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Jul 2019 18:02:50 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40146 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726103AbfG1WCt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Jul 2019 18:02:49 -0400
Received: by mail-lf1-f66.google.com with SMTP id b17so40672994lff.7
        for <linux-gpio@vger.kernel.org>; Sun, 28 Jul 2019 15:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D97GiV2zjliG05FCmmKHimhjxGqrt+6hvc46zTJ3N/g=;
        b=M++hQSZT088Q+I7VrthayIDJusWd0Q9cTsyvmgd05II5PpwvsIXEWEtkKsb7zUR4jk
         BxuOxyeSgHoEOvZkzRhXl/n1KklgMksJGGMsDIdBbJ01ssxWpq58eBN39X9GlISHS1zp
         YrpH22J8Aj4mfDD4SP8tz7KzVDea2F9+w6NvcqhS/jpaKWg/C0RiD5+8FTA9ItWSHnM+
         +zGYm62H+CZMdfxdt2s6ZyO1GjYbNUVXX1b7x4QXnKFn7CBX6kv2GYBUrH/C5+Pt0WTu
         nOYkhpuy2llh054WbHAFjJ3OysnnQkK2nR6CSanRbPYdGDBx4/7piyLCkOz/+uWHP9ji
         VH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D97GiV2zjliG05FCmmKHimhjxGqrt+6hvc46zTJ3N/g=;
        b=J6D7h37J/jdBQzfVxY8zUuXEsjYLYEu1c6mzXvW+jJZlMYJzLL29kyidFm6IEell22
         2LYaSPeRi5MZKJqrCEYh3PrwhL5Yu2qaYTDwpJpt8PI/7yw9fOF9E2vDTiFLNSYIG+yc
         fbrs9LYtMipWr9JZMAm362oBxY2bPFSGz+gGTwYJ/BKbBdFfHyqrFSYAex/F0MaxoVDE
         3DczqZ87x9AAUwRlLEVlqlDvG5GMKTkqVAYPHBKdlgaXRm+HgCaygDxbxFKx2btZADC/
         km0jUThGkg+AXxI+49NOLqjvEJPojVmXFF8XEh2fyiS617BiP7OMbSzRbJatU168NaHe
         IhEQ==
X-Gm-Message-State: APjAAAW3JzI1PJCD741zgn7ruo3TVH9MAem3Oozb7G68M5Sz1Zp98wpA
        IqlMIlFdmAeZ63ft63RMPiMWKt36tzdHaTxE9Btaow==
X-Google-Smtp-Source: APXvYqx++MDRFL3YR0qvlj/ZonTl8VxH9hzquyKvc86+3nJZNfQ68/uCC51c02cFBjWHL9vmbLKxf5BYkKaaSiGbLCk=
X-Received: by 2002:a19:e006:: with SMTP id x6mr48839895lfg.165.1564351367853;
 Sun, 28 Jul 2019 15:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1563360659.git.mchehab+samsung@kernel.org> <07b6de638cb80767dd3ea2fdec8b19ee3ceb60a7.1563360659.git.mchehab+samsung@kernel.org>
In-Reply-To: <07b6de638cb80767dd3ea2fdec8b19ee3ceb60a7.1563360659.git.mchehab+samsung@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 Jul 2019 00:02:36 +0200
Message-ID: <CACRpkdbSssyXo-2tzjPGDhfhVt6rEuD0NBV2t3XwM54g-xR82A@mail.gmail.com>
Subject: Re: [PATCH v3 18/20] docs: ABI: don't escape ReST-incompatible chars
 from obsolete and removed
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 17, 2019 at 1:05 PM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:

> With just a single fix, the contents there can be parsed properly
> without the need to escape any ReST incompatible stuff.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

This seems to depend on other stuff so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
