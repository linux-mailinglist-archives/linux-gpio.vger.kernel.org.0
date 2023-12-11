Return-Path: <linux-gpio+bounces-1204-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF4D80BF08
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 03:21:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F5551F20FA4
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 02:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D576125A2;
	Mon, 11 Dec 2023 02:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="QE16c7BY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A27DAB4
	for <linux-gpio@vger.kernel.org>; Sun, 10 Dec 2023 18:21:35 -0800 (PST)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20231211022132epoutp023d9e992a3b67f432ab6d085ce1f8c99e~fpaBogqpx1354113541epoutp023
	for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 02:21:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20231211022132epoutp023d9e992a3b67f432ab6d085ce1f8c99e~fpaBogqpx1354113541epoutp023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1702261292;
	bh=/9hlKlgNIEduibXHRlid8P6boQ3v0KTReFBBYvxqfDo=;
	h=Date:Subject:To:From:In-Reply-To:References:From;
	b=QE16c7BYFeqqRMrTrQWCYAq/I1dY4dSrFgMaJEaqyFeXv12RUUaFCthEPfzNRYyt8
	 1kuJ5lRthf8U8JKH37Mryp3Ng6nMFgjpaUrlxcO/qwHpfAUJWbYWonjJ3L1HvXoTz+
	 +tobTGr1sZEpFANEaD32Vm63KBJSPlPC+f1tUwEY=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20231211022132epcas2p4a0ca9a3b2e11b0de4b82452405efc05d~fpaBNrtSB0900209002epcas2p4a;
	Mon, 11 Dec 2023 02:21:32 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.91]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4SpQV35MlXz4x9QD; Mon, 11 Dec
	2023 02:21:31 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	0C.75.10006.B2276756; Mon, 11 Dec 2023 11:21:31 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20231211022131epcas2p3830734b4574587c08762782bf0262e98~fpaAWggl90914109141epcas2p3i;
	Mon, 11 Dec 2023 02:21:31 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20231211022131epsmtrp1f415881c59398ea317c5649c0c2edc27~fpaAUbuhi1061810618epsmtrp1r;
	Mon, 11 Dec 2023 02:21:31 +0000 (GMT)
X-AuditID: b6c32a45-179ff70000002716-53-6576722b5c20
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	5C.71.08817.A2276756; Mon, 11 Dec 2023 11:21:31 +0900 (KST)
Received: from [10.229.8.168] (unknown [10.229.8.168]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20231211022130epsmtip253fe79bbcfe1b8591827216e2044fb4c~fpaAExUZD0653506535epsmtip2T;
	Mon, 11 Dec 2023 02:21:30 +0000 (GMT)
Message-ID: <c63bd0b3-ecb2-d4c6-2147-43f19c1dcfee@samsung.com>
Date: Mon, 11 Dec 2023 11:18:40 +0900
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
	Thunderbird/102.11.0
Subject: Re: [PATCH] dt-bindings: pinctrl: samsung: correct ExynosAutov920
 wake-up compatibles
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Tomasz Figa
	<tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim
	Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Jaewon Kim <jaewon02.kim@samsung.com>
In-Reply-To: <20231210133915.42112-1-krzysztof.kozlowski@linaro.org>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKJsWRmVeSWpSXmKPExsWy7bCmma52UVmqwepNWhYP5m1js1iz9xyT
	xfwj51gt9r7eym4x5c9yJotNj6+xWmye/4fR4vKuOWwWM87vY7Jo3XuE3eLwm3ZWi1W7/jA6
	8HjsnHWX3WPTqk42jzvX9rB5bF5S79G3ZRWjx+dNcgFsUdk2GamJKalFCql5yfkpmXnptkre
	wfHO8aZmBoa6hpYW5koKeYm5qbZKLj4Bum6ZOUA3KimUJeaUAoUCEouLlfTtbIryS0tSFTLy
	i0tslVILUnIKzAv0ihNzi0vz0vXyUkusDA0MjEyBChOyM44c7mctaGWt6J01lb2BsZ+li5GT
	Q0LAROLEpk+sXYxcHEICOxglVpy7xAThfGKUWNzxlxnC+cYosf3TZkaYls2HGtggEnsZJV5t
	u8kOkhASeM0ocXFzGYjNK2AnseZ6N1icRUBVYv+5B+wQcUGJkzOfgO0WFYiWaF12nw3EFhZI
	kNjy8RfYHSICZ5glZq27DbaNWUBc4taT+UwgNpuAtsT39YtZQWxOAReJ3Vc/Q9XIS2x/Owfs
	VAmBlRwSfXfvM0Gc6iLR9L4JyhaWeHV8CzuELSXxsr8Nys6XaLtyBsqukdi44BLUm/YSs35v
	AVrGAbRAU2L9Ln0QU0JAWeLILRaItXwSHYf/skOEeSU62oQgGtUk7k89xwZhy0hMOrIS6gAP
	iesPTkDDbTqjxJEpP9knMCrMQgqWWUg+noXks1kIRyxgZFnFKJZaUJybnlpsVGAIj+3k/NxN
	jOD0q+W6g3Hy2w96hxiZOBgPMUpwMCuJ8MocKU4V4k1JrKxKLcqPLyrNSS0+xGgKjJyJzFKi
	yfnADJBXEm9oYmlgYmZmaG5kamCuJM57r3VuipBAemJJanZqakFqEUwfEwenVAPT9B3hnxWa
	Koq2dG1RMvadujTsvWXbT5G/02ZMf7TGavWUqi115jONRT80qZvZvGkp0OaVPsvyqeZ9bKqw
	uuNE5QeR7Ttd17LOyXfcEzN5x/4fLod2aNfz3J3hucOruNn728TgHEuxjiohjdn/9kXcrWjw
	/r1g8eLgSfof0hRL3Ap+P2kwujgxbvauPRIOK7XsVqy0/HeDK4LldfFCk6m585vFQ39K7/lX
	5FZ55aquPWfFw+ZOv7J0uZkb8qdzrjp0uFz09uqLDQbv7smnT3JleGzNuqHp64NzdpN+RN1t
	Paf9+l3HySr7xbxXOCTXZO7ZraRWo1Sd/qHsjxjrnKezZqRbXNKexvl1w86XN615lFiKMxIN
	tZiLihMBxbLI1EgEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeLIzCtJLcpLzFFi42LZdlhJXle7qCzVoGMLo8WDedvYLNbsPcdk
	Mf/IOVaLva+3sltM+bOcyWLT42usFpvn/2G0uLxrDpvFjPP7mCxa9x5htzj8pp3VYtWuP4wO
	PB47Z91l99i0qpPN4861PWwem5fUe/RtWcXo8XmTXABbFJdNSmpOZllqkb5dAlfGkcP9rAWt
	rBW9s6ayNzD2s3QxcnJICJhIbD7UwNbFyMUhJLCbUWL+5SesEAkZieXP+tggbGGJ+y1HwOJC
	Ai8ZJeZuKAaxeQXsJNZc72YHsVkEVCX2n3vADhEXlDg58wnYAlGBaInVny+A9QoLJEhs+fiL
	FWSZiMA5ZontE76wQ2yezijx+/lnsG3MAuISt57MZwKx2QS0Jb6vXwzWzSngIrH76mdGiBoz
	ia6tXVC2vMT2t3OYJzAKzkKyfBaSUbOQtMxC0rKAkWUVo2RqQXFuem6xYYFRXmq5XnFibnFp
	Xrpecn7uJkZwbGlp7WDcs+qD3iFGJg7GQ4wSHMxKIrwyR4pThXhTEiurUovy44tKc1KLDzFK
	c7AoifN+e92bIiSQnliSmp2aWpBaBJNl4uCUamDy8b30MWlx9Jbqb8F8X46lHrGav/UCe/bv
	CU0HpqR187ByClr1T/z7t93476eoySnxUmds/XoF238vW/sptoAp5uAVka7GR3rJps8ZvLjf
	qDaovhAs+8TLsJ6l11yOL3l+I+cyU40ErvsXmnvOPO48LHRqx4EHjvtEdp9UL42wmrfue7ng
	yngHu5qbU6eWuvRfUkrK8Mzq+yWSL3Doq9qhZfsldn1b4KyVrO3IdPNl0gEJqYhtEx8K386f
	sqgkaeuUn41v1+Uc25Sw5PfjO/vFpvDKFwp+ny1yg+Mx/1v2vW6M6twpO+N2tLmcb/vy9dKL
	ghYG4Tmzb3a/d7/gb3hpp0uX79G1J679LK3+fuGTEktxRqKhFnNRcSIARHhilhwDAAA=
X-CMS-MailID: 20231211022131epcas2p3830734b4574587c08762782bf0262e98
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231210133927epcas2p3e2633ad371b03d5ab19f9b44118fcb58
References: <CGME20231210133927epcas2p3e2633ad371b03d5ab19f9b44118fcb58@epcas2p3.samsung.com>
	<20231210133915.42112-1-krzysztof.kozlowski@linaro.org>


On 23. 12. 10. 22:39, Krzysztof Kozlowski wrote:
> ExynosAutov920 SoC wake-up pin controller has different register layout
> than Exynos7, thus it should not be marked as compatible.  Neither DTS
> nor Linux driver was merged yet, so the change does not impact ABI.
>
> Cc: Jaewon Kim <jaewon02.kim@samsung.com>
> Fixes: 904140fa4553 ("dt-bindings: pinctrl: samsung: use Exynos7 fallbacks for newer wake-up controllers")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
>

It is reasonable.

I will also fix this in v4 patch.


Reviewed-by:Jaewon Kim <jaewon02.kim@samsung.com>


Thanks,
Jaewon Kim


