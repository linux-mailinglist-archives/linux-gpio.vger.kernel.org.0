Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBD0775A89E
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jul 2023 10:05:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbjGTIFS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jul 2023 04:05:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbjGTIFS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2023 04:05:18 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5295E135
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 01:05:17 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6687446eaccso418814b3a.3
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 01:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689840317; x=1692432317;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TVvPYEDz/7OrMZAplW1M790X/LH+R0stg1w7ZkM3xBU=;
        b=RdGDUcqGmlVLzTfqLRgJy/x9Oz923Ocj986N1NBIdY/vl8r5/wt689AtMyi4/MbaST
         5AKQJiUWEIXFWFlbASWzFsAww/RuiGupJdrvkXz+uVXgPVCf6fhRq0fp1FIrIG1JSgYj
         1ivQ8aExg7B7ctOeKBmOa+CSmhkX7ohTOpKeg3kWJQefxPFRnRz88RDaDdp9EnBY3ZQl
         5VlL4vsQLlqptvAmNKIibkCV/vgxr8zqTj0fPHj6UsDFWRPKTUEs99AVhnyJT6oMSZwp
         s+wUuvG4ljX945jEQi9kSrRrDX/EIdQuJGgIoc229Jgmu6JkcEfwtnKj9sl8KIlDjuSi
         q6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689840317; x=1692432317;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TVvPYEDz/7OrMZAplW1M790X/LH+R0stg1w7ZkM3xBU=;
        b=XrMWtQ1Rh9N/6uZ/fu9E7Nztwg0BPPg4n3ndAdMxZNaDHJjuG7Nwu/8a1j5kILgDHF
         32MNY4EUk+j6T3IBItnKGiPRJHEncaaX74d/evAil9z0yiMCob9kECZZ0JyMM1+eN3Qe
         I/MIsBAdzSLZcqDOgRjhnI6r1O95NtK69eioiyT55N2tbIwDzcrqRGKUDH9otPkiFo30
         SLsevnQ64crKOjny7ubKE6aBbedFBN0Vk39M4x31lVWA0/6qANb3TLgoX+zXcO7PwzSr
         muyevK//6ZjIyKpoFhvIErDX4TJ/o81PV9rbpNBZ53XpqteCj9EO5fDFDboglZFhRW+R
         VChw==
X-Gm-Message-State: ABy/qLYVXUNK+z9auILtYJBE8UVqqmh0z8HE4KFVWm6pij7QEF8a1FlV
        dWIka5SlOrAguK0rHKmEKQJNC95ox+o=
X-Google-Smtp-Source: APBJJlEsr55vpX4y9J84lYyC8rhVZvY5BJflOXTUWZQ7q1NjhTOYm5y0qpTTatLiSeeXNxnkbQsIZw==
X-Received: by 2002:a05:6a21:6da5:b0:133:1a76:6bab with SMTP id wl37-20020a056a216da500b001331a766babmr26634049pzb.47.1689840316219;
        Thu, 20 Jul 2023 01:05:16 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id t26-20020aa7939a000000b00640f51801e6sm505876pfe.159.2023.07.20.01.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 01:05:15 -0700 (PDT)
Date:   Thu, 20 Jul 2023 16:05:10 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 0/5] core: provide information about the parent
 chip in line requests
Message-ID: <ZLjqtVcTCcStYac4@sol>
References: <20230719192057.172560-1-brgl@bgdev.pl>
 <ZLipqIJE1Mo4oK00@sol>
 <CAMRc=Mf=Xf7KPP+9GPC6=1Gsp3XTfzrwjOK2jrqeP7QUVxtD+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mf=Xf7KPP+9GPC6=1Gsp3XTfzrwjOK2jrqeP7QUVxtD+Q@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 20, 2023 at 09:59:00AM +0200, Bartosz Golaszewski wrote:
> On Thu, Jul 20, 2023 at 5:27 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Wed, Jul 19, 2023 at 09:20:52PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > While working on the DBus API, it occurred to me that while we can obtain
> > > the list of requested offsets from a line request, this information lacks
> > > context if we cannot get any information about the parent chip on which
> > > the request was made.
> > >
> > > We cannot reference the chip in any way as its lifetime is disconnected
> > > from the request but we can at least provide the path to the character
> > > device used to open it as a way of providing some context for the offsets.
> > >
> >
> > No problem with this conceptually, the only question I have is which
> > one of these should be stored:
> >  - requested path e.g. 'a_symlink_to_my_favorite_chip'
> >  - canonicalised path e.g. '/dev/gpiochip0'
> >  - chip name e.g. 'gpiochip0'
> >  - chip number e.g. 0
> >
> > In this patch we get the requested path, right?
> >
> 
> Yes, I think we should just use whatever filesystem path was used to
> create the chip as it would be the one allowing the caller to reopen
> the same chip.
> 

So there are instances where those four don't map to the same thing?

Cheers,
Kent.
