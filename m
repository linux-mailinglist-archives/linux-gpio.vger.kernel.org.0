Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EDFC1F558C
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 15:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729214AbgFJNQI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 09:16:08 -0400
Received: from mga17.intel.com ([192.55.52.151]:11749 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728864AbgFJNQI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Jun 2020 09:16:08 -0400
IronPort-SDR: DbMR044gB8koAXsqTtUpn0hJd9UpkKyA6mCcaI7jSGruQlL3STtk1qtbuNDSVTkaacduxH1cDx
 Aa57e5xQCTlg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2020 06:16:07 -0700
IronPort-SDR: AeqpV0etQiCb8rcjohFjUxdUU9sPUPv23G4lVaQMFUUg8BIYBkXNVYgwHlBZM3D0W3tnxiX/GU
 gR1rHpNAoAkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,496,1583222400"; 
   d="scan'208";a="380058827"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 10 Jun 2020 06:16:05 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 10 Jun 2020 16:16:05 +0300
Date:   Wed, 10 Jun 2020 16:16:05 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 1/6] pinctrl: cherryview: Introduce chv_readl() helper
Message-ID: <20200610131605.GN247495@lahna.fi.intel.com>
References: <20200609182449.45813-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200609182449.45813-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 09, 2020 at 09:24:44PM +0300, Andy Shevchenko wrote:
> There are plenty of places where we call
> 	readl(chv_padreg(pctrl, offset, ...));
> 
> Replace them with newly introduced chv_readl() helper
> 	chv_readl(pctrl, offset, ...);
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

For patches 1-6,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
