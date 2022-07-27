Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90BDF582000
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 08:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbiG0GUO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 02:20:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbiG0GUN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 02:20:13 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17BDEFF9
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 23:20:12 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id q22so9946311pgt.9
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 23:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=J4XgR/OTjcKwF4jFDksTbOEVq7B2pjp9eo4JEUL8Kwo=;
        b=mSLVc19sYLV1KqbFsRlnlmoJcZBRVFp9yTRYBf9dTQMQxWdYi2N8BYxP58DVMcu1rG
         Ygv9kVvB7IGc81H5XH/rYR3vL5AVsDPoitiSk3HJ+RABWKBdH7rsiUVVwTT9LIcGpFaE
         +thA3qZZ/PLACPPfXTCqYzt9sK30ftRgQZjMf/QWysPCO+Hr/1zv32oszvQLlkSGW8H4
         GaJSnSrvvOv5P6a9AjeiFtWpSXDEVT5AvLxQMxDZHhsbs90HJjYvnUkLQ/NZrEat5xCd
         43DMqtg79ANI1EG1LKwU6b5RNrEgOPs8/QzFXP/sFU9sWb6/O3C3tjkCTnNF8ITnhdN5
         SHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J4XgR/OTjcKwF4jFDksTbOEVq7B2pjp9eo4JEUL8Kwo=;
        b=AtqxI6u6E4PS2h0HytFUvfpRTD5ms5tK9hZgaiYV33d3osh2NMRqYBHUY2JrRoKDqI
         /+Fq5S34beYOYamf+jdRWrVZ6z+kosrg1pzL5liUXOWONVMZ26irlkjsObIEjgOOZVdO
         H6atiZRaSri/NtHoc+C8ca9PRt2sUYISBLfLAq9Y94OgX6AnhjDVITNM/QvWLHJKzL8q
         WawBgibPMMb4qkVEoE32q8fNJcmCBLgm1VJFaNDbadXEc6pd0WAznhlLTsQ+3wMDfFhP
         WLyWhrbKVpBltg7JJ5H9S8fjLYmDJLdcAdsuzCZSKc3VwBZb1BhyXH4x27rsMl36TUG7
         gWsQ==
X-Gm-Message-State: AJIora8cQzSqa5D3+8n/I6cKwCt6NHhjc1RuUmOze2WuzI82k7aDKSGb
        1s2F+re/knyCq4kN9366r11IqQ==
X-Google-Smtp-Source: AGRyM1veXwn5VHxnYOWDszYm/LVM6YwfMNOdFNITDcjh2l7kWfmh27JQNl69Z2/gAbo4EikZpMK3wg==
X-Received: by 2002:a05:6a00:8cb:b0:510:9ec4:8f85 with SMTP id s11-20020a056a0008cb00b005109ec48f85mr20274882pfu.24.1658902811562;
        Tue, 26 Jul 2022 23:20:11 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id l9-20020a170902f68900b0016c1f05a8fasm9168211plg.182.2022.07.26.23.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 23:20:11 -0700 (PDT)
Date:   Wed, 27 Jul 2022 11:50:09 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V4 6/8] libgpiod: Derive debug traits for few definitions
Message-ID: <20220727062009.mry2z4phrft7aas7@vireshk-i7>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <490e4efc900d8173fb3e2f1373c97e1a20cb9ac3.1657279685.git.viresh.kumar@linaro.org>
 <20220727025832.GF88787@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727025832.GF88787@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27-07-22, 10:58, Kent Gibson wrote:
> On Fri, Jul 08, 2022 at 05:04:59PM +0530, Viresh Kumar wrote:
> > These are required for tests, which will be added by a later commit.
> > 
> 
> Squash this patch into patch 4, as you know you will need them
> eventually.  All public types should implement Debug[1].
> 
> They should also implement Clone, Eq, PartialEq and Default where
> that makes sense.  And Copy if you are sure you wont add something
> non-Copyable to them in the future.

Sure, will define few more for all public structures.

-- 
viresh
