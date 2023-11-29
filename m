Return-Path: <linux-gpio+bounces-635-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4480F7FCF21
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 07:32:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 286A0282293
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 06:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDDE56FD1;
	Wed, 29 Nov 2023 06:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="IqcFh7lP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1793A19AB
	for <linux-gpio@vger.kernel.org>; Tue, 28 Nov 2023 22:32:39 -0800 (PST)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20231129063237epoutp03cb1f0bdb0ee51750b7ce46220e701255~cBF0rggXe0981809818epoutp03b
	for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 06:32:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20231129063237epoutp03cb1f0bdb0ee51750b7ce46220e701255~cBF0rggXe0981809818epoutp03b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1701239557;
	bh=jbXIcm4Zl3g3KDRXg/oE73AVX6okTU2GFFeps8n2Aqo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IqcFh7lPDZZmlADH9LDBeIrQRCAtaB1vcFY8qlfS66i+sSCSJ9F+0bZgz8oDQtSkT
	 imOuGSmo3+O8KhQ95pDMTu0nK/VDr6R6u4lNuzjGfdPmziQND3xBvRqike7Ur8YyUz
	 o53DfWSzr5YPjWjojIWbbE0Wgfx1gDQrP2gV4osQ=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20231129063236epcas2p380a6b2e72371b96509168282bf744f2d~cBF0PMlIY1714217142epcas2p35;
	Wed, 29 Nov 2023 06:32:36 +0000 (GMT)
Received: from epsmgec2p1-new.samsung.com (unknown [182.195.36.98]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4Sg8dJ3K86z4x9Pv; Wed, 29 Nov
	2023 06:32:36 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmgec2p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	9E.67.18994.40BD6656; Wed, 29 Nov 2023 15:32:36 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20231129063235epcas2p32dfa05b1c137c8bb40cef1090c8fb855~cBFzIkjO71714217142epcas2p30;
	Wed, 29 Nov 2023 06:32:35 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20231129063235epsmtrp28cdb35ff8ec7cbf9a67dfda5e6c3ef3c~cBFzHvaL42573425734epsmtrp2l;
	Wed, 29 Nov 2023 06:32:35 +0000 (GMT)
X-AuditID: b6c32a4d-9f7ff70000004a32-64-6566db04fe97
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	F0.47.08755.30BD6656; Wed, 29 Nov 2023 15:32:35 +0900 (KST)
Received: from perf (unknown [10.229.95.91]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20231129063235epsmtip11c7f7982909a860d1365499c9c6f6ba3~cBFy8o8RE2155121551epsmtip1t;
	Wed, 29 Nov 2023 06:32:35 +0000 (GMT)
Date: Wed, 29 Nov 2023 16:07:40 +0900
From: Youngmin Nam <youngmin.nam@samsung.com>
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: tomasz.figa@gmail.com, krzysztof.kozlowski@linaro.org,
	s.nawrocki@samsung.com, alim.akhtar@samsung.com, linus.walleij@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: samsung: add irq_set_affinity() for non
 wake up external gpio interrupt
Message-ID: <ZWbjPIydJRrPnuDy@perf>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAPLW+4n0SAOTb6wocY-WjkxgSFMbx+nVuqdaPcNYVDsbfg+EfA@mail.gmail.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBJsWRmVeSWpSXmKPExsWy7bCmuS7L7bRUg5e/xCwezNvGZrH39VZ2
	iyl/ljNZbHp8jdVi8/w/jBaXd81hs5hxfh+TxeE37awWz/uArFW7/jA6cHnsnHWX3ePOtT1s
	HpuX1Hv0bVnF6PF5k1wAa1S2TUZqYkpqkUJqXnJ+SmZeuq2Sd3C8c7ypmYGhrqGlhbmSQl5i
	bqqtkotPgK5bZg7QUUoKZYk5pUChgMTiYiV9O5ui/NKSVIWM/OISW6XUgpScAvMCveLE3OLS
	vHS9vNQSK0MDAyNToMKE7Ixjs9pYC45LVxxd2cncwPhbpIuRk0NCwERi//W5LCC2kMAeRokj
	WzQh7E+MEq9nO3cxcgHZ3xglNjzqZ4NpeDS5lwkisZdRovfXThYI5yGjxN3+ycwgVSwCqhLb
	ft1lB7HZBHQltp34xwhiiwjoSayb+YodpIFZoJdJYv3MFiaQhLBAlsSdjd1gd/AKKEss+fiX
	GcIWlDg58wlYnFMgUOJ5yxWwbRICUzkk9h9fwARxk4vErImnoGxhiVfHt7BD2FISn9/thbo7
	W2L1r0tQ8QqJ9ns9zBC2scSsZ+1g1zELZEi8eXAQyOYAiitLHLnFAhHmk+g4/JcdIswr0dEm
	BNGpJvFrygZGCFtGYvfiFVATPSSeTd7EDgmUW0wSFxb8Z57AKDcLyTuzkGybBTSWWUBTYv0u
	fYiwvETz1tnMEGFpieX/OJBULGBkW8UolVpQnJuemmxUYKibl1oOj+/k/NxNjOAkq+W7g/H1
	+r96hxiZOBgPMUpwMCuJ8Op9TE4V4k1JrKxKLcqPLyrNSS0+xGgKjKuJzFKiyfnANJ9XEm9o
	YmlgYmZmaG5kamCuJM57r3VuipBAemJJanZqakFqEUwfEwenVANTlfnXEhm2yylP1l/I0lco
	2zdtk55snbtvmKy1QsPMM5ZXr60tU+iTsZuYuMf2Y6O7dfDRg28iXXP6Ot6U39H5eSOPtSFu
	zWUG150JAt/5DKdf2JWVGL7L2Wy3+CyuUIU/bBYVvpVP4036Pdes//iCO79yb/ynSIUq89oD
	eWwaQpuu/WYwCPnOdv5xy9r7jImLnr5J+zDTQcFo3ZoLFUvCY65mZ++r1NPYynUi7cKlsPeZ
	PPparqaBSgJHSnMEIxoD3j/59NZ9R6TtozXG95qS/8VFrZz/bJ3+jB0BDz5aK5XNjblvLRHs
	I2xwVFBGbPP+PR/urbrGtnrJDpWNnT+qQlYf5PCvfr/575qnf7OVWIozEg21mIuKEwEB5ua6
	OwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBLMWRmVeSWpSXmKPExsWy7bCSnC7z7bRUg8OrtCwezNvGZrH39VZ2
	iyl/ljNZbHp8jdVi8/w/jBaXd81hs5hxfh+TxeE37awWz/uArFW7/jA6cHnsnHWX3ePOtT1s
	HpuX1Hv0bVnF6PF5k1wAaxSXTUpqTmZZapG+XQJXxpG2U6wFLyUq5izewd7AuFOoi5GTQ0LA
	ROLR5F6mLkYuDiGB3YwSk4++YYFIyEjcXnmZFcIWlrjfcoQVoug+o8THtX/ZQBIsAqoS237d
	ZQex2QR0Jbad+McIYosI6Emsm/mKHaSBWaCfSeL9rg9gRcICWRIPH54Ha+YVUJZY8vEvM4gt
	JHCHSWLdgRqIuKDEyZlPwK5gFlCX+DPvElANB5AtLbH8HwdEWF6ieetssFZOgUCJ5y1XWCYw
	Cs5C0j0LSfcshO5ZSLoXMLKsYpRMLSjOTc8tNiwwzEst1ytOzC0uzUvXS87P3cQIjhwtzR2M
	21d90DvEyMTBeIhRgoNZSYRX72NyqhBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFe8Re9KUIC6Ykl
	qdmpqQWpRTBZJg5OqQamddxbglINN11U/GC0yfnWunqvnH21X2+xHL8X91dhkjZzfZYer/DS
	52vqX7Hq/1p0f6Pu+W1sC1fsOOipstg9ubTAeF/Mwd+sy844KcomO/DzMW3Yfb2z+aPhKf2o
	pskWYrJOq4u8uDLExcytvM82qXt6MtZuLZkWpOt803pJxxSjjamuSz7sev9n7bTH5xZ8OuLr
	t+6uiTGboNj5q8/yr9YrJXEsfv4p6TBXi9gN9sn67J+O7Ze0uRmwMXbxM/eyVa8KHCuSgk0Z
	fqR1Zs0r2bVEMc90yqra5f9V5ylMWbVNcbmAmrgmk0k1732LLyeWsM77c6NvReAG1V72nA0/
	Jhqd/H8qLkj31J2cih1JSizFGYmGWsxFxYkAjP15HAsDAAA=
X-CMS-MailID: 20231129063235epcas2p32dfa05b1c137c8bb40cef1090c8fb855
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----OVq5TT9zsDSQAN86dWjJc6zPY8CEKIwxCZDtRM.ioT5ZEg4T=_35b7f_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231126091120epcas2p4a1320e3b0f9be8f8a0f575a322981d38
References: <CGME20231126091120epcas2p4a1320e3b0f9be8f8a0f575a322981d38@epcas2p4.samsung.com>
	<20231126094618.2545116-1-youngmin.nam@samsung.com>
	<bb738a6b-815d-4fad-b73f-559f1ba8cd68@linaro.org> <ZWU75VtJ/mXpMyQr@perf>
	<1fd55b36-0837-4bf7-9fde-e573d6cb214a@linaro.org>
	<CAPLW+4n0SAOTb6wocY-WjkxgSFMbx+nVuqdaPcNYVDsbfg+EfA@mail.gmail.com>

------OVq5TT9zsDSQAN86dWjJc6zPY8CEKIwxCZDtRM.ioT5ZEg4T=_35b7f_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

On Tue, Nov 28, 2023 at 03:35:53PM -0600, Sam Protsenko wrote:
> On Tue, Nov 28, 2023 at 1:29 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On 28/11/2023 02:01, Youngmin Nam wrote:
> > > On Mon, Nov 27, 2023 at 10:54:56AM +0100, Krzysztof Kozlowski wrote:
> > >> On 26/11/2023 10:46, Youngmin Nam wrote:
> > >>> To support affinity setting for non wake up external gpio interrupt,
> > >>> add irq_set_affinity callback using irq number from pinctrl driver data.
> > >>>
> > >>> Before this patch, changing the irq affinity of gpio interrupt is not possible:
> > >>>
> > >>>     # cat /proc/irq/418/smp_affinity
> > >>>     3ff
> > >>>     # echo 00f > /proc/irq/418/smp_affinity
> > >>
> > >> Does this command succeed on your board?
> > >>
> > > Yes.
> >
> > Hm, fails all the time one mine.
> >
> 
> I tried to test this patch on E850-96, and an attempt to write into
> smp_affinity (for some GPIO irq) also fails for me:
> 
>     # echo f0 > smp_affinity
>     -bash: echo: write error: Input/output error
> 
> When I add some pr_err() to exynos_irq_set_affinity(), I can't see
> those printed in dmesg. So I guess exynos_irq_set_affinity() doesn't
> get called at all. So the error probably happens before
> .irq_set_affinity callback gets called.
> 
> Youngmin, can you please try and test this patch on E850-96? This
> board is already supported in upstream kernel. For example you can use
> "Volume Up" interrupt for the test, which is GPIO irq.
> 

I intened this affinity setting would work only on *Non* Wakeup External Interrupt.
The "Volume Up" on E850-96 board is connected with "gpa0-7" and
that is Wakeup External interrupt so that we can't test the callback.

I couldn't find out a pin for the test on E850-96 board yet.
We can test if there is a usage of *Non" Wake up External Interrupt of GPIO
on E850-96 board.

Do you have any idea ?

Thanks

> > >
> > >>>     # cat /proc/irq/418/smp_affinity
> > >>>     3ff
> > >>>     # cat /proc/interrupts
> > >>>                CPU0       CPU1       CPU2       CPU3    ...
> > >>>     418:       3631          0          0          0    ...
> > >>>
> > >>> With this patch applied, it's possible to change irq affinity of gpio interrupt:
> > >>
> > >> ...
> > >>
> > >> On which board did you test it?
> > >>
> > >>
> > > I tested on S5E9945 ERD(Exynos Reference Development) board.
> >
> > There is no such board upstream. How can we reproduce this issue? I am
> > afraid we cannot test neither the bug nor the fix.
> >
> > >
> > >>> +   if (parent)
> > >>> +           return parent->chip->irq_set_affinity(parent, dest, force);
> > >>> +
> > >>
> > >> I think there is a  helper for it: irq_chip_set_affinity_parent().
> > >>
> > >>
> > >
> > > The irq_chip_set_affinity_parent() requires parent_data of irq_data.
> >
> > Hm, so now I wonder why do we not have parent_data...
> >
> > > But when I tested as below, exynos's irqd->parent_data was null.
> > > So we should use irqchip's affinity function instead of the helper function.
> > >
> >
> >
> >
> > Best regards,
> > Krzysztof
> >
> 

------OVq5TT9zsDSQAN86dWjJc6zPY8CEKIwxCZDtRM.ioT5ZEg4T=_35b7f_
Content-Type: text/plain; charset="utf-8"


------OVq5TT9zsDSQAN86dWjJc6zPY8CEKIwxCZDtRM.ioT5ZEg4T=_35b7f_--

