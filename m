Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CCCFD6320
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2019 14:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729363AbfJNMzE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Oct 2019 08:55:04 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43623 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729752AbfJNMzE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Oct 2019 08:55:04 -0400
Received: by mail-pl1-f194.google.com with SMTP id f21so7985413plj.10
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2019 05:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=2r1H3moNLdkjWckskZ7J6+lJ5J8XFoei7APH0VJRcf0=;
        b=c22Tc/bEqy+NkptDNbYBomREd1EM9uBR1z3JniIWHETbNAPhqSbOufaZAtUl6GGfhK
         w3Rtb1JZntWVIUTZqs8LMpmJS3M4XZwbPnevL4he6O3lJ2WG4EkSdk+4QNG0GLC135vK
         nvKeq9cFlGK+Wlel3b1eC9+Zkuy7x7xIfURfRliH5HbMfvI/FqIzPxEMmOjJPtq2zXrA
         XOzJQ+PiIWFby0v5smYU1/LLHa0lM1QiRTzqIgIHHHlynk5G1+mAjGSp+aRpMENvSGj/
         zSml5CKjLaN83LCvM1iczCiTk3HmlN3BdtIUyht0arreJne4PqHwILMMGAEmpJ/L8J2P
         ed4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=2r1H3moNLdkjWckskZ7J6+lJ5J8XFoei7APH0VJRcf0=;
        b=fiFgMSzRYxC+1bkv1WjtHyhiVhayCNjeiRBZemQtcXWFobJhzY4stc4LkPeDGLj/AX
         lIpQLUqeWefPN9ugfBbUEncGveoHVNWrONdIWLT3HrZ4ZEDLulFCaZgNEJ8jF+7kYIv9
         GVr0/Ij0AidGaa+L3lMJGXbDyGe9tYs852qIAaXq+CIsy7STZ9UpsJDcO99oFLTCmWAY
         JZlHse7iIviEddn9ODb6FvV3kXm1G7baFBEy7lWJ1v1HoRuDhXD/UfV8Mic0uE3VRZAZ
         C7VTuSgX58AFP/zrgqmJMCzTpyaCqjDdEimbmzCAdWrfBxgs82uaup6QTu50V1y144cL
         /3jQ==
X-Gm-Message-State: APjAAAWzrJrPqg9aP+8bEXbi5icP6XSqMNAC9/ZwF7PidSkPePu1q5ku
        GW5LL+1ilgwjNP9Pxp5y+MM=
X-Google-Smtp-Source: APXvYqyan3fwWiy54eutMqCofb6nW4t9TfTBpa1zknjp/S2vARjbwLti26Vyv1pZSjdK6pJBmRNwdw==
X-Received: by 2002:a17:902:b410:: with SMTP id x16mr1442913plr.46.1571057703296;
        Mon, 14 Oct 2019 05:55:03 -0700 (PDT)
Received: from sol (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id o64sm39413346pjb.24.2019.10.14.05.55.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 05:55:02 -0700 (PDT)
Date:   Mon, 14 Oct 2019 20:54:57 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>
Subject: Re: [PATCH v2 4/6] gpiolib: pull requires explicit input mode
Message-ID: <20191014125457.GA28012@sol>
References: <20191012015628.9604-1-warthog618@gmail.com>
 <20191012015628.9604-5-warthog618@gmail.com>
 <CAMRc=Me+u2brQVo2HwLS+gSDSZWXvsjT59qP75aKRi3PHqMbvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Me+u2brQVo2HwLS+gSDSZWXvsjT59qP75aKRi3PHqMbvg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 14, 2019 at 02:38:38PM +0200, Bartosz Golaszewski wrote:
> sob., 12 paź 2019 o 03:57 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > This patch prevents pull up/down flags being applied to as-is line
> > requests, which should be left as-is, and for output mode for which
> > setting pulls is not currently supported.
> >
> 
> This again looks like it should be done right in patch 1/6 instead of
> being fixed later in the same series. Or is there some reason to do it
> this way I'm not seeing?
> 
The patch series adds full support for pull up/down in stages - in order
of increasing level of controversy, at least IMHO.
That way you can drop the more contraversial components if you disagree
with them by rejecting individual patches, and most likely all the
ones that follow.

And I certainly wasn't going to bundle everything into Drew's patch.

Cheers,
Kent.

