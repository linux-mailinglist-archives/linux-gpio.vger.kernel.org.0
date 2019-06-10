Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 518C73AEF2
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 08:24:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387582AbfFJGYG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 02:24:06 -0400
Received: from mail.gnudd.com ([77.43.112.34]:51180 "EHLO mail.gnudd.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387431AbfFJGYG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 Jun 2019 02:24:06 -0400
X-Greylist: delayed 625 seconds by postgrey-1.27 at vger.kernel.org; Mon, 10 Jun 2019 02:24:03 EDT
Received: from mail.gnudd.com (localhost [127.0.0.1])
        by mail.gnudd.com (8.14.4/8.14.4/Debian-4+deb7u1) with ESMTP id x5A6DQ6T009676;
        Mon, 10 Jun 2019 08:13:26 +0200
Received: (from rubini@localhost)
        by mail.gnudd.com (8.14.4/8.14.4/Submit) id x5A6DPKn009675;
        Mon, 10 Jun 2019 08:13:25 +0200
Date:   Mon, 10 Jun 2019 08:13:25 +0200
From:   Alessandro Rubini <rubini@gnudd.com>
To:     linus.walleij@linaro.org
Cc:     federico.vaga@cern.ch, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, riehecky@fnal.gov
Subject: Re: [PATCH] RFC: fmc: Try to convert to GPIO descriptors
Message-ID: <20190610061325.GA9668@mail.gnudd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: GnuDD, Device Drivers, Embedded Systems, Courses
In-Reply-To: <CACRpkdaCFZcQ8VMjKJkXAm+TRH+=DY3j5Udh0mcYR7YcDr8VtA@mail.gmail.com>
References: <CACRpkdaCFZcQ8VMjKJkXAm+TRH+=DY3j5Udh0mcYR7YcDr8VtA@mail.gmail.com>
  <20190603230604.30938-1-linus.walleij@linaro.org>
 <22282873.PltXLBtAh5@pcbe13614>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> As for the proposal so remove it, I'd like to hear what
> Alessandro says.

I am not involved in the CERN group any more, so I really have no say:
Federico leads, and I agree.

I found the fmc-bus a good idea at the time, and we also talked with
Lars-Peter Clausen of Analog Devices, who was using fmc hardware and
told he would use our framework. We pushed it shortly later, but I
Never heard back.

I don't know if there are other users, besides the various projects
that split off cern open-hardware efforts (e.g., the Zen board by Seven
Solutions). Maybe they could just maintain the thing off-tree.

thanks
/alessandro
