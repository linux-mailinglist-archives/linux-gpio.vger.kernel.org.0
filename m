Return-Path: <linux-gpio+bounces-10903-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F54F991F49
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2024 17:13:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B819282289
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2024 15:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7861714B95E;
	Sun,  6 Oct 2024 15:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="IXatiKC9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0252374C;
	Sun,  6 Oct 2024 15:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728227609; cv=none; b=AiSzlREHP+r7Pttvijq4gkEGd6TawqGDecFClkrXOlxyZuffaiADrMmqA7IGBe2nLBoO6haAIKSPGbu00+NyFTruQ/eGX/66woeCmxRAc0uLMxYzrvRipbr+Mi+Ho887QvclsDLfrioowJEmcwkD57/pf9WOZxF8W7huMx8mz8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728227609; c=relaxed/simple;
	bh=11Hk/2LhEq2qh8DTcSNETkAlcbZwrrfWbu0XCuGnJDo=;
	h=MIME-Version:Message-ID:From:To:Cc:Subject:Content-Type:Date:
	 In-Reply-To:References; b=mSG1WVBtOuIMhDEan2R9Lt5UxhnTJFZFrD9QAf+XCOwuA2xvfv37KRVCzX5q23odOA9BK6ZmPFR6y6rWNm2SA9JEKvJGbqxTIdPmFwpr+4okZqx7dMkyqbyT3NTczVMXgsUPMVHjhLBcpe3JpNqEemDWVs5KFhA9IF/YdoIUd3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=IXatiKC9; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1728227587; x=1728832387; i=frank-w@public-files.de;
	bh=hvp+E/UAnu6woBEMc62+rv/GUAvXO/LstybZIGTGROE=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=IXatiKC91XmdlgblPrnw5PNRV193547gYqACus0BQvCuzfExHNG+XUY/Fw9IjG9w
	 g1z3djflsnEJRST9chWPFfjFCkQ6DKDJdx5k/BuNQww2LDQy0EI3E5gPcL71ZgHqV
	 Wy/fJUs4idyUmlKXlq2J7PCzaq/gstZBYi2eTy9pgqbv7K/mWEStIGlDq/JeAGYph
	 KqJVMl6rkRbkgmOHHWi8mWKsZv0adi/LnDwpLGODORQ/Cs4rGZabkKfvRKrlNDG8r
	 IcIGgICV+w44oHthLKb1OGghpfN5liZqgzW9MWGdIreuke2y3kQURmIQ61X8Uq2JL
	 DP6WvMu4KRft43n5XA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.153.101] ([217.61.153.101]) by web-mail.gmx.net
 (3c-app-gmx-bs41.server.lan [172.19.170.93]) (via HTTP); Sun, 6 Oct 2024
 17:13:07 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <trinity-7314f935-72cc-4f2f-9184-0c19c147b2a0-1728227587807@3c-app-gmx-bs41>
From: Frank Wunderlich <frank-w@public-files.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Frank Wunderlich <linux@fw-web.de>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 daniel@makrotopia.org, linux-gpio@vger.kernel.org, john@phrozen.org,
 eladwf@gmail.com, ansuelsmth@gmail.com
Subject: Aw: Re: [PATCH v1 1/2] dt-bindings: mmc: mtk-sd: Add mt7988 SoC
Content-Type: text/plain; charset=UTF-8
Date: Sun, 6 Oct 2024 17:13:07 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <4pmhzc5sf2c7dww3tihyqq5coco6u5nx7xvtqami7u55442gij@mqvyvqrpa6ft>
References: <20241006102154.17087-1-linux@fw-web.de>
 <20241006102154.17087-2-linux@fw-web.de>
 <4pmhzc5sf2c7dww3tihyqq5coco6u5nx7xvtqami7u55442gij@mqvyvqrpa6ft>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:CTdBPjZOMMsYISKc7AhsidebqUXN8P2MyreSQ7CvV+Q2mDrZs+E4pwsypQTkLg6ohgj2G
 lNXnUMp5BvYpuHMf3wwYFFMSVFy40DjbYl55PGX6ibEecNe/w5Bfi/lTvhVbLKgNKfT4cycoTcUF
 INoYB/BWUokQ+W6hh6Nc7Vt2X/W7ICeGCaYEkoKhTVDT+StfWGLWKMC4+zJ+JbPECDy2JgWc15H+
 dH5wEra4xsfm5Xq5UjDRMsCD+TdQGlmryvZE5746HRzC0r9SAMbNEtJH+QQ00/rkOAasGJ/yAr0S
 qU=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:13PIiWXd4Mk=;1bOKWLxSe6Uw4YXhgtLlNVXLORD
 WxQ97gsEEjcJDu4G52scILcjXnBB5ithJ8no5uLU9S59R020pfdv7NZGAw64FJSfBwrPJBkBb
 JYazdnTQgrhbcRD75JoUavzWRJt+YaFW2lqwiN1jXU2Icj+SrjSDtkNTMwDZ0NdX9GI68kYKZ
 apOjMkF2+eDfq7GzmQPbgTcq8oLKwYXYJFsj03MwNktin0XU7891pU+1Zfa9m/PNLvyowIz7w
 ubLvTzr+aSP4d7WiLgpgdMUrU/ceMWg1DZAWpL03UwkxuZHUw/4yVAHv3THyN8kptg2i8a2+P
 XN47xue2eV5+u7W6nDe0g1OxxmgsiQFIEMA0L5hGYk87Qn6rJ6Y1HjEYXYr8vtyRQuYjWEQ1q
 D4XnD8zRkRn2XmiNX71+P1EvV8HeeWNTNPzYIXyDH2x/tycVyVh3xU99f4wKrMQ/f+KrkVPs2
 5fnGRqTOgQ9ZYXiL+cxVYDfplw8QdHHB9WpZiLM/xruCiOtswKk3mtEi4WgZtnbIK48egB0uV
 pkvQoWKvAfaNxo8QZRT/rjf01S2mksUFzca4CaMZdTBXsMkSH1szGC9/DpP2AqlmDRujz3UeW
 ntwBlnBFT2fyENLfKjjCtgThWkO2ENOS9cetKRmKgpfgEOm9q1CSfM8pY61stVu6ZeGEOGd5p
 nb0FNXWOor6vpK/+oc+eyQ4GHf43xyGJ02x7TcRp0A==
Content-Transfer-Encoding: quoted-printable

Hi

> Gesendet: Sonntag, 06. Oktober 2024 um 14:47 Uhr
> Von: "Krzysztof Kozlowski" <krzk@kernel.org>
> An: "Frank Wunderlich" <linux@fw-web.de>
> Betreff: Re: [PATCH v1 1/2] dt-bindings: mmc: mtk-sd: Add mt7988 SoC
>
> On Sun, Oct 06, 2024 at 12:21:48PM +0200, Frank Wunderlich wrote:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >
> > Add binding definitions for mmc on MT7988 SoC.
> >
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > ---
> >  .../devicetree/bindings/mmc/mtk-sd.yaml       | 24 ++++++++++++++++++=
+
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Docum=
entation/devicetree/bindings/mmc/mtk-sd.yaml
> > index c532ec92d2d9..db7d1c570aea 100644
> > --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > @@ -21,6 +21,7 @@ properties:
> >            - mediatek,mt7620-mmc
> >            - mediatek,mt7622-mmc
> >            - mediatek,mt7986-mmc
> > +          - mediatek,mt7988-mmc
> >            - mediatek,mt8135-mmc
> >            - mediatek,mt8173-mmc
> >            - mediatek,mt8183-mmc
> > @@ -263,6 +264,29 @@ allOf:
> >              - const: bus_clk
> >              - const: sys_cg
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - mediatek,mt7988-mmc
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 3
> > +          items:
> > +            - description: source clock
> > +            - description: HCLK which used for host
> > +            - description: Advanced eXtensible Interface
> > +            - description: Advanced High-performance Bus clock
>
> Why ahb is optional?

sorry, my fault, forgot to change the minitems property after copy the blo=
ck

> Best regards,
> Krzysztof


