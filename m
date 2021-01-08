Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C9402EF36D
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 14:48:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727904AbhAHNs0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 08:48:26 -0500
Received: from mga06.intel.com ([134.134.136.31]:54524 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727450AbhAHNs0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 8 Jan 2021 08:48:26 -0500
IronPort-SDR: 4seF5yqC4uI5T0+hSx5zh//WP8KR+oOYxd9uj1fkIxNDX55cdR7206E8IPB5mo2aTLgZP2Lmoo
 93DOikpT1Sfw==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="239146294"
X-IronPort-AV: E=Sophos;i="5.79,331,1602572400"; 
   d="scan'208";a="239146294"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2021 05:46:39 -0800
IronPort-SDR: cRYwjT31cA8/cUABIyccbsyPlWPsN6SMJF0v6XSx/SAXXKBBT9/yNFE6jKQQvnd7u3YjEgGDE3
 qXEcsdOi9LCQ==
X-IronPort-AV: E=Sophos;i="5.79,331,1602572400"; 
   d="scan'208";a="380126020"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2021 05:46:37 -0800
Received: by lahna (sSMTP sendmail emulation); Fri, 08 Jan 2021 15:46:35 +0200
Date:   Fri, 8 Jan 2021 15:46:35 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/3] pinctrl: intel: Convert capability list to
 features
Message-ID: <20210108134635.GC968855@lahna.fi.intel.com>
References: <20210108134005.30048-1-andriy.shevchenko@linux.intel.com>
 <20210108134005.30048-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108134005.30048-3-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 08, 2021 at 03:40:05PM +0200, Andy Shevchenko wrote:
> Communities can have features provided in the capability list.
> Traverse the list and convert to respective features.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
