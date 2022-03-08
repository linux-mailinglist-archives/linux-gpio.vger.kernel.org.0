Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D341C4D1480
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Mar 2022 11:14:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345215AbiCHKO7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Mar 2022 05:14:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234202AbiCHKO6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2022 05:14:58 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9C793B2B5
        for <linux-gpio@vger.kernel.org>; Tue,  8 Mar 2022 02:13:57 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id fs4-20020a17090af28400b001bf5624c0aaso2006466pjb.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Mar 2022 02:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tUNbO5YgmY52LNHWE0vX7/haTYwbBBWkNxjB05RNkF4=;
        b=EnCNHAXMiBHlJQmcmPQJp23hI2NCSGSmwqqqMZmUyqeBz67sYzX5Waf35n8845XgEw
         yaJbgZzzYdqMSuSirj1jS8fCQK1g0W/ZMPXtyIteEHYC9ywfE3i/Vfk9RReFZ15/eK+4
         POCk/CjKHFaGYlfEW76cYSDeZTHLcmbQBAKB1MRCDaYLRPg2ULAcDng4Pl7QEWkDcqJI
         9SrFS9L/sEKnzQkjMGE0oAgbkwCSr+4wn5AZgFnRCz7DkxNenHHK9XeL4HG2LejO1u1Q
         HDk32HD6ju0s+LVRxtevTcfzTD1ddAp9Bd/8bJeJshCI4oszwnjvhlMmoa9qkuKpFWSR
         0mkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tUNbO5YgmY52LNHWE0vX7/haTYwbBBWkNxjB05RNkF4=;
        b=HRS1Cb0dZZndqDFIa8Za8o3sR9Dw3L9xX/aSgvDej8lPoj/IDdXmULOEV3phjp4soY
         F2f3In1dAsiZQRuUzSHikbWQ/zDLTbqyOc6a50DqMM+y9RSUgDqYhwfhnfN/RJVCQ7Ol
         ubSFL8YPMtUxnia51GDQMmN23mqm/c9zRog2BUzjjkS60EiswVLCWOcN2dI1cOYGwE7n
         d3PPaOkSKVgz6y5ohpaTY/oH7Ysg1tmzxf5j4e8kzea3q3s5bFw1AYUQqKl0pBSP4SNe
         uqxSmCHE7s+NqyzRlEfZTydf6CCehFuuk3xJP3gmBxgalHpT24520QN0ZoRJJuVesY7r
         F+gQ==
X-Gm-Message-State: AOAM530fnVsbYH/uvvM4Le4UqKmzF6cM1Y8xU4eI6/+X2nnui0H13YE8
        pZ8mp0g7OX3Q52E1TL7O++W7UbgI95MsHQ==
X-Google-Smtp-Source: ABdhPJwzfKuAeEgDcy2K9uiWXFZfAoOWCcselvNRTDABucMTIo0myMHDFs2f49EonOap1s2Bk1UtAw==
X-Received: by 2002:a17:902:b597:b0:14f:3396:a7a5 with SMTP id a23-20020a170902b59700b0014f3396a7a5mr16657605pls.29.1646734437041;
        Tue, 08 Mar 2022 02:13:57 -0800 (PST)
Received: from sol (60-242-155-106.static.tpgi.com.au. [60.242.155.106])
        by smtp.gmail.com with ESMTPSA id a22-20020a056a000c9600b004f10137a096sm20298577pfv.50.2022.03.08.02.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 02:13:56 -0800 (PST)
Date:   Tue, 8 Mar 2022 18:13:51 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v4 0/2] libgpiod v2: rewrite tests for the C
 library
Message-ID: <20220308101351.GA59118@sol>
References: <20220307113401.224584-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220307113401.224584-1-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 07, 2022 at 12:33:59PM +0100, Bartosz Golaszewski wrote:
> v1 -> v2:
> - drop applied patches
> - improve documentation
> - skip offsets that are overridden in line_config but not actually requested
> 
> v2 -> v3:
> - add a patch adding an enum for line values
> - rework the mechanism for retrieving overrides
> - add new "constructors" for line_config
> - incorporate part of Kent's points in the documentation
> - a bunch of improvements to tests as per Kent's reviews
> 
> v3 -> v4:
> - drop the new constructors added in v3
> - improve the docs for override interfaces
> - use NUM_OVERRIDES_MAX when referring to the max number of overrides
> 

Series looks goods to me.

Reviewed-by: Kent Gibson <warthog618@gmail.com>

Cheers,
Kent.

> Bartosz Golaszewski (2):
>   line-config: expose the override logic to users
>   tests: rewrite core C tests using libgpiosim
> 
>  configure.ac                 |    8 +-
>  include/gpiod.h              |  573 ++++++++++++------
>  lib/line-config.c            |  808 ++++++++++++++++---------
>  tests/Makefile.am            |   22 +-
>  tests/gpiod-test-helpers.c   |   49 ++
>  tests/gpiod-test-helpers.h   |  139 +++++
>  tests/gpiod-test-sim.c       |  308 ++++++++++
>  tests/gpiod-test-sim.h       |   42 ++
>  tests/gpiod-test.c           |  233 +-------
>  tests/gpiod-test.h           |   83 +--
>  tests/gpiosim/gpiosim.c      |    1 +
>  tests/mockup/Makefile.am     |   11 -
>  tests/mockup/gpio-mockup.c   |  496 ----------------
>  tests/mockup/gpio-mockup.h   |   36 --
>  tests/tests-chip.c           |  282 ++++-----
>  tests/tests-edge-event.c     |  490 +++++++++++++++
>  tests/tests-event.c          |  908 ----------------------------
>  tests/tests-info-event.c     |  301 ++++++++++
>  tests/tests-line-config.c    |  457 ++++++++++++++
>  tests/tests-line-info.c      |  318 ++++++++++
>  tests/tests-line-request.c   |  526 ++++++++++++++++
>  tests/tests-line.c           | 1091 ----------------------------------
>  tests/tests-misc.c           |   80 ++-
>  tests/tests-request-config.c |   90 +++
>  tools/gpioget.c              |    6 +-
>  tools/gpiomon.c              |    6 +-
>  tools/gpioset.c              |    9 +-
>  27 files changed, 3878 insertions(+), 3495 deletions(-)
>  create mode 100644 tests/gpiod-test-helpers.c
>  create mode 100644 tests/gpiod-test-helpers.h
>  create mode 100644 tests/gpiod-test-sim.c
>  create mode 100644 tests/gpiod-test-sim.h
>  delete mode 100644 tests/mockup/Makefile.am
>  delete mode 100644 tests/mockup/gpio-mockup.c
>  delete mode 100644 tests/mockup/gpio-mockup.h
>  create mode 100644 tests/tests-edge-event.c
>  delete mode 100644 tests/tests-event.c
>  create mode 100644 tests/tests-info-event.c
>  create mode 100644 tests/tests-line-config.c
>  create mode 100644 tests/tests-line-info.c
>  create mode 100644 tests/tests-line-request.c
>  delete mode 100644 tests/tests-line.c
>  create mode 100644 tests/tests-request-config.c
> 
> -- 
> 2.30.1
> 
