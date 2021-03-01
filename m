Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C70163280F7
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Mar 2021 15:34:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234914AbhCAOdq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Mar 2021 09:33:46 -0500
Received: from mga03.intel.com ([134.134.136.65]:19020 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234539AbhCAOdN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 1 Mar 2021 09:33:13 -0500
IronPort-SDR: uO2IGYlRc/bEro12TNlENJnVvIgj5296WKeqr6iKbGNPY4C8HqM9Uh/Eyq5uF4UQMsOFJ9Wx0n
 L7oVb73aw6lw==
X-IronPort-AV: E=McAfee;i="6000,8403,9909"; a="186534371"
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; 
   d="scan'208";a="186534371"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 06:32:27 -0800
IronPort-SDR: sA9RXhcZpguchMlxPgLDjvWKyQnRUZykTF3H4euXJkx84yUyq83b8tCbfZDgcJJ8VjLeAeudx9
 ZIGKpfywiptg==
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; 
   d="scan'208";a="397746960"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 06:32:25 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1lGjax-0099yN-FA; Mon, 01 Mar 2021 16:32:23 +0200
Date:   Mon, 1 Mar 2021 16:32:23 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/2] Add ACPI support for SC8180X pinctrl driver
Message-ID: <YDz693ftIEJ+v1OE@smile.fi.intel.com>
References: <20210301014329.30104-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210301014329.30104-1-shawn.guo@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 01, 2021 at 09:43:27AM +0800, Shawn Guo wrote:
> This is a couple of patches that enable ACPI probe for SC8180X pinctrl
> driver.  The msm core driver needs a bit change to handle tiles mapping
> differently between DT and ACPI.

Please, Cc me for this series.

Meanwhile I think we have to understand the numbering scheme used by ACPI
firmware on the machine in question.

-- 
With Best Regards,
Andy Shevchenko


