Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B8377D6DA
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2019 10:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728843AbfHAIDH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Aug 2019 04:03:07 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37736 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728582AbfHAIDH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Aug 2019 04:03:07 -0400
Received: by mail-lj1-f194.google.com with SMTP id z28so14189558ljn.4
        for <linux-gpio@vger.kernel.org>; Thu, 01 Aug 2019 01:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C1QYEuNDIYrwn0YefEATWpCmHALa2cIoViFjy0wdbv4=;
        b=YNo0fLJ89ieUdTz8SAOLXXsVzXJaRtNKSDoDumBJAmX/kmE1vcpw33lgQCtrKg41a/
         MdMCBR3qejzGizuOzeS90EU3oCIqVgsQP/MSct9KWboHM1Nnjw4naRrFK5P+G8PlOc42
         LEHgIZ+siaIfwGXog1FRsXe8uFFw/h28TC5Z1twAM4YlLy8x6RPT/P4oJTpJTmnC/sU5
         H/dUma5MEnoCaT8aqpSCI5t6Iu23jHHxIIKtIUqphYOqTD1ag9KHkwGkK6TRGm4yPGqf
         my3vJNHK0YhmM6BwnyibfRstXfT3MQD59sIhDe6aaK80Ay552Y+93l0xbIcUTFCjju8j
         4QLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C1QYEuNDIYrwn0YefEATWpCmHALa2cIoViFjy0wdbv4=;
        b=SPv8t7QW4Ckw94rQTs3ndXesLGfdHz+G4Fpp/6uAs0EHi/3gsc5ypBL0pMmpPyZvS8
         sTNLW0gRkJC9Ywo0S9Z0r3mvuSETwvySqvlYOryYYAmbs/T6VX+zjXtYFWrDbLa4p5MI
         j8EKKPNtgk09JdGTpatUGyRD/CmQ36jeYZPDqPQeN90doOwfQnB1TdZVZHzi/LZ70uOw
         Tg/mawDybtD2HZitz7cPY8n8nTq8XcqNIENG8YDpthdtnMGhhWTefs8+beUNAXL7shEp
         1oODj+P1IHUe64+QNIyZKE/gFecb0Om9+UQzm5qu/ddN3q4+4jUFCCp3JtVVtsP4By6f
         bEFA==
X-Gm-Message-State: APjAAAXTIpTtvQMKkKcbWm/KdcAFGH0mBbLipf1ZMReXUJiC42AknIbG
        n3fp7DNbzYRlF5sNHXV1zUNPi5T2EDMV+WqfHIb6Y8dA
X-Google-Smtp-Source: APXvYqwzfiiDj/cqQkQjcvy7Xw41j8dmhdR4DXI4MaUob31/YhTNS+zpu2v5TtbUGR16/InRB1T8eYlA5I9LZWRgv8k=
X-Received: by 2002:a2e:a0cf:: with SMTP id f15mr3659704ljm.180.1564646585018;
 Thu, 01 Aug 2019 01:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190731224208.30429-1-linus.walleij@linaro.org> <5d421b63.1c69fb81.e3ed.32c2@mx.google.com>
In-Reply-To: <5d421b63.1c69fb81.e3ed.32c2@mx.google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 1 Aug 2019 10:02:53 +0200
Message-ID: <CACRpkdb6sPc3OvCWwaEzhg_gBQvFQpz03w2=yGSY6pK+Sw=_2w@mail.gmail.com>
Subject: Re: [PATCH] gpio: of: Fix hard-assigned valid_mask for OF case
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 1, 2019 at 12:51 AM Stephen Boyd <swboyd@chromium.org> wrote:
> Quoting Linus Walleij (2019-07-31 15:42:08)
> > From: Stephen Boyd <swboyd@chromium.org>
> >
> > The recent refactoring to break out OF code to its own file
> > contained a bug by yours truly letting the need_valid_mask
>
> I'm not yours truly :)

Ooops too much first person patching...

I fix it up in the git.

Thanks a lot for helping out Stephen!

Yours,
Linus Walleij
