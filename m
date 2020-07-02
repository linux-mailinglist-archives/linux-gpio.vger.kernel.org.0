Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44FD2212385
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jul 2020 14:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728918AbgGBMjM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Jul 2020 08:39:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728848AbgGBMjL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jul 2020 08:39:11 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7199CC08C5C1;
        Thu,  2 Jul 2020 05:39:11 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id m22so3040632pgv.9;
        Thu, 02 Jul 2020 05:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sdU4B09dAgfmv+NSF1Ehbxcb/S+UYN6iJuAJ1MQXdVA=;
        b=mH9flt4ourtHu+2z7DKI/6vJsZ8b7eJVIKE6Ecyekaj4h2Aj8HLuOQMUGa7nJvVeQz
         kGQTmfR+k3HhbYyEMMVKL3e8bEAjKk1TfzdC6z+4FogELJ1u+VTmBx/VDZCpheWDM4lo
         yyDBsFA7YQKFPUyYGsGrs+InnwJ8ewyz1RqWMD5Q9sscvHnFXOZ8Yo0H8vvq+tJ7PiZ0
         6CQEDzYML57gO3IB9Y3YUGVVJEWbNwJwDaN5o3a5RbA3p1neIu9msZjFmp4YYtYFl5Ca
         nG3P6YRZ5fKH5zzbvDVz/koGP0/TXrmX1TdYTv2FPsENVsO7eG2KRcLXdyYpbV3MfTi2
         OcPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sdU4B09dAgfmv+NSF1Ehbxcb/S+UYN6iJuAJ1MQXdVA=;
        b=TOh6pxug/lSzE9UpIQR5oD620+yNWOHgonf09UMW5T1BeMeLekzlvO9cofbfNiURED
         teQvXu9vro380EJVh5l2VHk6omwR5908mCz9JQttorm5gjd9uVfn3FjSkIA+f1aufWVD
         mT+JUxnRYFdAH90hjyRaq1WpSi9PuG5gunIAyFJ+ueBMvl/MyfBki6aX3mlAVWzwwc3r
         Ptn2nO7m0nWvF93LaOW4NWrkApeEm70qbTau9aI8gASmxCMB86nZuqnqrSO3wrnlItmJ
         iVea0BfdfaDnFHEMxsdSjT0DlA8y7q0utVy5eHoZRKJjRWgyeP1kKNvVn+JZXeUqxlVV
         nTqw==
X-Gm-Message-State: AOAM531rzAUVJLhO1ioBYK5HwwP8IDT1Fj7pYsMSnwfsmZfzBeGvxVki
        L6uAYBRpRZbNcxsptepJAAfzX2CgiC/OpI2Az3Q=
X-Google-Smtp-Source: ABdhPJwWhq3hbn8G3mt+7xxjmBp6veAmQR8VNCpR5TwzEs5Ia4HtHbZzgI32UhGqFwNDqA7m+eFz/5V+/VHTstvee0Y=
X-Received: by 2002:a62:7657:: with SMTP id r84mr27587054pfc.130.1593693550975;
 Thu, 02 Jul 2020 05:39:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200702121722.1121468-1-mans0n@gorani.run> <CAHp75VdSWxcAQzWryKoMfzh8xM_2ZRF6Uk+8pveGhmt=prOAVg@mail.gmail.com>
In-Reply-To: <CAHp75VdSWxcAQzWryKoMfzh8xM_2ZRF6Uk+8pveGhmt=prOAVg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 2 Jul 2020 15:38:54 +0300
Message-ID: <CAHp75Vf+J2vA2c2WiGuFk8jbTkynYSF8bvab0_17xjXgKCy36Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] gpio: add GPO driver for PCA9570
To:     Sungbo Eo <mans0n@gorani.run>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michael Walle <michael@walle.cc>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 2, 2020 at 3:36 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Jul 2, 2020 at 3:18 PM Sungbo Eo <mans0n@gorani.run> wrote:

> > +       s32 ret;

And why not simple int ret; ?

-- 
With Best Regards,
Andy Shevchenko
