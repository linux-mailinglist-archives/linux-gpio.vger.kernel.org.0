Return-Path: <linux-gpio+bounces-13487-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5C69E3E49
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 16:28:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AA1D283AD8
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 15:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F69820B81B;
	Wed,  4 Dec 2024 15:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="DxMgR2v5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5D423BB;
	Wed,  4 Dec 2024 15:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733326092; cv=none; b=VXcNIwqlhMn1qls6X+k0cDyOShC2S7h5p/aY+d0p5yso5ngUFjYt6nGLt+P1LLtHcJEBN1qyGTxkgcCr3n/9I80JnR80OU4oPDqCVwijbNQ1kjxNHJhA7qR4C9Ygtk8qV2uEgIaQxL7kvPeSajSyxrAWxZ+eQCSHv2buIlRxObM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733326092; c=relaxed/simple;
	bh=pjjfQePfOyiXfU23/6F9LerYYHMnwqmdZzt83UCtIxE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=H+lKf8mVGu+c6Wf0Ym2PGt2kuoLtSCIM08ZiieMmj9Qx4wDrNOM76fzulZcimErDQEKnHp9VlC7LWFuCAZdfQGlZEBQM0DJmB6oymeb/Zm0ODW3uZgji1QxE2G5ATp2458Va+FHbpW4O1IZYtrLyjJXJjm4qN4nya6pyHVhjqBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=DxMgR2v5; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1733326072; x=1733930872; i=frank-w@public-files.de;
	bh=pjjfQePfOyiXfU23/6F9LerYYHMnwqmdZzt83UCtIxE=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=DxMgR2v5Nu8K+l4ugF2setlK9SY+S1YLY0EX31fX8E4ocdFP6bkhZu2/rM8Ogkc7
	 c50vHSQJt2BB3LWFzlsZ/3s6JT7BMVMXFqMFIfo4sXDPKoG5WJuIxfSIxbodSzNds
	 FdAwaTt4yEfPo5mzeuw6NWcF6MdwjLaX7cbptsKXIauDTn++jvktgCqzGQOQAPo4v
	 eYON6ptShgRLTSoLPGqs03F8oyKq+mB3AwAsDv63++3rAWPCiz6gP15g9LEkuZ25n
	 UiPfgMmme8qdtU212Xs8aDMX9MZz9gITBszFiDk3QJTVb6IXYtwgh6FW+pLcvdfkl
	 m7l7ACdWWYR3/qkP3A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([194.15.87.121]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M89Gt-1tFGmi3scV-0065xH; Wed, 04
 Dec 2024 16:27:52 +0100
Date: Wed, 04 Dec 2024 16:27:50 +0100
From: Frank Wunderlich <frank-w@public-files.de>
To: Rob Herring <robh@kernel.org>, Frank Wunderlich <linux@fw-web.de>
CC: Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sean Wang <sean.wang@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 3/5] dt-bindings: pinctrl: add binding for MT7988 SoC
User-Agent: K-9 Mail for Android
Reply-to: frank-w@public-files.de
In-Reply-To: <20241204144341.GA191772-robh@kernel.org>
References: <20241202110045.22084-1-linux@fw-web.de> <20241202110045.22084-4-linux@fw-web.de> <20241204144341.GA191772-robh@kernel.org>
Message-ID: <52A93441-8BF5-412A-8BE1-F662A4BE8BE0@public-files.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kpFFKleEuGcdJHmJZilFO693NLkTAOjN7Dy30NGmeEjUA55Vptu
 QBH5J7IWTtURuj92DBQ2660+XQtrK7kfRWDWNreJvNhqC39TH/Io+xhQJKOi3SMQgRjKbbE
 WTu8FV5vZVyOk73fuXPF7swyETD9G6luYQUddUExPbcCDelFKuNxW03GbS1kx/Jbx+mqAnr
 ukw4fv3x0Y9MvFAIuYtSw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Dy8xoDf5gfM=;WVivEMm620DfJ0o/7Vy0T8yMHy2
 KZvWF4noSwYtFh3ihcvRp76VL/lWTgkwj3G4xl+xeKkeTIgMgMndk73Gvx3HrZHTCKvn6y6kF
 7s+P+6sIj3JFxbGoB7NovdcDaYRCY0MOofn4oSAIC0trjx/NT6erOEbUY1nAYkgA3nskCV5zM
 6c3GZm9xmiHAfB+3e2fpVIxZj3ysX4hN4WXMqyMIdVfz8JBwJHLfxqSzAyN2SNoQdjGK9/m+l
 SVZtZ8fM5Kkqz2Qxbl2TCvl5Oj5bvk1GcuGIURkuseJL1e5PQUnU9Bxa4BPuCD1nlXOyq0J/Z
 HRsGbGX8ogPrfQGqpYyatS1Vq+oLHnqYwLCCSLI4NFjILeWRMcMtI4WI2HrEdRP/4u2SX06lT
 o6izjdgJALZcLJ0H/kE/JI6Bd67omLeWhjTxF0D4umcDutjilMFpetkc26/BVrQJHPl9APIRA
 yLa4oj5J/28LdYlhCQgPBOCLxM5I2lcOv0M5KObC86U8SgCjaGJvFYspALYmhLkq9y3sZV4u/
 LnBN9JBWrkArg8OSDVDd3AJzREeUqlT4i5Rry7E+UQ9HoCZGhN9lIvwsTKCCrMrn9Vn4ldQHK
 D1Wfr/E7sqt747C6B4x+oPMPYoYTEulhs46CSoWL3JYju2GF+BdpneT8Xednw7iEtnvNLRE5U
 B8CCrdqEn1uoWT9Ia4xnzxbCi9oXtos9kMc23LCLHosmi3G2dbfTdOOXfx3jFVxhcgb2qrhgp
 IsLm5/JYTT4PjSbDHIZpSzBQaPvIpsmkrnA9Dg4lxGdo3xF7JDfNPihvSmT0uslXb1Jou0vTJ
 NOmSoAuRth/WTt7nkjeyNb1IzlhsyvDHMVfbA2Uq+VtN8+r6imRnhetbXpnOzE+VisBfa/oTO
 JQ3qmjPUgAZEZBc5wA1vW3lYc2xS1YaR5XxmxYlvb4EboQSSXJAXkSLNhPNuw56krNG9Ae/mf
 tSrNG1drUs8IymUycvsVH6zbFKb6NbAKvNAy6z4j5jmVwjVSrh7OnGIn8yUahu6enT7hTqb6j
 OynjWGUJRnW/+ERwgYF+KIpoFhHurQ12eZ7bghBtleCBY9DERazQmmoKnWDsaexhuOMiEsYAJ
 n5sb1qPH8yJipObVfC4Mjbro8igKhp

Am 4=2E Dezember 2024 15:43:41 MEZ schrieb Rob Herring <robh@kernel=2Eorg>:
>On Mon, Dec 02, 2024 at 12:00:37PM +0100, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>> changes in v5 (so not adding RB from Rob given in v4):
>> - do not use MTK_DRIVE_8mA in example
>> - add _0 functions for pwm
>
>Minor enough to keep my R-by, but if I review it again I can always find=
=20
>more=2E :)

Sorry for the additional work now=2E=2E=2Ethought changes are enough to no=
t add the RB=2E=2E=2Eok, doc says "substantially" changes for dropping the =
given tags=2E
Imho it can make the "code" better :) I will fix the issues reporter in ne=
xt version but wait a bit for the other parts to get reviewed=2E

regards Frank

