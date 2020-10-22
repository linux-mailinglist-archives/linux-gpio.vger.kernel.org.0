Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3C8E295B73
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Oct 2020 11:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2507654AbgJVJJ4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Oct 2020 05:09:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502677AbgJVJJz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Oct 2020 05:09:55 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED1BAC0613CE
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2020 02:09:54 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id e17so1231038wru.12
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2020 02:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P0YthKFoZ4j0kiGVsFb+dn8gBfNOjZoUlaQ9/YAhgm0=;
        b=dwDoya2F0mES2OgtaLRH4mW9V0svWT/dBiwKzclNQ9Mw6sY97JdjhzyGishZ3ZXV6R
         GD9OW5Ypwf2JMoihPIEzbWtXnXXtIBI0gYlpGpkMQlgYCaVamfYOjzJHZUnrlNcpku63
         bq+rYKycMBeb0SY1JxUuSe3afS1FspwBUMNa5YKgFHl4quC+taCtOiykBpV6LeduUO62
         wtP9PoR1lzsyXKwTStjDJsSawLsErKP9xoswXnqBRej46j/UHMhQ45BiCfC+0b9hb4/f
         JtQY7gIJ+xwfZwMnPB8DcOJ+UgkqjZPf6Sm7mgai8NmoK5CZGEPJY2PTu92ZFnJapXJz
         6XgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P0YthKFoZ4j0kiGVsFb+dn8gBfNOjZoUlaQ9/YAhgm0=;
        b=N5MpBFg+qpHAPhq3NmQZcorSILya7L7j2Bs2CrD73d/JgLFJNQRcEGbbvaknV63wQV
         hE7G6hgQgQJzuKCZ79MyX63/t5Drw6xGWdz8wvu2Dp0adh3dAcS11ayV/8/uzRQB/pgR
         KLQz6zmID8ywJi1WKGfLTlN7fkAJfw9+rjj+XXTC3ZIVxRDMoUPMt3b9WKidWV8K+pzV
         ouWlGySzZPVb1GE+UFSzjGzxHP0918XGflpGppCQUXH6vvKFjTxzAL7gAqmyzMIIQTjP
         KqOMNbcTsAnMhhdDEplsLIXzRfiUONn+loGgjbnqT+XY0+zP1JsSSQK5QcAx6i+qgD2z
         2SPw==
X-Gm-Message-State: AOAM532BdUMnxXqyc7IL3P9fPvaKovE03nDw3BBrrmqhEGIQ/DYlDV6E
        4WFg78wSS9h8pAeDSHcMxXml+d2KK1JQ6YQaWVnjhqsSclQ=
X-Google-Smtp-Source: ABdhPJy3LSYh6IFtdCdye+G51LeAHs6ZJbOLr+CYYHFCTvQX+O1wGtkgtnTLAX8sC8Qbga8ZClwuRG6GbJT4sOjaVsE=
X-Received: by 2002:adf:9069:: with SMTP id h96mr1706021wrh.358.1603357793413;
 Thu, 22 Oct 2020 02:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201015083805.GA10354@laureti-dev> <CAMRc=Md=ZeKLS-SKKgmq+V9VCt+7xdjNiwz89Ms-vOeTcwZBOw@mail.gmail.com>
 <20201015093526.GA10891@laureti-dev> <CAMRc=McpnnK9NydujR=YRuy0ZBLhQqz3SSZ5eeisjqhMPUbMhA@mail.gmail.com>
 <20201015105718.GA11027@laureti-dev> <CAMRc=MdWi94uzYb6OprmVoGnfmSHUCevqAPPgXOPHQNVrj0jfQ@mail.gmail.com>
 <20201015121312.GA7166@laureti-dev> <CAMRc=McApWaCy8kUWurjZByN9vKqw8kZBwNVBtVXXf6-b3PsLg@mail.gmail.com>
 <CAFhCfDa7Yy2a9-ddk0nZmNidar_-H_ONTU93Cb+YatcEGy3NbQ@mail.gmail.com> <20201022063935.GA23978@laureti-dev>
In-Reply-To: <20201022063935.GA23978@laureti-dev>
From:   Jack Winch <sunt.un.morcov@gmail.com>
Date:   Thu, 22 Oct 2020 12:09:42 +0300
Message-ID: <CAFhCfDY5JS4WB=0OFdjYGeuRobuMPKkjeir29M6EOSe9zVufVw@mail.gmail.com>
Subject: Re: [libgpiod] cxx bindings: time_point vs duration
To:     Helmut Grohne <helmut.grohne@intenta.de>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartekgola@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> You're arguing that a std::chrono::steady_clock::time_point is not a good match due to its undefined ratio.

std::chrono::steady_clock::time_point is not a good match for the
reasons you have quoted.

> That can be fixed by using a clock with a well-defined ratio.

I agree that defining a clock with a suitable ratio would remove the
problems faced when using a clock with an undefined ratio.

> The key here is that while you can easily convert your duration to a
> time_point, a duration is conceptually the wrong thing to use.

I agree that the timestamp value is conceptually a time_point.

> If you are not satisfied with the resolution
> guarantuee of steady_clock, just make your own clock. Doing so results
> in a lot of type safety. For instance, if you accidentally compute a
> difference between a system_clock::time_point and a gpiod timestamp,
> using a duration would just work whereas a time_point would result in a
> compilation failure.

I also agree with the excellent point you raise regarding type safety
and preferring compile-time errors to runtime errors.  Where possible,
care should be taken to mitigate or eradicate the potential for these
types of runtime bug.

The problem is, the solution you were suggesting to be suitable was
not (in its current form).  There are numerous issues with the
proposal above, which require further discussion.  As has been pointed
out, changes were made to the char dev in Linux 5.7 such that line
events are timestamped using the system 'monotonic' clock as opposed
to the 'realtime' clock.  So now the clock in which that timestamp is
relative to is kernel version dependent.  The ability to configure
this will become available in the next version of the kernel, but the
problem of which system clock is being used for older kernels will
still remain.

I rebuffed the suggestion in the manner that I did as the change would
have caused issues.  I completely understand and agree with the key
rationale behind the proposed change.  With further discussion, a
suitable solution might be found, but it requires further thought.
What I did not want to see happen is the change as currently proposed
be applied and cause issues in the future.

That being said, let's continue this discussion to see what can be
done (and preferably without any p*ssing contest).  The remainder of
this week is no good for me, but would you be available to discuss
potential solutions next week, Helmut?

Jack
