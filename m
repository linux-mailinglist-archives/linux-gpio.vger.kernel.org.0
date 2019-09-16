Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54018B3E62
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2019 18:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389557AbfIPQFX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Sep 2019 12:05:23 -0400
Received: from mga12.intel.com ([192.55.52.136]:38885 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728709AbfIPQFW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Sep 2019 12:05:22 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Sep 2019 09:05:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,513,1559545200"; 
   d="scan'208";a="201621679"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 16 Sep 2019 09:05:19 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 16 Sep 2019 19:05:18 +0300
Date:   Mon, 16 Sep 2019 19:05:18 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Federico Ricchiuto <fed.ricchiuto@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: intel: Allocate IRQ chip dynamic
Message-ID: <20190916160518.GE28281@lahna.fi.intel.com>
References: <20190916154749.GD28281@lahna.fi.intel.com>
 <660ECFA3-BF3C-4AC2-AF76-7AA7200CD96D@getmailspring.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <660ECFA3-BF3C-4AC2-AF76-7AA7200CD96D@getmailspring.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 16, 2019 at 05:56:55PM +0200, Federico Ricchiuto wrote:
>    Okay.. I've just checked the repository, even on "fixes" branch but I
>    see that the last change was 7 days ago, am I looking in the wrong
>    place?

I mean I will apply the patch there once you have verified that it fixes
the issue :)

If you want to try the patch out, one way is to save it to a file using
your mail client and then run "git am" against the resulting file. Then
rebuild, intall, reboot and see if the warning still persists.
