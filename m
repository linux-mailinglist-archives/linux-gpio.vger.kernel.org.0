Return-Path: <linux-gpio+bounces-13481-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D58F19E3435
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 08:41:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3298EB25F91
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 07:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1786818D65A;
	Wed,  4 Dec 2024 07:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="B/QbZNIa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4647B18C907;
	Wed,  4 Dec 2024 07:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733298105; cv=none; b=HBWlIeMk6E9tS7V3YMVJTqXYFvFnsqNKMrxiRHms58k2q+8XO9rHsLVSHGnLyPr284k7GtdVOJp3ppYkaqGwHflJeQjdmlIl2Yl6hzpi7MS+WwBYaVu833P/YaRWRJQhu1RzrPnFhaUCMNiF0BEwIsOd9KSaFoxzncXRUPU3erY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733298105; c=relaxed/simple;
	bh=UVFzzezC46FreKs2vaAw27DcvUsJ4OuyToeM0qBCxvA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=b5ltSaQdXzJUTmjh962lEkkKJ3bUDI+oAgS+2A4kjCP3qfb0flTEIV8RuAG/1UbT8sq0cZs8qr5YCKS5rBJ1iFll1j0i41zp2duMPxw64FQJVotEQ4egzM/ciEb1umE7S69uQbndKdIigTu2W7KtX5IA4V1PHyVM4ApgUb8E9EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=B/QbZNIa; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1733298087; x=1733902887; i=frank-w@public-files.de;
	bh=UVFzzezC46FreKs2vaAw27DcvUsJ4OuyToeM0qBCxvA=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=B/QbZNIau9e3IcVcJ3Nl54NQKWbKQ9349D+UQhhixxb15cGFoh2ADWDcn4hTffoX
	 9+i3sgJ0vqPXyKy8PQEfRGOiAs4jDa8RuZsOUiXYIOE8rguOJJ+tAGf7yRu9EyI6a
	 E9lokBmPZYUYYrD8qnYSBs9w/X0p2gde0afx9uLJ+FplQ9c24JimaRIMG2B0hnZ4g
	 uuNX3NsFug174Zi2otJBkw2f5umdtjbnF3Dx1MIwmeX3yLhFr3yz2Iyu5t2j3Zhkx
	 AYUsm2wQEqweY4AefGlHhW0bfZllFQwpCLZ+P2urjIyHMCl1jW6T1iq5hYALm753F
	 qWLsniJaHCjldIwnSg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([194.15.87.121]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MjS54-1u3fLB1jb8-00adr5; Wed, 04
 Dec 2024 08:41:27 +0100
Date: Wed, 04 Dec 2024 08:41:26 +0100
From: Frank Wunderlich <frank-w@public-files.de>
To: Krzysztof Kozlowski <krzk@kernel.org>, Frank Wunderlich <linux@fw-web.de>
CC: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sean Wang <sean.wang@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 3/5] dt-bindings: pinctrl: add binding for MT7988 SoC
User-Agent: K-9 Mail for Android
Reply-to: frank-w@public-files.de
In-Reply-To: <iwmnxlqpaijvr4kmzwk3elacqj5ukqlchfs67ca6c6gxrycpbb@pc6a6scqkdi5>
References: <20241202110045.22084-1-linux@fw-web.de> <20241202110045.22084-4-linux@fw-web.de> <iwmnxlqpaijvr4kmzwk3elacqj5ukqlchfs67ca6c6gxrycpbb@pc6a6scqkdi5>
Message-ID: <1DBA844B-4DB2-4AA2-BF04-B3CC39B3C3F8@public-files.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7jC8s2s7lVFQtf9IU1byVwhZN2EKibzOoMEEWpGfAWUBTs/5dAc
 J5161Qvl1qdhoS5VoKfAnOBN33EyjxHrWH4MjoC6GZQZ8U6gBod2qWlT6WKUzJ75dr9ZCwb
 xmQdWnm9GKsqIFRiPNZ+6gmvWY+VQ+BVV91as7VkpejWOzctJRtQ1STOW2sohgEZ+JSXG1X
 twiq+B6q6xhymAPyM4aRw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Pbqe7Pa+lEA=;UF7c5YedZdBVFclMVjACVAIYVbo
 AlXP5YkFR242Eo/xRAFUGIZwGvfyu1NDYIhPIexeOa4J1sDFtXjZVOVrsqYsn1M3m+vuuJzWn
 GIOVVpcQ9GXjVZnOi710fEaOk6VQssrzdIte8ANlntpt0xDbfX84wEhxDoCm5QTxW9hItWLce
 xIhh5Zg5bCjKcyM5IgfTwQbkHb1Fct2Y/P17PyAiEXek75e2jUgPFj6ldMWPfGqfSZVY1ei/f
 itLo18elPheLyl0NOK3tSGdqDgJw4WOCcVKP/02EC5Y/aWSlGbwi50amAxpvluRy3xtO9HVtT
 kDYBfDy5OX4K3tbX90ufwVCiH00JT3eWNdwjyW6g2t+Q3wB4n/uVpg2QPOGBRfEPjn544Kd7f
 mVYg/SHQljpb8p6HEeuIClNNifueIXRJy392phSo0brNNm3zsgvDjOixF/pUCzr2CBzGgaHHR
 ekrhhfkMrxGQ20qWQyPA1pr2BSj7XKzcmtH2JIXz8E2skkKgxU2l9WEqwkNCOn88FxjXsqoBG
 uRsTlsqN1KcRDx9YZSHGGbZM4Ia+uvCAZqdvknvtPxLtlYRc6gIoptCGyrnRqVh0AYy+UKUfW
 cI31VUyK0NJn+U0jz67lb/yViIUdT/kQWjZFPUv6HIzpla1kb/tFcGxvy3gYTwKtbpfHI4jmf
 A2tWrKUCZ1nK+TTAVDMAygAJscWpomalt1glWLZr3XBYq0ukPpfdOQ88VxuNwkGhTp+Kiy8Cz
 BFdIRlJ1qcwIcjDmw3Lo2zlez0sNravkZXVK0U0ExY1tKwpXIBQarPVoW2GCeNd8dWH+XP7nK
 yCn7sp4HwB69hQJzSGDfvRC6i0c2D2ZJ9rBZUu4H7jc/6r7yug3sdqQ2T1NkQ0ssvJaWJ5JGL
 ed88jRefP1Jce+teQTGSSRdfey7sglQvWDE4yn2TRKBQphiNdFcXW7MxRTnq7jZp89PAuafWC
 zs+N/j8m6fkTPhV0h0mL25SVCoeNWSRO4aJCl+FXwQANOMLWDplIA/rJZIY2HrchZXW2EcTWk
 5EGvnN3p6nXVKVr4UxhfBTeMP4CAH5MWmgz3KnVB9UFAqm8XzwzUFXaAPVfSqd61TCOjl0Ohg
 H6+C2Y2AwOyO4lv8m8DGhnC+zx4trn

Am 4=2E Dezember 2024 08:35:37 MEZ schrieb Krzysztof Kozlowski <krzk@kernel=
=2Eorg>:
>On Mon, Dec 02, 2024 at 12:00:37PM +0100, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>> This adds bindings for MT7988 pinctrl driver=2E
>>=20
>> Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
>> ---
>> changes in v5 (so not adding RB from Rob given in v4):
>> - do not use MTK_DRIVE_8mA in example
>> - add _0 functions for pwm
>>
>
><form letter>
>This is a friendly reminder during the review process=2E
>
>It looks like you received a tag and forgot to add it=2E
>
>If you do not know the process, here is a short explanation: Please add
>Acked-by/Reviewed-by/Tested-by tags when posting new versions, under
>or above your Signed-off-by tag=2E Tag is "received", when provided
>in a message replied to you on the mailing list=2E Tools like b4 can help
>here=2E However, there's no need to repost patches *only* to add the tags=
=2E
>The upstream maintainer will do that for tags received on the version
>they apply=2E
>
>https://elixir=2Ebootlin=2Ecom/linux/v6=2E5-rc3/source/Documentation/proc=
ess/submitting-patches=2Erst#L577
>
>If a tag was not added on purpose, please state why and what changed=2E
></form letter>

Is this an automatic message? I guess yes=2E=2E=2E

I have not added it (robs reviewed-by) from v4 due to changes and explaine=
d why in changelog=2E If i'm wrong please let me know=2E

>Best regards,
>Krzysztof
>


regards Frank

