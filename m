Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A12335826D8
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 14:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232521AbiG0MlB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 08:41:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232141AbiG0MlA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 08:41:00 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D1003C8F7
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 05:40:59 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id y141so15974186pfb.7
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 05:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=44LkliKARC1YczNwkxNEX4Gy32f5qk0VBqXWe0aoEKA=;
        b=e9CSpsKyM7ls1cB6BzsSjFEmz6kYFaTRkQc6o9g13aQVSx5j8iVPebLFwO58nyNb1Z
         mW/Zv314esAHFEOfkxoU9f3j7mhEl6gLcELrfSXCOjodKUcWxy5OPLZQcYv3vrqBe2vx
         wk/mUD27gFfh2rdMnjkEevCgqrXS+2JhjxYYBkk/UnHDKkHQcHv6GxOsWmQ9yYXEJetm
         lzqQS0irjoPF2dWsR+lmSZ5mcBRDWg09Tlcgz77I+fCYPikxKUpR91SOC5cIlZ0BAuA+
         AlRrSkkelpc6sK13TB+BAu8RfwCfYD2/zM85SW5FQ/WBqhcy1iLheEbqDIlTyky/g1J0
         MtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=44LkliKARC1YczNwkxNEX4Gy32f5qk0VBqXWe0aoEKA=;
        b=pp0X2wZf4fBgSKDMprtxSPhPx7Uj+0+/8np+Y3EspfDlnnBieLUcvegIhKxRxSXEKf
         hTlLBK3kPDGNirYwD0+wUVmwoED44ozh4FkuUqwHug+PnJFk4xI+HFvem4Lo1Wn4xTRs
         FvilMZrDSVTtgzcGPGFVJBjN6Mg/GYwm1QSCVNhOoxXxxFljwH6vFlPUG/hLTPnKziP8
         yRprrPufoPxf9379P9bMltdcZ1uMQ1QURBaQ67Uiq5shiO/XWmUw/eLmfjdujcpCKPW5
         5FGzNBnaq73iOR9Cls7k9B58llNMBis1NBLclwmyFg0SDaIa/5OscxaAfukqrbSGCxUx
         Obiw==
X-Gm-Message-State: AJIora9Bu6y9NUkBfbbd4toQTk7CmsWaDUM9H4seX9/Lw50onp1KiiGq
        suOTY7RBcHjtPqa3ATLvOAxZwZi1RJo=
X-Google-Smtp-Source: AGRyM1ucZk8VmjzlLSuZeaFXvSWjlnI6YXqGxRPSnsqjsDEWnHZzAM1M8BDoO011RbAlqSe04TD7mQ==
X-Received: by 2002:a63:e002:0:b0:41b:323c:ea41 with SMTP id e2-20020a63e002000000b0041b323cea41mr4912181pgh.508.1658925658460;
        Wed, 27 Jul 2022 05:40:58 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id s6-20020a17090aba0600b001f3095af6a9sm1629448pjr.38.2022.07.27.05.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 05:40:57 -0700 (PDT)
Date:   Wed, 27 Jul 2022 20:40:51 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V4 4/8] libgpiod: Add rust wrapper crate
Message-ID: <20220727124051.GA130052@sol>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <c3bdcaa85e1ee4a227d11a9e113f40d0c92b0542.1657279685.git.viresh.kumar@linaro.org>
 <20220727025754.GD88787@sol>
 <20220727090701.hfgv2thsd2w36wyg@vireshk-i7>
 <20220727100809.GB117252@sol>
 <CANiq72mXH2Z-5aOu6dz47-hDPZjNQZAqYeGPv1vu3fARHJUtuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72mXH2Z-5aOu6dz47-hDPZjNQZAqYeGPv1vu3fARHJUtuw@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 27, 2022 at 01:06:28PM +0200, Miguel Ojeda wrote:
> On Wed, Jul 27, 2022 at 12:08 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > It should never return NULL.  At the moment.
> > I would prefer to have NULL checks for all cases, not assume anything
> > about the C implementation, and to be consistent with other places
> > where you do NULL checks.  As it stands when I see this I need to go check
> > the C to see if this is a reasonable exception or not.  And I'm lazy.
> 
> Ideally the C side would document the guarantees explicitly instead,
> and then the Rust side can rely on them.
> 

Unfortunately the C header doesn't currently provide any guarantee -
except in the cases where it CAN return NULL.
But we can fix that.

> In any case, if a given C API never returned an invalid pointer and
> suddenly it starts doing so in some cases, I would consider that a
> breaking change in practice, which would likely break C users too.
> 

Not sure I'm onboard with that.  Unless the API has a contract not to
return a NULL then it is free to at a later date. The user should
always assume that NULL is a possibility, even if they have never seen
one.

But in practice you are probably right.

> A potential compromise meanwhile is `debug_assert!` to at least test
> those assumptions.
> 

I'd be fine with that.
I'd also be satisfied with a comment in the Rust that the C guarantees a
non-NULL where that is the case.  That would at least demonstrate that the
possibility has been duly considered.

Cheers,
Kent.
