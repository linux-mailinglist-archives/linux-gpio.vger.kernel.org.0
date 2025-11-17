Return-Path: <linux-gpio+bounces-28599-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45680C64CAA
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 16:05:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 6AEBD28F8F
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 15:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BEEA257459;
	Mon, 17 Nov 2025 15:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKRVZYxQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7AF31A55E
	for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 15:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763391931; cv=none; b=QUJs4LEMniNhruA3qeBs2g1yz9fzjJnDsRo45wzeRdOcVKrikZ4ZsG1zHKqEs2BiS7+jDIaYeaf85ItzpqK7yc3nKXo56C3psgVCZp3A1uW99U/FICl0lESmVNjkQXCPK4Tu59hFujuoUKB6IxsilP8lMG132poHANmuT99THmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763391931; c=relaxed/simple;
	bh=6zdwiZcIJTl0BMh1iKgjr5OpfvW+ddcDpuHgtUdJsZg=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n8fyr7V2QAnpzo6Mj1cIWDccxJo13/ftDadz36lktqaQhuTl3J9VeVwpowKk200HuEez30WD8yHDxTbGCtS5UnnWwXEF8XyFJHwEwZzARQzBLpIuJJ8m4wyhRd5rAPTK0zCgHaSfE04M36qrhvQ3lGSeJs5zPInQ+YgZL+vUyXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKRVZYxQ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b38de7940so2535003f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 07:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763391928; x=1763996728; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6zdwiZcIJTl0BMh1iKgjr5OpfvW+ddcDpuHgtUdJsZg=;
        b=BKRVZYxQg6CcKR6+2nMX7ukT2b6G8aMF+JZpsY8qP7P/vlXsvxuW3C2p8OVU7Wlicf
         6LJxylADB2fkaha9WFvlBP3hFNQJyCVrNEGVhweNUdnJVngDHGqqRzMjRsc8tpZfEnMU
         qxMePr9I510qwCxWX7yBeUROC32mfL6xQApqu6SyN7nI6Ul7I6EZWhFLG6eiBcx9m+EE
         UUXlKYO7IaSBV4W+64PtLYnl76XHdnxOAvdSI66Hqvamwg6VT7OPLwsmxnaKe7CBsXmp
         Etweno7SnjaTYfGXaZma6khCqqfMreB+dkNRc1bW+Skdm9zCyy40J5pyIRYyj0I1OyWp
         xA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763391928; x=1763996728;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6zdwiZcIJTl0BMh1iKgjr5OpfvW+ddcDpuHgtUdJsZg=;
        b=NCadxD4/Fp/GteMPqAENI4th4ghGvmpyNGL8K8qpz9ZRZ6RTrjDr+SATVwVoUmEOPG
         hoGHbt3kt6EWB1Az/cn4KYdrPmBdK6KL+b9z3sBeMBUSyKR8hA/PicIkLz9kLXX18F/o
         1XWZC84PN3OoySQ6/+wkY6PeZOryy8ise5YsInsi3iQ0iiAi/Oe9ysvWflghjHJ2LyT6
         esXI8w6Z94BI6WE7C1Srp4jheSn4DuWrVsIdfRH1wpiA0KULLjUVBHd0xT75iOQArl2N
         CzYeXWu8E4d8kxSzkk8jana0M/5KIaox4gNCmnERBrj3u+kns+/3F9ripCjOFtDsDNkH
         vExQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlrhvTsshw9LMkG99zaTVkSAtnAPsXQIKcI9uIoZGkg/A3cb6eLcq0QR/od/XONW2N0S4k/Y6hOAzm@vger.kernel.org
X-Gm-Message-State: AOJu0YyLpxnGIhqGfh5iKapPY5YgU6oAcPZzqCchSI/pdDRGkDyuzNaj
	iYh8woJWzL1an7Z+3IYgNKH7N0d+dcVUmww5chbDHu9Jhr/tt8/4SdM4QlBcJQ==
X-Gm-Gg: ASbGncvdGQNevsAw2bu1M/KltQSuIHSuT25BEHaRh5J6JvjJ7oGFJKwBybLtP7wU7If
	PoMuOnt8pPahUThyoI2EbgTtD2kuxDdbl5rfxGewsT+icvhebDxvaTIjwKOZmS2ZWWW2tbH1kbK
	t+wYMSmYnEUnDgusmXZatEILUuqAtlaSFEn8YLCTtIwFzawlJFl0+Cy0AxhAP4lEZXDzM3DdOSr
	yjfvGWFjOcWnzRGI6LzXzHui8E/oo3D99Pe0+7nd+dufURZZ+peBbVTAMdWP8g+MvpZek+tKqlm
	nuZYP0q6JyaNEXpJcazV0rj8BTvNOrwPJltOEXrdLvQ11w8W+hzMsWBjPKh36sAozrG/xJQIG8m
	QJTou5uuhYn3Vujey4Ybl9IU42AT3IqPEeyLBhZDjO9iFT7mJeIRSBp1vWLI36UfeniK5FcHX1x
	rSPuZxfO7ViujTiN0RsmzoWDZR3eS2kg==
X-Google-Smtp-Source: AGHT+IF+Nv2fjRa+it7pPP3JQTCtKKUra7Ae4MjMo1b9/S+hlGKYkkmE3YuoJeFBe/kGOzoR1OsKkQ==
X-Received: by 2002:a5d:5f42:0:b0:42b:3e19:b650 with SMTP id ffacd0b85a97d-42b59338fefmr12362619f8f.17.1763391927576;
        Mon, 17 Nov 2025 07:05:27 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f203afsm26967807f8f.39.2025.11.17.07.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 07:05:27 -0800 (PST)
Message-ID: <65d4096a193abb7e5c103936606172005af99860.camel@gmail.com>
Subject: Re: [PATCH v3 0/2] Add ADG1712 SPST switch controller support
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij	 <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-gpio@vger.kernel.org
Date: Mon, 17 Nov 2025 15:06:04 +0000
In-Reply-To: <20251117091427.3624-1-antoniu.miclaus@analog.com>
References: <20251117091427.3624-1-antoniu.miclaus@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-11-17 at 09:13 +0000, Antoniu Miclaus wrote:
> This series adds support for the Analog Devices ADG1712 quad single-pole,
> single-throw (SPST) switch controller.
>=20
> The ADG1712 contains four independent analog switches, each controlled by
> a dedicated GPIO input pin. This implementation configures the switches
> once at probe time based on device tree properties.
>=20
> Changes in v3:
> - Moved device tree bindings from gpio/ to switch/ subsystem
> - Completely redesigned driver architecture: removed GPIO controller inte=
rface
> - Added 'switch-states' device tree property for configuring initial swit=
ch states

Hmm but if we are going that direction, I wonder if this should be in drive=
rs/gpio at
all?

We have drivers/mux/gpio.c. While this is a switch (and not a mux) I guess =
it would still
be more appropriate in there and probably works out of the box?

- Nuno S=C3=A1

