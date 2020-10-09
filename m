Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 936C32888F0
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Oct 2020 14:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731651AbgJIMhq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Oct 2020 08:37:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730773AbgJIMhq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Oct 2020 08:37:46 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9643EC0613D2
        for <linux-gpio@vger.kernel.org>; Fri,  9 Oct 2020 05:37:44 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id o9so4484288ilo.0
        for <linux-gpio@vger.kernel.org>; Fri, 09 Oct 2020 05:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xHgPHhTf0F2aQ/Mlw3qpMgtpllaLYfRV8WXLhxQMGIY=;
        b=reHIc+DhfK/REpOCKr/52ozoxGD9T2rFPVMo/H7TNwGaZa7Dsn5zb2izqt7bDcplGc
         pSfIvuDQtiyvHmkTuPYeqlCDOZV87N0kE2VF/iq0+hRLfsAYXXAGcA/mRYaBRlfubPhg
         Bt3wzxjKzGXJMRGwUdG2f2RLvR0wKbP23WfNoOhu7FGMFpE2Tt5IF6oRSPVAvJldaw5g
         TaInvLr3RBwF+Zl9jxL4S1JEEcYcm6i1J4L9UwshInvC2jqyZvXGq9kK3nnp4IXVgtTt
         kbRQ6a0ZxcT5SkKKjpq3MOdBiKoJ1gNxGRoTwAsJaT+497uPnbApIlOuM0Sntpp8+VL7
         ul9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xHgPHhTf0F2aQ/Mlw3qpMgtpllaLYfRV8WXLhxQMGIY=;
        b=MeabGOe0koFfJ/rHw9VbNDq+8bwt0cazeYxPtqjy4p8J/lFcTczTIqRn2Kr+2pFE5E
         G22dQAuKrH1u8YXx28WtzVq+Ek2d1w9Ro/ue8pE96QKbwAi8QNqh7S9TGy+x/3Qqj5ZN
         lt7pz2HMHLFVD6BApVRrZ00SmkJ2aOAVcYF6VHVOKKrw5kfTn7KNoDTeqqoop3oGae8g
         8KE88Tpb9Tt0OgrT3ahN89A4mlnNl8QBY/QT5XS7umZeSbG01R0pjFMpmFNpVYWFzOv7
         89lXdVCp33AHtZEnHmZAKOEvrflh785hVC/FlCCycn+anfV71BfIThFmzZz21voOFwFY
         AxuQ==
X-Gm-Message-State: AOAM530GSQVhkp/PnGTip4f9CmsaQ3SobvzM17ZDejP34VN+ZEgI+5hx
        BTzK71PEXs58g10r5mv0ZJV167aQPS5aD5IHODeDTQ==
X-Google-Smtp-Source: ABdhPJxtXU9eS8GUAcnCv/kENfOfgVmMCvTkRTTi4EG7X5wfRIUn6EWm948oAYDFOh50fU/h2Rzk0JiGOTTKJyM1M+0=
X-Received: by 2002:a92:1952:: with SMTP id e18mr9803839ilm.189.1602247063896;
 Fri, 09 Oct 2020 05:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <38eff7ebd01efd34df3037ba485d61ff7291fb5e.1602004585.git.jbenc@upir.cz>
 <CAMRc=McNs+cPmqkcGCAJgfQ_Ozy4Dc4b9GUDc2wthmj2WYaRwg@mail.gmail.com> <20201009111957.7f6cff10@upir.cz>
In-Reply-To: <20201009111957.7f6cff10@upir.cz>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 9 Oct 2020 14:37:33 +0200
Message-ID: <CAMRc=Mco86eLvh9WoPmF4sKHuXvRRF4J-OuHshOdMkKhtn4HQg@mail.gmail.com>
Subject: Re: [PATCH libgpiod] bindings: python: fix Line.request() crashing
To:     Jiri Benc <jbenc@upir.cz>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 9, 2020 at 11:20 AM Jiri Benc <jbenc@upir.cz> wrote:
>
> On Fri, 9 Oct 2020 09:40:29 +0200, Bartosz Golaszewski wrote:
> > Thanks for the fixes. Could you send me a chunk of code that triggers
> > this error so I can make a test-case for it?
>
> It was as simple as this:
>
> import gpiod
> c = gpiod.Chip('0')
> l = c.get_line(17)
> l.request('my')
>
> Latest stable Raspbian (Debian 10.6), Python 3.7.3. It's so basic that
> it's puzzling me that nobody has hit it before me. But my patch is
> right, see https://docs.python.org/3/c-api/structures.html:
>
> ------
> METH_VARARGS | METH_KEYWORDS
>
> Methods with these flags must be of type PyCFunctionWithKeywords. The
> function expects three parameters: self, args, kwargs where kwargs is a
> dictionary of all the keyword arguments or possibly NULL if there are
> no keyword arguments.
> ------
>
> Yet, commit 02a3d0a2ab5e that attempted to fix this states that the
> kwds dictionary was an empty dict. Maybe a change in Python C API in
> 3.7? The Python 3.6 and earlier documentation did not mention the NULL.
> I can't find anything in Python release notes, though.
>
>  Jiri

Thanks. I added a test-case for this and applied your patch to master
and stable v1.6 & 1.4.

Bartosz
