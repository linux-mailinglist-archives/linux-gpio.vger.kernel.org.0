Return-Path: <linux-gpio+bounces-34425-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ByqHqhFymm/7AUAu9opvQ
	(envelope-from <linux-gpio+bounces-34425-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 11:43:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A4F358618
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 11:43:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4361D309A7A8
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 09:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D22FA3B582B;
	Mon, 30 Mar 2026 09:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CRSi/7ZD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4DB3B3886
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 09:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863369; cv=pass; b=U6BkMfplatDgzTXfIq1KjPISPDhFrXwt/uD7gZBABJ/Sfq6pEIhKGW+Aaygq/p/c49nv0GkDCEb+U7n+Tgjv8uKmjSAkcFxe6X7ljB6saNPVhE3gPLeQj1wQzPFvD9JXgmlElVvjtn0QrfFHUiNtyayCbXRry913YRJryMG++rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863369; c=relaxed/simple;
	bh=ONNvpnHIrrlZOFnwwhyENzcT4/Pw+OdMUWkbXsdiH4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hZU5gPI8cb6t2kGSM55G0X/4EpvHSwgjK8K+NKG6VYfb+9yhxly7doBdG6BJhDRJcgaZzLtUMgqcN7qnOgBoZXyUdfaHPOAktl2RF5roD88WyFcpM189T4RbmGfHagm6R9z4Tgw0SZLzcYOmpWSOlX8ZmYU0iKqvVWDQaj/pxb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CRSi/7ZD; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a2a70bb69eso4401051e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 02:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774863366; cv=none;
        d=google.com; s=arc-20240605;
        b=dqvdnBKBX85fMu19RA3AZ3BJCTYInQarrt7+f9RA0TrUYHw6ujtRsjRBjRZ1v2GE0b
         ccX/DHNtI3LwVqVeMNA2RxXeQDfGPkeE1058gWfyHXzLzJtSZDAML7csYm/A4jxWBn2t
         i3z1u+NcyJJzjjGGbMPmUHdBPJ9VJPN57JSXWasRiVVxJIIj811gDyTQlr9FNFBs3Hak
         su0n6eGsdlTBouXZSEi6Z3vrXYwdQAUp4ogLOyNyeL1eYeG4keRt1hvYP59pvB20KY6a
         JgRhLJskiHzyfIfqkHCgUqKDL/p9bgZr6ER7f+6hnsVNfCNXCJcqvhW2F8vN53xkDMr3
         fjdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ONNvpnHIrrlZOFnwwhyENzcT4/Pw+OdMUWkbXsdiH4Y=;
        fh=pFNk3U7HEEmCad0b7kyFULHOJz0CLaTqq+FTZ2kuYqE=;
        b=gBUmE7kwZ8Xqic04Hc8PB+8YddfBaz9dIPsJ4qY/ZykPvh/kGBK6GzvQKDEFn89z9F
         Kh1dQ0ey68+khVVqAG5RpgjTR5i3SXCOusgyj6G0KjzH11iozKnwUqQvTo5Lxcklyvf4
         XXTn1mwMVDIZJMiijeqOLvWu+5fog11tFvQEVZoeLshhBp4qUqMu/5tHW2m8xYvauHwN
         LyPFzHD8RADSJe7E+siGjav1wf4faNHt1AgMz9rvojZ5A2gC0q0jVarmoCpJjn1AraD0
         P2Z4yu1za3dxnAaqKkmHOYyJtmf0Z3y/qFue3OE9ogkP6T0RdiJZa51kGIDljNimO0/0
         DNcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774863366; x=1775468166; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONNvpnHIrrlZOFnwwhyENzcT4/Pw+OdMUWkbXsdiH4Y=;
        b=CRSi/7ZDuKWXilmc3FY+3Bnk1VRP9QLydDioAxl0zVSANh9b3dNbIkgLYE7FI68ATx
         yQvP0+gZtynI/Q1XoCp3oQqWbcR6MGRFHYdRrIz3J7iFqtFI7xxpTZ61l66YqDHcplnG
         SfBkf0byTHORQQ5Ym3pTSE+56AiX4bTMlrk9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863366; x=1775468166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ONNvpnHIrrlZOFnwwhyENzcT4/Pw+OdMUWkbXsdiH4Y=;
        b=dnr4cuJ6COadMEyYFADiVBBw0Jooy5tDtZ4xy+xffVRpwlMEN0qQHSG6FG/qZK30+H
         sbhKj7xOpMrie0gq1Wh4ZRUrWRV5jF6gGmdqvUe9v0u5fZvnxK3/qaDGqU6JM8Q3A/cP
         uA6JPfR14Wc0cIgScI/o949O+rV6jsPF+MLAL9Y9MDMPrATz2CuTLmmBvqJN7QiE55B5
         l5W9b2302HMcUSxCPOm4/rlPmpiDP3wES94Rqi9QvGUXf0BwWUnum0o14N2aiutq3H3V
         7yVI3s0KYjPhQUkLi0395SHgYtxjUAYXoHLyN+dPlNxY3aJ2+JWtmEFaciZcISUnQCNz
         3ZeA==
X-Forwarded-Encrypted: i=1; AJvYcCVx3ltQNDdoUf1EYe3XPm3wcryeHyYQx2p/8e41uK5zbkHIyflIN1MPw6S3zrmVRlxrqHZKHiv/rqxw@vger.kernel.org
X-Gm-Message-State: AOJu0YzO0zdjS8Lm4TO/fY46E2aCP4r9CKWO+RA9WKdyalwmCgMS5MeA
	xCGkZCjBjo4RgeJl4GowyDHQ/IFbtwYxo+LK/XToNi8nKPQI0Xc+7wSIU03ns/M3fTbnHdDNero
	HHnhRz80jYaKRmZVz3HupvShyqtfoz9Gyfraz4GCB
X-Gm-Gg: ATEYQzwb5rBXLzsWd9Q4O+z7+KKdg8VCsfFsmSW4qa+CQPU2eDUwjJEYPrKq1pctLXY
	jLOdPhQg1jW8o8GBEHxDe9Rbjyvmw5Pc5b3PHlyM7C/khipIv5Pi+9TZdI1fAI/FUnjD4/o+bVr
	R/YQOwXXgfH3/USP7oC6T82kBZyKK105FywXvVZAnSyj4sydgpdFBdiICVgnvkfY87keoFbh8L8
	hcP+6M2Wd/AFxkwKZoNrPdi5ktIKJiIvYwpXqib07MHp1j8KDN/94jWQxYFV/keTXl6sanMovAr
	V0Sjkl9BWGlMtckl7QH4UHYpRX61e3sPxJIx
X-Received: by 2002:a05:6512:3f12:b0:5a2:7aeb:e7b3 with SMTP id
 2adb3069b0e04-5a2ab92ae11mr5011592e87.29.1774863365955; Mon, 30 Mar 2026
 02:36:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317184507.523060-1-l.scorcia@gmail.com> <20260317184507.523060-8-l.scorcia@gmail.com>
 <CAGXv+5GmDtrtFHJXs+fDyF+dZ5YW-TSEqXnPs2xCH8cu-Xcn9w@mail.gmail.com> <CAORyz2J355NZH=7iQ9sTDBhAmtjP7xTpXe21_3Z9J_R5YvdXAQ@mail.gmail.com>
In-Reply-To: <CAORyz2J355NZH=7iQ9sTDBhAmtjP7xTpXe21_3Z9J_R5YvdXAQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 30 Mar 2026 17:35:54 +0800
X-Gm-Features: AQROBzDDuO289B2CM0DmVnpmaCFifXhpUymo-5rQ6aPBkZTqTiIMBWQIo9x2VA8
Message-ID: <CAGXv+5HRWRW=+Mk2z4qCPrF7zFax9zQJ70Q4ihR6PkWJP0OUrg@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] regulator: mt6392: Add support for MT6392 regulator
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Fabien Parent <parent.f@gmail.com>, 
	Val Packett <val@packett.cool>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Gary Bisson <bisson.gary@gmail.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Julien Massot <julien.massot@collabora.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-34425-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_CC(0.00)[lists.infradead.org,gmail.com,packett.cool,kernel.org,mediatek.com,collabora.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: B7A4F358618
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 3:39=E2=80=AFPM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:
>
> Il giorno gio 19 mar 2026 alle ore 06:04 Chen-Yu Tsai
> <wenst@chromium.org> ha scritto:
>
> > If this PMIC is anything like the MT6358, then it has 0.01V fine
> > tuning for most if not all the LDOs. It is sometimes needed as
> > a rail may have a 0.04V boost that would otherwise be invisible
> > to the system. And then if you have something like 3.04V set in
> > the DT constraints, you end up with something the regulator driver
> > doesn't support, but the hardware does.
> >
> > Please see how it's done in the MT6358 driver. I spent a lot of
> > time on that driver to make it actually support the full range
> > of voltages, and describing the supplies.
> >
>
> I had a good look at the datasheet (MT6392 PMIC Datasheet v1.0 08 Dec.
> 2016) and unfortunately I did not see any fine tuning option in there.
> I'm sure this data sheet is not perfect as it's missing some regulator
> registers that are clearly used in the Android sources, but there's no
> mention of fine tuning in that code either. I guess it does not have
> that capability.

Well, thanks for looking. FWIW on the MT6358 / MT6366, the main voltage
control and the fine tuning are mostly in the same register. The fine
tuning is described as "calibrates output voltage" from +00mV to +100mV.

I looked into this because the LDO table shows some of the default voltages
with 0.01V precision, but the main voltage controls only have 0.1V precisio=
n.


ChenYu

> I will shortly submit v4 that hopefully addresses the rest of the comment=
s.
>
> Thanks for your help!
> --
> Luca Leonardo Scorcia
> l.scorcia@gmail.com

