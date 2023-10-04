Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 560E17B7FD4
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Oct 2023 14:53:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233146AbjJDMxV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Oct 2023 08:53:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233133AbjJDMxV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Oct 2023 08:53:21 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 257FE98;
        Wed,  4 Oct 2023 05:53:18 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="362516584"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="362516584"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 05:53:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="867359206"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="867359206"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 05:53:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC1)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1qo1NJ-00000002m5B-1xWd;
        Wed, 04 Oct 2023 15:53:13 +0300
Date:   Wed, 4 Oct 2023 15:53:12 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 34/36] treewide: rename pinctrl_gpio_direction_input_new()
Message-ID: <ZR1gOKF/laH05Clc@smile.fi.intel.com>
References: <20231003145114.21637-1-brgl@bgdev.pl>
 <20231003145114.21637-35-brgl@bgdev.pl>
 <CAHp75VexazbYskr2pxOPzZe8q=o4ZCHnhcN6U1XX=Th8sxXCgQ@mail.gmail.com>
 <CAMRc=Mf9O0MKHKM0v3tongx+Aj3wxUaDcvSdNC+FZdXD3C_P0A@mail.gmail.com>
 <ZR1fb/nwg58AZ0y9@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZR1fb/nwg58AZ0y9@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 04, 2023 at 03:49:52PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 03, 2023 at 09:08:41PM +0200, Bartosz Golaszewski wrote:
> > On Tue, Oct 3, 2023 at 5:16 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Tue, Oct 3, 2023 at 5:51 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > >
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > Now that pinctrl_gpio_direction_input() is no longer used, let's drop the
> > > > '_new' suffix from its improved variant.
> > >
> > > This and other "treewide" patches in the series are redundant. Just
> > > name the functions better to begin with.
> > 
> > I don't want to rename these functions. They have perfectly fine
> > names. I want to change their signatures and the renaming part is
> > there only to make the reviewing easier.
> 
> So, then you can make them macros and based on the type of the first argument
> use either old or new API, which you then make public. The all noise with
> "_new" is not needed, really.

To elaborate:

First patch splits existing functions to the macros that use _Generic(), and
old ones become renamed only on the implementation side (to _old or whatever).
Then you add a new ones and apply them to these macros as a second (default?)
choice. Then you convert users one-by-one or whatever preference is, and at
the end you kill macros with old functions and rename "_new" again in a single
place (pinctrl core).


-- 
With Best Regards,
Andy Shevchenko


