Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B05E295DD0
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Oct 2020 13:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2897594AbgJVL4I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Oct 2020 07:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391625AbgJVL4I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Oct 2020 07:56:08 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13F18C0613CE
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2020 04:56:08 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id p10so1452590ile.3
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2020 04:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hr/3dIG2akNZ36LvTktcXHzaQ6UuWbHAiztStxwsYgQ=;
        b=OfPyltxVZ/sNMUuPGvvSzfolY15bgTHf5yWQK3I0W4wGOBbcNFgT9+zxaQ5ZEjUq4U
         WQ0aeSeQl7IrG+AY6GFL5IBGzlZwJ7Xl8KFghLFeUTEFguhJj95elZmBQGhObDtHQ7Lk
         4/kyni8qF97SE9q/qlxnrFc//Fyzk3yq+K1q9cAzKa8dj+IoACJm8q3otjtwY6g1KPDe
         rmlFJipWpJykwHxAYikclTPkVHGYKSORPDZoTRNNJy5w3bq5GH6d97eszPEq25Z4kkVG
         0+VV9vqodWpmJQ9/XyqFbbTzk/26YhB8/EVfUbgeSwHaKU7u3fn4YYt7ukc/YH9HSGtu
         LS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hr/3dIG2akNZ36LvTktcXHzaQ6UuWbHAiztStxwsYgQ=;
        b=nKtFKHKoV0/IJUYQ8yHwYucRjbuSVQCJAdPTQeqVWTFVUa3Ir9kWwZdeVmSSs9hCF5
         TmbuaeaPCWB9b4VRSFjkKumDtIfFpITqWbgCetFz4jrLTPn/iMmIHK5JcLEksSuSe7de
         97cefiMSXOsXX3NidhwCFs04EZ1UDBX+Lki8Fs+fphPvzkqCFu+YTndY7Vbywgix10tO
         QEEmspv4hKomgi5DBLj9YvRNwipfJRCqo3ocADbluerBRGwKjytoDYixNn4CgaNTQfQk
         oQkQBZRUC/8Kr52vNzLt0eWsZfwDEyNqqX8KUmkh2pRz6NAjA+JFPIYn217HsXN0WIwE
         2bOg==
X-Gm-Message-State: AOAM5315DdJfMvwomwHYSrgPws6dI3l0j2TWolm54napbQpQ/oz+ucPd
        pjyMo3P/wQDoyYrZEQkAjInjwlEpmn89fRt0IgI6zcR3Tec=
X-Google-Smtp-Source: ABdhPJxrIWXWut7K1ZmqQGKQBl+ylu8WwxXqt8ssCL95x1NHes3Q/lKSG3wdzN/eI4/nxXNdNmh9G/WmPygGylTuitM=
X-Received: by 2002:a92:c5ce:: with SMTP id s14mr1575297ilt.40.1603367767294;
 Thu, 22 Oct 2020 04:56:07 -0700 (PDT)
MIME-Version: 1.0
References: <20201015083805.GA10354@laureti-dev> <CAMRc=Md=ZeKLS-SKKgmq+V9VCt+7xdjNiwz89Ms-vOeTcwZBOw@mail.gmail.com>
 <20201015093526.GA10891@laureti-dev> <CAMRc=McpnnK9NydujR=YRuy0ZBLhQqz3SSZ5eeisjqhMPUbMhA@mail.gmail.com>
 <20201015105718.GA11027@laureti-dev> <CAMRc=MdWi94uzYb6OprmVoGnfmSHUCevqAPPgXOPHQNVrj0jfQ@mail.gmail.com>
 <20201015121312.GA7166@laureti-dev> <CAMRc=McApWaCy8kUWurjZByN9vKqw8kZBwNVBtVXXf6-b3PsLg@mail.gmail.com>
 <CAFhCfDa7Yy2a9-ddk0nZmNidar_-H_ONTU93Cb+YatcEGy3NbQ@mail.gmail.com>
 <20201022063935.GA23978@laureti-dev> <CAFhCfDY5JS4WB=0OFdjYGeuRobuMPKkjeir29M6EOSe9zVufVw@mail.gmail.com>
 <CAMRc=Mfs7CSS_3BU6geAyDq0bNA9Q6eQvw_-iJCttGKimbZHjg@mail.gmail.com> <CAFhCfDb9pbPMAj-7zqVWWMfprnFQEaozx-CV7VP25kP437diCw@mail.gmail.com>
In-Reply-To: <CAFhCfDb9pbPMAj-7zqVWWMfprnFQEaozx-CV7VP25kP437diCw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 22 Oct 2020 13:55:56 +0200
Message-ID: <CAMRc=McJUHQf2ziM1PObm34PwzXGbdY31YepJQduDD+QqMvH2g@mail.gmail.com>
Subject: Re: [libgpiod] cxx bindings: time_point vs duration
To:     Jack Winch <sunt.un.morcov@gmail.com>
Cc:     Helmut Grohne <helmut.grohne@intenta.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartekgola@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 22, 2020 at 11:47 AM Jack Winch <sunt.un.morcov@gmail.com> wrote:
>

[snip]

>
> > I also don't envision making a libgpiod
> > v2.0 release any earlier than that so we have plenty of time to
> > discuss it and come to the right conclusion.
>
>
> That is also a shame, but at least that gives some time to undertake
> further review of libgpiod v2.0 and potentially make some further
> improvements.  What's the time window for this?
>

Why would that be a shame? We have the chance to rework the API of the
entire package, I want to give ourselves some time to get it right
before we carve anything in stone for an indefinite period of time.
There's no rush, really.

Bartosz
