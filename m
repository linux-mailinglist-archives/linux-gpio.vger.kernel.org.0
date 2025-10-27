Return-Path: <linux-gpio+bounces-27718-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA45C10A41
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 20:14:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A2C5561817
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 19:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54CAE330B22;
	Mon, 27 Oct 2025 19:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="qJfh1EzI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDA933033A;
	Mon, 27 Oct 2025 19:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761591887; cv=none; b=oERj9NbLkzUf5I8xfh0ANlwKJtYTYbQOOOASR/4DBwM8+lwY1NGjQ/9Q94C1ElXkeUQHQT7e6pJt6uNeLZTezKz2FppmkFNQLGNeuAnpHtkUEhMhtzWQ8YIwW2ci2j0h23ggQ61Vc677bCeDynwt7+WqILyWyeVbHzMlu4xDxaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761591887; c=relaxed/simple;
	bh=ZjWO/BEe29xE/Nq1zoZdxbKPDexuzkwu7CFslbvSqrM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ivbpXZphytCc/DUp/Xfqb8f1xD5plI6Po+Z2KuS/T/xwjRrjkUcYyXLgBrhdokaf9LRKn/JCw5N4VFaQUYKrIlS1BO9W2vECBx2lxbeklnEH7Y494HhjnUjeKjHbfAHf5PM9XURDYLV1vTq+SDRDGoyp9rRrl8Tud5GMhcPKosA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=qJfh1EzI; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1761591873; x=1762196673; i=frank-w@public-files.de;
	bh=ZjWO/BEe29xE/Nq1zoZdxbKPDexuzkwu7CFslbvSqrM=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qJfh1EzI6oMJXA+FIE5qHft9AynPxNm8DIYtSV71LimVup/hAN97tQpLD++ggh2e
	 Zr0ffUP5W4bjfHSLOYH+cYbKz3chQJ6sRoB7IDZy6HjzIpJ8stD9nNq5d88uhifxk
	 kfN+9fM9O0qQlPtiTNbfileQJShIs2UP5R0Arg1AYJmspMxpqxYERWrJbzeET+eGY
	 QlrDC/sZWXb5pK0lyWg5V4+/DNX5on9ZTKUk4WeWg1VhQS6B3rh3DwbHSu/5ezo2t
	 /aIXyjAuOpON9gW35Q9rEgq7jwQelqG965m7J0WmNqw9cm2k1Po237CSzGw6oKM95
	 BedB0LQ8gHMeCursdA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ehlo.thunderbird.net ([217.61.159.158]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M1poA-1vBGf31JaC-007g3L; Mon, 27 Oct 2025 20:04:33 +0100
Date: Mon, 27 Oct 2025 20:04:30 +0100
From: Frank Wunderlich <frank-w@public-files.de>
To: Krzysztof Kozlowski <krzk@kernel.org>, Frank Wunderlich <linux@fw-web.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1_3/6=5D_arm64=3A_dts=3A_medi?=
 =?US-ASCII?Q?atek=3A_mt7988a=3A_Add_label_for_ssusb0?=
User-Agent: K-9 Mail for Android
Reply-to: frank-w@public-files.de
In-Reply-To: <35504988-448e-4a5c-8ea6-769c06117c01@kernel.org>
References: <20251027132817.212534-1-linux@fw-web.de> <20251027132817.212534-4-linux@fw-web.de> <35504988-448e-4a5c-8ea6-769c06117c01@kernel.org>
Message-ID: <F6FAB95A-9FF2-416C-B50A-C2B1808FC5FF@public-files.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AqUCuk22YMbKR2Zwnkn0IRR7G+7ys6qf9Tf0NzV4QYlgQ580Qjm
 1/D8JLx7D7sff55hn1yoOGps4txEu4evf4rY0L5SXN4zOt9dD061XVjVGI0nmkbtNGc+9PR
 HJwVX2tEJUdDU6NG76IoROTu+e+0qVf7AU2anH8wMJ5NakeC8zX4HwwWj4dl0FJYpejl2ec
 7vtozmQcpUensvMimvU4w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GV3Dh2Fk0SM=;8fu66/eIkVV3QJqsyAWBtOTEwDX
 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
 K87B8yuJbOX7+/qMIbpPhEwHAn0uIDElkP0=

Am 27=2E Oktober 2025 19:58:23 MEZ schrieb Krzysztof Kozlowski <krzk@kernel=
=2Eorg>:
>On 27/10/2025 14:28, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>> Add label for ssusb0 node which is used for BPI-R4-Pro=2E
>
>This makes no sense on its own=2E We do not add labels because they have =
0
>impact=2E
>
>Please drop or squash=2E

Thank you for the review=2E

I reference this label in part 4 and tried to separate
changes in soc dtsi and board layer=2E
But of course i can squash this to part 4=2E

>Best regards,
>Krzysztof


regards Frank

