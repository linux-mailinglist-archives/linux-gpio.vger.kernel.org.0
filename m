Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77904882FD
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2019 20:52:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726556AbfHISwn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Aug 2019 14:52:43 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:36974 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbfHISwn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Aug 2019 14:52:43 -0400
Received: from penelope.horms.nl (unknown [66.60.152.14])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0465725B7E3;
        Sat, 10 Aug 2019 04:52:41 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id D92D6E21A9A; Fri,  9 Aug 2019 20:52:39 +0200 (CEST)
Date:   Fri, 9 Aug 2019 11:52:39 -0700
From:   Simon Horman <horms@verge.net.au>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linus.walleij@linaro.org, geert+renesas@glider.be,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] pinctrl: sh-pfc: Rollback to mux if requires when
 the gpio is freed
Message-ID: <20190809185239.2e6vfz7wkaqjygoo@verge.net.au>
References: <1565245143-15018-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1565245143-15018-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1565245143-15018-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 08, 2019 at 03:19:03PM +0900, Yoshihiro Shimoda wrote:
> R-Car PWM controller requires the gpio to output zero duty,
> this patch allows to roll it back from gpio to mux when the gpio
> is freed.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

