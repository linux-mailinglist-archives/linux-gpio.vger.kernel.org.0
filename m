Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 736EB628D82
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Nov 2022 00:35:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236005AbiKNXf4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 18:35:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235826AbiKNXfz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 18:35:55 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 345409FC8
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 15:35:54 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id y13so12530750pfp.7
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 15:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TNjLtX5H6bGhAvD8V5fqqshhpg89gti1pzcE6YDJpPY=;
        b=WyXCsPOkd8bXwaoYSjzUplNpWMsAwrBD+yrHgpUxNJ4lRbZRXmcydWk8bjxN10xrGK
         w1t5mBNt42t6tdsfYFmplGpC7GEIMJzSL5txmNCIHs2slYi3c3CbVVgShcPi+MAVLpLx
         Fh6Q7UnA+AOdKgLXhH9Yktw7ODk202ADd3/CGwVaMug/tD/42P0pr4l8M6m7v5JR6crE
         cg1qQ3kho7Ax5+6TLICUUZCMNiL5lONDY5Chx3O+MSbdwDTDFh0kGCyXSB65clDd6V7g
         MdCBioTNoInlBN41rRBbHF8pHOThBQ+fVuQYhf4IgRiPCGYrsz6YVFTnzhK9EC2Qqzz4
         DdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNjLtX5H6bGhAvD8V5fqqshhpg89gti1pzcE6YDJpPY=;
        b=XPw34gJJOUVcnRzUnCi6bCtryOBLGGAiz84sAoOA/MHKtbMNj20nXxwQgxFqstP9rE
         tlJW0vWBGfrLOlhFVFOAMlTEU7zN+dcH+SOiBEr4HJqjgtaJOHh5PmF3EG83Y/wpQHow
         5WjQlGu4293+uEoj6nLBvCwcdTHwfUOvjqJrsv7CjK6RZ5dAm0i/pLDMICMvJCIZOC/3
         hZEr7zs8tQSLp5LPZMWVOSexfCzmtchBRldw12WV7g/CS75pZTc5kChZUaNR7N3V3QlC
         4nhw3Dsns26/AwphHbXYVcGkKwf+icpVyM/mSvT3ouD9JfZkXbLqfhjrGF7ypp4Y96Qb
         VD+w==
X-Gm-Message-State: ANoB5plsFS+LlTLYgcxzjYzx6vMoQGbbQ9W2E22tRcpv5KmHqdfhjXGS
        1va407FqFPzujtQGPK8AIkjGzKjTeLw=
X-Google-Smtp-Source: AA0mqf7nALnps5MjhSy0E1RLfELifpFHgMo/H3cHrXWJ0UbXyW5CqbBGEvKwuj7NoU4T2OusCXKAfw==
X-Received: by 2002:a63:c009:0:b0:46e:bcc1:28df with SMTP id h9-20020a63c009000000b0046ebcc128dfmr13398420pgg.187.1668468953583;
        Mon, 14 Nov 2022 15:35:53 -0800 (PST)
Received: from sol (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id 77-20020a621750000000b0056baebf23e7sm7517845pfx.141.2022.11.14.15.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 15:35:53 -0800 (PST)
Date:   Tue, 15 Nov 2022 07:35:49 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v4 0/5] tools: improvements for v2
Message-ID: <Y3LQ1QBzF121XsJ4@sol>
References: <20221114040102.66031-1-warthog618@gmail.com>
 <CAMRc=MdUNHsL3_uFR1j2ao4GCMvH_1W0ZMxe4QBG0HFu4xNcew@mail.gmail.com>
 <Y3Ja2d1X0vC663gl@sol>
 <CAMRc=MfCTE8mKn9+UE0XvPShAD4WDSZQ5m9waC4FvNTOb2-7hg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfCTE8mKn9+UE0XvPShAD4WDSZQ5m9waC4FvNTOb2-7hg@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 14, 2022 at 05:42:35PM +0100, Bartosz Golaszewski wrote:
> On Mon, Nov 14, 2022 at 4:12 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Mon, Nov 14, 2022 at 03:26:38PM +0100, Bartosz Golaszewski wrote:
> > > On Mon, Nov 14, 2022 at 5:01 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > >
> > > I played with the tools a bit and really like the way they look now. I
> > > think they're ready to hop into master, I'll do some more testing and
> > > they should be in this week. Just one last request from my side: would
> > > you mind updating the TOOLS section of the README? I'm aware it's not
> > > yet updated for v2 and I plan to do it soon but we could already start
> > > with the tools examples. You can send an incremental patch on top of
> > > this series.
> > >
> >
> > Good point - I totally forgot about the README.
> > I'll take a look at it.
> >
> > Cheers,
> > Kent.
> 
> Thanks. Is it ok if I just squash the first three commits in the
> series when applying to keep it bisectable?
> 

Whatever works for you.

Cheers,
Kent.
