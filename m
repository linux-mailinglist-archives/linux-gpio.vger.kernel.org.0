Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 430956285B7
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Nov 2022 17:42:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237794AbiKNQmw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 11:42:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237756AbiKNQmr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 11:42:47 -0500
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DEC5E54
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 08:42:47 -0800 (PST)
Received: by mail-vk1-xa29.google.com with SMTP id v81so5238951vkv.5
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 08:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XrEc46dYQm6J/LtBlyvWMBwaNc0hpbtvjUVUxiE5TlI=;
        b=pc0fQ+qWBFsHT2nuihDOJLcIJSOkERtobzt0vqPd6+UTZ9uGG24RhBA5X9NafjE8fm
         ajiF4o6wYmRyYX/aoX5MXp1w0D8xUgPyF4CpGGcdNXZxdNwSmslm0S+JYo07E7HCIwZ8
         huYNK6FW2zBx6QpRhSoJwrOiPp/kWasXEUBVyUQ5KYUUgffA/s+S9h/T0k5sTPpg6GUr
         eHwikUmuJ3IPCtL52HR/4MDFm58mhjNxHbgCsJUIyBI1u0MsMOoWm0mwU4SSNykT1lt8
         zpe4XWxGBP4517jHeRwdaBigB+jozxK0ynjuvVe7X75dn6usOBDdnSxyq5ymTygET5a+
         Gq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XrEc46dYQm6J/LtBlyvWMBwaNc0hpbtvjUVUxiE5TlI=;
        b=saNJwwj6p3Heat8FLeHpIobUAFmDeQNB0O4G8Ns1NM87G7QLVCwd0thm/vp3vi1Y92
         rZNN6zNPr9jvixMdkDVv8fZzKrPSsZ8psUrWzvSKy5NHOnbtnRqQ0lHti0f6yxEW0ZvJ
         Z/TFbPheXc56kB7Db/a3peLbo/drXpNGpne6IHJDNRT5sQsFjYhDkZ4O9NJ/JSqm3qlB
         nFNfQp5DGWotYLNzu7P4QZIJZbEX/6RHjUIJ0zajVAyTGu5pc/WEh0pdzi8LELrlmGv+
         6V0PFjj1eovhaaeCTllNjHqpPAkLoim5bRgrcY7gamb+XNQ9b2DkZLo2ha1yD5Mv0nOY
         rtMQ==
X-Gm-Message-State: ANoB5pnhnQv4dT112AKy/cC5jKlE5IhQWg+PW/ONMlFQ3bMUsqZEoymT
        9wGpAFD2jr3ihpj5ANNLjipfhhRzQTHqsqJhujIXQHtSid8=
X-Google-Smtp-Source: AA0mqf6KgvCMWYP/UUtkuck6sqnjHSHnaNgKKykARcx23e1tLoD8/rvPTvo98r6094e0YDFFC8kw368rciMFi7AV2uU=
X-Received: by 2002:a1f:2882:0:b0:3b7:65cc:8ebc with SMTP id
 o124-20020a1f2882000000b003b765cc8ebcmr6798665vko.5.1668444166198; Mon, 14
 Nov 2022 08:42:46 -0800 (PST)
MIME-Version: 1.0
References: <20221114040102.66031-1-warthog618@gmail.com> <CAMRc=MdUNHsL3_uFR1j2ao4GCMvH_1W0ZMxe4QBG0HFu4xNcew@mail.gmail.com>
 <Y3Ja2d1X0vC663gl@sol>
In-Reply-To: <Y3Ja2d1X0vC663gl@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 14 Nov 2022 17:42:35 +0100
Message-ID: <CAMRc=MfCTE8mKn9+UE0XvPShAD4WDSZQ5m9waC4FvNTOb2-7hg@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v4 0/5] tools: improvements for v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 14, 2022 at 4:12 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Mon, Nov 14, 2022 at 03:26:38PM +0100, Bartosz Golaszewski wrote:
> > On Mon, Nov 14, 2022 at 5:01 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> >
> > I played with the tools a bit and really like the way they look now. I
> > think they're ready to hop into master, I'll do some more testing and
> > they should be in this week. Just one last request from my side: would
> > you mind updating the TOOLS section of the README? I'm aware it's not
> > yet updated for v2 and I plan to do it soon but we could already start
> > with the tools examples. You can send an incremental patch on top of
> > this series.
> >
>
> Good point - I totally forgot about the README.
> I'll take a look at it.
>
> Cheers,
> Kent.

Thanks. Is it ok if I just squash the first three commits in the
series when applying to keep it bisectable?

Bartosz
