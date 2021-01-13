Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B16D42F5593
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Jan 2021 01:30:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729885AbhANA3W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Jan 2021 19:29:22 -0500
Received: from atlmailgw2.ami.com ([63.147.10.42]:61087 "EHLO
        atlmailgw2.ami.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729871AbhANA20 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Jan 2021 19:28:26 -0500
X-AuditID: ac10606f-231ff70000001934-d8-5fff765a36f4
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com [172.16.96.144])
        (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id 42.3B.06452.A567FFF5; Wed, 13 Jan 2021 17:38:18 -0500 (EST)
Received: from ami-us-wk.us.megatrends.com (172.16.98.207) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Wed, 13 Jan 2021 17:38:16 -0500
From:   Hongwei Zhang <hongweiz@ami.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>
CC:     Hongwei Zhang <hongweiz@ami.com>
Subject: [PATCH, v1 0/1] gpio: aspeed: Add gpio base address reading
Date:   Wed, 13 Jan 2021 17:38:07 -0500
Message-ID: <20210113223808.31626-1-hongweiz@ami.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.207]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFLMWRmVeSWpSXmKPExsWyRiBhgm5U2f94g+Z7aha7LnNYfJl7isXi
        9/m/zBZT/ixnstj0+BqrRfPqc8wWm+f/YbS4vGsOm8WplhcsDpweV9t3sXu8v9HK7nHx4zFm
        jzvX9rB5bF5S73F+xkJGj8+b5ALYo7hsUlJzMstSi/TtErgyThz8wF4wm7mi7/QBxgbGI0xd
        jJwcEgImEncaJjN2MXJxCAnsYpJ4/aiHFcphlPi4ZisLSBWbgJrE3s1zmEASIgInmSRm7f4F
        1s4soCLxY/U1VhBbWMBFYufUh2wgNouAqsSbNQ/AangFTCVuTTrCBrFOXmL1hgPMEHFBiZMz
        n7BAzJGQOPjiBVhcSEBW4tahx1DnKUo8+PWddQIj3ywkLbOQtCxgZFrFKJRYkpObmJmTXm6k
        l5ibqZecn7uJERK++TsYP340P8TIxMF4iFGCg1lJhLeo+2+8EG9KYmVValF+fFFpTmrxIUZp
        DhYlcd5V7kfjhQTSE0tSs1NTC1KLYLJMHJxSDYzyyqqSIXmcaSLpyWnbZsc0Hju7Refmntx7
        k2w0w8qWdmZcfRwtcfzowSM3dTbYtks8FWHe6H0nQz1F8xuv4KEzB3KvvDiad2T527jVUjYu
        z68saVdQWj7xy6uQf1uXfAnYvef6hXuRFdWlMTnfvhmvrTQ/2qz45vu0B7tFwlY3zwopda8q
        Nf2oxFKckWioxVxUnAgArcLYW00CAAA=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Dear Reviewer,

Add gpio base address reading in the driver; in old code, it just
returns -1 to gpio->chip.base. In this patch, the code first try to
read base address from of_property_read_u32(), if it fails, then
return -1.

Hongwei Zhang (1):
  gpio: aspeed: Add gpio base address reading

 drivers/gpio/gpio-aspeed.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
2.17.1

