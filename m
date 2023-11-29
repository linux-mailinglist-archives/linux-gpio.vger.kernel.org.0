Return-Path: <linux-gpio+bounces-651-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BE27FD41D
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 11:29:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87B9F1F20FFE
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 10:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 496F71B268;
	Wed, 29 Nov 2023 10:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A124ACE
	for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 02:29:06 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1r8HoR-0002qK-Tw; Wed, 29 Nov 2023 11:28:59 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1r8HoQ-00CNkv-P8; Wed, 29 Nov 2023 11:28:58 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1r8HoQ-0004uR-2I;
	Wed, 29 Nov 2023 11:28:58 +0100
Message-ID: <2fd0e3690c94e70a58d21b83694ef5fcff520663.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/4] dt-bindings: reset: Add syscon to nuvoton ma35d1
 system-management node
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jacky Huang <ychuang570808@gmail.com>, linus.walleij@linaro.org, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
  j.neuschaefer@gmx.net
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ychuang3@nuvoton.com,  schung@nuvoton.com
Date: Wed, 29 Nov 2023 11:28:58 +0100
In-Reply-To: <20231128061118.575847-2-ychuang570808@gmail.com>
References: <20231128061118.575847-1-ychuang570808@gmail.com>
	 <20231128061118.575847-2-ychuang570808@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org

On Di, 2023-11-28 at 06:11 +0000, Jacky Huang wrote:
> From: Jacky Huang <ychuang3@nuvoton.com>
>=20
> Add a compatible 'syscon' to the system management node since the system
> control registers are mapped by this driver. The other driver must access
> the system control registers through 'regmap' using a phandle that
> references this node.
>=20
> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

to be applied together with the dts changes.

regards
Philipp

