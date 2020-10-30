Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3EF2A07D6
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Oct 2020 15:29:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgJ3O3V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Oct 2020 10:29:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbgJ3O3Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Oct 2020 10:29:16 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF7D4C0613D4
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2020 07:29:14 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id 1so3038420ple.2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2020 07:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lHfCFayqq/L6UFJ/D/fDgfG3TnQkRROj0zFvvZ5LS14=;
        b=c/erb2OPrX/6luwxntwGCeMsFmj/ASVxA5pd8z5kPbVx9pwAy4sqLAHfBZUnp9p/vg
         vUDJdf2aA0q/X8DqjJwa1GvhIrrj3U6pWmq5+qUA8R6lHqqU6LRJG8FQN8oibTE2mK0F
         ntQ5F8iOYt557fFIuZXPTuem1bz+GaffnOGVNPnINAVydvXeAJsTvU4GolZTCJWpFXOv
         Df212jDTSrr4ktqxNTTiQem6FB9VPOppetYMEKsaOW2O6oJZrxxhIjPB9yxA676RoI3M
         t3rXbo8Zj+MGcWqYZaX2VLn4Evch6Om98WWjxvBwSkYC+zbJ+/7JG3sGBZJTet5QTDUe
         cF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lHfCFayqq/L6UFJ/D/fDgfG3TnQkRROj0zFvvZ5LS14=;
        b=NkXHctY5eYtLTdSj0iCzbDailEpcxw9CvPOm7zshwiGRgO5s9mcTZOF8wRDJRKkgLe
         /8lvr9D3SEpval+3HgEc8oTe1ZJie9ayjtE3U874364pvSYdukbxfkRf0iZXYA8xC3UH
         tzvugWAg8ggwrQ1IbK6F5tp/lgeB4i3MzLV77J0cPgmhZwmJZOAK9c45qNhmvlUH5pOf
         WSycfsnWjwvHhRirMdZmTcx+sOCLT/JU5WKvp2E4WQxIy2euH7QGGiQbVoiMS8AU7z8n
         nQChttYhGBVeAnG7zW5dTtHp7EyeODzRte4jvdSPLFmVBM190zky4kLAzz1RGq5wOAQR
         IY0Q==
X-Gm-Message-State: AOAM531rRc/hubJcI20JV4Qh/wwO8WTo85bqLBf4wT1j13Edky7T3KDh
        JmBAjF5fpuR9olWhYGbV3tHkzkPJMp+K95Y8IIM=
X-Google-Smtp-Source: ABdhPJxfOQ55nmOVGfInOh5U/ysxx19EXV4Z8lW71g2NwUcuwoOQBl9IeyZNSb/JmF3pSOyAdUPuGzPSvPeMKqCASWY=
X-Received: by 2002:a17:902:aa8a:b029:d3:c9dd:77d1 with SMTP id
 d10-20020a170902aa8ab02900d3c9dd77d1mr9243684plr.0.1604068151071; Fri, 30 Oct
 2020 07:29:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75Veqdv8JnASmmsnv9AmrktByWH3R7Z36wLMyjJh0VffExw@mail.gmail.com>
 <CACRpkdaAryt0PdbMQ-LMjJ=LNvmNVSHrjHfPn15uJo7WALpNEQ@mail.gmail.com>
 <CAHp75VfdRfROFwa+wsL6rW7v5=E+qYrE+rwy7zBP2YkZsgjdgQ@mail.gmail.com>
 <CACRpkdYjHERoO-rzoXa77VCjDrF0N+3q+q_MXOstMEkk3Y2CnA@mail.gmail.com>
 <CAAVeFuLRWsxeZW=0jWyXb7N=o1n53F6n1Wwd0t=dUSppk9-xrQ@mail.gmail.com> <CAHp75Ve=_2Ye7K6rY8sLhpYh7DF9fqVbS7c2OVSWDZi3XYBbzw@mail.gmail.com>
In-Reply-To: <CAHp75Ve=_2Ye7K6rY8sLhpYh7DF9fqVbS7c2OVSWDZi3XYBbzw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 30 Oct 2020 16:30:00 +0200
Message-ID: <CAHp75VdnNi-wWeRnOCLYi+K-x0sKz4s2=OqtHdkZJWQw4-d8wQ@mail.gmail.com>
Subject: Re: Is consumer documentation correct?
To:     Alexandre Courbot <gnurou@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 30, 2020 at 4:26 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, Oct 30, 2020 at 4:16 PM Alexandre Courbot <gnurou@gmail.com> wrote:
> > On Thu, Oct 29, 2020 at 10:50 PM Linus Walleij <linus.walleij@linaro.org> wrote:

...

> > As for "and usage of the returned GPIO descriptor is only possible
> > after the GPIO number has been released", I am a bit puzzled.

So does the OP of [1].
Have you had a chance to read that?

> My
> > understanding is that the descriptor is only guaranteed to be valid
> > between calls to gpio_request() and gpio_free(), so that's probably a
> > mistake here?

Sounds like this and my investigation tells me that this mistake is a
result of the global array removal w/o updating documentation part.

> Funny thing is that it is you who is the author of fd8e198cfcaa
> ("Documentation: gpiolib: document new interface"). Or am I mistaken?
>
> Perhaps you can send a follow up to amend that chapter?

[1]: https://stackoverflow.com/q/64455505/2511795

-- 
With Best Regards,
Andy Shevchenko
