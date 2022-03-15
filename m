Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16F924D9A4A
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 12:23:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237815AbiCOLYX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 07:24:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237382AbiCOLYW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 07:24:22 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0F172DE4
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 04:23:10 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id t5so19131065pfg.4
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 04:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9kN46v2Ebst34Rw+6do3BjXog/MKbyYk10eAWfwb+Xk=;
        b=j2BEl0fMb76/MUFLWA8mi+10HqmI2D2IEZaMTaSlqxjCMGgcZ4tzPnHiGj9Z/wLlA7
         fToXoCxxUpWZ+us1CvtksmKedTlvgxeMfr5Ksj3BRdi1Bi/DVC4IU+O+Isuet9ZqJxPc
         ob65l2nAOAWqDMSDqYexwU0FZhCNHQdfjKF04UHi9YYM6JIo0xv4IDPqPj5fdggEXqWc
         rbSs6Gz2QtasAygKlME2G2OQDS5SwXArsc/yQH/FDN0XpfCPZXYWCuMfGKuAiW/YKad8
         mtSSgwBMLJPERtn1tZkMmiyK/6iNA0BjaDM5J/ziKBd1s6DhPfvz4YesikfVNz5ikp8/
         7gsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9kN46v2Ebst34Rw+6do3BjXog/MKbyYk10eAWfwb+Xk=;
        b=6/lGgM7pyfRFJzGNUl7mHIIFIgzy40DOYoYphSU00YiOe/GQvG+1IWq8AUfb5NUwrG
         79dwMg6NMipj2yi/Y6nkpyS0yWffojYR2W3F4Dq5M+lVBSAW2s2fCWfEH6mlZHKb9Gil
         Av64A1ykQ+0z/JFiM6Xqs+twGNt5Z3wXVqnutx9HloPVwn7S1zg5IAiFRdhabSUhZN11
         UkavbmA+rm8v57rtFAvUwVRVXuHC8bYWJrY89j0vvB8P7zJ3MwGtFZ6M9DMcBBmpPuQg
         46FjawV+uB84D0DT50UBMiseC2JHT0/Vrj28GZduR1uRBPU7nZ5i0PSZzmRNkkDQ5AMZ
         p4jQ==
X-Gm-Message-State: AOAM533OgwtUv4Y3Sy+ePQzS1pFK8CagB1eEnAJAl12D7qyDKKthd2oX
        ip+8Fp6G+AMaLUSVhpyNkuQqN9bqYNSTJw==
X-Google-Smtp-Source: ABdhPJwenpXFMqwhE2422SDiepVjbYHDJn7Fl3SQB7s6GpvOxHYNnzxHlaxAeRi8AjT1TKRNGg8A5g==
X-Received: by 2002:a63:4463:0:b0:381:3c1e:7299 with SMTP id t35-20020a634463000000b003813c1e7299mr7997696pgk.490.1647343389924;
        Tue, 15 Mar 2022 04:23:09 -0700 (PDT)
Received: from sol ([124.148.64.37])
        by smtp.gmail.com with ESMTPSA id b16-20020a056a00115000b004f6ff260c9esm23362465pfm.207.2022.03.15.04.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 04:23:09 -0700 (PDT)
Date:   Tue, 15 Mar 2022 19:23:05 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2][PATCH 2/6] API: rename
 gpiod_request_config_get_num_offsets to gpiod_request_config_get_num_lines
 to match line_request pattern
Message-ID: <20220315112305.GA170151@sol>
References: <20220311073926.78636-1-warthog618@gmail.com>
 <20220311073926.78636-3-warthog618@gmail.com>
 <CAMRc=MfDmc86mK=8U_srVJg6fFvFy5hx+pnYmN8wS8rd4KWobQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfDmc86mK=8U_srVJg6fFvFy5hx+pnYmN8wS8rd4KWobQ@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 15, 2022 at 11:52:21AM +0100, Bartosz Golaszewski wrote:
> On Fri, Mar 11, 2022 at 8:40 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Both gpiod_request_config and gpiod_line_request contain a number of
> > lines, but the former has a get_num_offsets accessor, while the latter
> > has get_num_lines.  Make them consistent by switching request_config to
> > get_num_lines.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---
> 
> IMO this doesn't make much sense because we still have
> gpiod_request_config_set_offsets(). So now you have set_offsets but
> get_lines. At the time of preparing the request_config we're still
> talking about offsets of lines to request, while once the request has
> been made, we're talking about requested lines.
> 

Oh FFS we are always talking about lines.  Whether you have requested
them yet or not is irrelevant.  You WANT to request lines.
If we had globally unique line names we wouldn't give a rats about the
offset.

And take another look - you have actually have get_offsets and
get_num_lines functions.

Offsets is just one of the attributes of the lines, and this approach
still works if there is another fields of interest. e.g. values:

int gpiod_line_request_set_values_subset(struct gpiod_line_request *request,
					 size_t num_lines,
					 const unsigned int *offsets,
					 const int *values);

which you then complain about in patch 4 as I'm writing this.... <sigh>.

You could equally argue that one should be num_values.

While we are still preparing the configuration, we are preparing the
config for LINES, not offsets.  Using num_lines is a reminder that you
need to provide the offset for each line - the two are inextricably
linked.  Using num_offsets could be taken to imply that
gpiod_request_config_set_offsets() can be called multiple times to add
offsets.

> I would leave it as it is personally.
> 

I know, I know :-|.

Cheers,
Kent.
