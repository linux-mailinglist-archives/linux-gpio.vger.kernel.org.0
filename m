Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47834484652
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jan 2022 17:59:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235599AbiADQ7Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jan 2022 11:59:24 -0500
Received: from mga11.intel.com ([192.55.52.93]:63055 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234144AbiADQ7X (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 4 Jan 2022 11:59:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641315563; x=1672851563;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+mWYmrxAfaLpcJKO/M8Je5p5ckacGBATlNl1RQUUuFc=;
  b=Omr9KZgViQb77fF6nSA3pz73MS/4b5szsK8YiEJauaQFqZ+HntBHgCYy
   RRWGxlSj7no6Vq1Krbidl+PVfrP07HQChSqd3zHihCT0S1qUFdyFsNI5a
   P/s9cFSTRmPGXX/4PydyNljbKZtojSAXYNqA1yk3JloWOhJ8OjRevKW2I
   pBkPATRIdBLl4QWV/YZRIR2GxhXx36E+bUXMF3B/QEP1Vd4Gb5PWrWBx7
   4BVNGA+tFbdzrdwnRn0wv1o4hv6ydEHrAeC1PK5urXdSjACfZ0S7Nhu3L
   XssLzups4NqQm7tfKf/F9m8sozffk1rovSNdOjJno7Qcgla0u1E5O1QaW
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="239798596"
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; 
   d="scan'208";a="239798596"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2022 08:59:23 -0800
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; 
   d="scan'208";a="556219881"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2022 08:59:20 -0800
Received: by lahna (sSMTP sendmail emulation); Tue, 04 Jan 2022 18:57:07 +0200
Date:   Tue, 4 Jan 2022 18:57:07 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH] pinctrl: cherryview: Trigger hwirq0 for interrupt-lines
 without a mapping
Message-ID: <YdR8Y8U3xxBQRPHq@lahna>
References: <20220104164238.253142-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220104164238.253142-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 04, 2022 at 05:42:38PM +0100, Hans de Goede wrote:
> Commit bdfbef2d29dc ("pinctrl: cherryview: Don't use selection 0 to mark
> an interrupt line as unused") made the code properly differentiate
> between unset vs (hwirq) 0 entries in the GPIO-controller interrupt-line
> to GPIO pinnumber/hwirq mapping.
> 
> This is causing some boards to not boot. This commit restores the old
> behavior of triggering hwirq 0 when receiving an interrupt on an
> interrupt-line for which there is no mapping.
> 
> Fixes: bdfbef2d29dc ("pinctrl: cherryview: Don't use selection 0 to mark an interrupt line as unused")
> Reported-and-tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
