Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB022D185D
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 19:19:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbgLGSSq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 13:18:46 -0500
Received: from mga04.intel.com ([192.55.52.120]:54445 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725823AbgLGSSq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 7 Dec 2020 13:18:46 -0500
IronPort-SDR: gNWvaWZiL0Cl/3cWx9/joGU1iBpunwL03/vrNO15VEqfFaOeqjpknG6RA+aPPouy3BaM/cjbVA
 UwHSd4PsxCNQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="171175516"
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; 
   d="scan'208";a="171175516"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 10:17:01 -0800
IronPort-SDR: N5mDmen/M3aDzhOt6xnrZT4rS1oMtn0OsSfSC6OqWexJe2yMevtGX6dsziw3qYqG8UB3+yjpBo
 ryUo1IzI/2/A==
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; 
   d="scan'208";a="363251574"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 10:16:58 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 07 Dec 2020 20:16:56 +0200
Date:   Mon, 7 Dec 2020 20:16:56 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v1] pinctrl: intel: Actually disable Tx and Rx buffers on
 GPIO request
Message-ID: <20201207181656.GZ5246@lahna.fi.intel.com>
References: <20201207175940.10631-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201207175940.10631-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 07, 2020 at 07:59:40PM +0200, Andy Shevchenko wrote:
> Mistakenly the buffers (input and output) become together enabled for a little
> period of time during GPIO request. This is problematic, because instead of
> initial motive to disable them in the commit af7e3eeb84e2
> ("pinctrl: intel: Disable input and output buffer when switching to GPIO"),
> the driven value on the pin, which might be used as an IRQ line, brings
> firmware of some touch pads in an awkward state that needs a full power off
> to recover. Fix this by, as stated in a culprit commit, disabling the buffers.
> 
> Fixes: af7e3eeb84e2 ("pinctrl: intel: Disable input and output buffer when switching to GPIO")
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=210497
> Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
