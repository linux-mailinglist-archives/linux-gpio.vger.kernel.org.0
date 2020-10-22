Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7828F295E45
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Oct 2020 14:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2898059AbgJVMWp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Oct 2020 08:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503889AbgJVMWp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Oct 2020 08:22:45 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D740EC0613CE
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2020 05:22:44 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id x7so2125548wrl.3
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2020 05:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rVgT1Wm3DjDOwRfUJNegvB8A3peYitYuN3nbTT0KqiU=;
        b=WHo+tmiwpbSj3Cc/ErTGSI8YuU/SSXscpfLM5juNS9sKvuLcyu1JOZLxd8I3jaVJnd
         vLFjiYEZqwtH43Lcv4r9Qr989lwMVRxTmlsdjpAfCXjykiDt8rp6IKGzcyB63VpLkKBt
         SG+7tY1/gYHaH8ajWXMTBThmzEUCphMV+IilCJSkva6n06xFN+Gjh7likNIBqYd+c+Oa
         FfdZuGK1k0cXd4O8XbfRToul0f16toKhgZ5Wt93fItR+vnkdO/sFLOVUK5zKzP8P9o8h
         ieU+modpDPJRtiug7Xwon3J5S302fDe7tmoUIh0xtBIQ2xViTT77nugLSXlWS0YIhn63
         kcAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rVgT1Wm3DjDOwRfUJNegvB8A3peYitYuN3nbTT0KqiU=;
        b=OvoogBFF4Rui+bkIGxcW4V0KL57INrA8N2CBzBTTMqNez7PjeMOfpD+tJCEIbxYc+F
         b1ZqBDMWvwc/PGTpj0hlIDndqY4Q+FJKNLazbsCB0HemlWpeFeROvCnfRKLeoOekeyF7
         Pfxez/0y5661H93QZedJ7uG7mRWdENu+0Hi7qJ70OKDQZwMo9R2kVUDs5mRTg97IpehG
         KPo9zoPER33IhaI3lAwj0Lf0S2syXzAf9CuGyi6Y4uvK2F+TyysRVph3Ye4GFAgascb8
         5YFlECnpTKdwny5nGUKbCHIRQ3iOLB44W0AjLBj5gRG/Ph1gjH+6izb4slzWNjEgo6iJ
         IO6g==
X-Gm-Message-State: AOAM5319PgW94507tzo9xSPjnK92zlmF/DGjN7y1xis4kcIuqjWNJZDA
        8t2PeYFBXsss4WjmYeUJGxwE2PTyOlAPYuuL2f+btSiMKBeefw==
X-Google-Smtp-Source: ABdhPJytSqN1Sj+n70LwG/CkSsBkV5N3wvtW/eUufI2alkWoVEtGCmYPIo7RzrzPt3uc7JMNdtkiWQczO2cSS3HmEhc=
X-Received: by 2002:adf:d850:: with SMTP id k16mr2398610wrl.259.1603369363676;
 Thu, 22 Oct 2020 05:22:43 -0700 (PDT)
MIME-Version: 1.0
References: <20201015083805.GA10354@laureti-dev> <CAMRc=Md=ZeKLS-SKKgmq+V9VCt+7xdjNiwz89Ms-vOeTcwZBOw@mail.gmail.com>
 <20201015093526.GA10891@laureti-dev> <CAMRc=McpnnK9NydujR=YRuy0ZBLhQqz3SSZ5eeisjqhMPUbMhA@mail.gmail.com>
 <20201015105718.GA11027@laureti-dev> <CAMRc=MdWi94uzYb6OprmVoGnfmSHUCevqAPPgXOPHQNVrj0jfQ@mail.gmail.com>
 <20201015121312.GA7166@laureti-dev> <CAMRc=McApWaCy8kUWurjZByN9vKqw8kZBwNVBtVXXf6-b3PsLg@mail.gmail.com>
 <CAFhCfDa7Yy2a9-ddk0nZmNidar_-H_ONTU93Cb+YatcEGy3NbQ@mail.gmail.com>
 <20201022063935.GA23978@laureti-dev> <CAFhCfDY5JS4WB=0OFdjYGeuRobuMPKkjeir29M6EOSe9zVufVw@mail.gmail.com>
 <CAMRc=Mfs7CSS_3BU6geAyDq0bNA9Q6eQvw_-iJCttGKimbZHjg@mail.gmail.com>
 <CAFhCfDb9pbPMAj-7zqVWWMfprnFQEaozx-CV7VP25kP437diCw@mail.gmail.com> <CAMRc=McJUHQf2ziM1PObm34PwzXGbdY31YepJQduDD+QqMvH2g@mail.gmail.com>
In-Reply-To: <CAMRc=McJUHQf2ziM1PObm34PwzXGbdY31YepJQduDD+QqMvH2g@mail.gmail.com>
From:   Jack Winch <sunt.un.morcov@gmail.com>
Date:   Thu, 22 Oct 2020 15:22:32 +0300
Message-ID: <CAFhCfDbgNZyTOVubevcoBHpZj4QZ+wEKXbuP354dtWfstgHmig@mail.gmail.com>
Subject: Re: [libgpiod] cxx bindings: time_point vs duration
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Helmut Grohne <helmut.grohne@intenta.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartekgola@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> Why would that be a shame? We have the chance to rework the API of the
> entire package, I want to give ourselves some time to get it right
> before we carve anything in stone for an indefinite period of time.
> There's no rush, really.

You're right. :)

I will start the talk with you next week regarding ABI compatibility.
I'll give you a rundown of the issues, the potential solutions and we
will discuss the usage of libgpiod and the C++ bindings.

Jack

On Thu, Oct 22, 2020 at 2:56 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Thu, Oct 22, 2020 at 11:47 AM Jack Winch <sunt.un.morcov@gmail.com> wrote:
> >
>
> [snip]
>
> >
> > > I also don't envision making a libgpiod
> > > v2.0 release any earlier than that so we have plenty of time to
> > > discuss it and come to the right conclusion.
> >
> >
> > That is also a shame, but at least that gives some time to undertake
> > further review of libgpiod v2.0 and potentially make some further
> > improvements.  What's the time window for this?
> >
>
> Why would that be a shame? We have the chance to rework the API of the
> entire package, I want to give ourselves some time to get it right
> before we carve anything in stone for an indefinite period of time.
> There's no rush, really.
>
> Bartosz
