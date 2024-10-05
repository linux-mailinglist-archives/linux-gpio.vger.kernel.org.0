Return-Path: <linux-gpio+bounces-10884-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E28BF991A02
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2024 21:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3E2C283C9D
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2024 19:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05A15165F0C;
	Sat,  5 Oct 2024 19:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="Rcq6fl2p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF061591F0;
	Sat,  5 Oct 2024 19:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728157293; cv=none; b=AlX/TsYex+Bf38pfo/8KI9k2VZH1VPXcfbE9AjIOH/V36T8+vX1oqLDN1pjZqrxs25yo69/pfeuimIz+ov7og5Txi8KotFjDcqmtt5MudO0h/CcDzmWRlybuQnKHHaEkznr/fKXD3exwxRXb28uE0b42kKhuQRNV7Gl+m60qX5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728157293; c=relaxed/simple;
	bh=5/mlGNpKWGd8P3BfSYQCQt94OxGRd/Z0qeF6JMGaNLA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=h6iNY1q/csZp7LfggfHZvxrFOLsfGtADejJXTlm1u1HWO+GNwOEyZIlbSwLXrlJLZHNTBAZlg3fEjKpyzPbxj+jfITSVkGtekDbnXfFT+9fg4wKcXsO+OjITJJZwD2r/kkhcZ4qjroFsx2xc/5BTF2BME7pwLmT7tZ8bnXeXhAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=Rcq6fl2p; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1728157263; x=1728762063; i=frank-w@public-files.de;
	bh=/S92lqZ+xKzudktcR1TIbH6b3CrdaorM7C9RekZJKKg=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Rcq6fl2pxDHUtCy+uA1Pq9vOrpMZyxG5t9WbycQXnx1KEo59BEjpQ4vjZqcGLp1v
	 qseU5mOd+rwb4yxwzANLw+1idfg6EQWWkQyhLZjKi0XlC6l4UfqAqSOJo4uepLx+f
	 KOGsXbbcBBA7f0meuHNz5JS8I5LYDMTXDY5F8u88aREVN1X5dDdhychdxyt4X5Lgv
	 tPU6qL9mxFSSTQHB7DJNfg0F5E3zGtsZe9KMwlTDpeSXR5jUoXug3Q1n6Fzah+xq/
	 hh4Qx4Bnim7k97wPymCOR13f8ikjzVNGdfYL7dtIWTulq2PwQPlSbC6AfLlbScH2n
	 AKVXx7k8iUPycvi8kA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([157.180.224.66]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNbox-1tLheG2EHL-00K4Qk; Sat, 05
 Oct 2024 21:41:03 +0200
Date: Sat, 05 Oct 2024 21:41:02 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: Rob Herring <robh@kernel.org>, Frank Wunderlich <linux@fw-web.de>
CC: Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sean Wang <sean.wang@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 daniel@makrotopia.org, john@phrozen.org, ansuelsmth@gmail.com,
 eladwf@gmail.com
Subject: Re: [PATCH v1 3/4] dt-bindings: pinctrl: add binding for MT7988 SoC
User-Agent: K-9 Mail for Android
Reply-to: frank-w@public-files.de
In-Reply-To: <20241005184449.GA505893-robh@kernel.org>
References: <20241004123423.34519-1-linux@fw-web.de> <20241004123423.34519-4-linux@fw-web.de> <20241005184449.GA505893-robh@kernel.org>
Message-ID: <DA1815FE-D2A6-46A3-9219-9216A3C6D61A@public-files.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1udbzqpUdFVIpiIicrJzHxwKDVUEDEWlPS/trJexjGU2JwVQinR
 jcKUU1vqCkbp2yqhWSERVNkmY49KqrJiW0UesMFJuPin27oMEg6zeb9p7vXzmowGmAmgpb8
 WVVw3Zi9NFXoDOYUEJaOajBWTovF1v4KPjITrTZnQdcqMVloSz41ONTTyauwJ4rW2ZH5Z10
 zZiNL2ocf96lwcrRoYhCQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Lm4FPeXICZQ=;WUM3CLu+SvTk5DI584TEBteumXK
 yASSxAJ2eu9xXpdntD1g05Ef47LQ+uLEANjrdHrje0gmwJZKHZvpEr9BhHTrlrbMmEpLM6ioE
 /KHW+QJ8hd5hM1rDZqttNLLpC71quoYe4Hg36F/6PucW4owRP+7TM0HgNl5Z3UatXA1jHNkiJ
 wBR85l4fEA7lLMk8/CgZ8jF8zSmFHkvkjgBqS5ijhXmM3+od/tY1O7D+cTCJLnhc69l8TAEmy
 sdFv7ZcmR4fAsMhFGpXusYT+GBK7gIdpWUhofMzKGYGP4aPfddYGDOmy4fNW6I7Lw0YQVkrXW
 yDkxCYCuYtHGfONiTNcNeHDFhSRsYvP3Lt/u+NkLjEcP1XrNapGGFiS20d1M1kVbGDrmf1osJ
 ctmSOiijyBBfXj0I+hABK4Jca9zARsuS6RAR/9Z93PKdwfgcEOgllZ8vor385l2FirCcoNvF7
 OuePPkJdt0m0R9hAuidmEQMZsq851vD/M3iz0BzxdXOxJSJ8sZpGqxmCZJNBe7BeDXYRmdKtx
 Qh88eeRTQdsqGZFpm3vkyq+55QHp2MqOPg8aQfQG33Bh0SDmMBDQJAGu5seZtjIdZKECOxUqA
 9Atsewvv8DB0BixgfrmS6PVUvSy+c82OgXLq8p1pDOTq0B5SfL4WXRkLMKgoPcdYF6XyNAA5B
 CnT6hdsrz3h471H4jUWx0/QA5VWX8AnUcJgmRqIDBMx2PzRS0w7cvazL8l58RSX46OVRP+UbY
 tfL3yopolckDaacpQ+0/Fgtch9cGDkVRkSrtP2ge09PDZR62yKXf+l2aCUUv8M3MJXLqGqEWV
 iNV+xswODDau9gGb1a240gxg==

Hi Rob

Thank you for first review

Am 5=2E Oktober 2024 20:44:49 MESZ schrieb Rob Herring <robh@kernel=2Eorg>=
:
>On Fri, Oct 04, 2024 at 02:34:17PM +0200, Frank Wunderlich wrote:

>> +patternProperties:
>> +  '-pins$':
>> +    type: object
>> +    additionalProperties: false
>> +
>> +    patternProperties:
>> +      '^=2E*mux=2E*$':
>
>Do you really need 'mux' anywhere in the name?
>
>> +        type: object
>> +        additionalProperties: false
>> +        description: |
>> +          pinmux configuration nodes=2E
=2E=2E=2E
>> +      '^=2E*conf=2E*$':
>
>Really need 'conf' anywhere in the name?=20
>
>> +        type: object
>> +        additionalProperties: false
>> +        description:
>> +          pinconf configuration nodes=2E
>> +        $ref: /schemas/pinctrl/pincfg-node=2Eyaml

mux and conf are used to match subnodes see example for mdio0_pins

mdio0_pins: mdio0-pins {
  mux {
    function =3D "eth";
    groups =3D "mdc_mdio0";
  };

  conf {
    pins =3D "SMI_0_MDC", "SMI_0_MDIO";
    drive-strength =3D <MTK_DRIVE_8mA>;
  };
};

This is same as done for previous SoC like mt7986=2E


regards Frank

