Return-Path: <linux-gpio+bounces-6735-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 346D08D1CD7
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 15:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6635D1C22E7F
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 13:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D15D16F26C;
	Tue, 28 May 2024 13:23:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F51716ABC2;
	Tue, 28 May 2024 13:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716902607; cv=none; b=TWy5nBo9TanjDiGCysKwKHgG4p9FD4blec8LU5KQ6JiC64rMn6AX89keB0g/1EZZAXgiPocPArRjDPtjScXI96hHqm7AZuvChg1T/jm1OQKHgdrLZ6z4yQ1ivAW+o/pWWQoawwvb3vp6OZQTrYIUMPHVzdvu1c+AsZy0M4yQASg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716902607; c=relaxed/simple;
	bh=VpoXeImvv+3zjups/cZs0SCyUkXvCCcET3oHfElZJnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UlgkHmV0mBDdRvQPN8z5DDSU1ReRSfGfyDxErXT1hJoTF8E9QSTAClSr8BiA+HcF+Kt/BzCP4/5WE20rd9AQPqyzoUN3Si8DBxw6FCe9SZhf9Pypo3VhYevgHyCBmxmRQEaZKlGSQPeziXAbv8c+7ojlVRSqVU0FlSFs5PxAOgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i5e86193d.versanet.de ([94.134.25.61] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sBwnL-00040P-DW; Tue, 28 May 2024 15:23:15 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Yashin <dmt.yashin@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jianqun Xu <jay.xu@rock-chips.com>, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dmitry Yashin <dmt.yashin@gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: rockchip: update rk3308 iomux routes
Date: Tue, 28 May 2024 15:23:14 +0200
Message-ID: <2553645.4XsnlVU6TS@diego>
In-Reply-To: <a54be779-9728-4ac4-9b85-8cf6787f491d@gmail.com>
References:
 <20240515121634.23945-1-dmt.yashin@gmail.com> <1770701.X513TT2pbd@diego>
 <a54be779-9728-4ac4-9b85-8cf6787f491d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Am Dienstag, 28. Mai 2024, 14:18:35 CEST schrieb Dmitry Yashin:
> Hi Heiko,
>=20
> On 5/28/24 4:52 PM, Heiko St=C3=BCbner wrote:
> > Hi Linus,
> >
> > Am Dienstag, 28. Mai 2024, 13:29:12 CEST schrieb Linus Walleij:
> >> On Wed, May 15, 2024 at 2:17=E2=80=AFPM Dmitry Yashin <dmt.yashin@gmai=
l.com> wrote:
> >>
> >>> Some of the rk3308 iomux routes in rk3308_mux_route_data belong to
> >>> the rk3308b SoC. Remove them and correct i2c3 routes.
> >>>
> >>> Fixes: 7825aeb7b208 ("pinctrl: rockchip: add rk3308 SoC support")
> >>> Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
> >> While you guys are thinking about the RK3308B support, is this fix
> >> something I can just apply?
> > I'd think so. I've detailed stuff in my Review mail I just sent.
> > Both the soc itself and also the affected pin functions are niche
> > enough that this should not cause breakage.
> >
> >
> > Heiko
> >
> >
> >
>=20
> Should i just drop 1/3 from V2 then?

I guess just check the state of affairs once your v2 is ready ;-) .

I.e. if LinusW grabs patch1 before you post v2, just drop it, otherwise
send it along.


> Thanks everyone for the feedback on this series. I'll prepare V2 based
> on runtime chip detection with use of GRF_CHIP_ID.





