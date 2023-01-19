Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9105D67355B
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jan 2023 11:20:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbjASKUg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Jan 2023 05:20:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbjASKUf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Jan 2023 05:20:35 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2A07E659A;
        Thu, 19 Jan 2023 02:20:34 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 76BC580F1;
        Thu, 19 Jan 2023 10:20:33 +0000 (UTC)
Date:   Thu, 19 Jan 2023 12:20:32 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] ARM: OMAP2+: Remove unneeded #include
 <linux/pinctrl/machine.h>
Message-ID: <Y8kZcIdR7pkKCg4d@atomide.com>
References: <5dd5e235af9b3def7f4a431edc7bb8504b0681bf.1668001020.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5dd5e235af9b3def7f4a431edc7bb8504b0681bf.1668001020.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Geert Uytterhoeven <geert+renesas@glider.be> [221109 15:28]:
> Commit 6f3ab009a178098e ("ARM: OMAP2+: Remove unused legacy code for
> device init") removed the last user of the pinctrl machine API.

Applying into omap-for-v6.3/cleanup thanks.

Tony
