Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14EBF57C9D8
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jul 2022 13:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232125AbiGULk5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jul 2022 07:40:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231383AbiGULk4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jul 2022 07:40:56 -0400
X-Greylist: delayed 17121 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 21 Jul 2022 04:40:55 PDT
Received: from 19.mo561.mail-out.ovh.net (19.mo561.mail-out.ovh.net [178.32.98.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F21A5D0EE
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jul 2022 04:40:54 -0700 (PDT)
Received: from player158.ha.ovh.net (unknown [10.111.208.240])
        by mo561.mail-out.ovh.net (Postfix) with ESMTP id B986E2440C
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jul 2022 06:55:31 +0000 (UTC)
Received: from RCM-web2.webmail.mail.ovh.net (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
        (Authenticated sender: rafal@milecki.pl)
        by player158.ha.ovh.net (Postfix) with ESMTPSA id 40A322CCE9609;
        Thu, 21 Jul 2022 06:55:10 +0000 (UTC)
MIME-Version: 1.0
Date:   Thu, 21 Jul 2022 08:55:10 +0200
From:   =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To:     William Zhang <william.zhang@broadcom.com>
Cc:     Linux ARM List <linux-arm-kernel@lists.infradead.org>,
        joel.peshkin@broadcom.com, dan.beygelman@broadcom.com,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org,
        netdev@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [RESEND PATCH 0/9] arm64: bcmbca: Move BCM4908 SoC support under
 ARCH_BCMBCA
In-Reply-To: <20220721000626.29497-1-william.zhang@broadcom.com>
References: <20220721000626.29497-1-william.zhang@broadcom.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <cb6bcce75bec6c845fa4a35587a2332d@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 194.187.74.233
X-Webmail-UserID: rafal@milecki.pl
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 17898149347535334168
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudelkedgudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihitgfgsehtjehjtddtredvnecuhfhrohhmpeftrghfrghlpgfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpeegvdffjeelvdeggeetheegveejieetgeeiiefggeelveejffehieekhfduueelhfenucfkpheptddrtddrtddrtddpudelgedrudekjedrjeegrddvfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhduheekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedu
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2022-07-21 02:06, William Zhang wrote:
> RESEND to include linux arm kernel mailing list.
> 
> Now that Broadcom Broadband arch ARCH_BCMBCA is in the kernel, this 
> change
> set migrates the existing broadband chip BCM4908 support to 
> ARCH_BCMBCA.

I'd expect me to receive patches 7/9, 8/9 and 9/9 too.
