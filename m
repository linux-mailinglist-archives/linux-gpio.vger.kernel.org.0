Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 025D2465DB9
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Dec 2021 06:21:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345100AbhLBFZH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Dec 2021 00:25:07 -0500
Received: from pi.codeconstruct.com.au ([203.29.241.158]:59940 "EHLO
        codeconstruct.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345061AbhLBFZG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Dec 2021 00:25:06 -0500
Received: from [172.16.68.45] (unknown [49.255.141.98])
        by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C43B420164;
        Thu,  2 Dec 2021 13:21:41 +0800 (AWST)
Message-ID: <06b3258c44f7ce434ec917c53ea4e1967ea75768.camel@codeconstruct.com.au>
Subject: Re: [libgpiod PATCH] gpioget: Add --line-name to lookup GPIO line
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     Joel Stanley <joel@jms.id.au>, linux-gpio@vger.kernel.org
Cc:     Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
        Eddie James <eajames@linux.ibm.com>
Date:   Thu, 02 Dec 2021 13:21:40 +0800
In-Reply-To: <20211201072902.127542-1-joel@jms.id.au>
References: <20211201072902.127542-1-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Joel,

> Systems provide line names to make using GPIOs easier for userspace.
> Use this feature to make the tools user friendly by adding the ability to
> show the state of a named line.
> 
>  $ gpioget --line-name power-chassis-good
>  1
> 
>  $ gpioget -L pcieslot-power
>  0

Awesome!

As someone who has had wasted hours of debugging the wrong GPIO lines
because of incorrect chip/offset calculations, +100 from me.

(or was that +101? I'll have to check the schematic again...)

Cheers,


Jeremy

