Return-Path: <linux-gpio+bounces-28342-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3113C4BBCD
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 07:53:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 555CB1887EE3
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 06:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42DA531A06C;
	Tue, 11 Nov 2025 06:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="lnZ71E9S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9042741AC;
	Tue, 11 Nov 2025 06:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762843944; cv=none; b=qUm4VRvVNREbkI1D9KHhHpcRn6RljlfZMpbnPe+Bf5fRqM4DZZphKnMOyoRnQ6OA4jIhLi+SwwPX/AJEpC9mPWkt5uEZlpKlw6wtdM/vD6I3DwUQX8vM6Ji/bsdslDFmFVuKaixOSdc5JOo9tzOS15xFw3/dJYD8tW64IduJJN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762843944; c=relaxed/simple;
	bh=wh4Kz4Mtx4GbaG4qrRJBIRrF2W1tDBfuMg0z9ciBQgQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=uC4DlrxXTHMFJYCEkNrcaYQVZ7O4LL6I50NnVyH8TjzA9GARtHWY+SA7pRzHKsEtHn1TbaVaVA6t3SJXN/fRN+1GXkwjwdmED6lWpC+hMcobJkBP/jLbvorUGJJI1ztUQ2xoszltQ7fma8waN+m4ompEcLV83fRdUvWYsSC2RqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=lnZ71E9S; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1762843918; x=1763448718; i=frank-w@public-files.de;
	bh=wh4Kz4Mtx4GbaG4qrRJBIRrF2W1tDBfuMg0z9ciBQgQ=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=lnZ71E9Shu1JaXwEJS/Rv390+MZc6LpExzCncCdlUOj5KNyA6gNMhQXr7jL0+1mU
	 Pn3WxlS2Prr4gIxPPG3Iq6zb1WvPWoeP9om5PbTz6XbRJJe1iRLsIsWrmJZgUsKI5
	 AnwS/+KTc1JEa5Za0QFusCuK++F7fl5TIoLOZ7Hpn0v6jx1oo6VrO9TpbKtK3HbYX
	 lwxq2950uDSPhgxUfgFU639W5Bm1X/F/jGZCuS3B/GsEMsyrFVN2RKFRT5e0ZWVl0
	 m/HqM3xIf3CzcfrWJ5OmtsZrYq8hYrbZ007mw3zCJs0ziWPVmyr3VdVH2goyIl+SP
	 EXbxuhLRoZyCZDM8kQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ehlo.thunderbird.net ([80.245.79.191]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M4b1y-1vJGCB28Oc-00BR7y; Tue, 11 Nov 2025 07:51:57 +0100
Date: Tue, 11 Nov 2025 07:51:52 +0100
From: Frank Wunderlich <frank-w@public-files.de>
To: Linus Walleij <linus.walleij@linaro.org>, Frank Wunderlich <linux@fw-web.de>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 AngeloGioacchino Del Regno <angelogiocchino.delregno@collabora.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: pinctrl: mt7988: allow gpio-hogs
User-Agent: K-9 Mail for Android
Reply-to: frank-w@public-files.de
In-Reply-To: <CACRpkdZ6wJGRhobbTxvm2ZstHA=P4gaUsqvdm3_n1tKqWJ=50Q@mail.gmail.com>
References: <20251105195007.199229-1-linux@fw-web.de> <20251105195007.199229-2-linux@fw-web.de> <CACRpkdZ6wJGRhobbTxvm2ZstHA=P4gaUsqvdm3_n1tKqWJ=50Q@mail.gmail.com>
Message-ID: <19CECEAC-A282-4683-B955-8191AA5ED7A0@public-files.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uzYatEEE5B8hau/Pb+8bUuG8rdmhERgPUp2bgugRnBTKhzRubn9
 4C+TgM1iq3VhDZKyEnPmlFIy6KqLil7yG+w7zodDzVE0vQVH0Dv7ciyRu3NYnc20SHpjjbZ
 /c5tWmjyUgQiix9SsX43pCU5/sccCo8hoYFjZUCzQiM02NyK1ygSP7nsOdBbqMHZ5i07mRO
 MM7HMsymKi7lIgCLvhEXQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:C9YoTb5Spqc=;rAp2YuHG9rU5+mAeQNkMk6mu62P
 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
 DtRSY80IWlvVbof5W1hdwmcgSY=

Am 11=2E November 2025 00:34:44 MEZ schrieb Linus Walleij <linus=2Ewalleij@=
linaro=2Eorg>:
>On Wed, Nov 5, 2025 at 8:50=E2=80=AFPM Frank Wunderlich <linux@fw-web=2Ed=
e> wrote:
>
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>
>> Allow gpio-hogs in pinctrl node for switching pcie on Bananapi R4 Pro=
=2E
>>
>> Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof=2Ekozlowski@linaro=2Eorg>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogiocchino=2Edelregno@col=
labora=2Ecom>
>
>I already applied an earlier version but it seems identical=2E
>Tags were picked up=2E

Thank you

Code/description is not changed,but angelos tag is wrong there (missing a =
in email,above is also wrong)=2E Not sure if it has effects for get_maintai=
ners=2Epl (non-maintainers part)=2E But would be better if you can still fi=
x it=2E

>Yours,
>Linus Walleij


regards Frank

