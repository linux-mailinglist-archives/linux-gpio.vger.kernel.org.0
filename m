Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A75CE29EBCB
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 13:25:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725832AbgJ2MZH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 08:25:07 -0400
Received: from mga05.intel.com ([192.55.52.43]:47301 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726495AbgJ2MZG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Oct 2020 08:25:06 -0400
IronPort-SDR: Jv4L0JP8qvD67hEd+RSyU2o2EHfW36DcT5ndar5DiubXaGqSOYzIwYsGOhFzNJ5Nm1q8yoaL9F
 9l6FmFwLCjIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="253129162"
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; 
   d="scan'208";a="253129162"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 05:25:04 -0700
IronPort-SDR: a7Tv429/vIUhkWHRhiooXn034w9LkKzLe6W50XO89fKT0I11GjHfIkMiCPcW/RNrTn+lYQf2Zy
 eOSJCMB1GmWw==
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; 
   d="scan'208";a="350948467"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 05:25:02 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1kY70H-001Et7-CN; Thu, 29 Oct 2020 14:26:05 +0200
Date:   Tue, 27 Oct 2020 15:58:09 +0200
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
Message-ID: <20201027135809.GE4077@smile.fi.intel.com>
References: <20201027121725.24660-1-brgl@bgdev.pl>
 <20201027121725.24660-5-brgl@bgdev.pl>
 <20201027132911.GX4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201027132911.GX4077@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 27, 2020 at 03:29:11PM +0200, Andy Shevchenko wrote:
> On Tue, Oct 27, 2020 at 01:17:21PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > 
> > Use the helper that checks for overflows internally instead of manually
> > calculating the size of the new array.

After addressing a nit in previous message:
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


