Return-Path: <linux-gpio+bounces-23348-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86783B070B9
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 10:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86BC83A5DB9
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 08:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C04E82EE97A;
	Wed, 16 Jul 2025 08:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cpv4liKj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C4D28D8F8
	for <linux-gpio@vger.kernel.org>; Wed, 16 Jul 2025 08:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752655004; cv=none; b=ZSsy3mF117QViQM6F9G3ekAH5Lz0FSR2TPc7G63HwAkVMgAVxgNP0TsmMuwWSqljZGNoIOVBiYjbD38lWhATGsKwhdIb869h6OcHVldpZ8JTCXt6gdIafCd3k6xGZZr6cC3Ihc8TtmtaZUgJcmt/FkbdDKw+s6s8WR6HWDTDTDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752655004; c=relaxed/simple;
	bh=KDXdZbdClBAe3PZE5vT0Rj5ByrbLwz4biON0c3AJSi0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZZh0+ywBnlbavovsRj2JmC7izHh1l6XTj2jKeU7UzJ9Ep2dt/BWVnC2UnYvgQto6ItUjF1JPcycjnu6um4swuUjjqIPy/Wo1N/jymv5eEhglHbYuw3yIPatq9FY9tpem/iIDXNKpobdPm/2GTBAXkUQx0CZUx6kpF7Xu6QcrV0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cpv4liKj; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55628eaec6cso5331725e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jul 2025 01:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752655001; x=1753259801; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KDXdZbdClBAe3PZE5vT0Rj5ByrbLwz4biON0c3AJSi0=;
        b=Cpv4liKjgNmOTiBXLQl6sO21RHZ+qkH7FMO8mvPPzD+AdS2UPHw2RCvGFWHTqb/ZjG
         FCkw6hqTi9MvmpZGuDmSBzt/SC2711yjwEdQIa+Fq0Ras1F0ESnrOeHqG/VwlPDLH3OH
         kJ/yZuuftc0kJsy5+FRAGadd+Ag9QPCTZs1GuW+7FsNHHbG7vccne/q5pV6/z2vO5Y9n
         cW7k7utrokwmNmaPkajXtI6iJRhmHEbJOxeR1axsNOiOTcwsAS/057YD+erGJX83yXk1
         PEdOdGfLGMoEocY00vNz9tNrrjkJQ41vUGY3TvNVxwme9AqXBd13XmLnWYSTuFUyStAR
         7Y5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752655001; x=1753259801;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KDXdZbdClBAe3PZE5vT0Rj5ByrbLwz4biON0c3AJSi0=;
        b=EeyzT3USx8hV7/g+PJx82LFn1bF/NNhaeiwvwY/6kLlYeDFl/yHJbpsa7JQ43qmOyn
         hf2FLEmEmLXEndXNMyio5jNVvxmHCWTlb+NdG/JyWShlgOs13NOpfJ3iIhXIHAWuXOHi
         2BWIbGPuagPua7iAhzHL/rSvpELmF1QxS6hp6GuWGVlI79I4PLWLiElK+R4JJts3hCeg
         YcnHz3tRatSaelCMUXGYNSwzNUOr41uloQ+yjdmTXB34r5BCpNt4Jc4aApFlHztjvlWW
         VSKIRrCvdJ92fA6VzEbsnOKP+IqthVkHpUc0Spnj+orHL9cmWcrTH/UvI3hiYTawleJ0
         nPVw==
X-Gm-Message-State: AOJu0YzF0Rf13C+U5nthubjfpZte/KHpKFWynFoMY0NeTOfUPrFNDM2B
	DuAr1lH71scWuIGwZblRw+r9Txpz4catXiZFFM8HSY0zlQ+E6NRsSh5MucmGwJ+XMAU=
X-Gm-Gg: ASbGnctahYb4E+OOsyzwjECGM0GrR0qhHgPefGw+brHbPQrtpwV7KjAkypKPpfhe473
	9FA9HvdkN+bNedHY5uBhCctgAbgSejb5X/j3M14dFGs1MIcFA6h5tjIoYJoBNkuO6qY5XHIrzyV
	fnTXUuJVSCiFn5q/6w319uoWW87orsSrp0H/ORCN6LcFh4I5wQExabdWspmq998D+7KJMkzhdhc
	aKvPY1Hw6yZRbKi/Wrv1fgaRMA8FCyH/wqHx72/M7Wjnf5EGFH8xFxAnurOd+b9zVVMnCp36419
	T24BeXdFFENC2fCs+BY4KYska1FwuLgdWkxcgNibQfO28Rb4LvXLDJIZ44Fbh5DQy1qWbPPoX4W
	x2eAh/83wMPiXqR4ZNgo=
X-Google-Smtp-Source: AGHT+IHt3V9Jc2jUGAn9Q9W10zDE2zTL6A3cL3CN0sTLaiWbZum9RXbwxhYaPeF8Eg5shBax988QWA==
X-Received: by 2002:ac2:4e8f:0:b0:553:33b3:b944 with SMTP id 2adb3069b0e04-55a233f4646mr542691e87.54.1752655000350;
        Wed, 16 Jul 2025 01:36:40 -0700 (PDT)
Received: from [10.5.0.2] ([193.42.99.9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b79c30sm2570195e87.226.2025.07.16.01.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 01:36:40 -0700 (PDT)
Message-ID: <c85604d9e077511b8aa6ee0786579594cc0103d4.camel@gmail.com>
Subject: Re: [bug report] mfd: adp5585: Support reset and unlock events
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Nuno =?ISO-8859-1?Q?S=E1?=
	 <nuno.sa@analog.com>
Cc: linux-gpio@vger.kernel.org
Date: Wed, 16 Jul 2025 09:36:53 +0100
In-Reply-To: <1ab7d052-29ec-4d6a-b0d4-c36d99e95dd6@sabinyo.mountain>
References: <1ab7d052-29ec-4d6a-b0d4-c36d99e95dd6@sabinyo.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

T24gVHVlLCAyMDI1LTA3LTE1IGF0IDE4OjAwIC0wNTAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOgo+
IEhlbGxvIE51bm8gU8OhLAo+IAo+IENvbW1pdCAzMzM4MTJkYTcwZDUgKCJtZmQ6IGFkcDU1ODU6
IFN1cHBvcnQgcmVzZXQgYW5kIHVubG9jayBldmVudHMiKQo+IGZyb20gSnVsIDEsIDIwMjUgKGxp
bnV4LW5leHQpLCBsZWFkcyB0byB0aGUgZm9sbG93aW5nIFNtYXRjaCBzdGF0aWMKPiBjaGVja2Vy
IHdhcm5pbmc6Cj4gCj4gCWRyaXZlcnMvbWZkL2FkcDU1ODUuYzo0MzUgYWRwNTU4NV9yZXNldF9l
dl9wYXJzZSgpCj4gCWluZm86IHJldHVybiBhIGxpdGVyYWwgaW5zdGVhZCBvZiAncmV0Jwo+IAo+
IGRyaXZlcnMvbWZkL2FkcDU1ODUuYwo+IMKgwqDCoCAzODHCoMKgwqDCoMKgwqDCoMKgIHJldCA9
IGRldmljZV9wcm9wZXJ0eV9yZWFkX3UzMihkZXYsICJhZGkscmVzZXQtdHJpZ2dlci1tcyIsCj4g
JnByb3BfdmFsKTsKPiDCoMKgwqAgMzgywqDCoMKgwqDCoMKgwqDCoCBpZiAoIXJldCkgewo+IMKg
wqDCoCAzODPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzd2l0Y2ggKHByb3BfdmFs
KSB7Cj4gwqDCoMKgIDM4NMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNhc2UgMDoK
PiDCoMKgwqAgMzg1wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGFkcDU1ODUtPnJlc2V0X2NmZyB8PQo+IEZJRUxEX1BSRVAoQURQNTU4NV9SRVNFVF9UUklH
X1RJTUUsIDApOwo+IMKgwqDCoCAzODbCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4gwqDCoMKgIDM4N8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGNhc2UgMTAwMDoKPiDCoMKgwqAgMzg4wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFkcDU1ODUtPnJlc2V0X2NmZyB8PQo+IEZJRUxEX1BS
RVAoQURQNTU4NV9SRVNFVF9UUklHX1RJTUUsIDEpOwo+IMKgwqDCoCAzODnCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4gwqDCoMKgIDM5MMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNhc2UgMTUwMDoKPiDCoMKgwqAgMzkxwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFkcDU1ODUtPnJl
c2V0X2NmZyB8PQo+IEZJRUxEX1BSRVAoQURQNTU4NV9SRVNFVF9UUklHX1RJTUUsIDIpOwo+IMKg
wqDCoCAzOTLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
YnJlYWs7Cj4gwqDCoMKgIDM5M8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNhc2Ug
MjAwMDoKPiDCoMKgwqAgMzk0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGFkcDU1ODUtPnJlc2V0X2NmZyB8PQo+IEZJRUxEX1BSRVAoQURQNTU4NV9SRVNF
VF9UUklHX1RJTUUsIDMpOwo+IMKgwqDCoCAzOTXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4gwqDCoMKgIDM5NsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGNhc2UgMjUwMDoKPiDCoMKgwqAgMzk3wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFkcDU1ODUtPnJlc2V0X2NmZyB8PQo+IEZJ
RUxEX1BSRVAoQURQNTU4NV9SRVNFVF9UUklHX1RJTUUsIDQpOwo+IMKgwqDCoCAzOTjCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4gwqDCoMKg
IDM5OcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNhc2UgMzAwMDoKPiDCoMKgwqAg
NDAwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFkcDU1
ODUtPnJlc2V0X2NmZyB8PQo+IEZJRUxEX1BSRVAoQURQNTU4NV9SRVNFVF9UUklHX1RJTUUsIDUp
Owo+IMKgwqDCoCA0MDHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgYnJlYWs7Cj4gwqDCoMKgIDQwMsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGNhc2UgMzUwMDoKPiDCoMKgwqAgNDAzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGFkcDU1ODUtPnJlc2V0X2NmZyB8PQo+IEZJRUxEX1BSRVAoQURQNTU4
NV9SRVNFVF9UUklHX1RJTUUsIDYpOwo+IMKgwqDCoCA0MDTCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4gwqDCoMKgIDQwNcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNhc2UgNDAwMDoKPiDCoMKgwqAgNDA2wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFkcDU1ODUtPnJlc2V0X2NmZyB8
PQo+IEZJRUxEX1BSRVAoQURQNTU4NV9SRVNFVF9UUklHX1RJTUUsIDcpOwo+IMKgwqDCoCA0MDfC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4g
wqDCoMKgIDQwOMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRlZmF1bHQ6Cj4gwqDC
oMKgIDQwOcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIC1FSU5WQUwsCj4gwqDCoMKgIDQxMMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiSW52YWxpZCB2YWx1ZSgldSkgZm9yCj4gYWRpLHJlc2V0
LXRyaWdnZXItbXNcbiIsCj4gwqDCoMKgIDQxMcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBwcm9wX3ZhbCk7Cj4gwqDCoMKgIDQxMsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIH0KPiDCoMKgwqAgNDEzwqDCoMKgwqDCoMKgwqDCoCB9Cj4gwqDCoMKgIDQxNCAKPiDCoMKg
wqAgNDE1wqDCoMKgwqDCoMKgwqDCoCByZXQgPSBkZXZpY2VfcHJvcGVydHlfcmVhZF91MzIoZGV2
LCAiYWRpLHJlc2V0LXB1bHNlLXdpZHRoLQo+IHVzIiwgJnByb3BfdmFsKTsKPiDCoMKgwqAgNDE2
wqDCoMKgwqDCoMKgwqDCoCBpZiAoIXJldCkgewo+IAo+IFNob3VsZCB0aGlzIGJlIGlmIChyZXQp
IHJldHVybiByZXQ7Pwo+IAo+IMKgwqDCoCA0MTfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzd2l0Y2ggKHByb3BfdmFsKSB7Cj4gwqDCoMKgIDQxOMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGNhc2UgNTAwOgo+IMKgwqDCoCA0MTnCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYWRwNTU4NS0+cmVzZXRfY2ZnIHw9Cj4gRklFTERf
UFJFUChBRFA1NTg1X1BVTFNFX1dJRFRILCAwKTsKPiDCoMKgwqAgNDIwwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+IMKgwqDCoCA0MjHCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjYXNlIDEwMDA6Cj4gwqDCoMKgIDQyMsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhZHA1NTg1LT5yZXNl
dF9jZmcgfD0KPiBGSUVMRF9QUkVQKEFEUDU1ODVfUFVMU0VfV0lEVEgsIDEpOwo+IMKgwqDCoCA0
MjPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7
Cj4gwqDCoMKgIDQyNMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNhc2UgMjAwMDoK
PiDCoMKgwqAgNDI1wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGFkcDU1ODUtPnJlc2V0X2NmZyB8PQo+IEZJRUxEX1BSRVAoQURQNTU4NV9QVUxTRV9XSURU
SCwgMik7Cj4gwqDCoMKgIDQyNsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBicmVhazsKPiDCoMKgwqAgNDI3wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgY2FzZSAxMDAwMDoKPiDCoMKgwqAgNDI4wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFkcDU1ODUtPnJlc2V0X2NmZyB8PQo+IEZJRUxEX1BSRVAo
QURQNTU4NV9QVUxTRV9XSURUSCwgMyk7Cj4gwqDCoMKgIDQyOcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPiDCoMKgwqAgNDMwwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVmYXVsdDoKPiDCoMKgwqAgNDMxwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBkZXZfZXJyX3Byb2Jl
KGRldiwgLUVJTlZBTCwKPiDCoMKgwqAgNDMywqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICJJbnZhbGlkIHZhbHVlKCV1KSBmb3IKPiBhZGkscmVzZXQtcHVsc2Utd2lkdGgtdXNcbiIs
Cj4gwqDCoMKgIDQzM8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcm9wX3ZhbCk7
Cj4gwqDCoMKgIDQzNMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPiAtLT4gNDM1
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPiAKPiBXZSBjb3Vs
ZCBkZWxldGUgdGhpcyByZXR1cm4gc3RhdGVtZW50LgoKU3VyZS4uLiBJJ2xsIHNlbmQgYSBmb2xs
b3cgdXAuCgotIE51bm8gU8OhCgo+IAo+IMKgwqDCoCA0MzbCoMKgwqDCoMKgwqDCoMKgIH0KPiDC
oMKgwqAgNDM3IAo+IMKgwqDCoCA0MzjCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+IMKgwqDC
oCA0MzkgfQo+IAo+IHJlZ2FyZHMsCj4gZGFuIGNhcnBlbnRlcgo=


