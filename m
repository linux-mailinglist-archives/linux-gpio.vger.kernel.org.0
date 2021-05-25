Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA3E38FF59
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 12:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231710AbhEYKiZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 06:38:25 -0400
Received: from mga17.intel.com ([192.55.52.151]:2408 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229968AbhEYKiL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 May 2021 06:38:11 -0400
IronPort-SDR: 4fA2Smulv/fQVP5uvenVr7WsKdGticPTsbvbDYypkuyy2Ugsb4J4P2VvR654aKxd7Ksd5ZFdW3
 NPY+wBsObZFA==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="182482851"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; 
   d="scan'208";a="182482851"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2021 03:35:44 -0700
IronPort-SDR: Cs7Me65nQ2SF/KMcgmEQ8IbqZTUudMhFlRIeydjmfBpKgtkmK0rC/5TgW6lUBpKw+q2DvLSrVh
 oOrsroRFL2Ag==
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; 
   d="scan'208";a="546718854"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2021 03:35:41 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 25 May 2021 13:35:38 +0300
Date:   Tue, 25 May 2021 13:35:38 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: tigerlake: Add Alder Lake-M ACPI ID
Message-ID: <20210525103538.GR291593@lahna.fi.intel.com>
References: <20210525085050.34713-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210525085050.34713-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 25, 2021 at 11:50:50AM +0300, Andy Shevchenko wrote:
> Intel Alder Lake-M PCH has the same GPIO hardware than Tiger Lake-LP
> PCH but the ACPI ID is different. Add this new ACPI ID to the list of
> supported devices.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
