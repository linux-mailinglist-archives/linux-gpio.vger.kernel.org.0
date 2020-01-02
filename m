Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1A0812E42C
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2020 10:04:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727862AbgABJEt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Jan 2020 04:04:49 -0500
Received: from mga06.intel.com ([134.134.136.31]:6078 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727842AbgABJEt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 2 Jan 2020 04:04:49 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Jan 2020 01:04:49 -0800
X-IronPort-AV: E=Sophos;i="5.69,386,1571727600"; 
   d="scan'208";a="214098037"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Jan 2020 01:04:45 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        Lee Jones <lee.jones@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list\:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list\:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v2 1/5] pinctrl: Allow modules to use pinctrl_[un]register_mappings
In-Reply-To: <CACRpkdaXFSJVkWJGzsVcvbUA9gpgP0Vbkwf1H-HWw8s35R9XYQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191216205122.1850923-1-hdegoede@redhat.com> <20191216205122.1850923-2-hdegoede@redhat.com> <CACRpkdaXFSJVkWJGzsVcvbUA9gpgP0Vbkwf1H-HWw8s35R9XYQ@mail.gmail.com>
Date:   Thu, 02 Jan 2020 11:04:43 +0200
Message-ID: <875zhuut3o.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 30 Dec 2019, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, Dec 16, 2019 at 9:51 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
>> Currently only the drivers/pinctrl/devicetree.c code allows registering
>> pinctrl-mappings which may later be unregistered, all other mappings
>> are assumed to be permanent.
>>
>> Non-dt platforms may also want to register pinctrl mappings from code which
>> is build as a module, which requires being able to unregister the mapping
>> when the module is unloaded to avoid dangling pointers.
>>
>> To allow unregistering the mappings the devicetree code uses 2 internal
>> functions: pinctrl_register_map and pinctrl_unregister_map.
>>
>> pinctrl_register_map allows the devicetree code to tell the core to
>> not memdup the mappings as it retains ownership of them and
>> pinctrl_unregister_map does the unregistering, note this only works
>> when the mappings where not memdupped.
>>
>> The only code relying on the memdup/shallow-copy done by
>> pinctrl_register_mappings is arch/arm/mach-u300/core.c this commit
>> replaces the __initdata with const, so that the shallow-copy is no
>> longer necessary.
>>
>> After that we can get rid of the internal pinctrl_unregister_map function
>> and just use pinctrl_register_mappings directly everywhere.
>>
>> This commit also renames pinctrl_unregister_map to
>> pinctrl_unregister_mappings so that its naming matches its
>> pinctrl_register_mappings counter-part and exports it.
>>
>> Together these 2 changes will allow non-dt platform code to
>> register pinctrl-mappings from modules without breaking things on
>> module unload (as they can now unregister the mapping on unload).
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>
> This v2 works fine for me, I applied it to this immutable branch in the
> pinctrl tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=ib-pinctrl-unreg-mappings
>
> And pulled that into the pinctrl "devel" branch for v5.6.
>
> Please pull this immutable branch into the Intel DRM tree and apply
> the rest of the stuff on top!

Thanks, pulled to drm-intel-next-queued.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
