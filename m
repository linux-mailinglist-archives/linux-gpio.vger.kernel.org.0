Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0F6B66BE13
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 13:45:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbjAPMpX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 07:45:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbjAPMpW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 07:45:22 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 983881E29B
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 04:45:21 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id b17so22718909pld.7
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 04:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CAtPlyrRzFRMEDqXoBAAEM1RtC2ddfmD7RUkZi6yGoc=;
        b=AgMgrruDCUIXkbxeZDI7wRxaTWWO4FW8tVA8k+ghCN09sbCN0hQY/GWqzODJxRQvGR
         FpdmBLbW0gtYF3XwUO1FhomvxhDUg7GrOa+rW8XJfwdXTp0te7YZ39qxG23rTeQ8UdbG
         3uhxezqpxSTykntJxIYYEKz8hE/7lx7HFjX84dogPRdu3CXmmqm45fQescQsNeRUnKhi
         ubW5jg9S8GgbNFe2zno+QUcHhkrboayt8LJE9sUZZr5Qj/29WlpFH/Fn1hfe9XRU4sEw
         gdN72/aqYJxbEvL8rQ8ydvKpzy3eKSOtb81An/9K/6+Tf1CxFjtcc+D5N2ukd0kjfJT8
         nX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAtPlyrRzFRMEDqXoBAAEM1RtC2ddfmD7RUkZi6yGoc=;
        b=y81j+yqRQqWf82B9W5me3uKUq8h6wdfDgjuF2CF4kD7ewPNHMcKFBOaGLV4r1Sgckj
         onJM4OEHQAOuPIXTYRiKDRpsIW0rmTqLc9ewlC2GwKLB6NV+S5vJciBfxRHYbGr2MCd8
         UJuwHPMuoLPV7czSe5hCC0pS5CgIyHDMZzyxf/TSRnAEJ3i51ZFi8Xgox/H7HzgFPOTK
         RHGlc/38g7Lv5gm6OKpYRLKK51vscEAz3oW24OxQW7LaRGrqsj0C9hMezQAv1XMXBHB9
         Z6DzRFfdo+1Df+lmT0/jfDoccbdoqbxhwFYfZc59hipjH/CBCvugUvGuEC92eoaEqdxY
         fCYA==
X-Gm-Message-State: AFqh2koZQDCmKO5hG2L5TyvsGJ0cCRnPWf6Z3ohBWXzKe2V7mfi9B5j9
        v13W6lXVLINWFqwI8bidrbDLLWsmgEtyPw==
X-Google-Smtp-Source: AMrXdXsFj27FL0pHi7Z4bTCiTe3yF5KV4QGqdVt8rnpQlfSAsep7UV+Gug8/hiUUHMGda8/jrePrpQ==
X-Received: by 2002:a17:90a:b38a:b0:225:c902:c86a with SMTP id e10-20020a17090ab38a00b00225c902c86amr20957098pjr.28.1673873121054;
        Mon, 16 Jan 2023 04:45:21 -0800 (PST)
Received: from sol (110-174-14-241.tpgi.com.au. [110.174.14.241])
        by smtp.gmail.com with ESMTPSA id cl14-20020a17090af68e00b00218a7808ec9sm16805471pjb.8.2023.01.16.04.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 04:45:20 -0800 (PST)
Date:   Mon, 16 Jan 2023 20:45:16 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH] bindings: rust: fix documentation of
 line_request set_values
Message-ID: <Y8VG3LxGa1z95FzA@sol>
References: <20230116003606.11998-1-warthog618@gmail.com>
 <CAMRc=MdHUV5vS5cWn+s-owEPFVCzoi8=hA0XF5V1cPPLcATx6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdHUV5vS5cWn+s-owEPFVCzoi8=hA0XF5V1cPPLcATx6Q@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 16, 2023 at 10:05:43AM +0100, Bartosz Golaszewski wrote:
> On Mon, Jan 16, 2023 at 1:36 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Replace "Get" with "Set".
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---
> >  bindings/rust/libgpiod/src/line_request.rs | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust/libgpiod/src/line_request.rs
> > index 2816cc1..35f07b3 100644
> > --- a/bindings/rust/libgpiod/src/line_request.rs
> > +++ b/bindings/rust/libgpiod/src/line_request.rs
> > @@ -106,7 +106,7 @@ impl Request {
> >          }
> >      }
> >
> > -    /// Get values of a subset of lines associated with the request.
> > +    /// Set values of a subset of lines associated with the request.
> >      pub fn set_values_subset(&self, map: ValueMap) -> Result<()> {
> >          let mut offsets = Vec::new();
> >          let mut values = Vec::new();
> > @@ -136,7 +136,7 @@ impl Request {
> >          }
> >      }
> >
> > -    /// Get values of all lines associated with the request.
> > +    /// Set values of all lines associated with the request.
> >      pub fn set_values(&self, values: &[Value]) -> Result<()> {
> >          if values.len() != self.num_lines() {
> >              return Err(Error::InvalidArguments);
> > --
> > 2.39.0
> >
> 
> What commit is this patch's parent? It doesn't apply on top of master.
> 

My bad - I've got a commit in there where I was playing with fixing the
clippy warnings from rust 1.66 (I suspect they are false positives so
haven't submitted a patch).

I'll rebase and resubmit.

Cheers,
Kent.
