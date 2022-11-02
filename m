Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A875A616362
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Nov 2022 14:08:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbiKBNIg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Nov 2022 09:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiKBNIf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Nov 2022 09:08:35 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4894E205D1
        for <linux-gpio@vger.kernel.org>; Wed,  2 Nov 2022 06:08:35 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id p15-20020a17090a348f00b002141615576dso2036282pjb.4
        for <linux-gpio@vger.kernel.org>; Wed, 02 Nov 2022 06:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aw1HnfDhXp/OzvrfxFk0jLXzy3mghvv2nCzXahVAL5M=;
        b=Bp5KDuUZJWyGzkw2w3fNejHjjrtC8MLlHH9oV1c57wlVIJ85MlbkQwlBs3vGCxUy8K
         7cNyyXtIWHQ22y92wLPHsD44lA8jKTW0oomoTEASSqIB+sn77oFjnu7EkY+uEleTIB5W
         Ss5i9KNX2vcpvVHn92fhvPyTKuL0BT+c6kl97F9jA0Zzi+0LyvGjvbe4w1r1FnKjMonZ
         vGMD2M7DImxgz1uZkoiH0olrCjt/wkfZF1+QbEmW+LS4JFb0d8ZBFdmuHcOKPOC7Nl1L
         hO8/PlEIExnxz8dcGE9G1uhhPbbU4wGu4p4PKWCQ4DuqEtHL+CwPv4+7pNrKDaJYvCnR
         Zh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aw1HnfDhXp/OzvrfxFk0jLXzy3mghvv2nCzXahVAL5M=;
        b=eYb6M1jt676OO9HCJbVOE2iKXHYoG9z1nwEwLdwx2L9csxfi0ZV9oQD7DmYFqVEEd3
         bGtz77tfog0v4V/wjV+5T9o9EIlApK6Mr7I8WqA+OZuEmq0Z17WeMUjR/MVCSkEHYAMP
         H9umjGE43yf/x0GJnMRz2Ko1ERR3+ntncO2rfnLqyN5ojfptT5yC5xW4DlAVXfR4cC3g
         I6RSzLrV+SrkVSeaJHg8MI15X8+rwPLgZht7HerTW/m/rfwu72VGRmkqioh9Xo5sf3+C
         w4h2L68uDNxwn3EZFKKFLTFAfc1rVZcgoGbjYObGOYbndav831/GyXFXNgbK7dBNQp7O
         BnZg==
X-Gm-Message-State: ACrzQf2VWDh6dWAVO77IXHlxM901zm/ugNb+AtS0J+zgYzzk3hNc/BaZ
        F1j659jDjFu3CETxLLQ6H5Y=
X-Google-Smtp-Source: AMsMyM5vb9UaNE+eNt8CsVL4CjcY3mccOM8nQzue1cD3PS1SQszVeAwvUD7MrgO7zGO23ITnTbq2qQ==
X-Received: by 2002:a17:90b:17c9:b0:213:32a9:465b with SMTP id me9-20020a17090b17c900b0021332a9465bmr25126890pjb.54.1667394514717;
        Wed, 02 Nov 2022 06:08:34 -0700 (PDT)
Received: from sol (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id f5-20020a170902ce8500b0017e9b820a1asm8364488plg.100.2022.11.02.06.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 06:08:34 -0700 (PDT)
Date:   Wed, 2 Nov 2022 21:08:27 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V7 3/8] libgpiod: Add rust wrapper crate
Message-ID: <Y2JrywE5RB0Mdrqo@sol>
References: <cover.1665744170.git.viresh.kumar@linaro.org>
 <6a94249d2d69bc5c1907fea9ed80c9d7e34278aa.1665744170.git.viresh.kumar@linaro.org>
 <Y01RvbboC3dMDVSy@sol>
 <20221021112238.teqz25pn3hz5d4cs@vireshk-i7>
 <Y1KTCWiGdUxkQ6Al@sol>
 <CAMRc=MdWce2Msjwjyo3ny9LyUsA8Zeq_WhhJ2=ar5CG1BPmhtg@mail.gmail.com>
 <Y1/AtfEhuijx1+tK@sol>
 <20221102040049.64b3yll7itvi7vzw@vireshk-i7>
 <CAMRc=Mc=gjGPcVOcx8YGNFqEsnve0h5a0OYqNMsWmUOP19wVAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mc=gjGPcVOcx8YGNFqEsnve0h5a0OYqNMsWmUOP19wVAg@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 02, 2022 at 01:47:44PM +0100, Bartosz Golaszewski wrote:
> On Wed, Nov 2, 2022 at 5:00 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 31-10-22, 20:33, Kent Gibson wrote:
> > > Wrt the Rust bindings, I was assuming that either Viresh would provide
> > > support, or as his work appears to be on behalf of Linaro that they
> > > would have an interest in maintaining it.
> >
> > I will surely help in maintaining the Rust part. Not an issue.
> >
> 
> Sounds like a plan. I'm going through Kent's gpio-tools patches and
> rust bindings are next in line.
> 

The rust bindings might make it in before they do - you may find that
they are a bit more different from the old tools than you were expecting.

For my part I'm just wrapping up a quick pass over rust v8, before
looking for where the python landed.

Cheers,
Kent.

