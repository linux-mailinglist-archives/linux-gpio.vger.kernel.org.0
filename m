Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D21DF295018
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Oct 2020 17:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502491AbgJUPoe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Oct 2020 11:44:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502391AbgJUPoe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Oct 2020 11:44:34 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A80AC0613CE
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2020 08:44:34 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id q5so3092568wmq.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2020 08:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PJH+nAUBSqZW1twdiN7K543jo8fltheKTTfEZvCDGec=;
        b=Vp6GhjSuJxT9ZCXnHHvEp5xwbf7eFweEL3d0zF44KB9oiiUQp3bAG55Z+8sm7nFyR2
         euWzTzBnV6RjXsosG5UCMyi7sGji4RBBptibXcWnyEgTutr2xtcbsUehMVneUOLmvR9L
         3Sc83IZbRzxB1N7zXkfY6jyQtpZMudJVjgrhHuL/Zx4Z15MyKWQjLMDfzdaRmd1VHRa2
         2P1rZHw/+B5j1Lxhhi90R3HR+QsEeLQoW2DozERfZrJMJ0MYuL3Mv/kD3hOMJtMNCmGa
         zDOtpUZpU81M4BGpdLnTSOG1ErGxyOVK7QsKOaQxi2NSkOBYG3H1k2v8Ep6VN3HS7tEz
         YnTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PJH+nAUBSqZW1twdiN7K543jo8fltheKTTfEZvCDGec=;
        b=kfTN4YcdMUn2Lh4a1nQZWjwlNA5VPTTp6AQOMTxIht2WptEPlEz4h6367L4MPqDQx/
         Ad3vkr45ecYfWtjlDt0U7lg5gov5nKQMGOLi4e4LWrKFw6ygF3ZAmo6jFOof61mm4JvU
         FVtVqMS1yZGYx50aI3eX60nH34+YqSNoGfAiFMToy/HSWGAwk2a8c7+820jUys/SyI9q
         Jki+NgtNJu6lCoHGoeB7wgKzcOQZRseXCzj/0qg3znOvQ2DWN5ZhdkdKXFh1kLY1sslv
         4r7eJfECNXZtks6yW9jx3jsla86S004QXcuHd5IyJOokqakf4bP5yUqrk217WpNSxVCH
         8ASg==
X-Gm-Message-State: AOAM532faNboJCN4s9SmwdJJgxQHF98Hs5WYnXQ7781R10Z0t7sl4Rpf
        Ydd2BU/4dUd79zEWHtzPPbUy7liVD/Do2WDy1Kip1IkW6yyAnQ==
X-Google-Smtp-Source: ABdhPJy3Y2z5LRb24b2L8Lyo0zYTJphNP+qxMiv8/7dgZQ4YRnkI2RG2xutnqxBQ9NOdPeKs4lm8l9o0zg/cbV0EFOc=
X-Received: by 2002:a1c:495:: with SMTP id 143mr4062043wme.63.1603295071291;
 Wed, 21 Oct 2020 08:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20201015083805.GA10354@laureti-dev> <CAMRc=Md=ZeKLS-SKKgmq+V9VCt+7xdjNiwz89Ms-vOeTcwZBOw@mail.gmail.com>
 <20201015093526.GA10891@laureti-dev> <CAMRc=McpnnK9NydujR=YRuy0ZBLhQqz3SSZ5eeisjqhMPUbMhA@mail.gmail.com>
 <20201015105718.GA11027@laureti-dev> <CAMRc=MdWi94uzYb6OprmVoGnfmSHUCevqAPPgXOPHQNVrj0jfQ@mail.gmail.com>
 <20201015121312.GA7166@laureti-dev> <CAMRc=McApWaCy8kUWurjZByN9vKqw8kZBwNVBtVXXf6-b3PsLg@mail.gmail.com>
 <CAFhCfDa7Yy2a9-ddk0nZmNidar_-H_ONTU93Cb+YatcEGy3NbQ@mail.gmail.com> <CAMRc=MdEQqOryuEW06XhKvfzcYYMFxGOsT0sRg460ZAkD9G8FA@mail.gmail.com>
In-Reply-To: <CAMRc=MdEQqOryuEW06XhKvfzcYYMFxGOsT0sRg460ZAkD9G8FA@mail.gmail.com>
From:   Jack Winch <sunt.un.morcov@gmail.com>
Date:   Wed, 21 Oct 2020 18:44:20 +0300
Message-ID: <CAFhCfDaRN_S1uqJWR1riz5fjh=C8iecC4N_0-4MnO1O9GR9wPw@mail.gmail.com>
Subject: Re: [libgpiod] cxx bindings: time_point vs duration
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Helmut Grohne <helmut.grohne@intenta.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartekgola@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> Yes, please. I'd love to learn what the alternative for C++ is then.

I'll prep and send something out over the next coming days (possibly
this weekend, as I've got some things to address by Friday).  I'm
currently putting together a talk on the subject, so I'll also share
that with you once it is done too.  That'll likely be in a few weeks
with my other current priorities.

> Maybe a time_point returning helper in this case?

That would definitely satisfy both needs.

Jack
