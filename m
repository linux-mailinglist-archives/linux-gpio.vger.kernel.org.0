Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35C9B642595
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Dec 2022 10:18:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbiLEJS0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Dec 2022 04:18:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbiLEJSZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Dec 2022 04:18:25 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3C521260E;
        Mon,  5 Dec 2022 01:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670231903; x=1701767903;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=id2QpeunLoL/GwF3eD1EcwAHBc8SwBuv+Uk51QZf5tQ=;
  b=Jwiu3kuVdDGxYES3CzUNkTaPcTwi3myl71yK1yvb7G8DwzPIcrYX76k/
   LGxAKuSKEXXiVi1O4X1oDGTg299jt3fAPi5uLcVrXaLMKemM97eZwmXcg
   NNA/ilzYDd2f9afDj2BEQuS9EMAGi24u1nKR03T2aFDXmCqea5Q6s0TO0
   73/q1TyPXmkLpLIf+gIDgrV5NCxy5i8s+191nGobd7DtRuA5xYXwft/07
   FhNkUxyQAyhW7z+4G9mAkrhspkKui2ER+nys8AKT6IkAs9g4vYRGem2hf
   sPzbm72pHHzQhE8depsbZbmmA/fR4Ej+w9aDuaAoRLHXJErFhDKQHJcO8
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="296659661"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; 
   d="scan'208";a="296659661"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2022 01:18:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="714330536"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; 
   d="scan'208";a="714330536"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2022 01:18:21 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id AA3102033F;
        Mon,  5 Dec 2022 11:18:18 +0200 (EET)
Date:   Mon, 5 Dec 2022 09:18:18 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 0/5] gpio/media/int3472: Add support for tps68470
 privacy-LED output
Message-ID: <Y423WoW/QksbCwIK@paasikivi.fi.intel.com>
References: <20221128214408.165726-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221128214408.165726-1-hdegoede@redhat.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Hans,

On Mon, Nov 28, 2022 at 10:44:03PM +0100, Hans de Goede wrote:
> Hi All,
> 
> While working on the earlier discussed changes for dealing with
> the privacy LED for "discrete" INT3472 ACPI devices I was wondering
> "how are we dealing with the privacy LED when the INT3472 ACPI device
> is a tps68470?".
> 
> Well it turns out we were not dealing with this at all, leading to
> the privacy LED on the back of the Surface Go series not lighting up
> when the back camera is on.

The tps68470 on ACPI was originally only supported via the OP region
interface and on all of those systems the privacy LED was hard wired. So
the LED outputs were not supported. Thanks for adding them.

> 
> This series fixes this, it consists of:
> 
> Patches 1-2: 2 small bugfixes to the gpio-tps68470 code
> Patch3:      Add support for the indicator LED outputs on the tps68470 as GPIOs
> Patch4:      Add support for a privacy LED to the ov8865 sensor driver
> Patch5:      Add gpio-lookup table entry for the privacy LED.
> 
> There is one small issue here, I believe that patches 1-3 need to land before
> 4 + 5 do. Once 4 + 5 have landed the ov8865 driver will try to get a
> GPIO with pin number 10 from the gpio-tps68470 provider and without patch 3,
> that will fail because only pins 0-9 exist until patch 3 lands.
> 
> The easiest way to avoid this issue would be for me to merge patches 1-3 +
> 5 through the pdx86 tree. GPIO subsystem maintainers, may I have your ack
> for this ?
> 
> Note patch 4 is not a problem without patch 5, it uses gpiod_get_optional,
> so as long as there is no lookup entry for a "privacy-led" GPIO it is
> a no-op.

For the patches:

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Although I'd still like to see another, better scaling solution for
controlling privacy LEDs.

-- 
Kind regards,

Sakari Ailus
