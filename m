Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABEE23A3E07
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jun 2021 10:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231233AbhFKIdF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Jun 2021 04:33:05 -0400
Received: from mga14.intel.com ([192.55.52.115]:19823 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231283AbhFKIdE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 11 Jun 2021 04:33:04 -0400
IronPort-SDR: zHoktfLbN9oz2PnOOsehz897CaCkM/USJ9lNWT2vBNvVOnUIORxr3oK6At2J+wvRM3/8nSsT/s
 bpK8/g9n7NSA==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="205304038"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="205304038"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2021 01:31:05 -0700
IronPort-SDR: 9gg2xpc238vmKvAFtO0z9rs2WaRKb5Ccanxu4lY4sQSQlj1emOL6UxPXR+DQDZxX647RlbqRQo
 NkU61bZW3Vjw==
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="477636156"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2021 01:31:01 -0700
Received: by lahna (sSMTP sendmail emulation); Fri, 11 Jun 2021 11:30:59 +0300
Date:   Fri, 11 Jun 2021 11:30:59 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Henning Schild <henning.schild@siemens.com>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: Check against matching data
 instead of ACPI companion
Message-ID: <YMMfQyZ/SjB6aNOj@lahna>
References: <20210610152823.1653-1-andriy.shevchenko@linux.intel.com>
 <YMMWU1ZMqGoCKOoj@lahna>
 <CAHp75Vf6J8kD9-_ComWeyGks9t507ETPtfQYYLPZikciAir-0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vf6J8kD9-_ComWeyGks9t507ETPtfQYYLPZikciAir-0w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 11, 2021 at 11:16:23AM +0300, Andy Shevchenko wrote:
> On Fri, Jun 11, 2021 at 10:53 AM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
> > On Thu, Jun 10, 2021 at 06:28:23PM +0300, Andy Shevchenko wrote:
> > > In some cases we may get a platform device that has ACPI companion
> > > which is different to the pin control described in the ACPI tables.
> > > This is primarily happens when device is instantiated by board file.
> >
> > Can you point which board file in the mainline kernel has this issue? If
> > not then I don't think it makes sense to add code like this.
> 
> To my knowledge we don't have such enumeration in the upstream (but it
> may be done by third parties against any of our controllers enumerated
> by UID, like Broxton or Gemini Lake).

So let's add it when we have such thing in the mainline.

For the rest Intel drivers we always supply the SoC information so this
is not a problem.
