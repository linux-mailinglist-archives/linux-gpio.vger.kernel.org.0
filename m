Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB4271763D
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2019 12:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbfEHKui (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 May 2019 06:50:38 -0400
Received: from mga18.intel.com ([134.134.136.126]:55293 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726140AbfEHKui (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 8 May 2019 06:50:38 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 May 2019 03:50:38 -0700
X-ExtLoop1: 1
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
  by orsmga007.jf.intel.com with ESMTP; 08 May 2019 03:50:35 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hOK9i-0007k0-UC; Wed, 08 May 2019 13:50:34 +0300
Date:   Wed, 8 May 2019 13:50:34 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     hotwater438@tutanota.com
Cc:     Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hdegoede <hdegoede@redhat.com>,
        Linux Gpio <linux-gpio@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] pinctrl: intel: Clear interrupt status in mask/unmask
 callback
Message-ID: <20190508105034.GF9224@smile.fi.intel.com>
References: <20190430083753.18197-1-kai.heng.feng@canonical.com>
 <20190430164813.GP9224@smile.fi.intel.com>
 <LeL0N_d--3-1@tutanota.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <LeL0N_d--3-1@tutanota.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 08, 2019 at 07:58:26AM +0200, hotwater438@tutanota.com wrote:
> Hello guys, any updates on suspend issue?

Please, do not top-post.

The patch you mentioned is in a queue to be submitted after merge window closes.
Be patient.

-- 
With Best Regards,
Andy Shevchenko


