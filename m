Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBC423D5D7
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2019 20:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392102AbfFKSvD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jun 2019 14:51:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:33348 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389470AbfFKSvD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jun 2019 14:51:03 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 368ED21744;
        Tue, 11 Jun 2019 18:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560279062;
        bh=eImiH0U2R9J23GU5acZAV8Hb7EeG17LzFiM7Nb4BDYQ=;
        h=In-Reply-To:References:To:From:Cc:Subject:Date:From;
        b=rfzC7eyFSl2rnamYq+e5oFdsnE0+XJDSNRNjSCHAChqv3ZrE2vSQBDpivAVbRv5jP
         nk5wPdiLmDoMlmcVS0UFYNP3aNmDmtnbm5MYhqojR98C8PmjSZ8VMyuIOEssP+P6ue
         63X9EX1KRTWzKQGg4mWfdfH6qE3bgDTOQmIwk69o=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <46b715974766d5c557685a1ab9131abe@codeaurora.org>
References: <1559285512-27784-1-git-send-email-tengfeif@codeaurora.org> <CACRpkdbdkbSofrvJ0hSV66DX+DcwWXp0ONDjx0265Pz50yE8TA@mail.gmail.com> <20190610145132.DD1132085A@mail.kernel.org> <46b715974766d5c557685a1ab9131abe@codeaurora.org>
To:     tengfeif@codeaurora.org
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: Clear status bit on irq_unmask
User-Agent: alot/0.8.1
Date:   Tue, 11 Jun 2019 11:51:01 -0700
Message-Id: <20190611185102.368ED21744@mail.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting tengfeif@codeaurora.org (2019-06-11 03:41:26)
> On 2019-06-10 22:51, Stephen Boyd wrote:
> > Quoting Linus Walleij (2019-06-07 14:08:10)
> >> On Fri, May 31, 2019 at 8:52 AM Tengfei Fan <tengfeif@codeaurora.org> =

> >> wrote:
> >>=20
> >> > The gpio interrupt status bit is getting set after the
> >> > irq is disabled and causing an immediate interrupt after
> >> > enablling the irq, so clear status bit on irq_unmask.
> >> >
> >> > Signed-off-by: Tengfei Fan <tengfeif@codeaurora.org>
> >>=20
> >> This looks pretty serious, can one of the Qcom maintainers ACK
> >> this?
> >>=20
> >> Should it be sent to fixes and even stable?
> >>=20
> >> Fixes: tag?
> >>=20
> >=20
> > How is the interrupt status bit getting set after the irq is disabled?
> > It looks like this is a level type interrupt? I thought that after
> > commit b55326dc969e ("pinctrl: msm: Really mask level interrupts to
> > prevent latching") this wouldn't be a problem. Am I wrong, or is qcom
> > just clearing out patches on drivers and this is the last one that=20
> > needs
> > to be upstreamed?
>=20
> Your patch(commit b55326dc969e) can cover our issue, and my patch is no=20
> longer needed.
> Your patch isn't included in our code, so I submitted this patch.

Alright cool. Sounds like this patch can be dropped then and you can
pick up the patch from upstream into your vendor kernel.

