Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E8EF12054E
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 13:18:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727486AbfLPMSp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 07:18:45 -0500
Received: from mga02.intel.com ([134.134.136.20]:45921 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727481AbfLPMSp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Dec 2019 07:18:45 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Dec 2019 04:18:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,321,1571727600"; 
   d="scan'208";a="266240411"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Dec 2019 04:18:41 -0800
Received: from andy by smile with local (Exim 4.93-RC7)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1igpKi-0006VZ-Up; Mon, 16 Dec 2019 14:18:40 +0200
Date:   Mon, 16 Dec 2019 14:18:40 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Ville =?iso-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>, Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 0/5] drm/i915/dsi: Control panel and backlight enable
 GPIOs from VBT
Message-ID: <20191216121840.GS32742@smile.fi.intel.com>
References: <20191215163810.52356-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191215163810.52356-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Dec 15, 2019 at 05:38:05PM +0100, Hans de Goede wrote:
> Hi All,
> 
> This is a new (completely rewritten) version of my patches to make the
> i915 code control the SoC panel- and backlight-enable GPIOs on Bay Trail
> devices when the VBT indicates that the SoC should be used for backlight
> control. This fixes the panel not lighting up on various devices when
> booted with a HDMI monitor connected, in which case the firmware skips
> initializing the panel as it inits the HDMI instead.
> 
> This series has been tested on; and fixes this issue on; the following models:
> 
> Peaq C1010
> Point of View MOBII TAB-P800W
> Point of View MOBII TAB-P1005W
> Terra Pad 1061
> Thundersoft TST178
> Yours Y8W81
> 
> Linus, this series starts with the already discussed pinctrl change to
> export the function to unregister a pinctrl-map. We can either merge this
> through drm-intel, or you could pick it up and then provide an immutable
> branch with it for merging into drm-intel-next. Which option do you prefer?
> 
> Lee, I know you don't like this, but unfortunately this series introcudes
> some (other) changes to drivers/mfd/intel_soc_pmic_core.c. The GPIO subsys
> allows only one mapping-table per consumer, so in hindsight adding the code
> which adds the mapping for the PMIC panel-enable pin to the PMIC mfd driver
> was a mistake, as the PMIC code is a provider where as mapping-tables are
> per consumer. The 4th patch fixes this by moving the mapping-table to the
> i915 code, so that we can also add mappings for some of the pins on the SoC
> itself. Since this whole series makes change to the i915 code I plan to
> merge this mfd change to the drm-intel tree.

FWIW, Lee, I believe there will be no (significant) changes in the driver Hans
touched. For the record it seems only Hans is touching drivers for old Intel
platforms (such as Baytrail and Cherryview).

-- 
With Best Regards,
Andy Shevchenko


