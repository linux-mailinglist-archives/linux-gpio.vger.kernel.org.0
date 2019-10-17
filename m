Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF8CDAB8A
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 13:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406093AbfJQLyH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 07:54:07 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:54298 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405897AbfJQLyH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Oct 2019 07:54:07 -0400
Received: from [167.98.27.226] (helo=[10.35.5.173])
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iL4M1-000472-NN; Thu, 17 Oct 2019 12:54:05 +0100
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Subject: drivers/pinctrl/sh-pfc/pfc-sh7734.c multiple define of TCLK1_B
Organization: Codethink Limited.
Message-ID: <1e48cafb-6ec5-0573-4829-03e36f9d3d82@codethink.co.uk>
Date:   Thu, 17 Oct 2019 12:54:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

drivers/pinctrl/sh-pfc/pfc-sh7734.c hsa TCLK1_B defined twice.
Not sure how to fix, so reporting it here:

   1453          GPIO_FN(RD_WR), GPIO_FN(TCLK1_B),
   1454          GPIO_FN(EX_WAIT0), GPIO_FN(TCLK1_B),

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
