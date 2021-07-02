Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42BD03BA1E9
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jul 2021 16:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232741AbhGBOGq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jul 2021 10:06:46 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:37538 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232814AbhGBOGq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 2 Jul 2021 10:06:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=6qMVAgKVd6rGWPP/jnpkpugcgYIRE2cKjTTpe1fq8II=; b=asZG3uZSaV3Gu8goV2ZvJQr7Nc
        jnClDGVaWUlvqMfKt1PsWdpAO1KTizDcqhDBnFqluE5apXoX9EOSEFvUly53o2046ayqfGwyryBw6
        DMXEhBw+z1ITcTJmFeLUHFKdb7n9lVAXYCFZnvo2kIzmkd5FmJVwjgfiAJpNqRDjIpxw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1lzJm7-00BvOF-Iw; Fri, 02 Jul 2021 16:04:11 +0200
Date:   Fri, 2 Jul 2021 16:04:11 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] mfd: tqmx86: assume 24MHz LPC clock for unknown
 boards
Message-ID: <YN8c2zO/hehPocMF@lunn.ch>
References: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
 <384f4c0070fc95e4e688731876178f9299861aa7.1625227382.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <384f4c0070fc95e4e688731876178f9299861aa7.1625227382.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 02, 2021 at 02:23:53PM +0200, Matthias Schiffer wrote:
> All future TQMx86 modules should use a 24MHz LPC clock. Warn about
> unknown boards, but assume this is the case.
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
