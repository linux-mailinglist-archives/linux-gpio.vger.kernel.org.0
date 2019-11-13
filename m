Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9766FFB173
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 14:37:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727343AbfKMNhi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 08:37:38 -0500
Received: from mga05.intel.com ([192.55.52.43]:61845 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726186AbfKMNhi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 Nov 2019 08:37:38 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Nov 2019 05:37:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,300,1569308400"; 
   d="scan'208";a="229744678"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004.fm.intel.com with ESMTP; 13 Nov 2019 05:37:37 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iUsq0-0003n6-9o; Wed, 13 Nov 2019 15:37:36 +0200
Date:   Wed, 13 Nov 2019 15:37:36 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RESEND][PATCH v2 0/7] gpiolib: fix GPIO <-> pin mapping
 registration
Message-ID: <20191113133736.GG32742@smile.fi.intel.com>
References: <20191105203557.78562-1-andriy.shevchenko@linux.intel.com>
 <20191106173055.GQ32742@smile.fi.intel.com>
 <CACRpkdaAxY-8A7gindeA8fsQ9rEdnwp8k90CyULxNs4J5VBSBw@mail.gmail.com>
 <20191108133942.GH32742@smile.fi.intel.com>
 <CACRpkdZWh7MD+psE9zndg4S59Eq-PRcmgrs-ABUaTGHnm7S4Sw@mail.gmail.com>
 <20191113132822.GF32742@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191113132822.GF32742@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Linus,
okay, first three patches had been send as PR against gpio/for-next for v5.5.

-- 
With Best Regards,
Andy Shevchenko


