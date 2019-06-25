Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 709EB55196
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 16:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727730AbfFYOZq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 10:25:46 -0400
Received: from smtp-fw-9102.amazon.com ([207.171.184.29]:45877 "EHLO
        smtp-fw-9102.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727070AbfFYOZp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 10:25:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1561472745; x=1593008745;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rJ5/pLRo7ybKRgcaV0iXG1cimiHcyqQC8+ssvElQ0LQ=;
  b=AFTvSibqgTtL9eo1Wi5Wtvu1bRHkQnnnB0fylignl+xWSpVQ7xKcgjZY
   5KjZe5om6RYUg0GpKiDU1b/l4CEEwsq5zf/WsoV86tsv/MN1sq/nwC1eJ
   XTDI08pAO15Vd4XVKwUorwREddT9b2657m+kXK6HY87QXGMhthJjcYyln
   w=;
X-IronPort-AV: E=Sophos;i="5.62,416,1554768000"; 
   d="scan'208";a="681980455"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO email-inbound-relay-1a-821c648d.us-east-1.amazon.com) ([10.47.22.34])
  by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP; 25 Jun 2019 14:25:33 +0000
Received: from EX13MTAUWC001.ant.amazon.com (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
        by email-inbound-relay-1a-821c648d.us-east-1.amazon.com (Postfix) with ESMTPS id C0E55A036C;
        Tue, 25 Jun 2019 14:25:30 +0000 (UTC)
Received: from EX13D02UWC002.ant.amazon.com (10.43.162.6) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 25 Jun 2019 14:25:29 +0000
Received: from localhost (10.43.160.61) by EX13D02UWC002.ant.amazon.com
 (10.43.162.6) with Microsoft SMTP Server (TLS) id 15.0.1367.3; Tue, 25 Jun
 2019 14:25:28 +0000
Date:   Tue, 25 Jun 2019 09:25:39 -0500
From:   Patrick Williams <alpawi@amazon.com>
To:     Gregory CLEMENT <gregory.clement@bootlin.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Benjamin Herrenschmidt <benh@amazon.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 0/2] pinctl: armada-37xx: fix for pins 32+
Message-ID: <20190625142539.GA33175@8c859006a84e.ant.amazon.com>
References: <20190618160105.26343-1-alpawi@amazon.com>
 <CACRpkdYgXZzvFKyvySWnsJ2_1pA1e_VHEY-QNzNYCikMUc_WVg@mail.gmail.com>
 <871rzhlr7w.fsf@FE-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <871rzhlr7w.fsf@FE-laptop>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Originating-IP: [10.43.160.61]
X-ClientProxiedBy: EX13D02UWC003.ant.amazon.com (10.43.162.199) To
 EX13D02UWC002.ant.amazon.com (10.43.162.6)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 25, 2019 at 03:38:59PM +0200, Gregory CLEMENT wrote:
> First you can add my
> Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks for the review Gregory.

> Then as the second patch is a fix, you should add the fix tag: "Fixes:
> 5715092a458c ("pinctrl: armada-37xx: Add gpio support") " as well as the
> 'CC: <stable@vger.kernel.org>" tags.
>
> But your change in the first patch made this second patch more difficult
> to backport.
> ...
> Maybe you could change the order of those 2 patches?

Good points.  Will do both.

> Actually, when I wrote "_update_reg" I was thinking to the update of the
> variable, whereas with a function named "_calculate_reg" I am expecting
> having the result as a return of the function.

Understand.  I can see the ambiguity in both names.  How about
"_update_reg_offset"?

> Thanks,
> 
> Gregory
> 
-- 
- Patrick
