Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33E012EEDAA
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 08:01:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbhAHHAp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 02:00:45 -0500
Received: from mga06.intel.com ([134.134.136.31]:33156 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726353AbhAHHAp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 8 Jan 2021 02:00:45 -0500
IronPort-SDR: ZaZELB/2ReKRkb/V5WCbMPHGRHpuzOu5OWBW50sr1ILk2tMDGrLIDmvfFtrntxM1QCieY/RZhe
 +T2nfu2U0M5g==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="239104736"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="239104736"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 22:58:59 -0800
IronPort-SDR: ibRKqGiVlKKNg1hf1/oFe/omWCAoQFqYRIuDSTXgtx5s1Z7l41ZVN0HOpL8pM6RV1OAYywl2sS
 pEBl8oZU609A==
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="380021991"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 22:58:57 -0800
Received: by lahna (sSMTP sendmail emulation); Fri, 08 Jan 2021 08:58:55 +0200
Date:   Fri, 8 Jan 2021 08:58:55 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: tigerlake: Add Alder Lake-P ACPI ID
Message-ID: <20210108065855.GV968855@lahna.fi.intel.com>
References: <20210107185406.40415-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210107185406.40415-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 07, 2021 at 08:54:06PM +0200, Andy Shevchenko wrote:
> Intel Alder Lake-P PCH has the same GPIO hardware than Tiger Lake-LP
> PCH but the ACPI ID is different. Add this new ACPI ID to the list of
> supported devices.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
