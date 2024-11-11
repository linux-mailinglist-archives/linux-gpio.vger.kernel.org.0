Return-Path: <linux-gpio+bounces-12829-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F589C457C
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 20:01:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3736128278D
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 19:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4D01AB6CD;
	Mon, 11 Nov 2024 19:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="MKcVCczT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0766F1AB50D;
	Mon, 11 Nov 2024 19:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731351657; cv=none; b=a5pmm3hGoiH2q7AjfIJeZpXODeWEx/DnxK6gn6viRBZnt8e5nuM9rGF2Q22U20+ZtXFB/9JGikGjxjhi/hVMLkK4UDz6uHVRqr0c7O3HiZWWVRaMkCC5N+cPW0YAB+GhW1JNIA09c+9+y2EgYj+U5SwY6nRaiJycv+XKgcpC2pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731351657; c=relaxed/simple;
	bh=KzVPifvp+iOa3Bg8cKfqMmkzoZgJjO8HG4nRsmMmkk8=;
	h=MIME-Version:Message-ID:From:To:Cc:Subject:Content-Type:Date:
	 In-Reply-To:References; b=S71tFXzZG8/Yi33iJ9e7sInt5rCfjWq+ELOJMSKvgPQguxGs4dtQLoB/8t1NX/LhI2mwD2wOzpJxphjmySz7bCrucFUy/IIFq5gPZBwry84PNhYMhneOjN/fkCXcbZq3z4D5sckoA3zqw3jj7vJf2FM4KictTgN6j6apIihwam4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=MKcVCczT; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1731351635; x=1731956435; i=frank-w@public-files.de;
	bh=KzVPifvp+iOa3Bg8cKfqMmkzoZgJjO8HG4nRsmMmkk8=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MKcVCczT0LrVOyHtFxP6kLVEyg9Rr1DOfg6dN97+eLgdVgfXSbbOnfGXL1iKXBZ0
	 rHAaRovRfKpQNZGMSya3G3Dv5TxiU+75oDJFhacN/Rxg2cEl0HXP/GYix8bKjWJ4M
	 6gdr2JSpVTgy5Dr2pBKRgdfOPBZmg5D18sn3t9RH1xp/RH1VRplnf0051FoPN5jXf
	 PnhewIyAfYQDpXChudBkazHUfPhknM7/2B6Qs0ylrCskhmoi7GKCa8gMj7vj+GNaz
	 WHJhAINo5m0iF/ECPlrbAnzZCX4DOScoSfkV3UHEE+qj1eY5Qo9aYq3Xw4Kb5EadF
	 s+i/HtgRthArqrIJsg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.144.196] ([217.61.144.196]) by
 trinity-msg-rest-gmx-gmx-live-67cd9ff8f8-qxw8q (via HTTP); Mon, 11 Nov 2024
 19:00:35 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <trinity-090addc5-80b8-4d9f-8f01-ed2c519e0d3d-1731351635476@trinity-msg-rest-gmx-gmx-live-67cd9ff8f8-qxw8q>
From: Frank Wunderlich <frank-w@public-files.de>
To: ot_cathy.xu@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sean.wang@kernel.org,
 linus.walleij@linaro.org
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 guodong.liu@mediatek.corp-partner.google.com, guodong.liu@mediatek.com
Subject: Aw: [PATCH] pinctrl: mediatek: Add pinctrl driver
Content-Type: text/plain; charset=UTF-8
Importance: normal
Date: Mon, 11 Nov 2024 19:00:35 +0000
Sensitivity: Normal
In-Reply-To: <20241111074030.25673-1-ot_cathy.xu@mediatek.com>
References: <20241111074030.25673-1-ot_cathy.xu@mediatek.com>
X-Priority: 3
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:Ozjf8sg7sz1HlEchb8Y+cG4HP+g7ZDiilByq1d+03bVEVcgQ9K0XMDkll7rll0qLgITIE
 ZRXCP79R5bR4FbrOFYRZFZV24agGu9MeLINTAn+IiWWWtWN7bdcpMLeou+bBIyEIf18xDIMpdrSV
 G3dap+gsWMuJOy6FmOc0oMSmNYmRTOUPBZAysz2YfIMAr96RStSuZ1aDYZ2pRlu8hQIUsjxFRQrb
 35pp50DzueMKPBgbh3ePBTnmVlvS3E+h9tq0NieKZMB7PhJ9imgyFutu1wujwBvHLr1RblmMq5ad
 TjxYsWottylZQLn3jZljR2jUTMsb7Lcs1Ihwkv+dnMn/TcO/611KbYA3CrJ7SS8BGg=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Cxp8uh7T7Lo=;8fe5xqojxII002tLFune4TqJJoC
 gZkvtiBWOB2zgESItk/7vPr7m3XzF2906z9pRMI+TK6cyBsvNgiOqrCW5kD2Bz1ayu4yTC77a
 wjDpBWy4/v3bnRX0CgV2KB63aa2VhoN7l8NY8IMwAoA/gX/7GDUDivS5eICyGpV08NU6amwCK
 zCC/UGQoY+JloFmJn07M6MU94UyI3Yec2h1+47MzTMQdDlCi4QxOB7JEUgKeYXAQhJXPC42N2
 pcsGbAE/RuOPh+s5UgI5gdibRK/2DID+Z5Mm78BDJY8R46SZnFV+ru6524RtJ6hL4lAZTwTjI
 qtyYKz3RxzSzdQ1QdwqIKmPDXWDhlM1z3YWArCqZ59C9Y56C0hkclxjWOHV3YyXYS8jz9IQMd
 N7Kj69kG9VIiN93AuUr0pgh0anLqchRMW4oTs0NClgJCJHD5VnApKmq905mHYLt8r6wG5NCda
 u4xK4y/MyzX5YvQTAXF8wbqz/HprgVVVgurjCPAXGEnuWlY1zhmb3swsjTzmwU1zbZIMe1e5V
 m8k8wPJW8hnif912XQ8QEnPsvmgI9Y/Gw6c5zSRpPsZif3byyilT9TU3qc/BtC7cWcc8JPaYk
 kLv8uCNffBBxhnD3YWdhDYLfuWB1rFpbbP+9+zY6J0rPjsz945B2wDzenafTxjIQj+OFIvdN6
 oACatyGTpNh3R0vFBa4q230qNfQiy2PLyGbywWq41w==
Content-Transfer-Encoding: quoted-printable

&gt; Gesendet: Montag, 11. November 2024 um 08:40
&gt; Von: ot907280 <ot_cathy.xu@mediatek.com>
&gt; Betreff: [PATCH] pinctrl: mediatek: Add pinctrl driver
&gt;
&gt; From: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>
&gt;
&gt; Add pinctrl driver for mt8196

Hi

you should add your SoC to commit-/patch-title too.

regards Frank
</guodong.liu@mediatek.corp-partner.google.com></ot_cathy.xu@mediatek.com>

