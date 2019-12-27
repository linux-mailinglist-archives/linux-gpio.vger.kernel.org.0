Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 176A012B042
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2019 02:33:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbfL0Bdy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Dec 2019 20:33:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:46432 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726193AbfL0Bdy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 26 Dec 2019 20:33:54 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4CB292080D;
        Fri, 27 Dec 2019 01:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577410433;
        bh=qaY83pBKOFqCF2j6sSNOsyRRud62S9BGBHikCZv7I9Q=;
        h=In-Reply-To:References:From:To:Subject:Date:From;
        b=jYFgvh2Onwrf7oOpuwoLj2e8Wg+JrUQHEIlDA0bV93IyV8mM7tORkZjX88BoxPW9K
         v7/fNXdSlhrLZoDZOrxdnkT8ECzFA3R2biM1f16oJIgTJNQYWfKgOBxO3Pa7eqt0i7
         XQamt9Jw1x1kzXx6dVPIojhOnjURO0edKx5QHJZc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1576752109-24497-1-git-send-email-sricharan@codeaurora.org>
References: <1576752109-24497-1-git-send-email-sricharan@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     agross@kernel.org, devicetree@vger.kernel.org,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-soc@vger.kernel.org, robh+dt@kernel.org,
        sivaprak@codeaurora.org, sricharan@codeaurora.org
Subject: Re: [PATCH V2 0/7] Add minimal boot support for IPQ6018
User-Agent: alot/0.8.1
Date:   Thu, 26 Dec 2019 17:33:52 -0800
Message-Id: <20191227013353.4CB292080D@mail.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Sricharan R (2019-12-19 02:41:42)
> The IPQ6018 is Qualcomm\u2019s 802.11ax SoC for Routers,
> Gateways and Access Points.
>=20
> This series adds minimal board boot support for ipq6018-cp01 board.
>=20
> [v2]
>  * Splitted dt bindings  and driver into different patches. Added missing=
 bindings
>    and some style changes.
>  * Added ipq6018 schema
>  * Addressed review comments for gcc clock bindings.
>  * Removed all clk critical flags, removed 1/1 factor clocks, moved to new
>    way of specifying clk parents, and addressed other review comments.
>  * Sorted nodes based on address, name, label. Removed unused clock nodes,
>    Addressed other review comments.

Can you just send the clk and clk binding to me in a different series?
I don't want to review all the other patches in the same thread.

