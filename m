Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8C47230A2
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jun 2023 22:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbjFEUDn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Jun 2023 16:03:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230033AbjFEUDl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Jun 2023 16:03:41 -0400
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 739FE9E
        for <linux-gpio@vger.kernel.org>; Mon,  5 Jun 2023 13:03:38 -0700 (PDT)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
        by fgw21.mail.saunalahti.fi (Halon) with ESMTP
        id 0ce7da20-03dc-11ee-abf4-005056bdd08f;
        Mon, 05 Jun 2023 23:03:34 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Mon, 5 Jun 2023 23:03:33 +0300
To:     joe.slater@windriver.com
Cc:     linux-gpio@vger.kernel.org, randy.macleod@windriver.com
Subject: Re: [v2][libgpiod][PATCH 1/1] gpio-tools-test.bats: modify delays in
 toggle test
Message-ID: <ZH4_lSlcDD6d5ZBa@surfacebook>
References: <20230605190051.3915571-1-joe.slater@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605190051.3915571-1-joe.slater@windriver.com>
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
        SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Mon, Jun 05, 2023 at 12:00:51PM -0700, joe.slater@windriver.com kirjoitti:
> From: Joe Slater <joe.slater@windriver.com>
> 
> The test "gpioset: toggle (continuous)" uses fixed delays to test
> toggling values.  This is not reliable, so we switch to looking
> for transitions from one value to another.
> 
> We wait for a transition up to 1.5 seconds.

...

> +gpiosim_wait_value() {
> +	local OFFSET=$2
> +	local EXPECTED=$3
> +	local DEVNAME=${GPIOSIM_DEV_NAME[$1]}
> +	local CHIPNAME=${GPIOSIM_CHIP_NAME[$1]}
> +	local PORT=$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value
> +
> +	for i in {1..15} ; do

Do you need space before semicolon?

> +		[ "$(<$PORT)" = "$EXPECTED" ] && return
> +		sleep 0.1
> +	done
> +	return 1
> +}

...

> -			for LINE in $(find $BANKPATH/ | grep -E "line[0-9]+$")
> +			for LINE in $(find $BANKPATH/ | egrep "line[0-9]+$")

Seems stray change.

-- 
With Best Regards,
Andy Shevchenko


