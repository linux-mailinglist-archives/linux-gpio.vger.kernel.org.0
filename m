Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E113415075C
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2020 14:36:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbgBCNg3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Feb 2020 08:36:29 -0500
Received: from mga12.intel.com ([192.55.52.136]:26128 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726082AbgBCNg2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 3 Feb 2020 08:36:28 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Feb 2020 05:36:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; 
   d="scan'208";a="278740404"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Feb 2020 05:36:27 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1iybts-0007Kf-VT; Mon, 03 Feb 2020 15:36:28 +0200
Date:   Mon, 3 Feb 2020 15:36:28 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     sachin agarwal <asachin591@gmail.com>
Cc:     linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, andy@kernel.org
Subject: Re: [PATCH 5/6] gpio: ich: fixed a typo
Message-ID: <20200203133628.GD32742@smile.fi.intel.com>
References: <20200203125255.84705-1-sachinagarwal@sachins-MacBook-2.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200203125255.84705-1-sachinagarwal@sachins-MacBook-2.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 03, 2020 at 06:22:55PM +0530, sachin agarwal wrote:
> From: sachin agarwal <asachin591@gmail.com>
> 
> we had written "Mangagment" rather than "Management".

we -> We.

No need to send new version right now, consider to send v2 after merge window
closed (starting from next week).

-- 
With Best Regards,
Andy Shevchenko


