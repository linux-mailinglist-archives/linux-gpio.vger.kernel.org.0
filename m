Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E427C295C2D
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Oct 2020 11:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2510006AbgJVJrc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Oct 2020 05:47:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2509920AbgJVJr1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Oct 2020 05:47:27 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9FA2C0613CE
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2020 02:47:26 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id k18so1277759wmj.5
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2020 02:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2VkNWLz8fdcGIZ0t/keGE/XgabajTokOfztMicfS35M=;
        b=HokrgSJnGW7pzR0hh6cw0dkxEGGLmeWN5JZ7a5LLozpJqCeBi8SNle3LiexsoQF/bX
         Dk/EOgy3xNW8qEpxN2FJRJRFAsyX/Y/fMq0FBjycKZz5lQ9/0bHOb63vKpxKsj3JVq9Z
         C7e13T+0C4HeBA5+sSfWePp1qB4iOhUUpJlNy+y0gLoPjqxyhtIjP8pC2gppSd/wB4rI
         3W/FGPu9ATaCB7FKKQZ6xm7OUm7/kK9KkmC6IUJ6HkDA1dOMfuCf6yugTqU5XRTXY83s
         azf+IOpXFqFzOm1F0UwfRwoGWKCAm6t+qHfjKCBFjRrXjGtw00GQYrlZXXj7hg34MYdu
         4kQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2VkNWLz8fdcGIZ0t/keGE/XgabajTokOfztMicfS35M=;
        b=Wfmb47xd7o+JVfy1lhuxkPX2f3KcrtRzo3yugswGiSXkXrYjdjV4h/hJufSMo/1IRm
         7J9kBZXfvURebjOjlcefJ8Y+1tr/jLBzbe/eRQR87RNWeF5o1lRTPX2UzT8C4nDsy6dP
         LVYS+Hmqay7K2AJS4fVoiznuTLWTnKUVBd/MW/2FR8Qp0UTCqBVt0OscJlZG3YgyhNrY
         JPKthwwmO2mkhhQylfWd1esxTML02jjqct0KaL3HLy3GffVH0RHItbqkWX7KB4cwqn8n
         jSE7OhLVTdc0LdMQDC7dV+0UesWJN3xwD09VHDO77DnKoQh9YdcMU/gVEr0OdIu3+Dzl
         l3Iw==
X-Gm-Message-State: AOAM532Rw9TMhyIFu/A32mQqFxDcJ+pMyUyryzfKLmNLxAlxTl1CatwV
        ni2SHDU633jvDFQPDccJWGW913ZQgZF96H8RKCc=
X-Google-Smtp-Source: ABdhPJxPg5lWty/6XIb6+n09bVzUcJs0fzh2hHboFSSVoCvU/u/Dih7z9iJvd4H8OtdyHIdT06jmJZb9RACZPBdme4U=
X-Received: by 2002:a1c:495:: with SMTP id 143mr1591037wme.63.1603360045561;
 Thu, 22 Oct 2020 02:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <20201015083805.GA10354@laureti-dev> <CAMRc=Md=ZeKLS-SKKgmq+V9VCt+7xdjNiwz89Ms-vOeTcwZBOw@mail.gmail.com>
 <20201015093526.GA10891@laureti-dev> <CAMRc=McpnnK9NydujR=YRuy0ZBLhQqz3SSZ5eeisjqhMPUbMhA@mail.gmail.com>
 <20201015105718.GA11027@laureti-dev> <CAMRc=MdWi94uzYb6OprmVoGnfmSHUCevqAPPgXOPHQNVrj0jfQ@mail.gmail.com>
 <20201015121312.GA7166@laureti-dev> <CAMRc=McApWaCy8kUWurjZByN9vKqw8kZBwNVBtVXXf6-b3PsLg@mail.gmail.com>
 <CAFhCfDa7Yy2a9-ddk0nZmNidar_-H_ONTU93Cb+YatcEGy3NbQ@mail.gmail.com>
 <20201022063935.GA23978@laureti-dev> <CAFhCfDY5JS4WB=0OFdjYGeuRobuMPKkjeir29M6EOSe9zVufVw@mail.gmail.com>
 <CAMRc=Mfs7CSS_3BU6geAyDq0bNA9Q6eQvw_-iJCttGKimbZHjg@mail.gmail.com>
In-Reply-To: <CAMRc=Mfs7CSS_3BU6geAyDq0bNA9Q6eQvw_-iJCttGKimbZHjg@mail.gmail.com>
From:   Jack Winch <sunt.un.morcov@gmail.com>
Date:   Thu, 22 Oct 2020 12:47:14 +0300
Message-ID: <CAFhCfDb9pbPMAj-7zqVWWMfprnFQEaozx-CV7VP25kP437diCw@mail.gmail.com>
Subject: Re: [libgpiod] cxx bindings: time_point vs duration
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Helmut Grohne <helmut.grohne@intenta.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartekgola@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> Jack: FYI the clock configuration didn't make it this merge window so
> it'll be released in v5.11.


Ah, that is a shame.  Such is life, though.

> I also don't envision making a libgpiod
> v2.0 release any earlier than that so we have plenty of time to
> discuss it and come to the right conclusion.


That is also a shame, but at least that gives some time to undertake
further review of libgpiod v2.0 and potentially make some further
improvements.  What's the time window for this?

Jack


On Thu, Oct 22, 2020 at 12:36 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Thu, Oct 22, 2020 at 11:09 AM Jack Winch <sunt.un.morcov@gmail.com> wrote:
> >
>
> [snip]
>
> > What I did not want to see happen is the change as currently proposed
> > be applied and cause issues in the future.
> >
>
> Jack: FYI the clock configuration didn't make it this merge window so
> it'll be released in v5.11. I also don't envision making a libgpiod
> v2.0 release any earlier than that so we have plenty of time to
> discuss it and come to the right conclusion.
>
> Bartosz
>
> [snip]
