Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84B5A29F462
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 20:00:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725747AbgJ2TAS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 15:00:18 -0400
Received: from mga01.intel.com ([192.55.52.88]:38707 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725648AbgJ2TAR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Oct 2020 15:00:17 -0400
IronPort-SDR: feIWC+QJVWzVyyVVqblEl+4neV9J8as5JvRzpgs7RDSFR3vFKOE3byQ/uSWppJmCXNaK8JMDlS
 E6vi0a2pgG1w==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="186285521"
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
   d="scan'208";a="186285521"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 12:00:16 -0700
IronPort-SDR: vYyOwMyWII2nnIDUIc08l8IliMLKBJ603xz01XJ4wF9ile+oI8Rrs6LcTcUNd/cTp7YqSaf8KP
 /Ykq/lp7Cqow==
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
   d="scan'208";a="525623700"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 12:00:13 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1kYDAh-001S76-PX; Thu, 29 Oct 2020 21:01:15 +0200
Date:   Tue, 27 Oct 2020 15:29:11 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-gpio@vger.kernel.org, kvm@vger.kernel.org,
        virtualization@lists.linux-foundation.org, netdev@vger.kernel.org,
        linux-mm@kvack.org, alsa-devel@alsa-project.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 4/8] pinctrl: use krealloc_array()
Message-ID: <20201027132911.GX4077@smile.fi.intel.com>
References: <20201027121725.24660-1-brgl@bgdev.pl>
 <20201027121725.24660-5-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201027121725.24660-5-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 27, 2020 at 01:17:21PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Use the helper that checks for overflows internally instead of manually
> calculating the size of the new array.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/pinctrl/pinctrl-utils.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-utils.c b/drivers/pinctrl/pinctrl-utils.c
> index f2bcbf62c03d..93df0d4c0a24 100644
> --- a/drivers/pinctrl/pinctrl-utils.c
> +++ b/drivers/pinctrl/pinctrl-utils.c
> @@ -39,7 +39,7 @@ int pinctrl_utils_reserve_map(struct pinctrl_dev *pctldev,
>  	if (old_num >= new_num)
>  		return 0;
>  
> -	new_map = krealloc(*map, sizeof(*new_map) * new_num, GFP_KERNEL);
> +	new_map = krealloc_array(*map, new_num, sizeof(*new_map), GFP_KERNEL);
>  	if (!new_map) {
>  		dev_err(pctldev->dev, "krealloc(map) failed\n");

...and here?

>  		return -ENOMEM;
> -- 
> 2.29.1
> 

-- 
With Best Regards,
Andy Shevchenko


