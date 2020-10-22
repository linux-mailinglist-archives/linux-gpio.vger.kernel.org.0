Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D83229587A
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Oct 2020 08:39:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504135AbgJVGjm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Oct 2020 02:39:42 -0400
Received: from mail.intenta.de ([178.249.25.132]:28333 "EHLO mail.intenta.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437596AbgJVGjm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 22 Oct 2020 02:39:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=intenta.de; s=dkim1;
        h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:CC:To:From:Date; bh=8996ju8SvIfN5CY/b28Xp9M7xIW6s37mDv+6kF5R4Wk=;
        b=vT83YVUrQt1wUUmTAX+/rnt0IHYiXBAc8Hbq7Yq89O2n95D8Yf6ToVyOsKRQkJ1Uc2aJXiWDUMeu3C7dnZCVpqyZFsLQxV0OS69RV27gL/M4vsX9Uitsag9v6HZxf3nfcxguTYTRn71A3udQsf3DBlZKjL98ljSZC/krJtQeoAevKgEORr2AleRD3dpsqPjo3A57qgu5mVjZ/FyJvrMeC4aDrxVFV9CPT3tDcD+PA2m4AQkq0/vJrxfzQXPZsPU/R3mC4PGLLJpijw6qsHjuwp3A+0pSeCW2ugxpqh0kPFz1h0bc+v0O5a5BB6CTx5igMLwlwExnUDoYGYxj56CXCQ==;
Date:   Thu, 22 Oct 2020 08:39:35 +0200
From:   Helmut Grohne <helmut.grohne@intenta.de>
To:     Jack Winch <sunt.un.morcov@gmail.com>
CC:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartekgola@gmail.com>
Subject: Re: [libgpiod] cxx bindings: time_point vs duration
Message-ID: <20201022063935.GA23978@laureti-dev>
References: <20201015083805.GA10354@laureti-dev>
 <CAMRc=Md=ZeKLS-SKKgmq+V9VCt+7xdjNiwz89Ms-vOeTcwZBOw@mail.gmail.com>
 <20201015093526.GA10891@laureti-dev>
 <CAMRc=McpnnK9NydujR=YRuy0ZBLhQqz3SSZ5eeisjqhMPUbMhA@mail.gmail.com>
 <20201015105718.GA11027@laureti-dev>
 <CAMRc=MdWi94uzYb6OprmVoGnfmSHUCevqAPPgXOPHQNVrj0jfQ@mail.gmail.com>
 <20201015121312.GA7166@laureti-dev>
 <CAMRc=McApWaCy8kUWurjZByN9vKqw8kZBwNVBtVXXf6-b3PsLg@mail.gmail.com>
 <CAFhCfDa7Yy2a9-ddk0nZmNidar_-H_ONTU93Cb+YatcEGy3NbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFhCfDa7Yy2a9-ddk0nZmNidar_-H_ONTU93Cb+YatcEGy3NbQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ICSMA002.intenta.de (10.10.16.48) To ICSMA002.intenta.de
 (10.10.16.48)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 21, 2020 at 03:57:34PM +0200, Jack Winch wrote:
> > I don't thing nanosecond resolution is
> > guarantueed, but maybe this is good enough and you can just use
> > steady_clock? That would certainly be most welcome by consuming client
> > code.
> 
> You are correct - nanosecond resolution is not guaranteed.  It is
> completely up to the standard library implementation.  Which is why I,
> personally, would steer away from making the proposed change to struct
> line_event .  The timestamp resolution is currently well defined in
> the existing implementation and changing this may not be desirable for
> users.  If you really want a std::time_point, then you can construct
> one from a std::duration object.  See
> https://en.cppreference.com/w/cpp/chrono/time_point/time_point.

You're arguing that a std::chrono::steady_clock::time_point is not a
good match due to its undefined ratio. That can be fixed by using a
clock with a well-defined ratio.

The key here is that while you can easily convert your duration to a
time_point, a duration is conceptually the wrong thing to use. The field
does not contain a duration, but a time_point. Using a clock would give
the user the ability to compare returned timestamps to the current time
as the underlying clock provides that functionality.

So regardless of whether steady_clock is the right clock to use here, a
duration clearly is not. If you are not satisfied with the resolution
guarantuee of steady_clock, just make your own clock. Doing so results
in a lot of type safety. For instance, if you accidentally compute a
difference between a system_clock::time_point and a gpiod timestamp,
using a duration would just work whereas a time_point would result in a
compilation failure.

Helmut
