Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0791070DC5D
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 14:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236557AbjEWMTS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 08:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234997AbjEWMTR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 08:19:17 -0400
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43B93130
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 05:19:08 -0700 (PDT)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
        by fgw23.mail.saunalahti.fi (Halon) with ESMTP
        id f9c03db6-f963-11ed-b972-005056bdfda7;
        Tue, 23 May 2023 15:18:50 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Tue, 23 May 2023 15:18:50 +0300
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] [RFC PATCH] bindings: python: allow specifying
 infinite timeout
Message-ID: <ZGyvKn4NG0j9K2Q_@surfacebook>
References: <20230519174619.58308-1-frattaroli.nicolas@gmail.com>
 <CAMRc=McrerNizhJ+d1m6PaDf65UX-RrZjAYjdABiLjZ69TPRWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McrerNizhJ+d1m6PaDf65UX-RrZjAYjdABiLjZ69TPRWA@mail.gmail.com>
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
        SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Tue, May 23, 2023 at 12:06:47PM +0200, Bartosz Golaszewski kirjoitti:
> On Fri, May 19, 2023 at 7:47 PM Nicolas Frattaroli
> <frattaroli.nicolas@gmail.com> wrote:

> > So far, libgpiod's Python bindings had no way to state that a
> > user wishes to wait for events indefinitely, as a timeout of
> > None would intentionally be converted to 0 seconds, i.e. return
> > from the select call in poll_fd immediately.
> >
> > The usual Python convention and even the select convention is
> > to block indefinitely on a timeout=None. However, changing the
> > poll_fd function to do this now would change an (intentional)
> > API design choice by libgpiod 2.0 that API users presumably
> > rely on.
> >
> > By allowing float("inf") (or in fact math.inf, or your favourite
> > other way to get an infinite float) to mean waiting infinitely
> > solves this by extending the API rather than changing it.
> >
> > On gpiod Python bindings without this change, passing inf results
> > in an OverflowError being raised in select. API users who wish to
> > support older versions of the bindings can catch this exception and
> > act on it.

...

> I like this approach too. In fact - it may be even clearer and more
> intuitive than converting None to infinite timeout.

With all respect to the clever design solutions I would rather go the
de facto Pythonic way. If the native libraries use None for indefinite
then it's better to do that way, otherwise we will add quite a confusion
to the Python users.

> Any objections against using negative numbers for the same purpose as well?

The question here is: What in the very same situations are other (presumably
native) Python libraries using?

-- 
With Best Regards,
Andy Shevchenko


