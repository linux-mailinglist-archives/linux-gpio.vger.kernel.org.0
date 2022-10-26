Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3D2260E144
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 14:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233509AbiJZM4l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 08:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233711AbiJZM4j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 08:56:39 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFE5FDAC70
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 05:56:38 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id b29so10735388pfp.13
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 05:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kBBdtd5XbnYRgaPiLUQ+2ncSzZsGUE36JREFHY95ifg=;
        b=G3I8jWra1htnZOKFn9IKHlDM+5IwPZQIgloJdYM3sxJLXnDZbkX7OHLtjqZNEYsQa/
         BIawfCE7b+gZ5vZP4Xw2FgP3Lo0rRgGuUf9YBQ+QbXT8L4N0RX2L8cd3RrXvciKp5Oer
         QR8PbClFqg2PK4+abmGzWd2RefZYopLYvRDkIwS2teHC7uIbsOxy/Ec/p4jwRo7z4UXP
         DgdwVl6qnsmlVX5cpAWirBFBlr7eItCdfD9ywfhbXe6wNHsHAHicADDgisztbHjdnBvD
         94m475HU2+j6p7yRGQENtOxZ5d8j8fGvdWEC+LgEfne+mqcSBxt2vskZLXoVKnm7oseK
         7qzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBBdtd5XbnYRgaPiLUQ+2ncSzZsGUE36JREFHY95ifg=;
        b=VzZFsJM46zIOJNAKxqGpAf45Mr3qSEwxlHckTdc1R+C9M3WA3HVXzZP6HpSo1e/Rs+
         EEYUOjKEDt+nM7hTEhpXSHDGj5m6aT2qWbswMSqdnTBkytHFZAJpfpWZKvGrGzSsvK+5
         +Jf0tPHiqI8TXL+xnbQaNxuhRcyBeV8bq8phh5GqPQ11sD6tnCgDLJ+zlwfFfJORT7gW
         0CQrpkLw1wXPQToP2tJQ4v2OjY+k6P5sHrfSF84N7N9PyGKC5rJIPg/nb8ub6SHrOqgv
         FsnwEaJBDHIrpAwszzRvfEYJb6Rtua+az/hhLY65Qfo9QuyYEp0a5E2l7hcYMa1mqbQU
         71yQ==
X-Gm-Message-State: ACrzQf34OFNDSfCLburDzJUGgFz1erypiwC+MG3IXw8yATR5Ie5UzpkP
        z7WPBMkFoHJQXgLgv21BsLE=
X-Google-Smtp-Source: AMsMyM5CRzAiMzCyKn8o4g0m1SG97PH217+KyTtVBkJmrvvAODlMaJE5lj0WS0q6B8BB1coAfkgMaw==
X-Received: by 2002:a63:ed0e:0:b0:457:4a30:cb8c with SMTP id d14-20020a63ed0e000000b004574a30cb8cmr36583853pgi.161.1666788998068;
        Wed, 26 Oct 2022 05:56:38 -0700 (PDT)
Received: from sol (14-203-42-90.tpgi.com.au. [14.203.42.90])
        by smtp.gmail.com with ESMTPSA id s5-20020a656445000000b00462ae17a1c4sm2789789pgv.33.2022.10.26.05.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 05:56:37 -0700 (PDT)
Date:   Wed, 26 Oct 2022 20:56:32 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v3 4/4] bindings: python: implement python
 bindings for libgpiod v2
Message-ID: <Y1kugFIDyO4mhLVX@sol>
References: <20221007145521.329614-1-brgl@bgdev.pl>
 <20221007145521.329614-5-brgl@bgdev.pl>
 <Y0eBonEvVclIBQS8@sol>
 <CAMRc=Mf77zXc8_F_nsjyMMoCh6wnO10Lv2k22cS3N5KQ142Dcw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mf77zXc8_F_nsjyMMoCh6wnO10Lv2k22cS3N5KQ142Dcw@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 26, 2022 at 02:32:35PM +0200, Bartosz Golaszewski wrote:
> On Thu, Oct 13, 2022 at 5:10 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Fri, Oct 07, 2022 at 04:55:21PM +0200, Bartosz Golaszewski wrote:
> 
> I agree that the C code should not crash - so it makes sense to not
> assign self->chip with GIL released. But for thread-safety in general
> - I don't think the module should care about it. Just like C and C++
> libs leave it to the user. The only thing we should care about is not
> keeping any global state that could cause problems in multithreaded
> apps.
> 

Yeah, agreed - no locking or thread safety guarantees - we don't want to
add the overhead of locking, and the user can provide their own locking
wrapper if they need it, probably at request scope.
As long we we don't go messing with Python objects outside the GIL, or
sharing state between requests (and we don't) then we should be fine.

Sorry for the confusion there on my part - I think I was flipping back
and forth between Python and Rust and carried some of my Rust Sync
concerns over to the Python.

Cheers,
Kent.
