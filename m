Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB2B33BA1D6
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jul 2021 16:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232868AbhGBODw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jul 2021 10:03:52 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:37518 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232777AbhGBODw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 2 Jul 2021 10:03:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=hyc3HElTo8Dk1b2Uszvnf79x5YRfYasl205RediPjfE=; b=fbs+Yk7tsec92vwE4ZLLcMLaZU
        yL1rBoQTEHbu6FQjzTUrBbU0TGw2l2tdzbwbmreAmwvYXILepf9tN5zsg9yCLvHnHYtlkfGHSspoO
        ffQv1Yc7uXuJ76NFkaLUcmM1zhcli7QCBovhipBsck4cJWiH/aor2+gTCpJfekYFGtd8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1lzJjK-00BvNH-FS; Fri, 02 Jul 2021 16:01:18 +0200
Date:   Fri, 2 Jul 2021 16:01:18 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/7] mfd: tqmx86: add support for TQMx110EB and
 TQMxE40x
Message-ID: <YN8cLgyLfJ+lENkc@lunn.ch>
References: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
 <e6906971cd78dde5862e01acab5a8c07cee0a0e3.1625227382.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6906971cd78dde5862e01acab5a8c07cee0a0e3.1625227382.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 02, 2021 at 02:23:51PM +0200, Matthias Schiffer wrote:
> Add the board IDs for the TQMx110EB and the TQMxE40x family. All use a
> 24MHz LPC clock.
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
