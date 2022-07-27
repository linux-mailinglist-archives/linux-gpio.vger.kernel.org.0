Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6B3A582461
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 12:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231468AbiG0KcY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 06:32:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231295AbiG0KcX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 06:32:23 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65DE346D8D
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 03:32:22 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id c139so15762140pfc.2
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 03:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8Mq0LUunzFZvIBcb5yKs70npgxlrE6qtuaWiaRyTGXI=;
        b=DnpTYIDXXk/udgWVUqxXJsXOKK2xJESG2fssQI91NVgltC6tN6twL9uzVgPSwhAG/0
         ARh+/fPaiwAajho2RY4DGS8d1GzL6xx2BqSuoX6BkqhO3e05t7AzUWUaeHpytfJZNEHi
         Eeh0jV6z4bdCUlHasPNlaD5pOuz2bOtJTjGvfzY+GQeeuzvFRdJHaal99oubXG5evsgb
         Y0NM8WStVdx5V8kFrg9bh+KPvpLAGxLEaUjgq5Ih7mWSj5S4YnpeTbLqgvpfSHuBsFNy
         no95RjLuM3+bReH4/NjfRsrPVOUvqvTUSiY2ogWF/Cj1MEks8mBnEYOjnj5tr6VrV/bM
         CDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8Mq0LUunzFZvIBcb5yKs70npgxlrE6qtuaWiaRyTGXI=;
        b=413iY0QMGPfZgED/P5oyAr1vCKhtpOX+2hJ0K4PaQq6N7t0l1656B3BKN9PS688h4j
         7R1h10SS5RLBW2D1b+tTGC+WbZIaBeuMzN3joM3pMs+l1433Dxo98qY1lswY3FtVg1AL
         BlKT0rZfPbwjyvqzfzPZI3XdnWzqlPFWYQs4FJOmcDyuH7/hV/SzcBAfH0W5YYEixFJ7
         u6A/oyMnYV8AR8qgQ2UyxaTCpxoAagu1aZCSNxxHOWKZCRYX+6c6zTG6I+y+Wtk/5RRB
         DHjAsRNWD6w3sKgTpFESoCcfu5YE6wiRt376fG8PeZuvWQabby57PMvTcWCJfBGuq0XS
         Iwdw==
X-Gm-Message-State: AJIora9OWF4OkmdZorAF262PUBz/7/JImfUJrGqM718ISIlsJUVrnlJl
        DS4Gj1MvI+b89Y2jumOSr9M=
X-Google-Smtp-Source: AGRyM1ttabv3yYRlBBi8BxzeagBAB8ey4VTM1A0MaxxCuXezj+DLQtpSH+isU7FBytdneqRPgbVC3g==
X-Received: by 2002:a05:6a00:1797:b0:52a:d492:2f2a with SMTP id s23-20020a056a00179700b0052ad4922f2amr21460952pfg.42.1658917941856;
        Wed, 27 Jul 2022 03:32:21 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id q6-20020a170902dac600b0016d5cf36ff4sm8802096plx.289.2022.07.27.03.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 03:32:21 -0700 (PDT)
Date:   Wed, 27 Jul 2022 18:32:15 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V4 5/8] libgpiod: Add rust examples
Message-ID: <20220727103215.GA122301@sol>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <acd12e70cfb30f04761f3c2efc868ec138c90c63.1657279685.git.viresh.kumar@linaro.org>
 <20220727025815.GE88787@sol>
 <20220727092319.hwblcns4zcfbi4kk@vireshk-i7>
 <20220727095945.GA117252@sol>
 <20220727100633.4hrldpruyhblxobw@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727100633.4hrldpruyhblxobw@vireshk-i7>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 27, 2022 at 03:36:33PM +0530, Viresh Kumar wrote:
> On 27-07-22, 17:59, Kent Gibson wrote:
> > For long enough for the user to check that the line is set, as there is
> > the possibility that when the line is released it will be set back to
> > its default value and you will get users reporting that your set
> > doesn't work ;-).
> > 
> > So wait for a keypress?
> 
> I thought we wanted to avoid human-intervention to the tests :)
> 

This is for an example gpioset, right?
You have tests for your examples?

And even then you could either inject a keypress or just kill the
process. (e.g. the tests for the proposed tool changes do that)

Cheers,
Kent.

> Can't we just read the values of the lines again here somehow and match ? I
> don't expect/want the user to do this for running the test. Not to mention, the
> user may eventually be a bot running the tests for each commit added to the
> tree.
> 


