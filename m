Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00AF63AEF1
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 08:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387541AbfFJGYF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 02:24:05 -0400
Received: from mail.gnudd.com ([77.43.112.34]:51180 "EHLO mail.gnudd.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387431AbfFJGYE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 Jun 2019 02:24:04 -0400
X-Greylist: delayed 625 seconds by postgrey-1.27 at vger.kernel.org; Mon, 10 Jun 2019 02:24:03 EDT
Received: from mail.gnudd.com (localhost [127.0.0.1])
        by mail.gnudd.com (8.14.4/8.14.4/Debian-4+deb7u1) with ESMTP id x5A6E3xS009710;
        Mon, 10 Jun 2019 08:14:03 +0200
Received: (from rubini@localhost)
        by mail.gnudd.com (8.14.4/8.14.4/Submit) id x5A6E3bM009709;
        Mon, 10 Jun 2019 08:14:03 +0200
Date:   Mon, 10 Jun 2019 08:14:03 +0200
From:   Alessandro Rubini <rubini@gnudd.com>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        federico.vaga@cern.ch, riehecky@fnal.gov
Subject: Re: [PATCH] fmc: Decouple from Linux GPIO subsystem
Message-ID: <20190610061403.GA9702@mail.gnudd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: GnuDD, Device Drivers, Embedded Systems, Courses
In-Reply-To: <20190608231430.22916-1-linus.walleij@linaro.org>
References: <20190608231430.22916-1-linus.walleij@linaro.org> 
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> FMC has its own GPIO handling, the inclusion of <linux/gpio.h>
> is only to reuse some flags that we can just as well provide
> using local defines.
> 
> Cc: Federico Vaga <federico.vaga@cern.ch>
> Cc: Pat Riehecky <riehecky@fnal.gov>
> Cc: Alessandro Rubini <rubini@gnudd.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Alessandro Rubini <rubini@gnudd.com>

