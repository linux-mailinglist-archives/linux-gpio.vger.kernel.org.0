Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8AC816432F
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2020 12:19:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgBSLTo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 06:19:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:60890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726514AbgBSLTn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 Feb 2020 06:19:43 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 28B97206E2;
        Wed, 19 Feb 2020 11:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582111183;
        bh=BwgSD1a186ReLRbRpljqkbL5xbN/xb62IKOX5waLZ3U=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DtGnndcmPB5eBW9AOBpUytkTAaLSpoU88u6KVZS6XNDAOBWhHwzPa2+Yd3gwdop9J
         XNvJgwMBfFFWGu9XDvoyVbpApAltto5Xq31N289qcRTU2cZWKUV9mPH/8tDpmAKCMH
         ERqmxUf1atqq4K7mZtC0xLZO8+Xbl/eGBMRHM8Ko=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1j4NOH-006URF-9N; Wed, 19 Feb 2020 11:19:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 19 Feb 2020 11:19:41 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Alexandre Torgue <alexandre.torgue@st.com>
Cc:     Marek Vasut <marex@denx.de>, Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel-owner@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: stm32: Add level interrupt support to gpio
 irq chip
In-Reply-To: <dd6434a7-aff1-94ec-2fdf-51374c695ada@st.com>
References: <20200210134901.1939-1-alexandre.torgue@st.com>
 <20200210134901.1939-3-alexandre.torgue@st.com>
 <377b0895-aaeb-b12e-cad7-469332787b4e@denx.de>
 <dd6434a7-aff1-94ec-2fdf-51374c695ada@st.com>
Message-ID: <b7965be80f0e5fe32599f188ae8b231d@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.10
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: alexandre.torgue@st.com, marex@denx.de, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel-owner@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020-02-11 10:08, Alexandre Torgue wrote:

[...]

> Yes. It'll be fixed in v2.

And when you do that, please use my official email address (my @arm.com
address goes to my ex manager, and I don't think he cares much about 
this).

         M.
-- 
Jazz is not dead. It just smells funny...
