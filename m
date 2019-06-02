Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6075F324F0
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Jun 2019 23:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbfFBVQM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 2 Jun 2019 17:16:12 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42628 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726817AbfFBVQM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 2 Jun 2019 17:16:12 -0400
Received: by mail-lj1-f195.google.com with SMTP id t28so3170522lje.9
        for <linux-gpio@vger.kernel.org>; Sun, 02 Jun 2019 14:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8T1+dzGUPlJZVWoAd4z0z5Aw8+26WylLPddNn2kXCoc=;
        b=uDmeWBSvPWwY/Xcy/Wo9gAyyBjdAFFuYsO9c0BGFxjn5LQ53aVpbRpWvOXf2eWKg/F
         WUhTFNpxcWNpt9DVQ0UMRY6VxeBiGh0NPAQYnNwVp27n9t0j/MhEwrOPGtSpyPaeZTKe
         JfAgAFZbQQ5UBl+6WW04X/JPFkDciPAmEiR4yhvm2TbtLBobUPk9jcDwlssE9Pu5MDtx
         Q75i6qPb1T/sQv5ZTTvZvP6zZ648T9f0YE7vCRMciSW+flIP4FD6Dw/rX9R1Tuy7Ujkn
         MDdphixEgYky8kpKG92NdNZDS7j6TkNj3jz5S1ue8edGTX8v5t31GzchhxmLc5953KxH
         to9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8T1+dzGUPlJZVWoAd4z0z5Aw8+26WylLPddNn2kXCoc=;
        b=TbK942D3PyVi1DCN1mYPrLxsnbHAGOa+Oo87Jj5LrPOgQnbokVrq8szZ8o0L45WTYW
         6nL82Oj82tRCli0q0iVzR4KHM/L1q6WXfj1YuF5waBXxFp/9f1Q/hnH81lv7qee46hIs
         p+wGmWuEkLfuyGfAL5+M+RSLhBYkP+oZRwXq+9OGAiaP7ZtVGfdtfvo0oxeqbgC/gUVu
         IJQucJCVBaOjLNWdhdpwBL9dUiRfhHeTForRC3GtopR9xN1rSlNyFsFb+d3H00fBrIym
         n2GH8vg0mwcqtgvuXTp5leJgsGWn2CPsRS9qv9Yv8y3jUJUGf0YNVmNHC3nGAStyfyE9
         rAZA==
X-Gm-Message-State: APjAAAXYgJHd7aRRa9w8q1TZXSv9jw7OVZvV4U47p6xpaz/gp9FeXiH/
        GbXLYlTbUtOVv2ECX1/2qU8Bl6mpgbgoG+ZDERwHbZ8F
X-Google-Smtp-Source: APXvYqzEv3XI8HR3NBUpLPPC95bB8sLdUXohJYVJ3o43AIA9+P/PValMvXaa/HUyGeWYox7xSBnMajlmovu45mYeBLk=
X-Received: by 2002:a2e:984a:: with SMTP id e10mr4201055ljj.113.1559510170002;
 Sun, 02 Jun 2019 14:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190527124051.7615-1-geert+renesas@glider.be>
In-Reply-To: <20190527124051.7615-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 2 Jun 2019 23:15:55 +0200
Message-ID: <CACRpkdborVXy+DF=PkAUqwF3XpbHtBTVJdd-_jPRXBQU9Ob_zQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] gpio: em: Miscellaneous probe cleanups
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 27, 2019 at 2:40 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> This small series contains two cleanups for the GPIO driver for the
> venerable Renesas EMMA Mobile EV2 SoC.

Ooops I missed that Bartosz already applied these, took them
out of my tree again and wait for his pull request instead.

Yours,
Linus Walleij
