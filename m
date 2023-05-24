Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0A7070F169
	for <lists+linux-gpio@lfdr.de>; Wed, 24 May 2023 10:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbjEXIuW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 May 2023 04:50:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240139AbjEXIuV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 May 2023 04:50:21 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 930C918B
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2023 01:50:17 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2553663f71eso542264a91.3
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2023 01:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684918217; x=1687510217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/1fZCC3qE6K6LRuaXb3xnKP3qGbKHYzsvGxbl1k0lwc=;
        b=pXD2ibZa0TeEh1huGJTMvIa5W2zHpNFJkJO4aoLOatLJ6rsRjIb657Js4crJtthkZu
         /cm2v6OquoIktp2RltLVLvrpSTiFg2uVzRdZsVKLpFCRAKwsQHzL7eieTRQNHSZNuF28
         wtJVPakSKUntmSNhkJ5V99aIOyKGW2k3vGF50vWGjIfUmw+ruSImmtNIbyuwmvN0BU3n
         50kDEsoXo2APkuRyEfi1QmG/pwkJX1Vk7R63SQeFqe3lAljME4m5rtK0l6xsf4D7D26G
         CGvreKCB0Bypjuhiescf88wRe58RYqAqfGTvW7JcpoCAyemqnt5wMnulu/fS0ML1gkAc
         kKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684918217; x=1687510217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1fZCC3qE6K6LRuaXb3xnKP3qGbKHYzsvGxbl1k0lwc=;
        b=LTLr+ukxc7lglSlIKn2WvUcMfb1MeZ6oYWJF93x1zQ4vZUcjE+rKKHvUGqv9Yd6aDX
         aFnx3XUj6JCbNsah+8/t6NTN1sSy24u5ag2Y8+9U3surYjvUh2IP4gRcsNakXXhLwNoC
         tz1OC2UwnWEF8BPP8zSUgbNQ5PfGS5uWFyEs1Q7yF/qWKP6MHjN4tdj0mrRV7RyD35ph
         3aOovdt5zDrWO7N0Zd+Q61TFrAxzEomSThVW/AAmiBHkVajlQ5Xp7kIe4FUK7t82TslI
         TPKDtyJN1pxX5KjM+hyrt0g68KtDxVJccLC3IYQY7l8HMm1PLkZ1e570r+8PFeAvKFyN
         V88Q==
X-Gm-Message-State: AC+VfDwvqFryCLnN4acBjKItBRpLbNelPQ9nsj87dxSciFjIkRu//fHI
        1zE2OzuE6QKFKwJpZSrltWRJk82YuLo=
X-Google-Smtp-Source: ACHHUZ6lQtTHNfj725+LA7fE+zzCT+4NbTrKY2VuatJUaY6SK00RJeNpL+ehjdv/0RYbDcn674qLGA==
X-Received: by 2002:a17:90a:ea94:b0:255:2dfc:6c6f with SMTP id h20-20020a17090aea9400b002552dfc6c6fmr12829618pjz.24.1684918216950;
        Wed, 24 May 2023 01:50:16 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id g5-20020a17090ab48500b002537d88e22csm847165pjr.48.2023.05.24.01.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 01:50:16 -0700 (PDT)
Date:   Wed, 24 May 2023 16:50:12 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     esben@geanix.com
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [RFC PATCH] gpioset: only print prompt when stdout is tty
Message-ID: <ZG3PxEEjYSacBrja@sol>
References: <3dcc614b9d28f04e42f78afdd18518c7251b52ae.1684849980.git.esben@geanix.com>
 <ZGzdaJ/wBSUDsJdU@sol>
 <87pm6q9r7a.fsf@geanix.com>
 <ZG29npyOJVyJPsLM@sol>
 <87lehe9ncs.fsf@geanix.com>
 <ZG3G4FMUYmB8Ogfv@sol>
 <87edn69lee.fsf@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87edn69lee.fsf@geanix.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 24, 2023 at 10:35:53AM +0200, esben@geanix.com wrote:
> Kent Gibson <warthog618@gmail.com> writes:
> 
> > On Wed, May 24, 2023 at 09:53:39AM +0200, esben@geanix.com wrote:
> >> Kent Gibson <warthog618@gmail.com> writes:
> >> 
> >> 
> >
> > Not just for testing.
> >
> > In the real world the prompt is there so the controlling script can tell
> > a command is completed - same as a human would.
> 
> And still you say that I should probably redirect it to /dev/null ...
> 

Those are two different use cases.
Redirect for the simple daemon/fifo, using the prompt with the coproc.

> 
> So when you call read(2) on a named pipe opened in blocking mode, but
> without any writers, you don't simply get an immediate return with 0,
> indicating EOF?  That is what I saw when I tested it previously.
> If not, I probably just messed up back then.  Sorry about that.
> 

gpioset doesn't do the open or read on the fifo itself, bash does.
gpioset just reads from its stdin, and that blocks.

Have you actually tried my script?

> > You missed writing your own daemon. Or asking ChatGPT.
> > But you do have options.
> 
> Yes, you always have options, and I will go with one of them. I will
> probably not go with ChatGPT though ;)
> 

Where do you think I get my answers ;-)?

Cheers,
Kent.
