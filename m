Return-Path: <linux-gpio+bounces-6684-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D798D07AE
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 18:11:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CADA5B26094
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 16:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0035B16F0C4;
	Mon, 27 May 2024 15:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="PUTkJtv+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC4E15F403;
	Mon, 27 May 2024 15:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716825478; cv=none; b=CPZ7Ryc/Lfir5ydAEsgd/+yKs0eeG7+7Mgc0AH/IPQpUg8aIkIb4rQSJ5h5RR8g67a+QAzImhQFft7jZ+IsjDQevCwcFDVW/oIevaTwvnETWpWNTGZW23esEWk5GG49Cs0LSeG32sSLnY+vfTJqsFg4BK2D78k4yz087wjnqMI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716825478; c=relaxed/simple;
	bh=LyY89JJGjC8Y+DxaXq1cHlE/nuU3X/RNIGtC1yqhUhI=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=I5fZtjOlAibwg1RSKhXPaAlotrpGEvsSEs6qcNILhQoLk2btVRRYMt0o/XnjjHzWypnteuu/q9vQaq1Irq4d7yhOCZk2NuzsiV05bdJbN+rD4A9Rci5EFvO9PNQ6YwcMyMm/aqCuTjWI6knF3IWjF+OugN7kKY5moK+FbkR8i+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=PUTkJtv+; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716825410; x=1717430210; i=markus.elfring@web.de;
	bh=cCQzbMHV0uZw8ARZF6tyJxZsTWRc/buEbEqLjIXSnlw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=PUTkJtv+17tmHPSwdj2hf899Cxz87JZtpAv6Jc/t460ErK6rIZ1XjrMEwjT/IL5e
	 u6asEjjbaWV05EEJOrnLlJNLso+bKJ6JUhoe+vAQmYcyr1mOVJ9CmwVzJFYdsDjWk
	 lhH7BRvhFBzVj6hnFHPSxBLuofy8FnxnuGCzKVh06VXSoykW9+Z5sNppeifyGBhS7
	 Tbby0eXDkzEd3ur+rXCvlZhYwOhxY2j+kjNeQE+m/gaI7bzpQ3HVkzXeOYg+oIyfZ
	 hv0kSHTDq7XWjQmMF+X+gAfIYHkN5y02reNDf+/pFuI1uzraU+ayvVz08dwXuor0H
	 +gQ8lygtBMIj/W0VNQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N6JxT-1sa0Ai3q9J-016inV; Mon, 27
 May 2024 17:56:50 +0200
Message-ID: <aa58efd3-b502-4bed-8c84-e5d78da23fbe@web.de>
Date: Mon, 27 May 2024 17:56:43 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peng Fan <peng.fan@nxp.com>, soc@kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chester Lin <chester62515@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Damien Le Moal <dlemoal@kernel.org>, Dan Carpenter
 <dan.carpenter@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Hal Feng <hal.feng@starfivetech.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Jacky Bai <ping.bai@nxp.com>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Joel Stanley <joel@jms.id.au>, Jonathan Hunter <jonathanh@nvidia.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Orson Zhai
 <orsonzhai@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Viresh Kumar <vireshk@kernel.org>, Wells Lu <wellslutw@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
 imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, kernel@pengutronix.de,
 Peng Fan <peng.fan@oss.nxp.com>
References: <20240504-pinctrl-cleanup-v2-18-26c5f2dc1181@nxp.com>
Subject: Re: [PATCH v2 18/20] pinctrl: freescale: mxs: Fix refcount of child
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240504-pinctrl-cleanup-v2-18-26c5f2dc1181@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fY28vuOzSy7D3myo+NUo+Q8h4MAB+DMYH6x54XY9zacr23bFm3Z
 XEU1mqywgExmQK1yZjuU6En9jXs1HgcwzsaQZ+4suTC5BPEjIf/Fg4o0HdX3AuRpQZI2yac
 KrkniKWThKnQbs96+yLl/Dm5E5NsImhOyFs1ksUAetHBWVW2WfIWoOdGSaoQFZRJLEXutYy
 iCHwBxLqQsK9Mq+39k2DQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TjeN7uyFccs=;bjTTRHq6gIBTOMFXSFUogBWSZuQ
 ZTwgZq2VnppV1aZlnrDYMmOmytXyq0JrjEzIfy/yH2myRvZFwVxrMpYgtVdN++fuf8ainJk/t
 uFkTD8huhpK+v/6sd6lXCGtTOMoxBExDvHrzfiIvMwNnj5vJaD78bXrOpQIviBkrbo/dpouOC
 Ln7QFnEpQNN9tfIRGg8gaddFRITCsPb8eIY2ZjqdGWqcC0mpb+GXVonl0LzMFBCnUIrGNucUB
 JyF0gcU5WkAg6RJMxI6bQbphTn5At4z7kJpzYsMNnHFABhVCUal+gm0247pr1mpjl/KiGECTR
 XNTX442NdkykPvhiMNWp17M35HW0J6oLENbsSL8PyhGQHAW5h5EnpFB5SuC+MkmcW7VQwxd36
 lCdpZmXrsZsRJ7AbJhptgf/dByjHu/LOLAj4+ethb/xC2SLDH84JLTDzzYCw43EzHk/09K8p9
 cDEpfpl8+VPFN35SSlqs/3lTQxU1UurqQF96DxIJCZdCGRE3icPsCoTwZMOJqDYJkYsmztQRH
 YW541Ftvhar9wZSgE19Bcj1s0L3HXu9Xp3pkz7IcX+lrc7RPJuNoPC+xc48ucMhoGmNSMI5WK
 RVp1WSoLoJahSt7/mjjyxqyly6XzUtnKE6um1tWMAR0vojK8hQcOOL84UbAmXM7tbS+2QyuCj
 LkzuEZ/KIlY89jP9+dNMuuSCCwKeQJA7ykttwUV0aQte1rS7POYfJSX2aeTAa8Z7rWLzt7kHc
 AmtJvjHPIr4iMol58kTZo18kQbOqJQsi9qx7qS9pObTVMxyOiWt4lPdDW0vYOWO4MOmC4QlIy
 k96VHg44SU3OMjnGBpPp4v6EScAmUEUHJaYg/CdI/NGc8=

How do you think about to use the summary phrase =E2=80=9CFix reference co=
unting for children in mxs_pinctrl_probe_dt()=E2=80=9D?


=E2=80=A6
> of_get_next_child() will increase refcount =E2=80=A6

                                    the reference counter?


> Per current implementation, 'child' will be override by

                                              overridden?


> for_each_child_of_node(np, child), so use of_get_child_count to avoid
> refcount leakage.

Another wording suggestion:
  for_each_child_of_node(np, child). Thus use an of_get_child_count() call
  to avoid reference counting leakage.


Regards,
Markus

