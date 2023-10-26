Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97FE87D7F89
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Oct 2023 11:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjJZJ3c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Oct 2023 05:29:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjJZJ3c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Oct 2023 05:29:32 -0400
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8A18186
        for <linux-gpio@vger.kernel.org>; Thu, 26 Oct 2023 02:29:29 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-49d39f07066so326972e0c.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Oct 2023 02:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1698312569; x=1698917369; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tk1D9Gqh/y7novKEDl037r+HIvRjJMnQRQc/dsZa6pE=;
        b=WdNTPtRZWXr7T45Kfz7Tr2TOi0FN7ewHOcE1Ndq6YFMrbBkVeyGOpgD+PS5jiQYpIv
         mFJW7gt2fpg6kyYVkNP1AvHMJJRSVOajmtLE3RWxYX3XKkndYgYXj9OHQjwtwqozy3sO
         3sEhrXzaKTX9AaiImAwsl2QNvYwlKexfovaHeYwZLUArzbN9ZRsRsZHKo0LIO3BKWMvz
         KvfV3i5/I+pzenqmNkhUjCHgGrXVKSuqBeyllRctePCwzGR7tbhLOOAV7jbg7dDzMEWU
         C18la9pQCbh2dZHCXKCKBSY+MizENXEHbLBySMU//1X+RkLFInYRedlnbTK54xbt2nOu
         4hmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698312569; x=1698917369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tk1D9Gqh/y7novKEDl037r+HIvRjJMnQRQc/dsZa6pE=;
        b=guCRJuhfsZARBsBbgIyvX4I10zH1nsDvyOogu9nnMLauZXaxsQXwLVdGkvjzpulwuA
         s4qzNkW8r1N6Z6C58RCXiuSdduZqpBR/LLwj9htwNlOchoRwKR7WXZCRWXt95fVMCivp
         DHLYn2aahhjgP1oZiemFa9A1hyIWmy0EiIGbuhwk1fzrm6blFXK8dGKGTOlFLyuSDaZi
         VE/GoWA4uDqMsm3I9LVXIID1VItYwNisR1CggmM4TDTFYHC6b4Jfn1g1G4162cj7NTUC
         9STU2r/uxOqD4TMUctUhtLZrWN8axcr8+zec8/jOoyPGLsCPoN7vnoue8XbtpokJ6aC9
         4qfQ==
X-Gm-Message-State: AOJu0YySRQvuH3dT9nn/9paNGf1dJfk4IhZuLoDL1uFPbxEgcjrxMwoQ
        YFhlb2zGMLm5taf2iGQkQzhFYkfSoYYmvOq4YvdYdg==
X-Google-Smtp-Source: AGHT+IGpQKn1/rENHUQ0ls0h9Fwu53pK5bIaZbx6gYx/9ywOf/uB9rDe/J4q0C90NU/JQgBmohi5fQxvrYMJLoWOeqs=
X-Received: by 2002:a05:6122:3c81:b0:49a:9146:ec02 with SMTP id
 fy1-20020a0561223c8100b0049a9146ec02mr20340977vkb.1.1698312568759; Thu, 26
 Oct 2023 02:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <20231025082707.821368-1-phil@gadgetoid.com> <20231025082707.821368-2-phil@gadgetoid.com>
 <CAMRc=Mdy3o1xPG6QHjp_p9aojVdZw3NgUO_WGjAe7W59wBPVDA@mail.gmail.com> <ZTkS5V6kRevIZNfA@rigel>
In-Reply-To: <ZTkS5V6kRevIZNfA@rigel>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 26 Oct 2023 11:29:17 +0200
Message-ID: <CAMRc=McTz=X7+tMWa2hkrSvkCDt=3OF=GyFgT_U48LVmXQ2mOw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v9 1/1] bindings: python: optionally include
 module in sdist
To:     Kent Gibson <warthog618@gmail.com>,
        Phil Howard <phil@gadgetoid.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 25, 2023 at 3:06=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Wed, Oct 25, 2023 at 02:50:57PM +0200, Bartosz Golaszewski wrote:
> > On Wed, Oct 25, 2023 at 10:27=E2=80=AFAM Phil Howard <phil@gadgetoid.co=
m> wrote:
> > >
> >
> > This now looks good to me. I'll leave it here until Friday and if
> > there are no objections (Kent, would you mind reviewing this one?),
>
> I've got nothing to add.
>
> Cheers,
> Kent.
>

Ok, I will actually delay it for a week until next Friday because I'll
be off Mon-Thu and I don't want to leave stuff broken if anything goes
wrong.

Bart
