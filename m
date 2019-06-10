Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D65A3B7C2
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 16:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390109AbfFJOvd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 10:51:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:49490 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389123AbfFJOvd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 Jun 2019 10:51:33 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DD1132085A;
        Mon, 10 Jun 2019 14:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560178293;
        bh=/U+wRbtteOILfQyqQEFAX34EWpIssdlfePMqvbBQcok=;
        h=In-Reply-To:References:To:From:Cc:Subject:Date:From;
        b=Ni0M5RTJQlOeKFtGcIhyjvjbFQh9+sc5iJLSUSog2oF2FOHTnobpDTXHykwpzxgoP
         TZDXbEjB6h0jAElBvVK5dtBxqTyu8J34WTjIwPSqdNbb/z4yUNw2TDvhq+BsP3AHAK
         dF5aylUD2a3MN7MyeBl1zrHT8NaBG5H7Zs8xVfko=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CACRpkdbdkbSofrvJ0hSV66DX+DcwWXp0ONDjx0265Pz50yE8TA@mail.gmail.com>
References: <1559285512-27784-1-git-send-email-tengfeif@codeaurora.org> <CACRpkdbdkbSofrvJ0hSV66DX+DcwWXp0ONDjx0265Pz50yE8TA@mail.gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Tengfei Fan <tengfeif@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: qcom: Clear status bit on irq_unmask
User-Agent: alot/0.8.1
Date:   Mon, 10 Jun 2019 07:51:32 -0700
Message-Id: <20190610145132.DD1132085A@mail.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Linus Walleij (2019-06-07 14:08:10)
> On Fri, May 31, 2019 at 8:52 AM Tengfei Fan <tengfeif@codeaurora.org> wro=
te:
>=20
> > The gpio interrupt status bit is getting set after the
> > irq is disabled and causing an immediate interrupt after
> > enablling the irq, so clear status bit on irq_unmask.
> >
> > Signed-off-by: Tengfei Fan <tengfeif@codeaurora.org>
>=20
> This looks pretty serious, can one of the Qcom maintainers ACK
> this?
>=20
> Should it be sent to fixes and even stable?
>=20
> Fixes: tag?
>=20

How is the interrupt status bit getting set after the irq is disabled?
It looks like this is a level type interrupt? I thought that after
commit b55326dc969e ("pinctrl: msm: Really mask level interrupts to
prevent latching") this wouldn't be a problem. Am I wrong, or is qcom
just clearing out patches on drivers and this is the last one that needs
to be upstreamed?

