Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6B56103669
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2019 10:14:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727830AbfKTJOE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 04:14:04 -0500
Received: from mx2.suse.de ([195.135.220.15]:36086 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727816AbfKTJOE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Nov 2019 04:14:04 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id E22AEAEC2;
        Wed, 20 Nov 2019 09:14:01 +0000 (UTC)
From:   Andreas Schwab <schwab@suse.de>
To:     Yash Shah <yash.shah@sifive.com>
Cc:     "linus.walleij\@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski\@baylibre.com" <bgolaszewski@baylibre.com>,
        "robh+dt\@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland\@arm.com" <mark.rutland@arm.com>,
        "palmer\@dabbelt.com" <palmer@dabbelt.com>,
        "Paul Walmsley \( Sifive\)" <paul.walmsley@sifive.com>,
        "devicetree\@vger.kernel.org" <devicetree@vger.kernel.org>,
        "aou\@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
        "jason\@lakedaemon.net" <jason@lakedaemon.net>,
        "linux-gpio\@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "maz\@kernel.org" <maz@kernel.org>,
        "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "atish.patra\@wdc.com" <atish.patra@wdc.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        "tglx\@linutronix.de" <tglx@linutronix.de>,
        "bmeng.cn\@gmail.com" <bmeng.cn@gmail.com>,
        "linux-riscv\@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        Sachin Ghadi <sachin.ghadi@sifive.com>
Subject: Re: [PATCH v2 5/5] riscv: dts: Add DT support for SiFive FU540 GPIO driver
References: <1574233128-28114-1-git-send-email-yash.shah@sifive.com>
        <1574233128-28114-6-git-send-email-yash.shah@sifive.com>
X-Yow:  It's NO USE..  I've gone to ``CLUB MED''!!
Date:   Wed, 20 Nov 2019 10:14:00 +0100
In-Reply-To: <1574233128-28114-6-git-send-email-yash.shah@sifive.com> (Yash
        Shah's message of "Wed, 20 Nov 2019 06:59:54 +0000")
Message-ID: <mvmlfsaoqp3.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Nov 20 2019, Yash Shah wrote:

> diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> index 88cfcb9..609198c 100644
> --- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> @@ -94,3 +94,7 @@
>  &pwm1 {
>  	status = "okay";
>  };
> +
> +&gpio {
> +	status = "okay";
> +};

How about adding a gpio-restart?

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
