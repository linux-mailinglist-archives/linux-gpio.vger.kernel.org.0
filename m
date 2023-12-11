Return-Path: <linux-gpio+bounces-1215-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4069A80C2F6
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 09:24:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE842280D1B
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 08:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14E820DC3;
	Mon, 11 Dec 2023 08:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="hywGTI6R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 116CFB6
	for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 00:24:42 -0800 (PST)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20231211082439epoutp0491e588ae0208c062bdd01942860eeac2~fuXEo5JrL0577305773epoutp04G
	for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 08:24:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20231211082439epoutp0491e588ae0208c062bdd01942860eeac2~fuXEo5JrL0577305773epoutp04G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1702283079;
	bh=1QHsgPv06bRps25jxYuFz/UImpThxn0lF7/XtP8wrO8=;
	h=Date:Subject:To:From:In-Reply-To:References:From;
	b=hywGTI6REwCiJgl5LvrLG+SrCKqn2Fd9b2fl1QzRoSSf9Dysfrg5pAf1e5h2cat5s
	 I7ChKDVaQk73kkrDDuOZLGjIQxNXjulrgQM9Iao959n7UWEMo3DZ7OJO64ixmhUfa2
	 ETPe9cbj5UDEYzrPrtYNRNuMlJQWwGJxrRwsVc78=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20231211082439epcas2p2541bfba26e777f97f5f530d988e5e19a~fuXEPI00A0332003320epcas2p2X;
	Mon, 11 Dec 2023 08:24:39 +0000 (GMT)
Received: from epsmgec2p1-new.samsung.com (unknown [182.195.36.68]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4SpZY26128z4x9Py; Mon, 11 Dec
	2023 08:24:38 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmgec2p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	26.B6.18994.647C6756; Mon, 11 Dec 2023 17:24:38 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20231211082438epcas2p2bedc2e4d9e640cac4832aecbdbcbbd4c~fuXDP6Xof0332003320epcas2p2P;
	Mon, 11 Dec 2023 08:24:38 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20231211082438epsmtrp1fe72969afb90d74c9bcf2cfc689c06df~fuXDO7iWu2131721317epsmtrp1g;
	Mon, 11 Dec 2023 08:24:38 +0000 (GMT)
X-AuditID: b6c32a4d-9f7ff70000004a32-69-6576c74685cf
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	69.CC.07368.647C6756; Mon, 11 Dec 2023 17:24:38 +0900 (KST)
Received: from [10.229.8.168] (unknown [10.229.8.168]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20231211082437epsmtip13574ccbcc7ea834f56fcc0fedefd9476~fuXC55wLW2620926209epsmtip1b;
	Mon, 11 Dec 2023 08:24:37 +0000 (GMT)
Message-ID: <4bc0bd93-130d-1293-eca6-46cf9ba85cd9@samsung.com>
Date: Mon, 11 Dec 2023 17:24:37 +0900
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
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Tomasz Figa
	<tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim
	Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
From: Jaewon Kim <jaewon02.kim@samsung.com>
In-Reply-To: <a441ca43-8631-4a6a-b828-6d744fce5aee@linaro.org>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFJsWRmVeSWpSXmKPExsWy7bCmua7b8bJUg/1fdSwezNvGZrFm7zkm
	i/lHzrFa7H29ld1iyp/lTBabHl9jtdg8/w+jxeVdc9gsZpzfx2TRuvcIu8XhN+2sFqt2/WF0
	4PHYOesuu8emVZ1sHneu7WHz2Lyk3qNvyypGj8+b5ALYorJtMlITU1KLFFLzkvNTMvPSbZW8
	g+Od403NDAx1DS0tzJUU8hJzU22VXHwCdN0yc4BuVFIoS8wpBQoFJBYXK+nb2RTll5akKmTk
	F5fYKqUWpOQUmBfoFSfmFpfmpevlpZZYGRoYGJkCFSZkZ7xvnMtecJu9YvOau4wNjDPZuhg5
	OSQETCSaty5j6WLk4hAS2MMo8W3JbGYI5xOjRNvy++wQzjdGiTd/f8C13Dp2GqplL6PEukkX
	mCCc14wSVw7OYAap4hWwk2jet58VxGYRUJVYPW8yO0RcUOLkzCcsILaoQLRE67L7YFOFBRIk
	tnz8BVbPLCAucevJfLChIgJnmCVmrbvNCJJgE9CW+L5+MVgRJ9CCW89WsUM0yEtsfzsH7HAJ
	gZUcEgeWvmWHuNVF4uWqFkYIW1ji1fEtUHEpiZf9bVB2vkTblTNQdo3ExgWXoOrtJRad+QkU
	5wBaoCmxfpc+iCkhoCxx5BYLxFo+iY7Df9khwrwSHW1CEI1qEvennoMGlozEpCMrmSBsD4nr
	D06wQcKqgUlizdkfbBMYFWYhBcssJO/PQvLZLIQjFjCyrGKUSi0ozk1PTTYqMNTNSy2HR3ly
	fu4mRnAi1vLdwfh6/V+9Q4xMHIyHGCU4mJVEeGWOFKcK8aYkVlalFuXHF5XmpBYfYjQFRtBE
	ZinR5HxgLsgriTc0sTQwMTMzNDcyNTBXEue91zo3RUggPbEkNTs1tSC1CKaPiYNTqoFJ6tVC
	W1/XrIuT5xhx3H3StYlzzteiU+/kDCQb58c4XQ9nkAvfn+V67ci7TweYAualBk5s6Xxnub1/
	zuodel/FhCZMV89r/5Xpw+ISmhLzQ616x0Gjg5qJftNe2THd9dFybfcw+no5xJnVwLbggfux
	zweXZmpX/H+/UIXjReq9N8knVhxr59jC/L+tWmT7/+8vhDuUl0wwux0kLmNfrqppG/+2xDlM
	4OHP/DmbbOdHhepotG9dvyo2/pm39q3Dl/sCHHRk/dge7/9wy3Dll7vtm9PvP1G6sEd6Oft/
	TnttZQOuij07k82NF65imDrzgMkmtuObQxSl+zie+C4U2RknpVk1+etZx5u6AjuDf65QYinO
	SDTUYi4qTgQA4h2jgE0EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeLIzCtJLcpLzFFi42LZdlhJTtfteFmqwdTtfBYP5m1js1iz9xyT
	xfwj51gt9r7eym4x5c9yJotNj6+xWmye/4fR4vKuOWwWM87vY7Jo3XuE3eLwm3ZWi1W7/jA6
	8HjsnHWX3WPTqk42jzvX9rB5bF5S79G3ZRWjx+dNcgFsUVw2Kak5mWWpRfp2CVwZ7xvnshfc
	Zq/YvOYuYwPjTLYuRk4OCQETiVvHTrN0MXJxCAnsZpTomnKHESIhI7H8WR9UkbDE/ZYjrBBF
	LxklXn07zQSS4BWwk2jet58VxGYRUJVYPW8yO0RcUOLkzCcsILaoQLTE6s8XwGqEBRIktnz8
	BWYzC4hL3HoynwlkqIjAOWaJ7RO+sENsaGCS2Pj3H1g3m4C2xPf1i8E6OIG23Xq2ih2i20yi
	a2sXI4QtL7H97RzmCYyCs5Asn4VkySwkLbOQtCxgZFnFKJlaUJybnptsWGCYl1quV5yYW1ya
	l66XnJ+7iREcXVoaOxjvzf+nd4iRiYPxEKMEB7OSCK/MkeJUId6UxMqq1KL8+KLSnNTiQ4zS
	HCxK4ryGM2anCAmkJ5akZqemFqQWwWSZODilGphm3q3yNO5h2Lld+/rUs4l2O6+s0Wa+3eEZ
	uNCvKzD12fMpgn3he+W7V/00kK/8ticsWWVC+tbplwL+HjjJxOP41fe6ia/AAc7dJe98rgu3
	5QWWLs0MSnxp/4v5Xfe69lK/CV2KD0/O/DBp2U2eDc/L9edeW6bOqhIeFdM04RjjApUF2jPf
	M250i7o7s2pn7pm/lx4UFiXXpD5/8qHtTM38378ztHLOP5S8vV6g+0uo2X/7M21ceVInzllO
	TmWNyBEyC+Y95KlTFHL25KLbK98cCWm5qtQcqv3bqErssoxT35l4Ze4VKzwrtto2HFE5cqVy
	/SM1F7+nhk29fq8bwzNyhZmXBLyy1Wt5H2pSLKjEUpyRaKjFXFScCAAJSu7WHQMAAA==
X-CMS-MailID: 20231211082438epcas2p2bedc2e4d9e640cac4832aecbdbcbbd4c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231210133927epcas2p3e2633ad371b03d5ab19f9b44118fcb58
References: <CGME20231210133927epcas2p3e2633ad371b03d5ab19f9b44118fcb58@epcas2p3.samsung.com>
	<20231210133915.42112-1-krzysztof.kozlowski@linaro.org>
	<c63bd0b3-ecb2-d4c6-2147-43f19c1dcfee@samsung.com>
	<a441ca43-8631-4a6a-b828-6d744fce5aee@linaro.org>


On 23. 12. 11. 16:34, Krzysztof Kozlowski wrote:
> On 11/12/2023 03:18, Jaewon Kim wrote:
>> On 23. 12. 10. 22:39, Krzysztof Kozlowski wrote:
>>> ExynosAutov920 SoC wake-up pin controller has different register layout
>>> than Exynos7, thus it should not be marked as compatible.  Neither DTS
>>> nor Linux driver was merged yet, so the change does not impact ABI.
>>>
>>> Cc: Jaewon Kim <jaewon02.kim@samsung.com>
>>> Fixes: 904140fa4553 ("dt-bindings: pinctrl: samsung: use Exynos7 fallbacks for newer wake-up controllers")
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>>
>> It is reasonable.
>>
>> I will also fix this in v4 patch.
>>
>>
>> Reviewed-by:Jaewon Kim <jaewon02.kim@samsung.com>
> Please send correct tags so I won't need to manually fix them. Otherwise
> they get ignored by b4.

Thanks Krzysztof

I miss space. I will check it again next time.

>
> Best regards,
> Krzysztof
>
>
>

Thanks

Jaewon Kim


