Return-Path: <linux-gpio+bounces-17829-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 409BBA6A8FF
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Mar 2025 15:48:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A1A23BF1CA
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Mar 2025 14:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6D41E47B7;
	Thu, 20 Mar 2025 14:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="sDKs5kIF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19C71DEFE4;
	Thu, 20 Mar 2025 14:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742482104; cv=none; b=Nav6zE5IrWEgj2FU+fAsKx22Lb9AjRJZl+kls1up1QaeXMIEEyPoKQz6qWWLWdsz3CB29u6NvrtpeR/4+g9kW6W41TDBehMvkCNk5GVomw2/AHMu+PEqDMRWzijRBh3DgCFzFR8lTBV93SPnHMc/xGUoXncWIk5TXVI2IUPkob4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742482104; c=relaxed/simple;
	bh=zPezT8El2e4h3o7yjH4jTAgyKaMCD49/Uzh6Mq5DaW0=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=E9Pj88s3v1LPePbUlRhpBc0zH+foD2uu5Ha7Qe+AvPS0SfSBbAk4q1ELtLMqqmwxII9cRr8aCMX1HV2hhiaKKJtWBsDqFH67Pt1+vMPGeK1eEqKz9WXWqadCDskKT78+DmU8q9XmwRIJMMkar0I+e6M6M3j/ip6U9gPxrXqnNk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=sDKs5kIF; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1742482098; x=1743086898; i=markus.elfring@web.de;
	bh=DfZoeGXnC8fbARD3b+igjeNU0yxDHdtiopyfZfd2L6Y=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=sDKs5kIF7lvFISqdnWdsUo7Q19Yr3e3giqX4Kd+Ny2reakJb+vVULaV1qaWhI0Tu
	 RthkGZsbijtxlJyDdcrASbATnReAjT7dABuZhywMvK889TElkz+foEn6rk+MzO4AO
	 wn46oY30nC4acPUJNKZcA1w63FPWEkkqpeGgIy2ATA4SbqrKY5dkjkQtrNa7c9Ihp
	 KY35BD7uHZFWIhpplbziBQEDe0bya28G09Lk8tvPMTS1Af77c8H0PWfeSsTDT21BM
	 BYM5P5XLEgrTEUXaXK9SHyMBIv7FcKVCacBhBYvUIk3bsK4pzqgpUUVB1lFeNYuvS
	 byEsLCO9Rtr8/BF3ug==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.46]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MbTH3-1tKHcJ17hB-00aFwu; Thu, 20
 Mar 2025 15:48:18 +0100
Message-ID: <79b776fe-7fcf-4cf8-9d3f-bd5f4e66344e@web.de>
Date: Thu, 20 Mar 2025 15:48:16 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: vulab@iscas.ac.cn, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>
References: <20250318030717.781-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] pinctrl: at91: Add error handling for
 pinctrl_utils_add_map_mux()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250318030717.781-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Jv9YEG5A6IYdFMMjFJhbkMP4K6fj4hm+m/+jMG29jkDhR3DufXP
 fao5en0fLSRCMR/fTiyIrAEvL8JhX541DSKF9jUFjNoK+7fP9sLOI7F2fCxmPCo8nYt5rLb
 iN9GLL1Ll05eZG3hwdD3wOxiUXLVxNkujPeWB9TGvh4fTtdkQBtuEnqm4VSKt9umtB8GKit
 in295Z82kqqeJ5fjvZj8g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Icd6NZo/SxA=;bXndP2xuCTpikrk/MEyGXGzNVW0
 CneKGLPmvCp6YnKQTW2CXUHE16pLlTKUg3wFdKTaF8Z3ad0k1JzsvcvO0tAvi94y3CM91YiUs
 lK/2Fy0NI0ptapr73mJQ0y0mRC1MdZnRialJiLDXXBKUnRlMcqij8IA6pGlyM+hzf6q3dO6vM
 9ZAXV8X13Yg+7hKYqYkrc4/C8L68hxwxqbyGF2Kwln+Sb4OQppKMyL8Zib89wd3IW4Fzv58HA
 J4Erb+2POAnlvkpSzT2V1RuRoomtXdOE0Z5rL5lvkI2zEHQ4e5sF/mVEn7YCggfeLRKhhib7a
 LLIsQjd5NBLmbijxxGkVJbQGhkpVkjNANLSIHq361VEo0F4teKl4BMI0Va83HP/rjcgZvxo/U
 WJCWDAYxmf2r9rLkMmlvE0YbkGMPvFMY4OErCdPFpaNNrA4hqXIjS9vB3TZ+Nexd4+cyNkqp1
 s39zVmBlH16WDMlSRtf2IjC4LUsBTvxjQSNF722xGl2YoIbLEV0WKEhe0l3auvgf1Witqg3CQ
 T6MT1CcWRm1NmzNtbkvt297hCvbcu0Sx5d7Y9daEDCk4HjZUG+3i6DrKXGobkszQQR660AhMj
 WZoT5g8jv7IAr6aFGMDRPQUlW23nYY7eKupqLgGtozNOcTSWGdLyCfx/KLKK+hITqKdWKMeB7
 BbLQm4jPPpAYXpQkicl8qGGWhnmYw9gk5aq+/cDx/aTYluAsRVbdt+8iEHe3tbYHr8Ci+Qq9N
 pCcLelwn3AVIm6mPbi+uXbz8wluwHAbghf3KSVBs0sS3+IWLijJp17C8jOcfkZ8qLV1h9U9KM
 5Ypm+gcjjk3Wc1VWC/vG0aq6vXmTezAgkZ3Oa901yYMcVWUj86+nA0RwS6keXPYX9vqTyh0I3
 Gd028Egn4Y9Js810uzZ5k969hYGBZhd3NgV493D0XYtancDR/mrL+wXhMzvlC19S+8sr4DLBw
 WefoueVnGwekTd8C47aoqsSP/HiIv+a8v1rmvk4R6XWkzwUaEYdZA2Oo4MkBCn0q7GosHgdxs
 tJumdQKOPJzhfpfeeK95D/uKlpO0ol78aIi9UWrKJVmvNEveutmqiD2QG5/uxMwGO/bmE5/mP
 +yoj84Ol8yJYQ1LzXDaVY7b9mS0H7+8aM9TSHDtahKeKdn8F6yGsEtWdx4VIfxSvm+t1nW+J3
 JX1szufteAnz4358o5q7S+NoTeVMOfiJI4wqVgLZCz7bpZfb87lA/9BkunFFSGL8tzDPmok6/
 EiDMsn/5i5rLZAK1b4E1GfZ1w2L62yWh3wOeh33Kqa2aKCQBHsoDrQkV6NUnNNSjJcnbJOH0s
 lfWAJNQXZicbOvQR6bBzqJfB+kjjcxEwHABsLw87/mpBUP2zQiMoourAFq16A4aPxZ4IpDnmB
 UiKTN5mMnK1E+q4RnBFohs9XuBRwmaTCjaawqH/DBNimwgeSAY2NkO0B7G46ponZUBvt7rvCV
 lgWqrJ9HkKa5o7CtgnGOpwnGUqzZtOkDpWzjJHGv6xsTJPT1XB7KdTeNHei5u9QPy/hVqhQ==

> In atmel_pctl_dt_subnode_to_map(), the return value of
> pinctrl_utils_add_map_mux() needs to be checked, for the function
> will fail to associate group when the group map is full. =E2=80=A6

Please improve such a change description another bit.


> propagate the error code to caller function when the function fails.

                                                                call faile=
d?

How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/process/submitting-patches.rst?h=3Dv6.14-rc7#n145

Regards,
Markus

